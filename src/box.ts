export type FabricId = string;
export type IsoTime = string;

export type TimeBoundary = {
  createdAt: IsoTime;
  observedAt: IsoTime;
  validFrom: IsoTime;
  expiresAt?: IsoTime;
};

export type PolicyRef = {
  id: FabricId;
  version: string;
};

export type AgreementRef = {
  id: FabricId;
  validFrom: IsoTime;
  expiresAt?: IsoTime;
};

export type StateRecord<T = unknown> = {
  id: FabricId;
  value: T;
  version: string;
  recordedAt: IsoTime;
  provenance: FabricId[];
};

export type Box<T = unknown> = {
  id: FabricId;
  index: FabricId;
  homeAddress: string;
  time: TimeBoundary;
  policy: PolicyRef;
  agreement: AgreementRef;
  state: StateRecord<T>;
  locked: true;
  zeroTouch: true;
};

export type ConformanceResult = {
  ok: boolean;
  errors: string[];
};

function hasText(value: unknown): value is string {
  return typeof value === "string" && value.trim().length > 0;
}

function isIsoLike(value: unknown): value is string {
  return hasText(value) && !Number.isNaN(Date.parse(value));
}

export function validateBox(box: unknown): ConformanceResult {
  const errors: string[] = [];

  if (typeof box !== "object" || box === null) {
    return { ok: false, errors: ["box must be an object."] };
  }

  const candidate = box as Partial<Box>;

  if (!hasText(candidate.id)) errors.push("box.id is required.");
  if (!hasText(candidate.index)) errors.push("box.index is required.");
  if (!hasText(candidate.homeAddress)) errors.push("box.homeAddress is required.");
  if (candidate.locked !== true) errors.push("box.locked must be true.");
  if (candidate.zeroTouch !== true) errors.push("box.zeroTouch must be true.");

  if (!candidate.time) {
    errors.push("box.time is required.");
  } else {
    if (!isIsoLike(candidate.time.createdAt)) errors.push("box.time.createdAt must be ISO time.");
    if (!isIsoLike(candidate.time.observedAt)) errors.push("box.time.observedAt must be ISO time.");
    if (!isIsoLike(candidate.time.validFrom)) errors.push("box.time.validFrom must be ISO time.");
    if (candidate.time.expiresAt !== undefined && !isIsoLike(candidate.time.expiresAt)) {
      errors.push("box.time.expiresAt must be ISO time when present.");
    }
  }

  if (!candidate.policy?.id || !candidate.policy?.version) {
    errors.push("box.policy id and version are required.");
  }

  if (!candidate.agreement?.id || !isIsoLike(candidate.agreement.validFrom)) {
    errors.push("box.agreement id and validFrom are required.");
  }

  if (!candidate.state) {
    errors.push("box.state is required.");
  } else {
    if (!hasText(candidate.state.id)) errors.push("box.state.id is required.");
    if (!hasText(candidate.state.version)) errors.push("box.state.version is required.");
    if (!isIsoLike(candidate.state.recordedAt)) errors.push("box.state.recordedAt must be ISO time.");
    if (!Array.isArray(candidate.state.provenance)) errors.push("box.state.provenance must be an array.");
  }

  return { ok: errors.length === 0, errors };
}

export function assertBox<T = unknown>(box: unknown): asserts box is Box<T> {
  const result = validateBox(box);
  if (!result.ok) {
    throw new Error(result.errors.join(" "));
  }
}
