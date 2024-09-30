Return-Path: <linux-renesas-soc+bounces-9196-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA0998A7C7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Sep 2024 16:52:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2BEAD28604A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Sep 2024 14:52:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59E1619258E;
	Mon, 30 Sep 2024 14:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="chjhJ4GU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011058.outbound.protection.outlook.com [52.101.125.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A80192B6D;
	Mon, 30 Sep 2024 14:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727707824; cv=fail; b=TnHuCAolJijeBmhLL1ZPOneXMIeeLmuyQ066QrQ+08zyZAhzTuBfJ+v5O7UYajpzE4cEQ/Ki3irZpIMqj6Qj+zGt47mOxsV7JiGluD0I1DHQQObDStbzZ5+uBYDcVHM9piUSYobxlQe5DdE8f8iQa2ogHMJa8a53nTF0tMO48wg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727707824; c=relaxed/simple;
	bh=FK3EJ3QRK9O/3gIiGOvZqCWABMX/ZJkRIjjjaVBdHsI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=adQ895Nfl6/ngdcrKa/gK+LodYitF+yZsxKzcn6NFAqLV+S8YLicHbKGwpK42ZbbQBnz0bkm2Q85x3PnHVCQsKeF4gG88la7cm/0HbRhXL3nb9k1bNzVRPbScToz4e9Vx7MHlPrMivxahTsBA9MLzYCD0hi81w/pziIddVDplaA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=chjhJ4GU; arc=fail smtp.client-ip=52.101.125.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tYO4UGng0pY0PSrhaRsKx8VxNBxaOr5itiBrwW70KXlwx8lzpUAcbuaIozzGTBN8fcTBp0wLwZPLWRPqmirSZfQOJ64nG2PEoXp5tmf/rocavobaWmYHTufq5/WNH5yDpmJa2Qm0EvuqxiMAo9cfxh1D0cTaBUa9zAz3I2NbQ3fHAtDReX1lmcjj3En/Dxt4RTvdkcyN97DnVm9B07E6eiWkSNlR9Z9JtxgBhFcg3SbKuLLb7N8OC6Uult+YTfm3NFexo39uYMfaltaOS4HKDuxDoCDuqZg3f5vSMcPAI2wXLbE8LHpps0VMAMKSdoogjDOlAP0ZGrAoaEujS+Yk0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gOnWG8yEhfzQP4X+uOPaIRcxKqwC8I0PfsgwQpsvHlw=;
 b=Ja74zRhuh5KYJxAFETa/tOd1sWfAy8gW918zUH/KbWomi6bi1T+G7/eV83BM4/y3+TJlYQ3BLgkBqeU2b+1nyU6Yu9O6ndf8mNf6sISOMiIS0fz0C+eFgdVHpMQ6gUI10MaJFvFqvee28AzMSt8MmXOtp7fqWSGMdHloH2bjnJzr4pRBPGXzuX0RU/0rfY+OattsWs0ll66U6oTh+pEtnktts5uZtw0zXtdhBFNEynp7v2Qi7yx+moF6OU+xCR+slQprkIa0nBk2DcbOw37IxHWI7FRyL7HFvAHlO4Zu9WSaE8r6HvZFyNWDs/8t5tMwtQFhzjcIFA3BGssdPlNyIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gOnWG8yEhfzQP4X+uOPaIRcxKqwC8I0PfsgwQpsvHlw=;
 b=chjhJ4GUQBv1BgVT8PhTcfGrW6OpRzRq5Mr1B/G8Q8Hsbob86PZn0W4w6xr6FtmVwFCh6B9xg9TztgGLVBWCiJM124AquC3zPELtQbhIELGwrYrsRZ6B8tNZi76u8FfwGd3H2J15c17v4RFAE83HdOORrhiv3cO8EOjv8InHT+U=
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com (2603:1096:400:448::7)
 by OS9PR01MB13160.jpnprd01.prod.outlook.com (2603:1096:604:30e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 14:50:17 +0000
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430]) by TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430%4]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 14:50:16 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Julia Lawall <julia.lawall@inria.fr>, Philipp Zabel
	<p.zabel@pengutronix.de>, Thomas Gleixner <tglx@linutronix.de>, Geert
 Uytterhoeven <geert+renesas@glider.be>
CC: Magnus Damm <magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 5/6] irqchip: Add RZ/V2H(P) Interrupt Control Unit (ICU)
 driver (fwd)
Thread-Topic: [PATCH 5/6] irqchip: Add RZ/V2H(P) Interrupt Control Unit (ICU)
 driver (fwd)
Thread-Index: AQHbDGYur/noZWuR8Ey6UuMzhLeAW7JwdycA
Date: Mon, 30 Sep 2024 14:50:16 +0000
Message-ID:
 <TYCPR01MB12093C0555C3C4B9D6B4E8FCCC2762@TYCPR01MB12093.jpnprd01.prod.outlook.com>
References: <alpine.DEB.2.22.394.2409212234080.3471@hadrien>
In-Reply-To: <alpine.DEB.2.22.394.2409212234080.3471@hadrien>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB12093:EE_|OS9PR01MB13160:EE_
x-ms-office365-filtering-correlation-id: e60b3ffd-389a-48f7-3fd3-08dce15f328f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?O8+PUPWnmMKedzYdmLCICqzK4MNhSMgjfAHwJVzYojBzSeHcXOhLfAySsn4p?=
 =?us-ascii?Q?LPuE4CWP6DszVtdUKi00j6JEpVfgcZ0mzsh4y90gbjHmywq64AwqAXK9hLX/?=
 =?us-ascii?Q?BNYhQX3Mz/TanBebJdmLVg8aUIB3OsFNxqdKDmuMFkqE2Eo7ElZCWC8Rz0DG?=
 =?us-ascii?Q?obFzNB5O25eQZkawSvW5pPVOYqaTvxqv7wftn2JPVhChd3oXcqP9ZdVKiv1L?=
 =?us-ascii?Q?usIk8ovED9j8x1dbS+svyBT9rGXPhBRYgEzZVSamcYHgT/YmLcL0MjcKDDRv?=
 =?us-ascii?Q?TbJhChdZ4Xe56np3l95tHXePY3LJWq/jkyZR0nz0SRohI6xcgNR7a6Zy/bpx?=
 =?us-ascii?Q?Zqky9zA+GFkZa72UHOCO1G9tYqYFZt3Kebs2hhykndTmgTHTP8QAKl4Hpqse?=
 =?us-ascii?Q?TIEKJrYxFouUNudC8IUZThxehSPcvwX5J1RaYPlChhm5fucijc6PbeCo+aBW?=
 =?us-ascii?Q?LGBBjhxQaGZY0W/nMWxs/ynN4D80p5vuleMrloluGNUMj23Cj8ZXKXa5Cpb/?=
 =?us-ascii?Q?ONYukbHqU3VPdIsKT20OHv0NV830uIL9+DUjCn62iU0TF8ZlM1L+u6OnAie/?=
 =?us-ascii?Q?7u0Aj+WRWi5WuZR9jbFd2Zq5ZZs5p+dfwZOaA8i7/JJwf6e5wyBTXNQJ9KqE?=
 =?us-ascii?Q?wreyENCOIlgxGbO9qjxxyPCpuXOLxAhyzm0Do5EoRhtU/fy9XFlfVdeim56s?=
 =?us-ascii?Q?TwmF3dhqtGC8zp9SOUQ9S0Q91ZgRCPV1x+6kw/3FbPyhfRdpA6o2r0uO94w0?=
 =?us-ascii?Q?Ad7BeLzXcQPX2qZ94FwTDuqKUiRHGQqerKfvIEUr33nm/VcfFUAIrN/I9DQ4?=
 =?us-ascii?Q?nIVAK1DZX5DzaeMkkBNIBqrDsWis0FxDSzAGHyJlskvvGgxm5MLPtdW3B20H?=
 =?us-ascii?Q?XDqJPrLsB0hibVbbSamd1KQqwLnURNR/t73gQNHejrTiAlZNapstFnC8P4yY?=
 =?us-ascii?Q?jjSz5vQ1pgMBxjQrMQUrR8QZSgXJYcf4Gyke0Dy9jXWRhfQ4v25DLP2zQmkw?=
 =?us-ascii?Q?j/PfyDLFXdhxMN9jzfpulEKaeTb98q1INjL4+XM3gNUqisZ4TKEJOucnPn/w?=
 =?us-ascii?Q?Cp3rQ72wfozLsQAEV7G7+iRQvECpaL5Gvn/WTu+/LW3QaWlwTZdykn9uR3UD?=
 =?us-ascii?Q?PcZRPStuV8+Q0FXI8C4T5fSRRiMlBmTFHD0zioetOgsIPNkO8DcYW9cdvFCO?=
 =?us-ascii?Q?27BN7i+v6uq15CiKsZCruqqgRjhYgeUkONYNVyJ5ynnipchNnipNl8YC44G+?=
 =?us-ascii?Q?9ZGksJDyGqURSpxSsIIC43gPeoFki5ytDb9okh/JRlXbWCgGujU/yLJqxgX8?=
 =?us-ascii?Q?YB4R3k9xA7971zqP8uGELfq2VfpuD0Jyel1dfUzfZU4G5W0ms9TyRwEnYRzT?=
 =?us-ascii?Q?mSelXwY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB12093.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?t2jGVydxZ4VfsqKxwTovwAXMwR4NUF1iw6A7NIScr/C2mdnr8Iil//qPy/B0?=
 =?us-ascii?Q?W3Ov616YrLiifpnWfmy5bdBbDOZRN6x/mJw3ARMNZZ9dp9IltcSh1st9ojtW?=
 =?us-ascii?Q?mO61/eCj33O59UWjLiICzfQ3ElVbv1eG3E7xTTVtDCXjSYFwalXtq2+9Fb/R?=
 =?us-ascii?Q?1JMqN7K8QeH/35K3cdzCZUDdrLpiMKnNtegoS1cray1bu2O9Vb5KckI6ly2K?=
 =?us-ascii?Q?ESmfjeI30iPdHNTXh+UyQkJ7m/UpvW0LNBu71v8O5oXfke7rkmiWkv3I78eL?=
 =?us-ascii?Q?eCMiTzho9W7FvAYj1gMyELCJHo3vbziVv3apoWUvtjceAzyavRqRnPEzD6Ax?=
 =?us-ascii?Q?gGUyzARKn3mtNN9ErOF3Z5Xan7eejzSqELq6PilFMypouQnV3dZ4griOvQvG?=
 =?us-ascii?Q?sYPrTygD9CM+2BxBjNwvNLtZ4seY81E/3QFihx9U/QGy2MUDqRmoDn+FWjjc?=
 =?us-ascii?Q?iiNAzftC/Y6XtleWOKAniVUxl8CXXe+ILwO5r+cmjFuWqGfvEW9xkZYCLDmb?=
 =?us-ascii?Q?nhURLPDpCtwDjC1ZQCqYeRRc0nwLxZwwz0Pso9pwL2K+Nnv9ZZPzESiyooaa?=
 =?us-ascii?Q?4nL0XwLbMc1EhO3++LSymphw4aOssdVskF60x2dfRbK6rgd4q7CGxwbKTQVS?=
 =?us-ascii?Q?E7g075vhC8ic7rOF6y7QMEHlL5i2SblBQbcmxrP9a7J9y1/9K7zfjVuQnCmy?=
 =?us-ascii?Q?mCR8fdX+A1PxfkfQxEgswe1x5oEZNq9wim1WrXHhuLbLeEaZ7YbbxWS6XY5L?=
 =?us-ascii?Q?Vk7XwcEToA+ZweLDzcWVbhlxNFBNgv5Gh3U3lVrJQOr5ApC5FR1R1rjrnJue?=
 =?us-ascii?Q?/4ahuacpHxz8v1bKUnav/fEWzusy2QjawK6pSbig85razNGc2hRRVz5SPNQd?=
 =?us-ascii?Q?A/2Ad2dF9S87KXoLQMLq7nyDiPgc0RuccXETgaWKJ0NkN7PeHNlAVvqXWM1j?=
 =?us-ascii?Q?lkfw/neu0legoi+LkSyqSgzMd9/wMclwFhSMnp26MAZwgPfTF12xFfXP1mYS?=
 =?us-ascii?Q?3LrIx5tW7kV6XRb6a0AS9Wpa0O7kRocZE8Ap643amBAuUnQOIcMvR83T/qwZ?=
 =?us-ascii?Q?VhUIOh55iyzuC3H6UWsUulYn51Nw+1Cetd8Lm6Htb2wOFTzZLzQho9026zoZ?=
 =?us-ascii?Q?HxXEATlzM7wVYz2q3GKLqlr4bEXjNMGKrmSpfgK9JEbhx+2vZmxq5GjUU+7Z?=
 =?us-ascii?Q?rBUIXD2pnlw2VeMIu5btAKRvNZa7BwoVE+TMVlEsRWc5GnUMEP/QJF4ZJwMn?=
 =?us-ascii?Q?VbEch126HDJ1OtODdtwgyMR6hZxy6QGNMZ+cYVWNSocgavwHR+RkQGeK96pv?=
 =?us-ascii?Q?WoVUvGxw2jgZIBMxkE+nlxuJVVy/RraCSpeiEEreeH+6uofMx7DSkpg3t6ee?=
 =?us-ascii?Q?Nz1lCTk8Oimia9nF9cXM+14vaef6AvXSr1SJUrKtlRrA5Qz1PqvM8e6Yr+8c?=
 =?us-ascii?Q?tk3jzioRK5TPctbXX7z008ndJ5yIjFLfL1Fqn+PPyjPt+nAeRD8ofkVPNELK?=
 =?us-ascii?Q?Xq053iVNwXfLjGL+tRZI8CMeJDV78bJVgj7UCyPhM5E8urvsuuod4LiOZqEh?=
 =?us-ascii?Q?kZiPr5Q0lCl6EXU/tqTa7W0OpDmsXR8MYE2DGxWxV2+qnG9MfXG8P7u8LP4s?=
 =?us-ascii?Q?wQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e60b3ffd-389a-48f7-3fd3-08dce15f328f
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2024 14:50:16.5618
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xfi/qDkTbo2UVk8ofzqqiq3uJYue1UVBmFhNeWDBeg3099Hi73kXINHFUygOYFpSIcVKnbbMDpo5+Cv/t//YuKPM6Aql3R8rUyT5Nd0kpPM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB13160

Hi Julia,

Thanks for this. I'll send a new version soon to address this.

Kind regards,
Fab

> -----Original Message-----
> From: Julia Lawall <julia.lawall@inria.fr>
> Sent: Saturday, September 21, 2024 9:38 PM
> To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>; Philipp Zabel <p.za=
bel@pengutronix.de>; Thomas
> Gleixner <tglx@linutronix.de>; Geert Uytterhoeven <geert+renesas@glider.b=
e>
> Cc: Magnus Damm <magnus.damm@gmail.com>; linux-renesas-soc@vger.kernel.or=
g; linux-
> kernel@vger.kernel.org; Chris Paterson <Chris.Paterson2@renesas.com>; Bij=
u Das
> <biju.das.jz@bp.renesas.com>; Prabhakar Mahadev Lad <prabhakar.mahadev-la=
d.rj@bp.renesas.com>
> Subject: Re: [PATCH 5/6] irqchip: Add RZ/V2H(P) Interrupt Control Unit (I=
CU) driver (fwd)
>=20
> The various returns need a put_device.
>=20
> julia
>=20
> ---------- Forwarded message ----------
> Date: Sun, 22 Sep 2024 04:23:01 +0800
> From: kernel test robot <lkp@intel.com>
> To: oe-kbuild@lists.linux.dev
> Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
> Subject: Re: [PATCH 5/6] irqchip: Add RZ/V2H(P) Interrupt Control Unit (I=
CU)
>     driver
>=20
> BCC: lkp@intel.com
> CC: oe-kbuild-all@lists.linux.dev
> In-Reply-To: <20240917173249.158920-6-fabrizio.castro.jz@renesas.com>
> References: <20240917173249.158920-6-fabrizio.castro.jz@renesas.com>
> TO: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> TO: Thomas Gleixner <tglx@linutronix.de>
> TO: Philipp Zabel <p.zabel@pengutronix.de>
> TO: Geert Uytterhoeven <geert+renesas@glider.be>
> CC: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> CC: Magnus Damm <magnus.damm@gmail.com>
> CC: linux-kernel@vger.kernel.org
> CC: linux-renesas-soc@vger.kernel.org
> CC: Chris Paterson <Chris.Paterson2@renesas.com>
> CC: Biju Das <biju.das.jz@bp.renesas.com>
> CC: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Hi Fabrizio,
>=20
> kernel test robot noticed the following build warnings:
>=20
> [auto build test WARNING on next-20240917] [cannot apply to tip/irq/core =
robh/for-next geert-renesas-
> drivers/renesas-pinctrl geert-renesas-devel/next linus/master v6.11 v6.11=
-rc7 v6.11-rc6 v6.11] [If your
> patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in ht=
tps://git-scm.com/docs/git-
> format-patch#_base_tree_information]
>=20
> url:    https://github.com/intel-lab-lkp/linux/commits/Fabrizio-Castro/dt=
-bindings-pinctrl-renesas-
> rzg2l-pinctrl-Add-interrupt-parent/20240918-013929
> base:   next-20240917
> patch link:    https://lore.kernel.org/r/20240917173249.158920-6-fabrizio=
.castro.jz%40renesas.com
> patch subject: [PATCH 5/6] irqchip: Add RZ/V2H(P) Interrupt Control Unit =
(ICU) driver
> :::::: branch date: 4 days ago
> :::::: commit date: 4 days ago
> config: nios2-randconfig-r064-20240922 (https://download.01.org/0day-
> ci/archive/20240922/202409220454.AW3A9lUC-lkp@intel.com/config)
> compiler: nios2-linux-gcc (GCC) 14.1.0
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of the same patch/commit),
> kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Julia Lawall <julia.lawall@inria.fr>
> | Closes: https://lore.kernel.org/r/202409220454.AW3A9lUC-lkp@intel.com/
>=20
> cocci warnings: (new ones prefixed by >>)
> >> drivers/irqchip/irq-renesas-rzv2h.c:452:2-8: ERROR: missing put_device=
; call of_find_device_by_node
> on line 445, but without a corresponding object release within this funct=
ion.
>    drivers/irqchip/irq-renesas-rzv2h.c:458:2-8: ERROR: missing put_device=
; call of_find_device_by_node
> on line 445, but without a corresponding object release within this funct=
ion.
>    drivers/irqchip/irq-renesas-rzv2h.c:465:2-8: ERROR: missing put_device=
; call of_find_device_by_node
> on line 445, but without a corresponding object release within this funct=
ion.
>    drivers/irqchip/irq-renesas-rzv2h.c:470:2-8: ERROR: missing put_device=
; call of_find_device_by_node
> on line 445, but without a corresponding object release within this funct=
ion.
>    drivers/irqchip/irq-renesas-rzv2h.c:475:2-8: ERROR: missing put_device=
; call of_find_device_by_node
> on line 445, but without a corresponding object release within this funct=
ion.
>    drivers/irqchip/irq-renesas-rzv2h.c:480:2-8: ERROR: missing put_device=
; call of_find_device_by_node
> on line 445, but without a corresponding object release within this funct=
ion.
>    drivers/irqchip/irq-renesas-rzv2h.c:502:1-7: ERROR: missing put_device=
; call of_find_device_by_node
> on line 445, but without a corresponding object release within this funct=
ion.
>    drivers/irqchip/irq-renesas-rzv2h.c:510:1-7: ERROR: missing put_device=
; call of_find_device_by_node
> on line 445, but without a corresponding object release within this funct=
ion.
>=20
> vim +452 drivers/irqchip/irq-renesas-rzv2h.c
>=20
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  435
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  436  static int rzv2h_icu_init=
(struct device_node *node,
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  437  				 struct device_node *=
parent)
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  438  {
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  439  	struct irq_domain *irq_d=
omain, *parent_domain;
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  440  	struct rzv2h_icu_priv *r=
zv2h_icu_data;
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  441  	struct platform_device *=
pdev;
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  442  	struct reset_control *re=
setn;
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  443  	int ret;
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  444
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17 @445  	pdev =3D of_find_device_=
by_node(node);
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  446  	if (!pdev)
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  447  		return -ENODEV;
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  448
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  449  	parent_domain =3D irq_fi=
nd_host(parent);
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  450  	if (!parent_domain) {
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  451  		dev_err(&pdev->dev, "ca=
nnot find parent
> domain\n");
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17 @452  		return -ENODEV;
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  453  	}
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  454
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  455  	rzv2h_icu_data =3D devm_=
kzalloc(&pdev->dev,
> sizeof(*rzv2h_icu_data),
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  456  				       GFP_KERNEL);
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  457  	if (!rzv2h_icu_data)
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  458  		return -ENOMEM;
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  459
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  460  	rzv2h_icu_data->irqchip =
=3D &rzv2h_icu_chip;
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  461
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  462  	rzv2h_icu_data->base =3D=
 devm_of_iomap(&pdev->dev, pdev-
> >dev.of_node, 0,
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  463  					      NULL);
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  464  	if (IS_ERR(rzv2h_icu_dat=
a->base))
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  465  		return PTR_ERR(rzv2h_ic=
u_data->base);
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  466
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  467  	ret =3D rzv2h_icu_parse_=
interrupts(rzv2h_icu_data,
> node);
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  468  	if (ret) {
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  469  		dev_err(&pdev->dev, "ca=
nnot parse interrupts:
> %d\n", ret);
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  470  		return ret;
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  471  	}
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  472
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  473  	resetn =3D devm_reset_co=
ntrol_get_exclusive(&pdev->dev,
> NULL);
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  474  	if (IS_ERR(resetn))
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  475  		return PTR_ERR(resetn);
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  476
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  477  	ret =3D reset_control_de=
assert(resetn);
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  478  	if (ret) {
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  479  		dev_err(&pdev->dev, "fa=
iled to deassert resetn
> pin, %d\n", ret);
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  480  		return ret;
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  481  	}
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  482
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  483  	pm_runtime_enable(&pdev-=
>dev);
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  484  	ret =3D pm_runtime_resum=
e_and_get(&pdev->dev);
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  485  	if (ret < 0) {
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  486  		dev_err(&pdev->dev, "pm=
_runtime_resume_and_get
> failed: %d\n",
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  487  			ret);
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  488  		goto pm_disable;
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  489  	}
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  490
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  491  	raw_spin_lock_init(&rzv2=
h_icu_data->lock);
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  492
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  493  	irq_domain =3D irq_domai=
n_add_hierarchy(parent_domain,
> 0, ICU_NUM_IRQ,
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  494  					      node,
> &rzv2h_icu_domain_ops,
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  495  					      rzv2h_icu_data=
);
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  496  	if (!irq_domain) {
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  497  		dev_err(&pdev->dev, "fa=
iled to add irq
> domain\n");
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  498  		ret =3D -ENOMEM;
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  499  		goto pm_put;
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  500  	}
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  501
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  502  	return 0;
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  503
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  504  pm_put:
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  505  	pm_runtime_put(&pdev->de=
v);
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  506  pm_disable:
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  507  	pm_runtime_disable(&pdev=
->dev);
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  508  	reset_control_assert(res=
etn);
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  509
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  510  	return ret;
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  511  }
> 34d38ea429c8e6 Fabrizio Castro 2024-09-17  512
>=20
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

