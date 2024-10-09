Return-Path: <linux-renesas-soc+bounces-9633-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9489973AE
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Oct 2024 19:49:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 455611C24B2B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Oct 2024 17:49:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 482631E132D;
	Wed,  9 Oct 2024 17:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Q81nwb1L"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010060.outbound.protection.outlook.com [52.101.228.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF291A0BFF;
	Wed,  9 Oct 2024 17:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728495885; cv=fail; b=e7WxO/hbtpIFXdma3wzT2v/lLtnxttUlqUab0ZDXgTPBpMR62IRTKAnDpXDK1CbJE1DcmYJt+1mOiNAIl3udJS65/Fb74XP31EakXVAiGXwRVD4Noiu4OwIEuFN18mtIsZbSoxPaWlbL3arveaB5HAKBj51p/dLbSWp92Zj7I40=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728495885; c=relaxed/simple;
	bh=u/u2YKBK+RZEUSsJLZigenKyZunEzfTea/R5QD7l71U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=W0WSpkonHZzzNwSMz15C+XujDrdoM08l2QGnbRdI//Vr22L/T2nQS6JNspr8XJAcw99KzWtDmAJ0teyOD6+ONOlvDP/Y+3xv/Sa3wLpD92LUshSFuxcGGRnVihv1DF/OzY13OOnLkHhra4ULG1j0crYnjdt60BPsofWaJdhgZsg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Q81nwb1L; arc=fail smtp.client-ip=52.101.228.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PMSUIlsuBHrn3C+SaSxAxI0fzFATVswPo1SJlgBY77zcBsbTGEbGIoVHvKZGvhXWfkB2Dm7UVmdIUHjh2jtHpc2TH57+lks3xCfqNLuJIYQcJx4CJ1NR/Np93zHbT6wSszqXK33lZxlPGUJgDRsgQmVj4cUNvpPYagukH5ZZMJTTDLTi0GJ0Enqf3ZlC19yp8qz1TtCeRnmlNAMzKM267dJ//g2MLLFOXmO/wMJiKTEMYNUA9mmXK24Qf4TI/bbe/M3AkUEOKbtWD+MCl5lf25srX8WHlbdM4ZwlZLbA6UucyKD50h8JdZyVoEK4DsUHMHEGsUd5iuqeN57wokVdpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3QI5tBHUnNXMWni6eh+EkGMBn18Lx38sa9nqdTxIi4U=;
 b=A2iO4cO9ZEDm3xJdg4GnPeWI8w/9TsxInvxNEVs6eCerF4i/cfjmpKo5n29XNWhcFXVSnJAqbX1CB2MqzgktlvW8BjPcDSMDi59g08IPw0RjGOCEABnaYqVwAxz1lMUoyp5lWTh2CIeAO5QzQ0tTNJTD93bfrrXkg053q35XEL1h4URTtJoddDIylY8YYT8YMrU0Bo+bfx6gpzwq8ZXXRdT0VX53Y003Xtj5lC/rzZlbAs3sCxnipxa0OHYqdG5JMpdQEinjnUE1N/wy1XSE6kSTzMZYGLWWaPls165FWsu4SyeOjyKhwoi6VSE4gCaqZbuxZ7N5R/byYbRnosl7iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3QI5tBHUnNXMWni6eh+EkGMBn18Lx38sa9nqdTxIi4U=;
 b=Q81nwb1LXgTipN/KyD77WZMGoXpJvOQgkVh6B9NdZvsA3qYt51jaOwgovViGVIFhE4pqc4jn5mqLggKmzIxdh7LhaSDBw24aCgiac0rYc39BxWJ2B8Dj8QZ7j/ffI1vaMsQcj/DSA9Srx7QLjfCuwNIR0ZFNpt/opGSH7shwL6M=
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com (2603:1096:400:448::7)
 by TYWPR01MB8726.jpnprd01.prod.outlook.com (2603:1096:400:168::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Wed, 9 Oct
 2024 17:44:38 +0000
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430]) by TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430%5]) with mapi id 15.20.8026.020; Wed, 9 Oct 2024
 17:44:37 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>, Philipp Zabel
	<p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>
CC: Magnus Damm <magnus.damm@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Chris Paterson
	<Chris.Paterson2@renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 5/6] irqchip: Add RZ/V2H(P) Interrupt Control Unit (ICU)
 driver
Thread-Topic: [PATCH 5/6] irqchip: Add RZ/V2H(P) Interrupt Control Unit (ICU)
 driver
Thread-Index: AQHbCSe8jfn/yqHRAUKBhaMTHEgkdbJzX8CAgAtxG+A=
Date: Wed, 9 Oct 2024 17:44:37 +0000
Message-ID:
 <TYCPR01MB1209390E575CD0D39B2AC8B9AC27F2@TYCPR01MB12093.jpnprd01.prod.outlook.com>
References: <20240917173249.158920-1-fabrizio.castro.jz@renesas.com>
 <20240917173249.158920-6-fabrizio.castro.jz@renesas.com>
 <87bk02ydzk.ffs@tglx>
In-Reply-To: <87bk02ydzk.ffs@tglx>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB12093:EE_|TYWPR01MB8726:EE_
x-ms-office365-filtering-correlation-id: 8da8ce2f-d13f-45f4-767f-08dce88a0bab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?51OkdVkUy+GHNCPk0OS3hWh2cseLrMHAl83LLtG7GObmx3kr4o8rEpmZskZ7?=
 =?us-ascii?Q?UzYRC0dVDvfZ1eJv32Qunkc9lo6RDK7fVC1e1JIjNzmpSaHRBoGDxTGoZLNw?=
 =?us-ascii?Q?aAQ2UFi7sjZNOracDtg/bQrqvTFm6FMbz6T0xd4CZDPeAKl7iHNs6uR/BaTi?=
 =?us-ascii?Q?x7mthZlM0VlEvAeT/wqsP/8mAGbcyQtpG/5HCtU1oi/7FX01TUVJmOLQNm4B?=
 =?us-ascii?Q?Vi3qobatgSwn6CjXAgJAdAXPyLx3fymbyNwV+kvVtGPsszyNMur+KnCEYxDv?=
 =?us-ascii?Q?8oIe3DpxS9nzs2VX5LebtfXioWlNJ23kuif04uJCLwM2pM3m24JD4EkHAkbn?=
 =?us-ascii?Q?C8f/mkrED9J2VQZtNiNno8q5DaAAJ0y2dWVZcGOlMQg58kzlzdW2Dg5MrOrU?=
 =?us-ascii?Q?ibTUPkfZFSfCn+6H4wFhERpNeTMtExcXD41sD/mfeJRp8ZzuCpZNrd8YDyfd?=
 =?us-ascii?Q?6n/FY/QLt1bLlzuRpn+Z38PKYTOSAIODLHBSxXjRPgQCgLPq5UGN4uac3UBF?=
 =?us-ascii?Q?WsPEsn3xx6Og6e3gD4rZsBGFXSdzcX7UN4Bke8CoVDReb0vAxtidKXRRR9rO?=
 =?us-ascii?Q?s2KVOJUCywiU3jweGj8AAM2KEJ4IWwd5Ze5u49kLoyvff0JwR9ZRm+rfy/TL?=
 =?us-ascii?Q?ue2/iZv731S/eingUF/35tigDOulQPUW+zSCliHqNyD1dn8KKScUdtikRgBX?=
 =?us-ascii?Q?YVLgFlOQ2caK6Hi0EhxpZVqhiPmFzh9hHTS4KVafwCVZ8T6uNiUqwy3qy9oP?=
 =?us-ascii?Q?EAZ2nZZir3ULIg7h2XwRBH7MMgqcoSP5aPqiUe8ttokBikmvnV29m4fF9K7d?=
 =?us-ascii?Q?JdYlaD7JLPKFsM56APXUMax6NqBsQOq6g3Hsj1wRPOrunHImwR9MMJ6EA0bh?=
 =?us-ascii?Q?zWV9xNig7i2XWdtzSdGC4wTGGGm44DLwTqA2UyKlgNrvscJXxl4rovQXEl//?=
 =?us-ascii?Q?y4uUMMwHgYM2oVPtg8Sj7Sb5qbu6tKW6O4alQMWfoYGjOeLHQ72LNvQ7Boez?=
 =?us-ascii?Q?3Aa4IfWDpHAmgFMlY52CmI9EDBlNN51dGtAd0I1bgv9QiGW4ASwlWk+8CR+a?=
 =?us-ascii?Q?H0dqICj4fDqb8UvPW/TuJ/gOu/JeFaxh1Mz6aCGZ6tcNCuHUL52zgff3kD9z?=
 =?us-ascii?Q?/HroJfcP1STKhKp/zykGZi/eCEn/TmX6JpTMkeNh/BNBLQyrXW6DYGj+oute?=
 =?us-ascii?Q?1KAGsGcChucItAuMH6hOQTPoCsTVJN7pSikeZkrKsihAc48FHZQZCk2VqygA?=
 =?us-ascii?Q?r5NpS44ynzqrsAP56JzIQYdG50e+ysu335V333EpDewweWLUo1MlyyM6ZCiB?=
 =?us-ascii?Q?eLrBgbv77Hk2y5y5FnhcWukZugjztdICmvGBnlnDH8DThQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB12093.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?QUuTiGVDS00QoTQrz6DJ5yEXHARkgRNeeE/ByxARtPwv2VjSayT9KnP2DMOs?=
 =?us-ascii?Q?HCjX4+WL5ieT5T8OD9x44XPxqsBnF8C+BBfZSjMON0zJM3fA4lpTe862zsto?=
 =?us-ascii?Q?a1VLmC+WOTHnNBE0p/7JjAvWZ+kxOcJdzPnGFyr6W9a8CuS4tudOQUjK5VTf?=
 =?us-ascii?Q?vmBTWTIA0zxf+E8DQEW3Nopi3yT4EUiyvHAukRNlkiVpIE3ayH15wxY/VnfE?=
 =?us-ascii?Q?UbkzfnNdXHtFVgjhaM9dgwHOZBTC5e7Mr6WiOR222cX5NkZMbTvZYul31hzK?=
 =?us-ascii?Q?DgpvAVbxIIkn/TQsQifwGGFKVFU4TTAjFsHkKywRzbXhGBeR+B1UGoJ5Rwu6?=
 =?us-ascii?Q?P5KAe0Ej1NwHroF8lxAUrvyZFW6qSAm8eq+vA0NVG72jBp2DCgsbqTDr4iVI?=
 =?us-ascii?Q?oAvQynRZMDs4piFwdt353RQZao19lMTEOaM2Jq97MDdrCwO4U+DU2K+lPGyU?=
 =?us-ascii?Q?TlE6GvRCMSKRxi9un92vUasEdBsRFfWm7ArYwTwdALCHJ+X8MvYxJMhWIgsg?=
 =?us-ascii?Q?LDlVZeVCne+W2DcN3cL8U9dKkLDlw8SL+dHW3t/JwKn/HRfiqA/e94NHRIF0?=
 =?us-ascii?Q?NBhHlQrUlCArThvdVk1Q6eOQEwuG5Yujmc+2pjJlwYMkQpEtu+hXyO5pz1QH?=
 =?us-ascii?Q?GBEx+6HuO8Jptz9PHpUbFQsHiyW3+Ybk0wp5XrQ8DST62wa87B4F0AY8GfmA?=
 =?us-ascii?Q?dzFHuxsL+hfdGHOw/zSaZajPVEKMuqBiD0yXk7MfxI/e0vWLQE1LpFTBCVfE?=
 =?us-ascii?Q?sK9BwZzBUppjXq1YS/5odnOvnYiR2NNuV12uZ3WKzCn6GeJC3+6XkCohF7tb?=
 =?us-ascii?Q?NWHNrPO3DQkay/zMQRt8Qaz2g4HuvBZvGKJVrsOu2DsKn1pSEFi0nQ2QxrDb?=
 =?us-ascii?Q?OUDIW0x9dRSYkHnxCH5t/M5V14ERPaQADgxCj2g086d9A9J1EyGVQDd2dffA?=
 =?us-ascii?Q?oPyH30YtCsjg3IiiKXvWwBI9YfG4/LTnjh+qzCVUWyZVd1W/fxbuOTdsqeo/?=
 =?us-ascii?Q?xcbD0nml4tPdwrbxgr+TzgGfrGuzi8yOzFU2QcZiu+9Cqwqazj62EpsBSclt?=
 =?us-ascii?Q?qlOXRbhLrqNvr7oL/jM5RGpdSLXi5DmeshqVUngfL2oMzZJiC/rTdM6P5pjM?=
 =?us-ascii?Q?uttuQ7DnWYrMfM9uLKmIwd98tbnWMUcBouQ/8HVUmCckEeDoL4/3nd85GaDy?=
 =?us-ascii?Q?HkTwHFsbhWRpXdD9gnP4cf1wAGTMJ+K9IkVDrdubrvwJf/pf7cHw9/9Iwvbd?=
 =?us-ascii?Q?1+ktNATGDBZsHNOxdrCldtZgzYO1FShEj3iUksUpMG99tFvoW+nT7pTSebGj?=
 =?us-ascii?Q?syfarEOUTn2WzySjlXWU2bEZOQsUF2mESxsZQIfYWlOBNZpi9+NFhAtyvrEN?=
 =?us-ascii?Q?dVTs9GKuWlClvH2LOn/JhePdmqQBM25Qj7Y7wilRAQ7d6x3gMsBVfIUrGJcq?=
 =?us-ascii?Q?oFrEI47r/SuxMCZsECsbhht9X8N6fZZrcpw3Bd3JepAFdPMQwDppbC9OxmAz?=
 =?us-ascii?Q?6nDQpRb3cgwPcN5Q3HC5UpzfbIZc5PZOjqWLZn2/uOXOZ6S5kHF5HqXU9F3X?=
 =?us-ascii?Q?zlO0iWClMX26yjCJVOzLqeMdPhm9S0CSsd5piX6Xw59ijbrrXpOjeK04BulS?=
 =?us-ascii?Q?Ew=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8da8ce2f-d13f-45f4-767f-08dce88a0bab
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2024 17:44:37.8097
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ABms63Vauz82cAxbl1KmPIFyDLwZNhd9RU6/duiWHGoQaJ18sxKy2L9wHkG/lEzzaTbPCSlFh5YRVzm0EbYdXlYhWSu0tpxiTX20sx2s1q8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8726

Hi Thomas,

thanks for your feedback!

> From: Thomas Gleixner <tglx@linutronix.de>
> Sent: Wednesday, October 2, 2024 11:51 AM
> Subject: Re: [PATCH 5/6] irqchip: Add RZ/V2H(P) Interrupt Control Unit (I=
CU) driver
>=20
> On Tue, Sep 17 2024 at 18:32, Fabrizio Castro wrote:
> > +
> > +/* DT "interrupts" indexes */
> > +#define ICU_IRQ_START				1
> > +#define ICU_IRQ_COUNT				16
> > +#define ICU_TINT_START				(ICU_IRQ_START + ICU_IRQ_COUNT)
> > +#define ICU_TINT_COUNT				32
> > +#define ICU_NUM_IRQ				(ICU_TINT_START + ICU_TINT_COUNT)
> > +
> > +/* Registers */
> > +#define ICU_NSCNT				0x00
> > +#define ICU_NSCLR				0x04
> > +#define ICU_NITSR				0x08
> > +#define ICU_ISCTR				0x10
> > +#define ICU_ISCLR				0x14
> > +#define ICU_IITSR				0x18
> > +#define ICU_TSCTR				0x20
> > +#define ICU_TSCLR				0x24
> > +#define ICU_TITSR(k)				(0x28 + (k) * 4)
> > +#define ICU_TSSR(k)				(0x30 + (k) * 4)
> > +
> > +/* NMI */
> > +#define ICU_NMI_EDGE_FALLING			0
> > +#define ICU_NMI_EDGE_RISING			1
> > +
> > +#define ICU_NSCNT_NSTAT				BIT(0)
> > +#define ICU_NSCNT_NSTAT_DETECTED		1
> > +
> > +#define ICU_NSCLR_NCLR				BIT(0)
> > +
> > +/* IRQ */
> > +#define ICU_IRQ_LEVEL_LOW			0
> > +#define ICU_IRQ_EDGE_FALLING			1
> > +#define ICU_IRQ_EDGE_RISING			2
> > +#define ICU_IRQ_EDGE_BOTH			3
> > +
> > +#define ICU_IITSR_IITSEL_PREP(iitsel, n)	((iitsel) << ((n) * 2))
> > +#define ICU_IITSR_IITSEL_GET(iitsr, n)		(((iitsr) >> ((n) * 2)) & 0x03=
)
> > +#define ICU_IITSR_IITSEL_MASK(n)		ICU_IITSR_IITSEL_PREP(0x03, n)
> > +
> > +/* TINT */
> > +#define ICU_TINT_EDGE_RISING			0
> > +#define ICU_TINT_EDGE_FALLING			1
> > +#define ICU_TINT_LEVEL_HIGH			2
> > +#define ICU_TINT_LEVEL_LOW			3
> > +
> > +#define ICU_TSSR_K(tint_nr)			((tint_nr) / 4)
> > +#define ICU_TSSR_TSSEL_N(tint_nr)		((tint_nr) % 4)
> > +#define ICU_TSSR_TSSEL_PREP(tssel, n)		((tssel) << ((n) * 8))
> > +#define ICU_TSSR_TSSEL_MASK(n)			ICU_TSSR_TSSEL_PREP(0x7F, n)
> > +#define ICU_TSSR_TIEN(n)			(BIT(7) << ((n) * 8))
> > +
> > +#define ICU_TITSR_K(tint_nr)			((tint_nr) / 16)
> > +#define ICU_TITSR_TITSEL_N(tint_nr)		((tint_nr) % 16)
> > +#define ICU_TITSR_TITSEL_PREP(titsel, n)	ICU_IITSR_IITSEL_PREP(titsel,=
 n)
> > +#define ICU_TITSR_TITSEL_MASK(n)		ICU_IITSR_IITSEL_MASK(n)
> > +#define ICU_TITSR_TITSEL_GET(titsr, n)		ICU_IITSR_IITSEL_GET(titsr, n)
> > +
> > +#define ICU_TINT_EXTRACT_HWIRQ(x)		FIELD_GET(GENMASK(15, 0), (x))
> > +#define ICU_TINT_EXTRACT_GPIOINT(x)		FIELD_GET(GENMASK(31, 16), (x))
> > +#define ICU_PB5_TINT				0x55
> > +
> > +/**
> > + * struct rzv2h_icu_priv - Interrupt Control Unit controller private d=
ata
> > + * structure.
>=20
> If you need a line break, then please format it so:
>=20
>  * struct rzv2h_icu_priv - Interrupt Control Unit controller private data
>  *			   structure.

Since I have 100 chars, I'll just get rid of this line break.

>=20
> This makes it readable.
>=20
> > +static void rzv2h_clear_nmi_int(struct rzv2h_icu_priv *priv)
> > +{
> > +	u32 nscnt =3D readl_relaxed(priv->base + ICU_NSCNT);
> > +
> > +	if ((nscnt & ICU_NSCNT_NSTAT) =3D=3D ICU_NSCNT_NSTAT_DETECTED)
> > +		writel_relaxed(ICU_NSCLR_NCLR, priv->base + ICU_NSCLR);
> > +}
> > +
> > +static void rzv2h_clear_irq_int(struct rzv2h_icu_priv *priv, unsigned =
int hwirq)
> > +{
> > +	unsigned int irq_nr =3D hwirq - ICU_IRQ_START;
> > +	u32 isctr, iitsr, iitsel;
> > +	u32 bit =3D BIT(irq_nr);
> > +
> > +	isctr =3D readl_relaxed(priv->base + ICU_ISCTR);
> > +	iitsr =3D readl_relaxed(priv->base + ICU_IITSR);
> > +	iitsel =3D ICU_IITSR_IITSEL_GET(iitsr, irq_nr);
>=20
> Not that I care about the performance of your device, but why do you
> need to read back the type configuration. It's known and cached in
> irq_data, no?
>=20
> Also this is invoked from eoi(), so why would the bit not be set when
> the interrupt is type edge and has fired? It should be set which means
> the ISCTR read is pointless too. Unless I'm missing something,

Both rzv2h_clear_irq_int and rzv2h_clear_tint_int are also called from
the irq_set_type path, that's why all the checks.

As you pointed out, no need for all those checks from within the eoi
path, therefore I'll implement whatever is required straight in
rzv2h_icu_eoi, to improve on performance.

>=20
> > +static void rzv2h_clear_tint_int(struct rzv2h_icu_priv *priv,
> > +				 unsigned int hwirq)
>=20
> No line break required.

Agreed.

>=20
> > +{
> > +	unsigned int tint_nr =3D hwirq - ICU_TINT_START;
> > +	int titsel_n =3D ICU_TITSR_TITSEL_N(tint_nr);
> > +	u32 tsctr, titsr, titsel;
> > +	u32 bit =3D BIT(tint_nr);
> > +	int k =3D tint_nr / 16;
> > +
> > +	tsctr =3D readl_relaxed(priv->base + ICU_TSCTR);
> > +	titsr =3D readl_relaxed(priv->base + ICU_TITSR(k));
> > +	titsel =3D ICU_TITSR_TITSEL_GET(titsr, titsel_n);
>=20
> Same comment.

Agreed.

>=20
> > +static void rzv2h_icu_eoi(struct irq_data *d)
> > +{
> > +	struct rzv2h_icu_priv *priv =3D irq_data_to_priv(d);
> > +	unsigned int hw_irq =3D irqd_to_hwirq(d);
> > +
> > +	raw_spin_lock(&priv->lock);
>=20
>   scoped_guard(raw_spinlock, ....) {

Good point!

>=20
> > +	if (hw_irq >=3D ICU_TINT_START)
> > +		rzv2h_clear_tint_int(priv, hw_irq);
> > +	else if (hw_irq >=3D ICU_IRQ_START)
> > +		rzv2h_clear_irq_int(priv, hw_irq);
> > +	else
> > +		rzv2h_clear_nmi_int(priv);
>=20
> Huch. Is NMI a real NMI or just some unmaskable regular interrupt?
>=20
> If it's a real NMI, then you _cannot_ take the spinlock here.

It's not a real NMI, as it's mapped to SPI 0.

>=20
>=20
> > +	raw_spin_unlock(&priv->lock);
> > +
> > +	irq_chip_eoi_parent(d);
> > +}
> > +
> > +static void rzv2h_tint_irq_endisable(struct irq_data *d, bool enable)
> > +{
> > +	struct rzv2h_icu_priv *priv =3D irq_data_to_priv(d);
> > +	unsigned int hw_irq =3D irqd_to_hwirq(d);
> > +	u32 tint_nr, tssel_n, k, tssr;
> > +
> > +	if (hw_irq < ICU_TINT_START)
> > +		return;
> > +
> > +	tint_nr =3D hw_irq - ICU_TINT_START;
> > +	k =3D ICU_TSSR_K(tint_nr);
> > +	tssel_n =3D ICU_TSSR_TSSEL_N(tint_nr);
> > +
> > +	raw_spin_lock(&priv->lock);
>=20
> guard()

Agreed.

>=20
> > +	tssr =3D readl_relaxed(priv->base + ICU_TSSR(k));
> > +	if (enable)
> > +		tssr |=3D ICU_TSSR_TIEN(tssel_n);
> > +	else
> > +		tssr &=3D ~ICU_TSSR_TIEN(tssel_n);
> > +	writel_relaxed(tssr, priv->base + ICU_TSSR(k));
> > +	raw_spin_unlock(&priv->lock);
> > +}
>=20
> > +	raw_spin_lock(&priv->lock);
>=20
> guard()

Agreed.

>=20
> > +static const struct irq_domain_ops rzv2h_icu_domain_ops =3D {
> > +	.alloc =3D rzv2h_icu_alloc,
> > +	.free =3D irq_domain_free_irqs_common,
> > +	.translate =3D irq_domain_translate_twocell,
>=20
> https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#struct=
-declarations-and-initializers

Will fix.

>=20
> > +};
> > +
> > +static int rzv2h_icu_parse_interrupts(struct rzv2h_icu_priv *priv,
> > +				       struct device_node *np)
>=20
> Please get rid of the line breaks. You have 100 characters.

Thanks for pointing this out, I'll go through the whole file adjust accordi=
ngly.

I'll send a new version soon.

Thanks,
Fab

>=20
> Thanks,
>=20
>         tglx

