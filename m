Return-Path: <linux-renesas-soc+bounces-8339-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45517960604
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 11:43:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1C31282185
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 09:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6404F19EEBF;
	Tue, 27 Aug 2024 09:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="g7ZJDE/9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2071.outbound.protection.outlook.com [40.107.117.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A9119D89E;
	Tue, 27 Aug 2024 09:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724751755; cv=fail; b=h27dpuBPxS/RSCbty5EF56XIHxMKEg/IdaiLCDlJ/U3rhcIppvRUXe2enNJL+JdzaZnd169AW+JU5HI99qY9ZNxprwzMqVuPgxFFi0XpUOZg10VMUGKVYvDVr6QPNN+evMBK9weKHLGZ1FEzYxYIzwhbak3oW2izfqJaQ8h3S/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724751755; c=relaxed/simple;
	bh=N/tUcxjy1xJBFZ5NzpV/baThbpne8L5gs9MZqUQ50go=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HULK5SwXsM2qXlOvAfK4/GdQRSQEUWWCqPulChgyi04To/Vz7oykCLV8KlnK2VAd9Yk49aWbF42GpFIHaWbX41xGIh5xRh6EkvFiL+U1Ew43egVGMtm/6agVyqZePxcEgzQd9rtuG+QS4TFXVAN0vJBys/uTdMIA7meybH8yp1w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=g7ZJDE/9; arc=fail smtp.client-ip=40.107.117.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f+oeliw8+G9yywAze9XcLIdcxfBOp0OsRp8ITmvDrRx+RJf1+xOU0lIOq1pRwLXRGTcVo6IL73lw80js7M3TAQZ/uaRljYKeSO7JRE1h8j8Y6iRRCLgH6O+a0EsO2F9myIURo6MkF2/800jqdpMuiLZfOTLC0ZesV4yHVZiYI+Oc3JC//INjWcUREgnRGRxfdHXceVjlw78BzQvXaCf/0UI37ybofdjPgtP4QO9qe/UcHzFupNZrz87o3Ky7JaUV3UYPIR1/QgM6zP+2e3gJh+tum9A+lHBBq/+AndacEiTaIXFJUELRBZ/66hjWYz5hE3dXFW96H4nL+WCcKBfN/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0wKdpf+etVGbdks0u7PTUFK7xQGU2Gc9tVtz4VzV9uM=;
 b=O622IQkWOaa5m2geVDW9EfDkth1lb8iPrduA3Oef1BVSUDRrvnR/QRkjPmPRdvuecVFmXvBrhOVkNLYCnFnAzbDWWJrufxumthYP6F9Qt3231Ni9DLK2tdvasLN+09yRkO3h7N//jViwD+eMgC7cx5bhmpKRQX2tX5bFAJE+1DrFehf/8cISftG9wDOfPt3M/7GZCSuPsIOlaiteC3v6xB67cOpqoER/UgMmRB3tyrt3zcw45qnIWumtHhdc7+aPkeoR7TDccdZcELg2SEDOqjp2LIendWotiIbeWT5TDs2tu/LYDM2sCplvcwmDSXdzTVsmdElIjSghKwRJSXQh7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0wKdpf+etVGbdks0u7PTUFK7xQGU2Gc9tVtz4VzV9uM=;
 b=g7ZJDE/9EKlh4xggzQy+tsrlwTrhiJastyj5TLM+cefMdeXtOXZHxMZhLju2mIVla3Wg3dyVfmQtE1Q+BjZtQnPCpd5DDMKlQ80hLgngkxaXSs7pt4XodSk2eZoROqsJyqgWqqQ6iKhz/aG4JB+rAfPM9qDkcJYVr/ANf75bUYWIPPuiD5cgQpOfdLkREMoj1EzDdqFhvx9edOe2pBP26TeFQ06HpZlPNoYORHJKWbiYKwN6RgoTgymRIOylK/8znerP7GhZqY/qCWqW5GGd6cIiJn3MUPTDw77g7IQQCO9OFRnS6bX/ljpRg3EY0rWz0yS6U7Y7TE/EEF9oOq/twA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYZPR06MB5734.apcprd06.prod.outlook.com (2603:1096:400:281::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Tue, 27 Aug
 2024 09:42:30 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::8c74:6703:81f7:9535]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::8c74:6703:81f7:9535%7]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 09:42:30 +0000
From: Yangtao Li <frank.li@vivo.com>
To: clement.leger@bootlin.com,
	andrew@lunn.ch,
	f.fainelli@gmail.com,
	olteanv@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	ulli.kroll@googlemail.com,
	linus.walleij@linaro.org,
	marcin.s.wojtas@gmail.com,
	linux@armlinux.org.uk,
	alexandre.torgue@foss.st.com,
	joabreu@synopsys.com,
	mcoquelin.stm32@gmail.com,
	hkallweit1@gmail.com,
	u.kleine-koenig@pengutronix.de,
	jacob.e.keller@intel.com,
	justinstitt@google.com,
	sd@queasysnail.net,
	horms@kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Yangtao Li <frank.li@vivo.com>
Subject: [net-next v3 4/9] net: mdio: hisi-femac: Convert to devm_clk_get_enabled()
Date: Tue, 27 Aug 2024 03:57:07 -0600
Message-Id: <20240827095712.2672820-5-frank.li@vivo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240827095712.2672820-1-frank.li@vivo.com>
References: <20240827095712.2672820-1-frank.li@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0053.apcprd02.prod.outlook.com
 (2603:1096:4:196::16) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TYZPR06MB5734:EE_
X-MS-Office365-Filtering-Correlation-Id: ca0568ab-969f-4fc8-c8b6-08dcc67c9178
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wzRWpStLmM//68hSCDOZKPmsrInvem8e6hIAK7wAn0SmHnvQt1tMTr+2ouw7?=
 =?us-ascii?Q?w0pf9zapxbessT8mXG9WYXJDZR7NJKr/epHUuYpt+Xie5PrHxlxdJamRCc5a?=
 =?us-ascii?Q?/+iS/tvSNd5UlpUEgux+RBycn02es0sEKGSltYzPNWoEmHQw7pgvK/l8OvRI?=
 =?us-ascii?Q?EQQty4NgfIYFx71Kp7K2/aXBJ40rUUC8pL7pBqXY56njx3amoi6Fh6cUN3xC?=
 =?us-ascii?Q?oO749cVBVv8Qsgbx8zupGP6fLTbBw09yTUe8JhjGxUdHC4Re1Fq76RC0mj5L?=
 =?us-ascii?Q?nlKxjOe5koHY/NkPTS+BM/Fdj4yUnlk+NecEhacH3jM3vFWVx9m0b6bxdY91?=
 =?us-ascii?Q?DoiEdbkw+l2lEwlqxZ+tapvsuSCnr7tX3Bbj52RzL/VeTF1jq2GFXtJ1Qo8L?=
 =?us-ascii?Q?BEAPhwF9DiaX9Omq7WjZ8+OSVllqHYps1ufkWiPF1rcF4ubGN55IP9WbMMIx?=
 =?us-ascii?Q?BUhMUX42hmAk2zxpyMbg7zn3fpiqHOv5P7PNQ0VstW8be5mksX0qy5vb2OLJ?=
 =?us-ascii?Q?YFq/YRyHnh3yp7M5HfpzpHXq2d9DkwOP0kyl9RyM51h6D/68yhLQzc8E+6M8?=
 =?us-ascii?Q?E9ys5v65WxaaNE+C+727+2Eloinwvo4IO0tNYkYTjSFNIss8Gkfsu8/eX8Dj?=
 =?us-ascii?Q?eXvoJ8tH1QakcqzE5HFJBrfQ18OqHBKcC8Iyau+Ger3DX0Ae1RPZMXx7wvSO?=
 =?us-ascii?Q?cgCaNSXoXe9y0awd/oZ5m5pBxqfunGJ9Hk1+AAtQ2UUeco8Klwq8OFCVb8Vq?=
 =?us-ascii?Q?iE6C1AympTIlQOi0Es7s4YQ9SDkuP4Ehi3wYob5abRgJNHwVhYNvMLbhBixX?=
 =?us-ascii?Q?7ca/Na1uoyn5Y2H4xPTx5LNcgB7HCHCK+pp6RVzSt7dC2O/Y9OPUL776Qv3P?=
 =?us-ascii?Q?tMh6wAZZuAy7Zw83AkJTws3045fVKAPhSEAyWqltqZwJAUNPtK9x1dXxVKh7?=
 =?us-ascii?Q?4dBbVELYPtK2UETiEdw2osrH1YxQ36ttkRGt47M7E0vE1sDga+iChEmEXTsU?=
 =?us-ascii?Q?9sYCbfMaMV0GLacoBJl6qqNnGhLS2Rarjgy+DVEDUhFNylIUbWzz8oIPpme6?=
 =?us-ascii?Q?pKer3O9f+nR2FNytbSqEYWa3veMl3ITDVALqaJvSaqe+AStqrk9dQe0GuPfd?=
 =?us-ascii?Q?VKoWgb2WzOtycRip2jwkfErelHgX86LKcJk3jHQQhhZdxRHFuI9NkSQX9M4o?=
 =?us-ascii?Q?ZZfTJTW3WRZIZni4dYngqbd6eqvL/JW9s6u1VfuHRfqJ9HUp/luNRSgBwQhf?=
 =?us-ascii?Q?pErvr3agZSlkyKjswy5IZ/K6IyoujTD8pVNgj249AEG/bupCod3YGGjOD+9o?=
 =?us-ascii?Q?daC5OSErztgFdfiY+xIvxPWm2ZL+6RecqvCx6N5SSA1U1ZJM8CgE9Uz7jCOT?=
 =?us-ascii?Q?teUukK9qrAEdsBvAp4+n9N5xoS04NJlY4NpMjfTrqNh0pyd3ulfY3vdOSjii?=
 =?us-ascii?Q?MhZpJLtuNnI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(7416014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RV7vC6H6p305EUqC0c4ZENuoq1oAmZxrWeGtX2C7aljn3rgpzLt3ouRC2X59?=
 =?us-ascii?Q?VeIi1dvmU6UZWOjQGL2cz2ZZWgAtsWtQx9uF2WEjlBy+/AQ+K4UANFsXC1t1?=
 =?us-ascii?Q?IXp5rJxQiU09bK1tEh5O95jbf0x+X/hBV+bqa0o+Fh9uzwJlRQNHn1HZX9xl?=
 =?us-ascii?Q?qj73qBPobJmf4k4bmbOSB6Yx5xQ8IB8lkoAtlIRlkzFvXvV1YunCEDJA7fZM?=
 =?us-ascii?Q?jCCC9CcF5JP4Vom39pkbQfgxQjUWt5U+6FdvPon0wclheIvycxc9zCu9m49n?=
 =?us-ascii?Q?80cVpLtwk2sm5Z9Cgge7MqwmDgA+eiLgW+YnJFUn6Bssv8gACEkxpMLHbjYA?=
 =?us-ascii?Q?9mzfuSQKnYYMgmoIKoRXrD5sVFW5VyENNcfdkBXk/eazJf0/CWgKhoNDMQ4Y?=
 =?us-ascii?Q?pfzXZuklIOm0Y7J6xXMhoScMM5O5dGc4df89xtA9urY4usNGkILufQh4FbnI?=
 =?us-ascii?Q?3ju18OnzfSOKfA3sur/wn6knmZYaFItX4rTMUN+uyz8JbPUv9zcZXDCGr5Td?=
 =?us-ascii?Q?+ZzFtzFhJXmuJVFNZyj9ro6ZWPiDmoFpm+3NCfzRko+ltTN+KNrxTZvzl7xX?=
 =?us-ascii?Q?WKqzo/pLPxB6foEU1ZiEutOJNFXl+ZbnmUH+1XmeEw/e6rrMoSX2LTB/Ck6y?=
 =?us-ascii?Q?2EETmeUI4MffhqG+HQBCO8ALb1qNETF9mi2ye1kDfdwcJ1JJqf9MKGFzESuf?=
 =?us-ascii?Q?B1mpd6hYkXntqsCBlJfUtwGR6UPDKlCG17HEzUPNr1/mQ5SSsRjVBqSTdmDx?=
 =?us-ascii?Q?B4x/tM8JjFlBoaHSXXXwXoCUdsg0cGZaq1AvcQcSdZuZy6+A4OjsymxFqXkw?=
 =?us-ascii?Q?X8skl4ZjVItYbWQOAhcz8X1f2LkF8XtZCA5oYSD/aVHTHcJWKpDxT61o3Uvl?=
 =?us-ascii?Q?GQUuZb371xTCan34UFEY3LBSwxSvdLQRhqMHDBToU6WQxrtaBOHOVXErIF2s?=
 =?us-ascii?Q?dI215IdH4OZ1BBlY9tGgrSQ8BkB59zBqi95/hbaVHW0qQXNX/CJQUQwCRpub?=
 =?us-ascii?Q?M5VNeZ0jhM8MARgq1EVeKkFT6yEMBw+r9hR/mAiQD4DP+LgU5Q4wW0EVkNNp?=
 =?us-ascii?Q?d8AQorsaXSxFBB3n3GTRa7iwxnxC8tRuj9TUGFYCxF1bEPnqklDFDrqfew1E?=
 =?us-ascii?Q?Y0U4arxwY8o5otYTGCqTy/fGf4lSfb8o9h72yAfO+AUIE8SFIxc3C58oBA8R?=
 =?us-ascii?Q?yRENAawzZj+GsiQc4PjEmMNslYtYsuunhAtkCIWvtHTMZuELnarjr6yUrBjr?=
 =?us-ascii?Q?YjqJnMBXHVviPFg6AZH9hVIxmoapKWfu86LlUqwV4pfaG36Qhph0VKbUMxd/?=
 =?us-ascii?Q?riDyk/xvQbvGTQyEeoW4Aq44y6LbBFjNcCyTdX3Nqj6BuUisvmBGe15wxCrL?=
 =?us-ascii?Q?nRypT4YTYzEfpXhM2Q0oqqFxlvxDNWxzwPR1mVvFzaeuhfKLXpK/PONT6aH0?=
 =?us-ascii?Q?6iCedhL57w5VT4EWgkm82JftKDNDLBobn+RZzDE6WyE+pblrkNN0CBXEbi3i?=
 =?us-ascii?Q?HL+Zuol0+ANcahxrcaEI7MqgBXc8AbgtB2Iml6vjZ8fsGas/s57Xekv5ohj7?=
 =?us-ascii?Q?+7oM/apAiMvjzfZLWaB8qn3TbfF7hH0fifqlb6Wg?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca0568ab-969f-4fc8-c8b6-08dcc67c9178
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 09:42:30.0468
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Duv1ydduBHSZWwGkp/5QzInskBhUFVjwdRR1tEc9kZbi9HpXUkggE5/9sg/LFqw0GAYBd88W5+PHpjpdrLGEsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5734

Convert devm_clk_get(), clk_prepare_enable() to a single
call to devm_clk_get_enabled(), as this is exactly
what this function does.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 drivers/net/mdio/mdio-hisi-femac.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/net/mdio/mdio-hisi-femac.c b/drivers/net/mdio/mdio-hisi-femac.c
index 6703f626ee83..f6fcb9e11624 100644
--- a/drivers/net/mdio/mdio-hisi-femac.c
+++ b/drivers/net/mdio/mdio-hisi-femac.c
@@ -21,7 +21,6 @@
 #define BIT_WR_DATA_OFFSET	16
 
 struct hisi_femac_mdio_data {
-	struct clk *clk;
 	void __iomem *membase;
 };
 
@@ -74,6 +73,7 @@ static int hisi_femac_mdio_probe(struct platform_device *pdev)
 	struct device_node *np = pdev->dev.of_node;
 	struct mii_bus *bus;
 	struct hisi_femac_mdio_data *data;
+	struct clk *clk;
 	int ret;
 
 	bus = mdiobus_alloc_size(sizeof(*data));
@@ -93,26 +93,20 @@ static int hisi_femac_mdio_probe(struct platform_device *pdev)
 		goto err_out_free_mdiobus;
 	}
 
-	data->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(data->clk)) {
-		ret = PTR_ERR(data->clk);
+	clk = devm_clk_get_prepared(&pdev->dev, NULL);
+	if (IS_ERR(clk)) {
+		ret = PTR_ERR(clk);
 		goto err_out_free_mdiobus;
 	}
 
-	ret = clk_prepare_enable(data->clk);
-	if (ret)
-		goto err_out_free_mdiobus;
-
 	ret = of_mdiobus_register(bus, np);
 	if (ret)
-		goto err_out_disable_clk;
+		goto err_out_free_mdiobus;
 
 	platform_set_drvdata(pdev, bus);
 
 	return 0;
 
-err_out_disable_clk:
-	clk_disable_unprepare(data->clk);
 err_out_free_mdiobus:
 	mdiobus_free(bus);
 	return ret;
@@ -121,10 +115,8 @@ static int hisi_femac_mdio_probe(struct platform_device *pdev)
 static void hisi_femac_mdio_remove(struct platform_device *pdev)
 {
 	struct mii_bus *bus = platform_get_drvdata(pdev);
-	struct hisi_femac_mdio_data *data = bus->priv;
 
 	mdiobus_unregister(bus);
-	clk_disable_unprepare(data->clk);
 	mdiobus_free(bus);
 }
 
-- 
2.39.0


