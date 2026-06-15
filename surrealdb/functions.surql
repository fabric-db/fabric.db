-- fabric.db helper functions

DEFINE FUNCTION fn::now() {
  RETURN time::now();
};

DEFINE FUNCTION fn::event_type($entity: string, $action: string) {
  RETURN string::concat($entity, ".", $action);
};

DEFINE FUNCTION fn::risk_weight($risk: string) {
  RETURN IF $risk = "critical" THEN 100
    ELSE IF $risk = "high" THEN 75
    ELSE IF $risk = "medium" THEN 50
    ELSE IF $risk = "low" THEN 25
    ELSE 0
  END;
};
