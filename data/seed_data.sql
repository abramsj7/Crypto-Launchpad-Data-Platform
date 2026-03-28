-- =========================
-- Seed Data for Crypto Launchpad Platform
-- =========================

-- Platforms
INSERT INTO platform (PlatformID, Name, Type, slug) VALUES
(9001, 'Binance Launchpad', 'Launchpad', 'binance'),
(9002, 'DAO Maker', 'Launchpad', 'daomaker'),
(9003, 'Seedify.fund', 'Launchpad', 'seedify');

-- Projects
INSERT INTO project (ProjectID, Name, Chain, Category, website, sector) VALUES
(9101, 'AltLayer', 'Ethereum', 'Infrastructure', 'https://altlayer.io', 'AI'),
(9102, 'SuiPad', 'Ethereum', 'Infrastructure', 'https://suipad.xyz', 'Launchpad'),
(9103, 'LaunchX', 'Ethereum', 'Infrastructure', 'https://launchx.io', 'Launchpad');

-- Tokens
INSERT INTO token (TokenID, ProjectID, Name, Symbol, MaxSupply, chain, category, launch_price, current_price, ath_price, coingecko_id) VALUES
(9201, 9101, 'AltLayer', 'ALT', 10000000000, 'Ethereum', 'AI', 0.01500000, NULL, NULL, 'altlayer'),
(9202, 9102, 'SuiPad', 'SUIP', 1000000000, 'Ethereum', 'Launchpad', 0.03000000, NULL, NULL, 'suipad'),
(9203, 9103, 'LaunchX', 'LNCHX', 1000000000, 'Ethereum', 'Launchpad', 0.05000000, NULL, NULL, 'launchx');

-- Launch Events
INSERT INTO launch_event (LaunchEventID, TokenID, PlatformID, Date, AmountRaised, tge_date, raise_amount_usd, initial_mc_usd, vesting, tge_price_usd, roi_3m_x) VALUES
(9301, 9201, 9001, NULL, NULL, '2024-01-25', 3000000.00, 9000000.00, '20% TGE, 12m linear', 0.01500000, NULL),
(9302, 9202, 9002, NULL, NULL, '2024-05-28', 500000.00, 20000000.00, '10% TGE, linear 24 months', 0.03000000, NULL),
(9303, 9203, 9002, NULL, NULL, '2024-06-15', 1200000.00, 15000000.00, '15% TGE, 12m linear', 0.05000000, NULL);

-- Investors
INSERT INTO investor (InvestorID, Name, Type, investor_type, website) VALUES
(9401, 'Marshland Capital', 'VC', 'VC', NULL),
(9402, 'Magnus Capital', 'VC', 'VC', NULL),
(9403, 'Valaran Capital', 'VC', 'VC', NULL);

-- Relationships (Investors backing projects)
INSERT INTO associated_with (ProjectID, InvestorID) VALUES
(9103, 9401),
(9103, 9402),
(9103, 9403);
