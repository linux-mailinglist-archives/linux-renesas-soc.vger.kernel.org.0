Return-Path: <linux-renesas-soc+bounces-13742-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D9185A46567
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Feb 2025 16:48:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5020718845E3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Feb 2025 15:44:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4349F21CC66;
	Wed, 26 Feb 2025 15:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="UVr40ih4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011011.outbound.protection.outlook.com [40.107.74.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CEBCA59;
	Wed, 26 Feb 2025 15:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740584446; cv=fail; b=MAAzOtZVyBGJiVQo5tMDE4k2gmd8N0eiHtkGxRt/ycTiwT2qT0pf+lvnQDmf2ODaoa/CoKTMHSAAGSraevOisjpomjX+flQqspxaB7O76HeBLMWLXN8ttKf5cpULHxx1JOg+DjnDOnU7pxH3g6keAXIXrPtKqXPZHWKoJiatTBo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740584446; c=relaxed/simple;
	bh=gitvl257y+FrtXp+/61FYp3zQ8BmI0LYmAzGhx1Qdqc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CjfZYcgOxqgTu3dbeVumbayUKz0lP5zDsv03oQhXjGYPZW83PAAzKv2hfAjFBJAiQ3l+Sy85NrlmpjDyXreRDw3Yi2OKa3W2tyRiSWw6xIQCGAUEry3+2Pscq1sDYtVhpSPTvmcUtVt4x+mZffAL1syXx8oHz5AfhaxbPcHC6XA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=UVr40ih4; arc=fail smtp.client-ip=40.107.74.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X1e0qHvwoBnMSA3nnX0SQ+6lwC+GRvjGEftQIIk2A1/hI9OZL/UsiwIorHMTTZZinG+a4qtEFxRWtKv2CqLo4fOhTVjItOTpjCwjEPFa9K3oX0e+pl3P/NMuaaFaPPsl2X4UVPArnfswPMeoa8jwvsh4Bq2l6ngijOy+0mqEN/NZ65hrW190pyISDwB3ytpexonWtJ5sNkVUFedil/0+lnlCcci6KPdFJkNyuK+e1Yop5zWj7W61RBXX3zeMWSYWPQPMINQb4HGMxbwv/ASIQO7ZDZVWaiHAKKcEVRKB4z3Jp75FCMQYHKfINdQ126o6s0sIVpZefpxlYl8lkbZBsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fnmkez5vpcPcMm18+JURpul4E8m0oEEExh2bSTjXZ68=;
 b=IrFwoQZ0ikRGTPg7HfNywsTmeqmW/iygcgcmN+hQYESB3U3vZDW9UZDljNmi4VOT4x9h5brlZmN+3sJrrrNUdbPEU9Xt4c0B77APQDkKZWWj2F8QAsdxVKjrtCvxeaGWCtPfXXv0YZEAKldZFZ4V0nhGecbCRtXwKJuOxM0N9L/QkldsjJYcmKEaT1vafrfUFwklZ0WWnyp8GGzHCtOpQDfIQlAmDKKJVEmjoi9cxTH6sKnDHodFShGfGe0zP/61sS88dyCdUMbis3EbJJvgerKbU48jF1cyeq8PHQaOAkk5jQh99+R095bLtCxfdJNbiZ41TEEYhTQGGcEEFHO2nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fnmkez5vpcPcMm18+JURpul4E8m0oEEExh2bSTjXZ68=;
 b=UVr40ih4ftexyeWl5KziB5x/LsJUz1Hq69jINYtVEj/fH9Piio3pi8H/DJKBhWO7zTNrR5eArPQE9bQKcQwn4W8nyslV4N/A7WjM/qSVh60kP8RcGLUB2ZEhUZQOJQ/35bcFNGGYunqecf7OSJnF7awmoewh1ZP+JAI713XRxEM=
Received: from OSBPR01MB2775.jpnprd01.prod.outlook.com (2603:1096:604:13::17)
 by TYCPR01MB6207.jpnprd01.prod.outlook.com (2603:1096:400:78::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.22; Wed, 26 Feb
 2025 15:40:39 +0000
Received: from OSBPR01MB2775.jpnprd01.prod.outlook.com
 ([fe80::54f7:9a51:ae47:185b]) by OSBPR01MB2775.jpnprd01.prod.outlook.com
 ([fe80::54f7:9a51:ae47:185b%4]) with mapi id 15.20.8466.016; Wed, 26 Feb 2025
 15:40:36 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Rob Herring <robh@kernel.org>
CC: "mturquette@baylibre.com" <mturquette@baylibre.com>,
	"magnus.damm@gmail.com" <magnus.damm@gmail.com>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "rui.zhang@intel.com" <rui.zhang@intel.com>,
	"daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "sboyd@kernel.org"
	<sboyd@kernel.org>, "geert+renesas@glider.be" <geert+renesas@glider.be>,
	"lukasz.luba@arm.com" <lukasz.luba@arm.com>, "rafael@kernel.org"
	<rafael@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, Biju
 Das <biju.das.jz@bp.renesas.com>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "john.madieu@gmail.com"
	<john.madieu@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>
Subject: RE: [PATCH 3/7] dt-bindings: thermal: r9a09g047-tsu: Document the TSU
 unit
Thread-Topic: [PATCH 3/7] dt-bindings: thermal: r9a09g047-tsu: Document the
 TSU unit
Thread-Index: AQHbg6wEBHvU/a0YLUuj007LSYfAeLNQkMUAgAkvQZA=
Date: Wed, 26 Feb 2025 15:40:36 +0000
Message-ID:
 <OSBPR01MB27752329B962BAC78F341440FFC22@OSBPR01MB2775.jpnprd01.prod.outlook.com>
References: <20250220152640.49010-1-john.madieu.xa@bp.renesas.com>
 <20250220152640.49010-4-john.madieu.xa@bp.renesas.com>
 <20250220191718.GA3642117-robh@kernel.org>
In-Reply-To: <20250220191718.GA3642117-robh@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSBPR01MB2775:EE_|TYCPR01MB6207:EE_
x-ms-office365-filtering-correlation-id: ac6bb5fe-e0f3-4051-8dea-08dd567be9db
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?3oXk9TbGkB6oOLqfL1z814sf99aGeWFZGExpdUWdK/I1i/owSeiIRCLdLLgY?=
 =?us-ascii?Q?On2/nR0Mvv9FfQtwO9MDGUD1E/sXiutiX7f9fQr/HT2wxO/6eYAlyshN1Xvp?=
 =?us-ascii?Q?JNwSxrUFILE5COEKfPfKz142+z/l1kyTgoW4YlKAMcJOZH42C7G/+lJADa5X?=
 =?us-ascii?Q?40JoBx82Gw3bsl1wRoFUAwwuN6oo75hwsQnbYZT6x1Pcu3QPYSzFint3zEw0?=
 =?us-ascii?Q?1Lxz6t//MK3rF9AGjC0n/a1nRyu+y3QQDT5cPCGpkEt6reFCJsxdK7pd7uzD?=
 =?us-ascii?Q?uphqmWixbCzIBrnGV7KObp8i1/gU/Bn7WWyXX59bYn/mYDTGQL/Zeh/JjXZY?=
 =?us-ascii?Q?CbkMrIC19I551CXoKw6XEg0rFI+kRbVgn3FgArreksKRlNTgyHagPyov21EX?=
 =?us-ascii?Q?esQKrKulgWur5uB3qeZki0KyWnPR8MCJF/loQ5qkhrO1epUzKpv9CzzQGb23?=
 =?us-ascii?Q?jKcIlq5Pmix8lRpkjj/LAbZbc3+ZT70oKTNqSTWoYOhuY5CyRLfeREdWBCXY?=
 =?us-ascii?Q?u0Q6GCKoyL9hAbKTlik+6mNWPtkkzhGlNwWvrk7fFo2PpI3uZZB/kxiINSfQ?=
 =?us-ascii?Q?OxCEMzwyTchggXNfs6DrDyPwGFumM3Jo6htkabSS8HmzRfPODgy19QhcCa/U?=
 =?us-ascii?Q?WntO/RlUhNtC+uWOeTT6PzRvg7y8yJK146CpMWMnN7CqA+lTOkmQhkgv5Cq0?=
 =?us-ascii?Q?NPhPiCgHqx/2osEglx5qxPhkl4ZIn5JdJYvJoSqD4T6ayz/30MDggr4CpzeQ?=
 =?us-ascii?Q?T2vIbP8PKZIVn1Q21KXaFqe4j3TR44fryhFXpuOKzuRyx9SlSeDZK/nCRn90?=
 =?us-ascii?Q?6F9/FVSF7m78ImDPxXWclpTX9onp4tVhIB9yj2NqYwFMSguPxjRea9ap+Mpw?=
 =?us-ascii?Q?1ipnHlJAstfpuXRudrFwfz7nyQBbA6ZImgLcQsam9yw0ojJOWZ4OEJTqdzP3?=
 =?us-ascii?Q?52Mw8NPo5CxUvl00jH+Umdkl04tQSD+4hJN/P8Ob/HNTnfj4/yMOpH3NjDGT?=
 =?us-ascii?Q?G/BUu5qWWAI4qoEVOACTwhbJj1tLSeqIkm+2jD+USZJxyE9g90UbjvgR/H4I?=
 =?us-ascii?Q?50yycxxXnb+Hd/oy71M6Q+CICyz2977j0vgdG1j6DR+odscOxqT0VkiNJuVd?=
 =?us-ascii?Q?HET81lsm7O7RKAYcQmybpvIAsCWtVQCJ9uWnoxqZxxypaOx66kpjseB4WpQt?=
 =?us-ascii?Q?EfyuT8wkia9Hz+v1ER/CRGym2s6H4eWe0uko6U47yl/K8CulB0EAP8rsUaBW?=
 =?us-ascii?Q?uTpZ2PaDHByKllt/pbPQ9/QHaWyd3nZDVamodOoLzkTGvq/UvwP96Hhy5vuc?=
 =?us-ascii?Q?GIk9jdtGaszt6ne3sAIXc6a4bmAnQ56lZ4ewX2iWq3tOMlhOBBHMQ1GGNV66?=
 =?us-ascii?Q?qdNlyVRPZB1I3+NTd3r7Mw+A+GtrWLqONcj9AsSkVbgkyvafWmTSS26i/qPK?=
 =?us-ascii?Q?gzv2NC4vs+VvNMtV14IcOspV84+eUg9W?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB2775.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?1cQiZI6B1BrWsLE/7TYFQvZ9l4f9H93y6sHQVDwPkVU8rUkec0obCVL7bRin?=
 =?us-ascii?Q?+gmh4ewmomOiTEuFB9gB/aSmTCT08srT1Tx+pvrRJiaVoElwnhi4toGRXVco?=
 =?us-ascii?Q?ouFMXbU3v1H61QxDPKfmIJfJ604a5ZQ33rShFktQ7byAlB8Mw4WlcLuZtkol?=
 =?us-ascii?Q?0LyspfUKGdFyHXuTgO+fKvFRRmeE3PN7kGZgFoZLSgTYwzV13AOfWgtbasr5?=
 =?us-ascii?Q?cA3qwhkH5TA70+vtqWdLEADYpDH8bC+a6DnzGDwJ92xtV42J2NOPpOvjBhaM?=
 =?us-ascii?Q?X2vgUcIqdB7z9rsg1mK6VO0PcOhe+hDeZEZzo5yam3GRvIyNNyFuGEVNl7wa?=
 =?us-ascii?Q?UvkrpKUPm7Qd3RE4J6+OudZRF34Jq+k+LyYRWpZ1JUCp9prmf/yc3eI0nOkI?=
 =?us-ascii?Q?5zD3d0Zk/3/z0Ir5mFTGr1vc2HZWKQlkR5zUL6MnH/KT1tUhxDjnBbivJqoo?=
 =?us-ascii?Q?TcGxT4THDNGFHqKi6aD1sMsdtlozO1Fm0griZOekGati7ive0efJOSxwiUq6?=
 =?us-ascii?Q?H6llBe31ifV7d2VLZvEe4n6CIk9qX5NMQi2LRVEiXG1aloCr1UMlwnOQoG4k?=
 =?us-ascii?Q?H5oZpQZYUlxJGyBJGX8vOy3zs6+OiYsV8IuP+NF3TP9vLv7cZEigNGAxuPeZ?=
 =?us-ascii?Q?+WpA9sgyxPWY5izzPuvn94wruyBih+WPT6cHoJvtSkA1jHHTcQ866YwQfLxg?=
 =?us-ascii?Q?tcl41/2P7Gy9zp3kpRrrXBzXmzgSRHy3LfACiDMznRNFezkIKBGhyjYHOHJM?=
 =?us-ascii?Q?zjs9IFPGaHx769qkrsmawpcOCRG/mE04vPwWznGc3r17yv3A2tpfZm4zDuTX?=
 =?us-ascii?Q?pnMX4Tz89V5jQljvJevNsdmDzNoaKBMQAuBuLSWs2xIzG2gUmz8qF3lX9PNF?=
 =?us-ascii?Q?mpa0qZzLXq/ai3j0ByDpeqfwTm353erco87PJpEGtmHREnTizkjjI01Z2R+I?=
 =?us-ascii?Q?bz7gjU+4Upu1DAnFZph9xs35OWc2TDTB9gvhPt0A4z+p6yoIG7d6Bi0F0xyG?=
 =?us-ascii?Q?GcSFnfx0pHN5UiYgyeZlMRZ1ampZQFkVusCVmRRaqxgaVC+c5U9EOHw3ZAO3?=
 =?us-ascii?Q?yCA1g7YaA1cNN4JduqHYBxqsU589GyP1Z+rtvvHrTk0HM4loWBIplWdFIKal?=
 =?us-ascii?Q?bSyVHRsIKge8CeUovuR4HedUI3EWQxmsyMyJq5qLLqAuqOSszAPnuCCFkR0z?=
 =?us-ascii?Q?4mPgkAZgC/eexC4nKaNU+6ztuIin0+yeu8qEpUK+q0LymBgbQCKTYqlwz0iw?=
 =?us-ascii?Q?5xEU7sKkFwPKHwgxnJi0JyZ2m5dRjwl1E1FeHMAlEp5DxL7fqyCmhlL6IgrG?=
 =?us-ascii?Q?KckRx4MNzogXVdJNCVqMrRzOyvrgs/eJXu0i7nH3PWe/OQnYnPrdm1ExbOhm?=
 =?us-ascii?Q?APu7E2ma9Ml0R9HMReuGgtTk1YXBMzEZVo6RASOdc+3Z+c6ONb/FmIYevt2+?=
 =?us-ascii?Q?P7yYRJWzF7AWxIeSAl8CaeD8lT07MCdqEzC6biHN0oYEWVOPa4H7sS9gGR/S?=
 =?us-ascii?Q?50ncFfBoJUueYbFaZoSXsUEmkgySXo10ilZVXu06ZoLXQSJjAdMg4cdfZ2ZT?=
 =?us-ascii?Q?Piqlp9hR5e0rQuAw2SPsJcFr/X2SSUK+kFk7My/nvisFF8hchS67jiLR/oOZ?=
 =?us-ascii?Q?Hw=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB2775.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac6bb5fe-e0f3-4051-8dea-08dd567be9db
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2025 15:40:36.0701
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VjZmssV5lcbjovK0jjZPWrxtC6HZ3fFYrztga8CW34VvfMZsEnRuMXSeETnGuHwAK25c/Squa2qxKk6lANhaqp3wrqB50Nc9duAr74xnd+Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6207

Hi Rob,

Thanks for your review.

> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: Thursday, February 20, 2025 8:17 PM
> Subject: Re: [PATCH 3/7] dt-bindings: thermal: r9a09g047-tsu: Document th=
e
> TSU unit
>=20
> On Thu, Feb 20, 2025 at 04:26:08PM +0100, John Madieu wrote:
> > The Renesas RZ/G3E SoC includes a Thermal Sensor Unit (TSU) block
> > designed to measure the junction temperature. The device provides
> > real-time temperature measurements for thermal management, utilizing a
> > single dedicated channel (channel 1) for temperature sensing.
> >
> > Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> > ---
> >  .../thermal/renesas,r9a09g047-tsu.yaml        | 123 ++++++++++++++++++
> >  1 file changed, 123 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/thermal/renesas,r9a09g047-tsu.yaml
> >
> > diff --git
> > a/Documentation/devicetree/bindings/thermal/renesas,r9a09g047-tsu.yaml
> > b/Documentation/devicetree/bindings/thermal/renesas,r9a09g047-tsu.yaml
> > new file mode 100644
> > index 000000000000..dbd3860a31d0
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/thermal/renesas,r9a09g047-tsu.
> > +++ yaml
> > @@ -0,0 +1,123 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > +---
> > +title: Renesas RZ/G3E Temperature Sensor Unit (TSU)
> > +
> > +maintainers:
> > +  - John Madieu <john.madieu.xa@bp.renesas.com>
> > +
> > +description: |
>=20
> Don't need '|' if there is no formatting to preserve.

Got it, Thanks! Will remove it in v2 since there is no
special formatting requirement here.

>=20
> > +  The Temperature Sensor Unit (TSU) is an integrated thermal sensor
> > + that monitors
>=20
> Wrap lines at <80 char.

Will do in v2.

>=20
> > +  the chip temperature on the Renesas RZ/G3E SoC. The TSU provides
> > + real-time  temperature measurements for thermal management.
> > +
> > +properties:
> > +  compatible:
> > +    const: renesas,r9a09g047-tsu
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  resets:
> > +    maxItems: 1
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    description: |
> > +      Interrupt specifiers for the TSU:
> > +      - S12TSUADI1: Conversion complete interrupt signal (pulse)
> > +      - S12TSUADCMPI1: Comparison result interrupt signal (level)
> > +
> > +  interrupt-names:
> > +    items:
> > +      - const: S12TSUADI1
> > +      - const: S12TSUADCMPI1
>=20
> Odd names for the interrupts... 'S12TSUAD' is the same for both, so that
> part is redundant from my perspective. I guess if these strings are
> meaningful for anyone familiar with this h/w, then it's fine.

These names come from HW manual. I can change them into "conv"
(for conversion complete irq)  and "cmp" (for comparison
complete irq). What do you think ?

>=20
> > +
> > +  "#thermal-sensor-cells":
> > +    const: 0
> > +
> > +  renesas,tsu-calibration-sys:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: |
> > +      Phandle to the system controller (sys) that contains the TSU
> > +      calibration values used for temperature calculations.
> > +
       sensor_crit: sensor-crit {
> > +                    temperature =3D <120000>;
> > +                    hysteresis =3D <1000>;
> > +                    type =3D "critical";
> > +                };
> > +            };
> > +        };
> > +    };

Cheers,
John!

> > --
> > 2.25.1
> >

