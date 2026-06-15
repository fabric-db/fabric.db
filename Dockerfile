FROM surrealdb/surrealdb:latest

LABEL org.opencontainers.image.title="fabric.db"
LABEL org.opencontainers.image.description="Governed state fabric for agentic systems"
LABEL org.opencontainers.image.source="https://github.com/fabric-db/fabric.db"
LABEL org.opencontainers.image.licenses="Apache-2.0"

COPY surrealdb /fabric-db/surrealdb
COPY schema /fabric-db/schema

EXPOSE 8000

CMD ["start", "--log", "info", "--user", "root", "--pass", "root", "file:/data/fabric.db"]
