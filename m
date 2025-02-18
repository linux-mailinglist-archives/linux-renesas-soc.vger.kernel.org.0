Return-Path: <linux-renesas-soc+bounces-13302-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AB4A3AB7D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Feb 2025 23:10:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4FA501897EA1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Feb 2025 22:11:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6460F1D5AC3;
	Tue, 18 Feb 2025 22:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="LH2CtUs1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011047.outbound.protection.outlook.com [40.107.74.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169921D5CE3;
	Tue, 18 Feb 2025 22:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739916652; cv=fail; b=TJLVDMQT+nyk0W2P/2vSzofDBcMr+aBLqlw6zfijLiQ75NOamloBPdS17/ErayHf8gYlZmQKZmgDBdXfYnbpgCDNmXlv/GOdGuqN6bLZO7rBUa9b9Q4Qr4p5Yif84/wVOSQLOuYUa+PeIcNhcLy2tkpAwasml8cIxuCpnRhzDu4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739916652; c=relaxed/simple;
	bh=Jb/bNEFQYSxuPiNCwuJM5O88XpwiANeKkWe4+oWVBsk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dlnu6r6rPDT9ODFnm5B2bnzhSBajueGiaAZBYqNVcj6dgntQwfPkZa0VmQGRolmEduE6kLrzJPZ+0l5CDwFQmCQna6aA1lg9+buYwnUGMKlGdskvHNK3IYxPKmzhMcUTfRs0EP3gBtoXztrCW7/Vap4txXfkzyWUhvNVJY/aJh4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=LH2CtUs1; arc=fail smtp.client-ip=40.107.74.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qWsl51HaFG1zh49t94YCFxoYMNwt1nNbrHzcgHU/m6NuWxWnoaYzpGJ+zk2IV/ZbAeWNM9bh4bIPw+8kZgpMheTYP9JPtcWbmMg1eyabDN1zNUd5vZtXadZ/Q1RvYMSolovFbwySDrZJdTGctVBhTeBbbPXwYEqS+3CFwp9Uv1qhzKDO1GL80ewMnD4dpcEan95ayS8qKfm6ZJIxxSNa3SrXXyQiNAAJXHjp8QOn31nLhWeTnuHr2CycxgAfkhJdWLtk6PfZDjuY/szdm6rSqewDQ7bNnHIdfCo0+FCofxIaERA4+wR0HmTwjdoAiaQL1JRDNiSq+5mZ5UYJ7ENk/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8lZ6dd5HWUH2y5ZHBKxo9Z2WPGgS2jp9escCwV7BXHU=;
 b=b4acl1/sgOZdwBcOLWJHA8bPra7EY2R3Ppj2Gs8ZOqJPzKL0554bnHbkzfqFpXur+Ql0/jfvfdeiFk5Z73KG01SspiSWMg7ycyEDCKwJpO8lueikF9q/8IeJcvme9toHKNzeTHpPTcx5hSmAfzBo8JuF41j/0oogpG2M2+hoOtgVovCOWyz8lACrcFhZTXO77saIAvAvvGZsOET1wEGaumAu5JdXYMugHXHqtx+xCVBT7dogky7TqsU45tUm4YLeDEmH22WQomllZMu5+SbJTYL3fN0grF7+r+pff9tZjvZ2Dit4WoLNkNgAW1oXWeu39WVsaPlfz27geThMPRhB9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8lZ6dd5HWUH2y5ZHBKxo9Z2WPGgS2jp9escCwV7BXHU=;
 b=LH2CtUs1ho4uECpXTDqeEUm0eLzz5dhCgWUUZzJ1Ck8D+1rTtWzrzK9HuMa1wxjvIH0hElUJ0eDKjeSPG62EIvAA6PHpyOiG2cBueit0+AfqgRK+t2xss0pE10BxPdrNUGJ14DHZdowy0byYbXfFAr5Wf6H/pIFyaLdxQIQou40=
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com (2603:1096:400:448::7)
 by TY3PR01MB11408.jpnprd01.prod.outlook.com (2603:1096:400:40c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Tue, 18 Feb
 2025 22:10:45 +0000
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430]) by TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430%6]) with mapi id 15.20.8466.013; Tue, 18 Feb 2025
 22:10:45 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>, Geert Uytterhoeven
	<geert+renesas@glider.be>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Biju Das
	<biju.das.jz@bp.renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 4/7] irqchip/renesas-rzv2h: Add
 rzv2h_icu_register_dma_req_ack
Thread-Topic: [PATCH v2 4/7] irqchip/renesas-rzv2h: Add
 rzv2h_icu_register_dma_req_ack
Thread-Index: AQHbfZtY0L16SYJMfEy7986fRa30+7NMuxMAgADtXLA=
Date: Tue, 18 Feb 2025 22:10:45 +0000
Message-ID:
 <TYCPR01MB12093F3EB265A8C315799DAC4C2FA2@TYCPR01MB12093.jpnprd01.prod.outlook.com>
References: <20250212221305.431716-1-fabrizio.castro.jz@renesas.com>
 <20250212221305.431716-5-fabrizio.castro.jz@renesas.com>
 <87a5ajk7hr.ffs@tglx>
In-Reply-To: <87a5ajk7hr.ffs@tglx>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB12093:EE_|TY3PR01MB11408:EE_
x-ms-office365-filtering-correlation-id: 5ef44626-a1de-4fb7-77bd-08dd506917c0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?XxNS7S+lQHL9/MFGeePyuWuIU2to2Zl6AUFpTjdGz+F1Kdst51IhE1ljGWxv?=
 =?us-ascii?Q?7pkVoaoKgtyPp2viHie8jt7omAMSXp1doU5wnnCDkuUF0K7Gq35AO4f8VUC+?=
 =?us-ascii?Q?OwoFp7z7LhA0gAzYa//uyxsf/1TsZMPMolKJEL0fM3toGSzTJ8ZD3AlC3hIU?=
 =?us-ascii?Q?KUkY2gRkNO1DHUH/XOGK6j58d56wTDXpN7rG798j1dQ8KlYnkbaok4IMR+95?=
 =?us-ascii?Q?3uLIRlQOWbkM11Z7Sdhizh9/VYhWl32A2N9mJt5VomBSty1YhfIvLWHFVhxO?=
 =?us-ascii?Q?oXFkh1kWEHou7UyvBHlNHKNBEz7MqQfvkRjlrOO7RgUrmvw19s6nFBCqkj/J?=
 =?us-ascii?Q?YXeImdFNfmT0YDC0ufxfq2kKfNedI2vlAOw1oKLnPa+txeaWeOZM2+U4Ng/C?=
 =?us-ascii?Q?mrbk7D4Kub5Ov8PEzi7bKUp5Lg+mEMHo+18fBD3TTXyBRJISOxz6meAmxrzs?=
 =?us-ascii?Q?kKN0qQoSxwbjaGABnpQtCudQ4jQVzVccJQj+OplbuuHtISA+CQSLpkPnFTGU?=
 =?us-ascii?Q?cW2dFpSP5wMdNhScN/zvYsJMBbLsum6LWuwlbuSU8xW/c/MwxeNA1MGgbln1?=
 =?us-ascii?Q?jzk9OL6rPa8zHCwCgZnoMgr5EVBFJtZgy/Tj5aovpgBVg5cz26Vwh5kI8dsZ?=
 =?us-ascii?Q?Ne4XJ5DYo4ZnahfkKxPJjAm729uaav9OvjhrMoamMTWqtsAMzkWQfumAPZXx?=
 =?us-ascii?Q?dPms6UC9R9/o9p2/92rjlDU4LlSLLd8uZ7pmJwLI45euFskx0l98s14D/jk2?=
 =?us-ascii?Q?50VTNNvLYgnhwVHmQy1PY8AP0K+x70nB+p92GCdWEJCnp6Ada9h3UbW6cr5r?=
 =?us-ascii?Q?vA8MGTErbeDpErCRL+nSu1RYK/ACIN4/eKflydc4Qcs3tNKAqJR8XPpUuFry?=
 =?us-ascii?Q?LtyXdubHOCkNplQ2SeAmoaUOIJ5jVKYsKEZfVQ46wSiX266uOJppaHtUVRL3?=
 =?us-ascii?Q?ByLDNJrsNS/0AjaCx36U7grNIZHZdA7O+Fb7lP8Aj6MxERCQH84UgfLyY2t0?=
 =?us-ascii?Q?bRL7LwC+JXu4aa06PoGElxmQPHqx6BtG7q/w6qzuDOZsN66LxhDjGcHVAYxa?=
 =?us-ascii?Q?d4BPScw4NG7k6OrxyU7nd64eLfjGdfNHRPpMuMmP+RjkWwYBl24s9FeIipDr?=
 =?us-ascii?Q?5569yHf3uWzguQNDTwmv4ZZ5AoUc7nwCpqWP0lON26T1OL71g01u0p47XPL6?=
 =?us-ascii?Q?U8CdRSGs4qXKxT5ZhOAh8QXinEknZANlOJQk+sKOBjoNWFWD9uPrSefe0OHv?=
 =?us-ascii?Q?+b3TAkF00D75ctJGiaNBv9SsunhLxDPH2/gzD9j3ucnoZUiSBrpyfdmuSpsG?=
 =?us-ascii?Q?dQsdGfRcN6vZKNTmFZVSgHlv4y6ia+TJBy8mzlFcHuCpduH07brGlIkZrvXa?=
 =?us-ascii?Q?gpTfZbj+8ND72A2/bnkt0KBR7Ot0d4nbvX0VcgFj/ar2P+K9qA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB12093.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?QZn3BkcmJzs66yTvxe0ZS+fUU78TB1ezxXfOspb74FXx8qBf51Q+3VRpZAkB?=
 =?us-ascii?Q?h1DVwopc3YHzPVYlC+Gfd8rknCYVeOARBlrp5nLm8Q015vOUYBeZ4ZpXyntG?=
 =?us-ascii?Q?OY3jZmEdARNouLYd8lVzdg+h2wTMC4YgHxvsqACg1gXxKeUMlAemvq4gMLUM?=
 =?us-ascii?Q?zndlQVl8bfP47WGDmnQoJ/FskhEaPzu2UEUcNRl8ZqW1yTYcU0HMppeAWtkL?=
 =?us-ascii?Q?HGxA4HTVaGuy5vOucrVdSNShhg/Jfxiiox6KBwfXIySFfKcnjTvZijHJmfND?=
 =?us-ascii?Q?VezhvZATIJHnTnnlS6Ed6vv/fm7gQlLG7UCxvWfboQSeBYK1OZCbKAE4jzWU?=
 =?us-ascii?Q?yfUS0OpEBtrwIlWBNeQkrvcdZ2d2i9KM1cU5kRqiUhXpEQrL2Mw5DTfNJ7hP?=
 =?us-ascii?Q?w/gUK+gTmu8GfT1M1DzO/doM+d25Zi9TJb0JaTquZNgQDNCkJHwKYZKH61Mv?=
 =?us-ascii?Q?shBbS2qoW9wFbzBRolWf5TL+mF7+2BgiRkXq+bpPdxMPXQhrBOvD6LLXfwmt?=
 =?us-ascii?Q?zhXG0GVyF5Noanbp37HssHiyzsH+lS2C7Ha9pNvvRBo+Hh5nkxtwq2LpcDF9?=
 =?us-ascii?Q?JwZ/yRBEMdGMNpQiC67FAGCsG1ffVG/DIHOagON+S/ZdEj6wtdXnyLMB9kX/?=
 =?us-ascii?Q?OS3Jasf8Xfs8kFYNA6k/F8eu782/CtbAfgHhpWeKFct8jnlPBRXcIUJ+eyYj?=
 =?us-ascii?Q?x2WI/+/iptJI/Ma903G2b3L90Jgx0lzaeb6hULHBoy0AFA33HhTLb1REmt9p?=
 =?us-ascii?Q?FlBo53TxwbWQ3JphUk6v8tz06g90gzi+L72mk5AMJxM7OX1+ZuKKzKj1slvH?=
 =?us-ascii?Q?C55Lzo+nRf3554/xHZRpKPdxSs8DpIvfolhtiZgooJ+MpRksGxmiUrvstltM?=
 =?us-ascii?Q?7w0lpVYxyNFZuEProRQ38gU7ldCPzMIpkp5Ta0csntTKZj3ipF12UN0BRqw5?=
 =?us-ascii?Q?St0VgN9ats4KRZacDmEQCHTFMoyw9bP6/aj9gplSNTren+UC6y9Z6Ga144eX?=
 =?us-ascii?Q?GZ5P7p3PQSb9ghDdT4yV/oWlmW/4wtUnCwBsz9C5W50QalUh1XnuT4y0mwZy?=
 =?us-ascii?Q?tKv7LebB3JEGc1bqq7UI7saOOEKv+w8+g95cg8o49X6S+P9z7rF7WuWLBP3+?=
 =?us-ascii?Q?jhw5Vx2CbZcKkP67zeAkWy1LdJHIxOoLbZ1t0aLIA3m5sSw0l9aTX03/nlOv?=
 =?us-ascii?Q?wyH8s3Tf2kF7a7omAPVjezzAtz+FgxMgedi0HWaaowPZeBAktG8N2ORKQBtQ?=
 =?us-ascii?Q?uR/eJo9iaDld2jwGMDGJDTCq+VEnw37WQ5/MW8xTC0RmiNYivT9ewEZouFjV?=
 =?us-ascii?Q?I4+A4tiAzYTvvdzrtF8Wl5rQwZEPnV3nktIXr+xtFPtAbNptMo+yuvun6hfV?=
 =?us-ascii?Q?8BH/T+Rsl6HCyDc7i4xFPHjClFDy1Y67NYZf+Ys2e+4ArVwOhfZ+/L4xwEPv?=
 =?us-ascii?Q?DgNUMdQRhqx0nmCOPtojBkK1esewI9n+WNQcPOeN2rxputs05C/XLzK5lFsr?=
 =?us-ascii?Q?YTeJqP8ztglcghkp8kOrRj5s5JT+xv1RkkCkZWrV0xQ79/fyJcTf9614/nPl?=
 =?us-ascii?Q?P3Agp4DyVtg4r29IsKnZ66TAddMkd/MsWBFUg5DtrMwr9koGF701VX5sPimb?=
 =?us-ascii?Q?OQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ef44626-a1de-4fb7-77bd-08dd506917c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2025 22:10:45.6171
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PWFQzTptndVBupFoh3cfdJCN7/NU25pHL91MgVJEmu/6HNJfY9IyJ+n6ABLU50tjW21CjNeYHizwTW6ZqABcg0ZCMFX+EbaGNileLv8czIA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11408

Hi Thomas,

Thanks for your feedback!

> From: Thomas Gleixner <tglx@linutronix.de>
> Sent: 18 February 2025 08:00
> Subject: Re: [PATCH v2 4/7] irqchip/renesas-rzv2h: Add rzv2h_icu_register=
_dma_req_ack
>=20
> On Wed, Feb 12 2025 at 22:13, Fabrizio Castro wrote:
> > On the Renesas RZ/V2H(P) family of SoCs, DMAC IPs are connected
> > to the Interrupt Control Unit (ICU).
> > For DMA transfers, a request number and an ack number must be
> > registered with the ICU, which means that the DMAC driver has
> > to be able to instruct the ICU driver with the registration of
> > such ids.
> >
> > Export rzv2h_icu_register_dma_req_ack so that the DMA driver
> > can register both ids in one go.
>=20
> Please denote functions in the subject and change log body as fun()
> according to documentation:

Thanks for pointing this out. I'll address it in the next version.

Cheers,
Fab

>=20
> https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#functi=
on-references-in-changelogs
>=20
> With that fixed:
>=20
> Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
>=20
> under the assumption that this will be merged via the dmaengine tree.
>=20
> Thanks,
>=20
>         tglx

