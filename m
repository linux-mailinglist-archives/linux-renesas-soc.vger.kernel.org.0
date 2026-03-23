Return-Path: <linux-renesas-soc+bounces-30112-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFYLBTtRwWnqSAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30112-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 15:42:03 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 547582F5042
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 15:42:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 655E03018F12
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 14:29:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5908F3ACEF1;
	Mon, 23 Mar 2026 14:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="TWK/rSAv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010034.outbound.protection.outlook.com [52.101.229.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E843AC0D2;
	Mon, 23 Mar 2026 14:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774276170; cv=fail; b=cfQMQUqOS26xLdzvyv5kl0gSimsDwUpMxI8Nnt/uAXMuadvkHq5KwIokc+HS7HfYNNDJBkN81V3YTkXAdSpo7hXUsSw+1qg5pEZ/qGuJ9C0enXnx4+QxB/cjazyWMp4j61hq5Oqd0oY9grJBauzHzPe2RZf4rm8qTTVXV8G8Lv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774276170; c=relaxed/simple;
	bh=dK21P0Xl+FaScm8+vCO2NSrK3SSAPKEfVi5wM3iEqg8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=D2+Tbfg7f4D7AbsYyGspjYu5j1V52o94oEsGDTzCil4EgPcpJdsSAJE21FYz/Oh+xBWD4gcZrR7NmMgIYogJFkqjzuyTm/I8qnI8P0UIlTxuqxtDosVLGHGbIw2M2dXLmLPDNZs7lK+SoiwN+a+hLGab3lJPA62cqAF5M26AtaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=TWK/rSAv; arc=fail smtp.client-ip=52.101.229.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uUprSCL/M4egs9lSn0dtU/T3c0qPyu2kRHr5eEkgXf1yogqDp4UD4OeB8cTKWKAEIx5fcDJWfXtWZBTucU7COr5pfOi7B5yDTplBlSXi+RVQx7nQ5NBswQ1fkVEhwwndmVUSUbNVMM9Tm8Zy2GPEEqmC4V4h6ofigKOUjtzN7CzJMUoVJUY89IzJ7a+RQIn5DGLjuyPc+ktIMESJnZLpGW8gHlTpCfWuW0T8AORx1H/a0yuQBUWqBki8kAx+JLc75fjc2xSzje5FIaDmbwOjm/giLtu0D02NYhxuKKS7t91xkSrJVC0ytJ9IU22SgS7lxGK3P4YBkLr32p04lVjHBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZYs4R4xzdiICwahr3K6e2cZluJEPXNMEo5oFz8vjUF4=;
 b=yDkevHx0p9WjHbtXn3hkUWHPvCcV0lG+xlgFHQApWyh6+0BQS2JaCDHQAxnXCQhiJY9UA4XxXFizeAWoqAIu0SFtm2fuiX+jsc2t64vPnNOVqv7AGJIDbLCiBwJxDRDZZQtWoUyScu87vWig2IZa6Pkylhrim8yBLNfT5JE6qsQ73Y31mhP2q3Iqx55I6/hQMhx2/1QUkrAdq345f8QALEP6Xep1Mqn/K3F/CiJ2jc6vjG2sGhArLNyZzxfwY9+g7boR8AojMNW7Hx+bCaQY8TptB+G7QpBL2p+m93VjImvWOQl5RXgrbBuiR8SV2Ffe/eMgyUNUu1k0xL/m0zdW2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZYs4R4xzdiICwahr3K6e2cZluJEPXNMEo5oFz8vjUF4=;
 b=TWK/rSAv1xcU8K1WUiJHR5Cm68CCMj9ygh/0oFBalFangkiYa4srZpBwseXSOj5qtOVwro3sLQqrbqxzi1Ih0fLVXnvcdKXpYMBFIEAoChA31Wkw2vFvxEuKDE9PT5QnBFWNW53Bgr9N6t5bDcISOqSIodOBSE3TyEMO+lhmhI8=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB9893.jpnprd01.prod.outlook.com (2603:1096:400:208::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 14:29:17 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9723.030; Mon, 23 Mar 2026
 14:29:08 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: biju.das.au <biju.das.au@gmail.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v7 07/10] arm64: dts: renesas: Add initial DTSI for RZ/G3L
 SoC
Thread-Topic: [PATCH v7 07/10] arm64: dts: renesas: Add initial DTSI for
 RZ/G3L SoC
Thread-Index: AQHcuFdMm6nnXsXSjESsw8GFOUhQL7W8KPMQ
Date: Mon, 23 Mar 2026 14:29:08 +0000
Message-ID:
 <TY3PR01MB113465CC825EDDACD7C363DF9864BA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260320104950.42220-1-biju.das.jz@bp.renesas.com>
 <20260320104950.42220-8-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260320104950.42220-8-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB9893:EE_
x-ms-office365-filtering-correlation-id: 4ee04db1-7838-45f7-0397-08de88e88b50
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 Xam2/m9JluJNRft+fjDtJQlDc6+33w1hEWobKPQM05rCBUKMsHF2MB4NXDKMO1OF46VS05YE/g6UT9G6F9nEvLaYIX1pvrJQVr3JCgkfcn013EE7fGmwYkhkiYfRDzNz5A9RL+zuR/g4obptB5pfJas5lPwixnWvYfsddBSdx0QZIaTe9PYPZXrmIlZ1Spfz7nVTXppX++Jh7rp5z06d5/a6CbYpoQ3lASz8p6fkzNKgaO2b4cqMP3/7v2T/mAHH70uDAItCqs/ZjW9+L6Bw0lnXLn+CNuXYbURs4c1i3ys3+ks7HsEVgReI+hpnBiH7mHove/TxJZJUmr/3hG0W+AssN4qvqarUNACHuOWUpQX2XPRIhq5vwcFuIoC1L1IrCz3mYz0auIKiGFT1EfYYs1jvSkt8fCSBCqDvTL8YS/s0tZ/mzkt8ykKKvVEzXkI+u9TqNQQgLu3Li7E+Yv0Oopk3leyCbixUuS2QY5RfmLTvci1dbVjNcoaj7lRh34EmDgpeSaJoS3fOmuouanG/06AHrQAIQciJFOaigf5QYV+emXcksJBD7B03mj0CszA0JPBInn/2Zxb1JP/5O/AednRnHtTwwSQSA05qvLexBZMhVwWmr57bCM1g82GJWC3ugUOJDhwAYk3L8rUegifBkVdOe8QZmsPIyBRU7dAko4jS1fBs4NvzdwxrWzQ7t1LJLndEOk+PV1sV03uxRlzBj8aRtqJabFaqvk9t2b2Mw+pDUvPvF1fRO9RecyNOqMAUAsdGcyQj8ZzXyg3uZQhQ//0HTJlL5oZdUNZr+Is7ztE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?/i6wLqvaS+OIv/gUQ52otDixX6B1EkkiUuGOIcFDhiQj04twI+Z38qyJQczE?=
 =?us-ascii?Q?p6LucH55oij1CE73KYk4K1oXwiAWLA02r8s2G8OE5isFyVKaZFPUMCrDe66i?=
 =?us-ascii?Q?k9qbuHiHa2ufEwlCU2Bo/kwyQWbQfr5gHjtZpXPHigejI9I2NoqjWSSUbpPq?=
 =?us-ascii?Q?h1w8uOBO+5PNs/QJS3V7gZ6WGIzwhLcxAzWn80r8DMGCfH47vMlp4C15QK96?=
 =?us-ascii?Q?xazUq336gdcUYBDLOOLYTtXvofhoPUVNpzfOkVB95g6arLDznnIoQniAQY1X?=
 =?us-ascii?Q?KAZrVbIFaWEU5L7F9UQDa9riiE4O8cZ1TAXWZtMCm9Pmc5mlUQRXlsVy9q6x?=
 =?us-ascii?Q?M6f062kRu62cyZS9mD7rSmSuV0jiNyjyNn7zo6KrGIHtDMPMdC5r7n8rIn9m?=
 =?us-ascii?Q?MlG2bgVo5paAA1hORD29VJY+AxAvJZn3HHknsdNFR2K+w5LuCgTinxyRPF0q?=
 =?us-ascii?Q?iE90GPxF4QEwgij0KNNaCzbc/QrmV9C7GniWge68kz2LT2asNxsOF2INlzM/?=
 =?us-ascii?Q?M44k0wGeJtzViruqFt3D0oldJuSKysTVEZHD4ZlPbQFgSFaSECdNKSQu3cG3?=
 =?us-ascii?Q?bxMom9VCvXkO3A1nu3esRfsaR6O0ApwDOOfCA4QIPQ1V9ISR4PC64+Q8fQ1r?=
 =?us-ascii?Q?ILC1g5MuvK0OB0wTjcQ4T6py9ieWX2JP/0bg8FBDlZgboVH6XiPvUapIscw2?=
 =?us-ascii?Q?POWF2dgpLt9jSBo4GHg5kHIK4JTuH5fTxRzga5MqMYyELFFMSJOW2w7zKS+g?=
 =?us-ascii?Q?UaIFCaJofdMl/rE0V4t2Ccww1tDEQMYNRkprxcTcqfUhhVAXULjTMilbxcxE?=
 =?us-ascii?Q?2CtmLy36XnzRcc/CiIVhsX9xcUsFEuvptAJE+4ycvv+An7KLze2Ats8JyMdE?=
 =?us-ascii?Q?pFGOC54EJjW0AJzlsbk00ZkasPwjRFWqO+fA+ZlGS9EM07yuOyYBqd31oHCc?=
 =?us-ascii?Q?ZpsNBqRPiIa1ZzcpkJAngYM9fIglz5GwDuUJL0vR0SyXStitJ1PSEGl4fbti?=
 =?us-ascii?Q?ktFMYL35dSbv/eGVuIjAY2SgLSz8uK6AdwLGxJYlWpKL4XXOXWFEY98RhRti?=
 =?us-ascii?Q?9SqZh8Ftj/RqU2JpQGhs5fqQrAzZ+HLoEIV5Uosdpu/ckXtgMPjZmgniXVo4?=
 =?us-ascii?Q?Sv35dghIfJXnaUe1r65y8FJS1b18HhgpC57DTLiqmvKGgo0f78qDxepF+sY0?=
 =?us-ascii?Q?XRXlncgD9QEbHJmC2af07S0OGKcIjYyjU1uRVo+1eCeVR3WCR0/KpJflx0Zu?=
 =?us-ascii?Q?Jq9bzrwgcLJsjZpRIUJiM/Y4iCnT6aEz9K2QKR8j/pZzx6+it2l54O24zj4j?=
 =?us-ascii?Q?T2TZi/tTQSmBKFMtDg25VeUDvUicH+QOWqUb7lKtw/tK0HKxdPtFTtJyww09?=
 =?us-ascii?Q?fjmKN1F6dKg9y3bVE4tRE5zZ2QD+/VvcmIyOiIIXfcTJ3+UI6MwbC+iwNggq?=
 =?us-ascii?Q?mmfC4zQjNhP0ZGJHWMCHaEkAR8w/kG4TN/RYm6YV9xJSNdg36I8WIg8o9XqQ?=
 =?us-ascii?Q?cFZ2lQuNvf5E5od5EJiqqtGqrHI1tz/urUdmYbstxBBpdlE93iDMWk/KHpVN?=
 =?us-ascii?Q?AfBWWP5G5FsjOaEczzOrxZ4yzdzcucx1hZpuVi5MUM5ctDeEcSv53DO6/ddd?=
 =?us-ascii?Q?Jtkz6sY1YY9OXG8WPyrMF7UNPwYmhFC5FjXgTnAOix8FBRY7+KkMGu1deb+v?=
 =?us-ascii?Q?Bou8aQQHyZLYIQsUkkhKs611tufM5Ty8iAr8N/xsc6WlyFfBLUs/3ybx8dql?=
 =?us-ascii?Q?t+vP/jrg0w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ee04db1-7838-45f7-0397-08de88e88b50
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 14:29:08.3960
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N+qsFIw7GiQLJ0C79PP/43tXSOvLX8bal/tL81x5T2Pv+D6LvbxSJIhBsyHrsONkq8U9fr24Rz7MWeyuVClhRtvBJtsyeBvBUrRJokOVRFU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9893
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-30112-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,glider.be,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 547582F5042
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi All,

> -----Original Message-----
> From: Biju <biju.das.au@gmail.com>
> Sent: 20 March 2026 10:50
> Subject: [PATCH v7 07/10] arm64: dts: renesas: Add initial DTSI for RZ/G3=
L SoC
>=20
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Add the initial DTSI for the RZ/G3L SoC.
> The files in this commit have the following meaning:
>   - r9a08g046.dtsi:    RZ/G3L family SoC common parts
>   - r9a08g046l48.dtsi: RZ/G3L R9A08G046L48 SoC-specific parts
>=20
> Add placeholders to reuse the code for the Renesas SMARC II carrier board=
.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v6->v7:
>  * No change
> v5->v6:
>  * Dropped dma-ranges, bus-range and comment from the pcie device node
> v4->v5:
>  * No change
> v3->v4:
>  * Fixed typo R0A08G046L->R9A08G046L in commit description
>  * Dropped R9A08G046L46 from commit description
>  * Dropped unused audio_clk{1,2} andcan_clk device nodes
>  * Reordered i2c device node and updated reg entries by using lower-case
>    hexadecimal number
>  * Added placeholder in pinctrl node
>  * Dropped unused DMAC device node
>  * Added pcie node with placeholder
> v2->v3:
>  * No change.
> v1->v2:
>  * Added external clocks eth{0,1}_txc_tx_clk and eth{0,1}_rxc_rx_clk
>    as it needed for cpg as it is a clock source for mux.
>  * Updated cpg node
> ---
>  arch/arm64/boot/dts/renesas/r9a08g046.dtsi    | 212 ++++++++++++++++++
>  arch/arm64/boot/dts/renesas/r9a08g046l48.dtsi |  13 ++
>  2 files changed, 225 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/renesas/r9a08g046.dtsi
>  create mode 100644 arch/arm64/boot/dts/renesas/r9a08g046l48.dtsi
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot=
/dts/renesas/r9a08g046.dtsi
> new file mode 100644
> index 000000000000..e030e785ea2a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> @@ -0,0 +1,212 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Source for the RZ/G3L SoC
> + *
> + * Copyright (C) 2026 Renesas Electronics Corp.
> + */
> +
> +#include <dt-bindings/clock/r9a08g046-cpg.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +	compatible =3D "renesas,r9a08g046";
> +	#address-cells =3D <2>;
> +	#size-cells =3D <2>;
> +	interrupt-parent =3D <&gic>;
> +
> +	cpus {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		cpu0: cpu@0 {
> +			compatible =3D "arm,cortex-a55";
> +			reg =3D <0>;
> +			device_type =3D "cpu";
> +			next-level-cache =3D <&L3_CA55>;
> +			enable-method =3D "psci";
> +		};
> +
> +		cpu1: cpu@100 {
> +			compatible =3D "arm,cortex-a55";
> +			reg =3D <0x100>;
> +			device_type =3D "cpu";
> +			next-level-cache =3D <&L3_CA55>;
> +			enable-method =3D "psci";
> +		};
> +
> +		cpu2: cpu@200 {
> +			compatible =3D "arm,cortex-a55";
> +			reg =3D <0x200>;
> +			device_type =3D "cpu";
> +			next-level-cache =3D <&L3_CA55>;
> +			enable-method =3D "psci";
> +		};
> +
> +		cpu3: cpu@300 {
> +			compatible =3D "arm,cortex-a55";
> +			reg =3D <0x300>;
> +			device_type =3D "cpu";
> +			next-level-cache =3D <&L3_CA55>;
> +			enable-method =3D "psci";
> +		};
> +
> +		L3_CA55: cache-controller-0 {
> +			compatible =3D "cache";
> +			cache-unified;
> +			cache-size =3D <0x80000>;
> +			cache-level =3D <3>;
> +		};
> +	};
> +
> +	eth0_txc_tx_clk: eth0-txc-tx-clk {
> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
> +		/* This value must be overridden by the board */
> +		clock-frequency =3D <0>;
> +	};
> +
> +	eth0_rxc_rx_clk: eth0-rxc-rx-clk {
> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
> +		/* This value must be overridden by the board */
> +		clock-frequency =3D <0>;
> +	};
> +
> +	eth1_txc_tx_clk: eth1-txc-tx-clk {
> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
> +		/* This value must be overridden by the board */
> +		clock-frequency =3D <0>;
> +	};
> +
> +	eth1_rxc_rx_clk: eth1-rxc-rx-clk {
> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
> +		/* This value must be overridden by the board */
> +		clock-frequency =3D <0>;
> +	};
> +
> +	extal_clk: extal-clk {
> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
> +		/* This value must be overridden by the board. */
> +		clock-frequency =3D <0>;
> +	};
> +
> +	psci {
> +		compatible =3D "arm,psci-1.0", "arm,psci-0.2";
> +		method =3D "smc";
> +	};
> +
> +	soc: soc {
> +		compatible =3D "simple-bus";
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +		ranges;
> +
> +		scif0: serial@100ac000 {
> +			compatible =3D "renesas,scif-r9a08g046", "renesas,scif-r9a07g044";
> +			reg =3D <0 0x100ac000 0 0x400>;
> +			interrupts =3D <GIC_SPI 386 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 388 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 389 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 387 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 390 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 390 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names =3D "eri", "rxi", "txi",
> +					  "bri", "dri", "tei";
> +			clocks =3D <&cpg CPG_MOD R9A08G046_SCIF0_CLK_PCK>;
> +			clock-names =3D "fck";
> +			power-domains =3D <&cpg>;
> +			resets =3D <&cpg R9A08G046_SCIF0_RST_SYSTEM_N>;
> +			status =3D "disabled";
> +		};
> +
> +		i2c0: i2c@100ae000 {
> +			reg =3D <0 0x100ae000 0 0x400>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			/* placeholder */
> +		};
> +
> +		canfd: can@100c0000 {
> +			reg =3D <0 0x100c0000 0 0x20000>;
> +			/* placeholder */
> +		};
> +
> +		cpg: clock-controller@11010000 {
> +			compatible =3D "renesas,r9a08g046-cpg";
> +			reg =3D <0 0x11010000 0 0x10000>;
> +			clocks =3D <&extal_clk>,
> +				 <&eth0_txc_tx_clk>, <&eth0_rxc_rx_clk>,
> +				 <&eth1_txc_tx_clk>, <&eth1_rxc_rx_clk>;
> +			clock-names =3D "extal",
> +				      "eth0_txc_tx_clk", "eth0_rxc_rx_clk",
> +				      "eth1_txc_tx_clk", "eth1_rxc_rx_clk";
> +			#clock-cells =3D <2>;
> +			#reset-cells =3D <1>;
> +			#power-domain-cells =3D <0>;
> +		};
> +
> +		sysc: system-controller@11020000 {
> +			compatible =3D "renesas,r9a08g046-sysc";
> +			reg =3D <0 0x11020000 0 0x10000>;
> +			interrupts =3D <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names =3D "lpm_int", "ca55stbydone_int",
> +					  "cm33stbyr_int", "ca55_deny";
> +		};
> +
> +		pinctrl: pinctrl@11030000 {
> +			reg =3D <0 0x11030000 0 0x10000>;
> +			gpio-controller;
> +			#gpio-cells =3D <2>;
> +			/* placeholder */
> +		};
> +
> +		sdhi1: mmc@11c10000 {
> +			reg =3D <0x0 0x11c10000 0 0x10000>;
> +			/* placeholder */
> +		};
> +
> +		pcie: pcie@11e40000 {
> +			reg =3D <0 0x11e40000 0 0x10000>;
> +			ranges =3D <0x02000000 0 0x30000000 0 0x30000000 0 0x08000000>;
> +			device_type =3D "pci";
> +			#address-cells =3D <3>;
> +			#size-cells =3D <2>;
> +			/* placeholder */
> +
> +			pcie_port0: pcie@0,0 {
> +				reg =3D <0x0 0x0 0x0 0x0 0x0>;
> +				ranges;
> +				device_type =3D "pci";
> +				#address-cells =3D <3>;
> +				#size-cells =3D <2>;
> +				/* placeholder */
> +			};
> +		};
> +
> +		gic: interrupt-controller@12400000 {
> +			compatible =3D "arm,gic-v3";
> +			reg =3D <0x0 0x12400000 0 0x20000>,
> +			      <0x0 0x12440000 0 0x80000>;
> +			#interrupt-cells =3D <3>;
> +			#address-cells =3D <0>;
> +			interrupt-controller;
> +			interrupts =3D <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
> +		};
> +	};
> +
> +	timer {
> +		compatible =3D "arm,armv8-timer";
> +		interrupts =3D <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-names =3D "sec-phys", "phys", "virt", "hyp-phys", "hyp-virt"=
;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48.dtsi
> b/arch/arm64/boot/dts/renesas/r9a08g046l48.dtsi
> new file mode 100644
> index 000000000000..f6f673abc01b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a08g046l48.dtsi
> @@ -0,0 +1,13 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Source for the RZ/G3E R9A08G046L48 SoC specific parts

Typo RZ/G3E->RZ/G3L.

Cheers,
Biju

> + *
> + * Copyright (C) 2026 Renesas Electronics Corp.
> + */
> +
> +/dts-v1/;
> +#include "r9a08g046.dtsi"
> +
> +/ {
> +	compatible =3D "renesas,r9a08g046l48", "renesas,r9a08g046"; };
> --
> 2.43.0


