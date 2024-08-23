Return-Path: <linux-renesas-soc+bounces-8104-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2634295C633
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 09:08:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D0EBE282718
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 07:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7377A13C9C7;
	Fri, 23 Aug 2024 07:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="f7ZbNnb6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2051.outbound.protection.outlook.com [40.107.215.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63CE13C9B3;
	Fri, 23 Aug 2024 07:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724396824; cv=fail; b=e9kp0L0LwQpZPpMpJPXL/7JvwvR6H4d3q4+BE2N1xTNTOnQLEqinYsKMuDqYP5VOlpt/+GtKus/lOmZOui9hJmFspOeOBKVe7+ujcrTTtuolxyROAAu4e6AEsgfnBYtbyRUyNSi3f6dkUSEdPkpAtjvsR0NKfyJrAm6P4zuaE2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724396824; c=relaxed/simple;
	bh=8uiaS0FJhM1300wHqyaKvmI/6JCTX9NfFWu2KnGs9ew=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=M5XpWPiwiSmGREbsJRH3o6xH6E4Lg28PFnpySQkjqcEh0Z/dqNai2Iq3IGZJoCnDH8zo51X8420m8nuydouqFNYrZkHBM5EivUKwJ6WsZb2KzoUQbKtGuGlusra0lio/YR5Z2oY+LTDPQKQpKR+nzrm179TNOtMwJT1TPyaGILc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=f7ZbNnb6; arc=fail smtp.client-ip=40.107.215.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cQ6KQ01OVXirofrAPdXHKTgkmJq6pPen3SATYi/DQdazz6prsQBNQbins+FL4wy9ReBKN0rrVBJxRQIclLefYniMqLi8BOG0cMksjMQzVrP2+Y++RSAxsoEGV74cfUa4XqKR2IKxcsxj2nJnsBgF4JX+vPEd16uTOJpPIkpz+R5giXC5WeCeR3H3Iz94iyU22oswRJrkY6n+14Kj99vvEYtyA65YVbTHAS50Jr5v8vAAQEbEB5jbQj+blOj1+FOeBqJBvGH6rGZNWzDe03O0qrVYqlCCxlIbB2XVFmEcese1WSRpKW3QWYRlZOvC89H8btDRpF/UyJNAcnibyb0UVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/2Se7WawwWaVcdt622wJpcgPKdfA2FV+ztQxBflOfc0=;
 b=q+CMQB8UNkGYRGk5mHQCFgdWd2hwcnASOfw8XMsV61Lele1U+1EO2zHWfkFcIqpvn4HtPymFOONOCNcHsBcwdY6LfAhkRj+nwq6o5MHqRuQkuqYwPhHaMKNkcIH0MldummKI2kJWurkNPL3trhukgMx3+i54haLzAbjoiETU68d8IXyVCERZRmlc0fz14x65vg37LNMVm5jDkLnx3r96avNFSoyuGiKeittdcP5xMv9TmDZbf3BLrDwDTHLNawdVXvjNpTQiybDL+6QCuWLj2A0axrT9k0FjLToqdhgrGnyxNTIxaLyAv8LvHgZwQ1PG8coJhcl5OC5N+f77ezwGZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/2Se7WawwWaVcdt622wJpcgPKdfA2FV+ztQxBflOfc0=;
 b=f7ZbNnb6SPKM+2psGED+CMFBhwpA0aS8jCB3Ix7eE0E9BIfuew6yhaRWyhMyJMnt4/j8DoRG0vC3y/pATqwPRK2ZFUahdF+9RK8SU+2gc3WXmT0IpSjbbuSyxSNpqSvWmQyTB61KBJ6ufDsBwHKkpdGngp67ClgrvCcmGq4Cm6nggjaj30uFNurzmEyG9/WuIQvyL8JGqMA1gTA1torfEk/Tx1psKg8aIqrx3dKNydrP3KPkn9NfnucOjIQK2/+DqGjX9a2D3b5x8w8790rfyoTjxswV+fyJW7LBMZkaaJsMACSX5jq0kGNbAlnhvqCWyUbVoNRidxz5JEAm2kXN9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEYPR06MB7069.apcprd06.prod.outlook.com (2603:1096:101:1d6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Fri, 23 Aug
 2024 07:06:57 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::8c74:6703:81f7:9535]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::8c74:6703:81f7:9535%7]) with mapi id 15.20.7875.023; Fri, 23 Aug 2024
 07:06:57 +0000
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
	kees@kernel.org,
	justinstitt@google.com,
	u.kleine-koenig@pengutronix.de,
	horms@kernel.org,
	sd@queasysnail.net
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Yangtao Li <frank.li@vivo.com>
Subject: [net-next v2 6/9] net: ethernet: broadcom: bcm63xx_enet: Convert to devm_clk_get_enabled()
Date: Fri, 23 Aug 2024 01:21:18 -0600
Message-Id: <20240823072122.2053401-7-frank.li@vivo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240823072122.2053401-1-frank.li@vivo.com>
References: <20240823072122.2053401-1-frank.li@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0001.apcprd04.prod.outlook.com
 (2603:1096:4:197::12) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEYPR06MB7069:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a229c47-6a3e-45a4-f975-08dcc3422d08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LPjv8TE3hMFmSzj0veiRdBC12CZKN+9gRKh8f+DIpGSBM+wOPnJPkbSSPT0K?=
 =?us-ascii?Q?6RSZJdNvQlrCamER5y0fpiv5fh+1sI9BkMAHSMhktAR1FmDiginrKFY7FmFf?=
 =?us-ascii?Q?lkPodp358G1qvr148ZJYcofq8rVw2CME8HwAp3ceD9Tcnrn4oEbIYC9O3j9c?=
 =?us-ascii?Q?MRA981EY183B67+zDnKbW+toxM5wDlOUibSJ6sRafRZnvYXnWuXSZkxxrIXr?=
 =?us-ascii?Q?EgXOS2soMLrRACF6eS6ERn+nNLCJLbeXQw/gEMuiK+8MnXQSAlcrJPwIm5CP?=
 =?us-ascii?Q?m7POL3V+6qIZmTARYB7RBWRY+zgQR7b58YPB2rd9Dm9FaGaAybPuHahjRDIw?=
 =?us-ascii?Q?jlFSljaw4cpyA4DBXd7PSEtkW6fLmDCT+vNEtOOzUybwgERdOOuNjwTcQnCL?=
 =?us-ascii?Q?IXt3XTlF/4H84M23qeRbvIMjw+hUKfOF9MMQGqwLNqoyHB4gZkmX/IKTbtFO?=
 =?us-ascii?Q?Zpq3te14TH8G9MSOvM82hyDCsBUU1aTJgit+23zZJ/xFA8u5jX5HV/wNF+y8?=
 =?us-ascii?Q?ZcpbHU8CnLGRtZVLOxox3CpWRSXQfSEuF2Ay4MjFzLZpjI6cRpGUpVx6aGgi?=
 =?us-ascii?Q?Tgd50S+0JbCkDkRl3t49VZMp9zVKN9EM0GABVcDAakpo0ryOQeJalXhpetdm?=
 =?us-ascii?Q?1e6LLnw8BQW0TxH6oxmXHb3zvDYVCf8XgPhwGkAw3TpaM+XEPiE9+rzytgMs?=
 =?us-ascii?Q?oTRxFdtBRcQMIUhQUZ9jDzjNT9aQayXfrJrj+KlODNurJR9cgMjSU3dy4H5W?=
 =?us-ascii?Q?b/+klkI0pWn9LLeiGOQDbuzGkNV+EyJ9IwzVM/fygIyTtW7SC0LF5osmQPl7?=
 =?us-ascii?Q?0ecs7Lf0FVgFSfSCyHIiEGxV1QeTKRbkPIQSpg0QiB5xAkQ68jwgAliq6L2e?=
 =?us-ascii?Q?B6IlOZnp9eDCILBhz4DXbKCpAAef1VJPX+hWn+bB03Ks9HQ0otlfuyLN3mQe?=
 =?us-ascii?Q?JtxKd5vkyeIRYTCUhrxwvtvHkeW4BtwgOcgFuFpvRTCXGpek5asFx3LCYMqi?=
 =?us-ascii?Q?sDaYEH/Rw4YAqpks7MYlZ3hQ1BJnf5K+oXVklilGg+Rp1Q7UONQ3wuzJ/OUl?=
 =?us-ascii?Q?nCtGq7k2tJUG+gmS5zWylcKk/RzPAhrlMNQ0ICKhfDJptYkIm+JJ5byuoxFv?=
 =?us-ascii?Q?x7I02q1JC8w2Swk1ns3Qfs6jAu6qtK9evfGti/+6daMVVTxwXNgfGowh+5x8?=
 =?us-ascii?Q?3z8Zg8TsbrPhSpOA4E8B58Es63U0+MEJq55DoQ4BwPq1uUGqzp2/TF1+WUYw?=
 =?us-ascii?Q?XDk0G384BNRu7B6KGWRQn+OC94sB8NNpy/xH4DHRsgCzQs0EU/bFWx2RnQKE?=
 =?us-ascii?Q?MIrB4gsnsR66yqYxH69L4lPxvdhQM1YFAE8tR804dTxwJQFrje+AOKe4m/aj?=
 =?us-ascii?Q?qMq1ErXAnPQwwuor1K6vjHHclt6Ed2VUe1mofm77gbAH1GyMJN0MO3urgc+R?=
 =?us-ascii?Q?6bVSaLmpaz0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xDOmfLG/0Gx85NSM0XvQR7JNm7mltdZJ+6Kcx3m/JH8D1XXvE728eU2g+6yT?=
 =?us-ascii?Q?HbaUf4ihNLTXKhZtiGYgoE576tCzuJshKaTq+LOtvqQznAhNHcLqXIdDnSuF?=
 =?us-ascii?Q?EXZWopPDqUmqVV+fW0oqf4zM0ZvgVj7Fj4CzrDsXYXYazLyda4HEg8fkc0zI?=
 =?us-ascii?Q?F8yc7Z7c2kE+b1aSeIrXhG1dRTLTq/7nASxeeomWVRs38FiBrdobhQz6tCX4?=
 =?us-ascii?Q?p3W07k9acXvHxlDAkjwp6Ls/QJU67cTvwcIqiV8NtW0/lBYug2mzPSvGym4C?=
 =?us-ascii?Q?Nt7/e1vkGboi3cvAOhIp1ebz7n3UXQw9cpNAqezC9yb5LQqlcv0uft3rII+S?=
 =?us-ascii?Q?yiUUCnqQTRJqB1ysnSNwuAzhEnCkBnwcldePt4zt83APBrAEevnYLd7cLjIs?=
 =?us-ascii?Q?3d06BC6ttWrmxlSq4qVjax9Fe7thOva9H6kqftxV8pJKAErvCnYSb94qqvfu?=
 =?us-ascii?Q?6CpE5jsPhn5r4LkwVUciJIT0+9nsweW9oAeStIDz8JA8/3WlSrPii0YEfHo2?=
 =?us-ascii?Q?LFCUagjs6swFfuMjviRPxfEbLDR3J4nbHyeDftzkML+BN7od8rG9Ils0fAXE?=
 =?us-ascii?Q?40INFWc78aBdyQSBxKqemctY86fQAwMnuWrkx7XPJPS8ucToevCkkxR4hAJ4?=
 =?us-ascii?Q?WmQ/DSIVxMGro+r6xfv0FpdPFg9rOkBIZEKRYbwk2I9XzCUheoyW4r5EPPpo?=
 =?us-ascii?Q?GMjcazzCvFg1sgh3MCsUM4yED5dRVcRWKd57TsA76vqjOWYN1XNrEc25yRo/?=
 =?us-ascii?Q?Qnq7VSfIUaVyilSYU0aSS7cSeRV1XC+vAfk6A6+kkVCDrMtVsMm7uLpr/deb?=
 =?us-ascii?Q?1+9d8tBDM6YXIMGAUis2IHdzxQF6mndQnt1p8wbPPKIoaNCRBmA6uyOUdiFk?=
 =?us-ascii?Q?D4KuaDn6ubhK7OYyxnuNqWBA83MCjg2TU92BxucSCW+INWy5ZLdXEBVj8Q98?=
 =?us-ascii?Q?f26IrJywWFn8fSM7djYeOF69e1mdUrqGxKy48M+nGQo56rIRi0uhZkEqMGGy?=
 =?us-ascii?Q?32BTKQJAfwOra8k3JQDOX6hRmmTmCjHxaYHvtTPMb3fkoNKhdSLkRWUkVLmU?=
 =?us-ascii?Q?bRNoBbwh4maVKA94+5NX+ayNGbtH2cAL+8e98cQuxnl4C7LDXffWmY3k3kBF?=
 =?us-ascii?Q?8J3QqXg6rGo4l8Dg85tN/N2VYGvqoOwvdJwLOOzY0TtkS38uQ5GZ5vm+5rs+?=
 =?us-ascii?Q?xSXIccbAm/QhVN1sVnLeLpVZm9L/2DniFKwD+8VKdX9FeRVRDBs+Ss/3iCGP?=
 =?us-ascii?Q?bDa5WGT9REE+Pmc5OrfYTb+UKAXbHnvtQv1IA0HFLSLYS2/8j3s01Xr3jqJz?=
 =?us-ascii?Q?Y815jgaCp/oJ3L6E/8o6ca1oI/UOz5PXzezW3YL8KRIcLcdaxiQSn7D7Ksjj?=
 =?us-ascii?Q?sVZ/HaBmyxWMTqApJXnsOuZ0pMNOBFbmKX24Nx5/dvAxjZ3BPj1f/g+m/7pw?=
 =?us-ascii?Q?ifHRo6/c630iiPZRVak5V241nokUyq+guZwNXIWaTznJiOi9rcoJnsvUNeV+?=
 =?us-ascii?Q?sPVNunyny6VrWfC+wMTgK7fr4xSJZRG+SaY039Vw/0k0W1Me89gbqzU7QmIa?=
 =?us-ascii?Q?CK4OJGkdItgCGTg+aZUB472qIM24Brum3tNMKUvi?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a229c47-6a3e-45a4-f975-08dcc3422d08
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 07:06:57.2755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IqlkyPayLAC9SGbY2xJ3G3HxAVPBYSBZ3H8AyYgNzqZzOMOeIzoAbxwjOW6NpuApH/LcQflfyPSLMcLOcpLiFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB7069

Convert devm_clk_get(), clk_prepare_enable() to a single
call to devm_clk_get_enabled(), as this is exactly
what this function does.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 drivers/net/ethernet/broadcom/bcm63xx_enet.c | 47 ++++++--------------
 drivers/net/ethernet/broadcom/bcm63xx_enet.h |  6 ---
 2 files changed, 13 insertions(+), 40 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bcm63xx_enet.c b/drivers/net/ethernet/broadcom/bcm63xx_enet.c
index 3c0e3b9828be..6e288cee2c35 100644
--- a/drivers/net/ethernet/broadcom/bcm63xx_enet.c
+++ b/drivers/net/ethernet/broadcom/bcm63xx_enet.c
@@ -1718,6 +1718,7 @@ static int bcm_enet_probe(struct platform_device *pdev)
 	struct bcm63xx_enet_platform_data *pd;
 	int irq, irq_rx, irq_tx;
 	struct mii_bus *bus;
+	struct clk *phy_clk, *mac_clk;
 	int i, ret;
 
 	if (!bcm_enet_shared_base[0])
@@ -1752,14 +1753,11 @@ static int bcm_enet_probe(struct platform_device *pdev)
 	priv->irq_rx = irq_rx;
 	priv->irq_tx = irq_tx;
 
-	priv->mac_clk = devm_clk_get(&pdev->dev, "enet");
-	if (IS_ERR(priv->mac_clk)) {
-		ret = PTR_ERR(priv->mac_clk);
+	mac_clk = devm_clk_get_enabled(&pdev->dev, "enet");
+	if (IS_ERR(mac_clk)) {
+		ret = PTR_ERR(mac_clk);
 		goto out;
 	}
-	ret = clk_prepare_enable(priv->mac_clk);
-	if (ret)
-		goto out;
 
 	/* initialize default and fetch platform data */
 	priv->rx_ring_size = BCMENET_DEF_RX_DESC;
@@ -1789,15 +1787,11 @@ static int bcm_enet_probe(struct platform_device *pdev)
 
 	if (priv->has_phy && !priv->use_external_mii) {
 		/* using internal PHY, enable clock */
-		priv->phy_clk = devm_clk_get(&pdev->dev, "ephy");
-		if (IS_ERR(priv->phy_clk)) {
-			ret = PTR_ERR(priv->phy_clk);
-			priv->phy_clk = NULL;
-			goto out_disable_clk_mac;
+		phy_clk = devm_clk_get_enabled(&pdev->dev, "ephy");
+		if (IS_ERR(phy_clk)) {
+			ret = PTR_ERR(phy_clk);
+			goto out;
 		}
-		ret = clk_prepare_enable(priv->phy_clk);
-		if (ret)
-			goto out_disable_clk_mac;
 	}
 
 	/* do minimal hardware init to be able to probe mii bus */
@@ -1889,10 +1883,7 @@ static int bcm_enet_probe(struct platform_device *pdev)
 out_uninit_hw:
 	/* turn off mdc clock */
 	enet_writel(priv, 0, ENET_MIISC_REG);
-	clk_disable_unprepare(priv->phy_clk);
 
-out_disable_clk_mac:
-	clk_disable_unprepare(priv->mac_clk);
 out:
 	free_netdev(dev);
 	return ret;
@@ -1927,10 +1918,6 @@ static void bcm_enet_remove(struct platform_device *pdev)
 				       bcm_enet_mdio_write_mii);
 	}
 
-	/* disable hw block clocks */
-	clk_disable_unprepare(priv->phy_clk);
-	clk_disable_unprepare(priv->mac_clk);
-
 	free_netdev(dev);
 }
 
@@ -2648,6 +2635,7 @@ static int bcm_enetsw_probe(struct platform_device *pdev)
 	struct bcm63xx_enetsw_platform_data *pd;
 	struct resource *res_mem;
 	int ret, irq_rx, irq_tx;
+	struct clk *mac_clk;
 
 	if (!bcm_enet_shared_base[0])
 		return -EPROBE_DEFER;
@@ -2694,14 +2682,11 @@ static int bcm_enetsw_probe(struct platform_device *pdev)
 		goto out;
 	}
 
-	priv->mac_clk = devm_clk_get(&pdev->dev, "enetsw");
-	if (IS_ERR(priv->mac_clk)) {
-		ret = PTR_ERR(priv->mac_clk);
+	mac_clk = devm_clk_get_enabled(&pdev->dev, "enetsw");
+	if (IS_ERR(mac_clk)) {
+		ret = PTR_ERR(mac_clk);
 		goto out;
 	}
-	ret = clk_prepare_enable(priv->mac_clk);
-	if (ret)
-		goto out;
 
 	priv->rx_chan = 0;
 	priv->tx_chan = 1;
@@ -2720,7 +2705,7 @@ static int bcm_enetsw_probe(struct platform_device *pdev)
 
 	ret = register_netdev(dev);
 	if (ret)
-		goto out_disable_clk;
+		goto out;
 
 	netif_carrier_off(dev);
 	platform_set_drvdata(pdev, dev);
@@ -2729,8 +2714,6 @@ static int bcm_enetsw_probe(struct platform_device *pdev)
 
 	return 0;
 
-out_disable_clk:
-	clk_disable_unprepare(priv->mac_clk);
 out:
 	free_netdev(dev);
 	return ret;
@@ -2740,16 +2723,12 @@ static int bcm_enetsw_probe(struct platform_device *pdev)
 /* exit func, stops hardware and unregisters netdevice */
 static void bcm_enetsw_remove(struct platform_device *pdev)
 {
-	struct bcm_enet_priv *priv;
 	struct net_device *dev;
 
 	/* stop netdevice */
 	dev = platform_get_drvdata(pdev);
-	priv = netdev_priv(dev);
 	unregister_netdev(dev);
 
-	clk_disable_unprepare(priv->mac_clk);
-
 	free_netdev(dev);
 }
 
diff --git a/drivers/net/ethernet/broadcom/bcm63xx_enet.h b/drivers/net/ethernet/broadcom/bcm63xx_enet.h
index 78f1830fb3cb..e98838b8b92f 100644
--- a/drivers/net/ethernet/broadcom/bcm63xx_enet.h
+++ b/drivers/net/ethernet/broadcom/bcm63xx_enet.h
@@ -316,12 +316,6 @@ struct bcm_enet_priv {
 	/* lock mib update between userspace request and workqueue */
 	struct mutex mib_update_lock;
 
-	/* mac clock */
-	struct clk *mac_clk;
-
-	/* phy clock if internal phy is used */
-	struct clk *phy_clk;
-
 	/* network device reference */
 	struct net_device *net_dev;
 
-- 
2.39.0


