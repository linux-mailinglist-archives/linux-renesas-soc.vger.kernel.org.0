Return-Path: <linux-renesas-soc+bounces-8098-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7153A95C617
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 09:06:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A22DFB250A0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 07:06:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3294137750;
	Fri, 23 Aug 2024 07:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="mJDjc6pZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2069.outbound.protection.outlook.com [40.107.215.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3448B17984;
	Fri, 23 Aug 2024 07:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724396790; cv=fail; b=r9N60iWAj1X0WnBuqsm/ZA2UmsKaX4Wu7Cl6Yk7uxKBUERVwxSZd08coUWymy3BPP+GJc4XhS6VY7K+S3DmTOeVyZPxLeWfodhivzMSMjQRK252kPBbbeIpW1A8Nc4qVjTOVKI8+v5Riq5eEeKTUNO80m7ktl6iYkcCWb7/XLo4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724396790; c=relaxed/simple;
	bh=asRxJ/aPHZ/SLUY7esKjCrbIBeDowKUcbwNvnNKk7x8=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=DJttM/LchbyVy3hi57s2yKLnQHxf06+KJMhIkjbOQOz5bSX6STk74XdtXaqKxc5YWDL5Pg3qh436lOto7QPVBq9rhmYf5mfW49vsjitY112ATVSeUvnILxJW5ILLWJUGXf1jY7CbD6JDNe++ckid/SPiXTIg+nyfXxvLEQdOe60=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=mJDjc6pZ; arc=fail smtp.client-ip=40.107.215.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BkCzpLrxjui/TUoPM6sqob5Y/RYoSYdixyp0twGFR5npAsyCUu8q3qFBamQ5R4rBrE9kyKYdcbWWW+ySIHClD3BPWE83x4TVVvMv9XaWKszjkNpPtiqGxZ34aTu4ym/2hHWSegRWI3XkRI3xPtAc2JoaS2txZW0GXnimrr/wZx9JCuGCGkcIKv9ANZ0E3Rbnbf1nAt+dhYg5PW2F5lJHxKf9lUzhTFEZK6zhmxln/mUJLK9SiroJfJqWNXnqvoa6Nj+c0diMGJ0hTrAra7znXXRf2AwMoKrSq6gbN2tjnO5h7nxL5ee0bhrGWg6GjAOpNGpHN5ubygEKbWVAL+iVGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AgczreFaTlZ05Edzs4X9HtKPrecgOyl6ov4q6TvkL0E=;
 b=Jw/eOiJs5A7KrIyCXQsjLB0UG8L1UuyHYXggfNPD60hrCNNveCocou/TpkokaRv5pXVNabrxANYmYHswRjmGH5U6FoOfjJe4d5ETc6FRtBIljXTZ+IOuHs99d+pH3cR0V+2hTCuZd3VI/cabE1qka6dD/tl8ZKtEF+HHWZkmhxexE/xFj3pO4zOCGOukoM4pXGMBMBQlk2lpY1V7swJsIgyjRbQjqhGtdLybtMcrZIkLsnq5TUH+o0CFdBN46n8ZCPQk+58kR7PY6fKfyj1H930he/hUdJLzVZm+mB2Ak3EWs1wYYN6cep9K8vgsgcYWlq60tACpu9f/3X+HhERRUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AgczreFaTlZ05Edzs4X9HtKPrecgOyl6ov4q6TvkL0E=;
 b=mJDjc6pZ+sUgauGOClwPbiAWz5n3XCC+KDZC8te/bhsP51oq3l/qUj6urSAmyzjkNxnXzt92kNPRjL7slvzkXdpwiVXdegA3L93z8poqnGLXUpAaapptqA2d12seNpFBlPwE37SQDJGEe0U46sUsub5pZ7iNpwjaXwgoxch6HCIrf5nSqwrIfW46gCLsnB5lM7P3X2D5uE3xt8UNgOF1CS2MNeAud7rJC3yzBd/4lSwJgGsAps47wdBy5XTf+6/ERKSqwtn6htAUdnwgEyNPPRFsYAd5B3Zi7K1TRxFdo1A0OMzjuf0wP2iuWya/MgyWNoIzSfGQz357vtXbMZuj7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEYPR06MB7069.apcprd06.prod.outlook.com (2603:1096:101:1d6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Fri, 23 Aug
 2024 07:06:25 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::8c74:6703:81f7:9535]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::8c74:6703:81f7:9535%7]) with mapi id 15.20.7875.023; Fri, 23 Aug 2024
 07:06:25 +0000
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
Subject: [net-next v2 0/9] net: convert to devm_clk_get_enabled() and devm_clk_get_optional_enabled()
Date: Fri, 23 Aug 2024 01:21:12 -0600
Message-Id: <20240823072122.2053401-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-Office365-Filtering-Correlation-Id: e10b619b-bcdf-4542-d994-08dcc3421a15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7VZuJxNQWessU5jfLriES41IvTEs77lmgGNNYmzIGSI3HCwzLdJ6kq73ZV4D?=
 =?us-ascii?Q?hNW0yD4aB+LHyoto9E4FhldMYUeDweo4MluL5kKWGXaRfwcbbyFH9BctSXoG?=
 =?us-ascii?Q?BmWGhS3RE70VZSuMj9jJB5sDh8vTf9cnVKaCcdUJAqToBrudm485HDpavEMQ?=
 =?us-ascii?Q?JocaTCR02ZThcic94RClxnWTIUFbT6PdupEKw6SEk1UZpGGFj20G774HCuxg?=
 =?us-ascii?Q?OA/R3cgxKyJ7K5nZ0El/nWn33H5ONvbxGW9WoN+a7fRrXB9Au2QTLo8PR7/d?=
 =?us-ascii?Q?UuJHAHR+w+J60hy7Zq7heJdWAgbtNqvGKc8YbCb3vRsbyp/Up0t8Bl8V2Nel?=
 =?us-ascii?Q?YtEsM/h4w3/xfygWcbgcXV7m0CW7Wn56sVoX5M9FtmOYhpLZQ5nK1/aSZ8So?=
 =?us-ascii?Q?dlKk8SnRjqrsbTwo7pOQMWNZnAZcwzi3CCG4T+LL3WB2pyDDsvIsq1mFVGN9?=
 =?us-ascii?Q?e4TebX17r1NZW8EiQ+6Cpu8cfV5mtPWFKtuqVDWvE8e5tAH2zLMTw93mnqGL?=
 =?us-ascii?Q?khLO4fKfRwzeSoBDGiz6e+5b8LR8TAYvbTRkrsCCxaiyquxcm88kwSZ5SSnt?=
 =?us-ascii?Q?onOYsZXP+MPINgkTQjdpKbxQ/vX/N+IuatJ0mvEV9YErNj8bZYpyiMh0LzZ6?=
 =?us-ascii?Q?kaO5EZUZ753h7lVXJbzgoOb3PEB5k4skhul9qoeN03hbZFZTAGRHqWDpHEbe?=
 =?us-ascii?Q?cxKijKT9bqTrhH5bfLpCunVM+iB1m7cV6iXfQPnVbm5259fdSxJYTvu+Ba2F?=
 =?us-ascii?Q?5BN0JcpX4+N0N99nduAGn34LYjwD79/SblApxbvay+6MixcN2bHTvsPToOvF?=
 =?us-ascii?Q?349tIbzR2X5S47AZ6lKHczxebQ+sGhgG21GwLk76txOXBhlcZBjFLICwVQup?=
 =?us-ascii?Q?vaz2eKAHcMuq7iOTpgEEP8SOIBGF1Q55Vc43Vs8GTsMKVWxqlCb7arYOAXUc?=
 =?us-ascii?Q?HLr36530DnQptXpnTywYMErhVnqw0rloet+1uEL5TWGB7LPhze4U7xQqii+n?=
 =?us-ascii?Q?P4Dqjhg47cNXuM7J4Q6Rn3YeMxbObRwmEYs8LTjUR3irZOK0PFzi+A/jZJY3?=
 =?us-ascii?Q?2419R5CXx+rWGOGEwWso+w3vET96LrxZfNRrr68UmKPMorHLxriSS8ekXlh5?=
 =?us-ascii?Q?kDFM2ThCL8xrhlg19EC+fmvpgam3N4i7PPHlDZWp3ZMjSJHVhNVWSAeG9khC?=
 =?us-ascii?Q?Y71AF9UI93YdUgsvd0qYVZ2n20pQEgGDW+CdkVha4asHNnBC/hJfUx1BC3sU?=
 =?us-ascii?Q?NeM0rxjhF5sEhNMecJfasW6EQl3zj0DqUi+2voogG04NZOnLkPC1WEz+Jpei?=
 =?us-ascii?Q?dxt7zxJQKqKi3SruAS5xpZXPHHjOmqPPg1tXX3pvNFyk8PVsm+xKoVyS9btG?=
 =?us-ascii?Q?D8QPQAFWmsc5/06pL1d3lJJdMkbxZA0SjQEt1sbTtcJJHAJPfhUG7SW7Vm2x?=
 =?us-ascii?Q?wJjBGRW3yJY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Y/f28p22y6Q4+XIPumoTcs501wgcZI2uzJ4paXny7zd/Nj8xN9kp+AEc84g5?=
 =?us-ascii?Q?LEQHo7sDZ+DPgm5NqLSulAQYiTnScmDlb9OPcyEjZ/VrrsIn+5QQVNKift/B?=
 =?us-ascii?Q?65kT7LiD26EK8ga/9kTwoA830p0NT1faL4pOfXF03jJBu2Jm4mzYgVyj9jqM?=
 =?us-ascii?Q?UYt1l0SLZ4IhXdTzLEyl2uundoWUbcQWuu4glL5g+vh3iE1ruu3OvwktO6cN?=
 =?us-ascii?Q?mpmXIbZPIhgwhNgKW0liqESyGg8h6Oej5j6IrAU5ANLbPZ+idNOV5COmV9ZT?=
 =?us-ascii?Q?sBBFb6GSl6Pq69FHAxdunKS0leWiw9C4NwXG98WLkrkTZnhftC3/zAvqjbeu?=
 =?us-ascii?Q?BAp5EUEKvN1hMxWndIbbyFAAwHGqDZpqlUUvx3JF+Vmv8hi2mCSvEKkYQuYF?=
 =?us-ascii?Q?VusVqLQeEusuYN8+Bm5KI0B8GgrIE4DnMh+ZF4YURqcbI1aeIdiKmlPwwnmr?=
 =?us-ascii?Q?RNyr6NXQbnDZ7u47MZyrvq20qoG9ovUhYNBicTwdhsUXJp8nWv11uRFjQi/g?=
 =?us-ascii?Q?W2hi/tGHC4nytXcYGiYdqtEWOrMetJxizqHXp5hyev3aNgUQnrK2s3SW9TI4?=
 =?us-ascii?Q?9LCWARvyqkTl0pMLCOri6375S+XKqoXBskG/+SQd1W9okbfitVqUVTQ2OgsT?=
 =?us-ascii?Q?pfDrDbwG4qmWvMYDw/Spj8Lz84Y7w5iKmdVhjkguHuNFH5gp5qt/jUvHfv1S?=
 =?us-ascii?Q?YvAAxcAeEobEaYfIvxsggFrcUaYjxbVeVVnz5bZbtnK2q5yp4PYe/wNfU96+?=
 =?us-ascii?Q?UeUHM4ZckfOnVioiVmVN4ZJZiWkAsqQvK6vyUJjXXRIvYKYQIrpBWpmMPACx?=
 =?us-ascii?Q?G43sFHuebvK8iayTLo9/Ssd7ToM/xycZH5SCmRxFgCHd0qkcr1XLLM9SEez0?=
 =?us-ascii?Q?DIhlXzTy5YQ0uUZzLF3YaUH5kaALG5c7qrvrb4lFguxr6IjUD9qxcjnNRCdW?=
 =?us-ascii?Q?7o5Gq9J621tREmJpljw+4JfxfwT54nF39jsJm6LLu/L54zlbaFMfppGl5JFh?=
 =?us-ascii?Q?PozerKDMZvNf90vba2Jmyxgt9psJ3NCUzvpEQ9eaSWyi/e7uckU5fhXQgqoq?=
 =?us-ascii?Q?+wyRsOx/Jk7vy11umNtFYt9KXDZMOHILQ6pxF8iSKT7zVCaF7OQapLR7omng?=
 =?us-ascii?Q?P4QPhW/8UCTp2JDffpLYd5lG+6LKotneuD9X7oTgk+Nik8KTdLbwPtFmkLmE?=
 =?us-ascii?Q?/SF4mun1Mgn4tyT0zVvSsVUQTeNU/v3VFmFN1PEzMOMuGrKUr9ZLixrRza5B?=
 =?us-ascii?Q?tw4F8mrnNyvH8CiUpRw5kh1irhVAJfT2DigLWXZr4T42Q9m2HSYjDwVlPijD?=
 =?us-ascii?Q?YHevcHetGmeY8dW2A3ZPgHasTn+7jlZUiPOjByf8WXemDR+LDdc2SDRtij+3?=
 =?us-ascii?Q?NgFpZ+xZGLpVokT6MjFQlElTZDvqo5jOT66QDOypSYxIppihwsEo1EjjPffW?=
 =?us-ascii?Q?u2znr69W5rT9el8kt9FpH3/6vbqM/HD8+C+UoEKeyPSGRjHWQkjR4PgN2Nut?=
 =?us-ascii?Q?IX5s3VfpzNng9eg1Sra1MbuWvT24Q8oOdY8gKih55yfb+4NYV1Fkv8q6IWhw?=
 =?us-ascii?Q?KKLCth0xUhDrm77mvdS+W7OM1v+D/k6F4+7lMpuk?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e10b619b-bcdf-4542-d994-08dcc3421a15
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 07:06:25.5157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cZXy/5FD6ifmSqsQAm+Q1JffkyBHtlgqpQ/e8b2ruKebo26gxU0BZDwHzAVLnYNh91tnPc7BTNXigaVLnV1Yhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB7069

This patchset simplify code w/ devm_clk_get*_enabled() API.

v2:
-remove unused 'ret'
-fix incompatible-pointer-types
-get rid of amount of variables used

Yangtao Li (9):
  net: stmmac: dwmac-intel-plat: Convert to devm_clk_get_enabled()
  net: stmmac: platform: Convert to devm_clk_get_enabled() and
    devm_clk_get_optional_enabled()
  net: ethernet: cortina: Convert to devm_clk_get_enabled()
  net: mdio: hisi-femac: Convert to devm_clk_get_enabled()
  net: dsa: rzn1_a5psw: Convert to devm_clk_get_enabled()
  net: ethernet: broadcom: bcm63xx_enet: Convert to
    devm_clk_get_enabled()
  net: ethernet: marvell: mvneta: Convert to devm_clk_get_enabled()
  net: mvpp2: Convert to devm_clk_get_enabled() and
    devm_clk_get_optional_enabled()
  net: marvell: pxa168_eth: Convert to devm_clk_get_enabled()

 drivers/net/dsa/rzn1_a5psw.c                  | 22 +----
 drivers/net/ethernet/broadcom/bcm63xx_enet.c  | 47 +++-------
 drivers/net/ethernet/broadcom/bcm63xx_enet.h  |  6 --
 drivers/net/ethernet/cortina/gemini.c         | 25 ++----
 drivers/net/ethernet/marvell/mvneta_bm.c      | 16 ++--
 drivers/net/ethernet/marvell/mvneta_bm.h      |  1 -
 drivers/net/ethernet/marvell/mvpp2/mvpp2.h    |  7 --
 .../net/ethernet/marvell/mvpp2/mvpp2_main.c   | 89 +++++--------------
 drivers/net/ethernet/marvell/pxa168_eth.c     | 17 +---
 .../stmicro/stmmac/dwmac-intel-plat.c         | 11 +--
 .../ethernet/stmicro/stmmac/stmmac_platform.c | 35 ++------
 drivers/net/mdio/mdio-hisi-femac.c            | 18 ++--
 12 files changed, 73 insertions(+), 221 deletions(-)

-- 
2.39.0


