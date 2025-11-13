Return-Path: <linux-renesas-soc+bounces-24539-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A0FC562A2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 09:08:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9BC7C352399
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 08:04:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E94D9330D3D;
	Thu, 13 Nov 2025 08:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="gOnTxC3c"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011030.outbound.protection.outlook.com [40.107.74.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6302F7ADC;
	Thu, 13 Nov 2025 08:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763021052; cv=fail; b=sJnX3syttSmbGSocUKH21sp5Iq3+rgUgEn+TJcM88JpkNV3F7CLtrIPuWo35kAOCPr8St+W64SP2nbPg3zpsDFiEDKlAVBKQDG9C+RQSwEK5sZDwIAKyfjWyGUchy/Wn6sDg1vAvZlowAH1M965dF88oUAhyG7sq2nvuMhj2vug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763021052; c=relaxed/simple;
	bh=el6bwn3v9proRhgyBITnsEs5/qcyJ+5DQnTzL2t+BUg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TlEHdntuB3a//vBjBrkDvEFoAKCEIK0hCekmQVwDOsZ1/ujoVW5PS+XyL22HwC+15Yb5uy2ROvSVXxhByqAgEArjZQX2MNL7Yupu/x6be8G+CHoKjDaE7Zfv53i7Yt4wV8OKcDq0nZyXQ9THmBlG38gopVW6hMxRy8sPobVCbKI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=gOnTxC3c; arc=fail smtp.client-ip=40.107.74.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ulw0G6zrraAZatHgsGH7M/8k7/uy89LlBGCOlPw0F5d35OM8253FRbXGn1cp5z5Z0xDzF+LLkzF2YOdIOzZ3WXxvOus6+f4FpBl/qfVlxkz8yOVipIGq43D8QuaUJrvWQZiy5LbcAkiHn6yKlZra22cFOcUmgeGMjv/4Z8WmS5X9wcQOY3nG5JZMMJPNbaot2hxNxzDWaV05skjnZQcdnkxMkySeaA3ECOMsSguYW26oQThRpmz0QbLAVuRCQQ5PkK6+TRpNBS+cx3Jvq+tSsE2hQsL7aouYFCCnbcJg0a8+8rcBydZkOTDs5UhfJHvoT6/VUwE9G+6lP43bJzmNKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DdesNfFxjOnwxzeQBYDyl94BOoVHrVeOkqTGEP4Q7gU=;
 b=UqATf4HUaUniGSlk1MBLgCPZsPOEU4pEKOWWH6aonEFwCfkrEgnr0UMT2D17CrMOy4wD/4HHt7jBWk4sbAF+v3Ab/lOXiF6KwA+4rHt3RS1ervLcimtg1wZHkpNm3MOZg+OKHssYTMYXm88XGN75tv1K1txvuCWWNc3PILeX3+ikl5ZdG2yk/1XaKTdQCd9RQNm4voSk1vmsuUUkl4TUHzZqBd+1ZvxbRiH93ri4J7v+11UF0GzvhppEaRSVgvTNrF30yYqleGOtXxXAbS4T7soICNLNQwDMaaQjH8R0SnpKr/lLfpQ2vhHOdLMpzZpEsGvp7+NdN6HFIhqbdaDYaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DdesNfFxjOnwxzeQBYDyl94BOoVHrVeOkqTGEP4Q7gU=;
 b=gOnTxC3cU22vRNqBYYCCnqbeFLSlae5hyKCOmL2HhfWEBAYPLDq0ezSmJvQVcJkO+aUEsAty1T2KbxpNf7Z5dpDRl0HEVsr9F3T3O5oenDjInUbaKsuOthjsRxtihXnWJm3gMBnWhqE+GQ0oexGgqt1SJlupFv1r5Fn3XtDRfOI=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB15791.jpnprd01.prod.outlook.com (2603:1096:405:2c5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 08:04:06 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 08:04:05 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
CC: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav
 Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>
Subject: RE: [PATCH 6/7] ASoC: renesas: rz-ssi: Add support for 24 bits sample
 width
Thread-Topic: [PATCH 6/7] ASoC: renesas: rz-ssi: Add support for 24 bits
 sample width
Thread-Index: AQHcU+rTeWc+ZBKp4EaoFC0P7Rp7vLTwHKOAgAAjU0A=
Date: Thu, 13 Nov 2025 08:04:05 +0000
Message-ID:
 <TY3PR01MB11346913CA80804E4EFFB670586CDA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251112154115.1048298-1-biju.das.jz@bp.renesas.com>
	<20251112154115.1048298-7-biju.das.jz@bp.renesas.com>
 <877bvuwk57.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <877bvuwk57.wl-kuninori.morimoto.gx@renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB15791:EE_
x-ms-office365-filtering-correlation-id: 23392b2f-632b-4248-9677-08de228b3765
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?rLw4+CgiU6sSwlzPVDnoOCPQtKi3dwnZxBMJ3m9cMYtTEa0Qr6sC9KdV51pP?=
 =?us-ascii?Q?zPMF4lf/Cy6mBzUEn7Dg/nAfRGbIYSvMP2+d7JIbRnFaXRED/VUOUMJxG2RT?=
 =?us-ascii?Q?69RzBcbRCnth+IsandbPEMI6Ty2/+RuZRpyTPlaTLJXkaJT5sofmBETOuinG?=
 =?us-ascii?Q?g5DD5jB5QB/qNe6Dj/voI3NwlREqLffsAL3onArI2KPNii5GpeVO4nmV6OsC?=
 =?us-ascii?Q?8lmA377w06SazGlsqKjxhUq/0zt1q525Rro9gzPwRo8VxddRoE0TdiuOTIaV?=
 =?us-ascii?Q?ZE/glIP8R5bRqd+kbL+Pmu6mOgzNS92FFgElXRlO49joayvorlZwtEmM5aPT?=
 =?us-ascii?Q?b6P8XEjifOaAc2FqX0oar6yg9UWT9a7Pc9CIrb4HRJssOrMzk98yOKFkGCl5?=
 =?us-ascii?Q?XJXT4x6+kV1cdA71yrIasIN9igXO9/AAzrCST0Cxe1whWfLUgwczw3JZ0EI1?=
 =?us-ascii?Q?HUR2JidPErieot0PiG4td3cGUbsvs/4N81M6COdSW7f9UszDCTF4TaeSCZyq?=
 =?us-ascii?Q?bKwvKoWwpc70a6VxOFUSsAu9e8+BNxXIYtcIft0JtxY1rft8fCDyhNLQq7XQ?=
 =?us-ascii?Q?j1Bs7wIWW7/I3hY2pwANghTgqHzkSgJfBD9OZJ4ODnHhXpsIn+SKWAlg56bX?=
 =?us-ascii?Q?qzZuupAcxU+gwmVzrw6vNQ03cZvXmlzbSfHgM9gBUSfmdYkfVGuPHx1bo4Gs?=
 =?us-ascii?Q?UiBvVk/dW6AZTeQQjTllRtu+v/VgQF5J3omInP5tI5fpTCVlF+JeHh7H9eOJ?=
 =?us-ascii?Q?RldhbKDvrCvIZ4G2Kogdv85SBDqT++2hFanTNYJ//pnj9RmWp1vESAhPerbY?=
 =?us-ascii?Q?WNNUEsxYc/4AVbkNrsuNQWaEiRkDeyTORz92g+VkSrdrayieQYVxLMQaNpKQ?=
 =?us-ascii?Q?t44FNhWqNW9fREl/BkFmQhJogVaVmgBLj7wx205QF9X3GOyPTMreTAq9JdRN?=
 =?us-ascii?Q?u+bkxWjzMwZ4gQgfJHNrXDPb+d9QnCzTqa6vdjlzcfY8hGLn3qHHISSy29bf?=
 =?us-ascii?Q?Mq16UgcXiJczRMwnpEFy3+a6XdHRMSJYfqGp0h8ArmgCO5N+nDJkJsw5ev18?=
 =?us-ascii?Q?wwMvBketyOEeVGbiqZNp0Eip7fAgh+42eKWdLlnkSMq/8nxGWqWOYr4nFv8T?=
 =?us-ascii?Q?mC4kBPKF5qH4slaLdQhV7nCvSY2DbdNfW1VYScbnUDJQ02yGTiSremCpNBs6?=
 =?us-ascii?Q?PzoTM+QxPvgocD/KjkeOIlwPaN/dRJpa2XL+Yi5tfigVz4prh9iM19Cas5mB?=
 =?us-ascii?Q?ie6RHL/NJw1Yr122y5OYva11c1rjiG5oa4kTBFfcwVLHTX5qy1lv8xY7hVl3?=
 =?us-ascii?Q?6uxHbeQ+9YJ7MHS1jm53d3E6i+v1hoZTLm9t6X+kPb6cGIJ9vUeuBUV3oGdI?=
 =?us-ascii?Q?LQlojf97ekmb/zxsxTWSqXLAId0e4X4FTQQJ+Vqk1llSLgU7hXgADdX+V8Ge?=
 =?us-ascii?Q?lhO+gI15xfonjxoluXu+gmowBTa4sFQDFbxgqm/+l4+UGiUD5if3UwT6gX4Q?=
 =?us-ascii?Q?83vIk3ZnB/GtgzwlnMyhoLALQoij5i8VGLCi?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?XGqohN4JulzwfXr3Qn7erZBq6mBjBeVx7wag57xI41xqBWQqayGyGLJx495O?=
 =?us-ascii?Q?o70iXD6Jnrd92c+abpt390iQAB3ZE1piU4C3VQ6OiYY8v/8hQbHQRPBjl1tH?=
 =?us-ascii?Q?Ny7Lmm3TvQCo+kIz6jvaaqZmos9N/Y6cbSicx6v4znCUJ08JlCNsqmqvn75t?=
 =?us-ascii?Q?ZlKUPqVA6AicsJrY2z0bVrcvl584G5Ioqedtc1HReiCvghDm8xpWG6Zwn/PD?=
 =?us-ascii?Q?yLfsjddlg6DuBOJ4nVRO+j/cvZIfPExQRmQeYT+Z0cdEWpE/mIB+vIKqaNnQ?=
 =?us-ascii?Q?hUWIVY65w7ZE/jVHDy39M0GE9bnGmrw0F+En7wDpvJYCWD3LH2nLqxNnIMET?=
 =?us-ascii?Q?aMHec0j54aCJYDIfuRmwHaY6zw0HUzPjPrXnkLltmAtjAu5jbeRZQJMf3UQ1?=
 =?us-ascii?Q?8PRPhEa40E8pkiLIawsjCxgIPLwntCGotaVtk4Z8Y6iCkCN3x9lmQCKg7n1C?=
 =?us-ascii?Q?05zLUTkuuU9zFoJxo20evzjbFvtDqjKuz3pH+IEdxa71rOpB94GH3Ee1hhfp?=
 =?us-ascii?Q?sHaZIli6l0Yu3JwVEyJmDN1t3OCC6FFSGnDsPmojbbMuOXVvhz/0pCh9Uk2r?=
 =?us-ascii?Q?kbz4gB1q2s+LuRU8fCb03UpQmlz2rsd6OLVUvVP+gzVMaAIoWJdZVLT0SvQP?=
 =?us-ascii?Q?sf9Hu861t113xCvQaKfwL012JvdxyMABqcLBM7u54dGB6O7CxLRX65Y17lCQ?=
 =?us-ascii?Q?IDxxMsx7ao/c4oUYBC8Ti/j0E3E0ywnq6E+RwvHP6prEcospoIPQq0DZB8jS?=
 =?us-ascii?Q?U1174+ZIwshCvDBeGoxTivpDJ0Uf997/U+5GtFOXKIDEPCTnP7RGA6ClQFU5?=
 =?us-ascii?Q?1ZHHZBFh0f2AnVS5P/B57a7BGzGGs5Hu5rs1Go+2of9sob0cLlgfPce1w/MF?=
 =?us-ascii?Q?ysd68L3ot0Wk/6JLANLX/FOa8X5MhKVaACeEGZD4WeHythsF9E8igSctTB+/?=
 =?us-ascii?Q?gb1iwjS2YhIdFoe/FdUHhS6G2WO6bv1ypupNdESDnKbI+hgytufs9e2SM43z?=
 =?us-ascii?Q?xWarGEIrDCkMTm9odf7DihX29TgsD+UoDmGXY9rNlso8r1GHiBjVFYyx3RmD?=
 =?us-ascii?Q?GQhd9/Yy6bEMGQHzPHv8bOFti9j+XMkBQIj/ayDkPGPB2CyUp3JoP89sy8KZ?=
 =?us-ascii?Q?0cLpVYspXNIUh4YRSd2OdVAno8ZcoJ+U5bmJqzuo+0HnTKJIONt6PUA14qrj?=
 =?us-ascii?Q?i9sd9YRPMGUHlp/g95xeA/3U/TMUYrBoXfTcjGIikF8eGgI2YMFIh8brEu3k?=
 =?us-ascii?Q?HfCApZyYql8cJGhdhquBDc88uwDYmDJFAw6hAY+CxLmHy07PsoQV/MAXsy5z?=
 =?us-ascii?Q?PDmu97Wik3iY8xlO8BhrUKpB5ticiZVxXT5d+t6lrjPDHGT24EoiAZk7VQhZ?=
 =?us-ascii?Q?fQqURKJjiebsJ4EVUudDlWI4UkcxwheEBFd2FMcxNtcHXxUAYz2BmV24Exok?=
 =?us-ascii?Q?qOh9i/pcxZ+a0ykW9nY5nHguYiMuHFqx1oOHeksR0m3SKljsdJYwuHX4QYf/?=
 =?us-ascii?Q?5jW1O1kmsOI1DAbU+lcAaYoChxtS21NU+HfgY6FyxGRz+vdHh3930iADdwjX?=
 =?us-ascii?Q?1jQ3EuSqjYfzNAYTnB/NyL1xleYhTXGm8Xy1GA/KOEape7ax5C2jr6TEzVpw?=
 =?us-ascii?Q?tQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 23392b2f-632b-4248-9677-08de228b3765
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2025 08:04:05.7893
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mjJEH9fHMpZa5W6SK6rb6ZAEqaqzrYQgvVuQpIg39PHATaSHRu5DPGe+K4aZqFgvrQpncK7IFPRcT8vFtwFyQ633Tub7/dFOPoTEKevNwvI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15791

Hi Morimoto-san,

Thanks for the feedback.

> -----Original Message-----
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Sent: 13 November 2025 05:56
> Subject: Re: [PATCH 6/7] ASoC: renesas: rz-ssi: Add support for 24 bits s=
ample width
>=20
>=20
> Hi
>=20
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Add support for 24 bits sample format width for RZ/G2L SoCs.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> (snip)
> >  	ssicr |=3D SSICR_CKDV(clk_ckdv);
> > -	ssicr |=3D SSICR_DWL(1) | SSICR_SWL(3);
> > +	switch (ssi->hw_params_cache.sample_width) {
> > +	case 16:
> > +		ssicr |=3D SSICR_DWL(1);
> > +		break;
> > +	case 24:
> > +		ssicr |=3D SSICR_PDTA;
> > +		ssicr |=3D SSICR_DWL(5);
>=20
> nitpick
> It can be 1 line ?

Agreed.

>=20
> > @@ -662,8 +697,13 @@ static int rz_ssi_dma_slave_config(struct rz_ssi_p=
riv *ssi,
> >  	cfg.direction =3D is_play ? DMA_MEM_TO_DEV : DMA_DEV_TO_MEM;
> >  	cfg.dst_addr =3D ssi->phys + SSIFTDR;
> >  	cfg.src_addr =3D ssi->phys + SSIFRDR;
> > -	cfg.src_addr_width =3D DMA_SLAVE_BUSWIDTH_2_BYTES;
> > -	cfg.dst_addr_width =3D DMA_SLAVE_BUSWIDTH_2_BYTES;
> > +	if (ssi->hw_params_cache.sample_width =3D=3D 24) {
> > +		cfg.src_addr_width =3D DMA_SLAVE_BUSWIDTH_4_BYTES;
> > +		cfg.dst_addr_width =3D DMA_SLAVE_BUSWIDTH_4_BYTES;
> > +	} else {
> > +		cfg.src_addr_width =3D DMA_SLAVE_BUSWIDTH_2_BYTES;
> > +		cfg.dst_addr_width =3D DMA_SLAVE_BUSWIDTH_2_BYTES;
> > +	}
>=20
> You can reduce extra if check when 32 case ([7/7]) if it was
>=20
> 	if (xxx =3D=3D 16) {
> 		...
> 	} else { // for 24, 32
> 		...
> 	}

OK, will fix this in next version.

Cheers,
Biju

