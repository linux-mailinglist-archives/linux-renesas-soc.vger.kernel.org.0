Return-Path: <linux-renesas-soc+bounces-24971-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id AB549C7A849
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 16:24:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0C96C384102
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 15:17:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8335A34F25E;
	Fri, 21 Nov 2025 15:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="mWzA4m2v"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010057.outbound.protection.outlook.com [52.101.229.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C12931196D;
	Fri, 21 Nov 2025 15:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763738094; cv=fail; b=ShIjCN02mC3z5N5sMzBV7gqXB7098PjKXaYeDIuEBdc1ERfnRoOdRZNFO3JhN8Ms3US6EDXo2ldglUDHlGR5cMCrJZT404pX7d48HHFFR6/WdnXXhLm04Fbh6gYM+HahqqGXOw4j7gOUNbL7Dvwxn/Nz3OCOV3Q5turZcfxjqeo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763738094; c=relaxed/simple;
	bh=Bxbrtn2ghsmWTYST7cEpasTgMvNEBVQZRtlsPoj/GLE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mfHflAim8b1FCdrpbC+ZK8EQFXXokfugJ2DygRY+qQwCkPzMJsf2WiAkb5tZ8ZZDS7G7B4w2reP8/FueJ4Zd5Oy/AID/sIMKeSWyO7MiQbcvcSNjcoMNv4MPWjzPeqeCOtaZtKfScQbonFc550h9SAmiLgINVwpBc4t/O5luaKg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=mWzA4m2v; arc=fail smtp.client-ip=52.101.229.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S8r+hgNcysA4dxJa5HneSzgz0HZqWixyB227oTToiZK71Vu6Cg4ll3Z2joGBfqcFeOAq1WQwiOJVfEcA9xdP+8ryDVuErXPh/nZv35JFo+D8VBwzjtquXSeBW+kOwnweg/mwFFL4FlCV143HbYqGe5MflfjZ3xoNEYAJcFgTwvX/DQ5Lc1XJgbviW4G4zRnMW382GEyGEN9lJ7atpJPl0UIX1Rb+z1VAoOmVGVn0gaCO6om/AohagFFfeoCvuvby5clwjA8wDGyhiUhhyVlhBJFpUU6voN5GH9Haq2tpRpl2GHKAwCnt+2ZDsWQU5rE3Bu2ylrK62b8orqwmR8y3Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=31RSNucaOvR7Yo8/VhcQ2Fv+y5h9SwsPdkjmR3IT3XI=;
 b=ez9zFHILWjOk6PgrE+aeLMea8nqHolsjBl/JWHkU27qvwgmOzoVfJNIrx1ENwllTII6CFxlx0XDa/5NKmYzzfx1WGya/+C8KQLnvEO6G8065wIDFBh8Q5MFaKyoJ+fselIQmAisjFkguAhxQ7RDufESTHavZrqzijKCa9UwUQhrCstutHEU+q4liBlc+JC+dblLgQIOZYbKnu2MbDj+l4qCSQ0Rmhnuf5kz/oDWeTTmPd5H7qA7fIOAuyTKxqBnJXVxNVyAsXAaymh1qyr1/ySC/ohlmyMw9Us2WiyWBDncBgW8CZJoXm7XafyTddHzhmT2aLakd0P/U3EOtMN7WvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=31RSNucaOvR7Yo8/VhcQ2Fv+y5h9SwsPdkjmR3IT3XI=;
 b=mWzA4m2vkup3TpHSklW0qxtok3yojNWYvnYHnIFdbglNDHiR0winslNyD9u+BA1wepTJMVxiRz4g2AobFiP/AvFbomLj/bwLdgXWA9c32mPrzrYmrRj/yoettT7YhOQif3n81zOmIzm0/zFTHfKvSLEAQlmIg0GNJdsWl2NQuzE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS7PR01MB16954.jpnprd01.prod.outlook.com (2603:1096:604:41e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 15:14:50 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 15:14:50 +0000
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
	linux-phy@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 14/22] dt-bindings: reset: Document RZ/G3E USB2PHY reset
Date: Fri, 21 Nov 2025 16:12:03 +0100
Message-ID: <7594168acf69cced0b9c7d9f69cd0a306cf5c812.1763737324.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS7PR01MB16954:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bbb94e2-589b-4529-bf5b-08de2910b708
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2Wuxk7j0j0dfBvduSDta2Jk0BIumBm5T5IbSFPd23YOppaef6eu+LqUX+Mht?=
 =?us-ascii?Q?TcB5sxdm9dTNgsT+zns57d1X/cokjBoaHKpD1dubtJqyVioNNZ/UH4f3DTV4?=
 =?us-ascii?Q?w0S2HQIr7pkfZj5o3LpeKtQnsadBPtgtUoNAEnmSifF0WjEdls/gScj+QwGn?=
 =?us-ascii?Q?Dxm4FDvdUNcFKqC50THS01KAXEaRETsmh6NH5LGKhdJYk1U5zfzonEafOiit?=
 =?us-ascii?Q?Pkh+q0Qdal04K93k9W0eP2CVKF0z4oE9BFAHxUprIMLHVYjOqRAuYz2uSj3P?=
 =?us-ascii?Q?z1nGH5aQqniSZNfqACZ4uLB6bx/erNfjSAa/HH/YqfTexcOyvzg+lrZ67F/V?=
 =?us-ascii?Q?KoSwxp161mUyIAGEsWdKWcWpgGtanfFptHIdwLUgQ6mzMP3XjfZ1tUM2i9UA?=
 =?us-ascii?Q?2b7SXt0qIMH4BvyDPekBSzcrv7J/Wtkw5wxovzhaWqrhBB9L08FadZwJlTBY?=
 =?us-ascii?Q?148YCpeQ7/6Wu0ApCUm+mUGZPPi49geBCg7Qv8aj8J58Dv2B+FCrlAYPco3K?=
 =?us-ascii?Q?JLmloETnvjrWbWQ+QK+Fnnau80mBZVBjK/vDOBwBu5XyDna+Ijxh20lFTGZ0?=
 =?us-ascii?Q?qhBfRsu8IW9+n34aZ2rdfpMhRIEbTfBid3CTnqtFgxZK8FBZ/1dDGj8t5oYF?=
 =?us-ascii?Q?Xip42ksAjuugl/UQQIUR1j+qSTROcS1gprbkK22q7E8Qi5tKAG3fUMRC9G1w?=
 =?us-ascii?Q?Gcq4IkqKdGHxA8nIBWXHCpAe/HGQeSWT55Or6NtIgqlKBE87JRPcFrWDCWnU?=
 =?us-ascii?Q?zm2TaT/b1k1LqQz84hYnTd+IXJFpz9HfWKe6N1RxjPCAAt5WYT2gz6P5JvC9?=
 =?us-ascii?Q?pyE8gWLn5xX1JQY0ECkMh/BM+3mtULxwCQd9ksC+DJCgv+e2caGWl0CSDbWS?=
 =?us-ascii?Q?ontw32A4wS2Rr105TETJFwzUZ5rTujGHWnArbRpDTL4k1vwLDCUDND9wmQ8T?=
 =?us-ascii?Q?f25nIibE7K11S8wGODSt/TE2tJoxOXlOIB9M7TR1DHE0wP2HYp11GV6X5act?=
 =?us-ascii?Q?AYxrHcikJdV5aHM4S5ddTVeGS3viEvXkeZD1fuVd//RXsn83gOcLeL9e8wxP?=
 =?us-ascii?Q?IjlDE3o2iFqaB86/p54/JJHPvLnpb3DGq0RtDLpXDzlzAZOZ+2/cjhVAkuZV?=
 =?us-ascii?Q?b4hlNqFo6h9K79LH8NRxg4GwmL1wEB8cpAx1xmaWuUCBWCkCAwzgUGbSeEk8?=
 =?us-ascii?Q?wpwS4JPpxLgk8bws3+WkQMSeAL1Ne2BngPUD1RBLyVfYDJT9+fGYGrNkLwT0?=
 =?us-ascii?Q?uG19Xj16+J86j8ZOjtPheO6s1y8I1NGKSzJ851rnHgmNii8OqeXgX0APYBBW?=
 =?us-ascii?Q?h6FFV5WFFgtKWLhX1EtLmas1flLBi9zmy8TJv0na/cxj/kIkwlvvJ6cCGiMu?=
 =?us-ascii?Q?N80SG14XUVxrKBof/ZivirFf6+NlCzX5dPIRNdOef4ZWWqb4GN1kItOf0u7L?=
 =?us-ascii?Q?v6819MSsrO8VsZdu3QG24hKHdY5ra4r71sRD0sk/LkPgC0DsnFVeyMqjtEBx?=
 =?us-ascii?Q?iPLyfTecpRR3Vs/g53cUO+oFAaK4wmWBmZIC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sf35/CcRMo1YpXr+1HVR9rahEQeT+0dP5EzrLex49wSNNIUVVBW3IXB3L3fg?=
 =?us-ascii?Q?b4s3GlWVCGkccliC0DASCR/E9HabrdONdbQQC4tI83+iXUrr6frvJWHWA5R4?=
 =?us-ascii?Q?CxzZjabscRMn1/TDndTUUmosyg2RIWkBj/7HffFL8iJIQR9v7biWkt+3fJDD?=
 =?us-ascii?Q?YPESa2DIkrQJ7fHW1z7plSI52qySTr8rfiHjBnYl7oGJ+/Ah6dUVKYEMhUsq?=
 =?us-ascii?Q?8zwoL+O7/4t0CUfWta+aB7Cp+ds3TY19YK9W9qtlzgAeOCUonNDjwvHQ8sg7?=
 =?us-ascii?Q?AGMkH70GJ9ZXoYt2Ml2bXW1Vp7lpg3zYj9nPnKX1bNe9tO3dV+gnblwwsUo5?=
 =?us-ascii?Q?5SNrDgWWPG0/126EKMrKHINxfgomR5emHNRomj1apkDpP5ewGWUy6i/kzITD?=
 =?us-ascii?Q?lHuBWgxCtNsOEv44Y01nIoER1IPnLAcvvlF9ZrQgrXgltaEV36yaizjJf86q?=
 =?us-ascii?Q?Ug8SE9GdIlYJ6q+hkR/jKICrtkre+YDnTjkAcxAjpyMD5fSW054McEZnL0H0?=
 =?us-ascii?Q?bp4ZuG3fSHlOgGBKcKH8eF0ppR/wLZq0rPMOAxxwT7lUr+gQXmAbrC/5n1qV?=
 =?us-ascii?Q?UL5kO5AKUxws00L/sFaDsSXJksuhWMbz/EGFFHEs+cEbha6tTCGDg0O72a/T?=
 =?us-ascii?Q?W6pzgP4/w+5p7aM/qZrfg9gVo9Pfpt8Dui99wvzUfBHNJLXqx60wShVJiZxv?=
 =?us-ascii?Q?CKat8wXiP2aHZtFU8c7gjcCIkcWAp5igMqOxtmb0+oX689E1qZMw7YTNGNgE?=
 =?us-ascii?Q?jw+sXJ9oNmA+Ab/Y0SOJtp4IYW0xCEvUIzKURJyBBtrxL/VwUMXjSTVWVrA6?=
 =?us-ascii?Q?ANSO3uEYnRsSriqUBVNAH06SPFC0U7jSwz6PBafSBKyxC8bhHnqDZbfpRe8T?=
 =?us-ascii?Q?ArP61qTN6Ajc4JmZK2UOxdrrqC3/HvsdQ7QGrJebq+ql/xoIXybwQ7lhj/JL?=
 =?us-ascii?Q?Z/q/LiwlLs9b8rh7K+cpD/whei9JPwC2OzwQ56KxN5keRo4/WdwdaxnTWwyh?=
 =?us-ascii?Q?YSEf8ZEgAcw2C0PD31nEFas3hMpijV5gEXNIyeW9G2YJWD2YBswdRWdeThs8?=
 =?us-ascii?Q?8GGRUojie4wwJvXrpMk2l5byNBOp7CNumGhd+hC6NTxBR7REmPQH3IxzSP7A?=
 =?us-ascii?Q?UHomgWv5Pd8qiZaATkwPnkU36UTyGFfKvd+0PdkK+xQLfTyzL5EXKch642m8?=
 =?us-ascii?Q?s/6rnOyVS/CX4nUSjyepXmjoSH5cqXUyRaGa8aVDHCFhT9nqMBjJ2XrQzQxI?=
 =?us-ascii?Q?AiF9FrjUGJ5fIOxcqw23Mt58E09wAv5eUdm467Xj35gP+XrouNB/uWOJIsDW?=
 =?us-ascii?Q?BwET5q8ZMuXZfr9mJUSA1vOgZvO4L0J7PtAZr6oWxveJleX3HomFqjjUx7+A?=
 =?us-ascii?Q?05kk58xid258iDfLXVTx5DZ6xy4BwdeL7YWH4l/zLpkk+TIOA6Iv46CcxOaM?=
 =?us-ascii?Q?g+vUGRpqeyLcZ58HOhUFhK8tin1tqWCRh11W0lJy8Yn5e1sWzMw6mzGvKR1I?=
 =?us-ascii?Q?3dui4VvpP0LdPotL3SioBivTORj01oRA5AakcbGp8zg3auuS5bv0i7bUDK0J?=
 =?us-ascii?Q?GuwNcEFXck9i8BHOCGWtTXO3/zAf2K43mTh/CNxuhdksJzT/56gsdjn2ZXFc?=
 =?us-ascii?Q?J0PK8SAHKcYifVly9kmxfD8=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bbb94e2-589b-4529-bf5b-08de2910b708
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 15:14:50.1292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6X+eAaOTtlTP4Iwc9ZCadTTFnpSxT51XNti7mdwegyD9hqjsX7iZXo3clCfCzBMQOFn2f8XRZrgrEbSR2Jan0vqlqyPag59QP8OF5cWm8+NTW4uNFCtMKYc2rgAGjrjf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB16954

Document USB2PHY reset controller bindings for RZ/G3E ("R9A09G047") SoC.

The RZ/G3E USB2PHY reset controller is functionally identical to the one
found on the RZ/V2H(P), so no driver changes are needed. The existing
"renesas,r9a09g057-usb2phy-reset" will be used as a fallback compatible
for this IP.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v3->v4:
 - No changes

v2->v3:
 - No changes

v1->v2:
 - Collected CDooley tag

 .../bindings/reset/renesas,rzv2h-usb2phy-reset.yaml           | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml b/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml
index 7ed0980b9ee1..66650ef8f772 100644
--- a/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml
@@ -17,7 +17,9 @@ properties:
   compatible:
     oneOf:
       - items:
-          - const: renesas,r9a09g056-usb2phy-reset # RZ/V2N
+          - enum:
+              - renesas,r9a09g047-usb2phy-reset # RZ/G3E
+              - renesas,r9a09g056-usb2phy-reset # RZ/V2N
           - const: renesas,r9a09g057-usb2phy-reset
 
       - const: renesas,r9a09g057-usb2phy-reset # RZ/V2H(P)
-- 
2.43.0


