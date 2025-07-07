Return-Path: <linux-renesas-soc+bounces-19299-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE9CAFAE51
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 10:14:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 70D277A180F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 08:12:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 818AB27F019;
	Mon,  7 Jul 2025 08:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="HwPO4CAY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011066.outbound.protection.outlook.com [40.107.74.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A0E19F421;
	Mon,  7 Jul 2025 08:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751876051; cv=fail; b=Vo4Y/Xqv9uTxaIEH6zuZyszUzmoHr3RACXN5xsDXnv8zHhlFNYzdQTaUivAh/n0PjPUL5gj4//h+SbYHQbho2KMup4wJ0CGmhRs2VSkScu0YaM4mQTiUaE8l/KZcdn2dB+Ztm9+gZ/9NMuhsGtTHXmbXkdovoAE/9PL1Xa/O80Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751876051; c=relaxed/simple;
	bh=9uuWrfGJlMBC6scX+hsYdzmmlRs0OdJ7wOy0MG+4X2M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QpbsEYZ90jPJC0mdssNGMRH/QwmDS3JsvbCxvLYSnjTMFs6iJDgyuva+ode0+ybT3Xq4GEpnah8cpnvBxwhUwk7r84X2gzVFv2PgFPNpX3OhMaDhkA/8AWeOqmWir4coJrG0GNCUSb86ToWZ6evd/3blJ7VnZt4un8tq6kCoxvc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=HwPO4CAY; arc=fail smtp.client-ip=40.107.74.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nwp96xWqeJn1cDcaJuFWmhW629OzDUWdHc+g5b2v8Ps4EfqKcdMPDI9RxLPZiqogRvMkfPHYO1lYG0u3pAuYaviM6fBiOLGTaBfDjYi+T+9eWUd6nHzRtcolVLZSV66u69qDoBi9oiNUIXfhEA8uJBkBKIqoK0xU5C1woAKkosxVvaSfhxL8KNqhExducgwZuUvySsk0MvcLLR7wZ5nA0EITUWPlEZBI7e8oh51+a6mcHExxAyEyJ79/k59hIwjrN59HbTIxAMKL4NsqI7f56q48sKDdsJx2aGRXG2/O1j7OpZ7hVINv4HGbjMVJV4DWTvMk9JHuPoRzsjTfA7ggOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iwLK/R7j+k3rJZanUyKHovHeXRylRI3cip3wsA2YmQc=;
 b=Qk1k7K4vG1M+R5Hi42YNUcGw1U0u0kBxUmZ+4DN3sDTZbJ5+sUD49cfv806wVT6WnyGKqgYo2693b93AlNnSXxQL8kEyvUG7fI/qzD5CrpSV8coMf9GIlRkalW2wNjA8/hm8K/CvUCZuHcAPxMDfUMKPWNOIk1pPYvImHHi9L2+9MeCVxklTcxYiZ+3M/spPEiXqqGp3G902SlWuWaksJr3zFBI+2VjotUBSdFEmoWx/NiwWFRwKki/jhEWZ2Cd8GMoIrTo0ShjsBW/oazQ7beofvDJYa0casmNiclor8iZZ/VF/JhUt73HtpiSwAIRK2L+YDrYyzSM/kGZeL8hi3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iwLK/R7j+k3rJZanUyKHovHeXRylRI3cip3wsA2YmQc=;
 b=HwPO4CAYUnq60jxkoDWnsfxeMuB8lZiKnRfv9sRMwMs0kXD/UeAVEE6u/f18Zvev+RM1F/4s5VJHtvGkq25LcH/yFclNvon4zV+35crlhFU3axPkEM4/OZBTUj4Fdgy+8bb3EfBSqJPPW6qEc96EXU4MXZAs+ypTdgbsTADgAvI=
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com (2603:1096:405:20d::9)
 by OSZPR01MB8322.jpnprd01.prod.outlook.com (2603:1096:604:182::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Mon, 7 Jul
 2025 08:14:04 +0000
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::37ea:efd9:8ca0:706a]) by TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::37ea:efd9:8ca0:706a%7]) with mapi id 15.20.8901.023; Mon, 7 Jul 2025
 08:13:58 +0000
From: Michael Dege <michael.dege@renesas.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	=?iso-8859-1?Q?Niklas_S=F6derlund?= <niklas.soderlund@ragnatech.se>, Paul
 Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nikita
 Yushchenko <nikita.yoush@cogentembedded.com>
Subject: RE: [PATCH 2/3] net: renesas: rswitch: add offloading for L2
 switching
Thread-Topic: [PATCH 2/3] net: renesas: rswitch: add offloading for L2
 switching
Thread-Index: AQHb7Ke36EG/7WihdkaygD+7FM6lAbQhpj+AgASrcpA=
Date: Mon, 7 Jul 2025 08:13:58 +0000
Message-ID:
 <TY4PR01MB14282FF28B33F6A0EAD5251F8824FA@TY4PR01MB14282.jpnprd01.prod.outlook.com>
References: <20250704-add_l2_switching-v1-0-ff882aacb258@renesas.com>
 <20250704-add_l2_switching-v1-2-ff882aacb258@renesas.com>
 <64e7de61-c4ed-4b42-83c6-5001a9d28ec0@lunn.ch>
In-Reply-To: <64e7de61-c4ed-4b42-83c6-5001a9d28ec0@lunn.ch>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY4PR01MB14282:EE_|OSZPR01MB8322:EE_
x-ms-office365-filtering-correlation-id: 421944cd-a438-49cb-cca7-08ddbd2e3923
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?J/0C7omPsODf4yQ8gg47MP96SOnORfnHbZXeqSKyEsle93Y2KTuXl9EzRj?=
 =?iso-8859-1?Q?1yZc3FxkT5wRCvN61FVwozqwt1KimuRViXQahVRScr3qYpJ+hMygDgKIPB?=
 =?iso-8859-1?Q?EtZ5phJW1y2qNwIpseyKxtvaQd3WZgiLRx7DXR2SdPZ5ylJHLRgkr6io3S?=
 =?iso-8859-1?Q?tO6J3Zz75hFhYP5PB+ENQ7S1l2J7AaecW/5VHenUcJtzq/9m8pkrIC8JGT?=
 =?iso-8859-1?Q?MoK/tETj6bou4kXMVUGWlATtVEJaT5OjVCRAsFFHn6SLsP1zlryqe3/J9I?=
 =?iso-8859-1?Q?VJp30/UhycMRRWPwc3mjj7vUAYHSAUmXPIEwwb4P6K4YvhRlin0o1RCRd/?=
 =?iso-8859-1?Q?zrYS7lXMwEVjRXEkklDEvEVAUO9/uzcEskPcoOpBMpTp7cKMAZZ7LMuWR9?=
 =?iso-8859-1?Q?8TAdXphyJuPhMu5FFU5MxqrgJsdGNdnWkd6PNhDuqDxupkCSw9nJhzJPU8?=
 =?iso-8859-1?Q?Pb5Omq6hfUlQz5FbMr4IJBHABk/k5Shu540h8ESEGpblIDA8CANqDBypBx?=
 =?iso-8859-1?Q?f8uh97/bVXoFiByQsHz9XEwf69eVj5lVvt4ZgITSlSnn2dc8dJwSjpkRDR?=
 =?iso-8859-1?Q?Sthw25be4B/aXW5ijZDA1cS1ctRGojrXNfHWGCJiovubg9SktiC7onySz4?=
 =?iso-8859-1?Q?NTbCdS/GfRCveWmVo9C3DxrxXrrD99vhjmCrFaM4/GN0nHOBIDNsWEBIem?=
 =?iso-8859-1?Q?4jOtfu/4DX1q7DzhR0Gvfu2ekEzqz0fcfGgJCrOSMOi9jVd8UHMoDcU34e?=
 =?iso-8859-1?Q?ppxmNF0FZRxnPWAkxO+Nt9yo6i52hVjIMQQG+/8kyta1eI7oF8wJLGIs8v?=
 =?iso-8859-1?Q?6qDgg8ybbDLU0XdgGy8mM6B4LFi/geYY4b8TlW4iobYJ8vAFq2gKJ0WHHn?=
 =?iso-8859-1?Q?WFlhPu20JC0UIrfq9Mbhp5AliRbM4tYETICid7raGQ+HO9tNLKCbmByIlV?=
 =?iso-8859-1?Q?B18TxAWkkUwgwLQaxtP++BMwfYhwTOVnE9H5Qbi7RanVWHhEuQA5oLxobk?=
 =?iso-8859-1?Q?cCqHKjN3FTyZJmFFzYo/4jc7VQz2pb+s0/Fr26f7Ub7d087XCRfs1tucjO?=
 =?iso-8859-1?Q?cbO2ifOJunm0tueiEZsCpYzj6qNPbQdUoGgaukY9ZCB1GPtvAjMmCYj6Ih?=
 =?iso-8859-1?Q?nVz8QNjuDxcb29OLAAw4hx6/pN+i2XmBT2h2sqsFwTsPuEeqt3S6CzXz/M?=
 =?iso-8859-1?Q?7AegNWvSOp5hgtkKW8A+SyyyrVuBn7eHpjsnrTgDjdLttQgMKFc6qsK/jp?=
 =?iso-8859-1?Q?KQL3QLWglJWbsEn4meoZvI8YP3yo7HM33CqnuAB8dWD98CU1B/hWv4WEGU?=
 =?iso-8859-1?Q?Q8reDeBWcklIQQYYSXk29S6UvuZr3jc4Z2isd+8jQm7Ar6GLbA91zdwweq?=
 =?iso-8859-1?Q?kSPCQCsNP4qq1Eh2XMuQGFer9N5q6Zg/ht+CZw0kZMuRV8XaZAoFHP7Rsl?=
 =?iso-8859-1?Q?U3IFNzzFETvhrKSQIJr0hz/KbcjnP4rkGhImzqsDktoTAXRCXbOUCUiQv+?=
 =?iso-8859-1?Q?bQfHbaEUqsfZZknoPoaws/+p4HJw47ri3PhPCkYJBxQw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY4PR01MB14282.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?/+1iC+wtxLd3POo8yI3ru/eEBsEMmY/3Daf4IR0PUb8Hn6rwVuXqyO+AFe?=
 =?iso-8859-1?Q?OvoJnaqrfiVHyqTSwWdGlLcEBWQyHDZWuMGNn0WXwph4YnUp2U+Xn75rrR?=
 =?iso-8859-1?Q?1mnHv94YobzOiMruJTDPGQx0Ngp6RJj/TCNR1aPmPV972VSshV2Jbg2n4l?=
 =?iso-8859-1?Q?i/V0AdSXroqIDwd5z8oO97k1V6tOqwBqaG0ttZCH4Azh/qmt+v6jUjrM0E?=
 =?iso-8859-1?Q?poYQXOH2d+eirbSiY5E4AaKswko2mI7C2+f+txJlX+grbgqQWFAhEb3CG7?=
 =?iso-8859-1?Q?UAJ1N5B/RLj3+BYlb4XWaSKfJn+7bLjPQj8aidnXN8SUYZ9b1nEIxiVuy5?=
 =?iso-8859-1?Q?lafshOCiXiHW+eK4a0PaNMvcaNAz5glx9SU6vLaekltBxH8p3f/J1h8367?=
 =?iso-8859-1?Q?36Gx8GtQC8RvNZsDZOCkgHrnNsl30LEiuqRtjBuafKTEXGx7AUr3KhRh1Y?=
 =?iso-8859-1?Q?FIIf1+tRK17V/dNVJ/cmHhK1WC9d8g5g7VA4z2OniRixxWQSlcz4+AoExi?=
 =?iso-8859-1?Q?tWWVK0TFHIPDQCpj/Rs8Gf96iLffAYqcjeQ5s1CQ6AcHqxEPoLZo+VsvEZ?=
 =?iso-8859-1?Q?O3wl76nq9jlqGrJsUuKKir7O7WYe66k1M+EDs5zLySefyz/QqnRSxTMfma?=
 =?iso-8859-1?Q?avEUxbNDBzDi8hNIXj100lrKhcOmRq/b5OHDQ0nleSFfQVt1Sus6iSD5ZJ?=
 =?iso-8859-1?Q?MG9KDLVPr+X5+RDjx3ppxS6P0DetmVmDBn1n0eiGBevotizKT5RJsaP2Db?=
 =?iso-8859-1?Q?HVlLGi+fGZ/g0f6naoU0kOTNTSBzCbUrUTyNdUUPy7PwEQYsHHVt3Wd6sJ?=
 =?iso-8859-1?Q?kWU6UlJ63We/gOitTz0tMufyUz/5T8Jm3jARKwvqLjx6ORCSNmneNK4rPz?=
 =?iso-8859-1?Q?OZjx7j6h0tKuJPbzgwKNtn90vWOi+5jdxswV/6xN8lcJXTxQ0d4bEiAL7C?=
 =?iso-8859-1?Q?/SCT47LhhIc0FcgocNtMIO8ps1pVUmtdAlnbGOVRjXH6X1mgi5GHwm8DyM?=
 =?iso-8859-1?Q?pius39EZlTh8/t3B2RGlMAig+RoZ1wm4WsgiyObjjybWuV0kGukmZPBJtW?=
 =?iso-8859-1?Q?Ymq84zaoTzooh2f+oKi6CGTf6cylikWXrBL5Ez1gLj7sQKjo0Jxps1Gpsu?=
 =?iso-8859-1?Q?2HTs+cayfiLUiVhjZRd9Yyr49iModEm6DVMJB2coWSyn/1PK85D5GVBVGj?=
 =?iso-8859-1?Q?M3vneEniup5iladredHud7UcqfOF2PcCAT2Hr2GQ4aY3KSYlD4II9gS5Z9?=
 =?iso-8859-1?Q?xXLvIuP8JJxaMUeQ6VeRSoVMhcal8KScfn/PhYM0TB/O73zNKe93IUuTve?=
 =?iso-8859-1?Q?COmKtP4jd771D66+DKeX9WZ8fVGEflVsUFDxsUyBQyI5DJajuJ+O+680Hg?=
 =?iso-8859-1?Q?BXy+iAsocVO1flcXqdd+vKhv6CRJFb7HmZhKTijDLd9GAOAVDSPhmo2xAA?=
 =?iso-8859-1?Q?rfGlD49TV1AOJq8H0246x1xkCbdcgsmkG92s9nvkvi8koPW1gUCwtKlM23?=
 =?iso-8859-1?Q?lt6Qy0b5MB6DlEDN1xTxVPigzkD488zua7Qgo1+7Zic/4tyNW+7g6WvwfK?=
 =?iso-8859-1?Q?8mQjmB3ZoKX4Hzt/fxdtyrZzBwRAnJhLLDyVLaiX0cmms0DvvfkKJdG15I?=
 =?iso-8859-1?Q?qpvbvS2FqQvzdwHBUQtlSV9aV67obj9NWJ?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY4PR01MB14282.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 421944cd-a438-49cb-cca7-08ddbd2e3923
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2025 08:13:58.1136
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NwIUdZ+uh/+2sOD6/6KjpydZMpYwCf5r7f7qs85i9rOM8Kd7sMfErBPL8epPlkFbmzxFoSdg9+V4bI7fH2zrwyaYoE2gJdMQTcfsmCuAshs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8322

Hello Andrew,

Thank you very much for your comments. I am currently figuring out how to t=
ake them into account.

> -----Original Message-----
> From: Andrew Lunn <andrew@lunn.ch>
> Sent: Friday, July 4, 2025 10:44 AM
> To: Michael Dege <michael.dege@renesas.com>
> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>; Niklas S=F6derl=
und
> <niklas.soderlund@ragnatech.se>; Paul Barker <paul@pbarker.dev>; Andrew L=
unn <andrew+netdev@lunn.ch>;
> David S. Miller <davem@davemloft.net>; Eric Dumazet <edumazet@google.com>=
; Jakub Kicinski
> <kuba@kernel.org>; Paolo Abeni <pabeni@redhat.com>; netdev@vger.kernel.or=
g; linux-renesas-
> soc@vger.kernel.org; linux-kernel@vger.kernel.org; Nikita Yushchenko <nik=
ita.yoush@cogentembedded.com>
> Subject: Re: [PATCH 2/3] net: renesas: rswitch: add offloading for L2 swi=
tching
>
> >  #include <linux/platform_device.h>
> > +#include <linux/phy.h>
> > +
>
> It seems odd that a patch adding L2 support needs to touch PHYs?

I will figure out where it was needed. Maybe I can get rid of it, or if nee=
ded I will move it to the
File that needs it.

>
> > @@ -994,10 +1018,18 @@ struct rswitch_device {
> >     DECLARE_BITMAP(ts_skb_used, TS_TAGS_PER_PORT);
> >     bool disabled;
> >
> > +   struct list_head list;
> > +
> >     int port;
> >     struct rswitch_etha *etha;
> >     struct device_node *np_port;
> >     struct phy *serdes;
> > +
> > +   struct net_device *brdev;       /* master bridge device */
>
> How many ports does this device have? If it is just two, this might work.=
 But for a multi-port device,
> you need to keep this in the port structure.
>
> > +bool is_rdev(const struct net_device *ndev); void rswitch_modify(void
> > +__iomem *addr, enum rswitch_reg reg, u32 clear, u32 set);
>
> Are these actually needed? It seems like they could be local functions.

Currently is_rdev() is only used in rswitch_l2.c. I moved it to that file a=
nd made it static. In the
future it will also be used in the L3 routing. The function rswitch_modify(=
) is used in rswitch_main.c
and rswitch_l2.c I believe in this case it does make sense to have a single=
 implementation. Or should
I use two local copies?

>
> > +   if (offload_brdev && !priv->offload_brdev)
> > +           dev_info(&priv->pdev->dev, "starting l2 offload for %s\n",
> > +                    netdev_name(offload_brdev));
> > +   else if (!offload_brdev && priv->offload_brdev)
> > +           dev_info(&priv->pdev->dev, "stopping l2 offload for %s\n",
> > +                    netdev_name(priv->offload_brdev));
>
> Please don't spam the log like this dev_dbg() maybe.

I'll change that.

>
> > @@ -128,6 +134,14 @@ static void rswitch_fwd_init(struct rswitch_privat=
e *priv)
> >             iowrite32(0, priv->addr + FWPBFC(i));
> >     }
> >
> > +   /* Configure MAC table aging */
> > +   rswitch_modify(priv->addr, FWMACAGUSPC, FWMACAGUSPC_MACAGUSP,
> > +                  FIELD_PREP(FWMACAGUSPC_MACAGUSP, 0x140));
> > +
> > +   reg_val =3D FIELD_PREP(FWMACAGC_MACAGT, RSW_AGEING_TIME);
> > +   reg_val |=3D FWMACAGC_MACAGE | FWMACAGC_MACAGSL;
> > +   iowrite32(reg_val, priv->addr + FWMACAGC);
> > +
>
> Please pull ageing out into a patch of its own.

OK, will do that.

Best regards,

Michael
>
>     Andrew
>
> ---
> pw-bot: cr
________________________________

Renesas Electronics Europe GmbH
Registered Office: Arcadiastrasse 10
DE-40472 Duesseldorf
Commercial Registry: Duesseldorf, HRB 3708
Managing Director: Carsten Jauch
VAT-No.: DE 14978647
Tax-ID-No: 105/5839/1793

Legal Disclaimer: This e-mail communication (and any attachment/s) is confi=
dential and contains proprietary information, some or all of which may be l=
egally privileged. It is intended solely for the use of the individual or e=
ntity to which it is addressed. Access to this email by anyone else is unau=
thorized. If you are not the intended recipient, any disclosure, copying, d=
istribution or any action taken or omitted to be taken in reliance on it, i=
s prohibited and may be unlawful.

