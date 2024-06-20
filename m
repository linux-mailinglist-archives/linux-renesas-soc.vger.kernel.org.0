Return-Path: <linux-renesas-soc+bounces-6526-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 741F291005F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2024 11:30:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E26791F21B16
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2024 09:30:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 836EA1A4F07;
	Thu, 20 Jun 2024 09:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="FM/+/fHv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2065.outbound.protection.outlook.com [40.107.113.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE3C15A845;
	Thu, 20 Jun 2024 09:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718875848; cv=fail; b=YqeMCVTuluhXVrT37O8NthnzXhcxNNB8yW1IBF4QYRs3XIT3ZupkbpsLP3MNmZWabiiid4CDQnlI+ewcAiZi705DudFsdzN/qCu+tTbxcIFCZMovT/BIOFOfRvt07JSCRNKrTQn0eYSANUcLQj+xfYRc2pbwt+Foj3K07EeqeA8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718875848; c=relaxed/simple;
	bh=hFBBFnvxYtRVFVcnV9+FFr5J/cS6OVLFtU6Y1uQwm9w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cSlFsqQxt/3M5ZYNwJCKwDa6uUd8YGN/dQJnmnx8u9kmJDfM0MpA4oSuyNxe5A86sG0LKIAEm1JEfToacIw0ilkP+SMj+XRPdgY/DvfzXlePiu0GQ4ZxHTiozepFxkMQ9dIh1CDZ/Y4qMBb9foYBhNGBv9+HsQnT2eaPOntXpZA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=FM/+/fHv; arc=fail smtp.client-ip=40.107.113.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gCYkOhg4Emvg1hlAtg3VygyghoQIVpg9l4WCL9XTphbMkhr7NlTmuGrwsG796XAjZwpIIRT80yGvPF13WZspENcV9IJ92g4KNTtvutNGDlDtLOQf9I/xjpzmNxH/nyt5U76ebnYoid7C5pV3OIVPNOQRFjCFeGgMkZV9j+KS7JWM1IqY/sIDLoqQVEVwOUIDPzKFT3mYrz475gPCU57mgLGGRDX7VGxZLXDMfPhU+1bZ17WQ7Dl1u1g/8Ze/FxKlZXWBfMDtqsVHIfc/9zjLHKjnQ+/R1kgG37+cndFoPgfvhjiGX6iSCzPgrNJ007XFfjFIhRvp+a6TR2eUc5hiEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hFBBFnvxYtRVFVcnV9+FFr5J/cS6OVLFtU6Y1uQwm9w=;
 b=nV3g+ZnW4jpJb9UUEdkep3W/J0+3YLuaK6qy9KtUk17DzZY39Z/LtJHL3xLHpLMCndoqPRkPlwJPIvOn4JqvjoMeAGhY7SYLQ9pjtv3BiCDKuIfwK0c/Ulya+B4BjF2dOY7vdbgfeSi8nN4jbn5DhozI/0gfZTFXuUr+sLSv+sa45uvBs/SPZce6HuyGAPhfJQY6GXRO9zpZ/z+PVgZ9bAVNS9tbEhXbwU/AmAQpNoRpkq7cR1IxO7eBdJpekxll3/Xn8yVBukW8hVrVpCYp4WoxRZ4IF5x2rm7UtTUJaklt+pWeHiGyH+TdkVUzaBo+GMK9M37jF3YMqvg4f+4nwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hFBBFnvxYtRVFVcnV9+FFr5J/cS6OVLFtU6Y1uQwm9w=;
 b=FM/+/fHv4BZ3IpDQ+B3XZhFX32t63QZjKiLUDQdvwwdmZRSehkzg9etQwm/L42Y6WObX1kCMdGPW2JPJyc8owfZgZlQEBo525mbu+6hYWeEyalfUeKhRE50BXFw7Ac7zT0iwCfJxldugRCmPgS45UIu0j+DRZ/RcJg+z5DDERD8=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB6102.jpnprd01.prod.outlook.com (2603:1096:604:d4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.21; Thu, 20 Jun
 2024 09:30:41 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.7677.030; Thu, 20 Jun 2024
 09:30:41 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, "Lad, Prabhakar"
	<prabhakar.csengg@gmail.com>
CC: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, Fabrizio Castro
	<fabrizio.castro.jz@renesas.com>, Conor Dooley <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Ulf Hansson
	<ulf.hansson@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [RFC PATCH v2 3/3] mmc: renesas_sdhi: Add support for RZ/V2H(P)
 SoC
Thread-Topic: [RFC PATCH v2 3/3] mmc: renesas_sdhi: Add support for RZ/V2H(P)
 SoC
Thread-Index: AQHavXKKlbJlYW/ECU6oeegXq/xW5LHLpnmAgAOnaACAAQFLgIAAHfcg
Date: Thu, 20 Jun 2024 09:30:41 +0000
Message-ID:
 <TY3PR01MB113467E6EF1CFC24154AF73E986C82@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240613091721.525266-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240613091721.525266-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <prdvmtsp35yy2naohivbrya3go6vh5ji2cdjoebw3ovditcujo@bhck6tca6mhj>
 <CA+V-a8u6KAFp1pox+emszjCHqvNRYrkOPpsv5XBdkAVJQMxjmA@mail.gmail.com>
 <o7tswznmyk6gxoqfqvbvzxdndvf5ggkyc54nwafypquxjlvdrv@3ncwl5i5wyy3>
In-Reply-To: <o7tswznmyk6gxoqfqvbvzxdndvf5ggkyc54nwafypquxjlvdrv@3ncwl5i5wyy3>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB6102:EE_
x-ms-office365-filtering-correlation-id: ccde3958-173b-4e70-0de5-08dc910ba72f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230037|1800799021|376011|7416011|366013|38070700015;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Nan8r1LLmfNgy7VFWzgujGDgpC3tPd+RlgKcpO5uWVn0Uxg0ZW2pILKTtW6a?=
 =?us-ascii?Q?CWpRWRMXO9KAuXHJbbLJ1srXwurNylIsiyQZwcv7oFjY3rnzrTCZ3W8A2ScS?=
 =?us-ascii?Q?ETB3goAdb/qGzGd4st/6aK6b34jx2hBNfkUtSvlpFOfM23UnsHxJvVuLdtNW?=
 =?us-ascii?Q?wJib0eogFU6hjsh1WD4MGt1h+Nj7inh83cmiIe2vrIr4mxxIvxs7BGLapiDn?=
 =?us-ascii?Q?nmkNwKo5otQxmzgdjuuxAGSvcd4qKNOg/TCFq0AqlNDh3ZcWd3bskpY/00n4?=
 =?us-ascii?Q?G1eD0c2G9nqeW/HuHkdHnsgq5Sdt8MFMsiKXV71FMtaA0NYF9EOrg3rCpPhA?=
 =?us-ascii?Q?4Xr7WIZeFjmfbR+8oGxLtoLkOhffMI5t86Ib6MK6aShUwmjdZTzqTFq/+tSL?=
 =?us-ascii?Q?CQ7+23FmXexbqqUi+cr1ZLfcgo9aS9oXm1MQdoLXLaKaUsetmZxU/6YDUFGK?=
 =?us-ascii?Q?i9IFkZGZdysd0+9majCUZ0SomMqDLsHBASkp6OLvROSIbBF7xoQO84HEbhXd?=
 =?us-ascii?Q?bl9wknkDTLEAJ7l9PoNTO5psGr7XOYy/E9VAIeXoRXdhneSN9wmpr1CWxfrk?=
 =?us-ascii?Q?9K3qWoNsf/N9amZ4UgreiNvoXSwQklV7qCkYpv+tYPHOlEHAWPrHv+iAfyNf?=
 =?us-ascii?Q?th3TqkUN+FlWg6PLXm1jLe1LUMeQl1hil/kD6lHKoPs0SAy/ZkdYKMZ8LKhH?=
 =?us-ascii?Q?92rAfc5cRzrmJLmrio1yKnH1FmH+0HPt7ObGvIZ+vuaGhqvWAQQmftv3FHxg?=
 =?us-ascii?Q?6OxcGDY+R4OwBZElGPxKsXH+VGX/y3giIZAza3kRlP39jMrySVxoOLDVo60c?=
 =?us-ascii?Q?tyPoGAOnXY/I7OWX++dezKjZw11KKjDB+bJ+UY9b1tK+b7RiSgBLlR0QuwR5?=
 =?us-ascii?Q?hoPvuPZSku/wLvradhKCknXuctYB6CIY66udnWngtFnHWEARNZUjJMbGKbUA?=
 =?us-ascii?Q?sy+ytB+BzTfvRdYPuaDxxmqeJI5IMjKrWtjiMfVrUkrWGMthEGpO3qJwTwPT?=
 =?us-ascii?Q?2kZbYvY9UM3N4XYYJeukHnM2iILH6HRnE3eYbWjwrobl+LBWp6I6nKAtB+5k?=
 =?us-ascii?Q?vmzaS14u7KZlMPQ7Yk0fDhoDOPIhhvHrWev7e6PnergD2wwP5g51ISnpwwYn?=
 =?us-ascii?Q?9h3BLO2xGcXxoESvZ8z6J/lxYvSFlgvDl/kOAGwDy/Mow2echSYbQ4TTLRmT?=
 =?us-ascii?Q?5Rk+jjf/LORrFsBrPEUtONjrjtvHpxjziJxFgX63BnMw2OCFQ8h0NkY98DYA?=
 =?us-ascii?Q?juxdoJ6WCiSir2i0QEqEcczCpzfTIdkStjiFzbURiNBKmJQ4dOmsASEEhaEx?=
 =?us-ascii?Q?Hb/EWjmjkDIKGMpZc1Nrlgjk?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(376011)(7416011)(366013)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?l/eD/L4d0TzCuMDFtti7RetS1icXQx+u0qQBdIXJemwytKz/ouLIkhAP4/J3?=
 =?us-ascii?Q?C5ajuwC5aDJrDMsBoYMx2zcOY2bHI5WxobUqghLzLigeZYA8h828WHebKGPh?=
 =?us-ascii?Q?S1HYAgxdYMw1sgXOqFvvrhVJPTiSrifP8TJ2s+kAe0PzGJvUybpk1meI+VBt?=
 =?us-ascii?Q?WYnZiNryhhKU2Zv3NQXRgAkP8NPJNHvepEFuNhMFuEeczSrKT2o0iI15uOS/?=
 =?us-ascii?Q?aOop564kFSiTs3GuzahcAOpf6FUjK2mq34vrWk6qBKckrR4YKtQZM6KHgFu9?=
 =?us-ascii?Q?SyDyVPjTWaF0jlNQTjWy5/nUaSASbYLqC+fvkuUbvJbVfY8TtAoLlpslK6ya?=
 =?us-ascii?Q?kXnUDHJHKxCEnFOo6/BApaYDU/d8TfxuLqK+SW/Ino3IWw4vwms7JiEvINgs?=
 =?us-ascii?Q?Xmuo3ZHxjI9gYLGXiwXXF68G3x/+oL7TlP+0A0ANTsWIy8o+nVlV5bwRMy6z?=
 =?us-ascii?Q?fBq++cuWmPo9Osaoiat45Ov+IbDZyacdo9sMhl+uXtkKc4lyqbZW0ndhSmpT?=
 =?us-ascii?Q?CFAk5OPX1oYG2lWfNihqEn9OQ6TploGpoMHQ204yO06hStAyABy5bn3c3YA4?=
 =?us-ascii?Q?7xQnBBoMz63u0JficlU/6xQY2E3jHQRwsdpFKLZ03Yeinbgle73p05E+QpcU?=
 =?us-ascii?Q?mPnsMs3M5z41aXbhxy/r3LblH5/oPic+qBdSYyV/AIx5XR2UMSRVwLeIjDzj?=
 =?us-ascii?Q?Ffnnxp1TG4uuhL7KQZm0qHX4I1c/iDPUqln47k8IOWR1KYmkkNPquBPZVt1J?=
 =?us-ascii?Q?wv2P93qCgUyo2mToPyNsOdW/MuGl8QhgAWWCKGHWGM1lVOSsQbIq0RULTH3/?=
 =?us-ascii?Q?1VZ2rPLxLpvt/jsQdh2CHRashjNjTwBHfgVy5Mv4xHRJBO1Sj+tw8BJBtBoF?=
 =?us-ascii?Q?0lUMqacPXtOzuEkkQezSDa/132gG+lGZq4XAVRhqrHStEFwASLPo9WnWJSVJ?=
 =?us-ascii?Q?rDDzWsaI7qzve891nAIpx6VGMuNPaciSLtuQDVBAL59HfbMDAeyvVeJDZ82g?=
 =?us-ascii?Q?zlQYC8DW+EVMsY/PaW8T2MKirFbFnng8jfNa0mklkAtvrdpPkMLCCKdU96jM?=
 =?us-ascii?Q?Rt/5oAEfTF3j3XyWEsHzJhLVkKjlT1puWPhqjaPtLsmEEBSrwM0p5Smop94m?=
 =?us-ascii?Q?Ecvz2RdAMAb2Ka5PjY48Job0NJqMndbhbLqPFwtSmGVqZNiEEIt/43yxVkVi?=
 =?us-ascii?Q?7OvYVzrYR3EUmn+8xz6V6px35uOvdHF5E1i4YHKez9iM9U1ia6fx9QPVOQq9?=
 =?us-ascii?Q?wJ/mT76Lhr7zEIr8W56WlK4k97IYmapyOrqzaT3e/VsVRyxrgdqs2yqgqkgt?=
 =?us-ascii?Q?pfDZustwXWz2OohiSurQsFI5uWnb02MtrcrS7PXffcarBU5Gz+66UzMdEBPZ?=
 =?us-ascii?Q?8X6C3hAiJkEqKjG3n+S1BXmF2CDWDqW7P4wt0WjY2KmXlELTcW0Q8d1l+8Op?=
 =?us-ascii?Q?97NWGE2bcZKkJX2wF7HD8G9Y6HZyeAPtSR7LUx1PxWIhpeapIzvmliKqs8H3?=
 =?us-ascii?Q?6s3SN8uPnLgCht+MVAFXcnsXYqHV0plaEXbCjEfQFbl35r3Ev1TQkUsQAKmg?=
 =?us-ascii?Q?D7/I8B/dlmM6cfi7QZ4h/h58EmxWPeLwE4vJVEbI?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ccde3958-173b-4e70-0de5-08dc910ba72f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2024 09:30:41.4709
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9ePS0H8LSYoKuAOMjqT5DvQGVfCMRpuH6qrEjctvhjDQRq2q4R9GtzoEMazIa5eM797xAa9g0q85H17g174tS+ZzEJV18xo8S1p/ODmDVuc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6102

Hi Wolfram, Prabhakar,

> -----Original Message-----
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Sent: Thursday, June 20, 2024 8:40 AM
> Subject: Re: [RFC PATCH v2 3/3] mmc: renesas_sdhi: Add support for RZ/V2H=
(P) SoC
>=20
> Hi Prabhakar,
>=20
> > I did give it a try with platform_driver_probe() and failed.
>=20
> Ok, thanks for trying nonetheless!
>=20
> > - Firstly I had to move the regulator node outside the SDHI node for
> > platform_driver_probe() to succeed or else it failed with -ENODEV (at
> > https://elixir.bootlin.com/linux/latest/source/drivers/base/platform.c
> > #L953)
>=20
> This makes sense to me because it is just a "regular" regulator.
>=20
> > - In Renesas SoCs we have multiple instances of SDHI, the problem
> > being for each instance we are calling platform_driver_probe(). Which
> > causes a problem as the regulator node will use the first device.
>=20
> I see... we would need a reg property to differentiate between the intern=
al regulators but that is
> already used by the parent SDHI node.
>=20
> Okay, so let's scrap that idea. However, we need to ensure that we can st=
ill have an external
> regulator. Seeing the bindings, it looks like you enable the internal reg=
ulator with the "vqmmc-
> r9a09g057-regulator"
> property? I wonder now if we can simplify this to an "use-internal-regula=
tor" property because we
> have 'compatible' already to differentiate? Needs advice from DT maintain=
ers, probably.

Why this cannot be modelled as a regular "regulator" as a child device of S=
DHI device?

See [1] and [2]

[1]
https://lore.kernel.org/linux-renesas-soc/20240616105402.45211-1-biju.das.j=
z@bp.renesas.com/

[2]
https://elixir.bootlin.com/linux/latest/source/drivers/regulator/vqmmc-ipq4=
019-regulator.c

Cheers,
Biju


