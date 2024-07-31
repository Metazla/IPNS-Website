import dotenv from 'dotenv';
dotenv.config();

interface EnvConfig {
    /** (optional) Domain name for SSL certificate*/
    DOMAIN_NAME: string;

    /** (optional) Email for SSL certificate */
    EMAIL: string;

    /** (optional) Subdomains list for SSL certificate (coma separated) */
    SUBDOMAINS: string;

    /** (optional) IPFS node host */
    HOST: string;

    /** (optional) Domain name ipfs announce WS support*/
    IPFS_ANNOUNCE_DOMAIN_NAME: string;

    /** (optional) IPFS node host port */
    IPFS_PORT: string;

    TARGET_FOLDER: string;

    /** IPNS name to be hosted should contain a folder with an index.html website*/
    IPNS: string;

    /** Bootstrap nodes coma separated */
    BOOTSTRAP: string;
}

export const config: EnvConfig = {
    TARGET_FOLDER: process.env.TARGET_FOLDER,
    IPNS: process.env.IPNS!,
    BOOTSTRAP: process.env.BOOTSTRAP!,
    IPFS_PORT: process.env.IPFS_PORT || "4001",
    HOST: process.env.HOST,
    DOMAIN_NAME: process.env.DOMAIN_NAME,
    EMAIL: process.env.EMAIL,
    SUBDOMAINS: process.env.SUBDOMAINS,
    IPFS_ANNOUNCE_DOMAIN_NAME: process.env.IPFS_ANNOUNCE_DOMAIN_NAME
};
