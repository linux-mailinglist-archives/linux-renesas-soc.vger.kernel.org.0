Return-Path: <linux-renesas-soc+bounces-24382-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2141BC4679E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 13:09:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0376A4E8D23
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 12:09:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9CF230F931;
	Mon, 10 Nov 2025 12:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Bn0O5PmG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011013.outbound.protection.outlook.com [40.107.74.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7697B30CDA5;
	Mon, 10 Nov 2025 12:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762776556; cv=fail; b=si7i3fRriqXJx0OGpC+/KS7IQmJL2eo0Tj98I8mFp1TU1UJQNORd7Cm8eHtf8ENcJLDoe3IxWbAb9HYvLGXX9aq8nvqsYvq36dIRCJ5YVvb1gcL1ypvq8QCGDtpzmjGIlbEmOKq+8DtvtN3p6qgIyK/jGw/G89S+WUOyrCM//6s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762776556; c=relaxed/simple;
	bh=gyZ2o9tbRe75mZgdRWvdwuLGTdqE8zZxPzeKrPd9918=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DMSc4gMBvrN7YFXcTigaXwyetOiE9QCYnz49xZfpvGPqvV49f9HI3fbzC5TKwEaSfoaOII+rFW0bS7lXYBNo9KHEDYp62jOLnOGfLwvXUsLlUvZ2vK4VtMiJ4j968TuqaQMgxZ0Fi0GjnWxtpLCPdX7POZAG9rkqSS4oJSQsuSs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Bn0O5PmG; arc=fail smtp.client-ip=40.107.74.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MPzRQvPIucSUYDQNr1ZVL6dOqOPzKKsUNbytJuNX1SXCb5zjiaC7miSZcUhJAHaV6xa66GXTOr5qHk4CkoWPjotkj9RxZ7CwJHoRPfcFUwwl67YCBnV63tRhLqmHEzpr+purDmNQwV6p182ZaZ8cETLnFqN7hvDvnuOx5gwqr6OkqLXLHnynqzueJBxyXcWtV6mXsdCWWDzIRq7wt3te1xTvxuoS2KP/6q6Q3qCr+NHp/mtqnCpQP/cI08IOrwv8n40p6hSF14I/eUNZeSuwxwjBt9Hn9y4eHyeoPXzKeKb5tyb3LAzP/rTOMYFuC6YWOmlIas6Xc6GMI/v2HotC/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cxAhDQbK5doIDoH0jTKKmHOyujDTI/cGA6xyEdxtXJA=;
 b=gV4CVbbC4/dcyiK1qnPNa+rt43roKcUZNOPOcr4bZ3qI1jB1U4X00RzSQSsikh3WBVq3Dw2K1D1eMcsmC6K1Qq8hEzFI+FWUT5skgayjxlnMiVb9tTTUzRN15AcJ4DZb6mYD339gddPdHngjD/oglxuQK8+dn4C1Bz8c4WQ+tqUhDvx3f02zCnALH7Ao7QjMsxYeVhjyCYZkn+sRSvsbFbuq0nhF1i7fdhWb50zWW9fWQQJtm8AyX3zHR0HVbMdndUszIAYWYhfxVLDs7BOAe+XCkoxjIdSjiCU+cFFgGFcu+GNyvwA5lxc/LQ21ZXX9CjLBBhYDg1412XWW8z3rCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cxAhDQbK5doIDoH0jTKKmHOyujDTI/cGA6xyEdxtXJA=;
 b=Bn0O5PmG6UmX2w26Udm0Xo7gBi8w7dzi5OfxrslWdJAMCUyHO1eLpu8VOL5kOHygeHET05jjIFplPwT4NQ/fsz8Ik0u2hwx1rI4rCSVzmFEW90klcKeztLPPEWUA2KJC4cEI/tA8egUOd3Hvrnt82s+2qq1g4VO6LR5x132juD0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSZPR01MB8436.jpnprd01.prod.outlook.com (2603:1096:604:189::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.14; Mon, 10 Nov
 2025 12:09:12 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%6]) with mapi id 15.20.9320.013; Mon, 10 Nov 2025
 12:09:12 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Rosin <peda@axentia.se>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 02/21] phy: renesas: rcar-gen3-usb2: Factor out VBUS control logic
Date: Mon, 10 Nov 2025 13:08:02 +0100
Message-ID: <2959418efb0c2a8d516cebc676fbaf771e9c6931.1762773720.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1762773720.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1762773720.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MR2P264CA0176.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::15)
 To TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSZPR01MB8436:EE_
X-MS-Office365-Filtering-Correlation-Id: 73c458d1-2bbb-4508-cba7-08de2051f57e
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZxeN07p5rF2suqcyKgiW9KqYcdvaXFO29S7XRCafmJOfHD9KDRsB8GNv2zJt?=
 =?us-ascii?Q?FeHlRPJwvLfTlJbzcvGNl2Uz9QuVAaitrJB77+EIa9YUQ0F4YQYXtfYAm3He?=
 =?us-ascii?Q?2cFHUqcHv/Z24Ib/t3YciJ18SIClBVZY+quY9IO2UtOZbXuOa7Cg/Lx+5d2T?=
 =?us-ascii?Q?hitXPqSYHKpZNINiTs0BdKtoq/Jhtt54eIvbD83tAnjHrNrosqxxQatZTW9C?=
 =?us-ascii?Q?OIqnDP/s/l9oenNFMVOYXJBSr8a5dKSUBGSLUXw/r12XioAi6z7ZtWZo9Nue?=
 =?us-ascii?Q?BhVXExdk8idVIm8usyXDzi9dcfaB19se00mr9XSe7BmfCmHYZbSSgP25d8FA?=
 =?us-ascii?Q?TgRuxk0s2b+7yZ9BBFoqEYtTqFiHGgEWDjsTLZAHvF9ZBI8XguifnYtGNeFe?=
 =?us-ascii?Q?eeVSV+nEHGJctZCcsor93IlzTsS/OqTOgMrf42cum4zEcw9Lxi2vy39A2QDz?=
 =?us-ascii?Q?OrcpE1VWAKIclGleSk3KtNJ18X+NhZWwy+nUFAyTZiSXUnoNJP/tQqK5N/FJ?=
 =?us-ascii?Q?UpAn249PuMCY0snEEIuTlelGQZVqC/o0VDBuVcajsBK1dSE/QbS+jv/sBdfq?=
 =?us-ascii?Q?EwpXceMP52oM6rsGmcfQyahVpwf2upMrFc2uJoyvlZPjt9o+oNO1lPAilvil?=
 =?us-ascii?Q?wFWh4kdtS8xXMDE1Uwan8l+RBt/qCizOa7UY93iHKXOaXLWJfDtbTtJ/43mK?=
 =?us-ascii?Q?O7Voz+oV+wI09X2NMFMHMyAS31Ih99Lxlp103aYLxV9vbw/2dD+ywxzvF2mX?=
 =?us-ascii?Q?egknjfIySQ6yLT4BYLUTAAvgViVGh/+HyQCzvBvpYn3KC4HDSA2CdvoKoWTy?=
 =?us-ascii?Q?scMSEiTxZbR1e7frhdD3nvdZ4emvMAHO57lRZeM4tALplXmgOirvONpuHTCO?=
 =?us-ascii?Q?Q9E4VHeWtVgnZz/bm4Apuhak5vr3d6SubJrs3aFJpyS0wXBoyXOyOAFRNj0p?=
 =?us-ascii?Q?X0TnBI0OxMq1hP88eK4jHb/sji5RTV40oTVFpUDI21+JL2igYVp1FZ/4YOSO?=
 =?us-ascii?Q?NbRVm4Z5EotvzP12AyJ+7WOfXV32va2vNKakrUZvrUvaJ7fduOK5PbFQ4iuC?=
 =?us-ascii?Q?wM/J5/j6I5UVzlWMPwMPgPJyLo5l40AViqWEglMlBY0Rsqd+1eYH1ZoLkgnZ?=
 =?us-ascii?Q?cG/G9PPXfDt7tjSGY8YAV0LkevxZKNakoH3kaYe+3JZyqYpTQY8LQVNGoEeR?=
 =?us-ascii?Q?fdg4Fw0YIU78SGMYfXfLv5qVNl1RPVG2NJ22o819BZBxftB6ihFPQteDCVuv?=
 =?us-ascii?Q?Ka1V7huglomktXRixiWUB36es/xtRIduaBGootpxAf94QQX3msvTv63Dzygs?=
 =?us-ascii?Q?eYxvT8EELJP4THvAGXgYnx6Na3nXDdtUekGS38EQqYj78JsE/ONgTpMeGcI7?=
 =?us-ascii?Q?y9WuChHBc+pwWLGedLpkSJxkgjHlHUzyaWY3AZrY76ZT9awIIJJMNjF0q4mC?=
 =?us-ascii?Q?CL0nlaEKL84J/mF4AKOYXSagUk81EOfGkMZft8I6Ur8pbuY5pOZrdeqeCglm?=
 =?us-ascii?Q?Viqq4qi/tSLg6LfG0iCBJjxTSHfAJy/WyC4O?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2LHZuoaqet7lVC4Wtvkge1hV7vUzL1wpQOLiEjHAuSuY/M64AIyfmH9rWQI0?=
 =?us-ascii?Q?jEyGa1bEO7JwyNQ/mFKN4YbIEM37/DGfssxYdhPwiVmrWse3iOCM60aiqXBc?=
 =?us-ascii?Q?pHxcy4OlsB1Gq2jGuove08cwq7C80FtSKrDuDZf6pVJrbtOb1bOg2gdGQOFY?=
 =?us-ascii?Q?0OjU7MHHLvsXYyzamv446YID5qd3T//b6IUF0x+y4we5iEF0KZvkJmt68dkG?=
 =?us-ascii?Q?t3t5JVvPA7Dnd2rVmm82f2Is/V8tZyd8C0+pQgqBES1pmyYdtDaCf7rJ268X?=
 =?us-ascii?Q?t5D53SrvSu0keucH2Z+Ocp1iYyorHppVe4WCcYJUYJbe4N1K4zzxvq5YSj9N?=
 =?us-ascii?Q?9rGdJxMhLGyA7oLZLRP6U/XXonsoMHkDlmP1gP0HCTLLkb46tGGJSdATEboK?=
 =?us-ascii?Q?6phvhHo7dW+kcjrkyFZy/fgIx1lRtnl+W0+0renPuYmpVDN63ZYnEnL7EO51?=
 =?us-ascii?Q?e8vaxsQbr80cUNPDYeKs7L0QFAbIb+UDY0G6PXvyoGNa3H3tp3Xie9Gl4Z5J?=
 =?us-ascii?Q?FlAUNQoWdMH19MKb2P3q+Gx4JdFXXwO7ACz2mtZiABh1XFYdlO155jVisME9?=
 =?us-ascii?Q?CXrMqBuNUT5VKYM9YF+M7IKMyv8XayEXCuXx8kPrWmGLBhYnz7oS31LMoUdb?=
 =?us-ascii?Q?nPzfUeDlzxdd3PGbSpp2y2HqE++vea2MVHvGROvWagdlAsW8LERCbunISDd3?=
 =?us-ascii?Q?tOvlHJyAqrlDRp+DpoC8pNMx1xzp8IhpDZjCPFJ1NXiQD8rzAmWfkaZfp4of?=
 =?us-ascii?Q?hev9a89De3esF48ILhAujkTnHmrToHNGtadbN0cOoZyu6oPE9qIPfhWYzfV+?=
 =?us-ascii?Q?ppyq3cl15+hEX0SjmPTX8AvYWiI2U0MGTieR4Sen0DF48k2P4cPLZFIEP6OO?=
 =?us-ascii?Q?vYE0gmRg5YU55u1Ne5nF0KO05FY79rpMgcy2BoCFbnwjgW6cUQORiMMEhGTe?=
 =?us-ascii?Q?AonB2ZerRADy88zFq3/D6z1GFaNm+MPkJ02yNwyGjOQpj25Svr+1ej89yjJN?=
 =?us-ascii?Q?50VcM0NlyPOcY6mZ6nVz+NW+ao57iGiEroMDBhaA8bEurSC4bS2A7bmvRlqM?=
 =?us-ascii?Q?qjSmv5ONQCnQ1kd0CRQr0NbenfUkPbnntRm1B39Z2h1VZUg6tnkK/SmraTPg?=
 =?us-ascii?Q?bnjNLhPsK004CTT9SKEbiV9KrKNLGobeU/oHqqsMWAbuB6DaWu2tHrOA9i7n?=
 =?us-ascii?Q?3XOOe5bZVOSxyX2XNasjX5hjWxGiUoRezgWQGGOh98KrXDoc38pLUVz89iQO?=
 =?us-ascii?Q?ROD7bJDWfDkS56C9JR5oYmYV2MvyFJoAZTt7xsrIZW0H6BC3dlXAwP0XxL5F?=
 =?us-ascii?Q?nPY2VXvV7tCqzByz3WKX86yTrMuWnG1MIIY7Ux1bDtswnMx7U0ZQpcZInDVL?=
 =?us-ascii?Q?ocklPal1JWYtkWS+rBBH+Ku4OsdIWWjLJ+58AaGT9hcRrsof0Ak3XuUCtSnb?=
 =?us-ascii?Q?1f5q5OY+jpZ+VoSL01sGX0sL6B16DEEZVMC4M0aLeC+e+QxCRPZuGdlMAZrn?=
 =?us-ascii?Q?d9FrlK4GaPIiG6Bt3ZFw6PtR1ltWtdaB+kJ0kS3ymQ+RQiiZypC7YxBD+Zs7?=
 =?us-ascii?Q?Lu5n6qEIxlq4Hrn81Ii67gwNaY5uSxfqVHbwVuZ534uEk+V/e2+eWgVd0yjh?=
 =?us-ascii?Q?pw2j/AnJpAdxvLWN9ysOtaI=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73c458d1-2bbb-4508-cba7-08de2051f57e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 12:09:11.9888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wwzHRlnxTPUQGEcMu9daVgm0q3T7ivQ7pbacRGtpQuZI9g1lDTQFd6xZcPoQcT111CsMTj5GTlbOEZFcq5jOTgOXiyF8+nA+eyLHnHLUBp7YveQnkDrc/nWpCgYi02Wq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8436

Refactor the VBUS control logic into a new helper function to improve
code clarity and reduce duplication. This makes it easier to handle
different VBUS control register cases and aids future maintenance.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v2->v3:
 - No changes

v1->v2:
 - No changes

 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 34 +++++++++++++++---------
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 38b49ceb5ff3..f6026b3b95e3 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -203,28 +203,38 @@ static void rcar_gen3_set_linectrl(struct rcar_gen3_chan *ch, int dp, int dm)
 	writel(val, usb2_base + USB2_LINECTRL1);
 }
 
-static void rcar_gen3_enable_vbus_ctrl(struct rcar_gen3_chan *ch, int vbus)
+static void rcar_gen3_phy_usb2_set_vbus(struct rcar_gen3_chan *ch,
+					u32 vbus_ctrl_reg,
+					u32 vbus_ctrl_val,
+					bool enable)
 {
 	void __iomem *usb2_base = ch->base;
-	u32 vbus_ctrl_reg = USB2_ADPCTRL;
-	u32 vbus_ctrl_val = USB2_ADPCTRL_DRVVBUS;
 	u32 val;
 
+	val = readl(usb2_base + vbus_ctrl_reg);
+	if (enable)
+		val |= vbus_ctrl_val;
+	else
+		val &= ~vbus_ctrl_val;
+	writel(val, usb2_base + vbus_ctrl_reg);
+
+	dev_vdbg(ch->dev, "%s: reg=0x%08x, val=%08x, enable=%d\n",
+		 __func__, vbus_ctrl_reg, val, enable);
+}
+
+static void rcar_gen3_enable_vbus_ctrl(struct rcar_gen3_chan *ch, int vbus)
+{
 	if (ch->phy_data->no_adp_ctrl || ch->phy_data->vblvl_ctrl) {
 		if (ch->vbus)
 			regulator_hardware_enable(ch->vbus, vbus);
 
-		vbus_ctrl_reg = USB2_VBCTRL;
-		vbus_ctrl_val = USB2_VBCTRL_VBOUT;
+		rcar_gen3_phy_usb2_set_vbus(ch, USB2_VBCTRL,
+					    USB2_VBCTRL_VBOUT, vbus);
+		return;
 	}
 
-	val = readl(usb2_base + vbus_ctrl_reg);
-	if (vbus)
-		val |= vbus_ctrl_val;
-	else
-		val &= ~vbus_ctrl_val;
-	dev_vdbg(ch->dev, "%s: %08x, %d\n", __func__, val, vbus);
-	writel(val, usb2_base + vbus_ctrl_reg);
+	rcar_gen3_phy_usb2_set_vbus(ch, USB2_ADPCTRL,
+				    USB2_ADPCTRL_DRVVBUS, vbus);
 }
 
 static void rcar_gen3_control_otg_irq(struct rcar_gen3_chan *ch, int enable)
-- 
2.43.0


