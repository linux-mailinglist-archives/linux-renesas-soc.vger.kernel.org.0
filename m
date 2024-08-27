Return-Path: <linux-renesas-soc+bounces-8340-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CB0960607
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 11:44:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 32ED1B22C6C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 09:44:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1558619F479;
	Tue, 27 Aug 2024 09:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="QeTiMzRt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2088.outbound.protection.outlook.com [40.107.215.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5773619EEC7;
	Tue, 27 Aug 2024 09:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724751759; cv=fail; b=pyWcZ64nXj0Re0j69QLFBhvvjtPUld16x+aXjlPqtbw/5HYIE6bbYgrcc/ZrmLyryC+CaoQ5iyNR5SPdkesaMwILnfDKaFNCEXwlm7l5za0TLKS2Sr8V6HhhorKl/VWKxu83uYeigA/C1rlydKXfzXMr0aM9xgk5bPfnMgzU118=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724751759; c=relaxed/simple;
	bh=Y+fmIwBxvWxyVZfdxqKdvMSpZL8fqWlU3Zglug5ZJws=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=m4dZsGxEy0NgD2pNDQIZumU3ojrEwKeHmsOrmbr8EoE4n0YSYxceKH7ZPKtKwZJtTEy/OkLOetHTqNlSrL8r/VDJqOaPXa1xpVwsg/VFV1AVzieupSbZzAA14CX7Ig2IvQPVRI0fgiKmBi7+fvWUESqza7kBuJ3F95on1jigRfw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=QeTiMzRt; arc=fail smtp.client-ip=40.107.215.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l15asJiMfJHX7y/9vIQ/6Ug0julIjAr/8jRQjHpKombSB1cUH+cS3qGnxymIYGU9WGxcqGpehWv4Ck5M5hyRQgNWN/2v6mhlaapedZ3HQX1e/NDZJiUFlYhs4gkgIr5vkvDNn+HxCVBi6hrH51dC2jl7C6uHZLggqWIyIIEQxr+q6BYmtpDPKhy+gYXoJ8SPSOrUjSDqAo9AzWnACXh9GFMaZIbFJloBBa6t0+kc/ewxrLZpEzcG8ZjaKPLrYzu/qtmgIltVoX6pFigeKtZhdC+5maZ8PgXL67qfF4U1KlN+5E3coN62O8NGJRDeJhawtlCV9CgREbltpeEzQ0Zmpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nuUwMHlqNd7/NeaZphBJIEMMm/qXldl22uDXxOIGaM8=;
 b=Ha/c6MBFCm/zwt1zPK8F6uVUf9dxac85Aa/bATVVmc77WiQdBj39g3kjDlUpohqpk9OhHXcxxs92jSr6JM6B9U4xCtuPU/hQTD5oxZ2oiKiC5zqh3EHh8cSFkhAmFk12LP3SEX+m82CXZvlmB/TPUlAaxfXG0yXAr82yyJMphUxQT0/2gE5wnmMKooBTxQ6K64P8BybEk7CPxrgPEhPuU4sCxxxVq+prndhsTPWyVGvpU17sfTA4bPM+3j+mBcMEvKQvWbIFe4XHbmTemLXC7n7YMQwEjTBtW/6wi6YwMXUM5icM2RWTnIgFHwPkHLgkno6sy/ClpgHT9LAEOqE7dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nuUwMHlqNd7/NeaZphBJIEMMm/qXldl22uDXxOIGaM8=;
 b=QeTiMzRt6Yraiaaunire7esV9CwCV+13/EXiMuFJ6ZM1zcWfAJ9xvASA+NIwrjtqt/xiorUa7jvRkGm1eiLa6yGkpG6LzGk3ADbMVIltnhfJDx3YuTXsLSVo0BvyC0OrVMYht8goa33QTdlGqOgQ2kJr+FUtvDG+GA/HFtzb2uURUzRAYnvjX+lLcLECNeymBDwkwn+AIvN2VHlJVINPNlZ1HL8vCOjExkr1il+ja9JpMdeOUN7NvWmSHp9Q08eADylvIUyGAupfDZ/RB4/kOEXiCTAh39Fqwm3Xrbx7AF3rg+6/mqiUKuGkDv1PePip1Vd05am4QUiUREwOX1ke1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYZPR06MB5734.apcprd06.prod.outlook.com (2603:1096:400:281::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Tue, 27 Aug
 2024 09:42:34 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::8c74:6703:81f7:9535]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::8c74:6703:81f7:9535%7]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 09:42:34 +0000
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
Subject: [net-next v3 5/9] net: dsa: rzn1_a5psw: Convert to devm_clk_get_enabled()
Date: Tue, 27 Aug 2024 03:57:08 -0600
Message-Id: <20240827095712.2672820-6-frank.li@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: c555051f-99d7-44d1-0b0c-08dcc67c9421
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8Vzz5VCGL8O+OFDy3V39ctf74t2X3gl9MAEd1RCawCC1K8YK4fb9lqmG/Qlm?=
 =?us-ascii?Q?J/3FA8fJcGBJ8tKy1lO7uycfXXxgHevHdIHlCptZzc4QRhJI4fZtk5bhNNr5?=
 =?us-ascii?Q?FsctwEAVYsUfK7l9NOd9IXY6/t1LXuTkG6QrxzMY05WG7Wso20arYkTbGsIV?=
 =?us-ascii?Q?ePB2tGlCQhQ8ScYZ8uwaFfvaYDDYyym0ickbkbLyhXxzgVeGlvp+uK9n+0m2?=
 =?us-ascii?Q?6biS7nC5me47cIMYFUdJl4S/eCrjJeWTlTuCmzPZS/HSTaudlTGAjY+bM9M9?=
 =?us-ascii?Q?WtcrbdGnXrshRYdvBUvZKyRqpeeYVVKlAm0F15mu/oHNaWiM1TOzvTYWIrA8?=
 =?us-ascii?Q?B7H0EQRFuH/cdfKeJPztogQEc/29jkX++ua6TGRX9vaZmQZb0As4jmkmxBWp?=
 =?us-ascii?Q?YInZOVWvlk1hUOuPKpD/DoM+O8eWD9+eQZMbT1Tee5eeqTzPudEDShKyZQ2H?=
 =?us-ascii?Q?s4UawX1573TcTTjeg6HeuSV3iT4iLwezKmavGv/ry2v8U2jjAeO2/kNFgRIw?=
 =?us-ascii?Q?c0oZZgCPUO6vHSF0tP8FVbL2zPxEQB+jWXU2/HOYCALeGruPoTTaZ2vHQBtH?=
 =?us-ascii?Q?5mMuBN9XQZ3jCX7GUXkiL/IRZfvnLcK2IY3uk78pSm/luWAG8Rz9l4xetMCx?=
 =?us-ascii?Q?mogFqO7LibyIMU6e/pTDzpt76woGS+YNWtMWhLzkFixYOEXot3lSJaWibLUH?=
 =?us-ascii?Q?EsUUA4Z9JF+PW61hELAq4Tyn+Jt8+NYivp8yUrk36PNz9zVxa7xbwQoAasIE?=
 =?us-ascii?Q?2AFMwJL6LtXARUNkV3vuOmqqfzSQXzpatvWCCoi6XZrUI5m3TGZXKFkNnfJJ?=
 =?us-ascii?Q?f64PNFqs0O9a71vkrvylCcpBiRbvjcYqAbCMKOYL+E1sUMZc6pskwyUgRGGx?=
 =?us-ascii?Q?YS4X4wjSLfdDqZpXhM73fr5IC1NyYhgH7os/CySQcxiXtfNS/tykQsjs5x6x?=
 =?us-ascii?Q?l/FbrNi01bIC8iFhv1PjoZr0NY7qL3yXd72XQTp+FPRbxFS+RCEV04bhudqv?=
 =?us-ascii?Q?Sm9r4HFoIbNroU6JvaeRPTBjB1YZBMrCj+dtcOz967MXhPywRBpqNbALWkMf?=
 =?us-ascii?Q?0EieNuS9EvMFkywasXiCpok+GIOUsY6jT9apffGIGi3RxnZvH9Zc0YS+cCsD?=
 =?us-ascii?Q?qDjZ9FBcW9Qx5XuVIIw/NHRDV3cIPrI11As1Vij1xbhirva4IM78fCKqGs2z?=
 =?us-ascii?Q?U25BO7MWXXHKQ3RXl5lo/VdXer4B7mnI+a/G3zfxCK7Arrx1naUq5+6srYrQ?=
 =?us-ascii?Q?NH6u4/+CLrbUrn8DfbuJjQu2RRR9G1XE5BCSPnTiiNSUz8vpddZ08OJZlvV+?=
 =?us-ascii?Q?RtDPoqX6ihh+bxDM9JivHa+b5IpJN279d/Z/mdUsxw3nosvWQ3JCmIjDuOKW?=
 =?us-ascii?Q?n+5WM9R1/KyOi7gL38w1zs6lqcA4csMfGZxZYNNjo9i75F0X3KxXTN1RhPRS?=
 =?us-ascii?Q?DX3b82UIhDM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(7416014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?izo/Tt2dKFT62LeZGRamsswyAfqpnUvJQXLPXkiOk4DBI0ngR50ul//SL+aC?=
 =?us-ascii?Q?lT/n+pv6IkEOz9sUWTR93bjiYyfcrT8dRrEM2pOR3FwKkEkuCHxiTOih06f1?=
 =?us-ascii?Q?XYIUUEGHLe1ec0IcGzgUzQ4SlL/5uJeF5yIBwoH1GfXLxMtZFyCL/2+0B2Mp?=
 =?us-ascii?Q?yC5wTeMbA7VfVN1io7SC614a8IX+FO0aEasUhRm8+y6YcOt8J7LEHiGA3qug?=
 =?us-ascii?Q?KXZaZ9THF9rX8GgE9eZ6Ow3oPT0nEkBeP2T/iOvqjTO69znfUpBxk70WvRw4?=
 =?us-ascii?Q?egX+BM4c8L9eTa8ch/o8ThUAn6p8JXql+kvIXmxUKyMgz+r5fhy6JC9ArIqn?=
 =?us-ascii?Q?BsMvRQEk1v7TTxo6bOC8wHxzZ2pFOvGJHRZ10S6+uD6se/yO8loF2dAETz4/?=
 =?us-ascii?Q?GDvDodPaOfJ6kZdsdrn+pkVOSnbItXY4cWH5XXBJVN87Nl5NU1qfQES0AixQ?=
 =?us-ascii?Q?9qnHVEUoPPVpeWInSfSUUP60+yDOZuCV1HW16NiS9cMbmaIiZGOSx/xRnReo?=
 =?us-ascii?Q?mVZ59gUkoWcXdwNoDwWZh1ZnRTfWL5dG5TuaXyz+zup4ZvGXUp0uvyW3rQ4K?=
 =?us-ascii?Q?D3IYLQpTgrsR6f9VO9D7raSZD1XkQuIP67n/xckNwgWc6GJPEbgDq2AbZCQq?=
 =?us-ascii?Q?Wm5pnuvLfGNPYvhkfuMKnVGr8Xnxc5jXJNxuhm5WIDsDaQMI5HHrUpzOZ1UE?=
 =?us-ascii?Q?nnq5uYPfAwG44K5tjHROKcF7W5ONlhaTKGSJkc9KT0vpNH6mJv43RxcUqdeC?=
 =?us-ascii?Q?iVuJ0EedA4ESr2MIZWw5HY5mkt+WXjpXuwn9jcaFs5co+9V3F4/ruXJHCeYT?=
 =?us-ascii?Q?cn06ap2eher1QCuXVaMqfU2DKnUqZkzGIt5xWf2wMktNp25o5Zjgq9QPiY4e?=
 =?us-ascii?Q?e+U9VOzXjfh85kZElod73jcy1rtqU3cgqc5Z7PhYVn1qtDIdK4L4mm3XlGHH?=
 =?us-ascii?Q?VJLLpV2SOY11piyXQivOMb2HCwx00FEEINc5r6+bvPqJOSm13loQkBLdJbMR?=
 =?us-ascii?Q?NndBv4Tr8OtgoDYQuhiBE9L/RkonXuTot0Bv2PCHiTq3EsPAaG9Kd7ovmD6t?=
 =?us-ascii?Q?EMhvwW8SchBfP3Qa6KKwvrBHvVfj8FfwN0xq1ZqJIyKRJoNUWYy7l7/37Uvu?=
 =?us-ascii?Q?UQ9mf03p8za1OF6/VvuJpAIJ367146g0jRaGIOEJhvLLKZ3jgUkNFRZnDm6v?=
 =?us-ascii?Q?03/JTi4Y+jn/41yaD9ua1yGIl2Q9rEaQwFP0hhYWUVCj0ledMuZZEdfTIkik?=
 =?us-ascii?Q?+UUG8bj8TMU9qGq+/iMKSLcfSENMgzC5ekYKfgsyrHCyxPn8i2eWcGedE5Zb?=
 =?us-ascii?Q?ni+hS2IpXf1+GTF8M7GgH/7qbZaiHA2UUmQqOvEW0CGVConxyeMCednmP6Ce?=
 =?us-ascii?Q?kmzdRXe1Sf9vTC8ndmaOeeFZzxPRweTgLGMvulTgS/l/QRkFK7ytsAIMSZfV?=
 =?us-ascii?Q?qOxWIIG94SQ7Qkdt4uzUcLRTRXBs5dWp+t1EbP60J9Ae0HpZPnJ2+jK1k3CB?=
 =?us-ascii?Q?oNhMA0H+uS2pveQsoC2F9og1qsEDp+DrtMqx6t8R7uWTfwiJP+x9eX/+HUf9?=
 =?us-ascii?Q?sJ0Ko/DtccY6HBsn/ojPKpeOBDHk2mpyFr/Xvr11?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c555051f-99d7-44d1-0b0c-08dcc67c9421
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 09:42:34.4664
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iFv0Tb7jGbQJrKijrC44IYOWk2Qfl7QpEPAaQeeEnPWzBaXKVJjnX7Fz3NUAE+uydKyUqnyrAAlZgjVxEprtew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5734

Convert devm_clk_get(), clk_prepare_enable() to a single
call to devm_clk_get_enabled(), as this is exactly
what this function does.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 drivers/net/dsa/rzn1_a5psw.c | 22 ++++------------------
 1 file changed, 4 insertions(+), 18 deletions(-)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index 92e032972b34..9627c6550a93 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -1228,35 +1228,27 @@ static int a5psw_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	a5psw->hclk = devm_clk_get(dev, "hclk");
+	a5psw->hclk = devm_clk_get_enabled(dev, "hclk");
 	if (IS_ERR(a5psw->hclk)) {
 		dev_err(dev, "failed get hclk clock\n");
 		ret = PTR_ERR(a5psw->hclk);
 		goto free_pcs;
 	}
 
-	a5psw->clk = devm_clk_get(dev, "clk");
+	a5psw->clk = devm_clk_get_enabled(dev, "clk");
 	if (IS_ERR(a5psw->clk)) {
 		dev_err(dev, "failed get clk_switch clock\n");
 		ret = PTR_ERR(a5psw->clk);
 		goto free_pcs;
 	}
 
-	ret = clk_prepare_enable(a5psw->clk);
-	if (ret)
-		goto free_pcs;
-
-	ret = clk_prepare_enable(a5psw->hclk);
-	if (ret)
-		goto clk_disable;
-
 	mdio = of_get_child_by_name(dev->of_node, "mdio");
 	if (of_device_is_available(mdio)) {
 		ret = a5psw_probe_mdio(a5psw, mdio);
 		if (ret) {
 			of_node_put(mdio);
 			dev_err(dev, "Failed to register MDIO: %d\n", ret);
-			goto hclk_disable;
+			goto free_pcs;
 		}
 	}
 
@@ -1272,15 +1264,11 @@ static int a5psw_probe(struct platform_device *pdev)
 	ret = dsa_register_switch(ds);
 	if (ret) {
 		dev_err(dev, "Failed to register DSA switch: %d\n", ret);
-		goto hclk_disable;
+		goto free_pcs;
 	}
 
 	return 0;
 
-hclk_disable:
-	clk_disable_unprepare(a5psw->hclk);
-clk_disable:
-	clk_disable_unprepare(a5psw->clk);
 free_pcs:
 	a5psw_pcs_free(a5psw);
 
@@ -1296,8 +1284,6 @@ static void a5psw_remove(struct platform_device *pdev)
 
 	dsa_unregister_switch(&a5psw->ds);
 	a5psw_pcs_free(a5psw);
-	clk_disable_unprepare(a5psw->hclk);
-	clk_disable_unprepare(a5psw->clk);
 }
 
 static void a5psw_shutdown(struct platform_device *pdev)
-- 
2.39.0


