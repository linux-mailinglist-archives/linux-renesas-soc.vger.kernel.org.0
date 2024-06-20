Return-Path: <linux-renesas-soc+bounces-6577-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B42A910E20
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2024 19:11:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9B003B21CC9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2024 17:11:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC6EC1B3737;
	Thu, 20 Jun 2024 17:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="rFsllXb/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2054.outbound.protection.outlook.com [40.107.114.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BEC71B29CF;
	Thu, 20 Jun 2024 17:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718903478; cv=fail; b=LVPOlUg6l5hZ2/zdfYoWPL/b/GADCMg98+E0ZfFbWQS+F/ud4Wy1NBWVAE0imKuTKEyd3ly4H3Hr9L/hHBV+j7BqA3tXYN7F57cZiSsmlYEEKnlAkDV23eodUZCSQkbtCZNT0z6n2BXWHX4lfC5f72+vynAEsNUqfjuC9dvJb1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718903478; c=relaxed/simple;
	bh=JknJ8Yw8OodJGXRvBVh/zDrHUiZ/8jDj806zskKufpA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dl0e85tCBBxGVTHXOAFOb1Kxu6enrMfcQzGkd6Yvk0VHtfPBBRkh0TRxq6f9uJN1L+Cxt7z6yxK5U6Yh5TH7iYZ3GHL+28hYct1fA+hk+JmcqZenFJ3crUVSXMHzGudAOZbSXwHodlbuIw86aQLkRYdrKqeMOCXCGrc0hbwcmJk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=rFsllXb/; arc=fail smtp.client-ip=40.107.114.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=heuV8KUl4mexMqmCyBBm7n3JG0IsVwAXTRPzVgB4/trz886Ep9A2+4ni8KkjjG1Q4AFcM7rAvri30HV7QLqNZ6pDymYplJPF49CenwKLCoOk/tlp1jRxsY/pCqkmjac0qSEKHX0TA8yI2dKIaGcCc8hoh9VlbfYpqxchFqdUofzhBrHsN4PTpOt+/wjS6+xpVVEBHB2Z0WH6GN0P2Xi2UQ8GVdVPZI+IrVq7nE1uMaw7axZsj7nYHRLKD/jqg0x+JiUgUL1d2hG/4CtA5BCNs1r6Hul6dR7UDXQwq0NlXv0kENx4rp6aNdzTYZwVspIJqpmYlLBDnYrzvcXSSwmgfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JknJ8Yw8OodJGXRvBVh/zDrHUiZ/8jDj806zskKufpA=;
 b=ZN/JrbpI5mRlGD0nav4c/qgVqwp74aHemSfuFoAabZwZWIhxc88N5A5QGHosQocY1qvDbhJAiWyjWhkuFBBsZHI2RPPIua94ILMCBX+RuyDhh4W50okltTh2ZYQKe7YP11fdYyBaEK/DtQNIByD4JAV2FSAsjqeq9YQkqZS0+af67wq793RV1n84QvWLnfJpjBnITxqpbSgsGPL8JwoO53iXTj7X+wO0ZBupX667ouaHupl3r7y/2sguw5nLTNuf1gyBchaCoelpkUCii/xbPj+NlT6yDU7NW/1VG8fzx4JZ2UbnaVoMPdgzGYB5QlCK5Co56+Q5iCoYifCGWHIS4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JknJ8Yw8OodJGXRvBVh/zDrHUiZ/8jDj806zskKufpA=;
 b=rFsllXb/0k8LTQ9od4DUcnsZZlvVMt+9p85rTMEzn2sC9lGuEHVc6jNXHvOi+HkN2uZRs6MPIgRSnRiCoDSm/cJaJi3By4ohOUyEmTSjhaMJNE60Ou4n3Ey8MISkkZDcbUAP8RmBUktR9WvkTiubTkPaFOUZvhm/eDLZSwIlpos=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB11029.jpnprd01.prod.outlook.com (2603:1096:400:392::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Thu, 20 Jun
 2024 17:11:11 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.7698.020; Thu, 20 Jun 2024
 17:11:04 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Vinod Koul <vkoul@kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Kishon Vijay Abraham
 I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v4 0/6] Add USB VBUS regulator for RZ/G2L
Thread-Topic: [PATCH v4 0/6] Add USB VBUS regulator for RZ/G2L
Thread-Index: AQHav9uFt6049LPP0kieF7CZCpdzpbHQ4LEAgAAEwhA=
Date: Thu, 20 Jun 2024 17:11:04 +0000
Message-ID:
 <TY3PR01MB113461160DF55C996B0EA15E186C82@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240616105402.45211-1-biju.das.jz@bp.renesas.com>
 <ZnRa5CRumiJeMhEb@matsya>
In-Reply-To: <ZnRa5CRumiJeMhEb@matsya>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB11029:EE_
x-ms-office365-filtering-correlation-id: 94eb612b-1600-4f71-186b-08dc914bf78e
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230037|1800799021|7416011|366013|376011|38070700015;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?K4/oCor+CU4chqxl0X0LALIWmY/uMFwGZ2fKRm+0E/gMUJSArFAEefj/O9qZ?=
 =?us-ascii?Q?ANdY4eq23T7kh/t5i6EmOLmJVQ3ydQdISKoCH4CoKwieiHyoD5eTNSMbLr2Q?=
 =?us-ascii?Q?dBAPS93G3Gqk+tH4uSXSR0om/OUYrMEi4/YL+VMoCOI/MMGFEW+Rlvyq4oB/?=
 =?us-ascii?Q?5ARtq7aRgLmEWVqwF6pSPgTuirZjX7bTQucFCrJhmkgaV9neT8r3q4KYpkOd?=
 =?us-ascii?Q?JIwN43WQIsOOAWFPwwrFCQIkG7QEdsgl2wV2JdaraTkuWT10o6xG1V8oMral?=
 =?us-ascii?Q?0Wk3+yhORXiO4CuM4E3tCT4Vg0rsk/1X74e+ejZP3+aZEEZZ5lJCVYcA8/qS?=
 =?us-ascii?Q?IcjUxo4e0Q9OQ9BvMNipVuFXO3duq0ojl3DyNfu1hjKpGJQZwrVTxSi/rSIt?=
 =?us-ascii?Q?naoP7W/0CL3bBZ8nsawR3Ydhno/b4LZNsqz3NYCYGXggTj0ZaKphMp9aUn2/?=
 =?us-ascii?Q?dbchwi0Xj0UnRIwEQAZ+3LUchiQ4/ibIooMJNo6sUW34r3INLkZTW4pCW6Mw?=
 =?us-ascii?Q?zRG0vpqy6qxzUgroxKcPo3AKbAvI0dwh+IifJrLdrpgf6mHA/DOO6wSDqLws?=
 =?us-ascii?Q?IQ2rAXcKNPwmWIBUuVLnCmCoNYkMVESNlpNxHtX7BCzhJZyovW3Ym6SdfJrh?=
 =?us-ascii?Q?9y7/P7Hrar27/7MhnnIZIMqPnGAvc2lomKdzy0c5TR02vxsFEp904NRmIfX+?=
 =?us-ascii?Q?5kv2sVB+00OiwgxsJ1n3Ivc/vujkBztM6KroP/C+DvosVZnKmoI18oulM3q8?=
 =?us-ascii?Q?8qXgvtrhg2dH9G0xB3gNHDMYHKpDOGJilZwcDMES/ij4Q+ylLXoOXmvHeE9y?=
 =?us-ascii?Q?9tzJp8c0y3i+cdkR4T22MOaHyJnjmZ3SCWNrmGxH1YJa8wJA5phiT7D2yGdU?=
 =?us-ascii?Q?lblZ/yHgZezov5McozlUMVBnMEpT3yKmNogmQcr0fHH4+Xl4h7vQUIUSs44d?=
 =?us-ascii?Q?PEp+83L55/45A4dHa/V4MzRkWiDcKMEgSC9zrkX31/DNwFH54/5ceSs05FJi?=
 =?us-ascii?Q?f2vEJbELZRGozr9YIrnUyOK+8zIvX0F9KlK3+O3jQxPgy/3KiipWJqM7rmej?=
 =?us-ascii?Q?EZu9fTLvhxrznkAW/Yh41hPJCnkawka0rFlhv5v3g9JPGDmjoCMJ8NmkYazE?=
 =?us-ascii?Q?o5tqJ9F5tObjx5E+ejCRrZEgg0FMv8Jf7BTa/rMdt4EiR/FWV7d+JAFIQDnq?=
 =?us-ascii?Q?MCxqvCnCNsKLJCXpSt58pVFFSgoLsDVYqoPqBc19W87OzJAyQNnxmtiA7NqZ?=
 =?us-ascii?Q?fEghF5vIJccpi/+19revVy+KEJud0tlbclzY5+fG3y7E9u13ULbanjywDUVx?=
 =?us-ascii?Q?svoR4+oblY1Kc9CcYCcpIQnD/A5BA3WjvJS8r4lKWNqwzBvqQ5xKryiY/dEM?=
 =?us-ascii?Q?dr3/g/Y=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(7416011)(366013)(376011)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?U1S2Emw//eRXmCjC7XMXStmx9Sg5Ww2NhzltFDg0/Z3DAOHD8H493PSUMhqQ?=
 =?us-ascii?Q?hPEItEemmIE2DYjI2UVEFYqfnwGnK//ZDAQoxHEd4LLHYTHrMUMjt8H7uqGP?=
 =?us-ascii?Q?O3IFmRcNgD75AIvtLUdHI9C9Rh76NYicZ4B21ouwScugEY/LyWmR79nccKky?=
 =?us-ascii?Q?dbBljM4NycZy6P6N02fk13rOM0cuJVBjhN6DqSKc8X+ZnEuuVGrV81WzbB33?=
 =?us-ascii?Q?2vbp8ZAaWJekeSRqh/iSoVFeLLioxG9gcY2nwRQUtLaR7dG9mrqPE+H/BvZM?=
 =?us-ascii?Q?SFOzNI3MtN73KtE1ehLeutK9mc80NYDfpWuSdUdjox5ZBSLOk7cC+sld2bVa?=
 =?us-ascii?Q?ETMmRuuPBRkS28MAvEd3MceyYyHhNXnqmIj6TqLT2LxLZsUFowu+W++t+Th9?=
 =?us-ascii?Q?d5m4QSbzhaQpycbnss79xn6wVzKCgKjG0bNA04Zh/zkhC6Ox1aN31Al+SSVJ?=
 =?us-ascii?Q?KK7PZ2dRtOsdveY+xyqu8BHMZTsRr3OiJtZBwDIln5p/P4y9bhzvFOGkJKjV?=
 =?us-ascii?Q?XotHivBZ5O0e4Lo0NrUhPTzw/QHmWBBGSOnm1uXqn8RN/uIvXqcGj3m3hXFG?=
 =?us-ascii?Q?YixOGYDTEatsD/VMDuMM43rjzr1rGxpdGTA/k/HVbUle3o3EvbjOIyPHhUVh?=
 =?us-ascii?Q?jpkkGsp4qOCN63QlG1jgLk+aicaupLmcre2CgaprbC3TcgsJTDP/iS7DR+MA?=
 =?us-ascii?Q?uxbTmfwQkzg5pe1qao6LR1crn8LpnFbyEumD3dS2oc3D15PGAO3dNTifTgq+?=
 =?us-ascii?Q?RYliR8C0quOdda84vQbbCKxEM0VJbqiBLdgHtk6hbWF6ldleu1jKWTBGvYEi?=
 =?us-ascii?Q?MuDyT8ydSGPM38bf8YYXBrPf/4rel8zpivDODTUUCRfnHcQPmV5wI5Sb70kY?=
 =?us-ascii?Q?U5fxvIsTJtIJ4M+wuBTZBen0N5s4jRgTI/ycuN1Bo1LterkFYPkEiRBDMGe4?=
 =?us-ascii?Q?JK6okZTgiZ3yquTVUvnshNBRWYqsegb4PhU4vamcf/gVDJfOQ4NH7Q/Ms7Ps?=
 =?us-ascii?Q?bIKEtVSE3kQDoh2q1C0SAbjH9/IV7vhBFYR9SMd6jrVNur+UjCUD8dvUPQC+?=
 =?us-ascii?Q?mqL4SQ65Gn7YgRJj4TfDZRg4PJ12fVwzdOhrwvNdfAdL/w55y3y+n0tLYHwI?=
 =?us-ascii?Q?sjMKuItb/ZKYGatbwQ6JIA5KvEMZUTzn5iLya+gKhgTQAJ0E84B2sT2U/y7w?=
 =?us-ascii?Q?USIGv83LuOjFCbuBUhybvYj4jtYvtvA2rpMb4BzYL9hQCovBmsIQIYCZsrqe?=
 =?us-ascii?Q?hNZKMJ9htG6enH7XnCqZClaYiYDTNo9IsgdKMHwLNO5TyqjAr8aJslF7MrrX?=
 =?us-ascii?Q?tA2l6a69YN/EkIuoHmhzqb+JwWhsGYdH01hWHPZkgLzVp/wGm76mk0gg9iWc?=
 =?us-ascii?Q?5uexY9onvnX5w1VMDENeMuM8OgOHALH3larNtKGrtcBTP6JQ6I+0WLXyV0bb?=
 =?us-ascii?Q?B/84383ni08/eDXgVrVn12wloEn/xwcw/b3r1BPY9Z+sTZbSEphrYbOR+dUi?=
 =?us-ascii?Q?iPvHr7mMGl6zXvPdT3itHW8zqeFYjdYRNcoiV7qjQY1LXgnyrx15rv8LLDXX?=
 =?us-ascii?Q?pdkQua+Chmd2E2grwGyPbMIX0Mtk0h5DSgFtvzJL7WSwOMsPmuHWEWge8Hpc?=
 =?us-ascii?Q?kg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 94eb612b-1600-4f71-186b-08dc914bf78e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2024 17:11:04.1524
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /5GtUBVq1005xyygk265JI10HEJ6BcmR9g5J6JnTMtvsoGy5LB5QdzHSxEko2HRBNJpO6p63plCI8leA2tQCWYIyEILjYX6Z6WK6wq8+cds=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11029

Hi Vinod,

Thanks for the feedback.

> -----Original Message-----
> From: Vinod Koul <vkoul@kernel.org>
> Sent: Thursday, June 20, 2024 5:38 PM
> Subject: Re: [PATCH v4 0/6] Add USB VBUS regulator for RZ/G2L
>=20
> On 16-06-24, 11:53, Biju Das wrote:
> > As per RZ/G2L HW manual, VBUS enable can be controlled by the VBOUT
> > bit of the VBUS Control Register(VBENCTL) register in the USBPHY
> > Control. But this IP is in the Reset block.
> >
> > Reset driver exposes this register as regmap and instantiate the USB
> > VBUS regulator device. Consumers(phy device) can use regulator APIs to
> > control VBUS as controlling is done in the atomic context.
> >
> > We need to have merge strategy which subsytem will apply this patches
> > as it involves multiple subsystems Reset, Regulator, PHY, DT and
> > Renesas SoC??
>=20
> Why is there a dependency.. why cant they go thru respective trees?

In this series, only regulator driver changes has no dependency.

PHY driver (phy-rcar-gen3-usb2.c) has a dependency on new regulator consume=
r API regulator_hardware_enable(),
Without this it will lead to compilation error.

USB PHY ctrl driver(reset-rzg2l-usbphy-ctrl.c) instantiate and bind regulat=
or driver(renesas-usb-vbus-regulator.c).

If regulator driver is not there means, USB PHY ctrl driver probe() fails,
that will break existing USB functionality.

Cheers,
Biju



