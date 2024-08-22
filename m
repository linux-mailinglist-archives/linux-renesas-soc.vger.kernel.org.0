Return-Path: <linux-renesas-soc+bounces-7997-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E7695B08E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 10:34:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 965E6284976
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 08:34:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6C88180A76;
	Thu, 22 Aug 2024 08:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="SKE6eWgx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2043.outbound.protection.outlook.com [40.107.215.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F316E178398;
	Thu, 22 Aug 2024 08:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724315587; cv=fail; b=QbSZFFvwxBJGke//rb9dmuQSsu3pUDSvzSSm4H6cWPirBwN74PoEJVyRGacF+j5n5mj4ySfUoJzrwnT3OXQeUSLGs6Ag/2unW8y7pZ+RkdpDanVrKmb8WvrYKjAkDHEphjAE0E9fQtsmQiwKf1zwC7Vcduu4t9z0F9pLLvAyusk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724315587; c=relaxed/simple;
	bh=Y+fmIwBxvWxyVZfdxqKdvMSpZL8fqWlU3Zglug5ZJws=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gBBqrOoh0x2m8HRvdEXU6Xvc/zql/Vq57ptPmVb0fKYiVQaDpf9bwTmjO1ozUBRXfP9ypSxy7PHOcekzcqgNheu/T9Pn3GC9mH1WJ8y4oWK8erdBbnXG/2hOaoLRyUQSQUiXzY1VAW8VWtavzF80fVBUqT0/wdQCXaKLyTPhuCA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=SKE6eWgx; arc=fail smtp.client-ip=40.107.215.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vkZJbXSvtj43hO6sTOsnpVPef303BQyqumIDhMCmCFTEBW649ezAkvPYo4/dlIUm/6ImQNawsMbMzcAb25zNINV0cKaXi6jPzSmHa9B0rVz5qW2mNCsEjwP+4h89XH54rgAE0gfOypaiy77y3Pzmawtpy/MOwMHW9G4C/ACcQNnHt3koIxjWQi0GMzOBIPBYcuMAOxF8NnSC+FhpBMniPSxPUgVbiL4E7pBEjSIXW8Jl7rPQop9EMXRFU+ZhoC4mPORIF69bX8cl83W8vE+GgpUCfgARWHvE7TLY+84i9vFhem/5pA0gRtwdrBTS2PGfg1V4VNyTkDoHLoGxdJnimQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nuUwMHlqNd7/NeaZphBJIEMMm/qXldl22uDXxOIGaM8=;
 b=IV2FQLxBIlIKY82+sdONMksze4zR/KZIns5j/nBBsRUNkRPK9A2rps18uy7iHJFPR7exvJvzcg1A34cviSxwU/3k3TmVVeD3sloTUOvp6bFqiMPv3oRm9ul4pBwtcJ7l2WLhc4SC1/Y7nH+G2uI+6eRSM0lnUo+IhWN1tmlUiFTr6UGuQBB5oAHyoSlUqxIcguNWJxXboFeCvFIYDq6f0quICrNiLHyxmoy6G3RvtQ5l1eRtROJ7oD1OauXAkhaEJcVXlULdnoWx5qjw+fMcMh7EDYxWbEy+ROW5nKWDxaFGjY6ZmHqmTap8uOsbBoVkpYwLvssND6etNErIB6uVdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nuUwMHlqNd7/NeaZphBJIEMMm/qXldl22uDXxOIGaM8=;
 b=SKE6eWgxj0/yHpDFPscnId+SUvpKXHYnzQleSB448s37019oiDdENrdLPyLlnnjNUoNStIOoCJOgSaNAKF3XCIHFRoblYFS7aThn/fY7Q6Ef1ud7u3NQ5mlsGYRxTqoMrgBr6edxjOUEf2QzPpb7EclO+MA5apArvfKc1aOyFszNj3nawnIrANkARJRkuDg45B7LCZiuDsRKgfHjN/TdPbmBO/KSLMW1zCJGcjdYDY8U78AtZYXKjeI8x2spYuXttpFeq5H4WUjDcCpauoFyzyIkD3e/jN57ofXmU8d2CUsPjBLB69ihed86PnLjMcLb+UphL0veMGIl72xKnCY/Dw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB5275.apcprd06.prod.outlook.com (2603:1096:400:1f5::6)
 by TYZPR06MB6114.apcprd06.prod.outlook.com (2603:1096:400:33f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Thu, 22 Aug
 2024 08:33:02 +0000
Received: from TYZPR06MB5275.apcprd06.prod.outlook.com
 ([fe80::6257:d19:a671:f4f1]) by TYZPR06MB5275.apcprd06.prod.outlook.com
 ([fe80::6257:d19:a671:f4f1%3]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 08:33:02 +0000
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
	justinstitt@google.com,
	kees@kernel.org,
	u.kleine-koenig@pengutronix.de,
	jacob.e.keller@intel.com,
	horms@kernel.org,
	shannon.nelson@amd.com
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Yangtao Li <frank.li@vivo.com>
Subject: [net-next 5/9] net: dsa: rzn1_a5psw: Convert to devm_clk_get_enabled()
Date: Thu, 22 Aug 2024 02:47:29 -0600
Message-Id: <20240822084733.1599295-6-frank.li@vivo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240822084733.1599295-1-frank.li@vivo.com>
References: <20240822084733.1599295-1-frank.li@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0005.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::17)
 To TYZPR06MB5275.apcprd06.prod.outlook.com (2603:1096:400:1f5::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB5275:EE_|TYZPR06MB6114:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dccaf44-869a-4d6b-f30c-08dcc285092a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QCEM71hRPydy4/SdvSfjOx59gvJMThQ3VqBad/QU/i0zZqCeBuyzqqPnIrk7?=
 =?us-ascii?Q?dfWCo53aoppoC12TRaWLYo/dCwyg43PTRoIqi4ZkbdaR49Bl0Cned9iwzl5y?=
 =?us-ascii?Q?RCE8CnLQG53N7PlHOwZgJhTYfKcsCn3/sGcrI/4uvcoGoogl0lwnbjU6uoMX?=
 =?us-ascii?Q?tzdQ475WQN1yHhKZMk1ks3nFktdqwT6xK0wblRG5zCI62VXqOklz/rTHgfCQ?=
 =?us-ascii?Q?GQJ8v7M1iH+Zai2EkRtT730T9Pb2SKq4HpN3mcWKvwJ0rDKY0A0hv4HJfF7I?=
 =?us-ascii?Q?af66Aasf00X/e7qSOmJBPzUANk5+4Nz1zNKJIdTTx8WqbITBe/J2cp2uUac4?=
 =?us-ascii?Q?lbMdPfGzUHe+zVIhLLh8DCr7olFrBMSVT5V3xx6ee1mZr+Uj7/Y403DOSqEI?=
 =?us-ascii?Q?SeHJymPPbx+DdafsjuEWi6qonDTlKO5OvRs45DlVMg9J1f22L7+oUIfmX24n?=
 =?us-ascii?Q?coyJ4BTP5qDhzj3OuDnRNk6X4kEA34NiG6RXc7kJDyn/Sqf0HvyBOoTGFzDa?=
 =?us-ascii?Q?tfwiDP7/lE6NkMarP5BJiTuisXfLGa3EVt9EmB4zuctuLgMifr5CwqMqQ/Ss?=
 =?us-ascii?Q?5mPmTZaE0ZyKKfgxlaZlUjscjf567rYn+uo93xRonmnQbAOG2hRgQiyTihzc?=
 =?us-ascii?Q?4fYZVz2vgmV3AOLcBrVJqMvuseVgPEpFUyGTdWr/fHqhCq+ELOQ5jAfbdjQM?=
 =?us-ascii?Q?QrrYJn0NfGPAB/ghETcxNkJQDFw+RZkXxygPQiZZNTfRd5qTwq3iqYigfr8R?=
 =?us-ascii?Q?DvMmYZKcCDr6AsJp7TOZa/v2knKzZf02m0nY7wEQONmgwJ9IhV5mHDHp38z1?=
 =?us-ascii?Q?SrkBPFeaBxfrQEeiWtfvglCgSCs4Grc1c9YLU6KjL0uNuBUDW/kyVEUUGPAW?=
 =?us-ascii?Q?QiJAMMKqw6d8eoD4RsZiV73rIjfMjHUCTD8g/MAtXY8xdjAw9taDg4YKcYty?=
 =?us-ascii?Q?Kcw8jFSjKsLQvTTeXDyurUVUdysA8T7jBVOHw2YCrOAMOm0KrXgyVEo2gp+y?=
 =?us-ascii?Q?bkhD3c4mdDJJkAqSviB8vtByR5Ex/KSxPBryng+O89hNqfGA+b/S1MZLcYEC?=
 =?us-ascii?Q?05/5jyPTS7zTodkKc7EYE5tXp38XhBbffpyFeExfIhxfQ7t3Wc94jWmalvDR?=
 =?us-ascii?Q?7MS/BwyBnrxm0m3jdRXkZ2hcIJVg86eaY0/pIL80Q1uheg0AoKABOo50iMg6?=
 =?us-ascii?Q?sfLE83o1nN/rf3QNwzbWE+JKTCxHve/eBU6Tcie4q2Q9P7vs6QEh3tG8Sudr?=
 =?us-ascii?Q?XX2o0DIdMbQfV3tFI8shRXUcPc/iShb86UUPZor1vvaOaN+rXKztSKLpimyK?=
 =?us-ascii?Q?ndOSadkkY0eJihQWJu2nkYzGtXz0yWFWSG4HGa1ab1zTurthhKidbEGIULA2?=
 =?us-ascii?Q?ufFFYCoWyoUVkJX739Msp/ZNQGJqMoOpdO0/CrqpEw6ZpjQ/zy0TcCJqZtQy?=
 =?us-ascii?Q?h6L0QJagQbI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB5275.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7PFKZ3wbnFow+Spj7hc+880vDZh9oyRarni4jY1fLFbtgGaCFWSy7n4TCnlg?=
 =?us-ascii?Q?xBS+Qum72x8Zl1rqTXIjbCQBj2IK5LqUA2tObMoj6BD0WBTurLtOxdQ2OnyP?=
 =?us-ascii?Q?XZqlu87CsK6V+OH0OCsz20FasH1fwKN83UGGz5cLoI/wCEm4khKtbIDUvyw4?=
 =?us-ascii?Q?cBi57En/8zKKu7QKf8gVs3uDGA8G9+vYL0RLMSrj4b91VmfSfQN2u68i+gGe?=
 =?us-ascii?Q?6dVldw3jkoUvx4kBhJkFwkqnTJaSjMat/77QkvZ2rfiqfyTCJNuWyYzNZuNY?=
 =?us-ascii?Q?JGRtlTejbwDLI8wlnwkVBN0LxEUEEElNJWN7q6HpHbs+g4LTMTyqBvep8Suv?=
 =?us-ascii?Q?BBs+8BevaT+rynp2mbwlx40X8Ykx4WjLQL4H6mXRCQ6R01Cbjgyzw3ah3QW3?=
 =?us-ascii?Q?0QkGdVLBJ/xTFGgBZwOxoFx1rUMADIddc0PQIwl8cJ0sVA/nPYa20jdZ++ub?=
 =?us-ascii?Q?G8ynne4mgysa7R04ERw3J7OXF+dQMrmRm+W2EuDDiWKlD/8Dkz8FjWpgJJeK?=
 =?us-ascii?Q?sBe/BW6RiwKXfM1hfwtpxf+TogIaCZKcN1cw2LdcvEPkVR0yFV4fFbnXH2o8?=
 =?us-ascii?Q?+bEfpmc40Alm5flpheoBQI+V0Ke1yhqS9Z08WtcmbQHBRG5BRiJizu/r1pJT?=
 =?us-ascii?Q?wVdm7urpPH11YMr9gRrEGPvsCVsxxNZFeYDKFyQWlxHGd/p4pUYF4l+80Rt6?=
 =?us-ascii?Q?+9nQRZocKKdKjGt0Q5s094VhbQsaXOhu9cKvyq3mRaXGKD+i7yEulBnDw7s6?=
 =?us-ascii?Q?5z8t/O23a9ySWQgbhFwd5R08dGQ2aKoECt1x9bwVZeNraJ6KYSfLiJ3oehc3?=
 =?us-ascii?Q?I2gUXHFBdavbQcE7hwsunrstPbS33DtlkrXKBa4Pa1MDadjvqsQ55yQHrVT7?=
 =?us-ascii?Q?0dAgjHnaQ/MrazPmUBg89SjR18g3ltaAiW5hwaDDJg6w1BfxL7j+m/1jaKdQ?=
 =?us-ascii?Q?y+Wp4RiIbvTREVuUH7DJQaIq3v2eWXCCcHM7ODZT0Cb/mhyYYxF0P8LicR3e?=
 =?us-ascii?Q?OK/FalI35zFksUKa2rfnXYXvNHwmqWMSS5lLm2pLFGukgCUzSWJ+41r9GbjS?=
 =?us-ascii?Q?zufNneodPeMC9hyjr38PAK7riZzYW1DWSgHYVVCKm3/7symdd47GYKZ89WZ3?=
 =?us-ascii?Q?jsp5YbfSQNutCf66OmtG8oGTmr/PG2YTbJthiLdapZ3OwPobt20gHN2TMqEU?=
 =?us-ascii?Q?CIL05bgzx7mKSgsJEpWKDJzerZXzfXhgvtcEzSYtGS3aTwhMoeYhsezM0Xce?=
 =?us-ascii?Q?rjGyMKBL1ipT0ZzvoxnvafDqt9kaOoEO8CaOj1PE8nzgB8dUP7DVmai59dkE?=
 =?us-ascii?Q?qeL6RguNqrmcYpsWreUUgmqK9uciDpVkjzVpibkF629JhlA1v2YWOyeXIS59?=
 =?us-ascii?Q?UI+WxeuJe0s7Ta72nc2fRNPNshP/yCrk+bYR2DOvi2hSOHOC1PrlTtIGlVB9?=
 =?us-ascii?Q?8q64zy+Z+Xefw5F30k1Rs0lxD6aOClhqj7yBR12DF6cnBcGeoQhw+AHYJWU8?=
 =?us-ascii?Q?LBaFmD1JOwigevGE8dObUvMSa9LN6GWgDJo60pX5WH7LLqzWr6Dby/eqPGv8?=
 =?us-ascii?Q?s04xMdc1w37Fx9joNTreZEGcwgMKe8bCyXUW1F/K?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dccaf44-869a-4d6b-f30c-08dcc285092a
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5275.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 08:33:02.1218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mQLUi3ISXdrfwqgJ+nSN3jjLQbLFvtYs4pE6lpSNxM7YhMVSYWnuWzQiAgergJlOXIYTJvbOvQnMWcmu8daKsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6114

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


