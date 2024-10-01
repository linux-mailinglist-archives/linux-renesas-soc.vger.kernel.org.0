Return-Path: <linux-renesas-soc+bounces-9261-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 509A998BB9D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Oct 2024 13:55:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE3361F22B73
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Oct 2024 11:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E0EF1C1AAB;
	Tue,  1 Oct 2024 11:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="kVGKqdU4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011021.outbound.protection.outlook.com [40.107.74.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4851C1AA9;
	Tue,  1 Oct 2024 11:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727783677; cv=fail; b=HCYEtF0sYPhSpesISDjEEaGtpowV+hCwD7QtCZ9ajpvo5Avg8R7R5E158Kmw08eqCY8WfgkVi+4vO7swOIyCXgNzThjxhK9pOcf7u4YaSzP733KCQK2YBe7HGx+Mylkz6VnLgj7wSrBtnuGSwhL3ewnxBgpMYLmDESA+Vyj9xmQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727783677; c=relaxed/simple;
	bh=aNW87KwxZM2eAhE8X1UzTQ6+F0K6l/kx5MYZ8r4QARQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IFJ/i2NufsDxzsCBvuVTZmOltNs6RcydjNWVDRKSQ7nxpgCyAaPIVCqbIE+P7+8ImFBM0MwO7xdO/2YSJReWJS6ssSYTmUcBvD6/dboCuOyfZMPPk51EfaLOnJUY68Mf/D57WDw8RXbTTPzuxOZZoto2Rv/weGca0C/2/bGGyas=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=kVGKqdU4; arc=fail smtp.client-ip=40.107.74.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QZ6Tx9gjknycTy6hnioLSU13KEZ2SP9DWeANgbm8M9x4HA9SElZqtiuItHFll/tS1Z/AoTt0YbkrPPx5ba5dr3e7ZD35L6mz33F+7l31lkc67CRZTExVI3KCOntdJJMvyhBV3dWT5UMXlwF4d51aVO3m5NHVVxt7wNPaMIo/sE2jjgXbLdddU7oedcki4GtO1kW2PFuxFjA21LF8N9ztdt0zpfxCXFAuQAShsEcxjsbJbPy6aT6ccSzgOnV70TosesEIoKkBcT7dwjnJZeWQY0MncCaJQxScT4JU2M8cpfMa6RvDyx9jag2+FRK5E2kaF/HZ7zCTQh3Z1gN3P9fJ2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ka+230NAep+5yfQ8766eE9ClVBEIAHi2cWfGlUPWefs=;
 b=yLPT89pmC19uGtNRIerThzpjes1rBuVjPGh60+gAJeaYLecBD4Bv0cKWiW7eN2KbKNa4M2oAxZbjLRy1C3c0S2kRd6MOqHuJLTXWNP/jI+iCppc01+Dundy9jbEjsBEzBuqGO1rIs9gORSnO8H5IeaBLlcQvLfoDasU/o9X3aT0KghZ9j+4K//QRFsU05nK8YMgGl0oDljDTaKbhTkWZMHbQIsSwtst7GqSGM/kkqLwd7++qkB8j+D2byKAW2PJF4bDeP3r8ypHo1BlRlTl3Tce8hPchyX2abAWsVujy+5j+FJlBLI2tuN+Ko/FkYtDGxYbVwRIEaDaD+vxRGivZjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ka+230NAep+5yfQ8766eE9ClVBEIAHi2cWfGlUPWefs=;
 b=kVGKqdU4sQK7KNpLoUZKFE9oulPnOIjKY5ygvh0XCTGcvP8nLjJUTDHK4HOaGMN5ZfaEa3ZlP+cxzXp1QrCGG72CSmjPlTpv5b283uzW9WcQ1+655Q3d6wDSxADjTQXYYJjcXmjbhr3Fke8psMUENLZOhypm9/ihNUQK9w6HRSw=
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com (2603:1096:400:448::7)
 by TYCPR01MB11355.jpnprd01.prod.outlook.com (2603:1096:400:362::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Tue, 1 Oct
 2024 11:54:30 +0000
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430]) by TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430%4]) with mapi id 15.20.8005.026; Tue, 1 Oct 2024
 11:54:30 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Marc Zyngier <maz@kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] irqchip/renesas-rzg2l: Fix missing put_device
Thread-Topic: [PATCH] irqchip/renesas-rzg2l: Fix missing put_device
Thread-Index: AQHbE0jeZ5rsQ++rgUGVV3Ok4wTdk7Jwel8AgAALTzCAAC3NAIABFZ4w
Date: Tue, 1 Oct 2024 11:54:30 +0000
Message-ID:
 <TYCPR01MB120935A52A777BF62344B05C3C2772@TYCPR01MB12093.jpnprd01.prod.outlook.com>
References: <20240930145539.357573-1-fabrizio.castro.jz@renesas.com>
	<87ldz9uomz.wl-maz@kernel.org>
	<TYCPR01MB12093A2984117267AC18D679CC2762@TYCPR01MB12093.jpnprd01.prod.outlook.com>
 <86frph6jir.wl-maz@kernel.org>
In-Reply-To: <86frph6jir.wl-maz@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB12093:EE_|TYCPR01MB11355:EE_
x-ms-office365-filtering-correlation-id: 7826f47e-c67d-470f-c082-08dce20fcf29
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?AjxX4nHHUZoEFVwlhKp/2+uJ+2QHsk850sX3fh22aL56odCf+n4EBupYQiQf?=
 =?us-ascii?Q?v5tAb8v1BOHxPflOyUHVXqymxIpzGuCzvXFJs/w1Vi6VeQgYjnjjkFs5MjI1?=
 =?us-ascii?Q?ZODhr6sqoqLMitpmLFjF4YeEDBiacS0b50CpYZJSsb63AwLr8RWZJtyhDSdy?=
 =?us-ascii?Q?vcKtY0DWFWjRQKhfjDriQ3AlsmXg6Gg0w4SB8lmJc4CwCkVfkgC36XKPr9mJ?=
 =?us-ascii?Q?zurKm0e+EQP5DMmoasujGg4qrRFNRq7wqpPKXZbDf5gRiveTdMjGvzGc9X2q?=
 =?us-ascii?Q?8s4/eRWPNLEB8Nmhu4g8Wk2QgOXpZgc0gOaPGrNCelvaUw/JWKQUJ8RZehnV?=
 =?us-ascii?Q?jJNOCr+CYVLzY4J3SryntmJct+KmjSNIDAT71cD9qTV38UoCgAm4RxnlCihl?=
 =?us-ascii?Q?2TdP911jSn10vNKAnyQ8txSFWwdswAYJhP3UwwSZfWm/14E65l8L0yyfGwuP?=
 =?us-ascii?Q?Byw00+6sSF73ptSfAA/22wncT1dX475eNlvxt/4xbDOOGe4uZ+WiPdveUqLF?=
 =?us-ascii?Q?l94tFkg/5kwlGTFiiSLEj7U0okIdUZyYr4JQ/GQOWn6nni/9v/gcNPGi2bDO?=
 =?us-ascii?Q?kcDh2i1g5ktGq1xCSMHa4laxvP7ZvFBBApuT2zdGYGI4vwj2TtQdwE/gHOOm?=
 =?us-ascii?Q?gF8GT/FgBU1/5Y8kzA4ti80ziiE4dR1YAu21tJ3CVMLp0rNctIrSl9KtW2HE?=
 =?us-ascii?Q?SFrthUD12NXQfWfHcNjFSscpAZFXlpBRlB4rTuI43+/o3qon5bvlTVgFLKxU?=
 =?us-ascii?Q?+n9SKjj9AMqL0uf9bhISMOSftIkf0jOoIkkeTUfa0FgN1u633qperqk/OHUb?=
 =?us-ascii?Q?cIQ3K4pjCXLxnbcj1LBq5fzcXAxij5zvm84LRXERiMof+Xh9S+BheplYDfoW?=
 =?us-ascii?Q?mooeTZi8EMxqsEd1jbTSezCVF5OHTR3Y0RMxENjkOd7WVt3XsxTQoQe5lHI6?=
 =?us-ascii?Q?+tRu4xpVjqbVmOxSrZg3GMWEjoOMbZkdMAIVhCwynQMXHnPcF96Cv50jkRa8?=
 =?us-ascii?Q?+yfuyRAp8p8Nf821UDGb5NwOXqLTbloSD4XYTKkbtxVkYBfMgVZlqZvboAlJ?=
 =?us-ascii?Q?DPMfiUkhzNmDJfnC429Vf8Ne6JFizOlvTBhPVRavCjmx83GzAJNKO/bF5Knj?=
 =?us-ascii?Q?7aAD3ZbirRjfWZ6s8CeoTw4TkX/vRGL8iXZvJJY1Y/SyiT4KUCyrkcvxH3P1?=
 =?us-ascii?Q?JPOnJizIVbCy5hk2RziBZTSg4zOxO607Owktpi+8NA1dWgtySBXH+5bqjL/s?=
 =?us-ascii?Q?Zw2S4DEjGM7tMH7zzkWRgM1HC9gvPJYyqnosxMk2VEgPnUuM1NCItD3wYveQ?=
 =?us-ascii?Q?wb+M+S+1Ls6FHAckmdhwupfDUQeQxW3yrAShgYFZg+s4YY8YxtMOfGSJh2Ft?=
 =?us-ascii?Q?6Va380neatgxSPr9QVmGUU0bI0XPV4yOkWslLM9ebwrtOLrMbA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB12093.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?7Z+xf6extUx5PkbIxzbBak4NHjE3+PEiuCf2SDF2/AA+fwWEQAJaolKyvBVB?=
 =?us-ascii?Q?LKZn2xdzUXrJrBVshg6MeigPwB6l8clh1dbAQAESae9p0Y6MdDrJGS3Go1fq?=
 =?us-ascii?Q?V5tr/vnU6FtgsKa+W5AZSlwOCJepOZisw4qxv8ToZ9eXr3Lbv2AcjhzeGffR?=
 =?us-ascii?Q?AYkipU0fNFq2TZcTOnBYss/1Zld5bjdnON+t+Ka5AttCP851k4BbSa/ciWLS?=
 =?us-ascii?Q?XdfeGcr67kDHLa3/YQFLkwRDyr2VZQIBW+ZhnRpBATQKPJRiJqZE2yBmwWiW?=
 =?us-ascii?Q?LuILUAwcfe+mhOMojpoBUYhD2y/gEfb53foKuE2bXmfrKEZb8QoU1wYllzDx?=
 =?us-ascii?Q?j5Fr29kcK5+4LX7aFbY34IQ5l9VOLrLqeC5aaKgYqqQKyNJhIU9FuAhf+pNp?=
 =?us-ascii?Q?kRMVtqxlRYVlfVQP4mlCf/Dj2Xit2MxOTHlKO5MRCVEU/Q/NA+3FBdKjom5k?=
 =?us-ascii?Q?rbAloiUz3chAJqs2360tM6ytd2oV1hWwvBXUjegmgK75Jcz0mp7FSFdb85vy?=
 =?us-ascii?Q?/6qGTQGjDlAbpCRfXEFUtSTqYBt2MtAI6ihC5c25gvamcPEIBjpdrqMmIz2d?=
 =?us-ascii?Q?tAVJ3gNbo65ZLAkEFd/FWVAWt8QWDNJBR7ytmkq+QaunfDF0QYQLZbHjKvYL?=
 =?us-ascii?Q?CVeWFBmmqANNHpPr23QeX0o1Qa40dsy7NXpld4qMW3zq2gNqH3nCjrjiZT1q?=
 =?us-ascii?Q?Urp1w0CV/jNOOozHR5JAFYAvfJfe7sABSxoCU4g/wPfEC3f/60rCjU/5rLIe?=
 =?us-ascii?Q?vt991cugND91Pu79qQL4QPEU/pZ9Eor43ZNXTWjFyoXX89STqg5mqDhHbHX1?=
 =?us-ascii?Q?PW2tRDeb10NoHRGdlJm9qGM91sSWXNKOsW1VbCJACPtGQvpzquArijAE4vpe?=
 =?us-ascii?Q?Gwdl2s6YLeZhtJ5NBnknP4zgU3yVgf7kryXWBZwAeV/50uXstpx0boaFeo5D?=
 =?us-ascii?Q?wGYhZ+CQycdzyOoFS9QSUk06aVbvgTcRSdqTu1MGLUnof1ybg32QrZTsnFbI?=
 =?us-ascii?Q?235850GovirtnfcSI1kagev6uF1D5zkAkuUv/IRgEH6QjTNRL9UlFm0K9r/j?=
 =?us-ascii?Q?uDgIhEYh5QHtgqz0rmtsUMnNpfU3XhLCVFVNJKC5MJOU5bZZ7ztdEcTwnSW/?=
 =?us-ascii?Q?kY+j8qC4mOLZtX3XeaXOcZsXyzl1gWrGm2HU3h1X+pEVDQubZFN6TzbApylS?=
 =?us-ascii?Q?yA17L1MxW916lvSTgi57YH7G6kgk1ZwrzFy0x4mG/kxCIOXRGBmzWIcFcNBR?=
 =?us-ascii?Q?zq2rKUMaOy6ToOL2tD15JmmJcvOOzAyy7EzMojNQcvy5yJxSvHylfZpGLC8g?=
 =?us-ascii?Q?kQXmxwsYKetb+MeQGfHq9K64LTz34YJZZEwWdk7L9cFU5TjcPFbzjfLR6ckV?=
 =?us-ascii?Q?jQn9Pp9UbR3LHCfJEXZZDHuVhY9Ag9vpU34xRqhvbzPQiwqEnDRBP/w6c4/E?=
 =?us-ascii?Q?mPKR1vwOifhftvVRxb5t/nuu47nW6CQxucHP0hTw0EoUxxPwiNJpkSPvK4EZ?=
 =?us-ascii?Q?B1qtuuMn2ZfGAedBmWfcj/h4RA4IOnYtRw7O8EoYzuh/2rnnwcVdi3qGXJ4q?=
 =?us-ascii?Q?R+W/ZXEtZsOT0yYJA8RYx4OG5Z+Uz1vNM7uNncLrot6cMhOaKQo3BNlSmQ/B?=
 =?us-ascii?Q?pg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7826f47e-c67d-470f-c082-08dce20fcf29
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2024 11:54:30.7671
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Un950b9y6vaGjcBSfa4I1WH4ydvmDDgJxnla35X5HwrYgVE6G55kQDFJeqbzdKnGemPmp6j048WGje3YRM85av1Ome47SmQU2g5qQpKS2tM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11355

Hi Marc,

thank you for your reply.

> From: Marc Zyngier <maz@kernel.org>
> Sent: Monday, September 30, 2024 8:15 PM
> To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Subject: Re: [PATCH] irqchip/renesas-rzg2l: Fix missing put_device
>=20
> On Mon, 30 Sep 2024 17:36:20 +0100,
> Fabrizio Castro <fabrizio.castro.jz@renesas.com> wrote:
> >
> > Hi Marc,
> >
> > Thanks for your feedback.
> >
> > > From: Marc Zyngier <maz@kernel.org>
> > > Sent: Monday, September 30, 2024 4:50 PM
> > > To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > > Subject: Re: [PATCH] irqchip/renesas-rzg2l: Fix missing put_device
> > >
> > > On Mon, 30 Sep 2024 15:55:39 +0100,
> > > Fabrizio Castro <fabrizio.castro.jz@renesas.com> wrote:
> > > >
> > > > rzg2l_irqc_common_init calls of_find_device_by_node, but the
> > > > corresponding put_device call is missing.
> > > >
> > > > Make sure we call put_device both when failing and when succeeding.
> > >
> > > What sort of lifetime are you trying to enforce?
> >
> > Function rzg2l_irqc_common_init uses pdev->dev until its very end.
> > My understanding is that we should decrement the reference counter
> > once we are fully done with it. Is my understanding correct?
>=20
> "done with it" is what scares me. Specially when I see code like this:
>=20
> 	rzg2l_irqc_data =3D devm_kzalloc(&pdev->dev, sizeof(*rzg2l_irqc_data), G=
FP_KERNEL);
> 	if (!rzg2l_irqc_data)
> 		return -ENOMEM;
>=20
> 	rzg2l_irqc_data->irqchip =3D irq_chip;
>=20
> 	rzg2l_irqc_data->base =3D devm_of_iomap(&pdev->dev, pdev->dev.of_node, 0=
, NULL);
> 	if (IS_ERR(rzg2l_irqc_data->base))
> 		return PTR_ERR(rzg2l_irqc_data->base);
>=20
> If you drop the reference on the device, you are allowing it to be remove=
d, and everything the driver
> cares about to disappear behind its back.

Thanks for the explanation. I think this means that we don't need to put th=
e device on the successful path,
but we still need to put the device on the error path.

If I take out the put_device for the successful path, and I run make coccic=
heck, I get the below:
drivers/irqchip/irq-renesas-rzg2l.c:601:1-7: ERROR: missing put_device; cal=
l of_find_device_by_node on line 538, but without a corresponding object re=
lease within this function.

Can I just ignore it?

Thanks!

Kind regards,
Fab

>=20
> I can't really see how this is safe, because in general, removing an inte=
rrupt controller driver from
> the system is a pretty bad idea, and I'm worried that's you are implicitl=
y enabling.
>=20
> 	M.
>=20
> --
> Without deviation from the norm, progress is not possible.

