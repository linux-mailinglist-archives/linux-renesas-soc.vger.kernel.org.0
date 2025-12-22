Return-Path: <linux-renesas-soc+bounces-25988-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6A4CD6370
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 14:44:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 667463036599
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 13:44:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC27830EF67;
	Mon, 22 Dec 2025 13:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="iXgKO3YT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011028.outbound.protection.outlook.com [40.107.74.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F0E1459F6;
	Mon, 22 Dec 2025 13:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766411072; cv=fail; b=Iktf0q0wZKcwv7hRJNjuy3lQic8xdKcIU2mmhh8Obr2FJWnkYoZphOMAhkQ4ahz1O2aJuJqm8th2FS7RvwCB0MO5ZluQxyNzt5xxPUHgWeiXRS6XBXv+HnfwB3GVmdl/1X0A14KUH9T9hBUS3Rd7ZjEe/2Ckop6i3Y77B7krusE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766411072; c=relaxed/simple;
	bh=95y3Hxel/QnlHI40J0aoJmCh/NVyXWToSGrJslr/eSA=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=HcGseASVzDE3Btr0XyRnCIZ/2/ukWJ7EWUzP3HCbY1KEOvXfxhSVTs1U5RgJ1Al5mH8uslpbs3DHQ5E7HD/mKQ0Qq7YsrIDy+9icqA3jhwJM1O5IDSQnO7GChBuE25DhgoemPtxL/UjorWrTEtpb/YGjB7roGVfJo8fz+eY6Svk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=iXgKO3YT; arc=fail smtp.client-ip=40.107.74.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=is05JBmcEhYzDocgFwKDTN4ehy529vGwhADkVoDZxOcfKT2yYFAQHyff2zHiBp2K7zusVXTyXmp9JJVjDtKNeuoZqFZCbCyo3d2soc7g2NSusOsuWwRqqs+A82MyaavDF5HqMLYlce0WBGFHc5AhG1lnDpCHt1GuSyrpmWrNB3rLnHeAwvQC5Ad79XYkf2H9cM/nIm3R7JV0dblUYj6kWe1tI6oxSBDdMl5vqf25A0bpGWE3BUl4bKwRu3xlspif3y0XiLVA0orMIa8L8SYOPwqn80wmm0Q3LdK2PA1M/XO1R5tb4JEPxqH+CcXEPMglEqcsnPOf04nOjUb0JUAgGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iRJpbSTlUPUEOhMTQbbN5Et10atwt7cYFAmDbnPjyUg=;
 b=rMEzgvVALNjr0T3psnyxDWLN3j6iHN7Th+RdNJzwFvErltrPj1pU2sWwN/Tni8A0uHNJwuKD427b46O+yajICVlFZFAVqEMkUEtAqeAPoj4IAZIW9GeuHr5ZwOtNJvrqPO4s8dZlGDuRp+CBf4oEdXSXI47T+bEGWGw23yLmpbGdTRBNvlHxilDCm3A9wM3yP+hxvDIGcjzT6mvIByQOIAzPBLwGzVTsIW1ft5BN0L7Th0XLj5QPZpqVFqvTggGeIqe84Yv6pc7R8uDeMYS+nCvD+J0ngbpoVV4eo0eSw/sODtvF+jFEFBdJ/aEhUdvTt4a4P5L11a0QSnwCpn8RAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iRJpbSTlUPUEOhMTQbbN5Et10atwt7cYFAmDbnPjyUg=;
 b=iXgKO3YTc2uorsdoyvoF6tOf/pU6ywndB6Dkpe9ITUhPvt9VkUUDoabBJsWXJF8H4mTs8dzLU6hpj4Lr25O5RJHD+v01zA3RAFtO/J/RZFN8HBPDb/FSsg5QMkOmqYn8ou/lxvaEUrQuPiLsarZjbFWs1Ks788D8UccgeJgT7pM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS9PR01MB14304.jpnprd01.prod.outlook.com (2603:1096:604:362::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.10; Mon, 22 Dec
 2025 13:44:25 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9456.008; Mon, 22 Dec 2025
 13:44:20 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Peter Rosin <peda@axentia.se>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Georgi Djakov <djakov@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v6 00/14] Add USB2.0 support for RZ/G3E
Date: Mon, 22 Dec 2025 14:43:34 +0100
Message-ID: <cover.1766405010.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0324.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::14) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS9PR01MB14304:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a19db3a-0ba2-4cf4-e44e-08de4160351d
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vC7E+9MoiulPrTElyBHxRF+nuKzamOT/AMmGnCovD3RfHj69w1uXVO1sJaj/?=
 =?us-ascii?Q?pjCfqOw4nFUrQy34vuK4MqiK+N2eBSXWFwrqv2uklVzEq1vNYVpgOv7fPEOp?=
 =?us-ascii?Q?/lTbZnAujHsJZlOEl1yUZvRZKFD39rGRNFLq0dpMeMbLL2K+6DG60q9QJZrX?=
 =?us-ascii?Q?UI2l90DY6ZpZCSpZKbf7KhaJTEOBTYRx3hPzGUss8kapSbOMjXXNknnGrCKd?=
 =?us-ascii?Q?bVpXLcLh4TgO526xzpCgup/xAPzGAmhxIGqNuQeaxgRe7qU7/bRrtJ2wW+Q+?=
 =?us-ascii?Q?V1Hcz6RLryr559ZXmp6xVA+aRpmf9HvB+6zqZKq8LPCa/g6hhK9RUuCjjXgB?=
 =?us-ascii?Q?YXszdY9PaID8DgyTafAuLAF8gfzwo+xCukx1luONzx1qbyMvKHpxwW3SrLDo?=
 =?us-ascii?Q?oqIo2/IlEWosXDH8AXBj39pDiOmPv75Ho/tIond+w02HH3A/xNaCTVqT+dhA?=
 =?us-ascii?Q?zgEkLnI1EvjMlyGVekLz8Hcjt4bfDChzMxp208PM+Qsg9umZDLtk7FkioIt+?=
 =?us-ascii?Q?Hl7csupz9d2b0vUO6AL4n25CrUEVOrfmlvkfpUfCXPpSb9bu2xQ810HXfnAW?=
 =?us-ascii?Q?B7EGkBk99ZIXSxs8yzc9rN16n8vZZbVvKfj2YF+pwBZfzWN/9PsZtK2KjDkp?=
 =?us-ascii?Q?9QFeP+FE0n9YTFnOk5YSZMpGelsOFW5N8wyg3Da/3ox8lAlgK/Jt1rWF8JXI?=
 =?us-ascii?Q?Uf0Ft4JirOX9NxcasetmP8iG6rV4SFMDsYOK7mqjH0NgDkF15suxFW+9+bRp?=
 =?us-ascii?Q?mUI4arL674htTwGPWgBTGT4c35XUqYpWyCkHgBq4ME1Ehama97jucp7xBdBX?=
 =?us-ascii?Q?Q2QwE5S3nKug2T4ox6FcQPSCIIWFxVZ9kCqN3JJqDbc5NOCTfnE5JR0rVILA?=
 =?us-ascii?Q?EEfwha7HYu5WwVAcvzAB5rdfot/pFY3BhRQgflv0FqIcVisV4IhH2yckBavO?=
 =?us-ascii?Q?H8vcbAYG/AZKMv6js/OIKsfPTXS1LOwYu6JWoOVP+XE78LqmpE36lCkHgixP?=
 =?us-ascii?Q?rzTeB+rpm+bj0RtDN3oVKL9vERN8iqoWgpXBEc6Qau1lwdP1QM7Llu+cM98y?=
 =?us-ascii?Q?pVTc3M5+LJcpM+aFsDdeRXXtepEXmeS7KZTKGnf2xUvs+hxGTyORFcKfN9SM?=
 =?us-ascii?Q?6OCRso09LxlMIuvYrf2DV2shDLCKsGDPLUq6KEy4RqTGyUF8eRfJycw11moP?=
 =?us-ascii?Q?Wk8zu4xUcNrKX223tEMU1bwFdbvR/RSwPNfHCL+5shR2qlXwSAZeWYoQsqMw?=
 =?us-ascii?Q?BWkN/eWtH123qmQCPRszS+hlPEyQrQAjIoHv6gIww3+yKbf02m4jdlsfVUC1?=
 =?us-ascii?Q?ndBXvwRg1U1HT9jdIRS1Mx+meGZYjTNurTARTkk6OPuMfCpojE1N0yJg/WOy?=
 =?us-ascii?Q?nGEZu7UFTvBqFGosXd3E/VLN1vGXrHkuikD3TB4TiuDT97RIBiG3DgydLIzp?=
 =?us-ascii?Q?wtXMeSa59SxMQMb6rnZXfBmPeHIoL3v3OHTeaCAtTMQbjFxmKBlsQUSzt7Mj?=
 =?us-ascii?Q?dAqBjeFHTDdWAZ7BHR2QXJHedKCC+HRGjZh+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iNe2IcPRLD0phvCeddip6+EuqVshtgzQzcpLTudrgv+152GTE9dq7g6ig1tc?=
 =?us-ascii?Q?D4vFhsYhTUngmZzx2kyQBH1bHSZItARLwoAk/ULUQcgE86Q8oNTkhlEXB/HO?=
 =?us-ascii?Q?V0aomFbmRx0WaI+fSsqR6zboZVq5HxBGhz68IuTDwZXUGwKdBQC8CMvK7Jid?=
 =?us-ascii?Q?F5rkPDyfvWVkvsq25scKVHKinFA5F0v9C0ARsNO4qY9HSvegpto3RycwAcel?=
 =?us-ascii?Q?Qhq98BHmenXtbpO4k5YR5dRmxxbTrrthUWe5TxNFq3yfrENIAkeWsCPQm/o4?=
 =?us-ascii?Q?pAbuFqocWiXcINTW8DIu9OsdwQp20S9WU+jQSklSl1IgiSYm8nsGsE3zveJC?=
 =?us-ascii?Q?dbVKQloB3RPNLku3bdb0gcf/vrHuen4Q/fOEeo+hEka7OvoudSG4afb78c2b?=
 =?us-ascii?Q?36jrpy0VTizY3bD3Kwjg23HCQl9bp5LPtDBJlciCkqm8elwHmOPyAhoGpf5Y?=
 =?us-ascii?Q?8VZpiiXvkj4UaRbvvnWu9LWr0bBcCm6SOsApi6+9UHIHpA1jJ5C8/3uE+JCQ?=
 =?us-ascii?Q?lV+jnSK3zknOI2IE6GoiF1OhLEImPuksFwVFICT6u0t1rqQcKvivebYM9rnA?=
 =?us-ascii?Q?AzagXJ8JW39PdQ02EDkuxr+4z4xfGqmsJZT5YbBnRXeRp01xtthJqz5+OCio?=
 =?us-ascii?Q?J64ddGKTMpK7IsZ+TlRgJynRB+40zbZyvumfNdbBHkzcpfL++SfsHBicpsNL?=
 =?us-ascii?Q?RJ8uBxdtyPhxXqvXjqyE3kyNmrlTm1oPxlu/BsQAjosGmb3S6ctOUQNzEfak?=
 =?us-ascii?Q?BeIOZ3gHdvD3X5/5KtAYRdYfY70GsdqfFqDapD+ZeltATRmE6bsFkggPk95I?=
 =?us-ascii?Q?Ul35OljtuqwGQEQqD9HP0obxH/zPSX9VND8tv97phbvXV1Hnu4EJfKgd141D?=
 =?us-ascii?Q?qj/BeKAQdHUFr2YPCb7Hsvvl7xaBzlZNMK5OxHXG7wYSmRIi6ApDFAg1Oizl?=
 =?us-ascii?Q?TJrUOTCZaZAHLFVULb2OnXmt9o3CxU2/h7V2oIQFxuCroztPrT+C094Vggde?=
 =?us-ascii?Q?WDXLRZlqpsyje68LqPGSPPObFuZGlTSHUwmGdiUwErNJ2JUYJkm604TONrcZ?=
 =?us-ascii?Q?QnTltHE9eV5dvrlfiOGkFL35SiLyEcs8IppRBAzfQrAV2RrqZWmA3cdFdTP+?=
 =?us-ascii?Q?kJeXip0ScNmHEmvCUvOdTYnAxBww/z8xZLI2c8hotxvF7YZ/h4rIkezmjhzI?=
 =?us-ascii?Q?7PeZd865BBIK4Cxqlmxmf9SMP5Ox18d7dbFiWYyZMNY565mS/3dF0Rj2zD/I?=
 =?us-ascii?Q?ILAuZnlw14GjcZO0tE+1Sjpdjhyk9zjeWxVhbODf4pnC17KDXktdkSYwPxRo?=
 =?us-ascii?Q?f1NLtsy4ZZoD+NVGMmnJOOIXHoniAmReSij7ncOAOZgTuaY9ajJbMuCCgJiV?=
 =?us-ascii?Q?xtuxXZEOpGt3/31fVh9IAe+RER9iyad8rADLJiTIij6XBxTXMSTvih7B/KMl?=
 =?us-ascii?Q?vqas0qLTMZMlV6KCeEMuaQlz0Z9y85Rhh1rJSGX16oNI38r+b+apQvocmW8f?=
 =?us-ascii?Q?UKvffJr00BWwfFhEgPx/6ctvBZ/jKuj9Oobj3bNmfU6R3dlsrpbD/vSKSwAW?=
 =?us-ascii?Q?U5MBUNukZ9ILp6mT5XHOooArME/Y8J1ZUAAXzUJVsr3d/rTKpKqaz9UiUGk4?=
 =?us-ascii?Q?/5z2fnno505hNKGkmJ9UYNEhezCPvhxyDr3r4lt9g1BpchB7/wL3XV3JKYbD?=
 =?us-ascii?Q?4//lrpg9dNV1Psk8StV9DLDQj0UzdBx6Lk75JnEPsCOFuuM3zW4EsejYjiXs?=
 =?us-ascii?Q?6Z+fY0QqMgPojjXdaGVAvFMPoHRg/3xh9GRxk1B5Jw+Q7dzVVJRK?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a19db3a-0ba2-4cf4-e44e-08de4160351d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2025 13:44:20.0239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hXZvjt9QrUhJEjtbZ1DN9oHmGYd7mQh3QHjdiDwp8Lor6SUHvQGevhFGrBdlHXGzLTo3yD1fVuRILrFu/wPsufij8Tf16JXteczd1q2UIAMbHU8mmkNQV34xWsyFn3Hy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB14304

Dear All,

This patch series adds USB2.0 support for the Renesas
RZ/G3E (a.k.a R9A09G047) R9A09G047 SoC.

RZ/G3E has USB2.0 IP that is identical to the one's found into
the RZ/V2H SoC (R9A09G057).

Merge strategy, if any:

- patches 1-2/14 can go through the MUX tree
- patches 3-6/14 can go through the Reset tree
- patches 7-13/14 can go through the PHY tree
- patches 14-14/14 can go through the USB tree

Note:
 - Reset driver (reset-rzv2h-usb2phy.c)
   has build dependency on Mux header file
   (reset_rzv2h_usb2phy.h).

Thanks & Regards,
Tommaso

v5->v6:
 - Rebased on top of next-20251219
 - Re-arranged series order per subsystem patches.
 - Patch: 3/14: Collected tag.
 - Patch: 4/14: Fixed commit message.
 - Split from dts patches will send separate series.
 - Added merge strategy in cover letter.

v4->v5:
 - Rebased on top of next-20251127
 - Patch 01/22: Added Reviewed-by tag from Conor Dooley.
 - Patch 06/22: Changed file name to rzv2h-usb-vbenctl.c and Fixed
   Makefile, Kconfig, function names accordingly.
   Changed driver .name to "vbenctl" and fix auxiliary_device_id name.
   Updated commit msg.
 - Patch 07/22: Update mux_name to "vbenctl" to match the driver name.
   Updated commit message.
 - Patch 11/22: Fixed if statement for mux_state error check.

v3->v4:
 - Rebased on top of next-20251121
 - Added patch 01/22 to remove nodename pattern from mux-controller schema.
 - Switch back to v2 implementation for mux controller in patches
   5/22, 15/22, 16/22, 21/22.
 - Improved commit bodies for patches 5/22, 15/22, 16/22, 21/22.
 - Removed mux_chip->dev.of_node not needed in patch 06/22.
 - Collected CDooley tag in patch 09/22.
 - Added missing select MULTIPLEXER into Kconfig in patch 11/22.

v2->v3:
 - Rebased on top of next-20251110 + [1] + [2]
 - Add missing Cc: stable@vger.kernel.org in patch 03/21
 - Patch 03/21: Added missing Cc: stable@vger.kernel.org.
   Improved commit body describing the removal of rzv2h_usbphy_assert_helper()
   from rzv2h_usb2phy_reset_probe().
 - Patch 04/21: Manipulate mux-controller as an internal node.
   Improved commit body.
 - Patch 05/21: The main driver is using now __devm_auxiliary_device_create()
   then update the aux driver accordingly.
 - Patch 06/21: Use __devm_auxiliary_device_create() to create the aux device.
 - Patch 08/21: Improved commit body and mux-states description.
 - Patch 14/21: Manipulate the mux controller as an internal node,
   and update commit body accordingly.
 - Patch 15/21: Manipulate the mux controller as an internal node,
   and update commit body accordingly.
 - Patch 20/21: Manipulate the mux controller as an internal node.

v1->v2:
 - Rebased on top of next-20251103 + [1] + [2]
 - Reworked series to use mux-state for controlling VBUS_SEL
   as suggested by PZabel added also mux bindings documentation
   on phy and rst side.
 - Collected Conor Dooley tags
 - Dropped unnecessary rzv2h_usbphy_assert_helper() function from
   rzv2h_usb2phy_reset_probe()

Tommaso Merciai (14):
  dt-bindings: mux: Remove nodename pattern constraints
  mux: Add driver for Renesas RZ/V2H USB VBENCTL VBUS_SEL mux
  dt-bindings: reset: renesas,rzv2h-usb2phy: Add '#mux-state-cells'
    property
  dt-bindings: reset: renesas,rzv2h-usb2phy: Document RZ/G3E USB2PHY
    reset
  reset: rzv2h-usb2phy: Keep PHY clock enabled for entire device
    lifetime
  reset: rzv2h-usb2phy: Add support for VBUS mux controller registration
  dt-bindings: phy: renesas,usb2-phy: Document USB VBUS regulator
  dt-bindings: phy: renesas,usb2-phy: Document mux-states property
  dt-bindings: phy: renesas,usb2-phy: Document RZ/G3E SoC
  phy: renesas: rcar-gen3-usb2: Factor out VBUS control logic
  phy: renesas: rcar-gen3-usb2: Use devm_pm_runtime_enable()
  phy: renesas: rcar-gen3-usb2: Add regulator for OTG VBUS control
  phy: renesas: rcar-gen3-usb2: Use mux-state for phyrst management
  dt-bindings: usb: renesas,usbhs: Add RZ/G3E SoC support

 .../bindings/mux/mux-controller.yaml          |   6 -
 .../bindings/phy/renesas,usb2-phy.yaml        |  15 +-
 .../reset/renesas,rzv2h-usb2phy-reset.yaml    |   9 +-
 .../bindings/usb/renesas,usbhs.yaml           |   1 +
 drivers/mux/Kconfig                           |  11 +
 drivers/mux/Makefile                          |   2 +
 drivers/mux/rzv2h-usb-vbenctl.c               |  97 +++++++
 drivers/phy/renesas/Kconfig                   |   1 +
 drivers/phy/renesas/phy-rcar-gen3-usb2.c      | 261 ++++++++++++++----
 drivers/reset/Kconfig                         |   1 +
 drivers/reset/reset-rzv2h-usb2phy.c           | 108 +++++---
 include/linux/reset/reset_rzv2h_usb2phy.h     |  11 +
 12 files changed, 420 insertions(+), 103 deletions(-)
 create mode 100644 drivers/mux/rzv2h-usb-vbenctl.c
 create mode 100644 include/linux/reset/reset_rzv2h_usb2phy.h

-- 
2.43.0


