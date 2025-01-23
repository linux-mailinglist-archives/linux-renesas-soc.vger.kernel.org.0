Return-Path: <linux-renesas-soc+bounces-12375-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F650A1A114
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 10:47:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 350D13AC3C5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 09:47:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E12411E529;
	Thu, 23 Jan 2025 09:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Xi74VzuB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010032.outbound.protection.outlook.com [52.101.228.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B1D20D4F8;
	Thu, 23 Jan 2025 09:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737625634; cv=fail; b=ls5gl7ulA3x+wR0N9Id+s02yDqvN2YUzOo0MaxinpkPF9fpHQakWHnKy9sDgywf07Wp5lmX0+NrMfup9e+RLDMpdbv7/Cjj6bfn1l80kt/miSSi/V4v+Vfafq8Y34tjI7MHttB3SujILIZqUV/C6zH4LQdRYkd12isjuBTlgd+E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737625634; c=relaxed/simple;
	bh=ietB86ylDMm7sx9bNn8cAjzOwRxd4GcAb4inQQ8uCKk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pG4N2poTVXoOsMNAytuzSuZzS7VsL0oFgHaWaevPnqo20PFW9xNeEw+gDBEDGgEP5fE7KhK+W2gcOeKiavHmfC0X7/NKFntSiXfyMcL/bV2ESpZLzD3J97KwTZbTXqpsJh5SgWlc8blAhvbHFKWR4y7tM8cntjjPGeGybDECovU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Xi74VzuB; arc=fail smtp.client-ip=52.101.228.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ALG8egUYJF0Wxm7qMCVy1c4j1nxAzo7lOlzixvZHq5nTp1jq8PayW1oBUf8PYGEUCVHGfH7M6yF9thrDYUORocib3lrkL5dsRXKkJWl1oV55Dmjbf4j99I9qhWVi2eiw0MW6eUaI537sod1UTJr6QiVH7XS1M0ClHQn8HlvMcXxqDj5dzqMV8my4bTRBpW5CtyCKSqU5zuQfbMb0CL1yX6md5CZjLFTBYoUBVW4rQN3vp2mXnhC40MYmFr2esUQnhv2APaOUE81US0fW7m4ub2mh1P6nQ6AWnUZ+j/go9TucQwzK1oicwOb/+kiEUD3DV8k6VtBb/pFB+olMTwGZSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O+gi1LLFRTGlSPUvtpVCa76J/9I+wn5umWFvCXyJUhA=;
 b=SMF7yUw4enHqfzFcpC6qiXgrdWzmQQKgva3Cg5QoeOUld+4AYTkvVN34OaNQ6jrW192jTPeleeAPdf0TkZSeTK/2GdPEh6zvOPIQP2beMsPoOrwGiX48ehNlHjAzw+bOMj3J8lyABZZrm61pQcXSG6OL5BymXdEcwAMRxhkI1G9toBuZo30YXdujhleoTEFz2dlpr/h2+Q7PCMuZfFFuMtI0lbwEdNcnhEye/Hg8ya0Aosm2Cm2IHHZoZXIBKusAaK58BGf4/yQYyZjaqVFw7JVSSsFPcak0YnFIkX/lkb6gCQX/65w0AnoPKHgJPQzZS+3+CieANNaFkfNZSrsTYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O+gi1LLFRTGlSPUvtpVCa76J/9I+wn5umWFvCXyJUhA=;
 b=Xi74VzuB2pWTb474C+edKc2aKYFmssAfdPT+0m2h8WFvSukm5O6zQM35monkNorKCB798WRnSOQIUlhUZT9/aetWzZm482P9NbS+RNB0cs93hs+U+D9EqXn1RzeXMz8PNIQV2PnsWWwwVpWHsEt09UZmqXluxAw3O5k8tMPrroc=
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com (2603:1096:400:448::7)
 by TYCPR01MB6367.jpnprd01.prod.outlook.com (2603:1096:400:93::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.16; Thu, 23 Jan
 2025 09:47:06 +0000
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430]) by TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430%3]) with mapi id 15.20.8377.009; Thu, 23 Jan 2025
 09:47:06 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Biju Das <biju.das.jz@bp.renesas.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Prabhakar Mahadev
 Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH 11/11] arm64: dts: renesas: r9a09g047: Add icu node
Thread-Topic: [PATCH 11/11] arm64: dts: renesas: r9a09g047: Add icu node
Thread-Index: AQHbayBlnSsKneewAUGZsaSGgCgvLbMkISaw
Date: Thu, 23 Jan 2025 09:47:06 +0000
Message-ID:
 <TYCPR01MB120939117680BD9FA8FA88AB0C2E02@TYCPR01MB12093.jpnprd01.prod.outlook.com>
References: <20250120094715.25802-1-biju.das.jz@bp.renesas.com>
 <20250120094715.25802-12-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250120094715.25802-12-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB12093:EE_|TYCPR01MB6367:EE_
x-ms-office365-filtering-correlation-id: 996fcd4a-7337-4e4f-2cfe-08dd3b92e612
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?FvzRqWhAuGVIw0Y5epXYGuU/D1CyDf5IURgPyiTEUg0lbvoIJxPwtN19E/L4?=
 =?us-ascii?Q?qEIZvOcAx1jNxPbyt5EBiN5b8Pyb9QYOp81B5pf8X1eqb2gA8kK6fdX8JrmW?=
 =?us-ascii?Q?ZFvXu6/e9uzAZaYy8KZgasA2Fz08AN/0ByaMjyMsWuRBqCJcQfYiC5lPPGPY?=
 =?us-ascii?Q?mIZVkyzxd4gzzctf0qhCARPfqBnPs/ljwN8k5Jblby/4MZK6DxZYEoa7DRVR?=
 =?us-ascii?Q?N9XvpEjEksksNYtJsqMcpqtpNmhHwfRjntL3BvdCqo8f0jXHPOY7L77EpeTI?=
 =?us-ascii?Q?+/rKci/Cl0t65FHtX92kiZg6pikhrlH6BpXQmwH5EIHUE9rNVorAMTsOYvpu?=
 =?us-ascii?Q?ffCri7Rz+XevUYIABMe/3rTHTF03UUloqxMYWM/McUC38DQTEXITk2yY0VOP?=
 =?us-ascii?Q?goP9OF0/LgLxtdXkruZ5mHOidkvEDjNxmIjI+GeEY8ZgEiin9nSTlOc7Sh03?=
 =?us-ascii?Q?Bej3PnUbIyVzKP7C64JS9t1o9wZwBkoglXt/FbAxh75arT1dqRck1UqYbdjt?=
 =?us-ascii?Q?rx0Lu9i4QZUC5V3kKfig5HG+7vyBlkzaZr3Fo34YL6IrmGlm772ftGyljob5?=
 =?us-ascii?Q?MOudNmy42cr45PIezfnE63Lh7tBGzACBoBby3ew/4sF0+jz5qShtytfnYz2C?=
 =?us-ascii?Q?S74hkSCfTKXNj8RiQ2Jn4lbA9t9q9DOw2nN0Y85ZD0jbjNTOmG4Dr5IVfYXz?=
 =?us-ascii?Q?wi18o0EYYbbvwi9UOvMYLX/D1GvLmiigi4+j1TwZ0KQFuJgsM8qcA3Jdrgm6?=
 =?us-ascii?Q?x4/6Hcar3A8PdY0kkRCdgckBVqhmOB+g4WCaJ++RtZvNKuhsuBO+0OFQxAll?=
 =?us-ascii?Q?bRiOHw4YucY4T9u4SZI8F7ZodAuAlILP1sUfdeWPmci0ae9ls9TZJ95eVtsU?=
 =?us-ascii?Q?D8DuybquyBYQrL78vu3xaA9NFaa+LCcWUynEcFmxcV3IY79cpQc8uPoMsYdu?=
 =?us-ascii?Q?v1SLEPrA9YxZoV07frIa4PaXI0Gor1huwvuIuwCqTYNxCBGbjtpdosS+t6tW?=
 =?us-ascii?Q?yA+j7v8Q7WHBS23yo2BpUNn3ZkJfZ2D0n2o66LSY3CY7f7I4Jk1OTUPaMxiN?=
 =?us-ascii?Q?ImMII6gQEKgD7cFHLLvWlZlESXy/tgEEeYWwO2K6qlqOzjpaPN2y9wx+MIZO?=
 =?us-ascii?Q?UEghb0wdLlgORcWksqruE0qRKgXC79ixTI3O0fWIVWUiqOpHLuNCtmnyxZwl?=
 =?us-ascii?Q?GWPoVy9UXouUL28phkdywa4XtWoSh7Yl4JJrVYLl2Iqci9XJi7rVD8DPB+VW?=
 =?us-ascii?Q?2BNQL7LbjPWwufNbQIdY7rbojpRiuHrv6lDFxhZm8TWs3TSlHjVpttapz5OT?=
 =?us-ascii?Q?BjBpkdZomYhj4LnpORzp+0CPzmI/mJO1yeKwF5MhrFvRIhexFZaYwMtQtmlL?=
 =?us-ascii?Q?icmQa+vEBxJn9gHEShd7m1B4Twz2dvYPEOT+T90SsIJwo8d4uFSC7NNNOV7P?=
 =?us-ascii?Q?Cfqi5RLkpo/RjxaCTMcmHA0T9JYpFj/v?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB12093.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?AThYFqFH4WGChFepm1vmAtZrnp+mwUq8O0fitc2uuQmIXBT1n0LAuZXYib/Q?=
 =?us-ascii?Q?fDyBk/zQNhNPFcrz1wng0ptXV/DvqCTj+GKSxUNiAU77STfwmhA5DOpQ5ebX?=
 =?us-ascii?Q?d5xSeyLyPXQuFKhopQSuL/LNNX7y9BNt6GxtwZWdX3y8O71nPBeuQX5U2pfq?=
 =?us-ascii?Q?goQvgUQgGnLTkUe1XsU43jjbU2bV6Y0tpKV/3T/fed0rZzVkRJjSUXLz07Dm?=
 =?us-ascii?Q?oAfsL6DD2TJx47jfxJS0JkNNoT6wEKvJTAVnlc0YjZi9Xm2SZ3Q2iglhuV08?=
 =?us-ascii?Q?YIKVNYIhinjdUf8ek0oD7GRSGsCtrPHnnLcvtdRFviZx0TfXjttZykop+Mm7?=
 =?us-ascii?Q?wv0kF/lDyfrmfEcN6nCUB6LssG9C8GdH4MqKRBW8dK913ucmgp8RBrAwnoxW?=
 =?us-ascii?Q?vVzhpx91CrEvhdjMZi8KBgF4DR+2p7n3/LGXl733RtukyYwiIbP4kJkA9R5O?=
 =?us-ascii?Q?eimEFoFMkecQZ/7iUAaQdlB9lPlrN03rh8S3dhzCFHZQnpX9+Y6y6VX6hDmx?=
 =?us-ascii?Q?2kTTd28SGg6xu+vh9H89EhiLrmn4L1qOPZyNixssO0H6/OeREVrI9QIflgQA?=
 =?us-ascii?Q?INqFqgtrysxXCwXchYSoY/uo0lQ0oudGTelpsptV4jIXlyPJDkpbIpEcrSnL?=
 =?us-ascii?Q?7s80megiaiLQPEem5Z6f9Hxvbi/1BwAvGMyg1Zhetr0zS/YDaO9goQVpLvT6?=
 =?us-ascii?Q?HXCl/AibWAR+z8B9STN+FLGtwbudx9gM+EzSkbheQ61Uqy1AZXqPqR8CImby?=
 =?us-ascii?Q?7PumLAFskDtQSqcgruJC4BWGx3j9hyqy6Xvj5ZsG4Ne0zNfwjeeEFZimdGt+?=
 =?us-ascii?Q?fFkdgdOXG2eCIPoaxPtmxNnNSR36Ckm4zwWeMzC749U+Cfmiehjj0FIDzhMn?=
 =?us-ascii?Q?6niRRxNn8NvoE/7/1hnSO0hwvDJZu/DDxeQ9MmDEIkUwbXVbDWHtiGFqOqtk?=
 =?us-ascii?Q?pc1R6Y/DBtDkWMYNZHRmdlUeooN4cpXk0nRx/eCEfXDbFUeI0QqwAMTHEcA9?=
 =?us-ascii?Q?EjoDCtp4hLFj4R9PmMoefU+rgOxBXXCjU2UaIWKynOYTWjUNdQ51jV1+Oa9r?=
 =?us-ascii?Q?TIXNKljzThObCNhaldQfTIs/F2jBWoB1eJCj4NOotTdTiskWCh3FByYc+yKm?=
 =?us-ascii?Q?/cTY5gtsrn0aoFk2TuVgNF5FMKiFuAErOc4GJHdzYlt7kemLDkc4zUIuBYaU?=
 =?us-ascii?Q?y/ZMBk0SnMSErYCjm8tbRMVVZ3cVUb2/xpLmjgxUq6wpXccO/WuErbOlxR2u?=
 =?us-ascii?Q?RzOgZdn/MNACUBYgypnX9bjrYuBqyNzqAKMMwAvevcGqjicBCeQSWK9kt6qW?=
 =?us-ascii?Q?MAQrnC66wIx+uGTubKgEnRdHvGQb8951KNklNw/nIcIufteExsRohef3PvrC?=
 =?us-ascii?Q?vSCXg5sOFT/rKRRCxz0P+RUAQm+iIjxqw5G6QMxanCi5SXhApynDsPxUNDjS?=
 =?us-ascii?Q?cuUyIk4TN6Y994uY4XoSxnSfAoz03A3Ic6juUPVElLixf+2DvgiKBlWWwmG/?=
 =?us-ascii?Q?DcvrG/jRXbbnsjAO1c8xJYO9L7I2tVmqO9WIBuyAtJPsnagVBycthNDOSMN5?=
 =?us-ascii?Q?iX+odQKrd7WWBuh5hrZeYfcZwtVq0VpPoqZYY7porqCJcN+qyEmfn88Z3kvs?=
 =?us-ascii?Q?lg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB12093.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 996fcd4a-7337-4e4f-2cfe-08dd3b92e612
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2025 09:47:06.7378
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: npNFkwPOKh2o5G6bFA8VHMlMvtjUPR0g810Xlom4wyyoLDO87guuRMuVOU01zlvha68ECma+U1PjyYITk1l/kb1pKbWey6TfzqJeptrNmeU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6367

Hi Biju,

Thanks for your patch!

> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: 20 January 2025 09:47
> Subject: [PATCH 11/11] arm64: dts: renesas: r9a09g047: Add icu node
>=20
> Add interrupt control node to RZ/G3E ("R9A09G047") SoC DTSI
> and add icu as interrupt-parent of pincontrol.
>=20
> Also, define the ICU IRQs for board DT users.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

Cheers,
Fab

> ---
>  arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 108 +++++++++++++++++++++
>  1 file changed, 108 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot=
/dts/renesas/r9a09g047.dtsi
> index 133aa3272d3a..0beac052f208 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> @@ -8,6 +8,24 @@
>  #include <dt-bindings/clock/renesas,r9a09g047-cpg.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>=20
> +#define RZG3E_NMI	0
> +#define RZG3E_IRQ0	1
> +#define RZG3E_IRQ1	2
> +#define RZG3E_IRQ2	3
> +#define RZG3E_IRQ3	4
> +#define RZG3E_IRQ4	5
> +#define RZG3E_IRQ5	6
> +#define RZG3E_IRQ6	7
> +#define RZG3E_IRQ7	8
> +#define RZG3E_IRQ8	9
> +#define RZG3E_IRQ9	10
> +#define RZG3E_IRQ10	11
> +#define RZG3E_IRQ11	12
> +#define RZG3E_IRQ12	13
> +#define RZG3E_IRQ13	14
> +#define RZG3E_IRQ14	15
> +#define RZG3E_IRQ15	16
> +
>  / {
>  	compatible =3D "renesas,r9a09g047";
>  	#address-cells =3D <2>;
> @@ -131,6 +149,95 @@ soc: soc {
>  		#size-cells =3D <2>;
>  		ranges;
>=20
> +		icu: interrupt-controller@10400000 {
> +			compatible =3D "renesas,r9a09g047-icu";
> +			reg =3D <0 0x10400000 0 0x10000>;
> +			#interrupt-cells =3D <2>;
> +			#address-cells =3D <0>;
> +			interrupt-controller;
> +			interrupts =3D <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 420 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 427 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 428 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 429 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 430 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 431 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 432 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 433 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 434 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 435 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 436 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 437 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 438 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 439 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 440 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 441 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 442 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 443 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 444 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 445 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 446 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 447 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 450 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 263 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 264 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 265 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 451 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 452 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 453 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 454 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names =3D "nmi",
> +					  "port_irq0", "port_irq1", "port_irq2",
> +					  "port_irq3", "port_irq4", "port_irq5",
> +					  "port_irq6", "port_irq7", "port_irq8",
> +					  "port_irq9", "port_irq10", "port_irq11",
> +					  "port_irq12", "port_irq13", "port_irq14",
> +					  "port_irq15",
> +					  "tint0", "tint1", "tint2", "tint3",
> +					  "tint4", "tint5", "tint6", "tint7",
> +					  "tint8", "tint9", "tint10", "tint11",
> +					  "tint12", "tint13", "tint14", "tint15",
> +					  "tint16", "tint17", "tint18", "tint19",
> +					  "tint20", "tint21", "tint22", "tint23",
> +					  "tint24", "tint25", "tint26", "tint27",
> +					  "tint28", "tint29", "tint30", "tint31",
> +					  "int-ca55-0", "int-ca55-1",
> +					  "int-ca55-2", "int-ca55-3",
> +					  "icu-error-ca55",
> +					  "gpt-u0-gtciada", "gpt-u0-gtciadb",
> +					  "gpt-u1-gtciada", "gpt-u1-gtciadb";
> +			clocks =3D <&cpg CPG_MOD 0x5>;
> +			power-domains =3D <&cpg>;
> +			resets =3D <&cpg 0x36>;
> +		};
> +
>  		pinctrl: pinctrl@10410000 {
>  			compatible =3D "renesas,r9a09g047-pinctrl";
>  			reg =3D <0 0x10410000 0 0x10000>;
> @@ -140,6 +247,7 @@ pinctrl: pinctrl@10410000 {
>  			gpio-ranges =3D <&pinctrl 0 0 232>;
>  			#interrupt-cells =3D <2>;
>  			interrupt-controller;
> +			interrupt-parent =3D <&icu>;
>  			power-domains =3D <&cpg>;
>  			resets =3D <&cpg 0xa5>, <&cpg 0xa6>;
>  		};
> --
> 2.43.0
>=20


