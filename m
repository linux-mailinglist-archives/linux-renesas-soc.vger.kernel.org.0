Return-Path: <linux-renesas-soc+bounces-25996-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC71CD63BA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 14:48:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A65B3051317
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 13:45:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F325329E7A;
	Mon, 22 Dec 2025 13:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="lT0wbJHk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010003.outbound.protection.outlook.com [52.101.228.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FC9328B7B;
	Mon, 22 Dec 2025 13:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766411128; cv=fail; b=jHZU1vv3A+aAzjn9CHgzkASWPzHDZmv91L3532yyKv5O0qpRoPg38fogAgaoYURWHc6y1ObT4YTZIweCFSQwB+Q7vz7EGDFoSsfl4aLFRe3nof9dTBp8q/qiSkjxAzf83NdMLo+29XhiQk9sEuEpk5yf8ZEf6WrW4kLsl74zt/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766411128; c=relaxed/simple;
	bh=SpDkzH/OPsbZR2Hi3tftiwXTM6TSgMi/xE88GvGPn1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Kwy85/PUCibxTzS3FD9XxRMyZm2F123eFKWlUsDUGL82+mOvdBhfZrnqXZHUh1tOWH+xoUhzZz9OZRShTCFDCv5NLxFDdKO8kIVO8KCC3BjRadkU1yh91y9cXANp3weZUruJXcqDW7wIuYlwR5NEON0Q7OVbzm+X9ltWmHpAdU0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=lT0wbJHk; arc=fail smtp.client-ip=52.101.228.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gMAMjdw3Sa7HMhU3UscLg1y0xcD2788wbYfjqvahUv4CLl2WtR5hoNBHxEX8XK603diNzNajzdNHBIWgr0ziVdsbIT8US9NY0dej+tgVm3DU5BnYEBSpPW20+RQ5/bj4hUUW6LqHeP1DgLvt2RNKs71/LGOVWim3N5exqiTvlZleiD4TYzKaPYg3+9PlO8miQz2jjxxFHCknjW1TEv6wQLTwH/wJdaoBNMl64x9kHtEo5ZLWrXZWIsg0o2OajCdhBdgolpGMJQhL3YyXo6BERP6/7X9APUAJtv4rr2+k8AFvHzTiBkvilXKjcZ+tk6MvFd6ayJHqYsLPG4pFY95nug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/GvGYmglPaLTAK8z79fW2yffaquyv+MiisH+nvr+Ef8=;
 b=gPzOKhMLxevd1jWpl24XH4XoxiU0iPcRKVYg1Ei3yokH9u0TG8lK5B2hZBN84kbKneRuYva694Y3K2xEL2SGrzKnCn1pJiRVVbKNqPLhRKF/vJQUd7gV2fIUcGEj493yJ0M5MT/cGNcD56aVPQzfp8k9p26U5nN3Mb2Ury1ybNhjggtHGNRNmt9iYUR9QFu+RO3RplXmptOocYtFZHGvpp5vTNM+4Kz13vHOmSAoRpj4WfdXlLK8iXHUf0QheXE/OznpnItkqg4MiKErEV2s1oSUtbt5F41eSaBGUw68He4R3OMxlTXnTPhsPSKcbMVv3VvZ9DrIK2l9RP5VJ+wA+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/GvGYmglPaLTAK8z79fW2yffaquyv+MiisH+nvr+Ef8=;
 b=lT0wbJHkyUuYxJEzpUw6QNGPzjIpIYf1FwRGOGBdSCnLYfmDIMULvT8A9y2sxYwvzUC9e//g259hi/1YgKpaxTbTxMcl5eKajs/+JNAchCbYo+L1dqGA9UJcZYc1rsuwOpOvYVXB2IS9/jYpYiWFVOvTtSUO6C9V43+qy8QlE24=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS9PR01MB14304.jpnprd01.prod.outlook.com (2603:1096:604:362::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.10; Mon, 22 Dec
 2025 13:45:23 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9456.008; Mon, 22 Dec 2025
 13:45:23 +0000
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
	linux-phy@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 08/14] dt-bindings: phy: renesas,usb2-phy: Document mux-states property
Date: Mon, 22 Dec 2025 14:43:42 +0100
Message-ID: <36d448dd10bbb2bbfa5b1b6b6e3fee86c34d01aa.1766405010.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1766405010.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1766405010.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 7461ad83-ed9b-42bb-6a91-08de41605ac2
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VePoIH41W6FCXRq4BJS9A1OrRSZ+uNBPomdol4GE8oLUuSG7W/OXw6/fqIKZ?=
 =?us-ascii?Q?/owhlE/X686JamHj4D7Nx1jpPtH6bkVX5ebYHYV7O8fJ2rM4uDBkS8G5bunI?=
 =?us-ascii?Q?EjNjwvF+dpVbQm9sfHyC6ahBoTIFm/BhcTbdMbuhPZoNNrvJI7yeszzN0zzR?=
 =?us-ascii?Q?Gz3GvfaKqxznjFMo5zX83V2TNmr4qkvjmPVQaZHb3dOlxUOUsQLPE8whrJGn?=
 =?us-ascii?Q?aYJ83TGXuVKBqanO7SKx6R7IK69vdDN7uGdjzAxxQFcXHkCbS8yJ9RZOgkPA?=
 =?us-ascii?Q?q/K/4Ow02uUZOpSxAD3ocVr34TEXtsppgj7k5YJSNFeBstAQGd0yZk68UTvP?=
 =?us-ascii?Q?4l8Me5/87mfPG9VUruYfbGTEaeoFdOFbqKo90NPg19n0DCdufF6cfbBfKmlV?=
 =?us-ascii?Q?bJH+objDTOwILJ8AtpcWbcX5c6HIcrDYKuhKnrblwQc31WiHGX6J15ixAX92?=
 =?us-ascii?Q?2zQ3OfEwZNiEb1h1b8IslsmVQc5ovoUrOs8iFiqLARl+FoP0/rRiPL4mKMU8?=
 =?us-ascii?Q?zYxXxWoO5+qJp+4jTuiJWaZoXl/43zvpYUf98P2PoGHXREVu1uCbZ0PwzAb4?=
 =?us-ascii?Q?OM1WcgCNU1lw3/DjXY+HfSo3n/UpVCI68Hhl8vUm32BU+yBesDSl1wdo+SoJ?=
 =?us-ascii?Q?1R2RsK5+VLFfb5KY/XKHJfzJFeRxC3HUvkdHY5st232azpmSDEyzCnbY2uFT?=
 =?us-ascii?Q?GNLI/bkf8r71ZpK7mAXQKHraGZws+LAfs1fhdnjxW3AjbI0l439ZSxLx0Fv7?=
 =?us-ascii?Q?UN2hoPl10bRusGGnk0OMWJ3WoeWlgpzuFWO/qCo1wd11rtrunU6guxkLGNHN?=
 =?us-ascii?Q?CefPYQPwR7hqqocR/UYa63IFXKczLL2EXfhdYHF/vsrYibWkuhN/TOhcj997?=
 =?us-ascii?Q?Kni5ZCG+rU0mXZPXH/8pUDOOqJhX8OI2CADKAYYFgWEmQzSpBLO4CEAvw+PP?=
 =?us-ascii?Q?bEaYucFC9ODXf7ErOR/ihPRUiUR3UONv0eiYr7THE5rFaq7c+UQxOxVQlho+?=
 =?us-ascii?Q?Q8vIq4nodFG9Vqo848h10iuMTRoaZwZV4LOYtaZ+iinUq3pE8iPknf+/J8QF?=
 =?us-ascii?Q?p7RmzB+WT+Dfywt1jpugyBgtu+v8MIO/Yx7R5fjTgUCuolvPpDF1VGLrBp3g?=
 =?us-ascii?Q?71EyzxNe4laoyl7EANquaXBiiYBEYHrtxj2kOREfC6GgaA0BoPF5HmYDQuRd?=
 =?us-ascii?Q?okHQSReQ5yADLkRMb8O0ciXGAD+2ivYIZgSF45eOv/wEZ8j2xAiCYIQriJT2?=
 =?us-ascii?Q?2p/num+3SuFHjVa3xAHUtBWmVRLB9b4GcaZEHqG7HqEncGK5uoj8dMeBtpfx?=
 =?us-ascii?Q?iz83x9M/OLKesjZs5eqYecBRPYvXb0R5LKQ6J8J12UZnYZTgdpyP9jJN4giw?=
 =?us-ascii?Q?X9+uGoBYzJqK70KKRKOIF4B+mUBoEur3d3uTrPeCi/lQF9qrf6OH/NtFux+L?=
 =?us-ascii?Q?fP0qBtakLeur5n4qoPfQXWSwgtMtAr36HIXgcGpUUhRwB+hipXPoLE4kiEmY?=
 =?us-ascii?Q?q17+KhaW6pGtd1wme9W7jyzFwJYkrTMpeKZK?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DIMEcVkvhZWy8t1DkWzI9K5bOlEMH7B9c+8LLqDRgaTgJeu7Wj2ivsfwjAbC?=
 =?us-ascii?Q?/lJIM0oYQkrJRZYxHAJ0ARLQl+z8vZCQw61vNFPRNccWKFOHpmY7bO6N52jA?=
 =?us-ascii?Q?fu2LMsTyPy8lOnl3r7MQlIoFqn/gKCGnf6qxqGfTn/ZIGmFBxq+uJaRgIGX8?=
 =?us-ascii?Q?FeV1lRulFcnVw9g9SCusw/3LqTKLRlHuZIm4coa/2vZG4FsUocbZqvgGdl7U?=
 =?us-ascii?Q?jHSJl9ASb/h1MKU7/pU0bZYXCibE3hczwSgQkgmPc61iTsxSfcScwv111YUE?=
 =?us-ascii?Q?Y9P/0SpkHEwFj9JmZ0NJjEm4is4CGi5pHWpj+UKAOOUbQIIsS4AbDY3svBOY?=
 =?us-ascii?Q?hk+syf1fYlWvlFDOdqihDbHyg5h3WGOmjIKwBvfZeBvqbwicBzo/BdB10Oxf?=
 =?us-ascii?Q?/MF66DsQgbkgmHUau3jVWo9Zdr8tQNEVZuGdcfwphBrskGSOqXoz/osSCCVr?=
 =?us-ascii?Q?MDLgFQxDuou4gGQRoc+XXVeYJQtR3acTjVxysl32x2SAKxSLPt6s8jG0saJA?=
 =?us-ascii?Q?p10Pu+VWIcAj+nKIQXsO8mlTWfnDrtkLoFt5F2nh7yjt8IdXPV2BFcMNJuK7?=
 =?us-ascii?Q?uNLLJ66Z+Q7+NL2fgPKhl3HCSJPh5a8UnDn/04e/5T/wJMfZxCM3dwXyPT9Y?=
 =?us-ascii?Q?oRaYyqHk7UMyi9s72hakNrUX4RAsSSVJPXBOFiQPd+vzC3RJ2XjSqVCJb2gL?=
 =?us-ascii?Q?IPj4M56otABYyC1TfxKaoEtkLv8JlZKdyp6nq/OwVeveu9onHB3ygwc+nG+k?=
 =?us-ascii?Q?3QC3+qzpNdv0MgXXg7JgON+pR/xaUSnoH2N3vxsdI2bvEjOjSZbPQmBeBqht?=
 =?us-ascii?Q?uwSg4BGDnfvF+eHpEt+7o65a/ez6viaTWk5cPVqcI4ISGc5Gm/ZsyOx0pgnN?=
 =?us-ascii?Q?Im8aS7e6HiBHjZvW0O1gJtT0nVbA6svuKqPoXzBsY9CwvkHK6oNhzinVLUuW?=
 =?us-ascii?Q?PZDHbAp7WruswhQGKGljwSxKKML7Aol1mUhlr4uCbAZojpCJ3/Q1fO/Pdb6U?=
 =?us-ascii?Q?FeAQu1JbBCCKsiL7TKkwbef0V/6KwU9aHYdjfziV5NvTSZ1kL45siVbv/2dE?=
 =?us-ascii?Q?KejUmuuLY7pP8C2yWpOwvbZBTUH5LLFTfPzWzPpdmslcDIJ5w6gak3u9kG8E?=
 =?us-ascii?Q?5dMz7lHyVGclJZaiVYQv1Tal5qapFfuMiICed+Atc7j2cGq00eRguWpb5Sx/?=
 =?us-ascii?Q?7ZacA2RUEBcE5mO2vxPvoC6X6W9RORD51DSjRtmhlGb2DS7n7/bI+/ZzJaWd?=
 =?us-ascii?Q?JwnGg4T0QtnaaUBHtTCysnZtGlCNI/SgTmmhBk8HDfYqP4tk/fcoZqane3AB?=
 =?us-ascii?Q?oIVO19ycjiWYn5xjNomxQJx/Y3jE0np3pbm5m7Px73vb4wVz3yS5OVXcVplr?=
 =?us-ascii?Q?VOQgoPxj4RrgMSbUSapgp9SC+RYWMhLP/aaa7x1ZIn0xuQabje8C4LHElhNy?=
 =?us-ascii?Q?DzGmagWnDJi6de7TffyRvdEVSHweXsS4jF/B/OuGEuTSpLnuiApMgkUIdgIr?=
 =?us-ascii?Q?cticbstH6iUDz8IDv8gGNMjw3pEQwsHnVaQZtiEDefXqMLyuacAzDhntlJfF?=
 =?us-ascii?Q?317mAXSGqxEFoMuZUbl0OCL0QgXwsvt/URsTTL856oqnt+k559BN0zJsZuI8?=
 =?us-ascii?Q?c+g144RsyqHH8gg5fxHmxoaI0jKlyte0IBTVNMOoZl8LgDcZ5gl//rmfcdTI?=
 =?us-ascii?Q?cJLdBYKjI9yl2/+/pnj1UYy/tRJEOrfeERz2wUvFE7fRjXDXtdzwsT3pZXEj?=
 =?us-ascii?Q?qXltnXSkl24++V5dgmpZZlx4NTEPX+WnsfODXqRE7pUsD67kvG0Y?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7461ad83-ed9b-42bb-6a91-08de41605ac2
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2025 13:45:22.9601
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ipk9/sE1GVoBuKdZ+I3kJSpuq45DHShegj0N/uPf1rApURK0ZrSOIlFnm1hvoEUUJ/QDcU6b9S2bmkidHtftoreqACjV7yrE7rY28ZZGUw62ooGD0RGO78vO2BiyaoGz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB14304

Some Renesas SoCs, such as RZ/G3E, provide a USB2.0 OTG PHY with
configurable VBUS control through a multiplexed hardware register.
This register allows selecting the VBUS source via a mux control
line exposed by the PHY.

To represent this hardware configuration, support the standard
`mux-states` property in the Renesas USB2 PHY binding.
This allows the DeviceTree to model the VBUS source selection as
a mux, consistent with generic binding conventions.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v5->v6:
 - No changes.

v4->v5:
 - No changes.

v3->v4:
 - Collected CDooley tag.

v2->v3:
 - Improved commit body.
 - Improved mux-states description.

v1->v2:
 - New patch

 Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
index 2cd0efa75f81..448da30757f2 100644
--- a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
@@ -102,6 +102,11 @@ properties:
 
   dr_mode: true
 
+  mux-states:
+    description:
+      phandle to a mux controller node that select the source for USB VBUS.
+    maxItems: 1
+
 if:
   properties:
     compatible:
-- 
2.43.0


