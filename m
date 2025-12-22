Return-Path: <linux-renesas-soc+bounces-26002-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F82CD6402
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 14:54:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D61F3095DDC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 13:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60DC933DEFA;
	Mon, 22 Dec 2025 13:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="QseJK/YY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010032.outbound.protection.outlook.com [52.101.228.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E7033C182;
	Mon, 22 Dec 2025 13:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766411174; cv=fail; b=UqMPPW6Pb5fXWeNY4OV7S1fv+F0Xm4zqFFPq9fvn8XVoUZ2LKBtXJXK/oE9QtaV/KdDlIpAZzMosw/xn/NLY2y4G99LOFqQSYMYY7CbR6swvNpRj+C9/L4zUwqUuwfu+Ed/a6WypLy+NhJSTCgmGPhs47vUC46z7KnzZz/uRK48=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766411174; c=relaxed/simple;
	bh=o1eCIreV2qu/SvvKGeQElJ0VPmVJb2Vq/VfvPEjVdu8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qtIiqSBQe9Iyu4k1lwGJiyPiKM7EEfiHnrCosv8D68GovtlvguW4iY1PmcYcbl5xEuSP+kNgoYTOe4UjF4Y+tLhMWAvPYET0PYQuGtOlcqVtI+O8PD33Ogkunby0vQWGjbFK4dewuWBm7ozqNvFnA9PThos7tjboC061bcusKdQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=QseJK/YY; arc=fail smtp.client-ip=52.101.228.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mlt0bMnL6SNq9B+3gPnd51Kg66JWY6JzYY+uscuLbuF+F3mCfueaaCZCsCKUXFaQAp83PAU6h+xrQq8F7zDyh5rMA7H2AFiUaw8HFfw1eUG9cH0p0j2nWKWSBPalEzJNTobnPL8GIZxgVRMOn0aCDVVAvjRB/e41DJw0/aAusVJkgekKnjFBahO++do+n2qPG0JUP0Eb7EldZkHkupuU5OZs9I/EDi/WyOt0EIEeUXepIirW7KdlyevaBdl7a+7sYNN7iu1QvxWS4XmkS1fr863st1dyVH4Xg5i4yfie/Kz9Q3hJrd9TWbZPBKnoeCbkTB2Js0Fd+yT+/xy7VZE5Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3g+wXBrHP7LMSAtPHHn2TmDgK8SWILn+RwLjXdk9HUQ=;
 b=qUdevmQIczdz59bxa1SKL8iFYApzgDWZaOLSzaGabSoUqQFmDBEvcvjl9o3bhq7XW2FaXfivokt+VvZr1Lkz4EKRYf/DLF0jnZtOc7srLszn3q1yTsXJl2WJmsLPB4n01xsSKhFJ5NhmFxxFNceV7zxPmaQWEIYZNnJAWH+CkbjMjtrvwZQSal3mzienGc2iQyzgazioZRDZQ55qEuvKz7BmzXqyqvVa1bCl44cysY60S5ubMAhJ+TRa+q5voNfqEW17HdvxUSDpxSzO6AcR/RujZdlm5HfSkHSns5wYwql+TgVGp/QBTSY/M+XT3PT+BOvCkXqAMe3w3qULMHSTlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3g+wXBrHP7LMSAtPHHn2TmDgK8SWILn+RwLjXdk9HUQ=;
 b=QseJK/YYkddaCXkz8WMYqHtJGjC9cWvkwyJF8jmesmLPMx1ofPjPjJBuNHYjiDUkIt+ClVdmHRudKr08BKsICyUDRNUsUMngX/62/OjW5L0rULlUXyxiakB2NdD224ZI83T51L0zs+8McPlge4liRSMFApGWD2qb2GEJnXAEG80=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS9PR01MB14304.jpnprd01.prod.outlook.com (2603:1096:604:362::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.10; Mon, 22 Dec
 2025 13:46:10 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9456.008; Mon, 22 Dec 2025
 13:46:10 +0000
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
Subject: [PATCH v6 14/14] dt-bindings: usb: renesas,usbhs: Add RZ/G3E SoC support
Date: Mon, 22 Dec 2025 14:43:48 +0100
Message-ID: <6d623fdd5176212a960d9ab72c5e117d53b407db.1766405010.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 8ba26b3e-63f4-433a-170a-08de416076f7
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hMdBQxvGXxhDFju8mF0EvEUwSTll/hiIO1NBt+mL3CbCoJKiv+2bCNHbUVMV?=
 =?us-ascii?Q?XKA9mQAs5cV/kxuH7keb4ieI2q2hsuB+4Df3uSlc7RbuwtaOtAXQYCuMIU9R?=
 =?us-ascii?Q?qZPed5l+7vmkl1lbbPz+PzbllN1noBRBquYBlG+yPOtVOEIV8RH0Bp3Vd6Dp?=
 =?us-ascii?Q?8DY+FuHKyYShIz7rnOjCXkyqrqWK4aMj8nwyGzc+v+Tbb2BZ5sOwAzbBLJ7D?=
 =?us-ascii?Q?6sGukB4rqDmzfHlrNv09Ew/l2BLJBoyFN+9XUkoGAjZ59TkJJNO45ba8uIdd?=
 =?us-ascii?Q?tHOkIMKEkynasO2G5xnZNOBUZqQGBQKmUp2xEpy5c2XqqSS8KtaQZv5LNXzt?=
 =?us-ascii?Q?UkThKIEG+w0I0xq8qD/xqR0eZS0rHiWHAxB/GnNGIw0KnqWyAkAI2f+vXogH?=
 =?us-ascii?Q?3EyDdbgRv3GguDBys93XiIIY40nvIotM53UJWQJlGHxJURDHnLMU71q4rJhN?=
 =?us-ascii?Q?6hqadJQ8SAjkkZNzzHEuLMOLZup+SmRMMzM9xb8o4hOOstBtSLFmtlU4Qy5t?=
 =?us-ascii?Q?HWeeoOciNENEY+hQ1pHi4CuRwFCB0caDM5GZne3+mFrhWHNaMippSuXIEjAo?=
 =?us-ascii?Q?cxX6/i8jZuDz0+QElt3/cwkaf5fFNOOpzO3KU/GaiCpztXuN2MDq7niqAGkm?=
 =?us-ascii?Q?bmMzV02LpQEBI2OByeA9Nl8YT1uj7uFN4FDSWriV7Fsu1NVk6SuSsNR9q1Mm?=
 =?us-ascii?Q?OelLTJImKmOAgRrueMxAJTP+zP7QjnctnkbId8AvZpzsNfLvyl1i5XV+idK9?=
 =?us-ascii?Q?KpvdwzeMFSjgj9v0Py9FHYPPS0jklGW2wcy6zdNCNS+UUTOXXuF3qxMFWTL7?=
 =?us-ascii?Q?uBFQQxwIS7p1PJNOH53iMjrkSyyNa2R+eH+5XqS57pDfBpoTDM2+mtx3uv+r?=
 =?us-ascii?Q?tEH6Yp2mnNU59ZS3ixgFXWMm0j8HzDZdflNGKPZdzw8h3Ei8VMZbdgKTEJGQ?=
 =?us-ascii?Q?zE/3EnKTIhVABbHIwaB2uGfwBYb6251JrJnoA39QQm4zLpUIB4DRiylHtmtI?=
 =?us-ascii?Q?3tA3mVsVIsMsMsxPD6Sr47MSKx7R6BFEFrXCYdyv6znlYrJvB0MyjT9eKjyc?=
 =?us-ascii?Q?ZVxMTZwUGonnUOOxW6X33s7y5g2eJDKZci7vskPYLgKveeidz8wN6j8Lod37?=
 =?us-ascii?Q?6O0F3NYWj8Kiih8acWwOyXZkB00LgKsvSoYHevGHQU1ta2jUpHRGPGtzs1bt?=
 =?us-ascii?Q?voYTZZTMN4R5FLNc2wDoHJ89qsOVbbWrqkjiVnr8u48H5EPWn3RS5a9Mvcu3?=
 =?us-ascii?Q?z5uWWB0ymNF5Ca0S+k3XGCa5vXR8mBQaUJbsYSbtYbRiKfKoQuMo3c12C7Rv?=
 =?us-ascii?Q?d3b9vW1aKlNmrgInkBUxId1ImMFU2Ic2u7++3h5MUpAVRC/svNfe33qBTF2s?=
 =?us-ascii?Q?0aHhHnjRHBa4vtFM/h69v6/Woqa10c3OuMEj6LjQCpDQ8wO5xXZr0POEpXia?=
 =?us-ascii?Q?FPmUDyI6m2dwVQzJELzMz+wjkoGEozaTueRvQjTS0lQu+k/DvSx8IwOUiKF7?=
 =?us-ascii?Q?dpKa4pENh3VnOvV802aPAJF7HeF1F5N/5fuS?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SZJFAau39PQaca8cKar+FuTJBXgeNBTpB+VHHQ/T9f3rHAXARnuc90V7iI1L?=
 =?us-ascii?Q?P+AJG9QlAM5HYCbf5DbFax1W8wdqM0VUaIVZXXhawtxr/A3BRpLS6XxtEUv7?=
 =?us-ascii?Q?+KF4Zz6vb0K7NiwSnwuo+tj03NfKofSsJznVhxz0g/CnI2besNgIgNl7j2oI?=
 =?us-ascii?Q?bVs8Vm9QgTtubpPdK9R7NwvkaWMYGLxTy0D1fsYOcpXepaw5JFpe6J0eXJoi?=
 =?us-ascii?Q?KEcKFNhQf+RWZRtZ7HptsbG7tQNIpemHzWNKpVj3joOqThMfgtL7SqF9KwaN?=
 =?us-ascii?Q?AW8eXJISwEkj2lhX9VSWCJyV2DK1tjqYRDycJKP/B97ItCotMelkkPQVeVaI?=
 =?us-ascii?Q?QX+uRSwuWFxJ2jzcySG2FUgG6CJERLZs80HHIGu+6Ov07ZSvKpoXVli0+78P?=
 =?us-ascii?Q?ocX5meQfM1pKaW9LqXQipx/22Tllq7RJ5inGNrolKI2Vvq4seZvLljykO9h7?=
 =?us-ascii?Q?f+A4AnneYekB7e+MtLViMFdSm10nxn2hsZv8GkNXPBrVDNI8JFR86q1fwSLP?=
 =?us-ascii?Q?Mxajwj73XHb/G8RxQwlUH7SlXLiu+ZYbiUrIMCUrzFOj+0MUfNYbmCcYMmin?=
 =?us-ascii?Q?3wSB6yv7dL51ZG+mKEMSHptJiF+kSPD3E6t3ji1lmhCvPwGpvntQ00Jm1Fq+?=
 =?us-ascii?Q?hS1g/R6lKqrKTg3RtajiReuEbMOU6NdF1a7ayvUYAHgzN/57ox8D5hYGLJ0T?=
 =?us-ascii?Q?D//P8zRjDCUT9bUgqQJ7jnIa4hT9DsKme4xYK1dDMpBotzboHcMAf3Z/s1/b?=
 =?us-ascii?Q?3XI4s4dOKjZUOQRVmV1q6vtgz7Gm7Env+LaGC5kjXLF97ogCcvvTAYC0X5pr?=
 =?us-ascii?Q?+DrV0sNtUD5pJlO3N92D9oX4ZNygF9JNYS8m8F8aTspPx5elUgyfj7FUNpEA?=
 =?us-ascii?Q?QbJd5ELj4SMtO3NOhN8KDcXOAE8Z4gICMf0Bw+IBfcDrBSGhasuJwdLb/nec?=
 =?us-ascii?Q?oOdpSJD5IIP2+xtoscy2xxqGNA23t85gIyfOGOKdkJbmD95budgPnyV2wUuc?=
 =?us-ascii?Q?JX2R8R3srikJpX0ArUABdvOD52ksjLYfMByeNZH34h9FZ+J011tWTzw5FbMi?=
 =?us-ascii?Q?q4w0R1sY1+m6fp24cSawmq0o1A1XOVi9kopTYOcMZbur7iPIWFurLEUVByPz?=
 =?us-ascii?Q?LdEf0aaN0EMeeQwSNfLRZtvjdZo8K3ESTEXtS0PzRIEwIsLjADraJhzp2p4D?=
 =?us-ascii?Q?XanmgGAFTrvgC/QTLD61vK5XsSWYmZBs6Gi1slkjR5rejUvK58xRBKFH5yRi?=
 =?us-ascii?Q?P+tZoclrDbjs8hteBIA2t4IG+YSLCSudfBwhgdsBSpCOf9/EStXtGXnsL/qX?=
 =?us-ascii?Q?qo1M57rXZbIkso2OjZVCetiVaZMsRJwpDjZT8vRQQ+NiFC9116eKq2ShhTOm?=
 =?us-ascii?Q?oYN7pY9m5FCI8e23bynoIjqqGtLgncmQUeeB6i25LdFQaNNSSFX12pZDU0Ho?=
 =?us-ascii?Q?3/lME5mGBTHyPliAQidPbLaCtJWu7S/Ei3pBDFJNs5Ng4rBIOD0j0BL+zDWb?=
 =?us-ascii?Q?NrC3cWwVpoWCZMpSrN7QlyOmE2slTnlkaWsE6QoaIE274c6B8/CUadkz9OOV?=
 =?us-ascii?Q?7LmsOhz5TA31ndae3Bo9FJ8a4SdSfzDoeOxilNcaPdDmCDtBO8M+VaxmmmKs?=
 =?us-ascii?Q?rz0wChkliwOUE+FWiKEJsMswJZMuOTo9JYaiuR9lx3cu7TGhvXHg9t0o68eC?=
 =?us-ascii?Q?V5BKJWiTu2WOsDqpxlPihRBLOJc+uXbQxzfEyoJ4ukY6XOl8QT0N5lq/3VRG?=
 =?us-ascii?Q?HMn6qw8cFcXE6V1BJF9XG2OLYdZ0OR1RtRawVEH7vDdrl/9TIeDf?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ba26b3e-63f4-433a-170a-08de416076f7
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2025 13:46:10.3014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DiIErYQEbznnOkQ8oAZUXi7wZ0UyV2Po4MyH36LNCwEyZ8yFy+ya+mLAR9i5uhslW+rqL2p9CeD2BuXhfT3WJez2iLDIqkTALysq9DhFeCGwpBpGP/bXRidpxVlNeJWA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB14304

Document the Renesas USBHS controller found on the Renesas RZ/G3E SoC.
The USBHS block on RZ/G3E is functionally identical to the one found
on the RZ/G2L family, so no driver changes are needed. The existing
"renesas,rzg2l-usbhs" fallback compatible will continue to be used for
handling this IP.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v5->v6:
 - No changes

v4->v5:
 - No changes

v3->v4:
 - No changes

v2->v3:
 - No changes

v1->v2:
 - Collected CDooley tag

 Documentation/devicetree/bindings/usb/renesas,usbhs.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml b/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
index 0b8b90dd1951..dc74e70f1b92 100644
--- a/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
+++ b/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
@@ -27,6 +27,7 @@ properties:
               - renesas,usbhs-r9a07g044 # RZ/G2{L,LC}
               - renesas,usbhs-r9a07g054 # RZ/V2L
               - renesas,usbhs-r9a08g045 # RZ/G3S
+              - renesas,usbhs-r9a09g047 # RZ/G3E
               - renesas,usbhs-r9a09g056 # RZ/V2N
               - renesas,usbhs-r9a09g057 # RZ/V2H(P)
           - const: renesas,rzg2l-usbhs
-- 
2.43.0


