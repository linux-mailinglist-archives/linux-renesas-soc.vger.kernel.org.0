Return-Path: <linux-renesas-soc+bounces-6721-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E33A916212
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jun 2024 11:12:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C44BC281487
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jun 2024 09:12:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7EC2148FFB;
	Tue, 25 Jun 2024 09:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Adp+O99o"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2063.outbound.protection.outlook.com [40.107.113.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B966E614;
	Tue, 25 Jun 2024 09:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719306772; cv=fail; b=FV6mIwaMu5H83UYQ/SrGWXyJ0wgwyQg/iBkpn5uEYo2ZJiDJbrBmZoyZxmYIjF/FhkZH2Ie9NfqVQUwUfesIMXal8ygjtR7d5A0JmDk1F9c5hvm9w5def/oHdYGBqm9iu3Py+y4ySOi6GbxafM/Qm+JTjGAbsHxJnKw028qQ4LQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719306772; c=relaxed/simple;
	bh=Sdivrx7+CatYgYc3nJ5hr69C7Xm9L4Ev8bUyLV3fkNY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jD0BW2GEAqx4Nt4tOymQSlfA0SpmvR1aTJLf3dh5YBBFf5kmePvoUkEQorF6azV58JasUnPXYcz0y8hjZ3pU1EBABcRR4nrkmR41/KUSI4S24dVbwVm94ynzNR+zrwpUFszaBWEbnYpU6TUXqWvL4PZVD7gTix2N1z7TYOEWm2E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Adp+O99o; arc=fail smtp.client-ip=40.107.113.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=blAFcrN85rI+3RhLYpsuTbDIlOmrmkpJuAkJ8lfFKpZ1sDFvY+zgeLS9FNMetHIJ4neIVaten6qWtwFgGWArs7iSk5gXg8mWsCHoBKIdHrvpW5zLeUSm+cwTDfbZqeQspI8Gw/SCsPG05R2AFcSLkP4g/fnCNBE230B9tpc9nBcNHtDkl8+Vm/+1Obxwl4ZdH5Tw5+c3F+mdqixUTGJJConVDfhFU3buhHTboUA7YbjahFGmykPSMF/dzFSQmESe2kHEr6Wbkbjyuy2xRa2K4FHfz+DfvhkZUidYAXuhbpNLgTGnDgdYy23o47vTMposz16F7nZYcOgePdJTnqxADg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bbuYH0eV4QlUvfn+RgyAM5zEN2knnQvNZlaKOrzpfEE=;
 b=MsYiGwXSW6y1kaiQKBHmBjAyMLjf+AjlM2O9YXZFYk/TDlrnkYY++gTgeaU4dfRfzLEzxINv0rDchqf16s1lxXIKBLWKy6CfPBW+lBp6Olyxum9XV3UIsMN+28GVcLYVKc5BQ4FhSY9qVhUjymXNxJuLRZcdjlEJ2fjm4k6uO+1W9Ovgaw28IryAwZPxKlpHThG4Q65Kj81P5EKjXVJ5fqxSmzgwtkVSBrwVd51i2DSMDcekcK8U8HTOfSVUesNJXOP2veHt+jW/3ULAB/ZlLX2RFBCTYUk/ZWXYPJH+7jKdBbtZ+iLThqfP3xAMT93I9+LSitAB7MyONF3W3EE5JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bbuYH0eV4QlUvfn+RgyAM5zEN2knnQvNZlaKOrzpfEE=;
 b=Adp+O99oNbDlcVF3rlzWgs7Ux1e7dfiacO1DAVx0yqOs/pA3aGxyhdqMlHDV0VAxsp3kn8e+poLfGYmIEvM3XISua/fTzDazeCGrff6YFhKcVGjINNgTnFLGhhAV6+rSmOdSLTaCbpypkzEEcirWl7GZZsw2QuAX9hEn15s/VM8=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB9390.jpnprd01.prod.outlook.com (2603:1096:400:1a3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.28; Tue, 25 Jun
 2024 09:12:45 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 09:12:38 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>, Ulf Hansson
	<ulf.hansson@linaro.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, "linux-mmc@vger.kernel.org"
	<linux-mmc@vger.kernel.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v3 1/3] dt-bindings: mmc: renesas,sdhi: Document RZ/V2H(P)
 support
Thread-Topic: [PATCH v3 1/3] dt-bindings: mmc: renesas,sdhi: Document
 RZ/V2H(P) support
Thread-Index: AQHaxkvO0A4lnvx4zE2BuJf82/SVDbHYMlww
Date: Tue, 25 Jun 2024 09:12:38 +0000
Message-ID:
 <TY3PR01MB11346BEEDB2125402E8A489E086D52@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240624153229.68882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240624153229.68882-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240624153229.68882-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB9390:EE_
x-ms-office365-filtering-correlation-id: 42753baf-c035-47d8-fea0-08dc94f6f5a8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230037|366013|7416011|376011|1800799021|38070700015;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?uK7VS2welW2qzX47mgUYREK/xmOKdIQbmjDci08PeeBT61mf+IvHMxishohi?=
 =?us-ascii?Q?sDC27bgkAo+Vo2o2Y9iKoMmQ1Wmw72qVQ135aIuutGAEzTVteb81/IZeKCuE?=
 =?us-ascii?Q?Qd3GtfcDTf3+g4znA8FPDH4vLH3D9iGvxrh0RfKNqT+yqP1CgvGqwz9H24T5?=
 =?us-ascii?Q?2thF6WmxF6RgIkPU/P6XeXtWI/gcWO+Pb4hd/AnCcTEuqu7IO1C+Js/oe6bL?=
 =?us-ascii?Q?uqsz+o9ZlDkbQuvTqIXog2P3sRHNNlaC+Po8PxCeoRXwow3MfoAoU/CjVydm?=
 =?us-ascii?Q?9r1uDIkyYkeCssc3UR5PwY1piUA3UyZ/PrhthwohiN9pC0D0egqxrQJySC5A?=
 =?us-ascii?Q?iqHEYzijKvrECR/7tEK0foZZko5QDSaTos8tWsLBNAlNpHlCZ6wm0+UBYt/g?=
 =?us-ascii?Q?1ru0sS8hCfDcZ+wj/FrMfdhXf1yLYfDPevbmkxNb4/xnBrs2LvUJ/UfzMN3/?=
 =?us-ascii?Q?aa8RMuNOHLeFVVt2IA3PjVFXbVXsW+prhjIPP1zXX5J1FuBGAcj3XGkHXray?=
 =?us-ascii?Q?wGlnBQlDll96OLfPyIILXxRT2F1RQjCl4RoCTRZLjwwG5+OK6tERL8B9wT4S?=
 =?us-ascii?Q?FI1QkHOpSRwxy4AsMLRyJ8nSuFwGAmLcb0y4vGKEXHrqEY3h7W+SZcH9cr2+?=
 =?us-ascii?Q?2Q8js/LUJSqyssyfF282r/csDiWay3PVaQh3fVLF75cs3drqRkTLaCSIyo8u?=
 =?us-ascii?Q?HcH8nsTkZHCVto/EirxDfEFbu9JYlpx6nO5VJkCSAeXQi3bG6yeTwznlL0uD?=
 =?us-ascii?Q?5458bAgsr7fF2FXLM7UlCtTKQDjxgetUk1xLL9/Y4TbGnxlZBHE0E+4CZaqS?=
 =?us-ascii?Q?38fs75jJ1LaqNHjqnpSFVuuMJKY3J0Y6lvDOwzzgeTmbBdhP2Zne1VvMPMpt?=
 =?us-ascii?Q?Pa9+Kkp4uCgzqM7sHt2hmTgYwqdN0w58iVXDfZUacyBM3MmBuzGOeBdPLo1b?=
 =?us-ascii?Q?GQ8U6lkQcrN78WHvuuufG3gNfbrksHZgpzw+GsZaf15PYfVSzeZhVWLhHuBv?=
 =?us-ascii?Q?KaZ5Gk+tnrej6dQBnRzVtSj2r5hWRsz9GY+NXxaiMitXVoozzOcWJ+DNUKrl?=
 =?us-ascii?Q?u/lOm8tPr4iAhMDu3V4sDIS5hFQ4k0epiIBtZraomQbD3msiKr3BUeyju8+W?=
 =?us-ascii?Q?UxYMuGQHm/M+hx7nRWp2ClgwqNgkl7r46np3X416hiwoP1Y8rvMnHzuUYhzp?=
 =?us-ascii?Q?V3YU3Akjgo2VnDZfhhj+x/fd2XYHLR9KgQq1BuZcssXvVse9rMw2DrZc81KA?=
 =?us-ascii?Q?q0nvdDOey0AOu8E7pC1KNNfA0Ru0Kdi9U4qFp/djLD/QVjdPFffhWBHPRoQD?=
 =?us-ascii?Q?TJgx/Q82WrG2McLJF6Nnu56leihYRgL3pSnHU0wkFd0Q5QkP04dCx4R9CxW2?=
 =?us-ascii?Q?eTEskY0bja1VJTisnEKvSyKb4wtbcl+o5Heyn+EGCr0LWa992A=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(7416011)(376011)(1800799021)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?/GDx2eiG1lDJbp+SwycQD1TKw/fsIOTplxo7VPe0L8nA3PNEBAGPu56nrory?=
 =?us-ascii?Q?hMhxnjYCJP5n+R4pKE4meRpgCDO+/zSthYveckVWtL215N+PC8k8l3lG6y+o?=
 =?us-ascii?Q?iKfRmoOWQXAa9XtKhvlvAZ1v7soN4F5yvdVtvSUDCizlumc9mJMIrxkekP+f?=
 =?us-ascii?Q?DulLDFQp+eAcIDCXJkD948ZiY2lJho6TDRulkDiFP8qNVpQx5IO2icJkC7HH?=
 =?us-ascii?Q?rzPwfmfCGqMcuZlGHeQugZmhWJ5nBR/CSrpmTN1jc1OTZeg65gghf+NNYGy1?=
 =?us-ascii?Q?ZftcWskSkjkq+LX9lAJc1BdeMfSqFO/oL0Jb7Sb4PA3SbqvMMq8nSgOrSdxO?=
 =?us-ascii?Q?q3bEvs+0fMEQzMmiZvjQuk5lXujuPUxgkWvw+eFlC7h5/IDlP8fAFG6Zm7oA?=
 =?us-ascii?Q?Srmkb7gG8b17gV7Vb8F6QbvEn09CvTWoM0riQnV7ncRYgSnsjgApwCUpxEvR?=
 =?us-ascii?Q?Su6/EY+yfWMDRf+gXK5M29xe/Efe2HYCDSnUzuazJHYUMtFtUOaB35zlAhgA?=
 =?us-ascii?Q?RTEAVL4vYgJdlV4CcUkColHbRFY34tfSxVDskmyKg24MOy/Obcui05UABqbF?=
 =?us-ascii?Q?f86JoYh/6J3J5wTf6oqgOLFCO6ano1gGYqo1+yMqovP/J4AGjSmcFgZn2vhV?=
 =?us-ascii?Q?H9UmWvhAQ1Kd+pzowBFiyXihDbMcRVJ+87WAeQJOeStH466exOiInnMP+Puw?=
 =?us-ascii?Q?Wy37YmWKju4qm+n5dbAeWgbPM1zco5DQF4yexMp9Qjxsgjqh0YO76RfK1FIh?=
 =?us-ascii?Q?1gsKtjy60cI2MDYA+l9Ff6CrK7nMXVwln70pyy2/2Vtt1o8XMRrKika+mYBL?=
 =?us-ascii?Q?/c8ZU4X7Aei5U3cF1X+o+Ylf8ehYP27VXYSh2pwP/ow4yD/xxr1Gl+bEDf56?=
 =?us-ascii?Q?WizAwGWbTPYq65qu2WItSOSvBAAq6csXLKOUZGPLnS9Vp6Rjpu9pojv10Vld?=
 =?us-ascii?Q?rqRNJdnB5/icn1xbkNMVs7IgBrBD+a8Q7nbiLp/Cuj6e9phTNLLmv442alYP?=
 =?us-ascii?Q?9boUYM7FMU0QbpyXvJLrCxe7BGsT0csupb1zUNWEkuZloNVDIxHnbVQVkPs2?=
 =?us-ascii?Q?NcH2t5rCPw0ZL6wP6yrD33lhfyGqmnyFcqXWWHr9LeuYsZjV0tKoE7CTaZ2f?=
 =?us-ascii?Q?fM7yZylaoKwBLZf6jXHm14zh9QB+ZSsEqhQf+jLBMQJH3q1I4KTOTJrFE6DF?=
 =?us-ascii?Q?LrPBMbhNX3V8nw7pVPENeFAKHclMYuwFnnZJyha8p73E29WQbiLiK7ilxGpF?=
 =?us-ascii?Q?8nASYZTdNOOBHqL3bvD69A9mcAqR8+UNS1IKO3Zn0M9SmAlYzjx1R7tezuan?=
 =?us-ascii?Q?ogPVRYbVLkeqzXgF91euwbLIypWyEtI4mTTtRucqG2LqsWc3bRo9rSCPQTTS?=
 =?us-ascii?Q?NMx1GStlxV5QNS8wWMCrryomXMPVv8Q1Jp1UahskczOvUX7Z0wCeEhoOjFwG?=
 =?us-ascii?Q?uKdr+U30PGaU4KNoiNSa2ylDOPZgnmbQhWRq6yXTsf6GOYxYvlLarNjPU/o5?=
 =?us-ascii?Q?kJgb7AaT5pgVRXYX+q5tW6MO9plR2K+31p5CKT1yPmAQt0mllPaEHZEejTUX?=
 =?us-ascii?Q?2zWWaTYGisWhseq4ma3FjVqB+sk3MwVoHuUJiZIp?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 42753baf-c035-47d8-fea0-08dc94f6f5a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2024 09:12:38.3884
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +g83CXYn2JfeI6htMpiezq5TYIxcNukhqQc9UXWKNOtsS5YI59hB0rKLFdSJiKci0Zjz368fQJfoFdJIQNDeK8GX0uIWuoG9htDGvdDcJZs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9390

Hi Prabhakar,

> -----Original Message-----
> From: Prabhakar <prabhakar.csengg@gmail.com>
> Sent: Monday, June 24, 2024 4:32 PM
> Subject: [PATCH v3 1/3] dt-bindings: mmc: renesas,sdhi: Document RZ/V2H(P=
) support
>=20
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> The SD/MMC block on the RZ/V2H(P) ("R9A09G057") SoC is similar to that of=
 the R-Car Gen3, but it
> has some differences:
> - HS400 is not supported.
> - It supports the SD_IOVS bit to control the IO voltage level.
> - It supports fixed address mode.
>=20
> To accommodate these differences, a SoC-specific 'renesas,sdhi-r9a09g057'
> compatible string is added.
>=20
> A 'vqmmc-regulator' object is introduced to handle the power enable (PWEN=
) and voltage level
> switching for the SD/MMC.
>=20
> Additionally, the 'renesas,sdhi-use-internal-regulator' flag is introduce=
d to indicate that an
> internal regulator is used instead of a GPIO-controlled regulator. This f=
lag will help configure
> the internal regulator and avoid special handling when GPIO is used for v=
oltage regulation instead
> of the SD_(IOVS/PWEN) pins.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3
> - Renamed vqmmc-r9a09g057-regulator object to vqmmc-regulator
> - Added regulator-compatible property for vqmmc-regulator
> - Added 'renesas,sdhi-use-internal-regulator' property
>=20
> v1->v2
> - Moved vqmmc object in the if block
> - Updated commit message
> ---
>  .../devicetree/bindings/mmc/renesas,sdhi.yaml | 30 ++++++++++++++++++-
>  1 file changed, 29 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> index 3d0e61e59856..20769434a422 100644
> --- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> +++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> @@ -18,6 +18,7 @@ properties:
>            - renesas,sdhi-r7s9210 # SH-Mobile AG5
>            - renesas,sdhi-r8a73a4 # R-Mobile APE6
>            - renesas,sdhi-r8a7740 # R-Mobile A1
> +          - renesas,sdhi-r9a09g057 # RZ/V2H(P)
>            - renesas,sdhi-sh73a0  # R-Mobile APE6
>        - items:
>            - enum:
> @@ -118,7 +119,9 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: renesas,rzg2l-sdhi
> +            enum:
> +              - renesas,sdhi-r9a09g057
> +              - renesas,rzg2l-sdhi
>      then:
>        properties:
>          clocks:
> @@ -204,6 +207,31 @@ allOf:
>          sectioned off to be run by a separate second clock source to all=
ow
>          the main core clock to be turned off to save power.
>=20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,sdhi-r9a09g057
> +    then:
> +      properties:
> +        renesas,sdhi-use-internal-regulator:
> +          $ref: /schemas/types.yaml#/definitions/flag
> +          description:
> +            Flag to indicate internal regulator is being used instead of=
 GPIO regulator.
> +
> +        vqmmc-regulator:
> +          type: object
> +          description: VQMMC SD regulator
> +          $ref: /schemas/regulator/regulator.yaml#
> +          unevaluatedProperties: false
> +
> +          properties:
> +            regulator-compatible:
> +              pattern: "^vqmmc-r9a09g057-regulator"
> +
> +      required:
> +        - vqmmc-regulator

Maybe we can drop required to make it optional, so that one has the
option to select between { vqmmc-regulator, gpio regulator}??

Cheers,
Biju



