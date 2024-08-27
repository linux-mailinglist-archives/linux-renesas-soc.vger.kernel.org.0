Return-Path: <linux-renesas-soc+bounces-8338-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7886C9605FF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 11:43:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A26D0B23B45
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 09:43:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82FDF19DF9E;
	Tue, 27 Aug 2024 09:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="kHTPxfaW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2089.outbound.protection.outlook.com [40.107.215.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A407519E7F7;
	Tue, 27 Aug 2024 09:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724751750; cv=fail; b=HX625pQMf58duMgPQ1SSb0mFuXhnSye8RfCUTFCWfqtK35VRdv/dTihOVFanOeu5ggsp6d4Q11azKArHSMLyk5CGdi2G7zro/JFINv+hC8bvYvVVOyNlVmB9BN99ntyyq8YaHZCsCgboT2eRtw9duBcvzZ8ayedVbIKkdRhMev0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724751750; c=relaxed/simple;
	bh=2P9oKmy+87Su0NGdNBPUoFfW7Oc0VBG5JjpcmgtSZEo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PFTDpFRbc04gDOCnTqwG5hb/4JLonn704XozECRprlzF7DZuEoJtygMlBP9EF9qZEJbUI/GumnU+6N4QPKlteItAAu8tyBeEWnHmqcEv9wqgPUWoCUlJWv3l0JNmrV/XXgct7Y0n41nmt9gpx8HgYzCw+qFeFh+OwOu74sEvL8o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=kHTPxfaW; arc=fail smtp.client-ip=40.107.215.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HjVuR6sCdLLO9T4UDjhTD6m4bqh7q5kHiy40d95rghUY6W6dk1kY/AMB9cvOLqzpZ40xz1JIC7FqlzKlPRXsToQr9E9NtmtVMcRkIAwZ5pkuQtSayvG52UKw/7tupYXoScxf4SAyvPpwDMfhwCCWN7CuYyELGrVfyEWSz/Ad/72uzWF18G6pj6ZcZiWS7NgpSv4X0yO5R/GI6Tplwfz+b7rwVUZx1Tn5fJA0GYToulGJn9TIJCnq4JPA/10deWoRvgGSZwraFr76/9lqg5kH6uVhsSC/2duxrwS4HAt88mvRs1L97dOVCJaiMkWM08rJvelGRn312wwFI61Y6HtB3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dgpFOx0bt1ATIznbVlAsoO/BVR+KVeU/GCDjhwa9Vr8=;
 b=lUjtVh/cm1hoEaEh+bmbu+CXRZdWr2SwmSTQRfr6qVEO4Ll2oCNvv6P9ap1AUPB74ZmRs3T63IMrRG3iwz910NoG7OVcBif0c5Sj1CqLK3m96fOkWtOvv1CtWXVBgAUDwULnUxep1ZUn1/4mb4Wxc3I3i4tommEaYSr8X48V2pKajC6fcQ0O02CB7ApGskXkeIihUjZ6j8Qr0dO4uqwmb/op2QeNu/Lr2n1A3bb6tTzQDzK+AENPU3FHMaOuJITnVKFAEWB8oUD94TYGWC3E60AUC7LTudfhs4WODlF6iPyQhVQBTtJY8cOqyg/Uu4dbYjCnjz2aK6ayLdOgx2w7mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dgpFOx0bt1ATIznbVlAsoO/BVR+KVeU/GCDjhwa9Vr8=;
 b=kHTPxfaWgwlDFdov2RriuO5DbZn5mqQn3LK+go9CPpjp6lzUPC0O3WZhR5VleY53FrB+buBEGehtbM0dqTaVYX/tEq3nK2WDnYyE4gTf0aWVO2lHi4H5wOv8brclMPN+BAzDrdyq5GDs+HNAuz3CKM1t4G80OtB+Rloh98AVWbAh153HXv6Up7Jkw2CUkREgi7zkxhBpYUViV2GRs+m8QS00oozAwqVcb/s9+9HN7YVesiy6eryjVgo5MaCOOY+bOBrnJvzsFjCzqqzqIQkxkAiIs5ifBq/E+acJRzgaV0qR8zpUuewDHs1NsrV2UJrpO9CPDVmR61b55yXIsrSAgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYZPR06MB5734.apcprd06.prod.outlook.com (2603:1096:400:281::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Tue, 27 Aug
 2024 09:42:25 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::8c74:6703:81f7:9535]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::8c74:6703:81f7:9535%7]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 09:42:25 +0000
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
	Yangtao Li <frank.li@vivo.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [net-next v3 3/9] net: ethernet: cortina: Convert to devm_clk_get_enabled()
Date: Tue, 27 Aug 2024 03:57:06 -0600
Message-Id: <20240827095712.2672820-4-frank.li@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 299ab77d-7f62-4b6f-8a00-08dcc67c8ea1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aSiM3zqmc1b9q/L+fuuv4mSMoUaX6W9AXZX+SbcNX3QJXr/bwr0fR99vfA84?=
 =?us-ascii?Q?JSytsUalTC5w9Uas0gxETkpzCXumOBPW/EcVffOm2ElqqHkYa+Zcq3MqUMgg?=
 =?us-ascii?Q?VdD2DSqEzo/+rFTeydKKJuvY6l8PkH59RdEVUEInWVp2pTo7LqAKADLXH5p5?=
 =?us-ascii?Q?OqNCbG2PYodH47MGTiPbE/PwH0/bN7c3jMj47qn4yExQxR3OExClXnrG6QuT?=
 =?us-ascii?Q?UzK1J4oYP0Z5qCKA4LFQXdzEz8ae8oGkzXOUdT5aonQtdDstyuL9V11LJy7T?=
 =?us-ascii?Q?gzFBgdVOTH1C4/RaXkBP+JnxvnQ+i/X02NOo2byDW/WN3LCjf9ojuRphkvMc?=
 =?us-ascii?Q?pXuUnrRK0PnCjp0TGBbz+1jHUoUEkfe0nK3ftqPp562Onfzku7CP3/AC6Lr1?=
 =?us-ascii?Q?b1cTprMo8eqXZdYDAr6z2vZZZCJ4Cvnp2aZIYKeMq+y1gk2SwB0f6457IHh4?=
 =?us-ascii?Q?BoNCshRWucanJksd5Bcv7lCDv2V0u8e1gooYKhmkrZNAsJI4/XBj5d+IdcW6?=
 =?us-ascii?Q?hdDsxuhEsqIKTbG21guhkTSfPPhTcuolCiuA+IVO+UiWqAwWybWDqFmhTwjc?=
 =?us-ascii?Q?CuNSpwwV5YTAqHz5Fk0cj8g8xx0+w8YtkjqRMLqguMJBqu8djBpy08ZY/F5u?=
 =?us-ascii?Q?/IlMqf6jGzVJlrUrsfjLg5kyiSV9vyXCKARY0o9FoPACojQUA2tF5b3rrsWi?=
 =?us-ascii?Q?eRiexyvfEpaCOukPnAPiW+eYrno+BYFqufJljlMVhr5fBU2mBU/ikllvxWig?=
 =?us-ascii?Q?PoDzqxYGASdk0S1v+injtje+Jx/tLD65JH5NIPb/cfb3veaxprqHjnGTgtVj?=
 =?us-ascii?Q?a+a3q/WzKfxHBrRJWIeGBocHhiASsYD3OCgI/Mg33V1gY8FwB+N6t/7RQkfr?=
 =?us-ascii?Q?j+Gy9hm7VwWh/8bZ3zkBE9DbEu/+pCRQc4SWfSqWE7/ClaJ9iovJXGADOMXb?=
 =?us-ascii?Q?qfsuY8w3M6T9B7JKtoJVI8J8DlDlmSCkn1QEJmn8QFbAvslKOurwwEHWcJIC?=
 =?us-ascii?Q?HTwOU6u69nhNgGGLD9ExLXbd9nqmOppV23paO7lc62FJvOc0mBDgI3fEOVWh?=
 =?us-ascii?Q?FuR28mtId/ityoU5U8yPUdVQPOzMhnf0cHafxr7YkV8b+lQVhsISaRUN7HiB?=
 =?us-ascii?Q?8Senzc6pFpG4jMq6neX0TBXD0Ic4d54t8hUhNY6vu52yeftfhQ5DNcqbm2JD?=
 =?us-ascii?Q?7LxX0eXFnRj7WW/9Bm6XL+2PmCsLQrk71uKE7nlyyleT50fMkqvdEw0o9pWj?=
 =?us-ascii?Q?GZwmUoWDYzanlKYoYDsFM9tgt+YB6NW4aO0W26E44Q4Q0EVvwNWxhgf2Moib?=
 =?us-ascii?Q?kdoZTC41SqQwmgme0W0TDHoLZ/5KJ90JY2CoWyQ1CmpdIF3CnUr7ICKkUXqO?=
 =?us-ascii?Q?z2wXVfVilSc349otSjFMPQLtxF72dAiRzD8VtakXuJhOSmnRo84mriarPvXh?=
 =?us-ascii?Q?V0je6vm0y+w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(7416014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yK6wj3J1O7AOcN51RdBWZhdUyIIkxdBmjaE3yDCLCtLfGOUi7l2pfxK5cohx?=
 =?us-ascii?Q?WPn6M6wo0S1EcDPIJS0r944iwau4h0tnLVSKPG3kWj5Musoj5KKuVdT89CsT?=
 =?us-ascii?Q?IGINANzlUfPenI+SQyMuzTrrI0DT9C0vidPKhnQ0Wa2oBAtz3cZkgrLY6bIL?=
 =?us-ascii?Q?KKehNEAYM64Rlih33kEY4BGAHmwhwqB6TGnNGo+EyKuoy2Pns+iIz/nBk9Z1?=
 =?us-ascii?Q?8Qpi4OdqHi2BHULig5MhWAEj9sKEN9oRwBrpzFaVS7elgWxKAmnUx40cWZyI?=
 =?us-ascii?Q?arEhtro4rEXGJC9yCHd3DlsBDfHGPHRGgVw4ZfT0KTLYL1wJJTP8vp8SLqvi?=
 =?us-ascii?Q?juuLhRht9QED2Qo32BVja7A5XV9OojV5jkI7rjw+JSadAg82ZQsppo4rUTpK?=
 =?us-ascii?Q?ouOpf9dn+un8FC1kKi8SyQJtifi58Rpe9u2E54nMed0M4FWxbs/zvl8YnZTC?=
 =?us-ascii?Q?kHqLHBZwqnPz0wgMvAn5izvsfOYykLAIVt8BOoSOZVwr7NSf+3tcnqU/N4Vd?=
 =?us-ascii?Q?4yYC+a4XGn5b1XhHZvTBDPF+ii8zEmklgR/5LATJyixSgxowqfgI+9Pd4OAv?=
 =?us-ascii?Q?n/IeX+HXMSfsP+4K6aYMyo1l2Sc2vN21uCHVSqk8eGPhDKzmw0zaLOI8bmVb?=
 =?us-ascii?Q?RBbjZpPDzJdbv2zo1A1cUJrcVPXOVnuJ9x6CuTM9V+PAlkuPcSGShI3Jsltu?=
 =?us-ascii?Q?+c7p2q4dPUdEErHkfDChdlSI7aU0gH8Sy+auT+hUg/LuJJcGrI7oDQ8C4Lcb?=
 =?us-ascii?Q?FbExQAK6xRfV9mcZojqjHlG1OoheL7YyOySXi6TgsBwuxIN2PVOlg6gxIG8W?=
 =?us-ascii?Q?nfzo9QNHY5h1PeQVinR5y9OjXwUBp+S+wsVlC7UGNiav4sllouiSuEDb8LNw?=
 =?us-ascii?Q?oGJfLwYTwso4d9DhiOFRCmfshpc6Ogoml4jhS0V7XBYCoJ+589k5wEPHMlFQ?=
 =?us-ascii?Q?LSUdARiq8R9mqEmWUvR2274fPiLPIJy14eANzqSxMut36ZO2uhC1+Gucnnl4?=
 =?us-ascii?Q?4nWXkiegdFehbgo94mtcJgzqadfO8F7EewV5yQ820f2O1xjH39DF1C3sapYT?=
 =?us-ascii?Q?ItPKIsHe7yZ1ZFSlZ7G0k99mbucKAjIOShTogBg+7R7SSLgNmUAcXcJ4dPC+?=
 =?us-ascii?Q?wuEyElfwGZTWgCdsOL+3EFl7CM1cEzToKG78Ep9ia72Es/ClsBvnxEGXJmJR?=
 =?us-ascii?Q?LT2tvd1unTepvYbr6zE6DDPe5jKc5tca7NEnDo6wSTBf+xDvRxszbNHdye9k?=
 =?us-ascii?Q?I3AuZqPeAPr6YbXczOPwzE0NRxLu2vcHWVWCm81F14Uz+dfPeJxooFxp219L?=
 =?us-ascii?Q?UtcUCBSCl+/IuXbOsvf/5OYMC+/IH8J1Ok/Yx/XEpSH092SpMyz/bsk82zuh?=
 =?us-ascii?Q?u9k3nQi3xpU7uCf1ChfNSktlBjlxTrVqhFQrYEBrdGWOmok43wEKwgwTmnkO?=
 =?us-ascii?Q?yDkHB97fUD20PDooMALgfdE8kb6r3InPiTB54AXfs1/NnHEMcMclukkJQNbO?=
 =?us-ascii?Q?SWJhrT4PDLnl9SDUveIIunym44eK2lICW4tB4Shm0rwIL+dyFy2Fsdxr+Jcq?=
 =?us-ascii?Q?StWEpyz9jMUEudmlDQNmCF6teYU+2WJO2bLWBWWo?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 299ab77d-7f62-4b6f-8a00-08dcc67c8ea1
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 09:42:25.2490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qlnMY2I8V/x4iDw87rjwtVaiacz0cmoJu7+KRQa256pNTW5C8beONjS1/sQMzfpnrICAa7rgYyWNTQhljZJ41g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5734

Convert devm_clk_get(), clk_prepare_enable() to a single
call to devm_clk_get_enabled(), as this is exactly
what this function does.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
v3:
-move the local clock variables, keep lines longest to shortest

 drivers/net/ethernet/cortina/gemini.c | 25 ++++++++-----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/cortina/gemini.c b/drivers/net/ethernet/cortina/gemini.c
index 73e1c71c5092..5c86987c6fdf 100644
--- a/drivers/net/ethernet/cortina/gemini.c
+++ b/drivers/net/ethernet/cortina/gemini.c
@@ -109,7 +109,6 @@ struct gemini_ethernet_port {
 	struct device *dev;
 	void __iomem *dma_base;
 	void __iomem *gmac_base;
-	struct clk *pclk;
 	struct reset_control *reset;
 	int irq;
 	__le32 mac_addr[3];
@@ -2326,7 +2325,6 @@ static void gemini_port_remove(struct gemini_ethernet_port *port)
 		phy_disconnect(port->netdev->phydev);
 		unregister_netdev(port->netdev);
 	}
-	clk_disable_unprepare(port->pclk);
 	geth_cleanup_freeq(port->geth);
 }
 
@@ -2401,6 +2399,7 @@ static int gemini_ethernet_port_probe(struct platform_device *pdev)
 	struct gemini_ethernet *geth;
 	struct net_device *netdev;
 	struct device *parent;
+	struct clk *pclk;
 	u8 mac[ETH_ALEN];
 	unsigned int id;
 	int irq;
@@ -2453,14 +2452,11 @@ static int gemini_ethernet_port_probe(struct platform_device *pdev)
 	port->irq = irq;
 
 	/* Clock the port */
-	port->pclk = devm_clk_get(dev, "PCLK");
-	if (IS_ERR(port->pclk)) {
+	pclk = devm_clk_get_enabled(dev, "PCLK");
+	if (IS_ERR(pclk)) {
 		dev_err(dev, "no PCLK\n");
-		return PTR_ERR(port->pclk);
+		return PTR_ERR(pclk);
 	}
-	ret = clk_prepare_enable(port->pclk);
-	if (ret)
-		return ret;
 
 	/* Maybe there is a nice ethernet address we should use */
 	gemini_port_save_mac_addr(port);
@@ -2469,8 +2465,7 @@ static int gemini_ethernet_port_probe(struct platform_device *pdev)
 	port->reset = devm_reset_control_get_exclusive(dev, NULL);
 	if (IS_ERR(port->reset)) {
 		dev_err(dev, "no reset\n");
-		ret = PTR_ERR(port->reset);
-		goto unprepare;
+		return PTR_ERR(port->reset);
 	}
 	reset_control_reset(port->reset);
 	usleep_range(100, 500);
@@ -2532,24 +2527,20 @@ static int gemini_ethernet_port_probe(struct platform_device *pdev)
 					port_names[port->id],
 					port);
 	if (ret)
-		goto unprepare;
+		return ret;
 
 	ret = gmac_setup_phy(netdev);
 	if (ret) {
 		netdev_err(netdev,
 			   "PHY init failed\n");
-		goto unprepare;
+		return ret;
 	}
 
 	ret = register_netdev(netdev);
 	if (ret)
-		goto unprepare;
+		return ret;
 
 	return 0;
-
-unprepare:
-	clk_disable_unprepare(port->pclk);
-	return ret;
 }
 
 static void gemini_ethernet_port_remove(struct platform_device *pdev)
-- 
2.39.0


