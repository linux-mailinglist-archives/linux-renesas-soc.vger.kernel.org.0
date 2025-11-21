Return-Path: <linux-renesas-soc+bounces-24978-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 196C7C7A810
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 16:23:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E89C3A2FE1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 15:19:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C59735772F;
	Fri, 21 Nov 2025 15:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ndQ/Jrd3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010047.outbound.protection.outlook.com [52.101.228.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2385A2877CB;
	Fri, 21 Nov 2025 15:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763738155; cv=fail; b=HuBLlvob8XydfVyq0+UAQZQYXti2Oc7rKU4ow170s38NI/91fc+0DQ/B4CjSzHAYhhCXBal/JHdrqddJuWpoz6ur4C3Oh/8O6aqyr6tyOhLIgypRbD6R0R7mFbO/Ci/ShoumN3GdNFelOrbEf5eC6t31voCkDMasU4T2WYKOvLY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763738155; c=relaxed/simple;
	bh=jxWoJGKPOXcv1kOANR6sdgtRfx1Gzv8MhIRz0i6sjgU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=O7ulR/Dz0HgQylPEbfw5HRYYHSomTOIwrrtjOb1Fy+1jbPnA3DX1Dzl3vsQEKKFEiS50+JERe7k8tIrHgnB8h1PPxXdK0vj7b1jNHMfHXD8ftdqQoH8eIA2umhZfDL8lL/3BvlF1Gre9gK9ZPJTeGJyd2HdqNhJHQC85mlL+/Ms=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ndQ/Jrd3; arc=fail smtp.client-ip=52.101.228.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TZF+fvgZGzFF3d7zQJBs4SRFcNKm2uKf2CGN+kPihHm5LfJ0+Sgxs/eETGDPYOo7SceZCvm9nglsfFAxarxX1Tek7hOqep2GwyaDTpAVKnEaILA6oj6gMOcSpjTQc9+5l7c2593PSBqDcETFQpUkABZA7i9a4aeFQfIGaQ5CMK33dPNA6hXWKdYBAH7kDZmt68Hd08wu8Ngpce0UcOYrxCbtaECLGZtGtbhD66qf30aZiz49LR/wHMhXKGS1+sb4NkMASUsfpYLrUiWjaoFtPwxFxwBplNmrFAZmAvIPjXor2aNYoGtmEppNpyvQ7eOAlTepyDzHFNPDlswKYTsEqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1OJPgavN9qpNqq4UlN1QKyxZFcF05g/nAPh+D0PvFng=;
 b=iE/imbFHUOO7amjkEzNBGTDWJ0HvtLTOkYqUyRLeswxDPALhJhSMwTMlj7QqZRtjKKMBRbLP7pCZNpYZz0ASF4dfI+5tTgOcd4YuaQvBiApEzpwW+/x1LdQHNJKlN6q0u5Y8vqsuhZIIfd8ULCJmSTvIs/k+4DoFdYjrXt1DU/yE8O3syyrt3bAriJkJLRlHWCO+OlYMm0KN1lJRWp2Fb3GuP5vaoa7Z7hdfrmzVyNFXzQkrak2stcwg0ET6AQiVYeL+C6WNFAmvIlhquwxAcRL2DUNCfZwQ/uqUkVt4fPTZ8Rm8wh6y+rqo3jomVrnPMqIxE9yVnn/QzPzfehkVig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1OJPgavN9qpNqq4UlN1QKyxZFcF05g/nAPh+D0PvFng=;
 b=ndQ/Jrd33EuWsL4O/KOq3rcpD2I+dzOpyDl/SUpx5Dm2QengVYTwXNRLCNYNO1/3w175FOucW1ysoCkw/nBL+dmQ4Clh2QrhdsuIUvT9nH1KXr2TSJS1I4U78X8w/0o2wpkDlLQuZBSNhAmfaBgkaAnlJgPYjMISJh67ymfqRiA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS9PR01MB15857.jpnprd01.prod.outlook.com (2603:1096:604:3cd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 15:15:50 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 15:15:50 +0000
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
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v4 21/22] arm64: dts: renesas: r9a09g047: Add USB2.0 support
Date: Fri, 21 Nov 2025 16:12:10 +0100
Message-ID: <66d69e38f4b1e0604d2b3b72b83e73b2ff41790e.1763737324.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1763737324.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1763737324.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FRYP281CA0015.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::25)
 To TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS9PR01MB15857:EE_
X-MS-Office365-Filtering-Correlation-Id: bd4d9017-472e-4ea0-3dd5-08de2910db26
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WDfvKqQfqxSNF/47TFNRCNLjC/KI/YQIDW0Ijfxgs7Y82wpB5JEHza5mEyLn?=
 =?us-ascii?Q?fVE0ZX80kEsKoGQ1RYehuRSmWWOM1XQFIyBMf3NCjk4VNQCJaV/ssN4B3HNK?=
 =?us-ascii?Q?R7KWKuTao3NafT2irwWwH4/QSoJmIcCOumqvBCK6ZI5ZHlVRwXmxrljDFBuK?=
 =?us-ascii?Q?fSvRBn7PTsI/9ksgvraz2k+6k3phWNXRz9EWXpqKKnU5bV98hDHY/ZP/taev?=
 =?us-ascii?Q?TmrDraC2jvZls+L1bFjwlk3zU09WK2wb0qypQEYqIwbp4r+WC8tIs9c7527f?=
 =?us-ascii?Q?jp/BeR7+0ULblhTdKdZopCoTNc9iLJlxF8w54u3AtZcd68Zi4ukBbkJXDEkS?=
 =?us-ascii?Q?qTlvPHA3omXlEMRljl0Y+6O5B5QkIN9NnbAlUnhFe2CsTea1IgZjX1c5K7or?=
 =?us-ascii?Q?IcARL5/4q6uO0KuqI0F4WzVtiTc/v0wDxEG3lWw92AIKkjujLhDN/hlw063m?=
 =?us-ascii?Q?9u9D599m/8q5Q8u9Sduya/JYRXDw6aiyDxLzfSb21kQKajMRsXjACzjJBauN?=
 =?us-ascii?Q?Ysrm/InXSvMRfTBcRZluc5iFa/E5DI+6XIOxwJpS5+GdcMGYI4u0rUMPNtDg?=
 =?us-ascii?Q?/gidhdDQwn4+m7jvIZctPrwlbB7qfM9FFBbzJY2wMU4begE0fE0mqf+sPrVu?=
 =?us-ascii?Q?FF15J7OClyCwsdp1sc2WC+QpMoJvc+zWm4eBsUPreL4eVVonfh/+Me40w80n?=
 =?us-ascii?Q?pUkIofC1qwCNLKEmRJ3vshcJRMopPMMPjM1fIJdpNdM7YENPvuEKvHxD98RV?=
 =?us-ascii?Q?MB+sDdxuvDqCx92PNATc/yUTNpMnbpbU7jfW5rInTCGxHBaGltgnfn5iUACx?=
 =?us-ascii?Q?vA+NlOH4tAHO6Q+IgAZNDQhqrzO9GHN3ThMez9oOfVbCdaypTVwfCMiSnxiV?=
 =?us-ascii?Q?VgZid9KjH6rD93KsSHwo6SDO72m6V4jnPxY+eDbM7JDfU/f4ixe3zSeWkJ65?=
 =?us-ascii?Q?wZ9PltX8rQ6A92hQiQLooECRvfrUBnyXpEy3In2scTKi5MO5HduST91r0orc?=
 =?us-ascii?Q?sTxgmaKYcgiJX1DE0HWPPAgJB6EAKllgpLfkIXGcrWA/K5AIFjn3mnukE237?=
 =?us-ascii?Q?zV7Ub46BsOqPPdRzjPFJDy1/6+E+hAtVkHdF0M6dgz/VQQyKr/0Z7Egp0z4s?=
 =?us-ascii?Q?odLvzX2RbAe7yPDd3UC7LEQlfQx6RmFEfngRo95hbZmLu12jv/qU7eg5mRGJ?=
 =?us-ascii?Q?uB6irjPQMUO2vidvOGsJpf2qWMOKF9wvSkBd4fvcLuUQuPT4Alpom3jm7MTk?=
 =?us-ascii?Q?ARUw/uTE/m1E3boWGQucgsE3GBW80bEubu0NKpTrK1T0HVSEZoRwAethGoAU?=
 =?us-ascii?Q?0lFgCbgd2PhEW5lN7in0exQY6KDPfYMB4FaQbA0TTw8Z4d7xxK3sSrpjB2QH?=
 =?us-ascii?Q?5SwGxNuaj+y/6HyuJzNdHLVYLkLyEdC5IUlqrkWC/k757OH3xl0wAOTQvp1B?=
 =?us-ascii?Q?55B2VroIUDtlPMQh5bqTO5JptxHb08WuE0ytqjv8bIM6gTRFQWCiG1SXTHlL?=
 =?us-ascii?Q?5av2Cp4Rl6GnL5Akvqbwxx2XLmOuKOlhBqsk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Z02UbTeV6XlvI27WxqEVjSqYnw2RYzPQwfHtdX11suXHURw09duX/5gucpXT?=
 =?us-ascii?Q?4VDRVyFuPVDOk4zhlZyEiWgbw4crtTAK+mOZ6JtjMQyb5Y5sJ5Af/ei0SaQm?=
 =?us-ascii?Q?qk+8bpaoqA45k6qGOsJvLO16egNSQv7TgaKwBbaiAXbLpjNTPD+k5onYwEyE?=
 =?us-ascii?Q?dgpNLs/21x25Oq9mmtwWF8WuLmGrBkkR2bUBY+rM4Jkx5qevxOZDbCjz0P5z?=
 =?us-ascii?Q?G9L9q4zPZe/NYsH3XDC2rt/NEO3Ooz/6iBlRBlM42EWX/jPE1R/DY3/5MeBq?=
 =?us-ascii?Q?3Psl0Xd2V1hW4013rZdooCuxBoDZtXQu4r26FbuF3BBLexmMLOyK4vonYTZT?=
 =?us-ascii?Q?5fF/RtZr6TKTen0F6yGUtnMa0FQcMMe+mVzq+4IMpqHYgb538lOs4IeTQn4W?=
 =?us-ascii?Q?gOmhFfGcWmT5Rk67uL5kYWhbZTHxI1Au0VO7fl/Us3Pl3RWaRUYw73xD6oXL?=
 =?us-ascii?Q?R7D3qApMlgnwwPEixtlLI3KCaC9s7v4gc7LTyCo9nDdL4GaN6FSsw9USdjYx?=
 =?us-ascii?Q?KgMuMDamXPYCeh1jz0mItfIRrCWiAX30ugKn6zdzB1ZsdKEDyQV+hXuOMGz+?=
 =?us-ascii?Q?EtxRvZ1DvquDYFI0Xg4onm3lAeE98Pn5tyAoPa75yY35v8pdGHiC4WvORgsk?=
 =?us-ascii?Q?mJoVHAGj26BslYEiEXcGS9jRFXyY6CnKp3PvEzjUX0+zpAgy1bhndWV8uO1/?=
 =?us-ascii?Q?CrlexAF5EUwxW7nV68+lQPgnQpWKGrKBH4j/oiiduvYXroiZsKb6CztLTA2p?=
 =?us-ascii?Q?IRh5Hlhn8jS75/uXsckjaMwth1jCiIo5sRVRuLY+69iDrkA53q004AF0+HdV?=
 =?us-ascii?Q?YIJRG1cFnk7KSFQFB71NOD8n8AW8NgvObReWq9QbgL564h1hmdO+UgavTHJq?=
 =?us-ascii?Q?JMFGSVPaAltY7I18hc24BNE1JolR41/5P3cuhaK6y7VwD2OHwY+YxPTbAQKk?=
 =?us-ascii?Q?jv6notOhju+Ft7rgaMrTWfjKbrYYVb7U3q+cvIOALWMxNiAtLA0zCwKGbDpq?=
 =?us-ascii?Q?T2VlpHkfjKwuvSkaZ2jKu24JpyP6ZMAr4//OCIQsG+Y3b7VF/AOLocPo4poD?=
 =?us-ascii?Q?uDbXmrsv5USkQ/DJihoFJwGY93M6OoEHPw6j/nMo5m963/QkyqQoHGL+S7Ej?=
 =?us-ascii?Q?QfGp6C693eB7Exv2pKo7mnhf5tuBKvQj5EluwHT3/PNn8V8WHUY6p5GIwUea?=
 =?us-ascii?Q?qybR3vnNg/cHfpCWrHw20q7xRdsGt78Bwq3fmNWo4u/RowRoB1ezheRVue2l?=
 =?us-ascii?Q?8ZV7Tvw0EJrDME660763GVQ7NASR7F2DDHiWhr25pz8TY3I+Of2bqSLY1s3J?=
 =?us-ascii?Q?UGejG5h87Yiz8J0lZNm5rEmLluX4HUEAA/jplsWTM2tHXSrXcWwpUs6TI3Re?=
 =?us-ascii?Q?ruBiDM2BY0EZpnTBv4PbiITiB5khxpCL99a5kPVC/AEeGmMm6odUzY7uTa4w?=
 =?us-ascii?Q?zkFYMGMplRy0dRibBfdmhJpvFnktXKJPJJx4139Qnwph1gZ4QiXrfnwrahln?=
 =?us-ascii?Q?IqVUiALYxKn98t9mH1HaB3TM8Wmls6F8SexrtbX5aIncoeSVeYaxEa5SUBu0?=
 =?us-ascii?Q?hNaLxLFWXbKOXckiyZFJVojK+nl+eQZ73oANvTj28+PvhIj7qaGvrUJOwIVW?=
 =?us-ascii?Q?+XjJVNWTQFWoZ8P8SUoMZgQ=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd4d9017-472e-4ea0-3dd5-08de2910db26
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 15:15:50.7457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UiLf3HfUiV2txzqEbj7qM/F7x06isedgcbAtxX54PVYgGl6sGb//oJy6UT2eTDl8f8aMTcf+wj5zHsY4YEkVBEWFAnXfO12kVvjMsjS+4J/ZbJvtRIaayhGG9mzrYBvF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15857

The Renesas RZ/G3E ("R9A09G047") SoC supports 1x channel with OTG/DRD
and 1x channel with host interface.

Add the ECHI, OHCI, USB2.0 PHY and reset control nodes for USB2.0 channels
in R9A09G047 SoC DTSI.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v3->v4:
 - Switch back to v2 implementation for mux controller.

v2->v3:
 - Manipulate the mux controller as an internal node.

v1->v2:
 - No changes

 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 125 +++++++++++++++++++++
 1 file changed, 125 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index 7a469de3bb62..90435e5673fb 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -853,6 +853,131 @@ gic: interrupt-controller@14900000 {
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
 		};
 
+		ohci0: usb@15800000 {
+			compatible = "generic-ohci";
+			reg = <0 0x15800000 0 0x100>;
+			interrupts = <GIC_SPI 742 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xb3>, <&cpg CPG_MOD 0xb6>;
+			resets = <&usb20phyrst>, <&cpg 0xac>;
+			phys = <&usb2_phy0 1>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ohci1: usb@15810000 {
+			compatible = "generic-ohci";
+			reg = <0 0x15810000 0 0x100>;
+			interrupts = <GIC_SPI 747 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xb4>, <&cpg CPG_MOD 0xb7>;
+			resets = <&usb21phyrst>, <&cpg 0xad>;
+			phys = <&usb2_phy1 1>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ehci0: usb@15800100 {
+			compatible = "generic-ehci";
+			reg = <0 0x15800100 0 0x100>;
+			interrupts = <GIC_SPI 743 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xb3>, <&cpg CPG_MOD 0xb6>;
+			resets = <&usb20phyrst>, <&cpg 0xac>;
+			phys = <&usb2_phy0 2>;
+			phy-names = "usb";
+			companion = <&ohci0>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ehci1: usb@15810100 {
+			compatible = "generic-ehci";
+			reg = <0 0x15810100 0 0x100>;
+			interrupts = <GIC_SPI 748 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xb4>, <&cpg CPG_MOD 0xb7>;
+			resets = <&usb21phyrst>, <&cpg 0xad>;
+			phys = <&usb2_phy1 2>;
+			phy-names = "usb";
+			companion = <&ohci1>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		usb2_phy0: usb-phy@15800200 {
+			compatible = "renesas,usb2-phy-r9a09g047",
+				     "renesas,usb2-phy-r9a09g057";
+			reg = <0 0x15800200 0 0x700>;
+			interrupts = <GIC_SPI 745 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xb3>,
+				 <&cpg CPG_CORE R9A09G047_USB2_0_CLK_CORE0>;
+			clock-names = "fck", "usb_x1";
+			resets = <&usb20phyrst>;
+			#phy-cells = <1>;
+			power-domains = <&cpg>;
+			mux-states = <&usb20phyrst 1>;
+			status = "disabled";
+
+			usb2_phy0_vbus_otg: vbus-regulator {
+				regulator-name = "USB2PHY0-VBUS-OTG";
+				status = "disabled";
+			};
+		};
+
+		usb2_phy1: usb-phy@15810200 {
+			compatible = "renesas,usb2-phy-r9a09g047",
+				     "renesas,usb2-phy-r9a09g057";
+			reg = <0 0x15810200 0 0x700>;
+			interrupts = <GIC_SPI 750 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xb4>,
+				 <&cpg CPG_CORE R9A09G047_USB2_0_CLK_CORE1>;
+			clock-names = "fck", "usb_x1";
+			resets = <&usb21phyrst>;
+			#phy-cells = <1>;
+			power-domains = <&cpg>;
+			mux-states = <&usb21phyrst 0>;
+			status = "disabled";
+		};
+
+		hsusb: usb@15820000 {
+			compatible = "renesas,usbhs-r9a09g047",
+				     "renesas,rzg2l-usbhs";
+			reg = <0 0x15820000 0 0x10000>;
+			interrupts = <GIC_SPI 751 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 752 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 753 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 754 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xb3>, <&cpg CPG_MOD 0xb5>;
+			resets = <&usb20phyrst>, <&cpg 0xae>;
+			phys = <&usb2_phy0 3>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		usb20phyrst: reset-controller@15830000 {
+			compatible = "renesas,r9a09g047-usb2phy-reset",
+				     "renesas,r9a09g057-usb2phy-reset";
+			reg = <0 0x15830000 0 0x10000>;
+			clocks = <&cpg CPG_MOD 0xb6>;
+			resets = <&cpg 0xaf>;
+			power-domains = <&cpg>;
+			#reset-cells = <0>;
+			#mux-state-cells = <1>;
+			status = "disabled";
+		};
+
+		usb21phyrst: reset-controller@15840000 {
+			compatible = "renesas,r9a09g047-usb2phy-reset",
+				     "renesas,r9a09g057-usb2phy-reset";
+			reg = <0 0x15840000 0 0x10000>;
+			clocks = <&cpg CPG_MOD 0xb7>;
+			resets = <&cpg 0xaf>;
+			power-domains = <&cpg>;
+			#reset-cells = <0>;
+			#mux-state-cells = <1>;
+			status = "disabled";
+		};
+
 		sdhi0: mmc@15c00000  {
 			compatible = "renesas,sdhi-r9a09g047", "renesas,sdhi-r9a09g057";
 			reg = <0x0 0x15c00000 0 0x10000>;
-- 
2.43.0


