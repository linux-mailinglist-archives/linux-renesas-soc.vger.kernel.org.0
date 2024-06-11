Return-Path: <linux-renesas-soc+bounces-6036-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB7090334B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Jun 2024 09:16:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D92BD1F286DA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Jun 2024 07:16:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 262B116F8E6;
	Tue, 11 Jun 2024 07:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="a7Iy3FiU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2040.outbound.protection.outlook.com [40.107.113.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4303726AF6
	for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Jun 2024 07:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718090171; cv=fail; b=II+npJIcjRbKWaihcCLBZAoPJL4JIXcGC9U0dKID2xdm3De25ffnPK/GINcjc5E4Ue3iaZ9vSRSJE9qZvxgHllJazs0lSXe4jE5mvz1A7uMHR8dEH+MP51pLzBi6dTs5+6vRbOvN6dVLE7p9JybchxMqxcXGU6y2TZUf7M4s0eo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718090171; c=relaxed/simple;
	bh=6b0VV+3ySxqpYdzrSa3RkUnH0/0g9ahSvCwhmdCbMlk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qaZJR43VKBR9AfuS5hjdd5SLx/825hzK1F7av78Tiszjua2YzF7sCbH/Uu8t0vek2lmiGqrJkbi5+5gb59mPy6sMx6RkOQsdEl0Kj7uYFVHvWX2cbKTJZohc+Fv1QJf/0fhVndcPXWcGesVF8l8HKK7vXX6WpJmdhNVg/MXf1Ks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=a7Iy3FiU; arc=fail smtp.client-ip=40.107.113.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CdaA5KIAAslYWk19wCDzIwz/QAzfA8GuHXlPIqyGH8WsOxxT0QOUmRee3Ja1XiTJAqPUWZBCRlUjYcZrC27smeQlj/shnPO+FESaKAisPAFb4340mMkHo77zt5BRUsJBl6p6YfYMcPxobpNlfrhYOF8xd+pzzKiUu7r2j/YRSyDhCPE2BA4mSz4771Uw3C3Cx/6Qh2R1fm4x2Mo/PBL+toM7WgL+02ZWpUQVT9hijuiRpf2vi1DzM2oEEtinio49wdcUJPDDF/yYlrDCn94PRqdUWbd5RfOjPchxAsQqNRTLvYkNM89T5Szszi5TLedtFcKDuOR8lwf42voj7QFXLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6b0VV+3ySxqpYdzrSa3RkUnH0/0g9ahSvCwhmdCbMlk=;
 b=hUCKTitV4NTvQHw7MATx1etLHqVxSzrl/cceximleyBT5soU4rD5SULdJ6V3Vbz6n0BxBrDVVXzg54OvcG7GUQr4yzEH+kkVYYy1YFHNXVxeaP3iGGnWJin3SK1hDcezyXyuTVpoDl0cARAaP7poyX5XFZK1vyQaf1JWoxoqKNmTtY1BMnX/B/2XHA+TeGQHB08tDqZMfy4kFzHOtg2+Zgu9tsUthn/t4kwUXf/IrcmwPsl7Oe4NfbAxMa9v1CuebVHS5Hia9gMpTLBmIWASCKIg0RWbK0OQxAZtVxTffIv6ZV0cs/QGEggHPBLD4A79ztaoKFg6hheniolr7pbEOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6b0VV+3ySxqpYdzrSa3RkUnH0/0g9ahSvCwhmdCbMlk=;
 b=a7Iy3FiUUPz81EHaVCp7JPjHbAUx5vaKja0eWbK9ZyxGcvmOl9yFAHDfx3WIXkvKb0MTTusjuqzzrMfbPoghyOkZyHmMDmswx2AT7dTwR0aH0peohQSwBVg9sMRzphXqS82kymB+XZOKPMKHrS/fAgXxbQ86MQB4upnpYzqCLt0=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB8267.jpnprd01.prod.outlook.com (2603:1096:400:164::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Tue, 11 Jun
 2024 07:16:05 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.7633.036; Tue, 11 Jun 2024
 07:16:04 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Mark Brown <broonie@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Tuomas Tynkkynen
	<ttynkkynen@nvidia.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, kernel test robot <lkp@intel.com>
Subject: RE: [PATCH] regulator: core: Fix modpost error "regulator_get_regmap"
 undefined
Thread-Topic: [PATCH] regulator: core: Fix modpost error
 "regulator_get_regmap" undefined
Thread-Index: AQHau3As65fo15huv0yKBcHtF5jJTbHBid0AgACcn7A=
Date: Tue, 11 Jun 2024 07:16:04 +0000
Message-ID:
 <TY3PR01MB11346CF22E95F31D3226C28D686C72@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240610195532.175942-1-biju.das.jz@bp.renesas.com>
 <Zmd1arKQ1bCRKAl8@finisterre.sirena.org.uk>
In-Reply-To: <Zmd1arKQ1bCRKAl8@finisterre.sirena.org.uk>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB8267:EE_
x-ms-office365-filtering-correlation-id: 4e64bbae-45be-46c5-256e-08dc89e65b4c
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?SL5HKI7MASdu6UUWTGizkZCNBV1kqfs6xcR4caLv4SX+Qlp6Si+2rQ06i2aC?=
 =?us-ascii?Q?7HCnPoqWxHh074cdrgPSEcyxSN6ryyHl2vmJsUG+v9h+hZ0IhkKvvojpTIZe?=
 =?us-ascii?Q?QDEgqwva+xkTnNsEgYELceOOzM27DttAyS86bTUUw9SSY4/azXJqwhXLLz3U?=
 =?us-ascii?Q?S4Ms/QoYfGNnEy4zHXxera3138ZAI1i11iNdjBuKlkl3TcLova/jhLKmenS6?=
 =?us-ascii?Q?Y7VP0Oc11ZFDPUDlCWPEZMqucgcFek/QL1RjVGQxHblr67CmNfPbdrDlFMRI?=
 =?us-ascii?Q?DQI45SgSe+DiYHb8UV9jfXPMe7l6dF5rsM8YJFYxoFV99UfA//IQruEk5T06?=
 =?us-ascii?Q?CHuT3AKOC1N8Sxdyebh9A6ramszxJvOwt75ls4gY4XSWr23Sokfs0Fdlsx7E?=
 =?us-ascii?Q?EueufOoGybQoYQKrutdysbXQPfYGpsNPB1Blih8JCoVZ0b7wD+A4T9eh8jdh?=
 =?us-ascii?Q?MH4tiQsNkGUWSac7DrEXgzubELx7YRuAyT7dd8sFt5teRcQlhBIweKscmeM7?=
 =?us-ascii?Q?65cqHgMa97VP1dwqw0wxxhYqHMgtufrGaFdjScQaz9JJY4oivs5wAmjOIj/Y?=
 =?us-ascii?Q?CvvfNDcIJt8eEQ3/hk6mwkR4UiAn+5CumwgU1sMzhsdleP/t6xWic1SbIevv?=
 =?us-ascii?Q?CkXlZ/PcC20CTTZH9tqlos+NIaiG9ZFZw6lduQPhMx4t4fycaWNKCdrXMo+/?=
 =?us-ascii?Q?Gr11jmKixulIUc3i20JiF9Yj4sYvWb9oejteNUXIgDFy5ysgLAFn3dpWQevy?=
 =?us-ascii?Q?o4yx5okplAFiTkvaSbV1P4RiDFES+3rK39FihUu6oSgfILSYT1Wd2UkuaYbT?=
 =?us-ascii?Q?wuDs0jEv1toZPlNgKEfwu3thkRMMLZxszFfPf6yMGQw8s6JLk9MZpBnPaxlR?=
 =?us-ascii?Q?8wUtxi9A8JHzFD7J4si3G8oqcVdtya54yjjRtiL8Z3x5tJS0E0pm8t+JjNZP?=
 =?us-ascii?Q?Dk7Rt2c/YrNF6wJytONIasVohrw71WWm4hvaHxH8t+EAMpPmqgRc0br40OOH?=
 =?us-ascii?Q?xYMnk6ZNWtb+2Sz3LgTkpj8ygno1rGKEJlk9c4JZDcoQkesyeHUXyw0Z3DP4?=
 =?us-ascii?Q?cuJ9y6N84dVTEx3fXuNZ5lvqb7dnX17aAic5B/nhrQ6jEIZICtVTrQxBqidQ?=
 =?us-ascii?Q?Mvm5kJDElTxGtwmAVBV3Jep4QKxeHqjZI+9hXtGa16pqE6LAkFO7oMW9o/YH?=
 =?us-ascii?Q?himBqfbxLHq83V772VWrrCh5dAR2Gq8w+QvZUBlYp29XHIVYcC+yJlvj2YKZ?=
 =?us-ascii?Q?E7Dg24mQeq0kL4XIEY7C2UyyfwRU9TL+dZF4bF6BwPKLAVc6TbSgpoT4VjYq?=
 =?us-ascii?Q?c/lK4J61zq3q4zdlZOvsBo4HhSLg+mYmCihPceJs7etCziIhVa/gDQdLAQOv?=
 =?us-ascii?Q?IdbIZZ0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ugzmVdp7FiLQ+QH1uFEjk8Shf7BfBRZBy7DEQcziylQDEQo4g1jM/D3H+Jof?=
 =?us-ascii?Q?0CaWKWojf3mhlu3SeKtuSbh03uoxib7nA01wmzQU8Ef0K7ta4el0mp9Gbwh3?=
 =?us-ascii?Q?CzN93SVow3pbAW0kfj+y2PsZAL6Dz2rv9EFVNSH1c5pm4aWpEvLVkMGwS0wI?=
 =?us-ascii?Q?ZxgdSgBxJLuVdsTDSLujvP520yt/sgo+yiYe4l37PYzr/mj00qusC8m5nVeB?=
 =?us-ascii?Q?hq2wZBc0DQEx64W7/deTRVNYI6NdP+ZGnFSaMKQCFGJA3g+i6zSZpI6AhUgV?=
 =?us-ascii?Q?5NWklCdd+vitQwXhrCexeRtRnBl584eoYCL4r2JjuOxHE+1K2l9KDOiajkqT?=
 =?us-ascii?Q?4VZV+P2L18wH0g/SjOhuHai02Fw4J0yR200hiYGmMmnUUf5fXM3B8GJuIcsu?=
 =?us-ascii?Q?HMZxFFRumMLE40g3Cvnta61u2Cc7Cwb1bMiFy70GWOlFw+l/F4viNPfkXQvu?=
 =?us-ascii?Q?+Ae5goD9vkey8BJGdPTlejw7bJqDs2m3umFyKKizcSoBFdP9t2k6a9zKftO8?=
 =?us-ascii?Q?mQ86uifYsWfu8ItZUDcdeKuKTJycL4eC/O9mwT/9Xxx/50U/lzsPZscL5534?=
 =?us-ascii?Q?tTUbM2n7HMfiY3MqmfWg9UryuSqORAxiH9P4O9oDvfonUBf/5DAcaakEBNrF?=
 =?us-ascii?Q?bf4PZJBsHNQgCJZvk9LF2s0PlFsh7J+XxPElYLR7JW5Ntsfm/+sqrMTJFzIl?=
 =?us-ascii?Q?0W9XSs/hkfzPtwCT0iBfs0sBzketsIbQQlKE4PRf7ZKsCSDBoAntWo7XkpXi?=
 =?us-ascii?Q?P9GnMvYf4ATyBKlmg5pvbKh2VlBVUa1nvh5qe8pp+Z5L3YJnuZn7oOJ1lfKd?=
 =?us-ascii?Q?toQ5E55S8S323XrOqLBlmMHOa+XbXMR0ClIf1O5GW9wRhAYHRNLvyFKBOcnR?=
 =?us-ascii?Q?3kXRzI6o1uUgUULuORQVtXzbP0tExnyp9vcpWNckv5V9bpLAodwVE8xjRcmR?=
 =?us-ascii?Q?pZzdtlg+thSPQV/O6BBuOEpgJ7LOFRNXo4g0o4ExyVu/FpeCS2hP1sDkB7FX?=
 =?us-ascii?Q?tOkfc9XTjBGuPhDvypJWqFzxGFYvbCpZMFg+KPYnEwPSmXp8StBDr3NlB5is?=
 =?us-ascii?Q?Dt9D4wIMTndtSNArmLD58iWjevNEwdqapSURXg1pdwaQo892DmSCvHNeL9RZ?=
 =?us-ascii?Q?nSCn4HaPO0DPbdbp2NaqVCmNnu8dj/JiPjl5NrsaJTm+oNL8Jcx/ntZPPhYp?=
 =?us-ascii?Q?mTOgYfM8UHpkY5oc5XmOVdPYbl5KMQ5A4ZngmaHTEczwInnBEqf+D1IvDBzq?=
 =?us-ascii?Q?J2QDdcDru2Yx0wrY577BgkyaCsrEmPV2RcSABTCIiN6ND1gfwl978oUfDwGn?=
 =?us-ascii?Q?PsQ1bnWN2M2tRx5FoIljDnc0KZHeKcC7HriJCz7o8lWSVriNt6CKEYYXuNd2?=
 =?us-ascii?Q?5XgsbqXPblRYcHz1ljFgi0ec26v+zzFu4y8BAHSz+iUKkv3N3IN5YMQpUJVw?=
 =?us-ascii?Q?RkKRAN0OFAoOTZCijNA09ZtqDWw3wyohe2bXhXxLkvPozSqjq8CECaYpUMit?=
 =?us-ascii?Q?rqlllX+veTPfAyCcNZznq8FdF58YsDmnljAomtUoPLB7v8qdHGiOKn7LKuVJ?=
 =?us-ascii?Q?43UyqRkhsGJ1S6H5YbvqtHqBR1iA3GuFHna8xVPraZjl5PdXXB3UJY2Sav0i?=
 =?us-ascii?Q?IQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e64bbae-45be-46c5-256e-08dc89e65b4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2024 07:16:04.6351
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FM4g1ELcuIoUlZ8swg5ZWcHOWsWU8laOkcWmZzEiHlvwG3Og6kBAZiVS9ubYA/4RoC6W/xPxIlIn/s1OWRKboYkuUNAIh8dntV8UB+1Lm+w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8267

Hi Mark Brown,

> -----Original Message-----
> From: Mark Brown <broonie@kernel.org>
> Sent: Monday, June 10, 2024 10:52 PM
> Subject: Re: [PATCH] regulator: core: Fix modpost error "regulator_get_re=
gmap" undefined
>=20
> On Mon, Jun 10, 2024 at 08:55:32PM +0100, Biju Das wrote:
> > Fix the modpost error "regulator_get_regmap" undefined by adding
> > export symbol.
> >
> > Fixes: 04eca28cde52 ("regulator: Add helpers for low-level register
> > access")
>=20
> This is fixing the user, not the initial commit...

The user(clk/tegra/clk-dfll.c) may have builtin driver and
did not face this issue. So fixes tag not relevant to that user as well.

Will drop the fixes tag?? If we build clk-dfll as a module we will hit the =
issue.
But looks like this driver must be a builtin driver.

Cheers,
Biju

