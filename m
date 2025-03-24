Return-Path: <linux-renesas-soc+bounces-14756-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C099AA6DA43
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Mar 2025 13:50:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 423D71890529
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Mar 2025 12:50:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 213DF25DCE8;
	Mon, 24 Mar 2025 12:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="IpEtoRWv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011008.outbound.protection.outlook.com [40.107.74.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880B7B674;
	Mon, 24 Mar 2025 12:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742820590; cv=fail; b=cz+V1DldQKeRBt16fsxEC4syA1N4E/g1m6WsKKDjMoMeBhcJOY4JqbwpS43/7+e8iHVxtPJ3qTR4MPaxxCrOL7OS7gruBibaaU27ZW/TAjJtZ3m3EMS8TIkh/4Fifmv94t+NgZIYNDjDDA/rVRDKmIizkpD8s7LkY47RPzOb5a8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742820590; c=relaxed/simple;
	bh=jx7bJTzDoZcQMFbIDzg8D9MdmlDgmWUyUlEszYYqM3A=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=X3izWmbyV6h+if+8CaG0+Y62O4FQEZaiyAcnFaGpJwZ/g69BAaiZJ8HmUhJJG+ZDRoJWacs5b0wOafsL2tUlh1jO4MAo32df2xgHRY+QlyoLukTQFxrv96ooH5j0ZzvNo87TfMxDYM/HP5x5mDG+MFV6+rZS1AerXqIo+gA8cZo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=IpEtoRWv; arc=fail smtp.client-ip=40.107.74.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tWW81Rv8H3MeSFTiBxFyFERFpX2TfABaODjgs9fgKPdgyoMf4QrPOPrz4b4MnkTF68igkB6YGaxYvVb6Lx2lQEaHalkEgCV3p1WXh7pCNiiWQRSsxaErPUHxSYtWL+lxrUwnFtxG7KuHkXstcA5nVM8i/uywVXCIoRV3Lcyu360LPyahD6oVCjPoR30YiRh5ayCsn4PJ7sbPXWD3Vfu18MgTtbktPFQWMGH4Z9MMpNZIlpVkysKKzYMaMvPBmzvA+Li/WDvD+mrUwHARMxhOGHlvHgVoldMAPl4E4hOi2HMXtWUO1/EsRYOPOU77SjNRvBlqgbmLZF788ylqyKTdew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BPYz6QUJkFopKYHI+bDqOue+bAL3f0gNZuFhnwxnCGw=;
 b=Z3PFn9mLVCF0tB507Ch2U4V5/JOZGDo0BI660Z9IFaJ2cXlYpCyuSmg/gGXdwI5VAzab3qOl8dte1997Nv1xOdPAkeV26VvPELxUf85MGUcmvI2slc5dAdiJZCFxaOnlh+9oj/9fCrOd+pi9tP5mTVFOiPO9gzanHynTjh+Q3gYbbuzyHDEhvfUVXrgB5wSIVZ9nVuob8JHqxn808l9JpZI0tryK3WJcn6GNM+BsyEObXnyosPZkIwyUOMDel0vnlkEPP3EyA82jlk1EeSstXlU+60UGn0afIgFs7o6u2QWJuPaaq/OCdgM9wqaXSkQSw944IHeX5OUA1w2Ofd0+8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BPYz6QUJkFopKYHI+bDqOue+bAL3f0gNZuFhnwxnCGw=;
 b=IpEtoRWvjFhNoeUQ1gv+eSuHCdsSM/qmVE4d7LCaj43m9F5/afD3yqJPBgWGVq451n9bI4N+NIW7D0ozWsHpGVRnD7vh4bACAXv9f6RVsqYHhgq+3hx+mRsrk2s3S9FWiuPwm+sMK1R2tPkWdC3yxtYxEXKAIsx8YlInYx/6Daw=
Received: from TYCPR01MB11492.jpnprd01.prod.outlook.com (2603:1096:400:37e::7)
 by OS3PR01MB9929.jpnprd01.prod.outlook.com (2603:1096:604:1ef::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 12:49:42 +0000
Received: from TYCPR01MB11492.jpnprd01.prod.outlook.com
 ([fe80::4a09:638d:4f7f:51ce]) by TYCPR01MB11492.jpnprd01.prod.outlook.com
 ([fe80::4a09:638d:4f7f:51ce%3]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 12:49:42 +0000
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
CC: "thierry.bultel@linatsea.fr" <thierry.bultel@linatsea.fr>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"geert@linux-m68k.org" <geert@linux-m68k.org>, Paul Barker
	<paul.barker.ct@bp.renesas.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-serial@vger.kernel.org"
	<linux-serial@vger.kernel.org>
Subject: RE: [PATCH v4 10/13] serial: sh-sci: Add support for RZ/T2H SCI
Thread-Topic: [PATCH v4 10/13] serial: sh-sci: Add support for RZ/T2H SCI
Thread-Index: AQHbjqwtIlj0xPSkpkSXsbf2tXVwdbOCJQYAgAAJ6tA=
Date: Mon, 24 Mar 2025 12:49:42 +0000
Message-ID:
 <TYCPR01MB114922CBDC2911E2F644BDADC8AA42@TYCPR01MB11492.jpnprd01.prod.outlook.com>
References: <20250306152451.2356762-1-thierry.bultel.yh@bp.renesas.com>
 <20250306152451.2356762-11-thierry.bultel.yh@bp.renesas.com>
 <Z-EpPL3tn54E8KG5@shikoro>
In-Reply-To: <Z-EpPL3tn54E8KG5@shikoro>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11492:EE_|OS3PR01MB9929:EE_
x-ms-office365-filtering-correlation-id: 00675e3b-d27e-41bb-6f08-08dd6ad25920
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?jX28NLfNxH1H3EGS0qYGwBw4GLpqC9gCVDduLeIWd3s8HGKxeBnhB+Y1qJyP?=
 =?us-ascii?Q?XRuPFrUUFHB6GTjXYjzdZBfJ7ZD+ZbiMkiUueHEGu0THT7wATbqV2k4YtqQp?=
 =?us-ascii?Q?C4FrATDtUWELeADD3qMWLIrG8rwj8b9KQeNL0ORzFh4GbpZvxPZ9JSyPwebD?=
 =?us-ascii?Q?DM1jkuBlRTnoKMoZYcEONtYgxruz9rq8EtS/7T9H7ngG9tfTyUeNFX6YpXVn?=
 =?us-ascii?Q?9XaLyCFO5iK7rdq0pjleDZodUpbPyQBR3HAFILEhGYG+D2q+kXPFuLVl1v1X?=
 =?us-ascii?Q?tLUOIxl8pMVQ+crblpMzoldNXJGnZ/RwggV25G/G/qxlg6PnCQsWDfc/+WHT?=
 =?us-ascii?Q?zsuBqYwOnFBkkODURBme97pg5WarsvcniZMoi4vm0ovDThO4N1AFsMn7Y3HR?=
 =?us-ascii?Q?MATzDhu5ten2qBVdrCIIe93P++pkIhZYBsrvubkmVhiAWC0uzUCiajEBHYRb?=
 =?us-ascii?Q?5+SA1uzwJJnGBD49ia3DyRYHFVuIegONgumn2x8f+QBZVi0aDHwqOw/b1RlF?=
 =?us-ascii?Q?Q1tMZ4pad/VwivyXFQvZ/PYym28UUB4/jagtCUCVWoybJWaMEkvzW9oXBUYY?=
 =?us-ascii?Q?W1c+J2YvlrqQfAPlVkHZg+XkqGVoVk+rpNUr5TJnyc5VSpd+0k5BhW78hunx?=
 =?us-ascii?Q?EuLxLptKW1xQhb+0Ok425wzLE0bjoHkYY7LNxEHiq4pkYQ3ApLxxLOGmPawf?=
 =?us-ascii?Q?EvUXTzMgtaqvmVMzpAA8ge9km0Xz0IgPWkAf+ZprEnnzI1YEURgJ7N0d2Uui?=
 =?us-ascii?Q?hYnwYwtotLaz9bNWRbH9ZbHGGkxkJ7gLt6kEWHoNfxEepS73DpVSvDtIY869?=
 =?us-ascii?Q?iJvanFxK+Xi8H93OZV8dP8D5YD/9YGX/ykWe4Q9k8/yvBGXuU1btEatvIu6S?=
 =?us-ascii?Q?ry27RmJKgda1XKLCMb7hj282xw9cpv2SVvOfNHnJd4n+QbgtRjCoUwSgCcvq?=
 =?us-ascii?Q?qDk+H3XSphmgCnroHhbDfqM2IRLdcPs/jJBYA2BXxktCpK9GWSGyqNW1u1ck?=
 =?us-ascii?Q?E96uNXdNa9vxnyQTGg77XBEN6Ozdf6/qX6bWLkJ+Sa4B6Z8PXNPC4iS8GTXA?=
 =?us-ascii?Q?ActAqeTF2p78arCj6oi3ks11Ber1B0xt3tcSqafV8n/wWUZxtnPy/MHFNDJM?=
 =?us-ascii?Q?TWSd/oeTyIujsaBZdaU57/b4kP7wBbyEfhjDvXU6fAZ35IiELVmRNxQo4JAT?=
 =?us-ascii?Q?VHqaF5JJbgUP1pTuTzMr0nnRvKNvaqa3A3QGI+8JkdYUFSqOs6ZL0d/nNUXB?=
 =?us-ascii?Q?V8e0s1Yk9ov3fDWfpS7LnQCH0eYld459FZYIiCkkEcpc2p4AoxoCWv/+LKQW?=
 =?us-ascii?Q?4mjpeM2iYZx01IlQXQkpgiDlmZcholvBon+O6Ea8DWeSKZ7W7q3AIxjL4TPW?=
 =?us-ascii?Q?W58NV/k3rq6DW5vqkW6amlEH8SqBpxR1l7etKF4RmmLTNmuk3avnEGTErQGt?=
 =?us-ascii?Q?ugk4cCc6cZ0OJLqC19FeZkVfv/XaIcIZ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11492.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?GkAJrsyIwMfr66hIDFb5lpaAnjvrCjtUzgLjNNHCkS1IaihmJb9S80NDsd8o?=
 =?us-ascii?Q?Qvp9/Q8Ig2Hvo/w8Km4bJsbtZFjLHsNj1ZkMaJOyQuJGI7c469b4ihUGIyT4?=
 =?us-ascii?Q?f7BEC+5LnAT8QXnNNufZR2m8Xz7kn68VQzhNFBZvG47W5VQohuqb85hcMvIg?=
 =?us-ascii?Q?dxSMOBnYu1rgeFqZ9Ba/7+o/8uEnFYPSgsfVC4Gd209GIPXQAlmTjcJQ0BlC?=
 =?us-ascii?Q?+bJ/ORKBlfXJA8JX201MeOMYS5DnkafzczovgPdFQFQ6NNtj0wYMCB2vkpfQ?=
 =?us-ascii?Q?YTnhtVFB292VNouTG/sg4ZVZu/KhkRxoEf15gRsb7S3fzRc5CgcbBwuZh/KD?=
 =?us-ascii?Q?WC655uD/m1HvyN/mn9hJhen/ZYlSYk4hVCrthnekSWcO7fojBdthlnIY7XuB?=
 =?us-ascii?Q?bHmv61AW2Ej7KUxWV2Qz33TMqvTnAn+acf5ypKePMlCiX/LUEEffGCt5pFir?=
 =?us-ascii?Q?+jMWzwSlOF/1GQB2S6V4ku/hLU8PXVjwOgV8zwSNjQZLsLNc92FlCmf463Zu?=
 =?us-ascii?Q?xxEUdO4I+M3FwiCbAtSbQ+uq1AV87HtdsTtfXfD/Y88V6utiO+KB/RL5nVd1?=
 =?us-ascii?Q?DTzefi+W19ExkEjJsYVKDBsVKQ3P7ssg5qqhumdFIKRfbOEnYWYPrkwdsDg0?=
 =?us-ascii?Q?nm4zmitCYGgRzyh6Zb756f46a+DEnilH0UUXoGEod0gKP6I3X0XArXo7DWMO?=
 =?us-ascii?Q?KG51IZETEFQwd0HaR1TZP09nbVQ0yATDlhutKv8CouWbaYifn0oe5uNSYmSC?=
 =?us-ascii?Q?V8ggScxgG+m4ZOPbFTrjXAszU0M5YXz2NVGBq6NkL4Cz9mjTHiKv4stFYNfx?=
 =?us-ascii?Q?kojGB8d2uGDgwyi6vIymnnq0N823Tg8GJHoptiyAnDSj+pVIAOCwI0zvmcM7?=
 =?us-ascii?Q?SkEIOuqLupRZsfHMqbMDL3Dhi+d7tV8euS2TRwSM9uBncZXEXf8gKypX4mO7?=
 =?us-ascii?Q?PK3LregKibiTTXeR88TL4uHa9iC9KgqmaWLslbDS0Y7dwoxSkz0d6Qb1HbJH?=
 =?us-ascii?Q?aQLt+K8Me1Tkp5pN9S5VUV8c/U1m3CYvW4ndlrCQbI3p9lvYxOjniG/cbwfV?=
 =?us-ascii?Q?1EAaymoonGPyv1btw3jjffKi9e/x4Mol81zj9CMtpcERdnWwdsZt+OenByWU?=
 =?us-ascii?Q?4vvJVQ5PSOrtJpbClk5xZZTSYnNic0bcy8mahQ5Ox+t5Gi3o5A59jx7RN1pz?=
 =?us-ascii?Q?BaetqIAchzG1lMWNETz3JNEvVqyDmgcWTUVUMohID+pHIh5SaBqoLB5JfyO+?=
 =?us-ascii?Q?hJu2owQgFFasdEOJud3wtByk4PugAWgpDUijxzm6SFaH1hFRix+CeQ0nwQ+z?=
 =?us-ascii?Q?q/4WzOxAc1bcG9e8n26nr5SqRgw5/NTkNBuqYF5Xlzoo9gTPImEb8Zxzkmpc?=
 =?us-ascii?Q?hGUYj+8i2II1G4Bw96pYfjMOZAyeqrdtu6MlLgjsHzfZYqy8XOzgMyZqU2qE?=
 =?us-ascii?Q?ps8sGBgdp3HlCywS5GguiPTV1uVOBQZreer9OdxOeUZo+oxmrCmnsGmQyRsl?=
 =?us-ascii?Q?S21M391/h4402fM+oG6D5l0jIz0KyUDG/TzcYdkxEEqMlQyhK5lyGA3sp5dm?=
 =?us-ascii?Q?dGyziwkr8FiKybRjzXPov7Fn1ihUi6wN9FGG0XIGKirANl25U5pdNUmWcYd0?=
 =?us-ascii?Q?zg=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11492.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00675e3b-d27e-41bb-6f08-08dd6ad25920
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2025 12:49:42.6949
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xYXVuY14O1n6UcDfzhfvh3pRleKmC2IUz7kI+eT6PlIGRGqEbj5mMndb6MRMb7ZSaaEOPJ5L/FNwFR6Vo+7RVrAfC7CkSXYIMS0tZgXvMAaojJ7BdMf+tN5BVsCjovQm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9929

Hi Wolfram,

> -----Original Message-----
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Sent: lundi 24 mars 2025 10:43
> To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> Cc: thierry.bultel@linatsea.fr; linux-renesas-soc@vger.kernel.org;
> geert@linux-m68k.org; Paul Barker <paul.barker.ct@bp.renesas.com>; linux-
> kernel@vger.kernel.org; linux-serial@vger.kernel.org
> Subject: Re: [PATCH v4 10/13] serial: sh-sci: Add support for RZ/T2H SCI
>=20
>=20
> > +config SERIAL_RZ_SCI
>=20
> I think this name is too generic. Most RZ-variants so far do not have thi=
s
> SoC. Would 'RZT2H' work or is it too narrow then?

This is too narrow, because for instance the RZ/N2H , which is very similar=
, has the same SCI

>=20
> > +	SCIx_RZT2H_SCI_REGTYPE,
>=20
> This name is better.
>=20
> >  struct plat_sci_port {
> > -	unsigned int	type;			/* SCI / SCIF / IRDA / HSCIF */
> > +	unsigned int	type;			/* SCI / SCIF / IRDA / HSCIF /
> RZSCI */
>=20
> "RZT2" in the comment as well.
>=20
> > +/* SH-SCI */
> > +#define PORT_RZSCI	124
> > +
> >  /* Generic type identifier for ports which type is not important to
> userspace. */
> >  #define PORT_GENERIC	(-1)
>=20
> Does userspace need to know this port? Can't we use PORT_GENERIC?

Userspace unlikely needs it. But unfortunately, the port type needs to be c=
hecked at a number (5) of places in the driver, so the definition is needed=
.

Thierry


