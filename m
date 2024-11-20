Return-Path: <linux-renesas-soc+bounces-10623-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4599D3681
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Nov 2024 10:11:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 57269B234A4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Nov 2024 09:11:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 161AC19C552;
	Wed, 20 Nov 2024 09:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="JehdNLgA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011000.outbound.protection.outlook.com [52.101.125.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098BC149C42;
	Wed, 20 Nov 2024 09:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732093840; cv=fail; b=JUEQzOCI74piBXdhkhIZPoy7ttcAPFnHomNErPhV1Gnmadh9EYt5q6VC955M9K4nykNWsdoZCovMxiv0qivGoHxH7pfj53co/Nb1FsnVwK8DljPltnJQNQiWqFVVvgv0RsG4X2jhwOLn5T7NlZwKNBu3tYfYxtbcK75GXIBDZmc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732093840; c=relaxed/simple;
	bh=SCHreTf33MgoGVNLwKivWuE0mR9gYvnkhl0hQCsbjjg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=l3qD2GsfCTRT0jE7rp6JKX21BUASmLOdtM97ZciVymGCAC2PZT1FsNdmmut6ixfY1x8f8TKREIHNvrsvQ8f4E6U6xIiOdkLF6jK7clRGdNS0k5NwMp6FeWHdxmrMcuYiKHdoZonR/AbizjYcfDaC4vgtRjtsiVW51xR3CzaZqq4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=JehdNLgA; arc=fail smtp.client-ip=52.101.125.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BQktGM/E4xq93oiKimzrDyDtFUxwtIGfNCge1UcfuSoy6/E5WEiiYauExzx8a3IArMlHmg8w7rJU8E4RXv3rA3j+VdBd6ptCowrqRHN9HFJze8cIk8PHqpKN0ys+PNblm0zZopT6ugtNBBZhS960kN6+HL4zA3QXA79uVMqrQ3B3zn5S/ln9jsUvgJzc8okdCrgI1kD52XORkNYH8yhAylbePdA0R315EXg6GWtM6tKNZ3gK01XMFMCa+EtVEcLI0rEbXTtku+JvDbckmNb8xeUqzn0NRiM6gZVoEUFwo0A3RXnmjEyatuzjni6h+fbStQEGCBaxozLO48AdvlcTDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3FY0wwI0y+Ej2DbsCXaTc6lw8c7PDLVWrGGfTlDQD0Y=;
 b=lW7wmJTiTe832RbajeSjB2qN6Zl/jJncylr47c7Gk8hnBt5L4I1SCjOHbr2P2U3/UkL353EwuumCDXgdDrTG0iQxoRrSJj7+KXdKXZOffgLxMPgx4Q2h/ZQMTzGYAh++CHQI01sUcOwZsVOvplaLWmoP/Y135KJblOYZitkSid3zVsamomknj1OqIyhw+d8BMpZX5kDeAmFINxcz0ak5921oNHLFGAU8lAbzS0zfTN11qvtnI0HZWDJHmbyxXTnVwcj0JGGKsR2/c/LRpMNVB+r3FziwQgA72E7xKBnib9lCs2aYLx1rwKLeEwia10GGundsXmIwszD9gW/jfcPxng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3FY0wwI0y+Ej2DbsCXaTc6lw8c7PDLVWrGGfTlDQD0Y=;
 b=JehdNLgA7MU/5fRYQznE5YJxBx7sKI7ewlR9JlWdNEBiptqQxFPvZZANxYS6k+5Roc5xVeVL5wwTQco7TZWTqVuzDyFtMtFykmGB6iPBnTl1KrlZThEFZUIvAoIi1uilp38Sp5yqT9gQbiyQSHiWgYBUHCCcsOui0dJc4ge3EpQ=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB11886.jpnprd01.prod.outlook.com (2603:1096:400:38c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Wed, 20 Nov
 2024 09:10:31 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8182.014; Wed, 20 Nov 2024
 09:10:31 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
	<magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH] arm64: dts: renesas: rzg3s-smarc: Enable I2C1 and
 connected power monitor
Thread-Topic: [PATCH] arm64: dts: renesas: rzg3s-smarc: Enable I2C1 and
 connected power monitor
Thread-Index: AQHbOynE5I/7Ggv7pUOLkDSF2escDLK/4UAA
Date: Wed, 20 Nov 2024 09:10:31 +0000
Message-ID:
 <TY3PR01MB11346DB1A6D857AFD968DA9FB86212@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241120085345.24638-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20241120085345.24638-2-wsa+renesas@sang-engineering.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB11886:EE_
x-ms-office365-filtering-correlation-id: 09b6cc32-46d1-4da7-93a9-08dd09432ee7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?SQ3ForKW5gDgAIpKEXHvj2JRMd7gn3nRJP00+8FH/cIQKBxk2pxCmX6lQ+33?=
 =?us-ascii?Q?v701DFoG/lnYF/Jglx4WoC3d0aW4XtlNAnO5wRosiYT2kGut0SknxVnGWQe8?=
 =?us-ascii?Q?gUOS6ie7Vlkzo+03EzLsHsUQxl1VazQE+oyIfl971cj5hIssL3zzwYrFlPsm?=
 =?us-ascii?Q?bgU6QjSms6pUy3Ng3rNjt8B7QkgW/7RFa0id/rN3xl0xg9tFRZcdiMJm5tkK?=
 =?us-ascii?Q?WVryHbT0cEBXDQjqty7GKVrV5Cdfk6Fc1upl6410jJitOFWDOrxbyf5cpnXM?=
 =?us-ascii?Q?m6sd8WK2a8WAuMR/UIJ0oos3PfxOVKCjMeH+LMxZ/hxJTe0dQGh8Avplf48N?=
 =?us-ascii?Q?KzvkBrYdLaa5S1FB58HcD9y27gLpqe6F+HyUBJNoxrHC+ia/hBV4JGkCkBdv?=
 =?us-ascii?Q?qPzVlsdYNWykv7LoQVIqMDKTpbmN7rQ97bY7Jii2dh64vboXWd18e3mXkCAe?=
 =?us-ascii?Q?Q1RGZI53/2+hGfac9iH1D6jfwuWW+5SjsPizVcxHDzAGPJKg2m1MpZF2/Jn4?=
 =?us-ascii?Q?X3qTdOCvABIDADF9sGHMf90rebMs3iyszMZh2jpx4NN2X4TV0kxawcYRhX3U?=
 =?us-ascii?Q?a8DaF+EPoz0ZcV5uKKFZzowcMrZHNi1KFqzq8MrKWbt+c7IodAZeJs5v8NS4?=
 =?us-ascii?Q?LQLsHSyC+i74Ll8kV3z00RPf9W6sxLtv2zSHsoIoY14NIAkv/FstG2KhrHI0?=
 =?us-ascii?Q?QMLMoYeEpNSVIl8+qF7t1iNpDdzwd7HsoijYHEU4uVUoe3VWkEp2vg0UNmG0?=
 =?us-ascii?Q?0tzIizGVS9wEsMrtaFcYrOatbnhODW0TYs04f/Lkqsm9GJaQ3c6z6RIFThut?=
 =?us-ascii?Q?6noi04MiA0yc3jLlW6kYGU1K/Sf9p06T/I+PPQ2ALaX5Ho6TZiYZuFZdGE9H?=
 =?us-ascii?Q?d//5OYzvAqjDaOwiClmZSXXeVBKmzuqthQQImVD9hyR9FhbdSugwwI+4uAo2?=
 =?us-ascii?Q?SOxLVWll7yxuRgGPT03VZpgI247ucRNkgzrgiVAsScfumXXr2OkBKXuUUUpz?=
 =?us-ascii?Q?v7bdW0jPl5hyntOEjcUGU4xaGBtcYWuKVFFfgqY3LVs3YBbdpIektzEcV8iP?=
 =?us-ascii?Q?PToN/oMFyoUy6/U85BmoeaxCmvu4SCkItu6YGFIzqsfUVzy5oDdrF9Thw1Fb?=
 =?us-ascii?Q?hVtssP8vwEqB0wnxkAZO0UllhgkPtQLyg9DVgX2GYEYLjX3Ta8IRpu8jW1ja?=
 =?us-ascii?Q?n/IuXddL4bcxa06s1Hatm4Bs6bYqg2Hx/5/iv80B6QgbrRvh1qYqsgEDYK27?=
 =?us-ascii?Q?lMECDXmduxZEVkGm9Aki/D+ot1F/J3dG0rnZPMsQKFHOT2+3jLgScIv/EIvp?=
 =?us-ascii?Q?XuifnjwabP5ZIA59yKgLFo+JUYM/iEbd4XDMXsj10Z1FBVob54yzkvcGkyiS?=
 =?us-ascii?Q?DdMYT5I=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?mgExY2o4zMJSpLCA5A/WnWnCWiQrS0jGnQdXdZzUF2vUxxR+cBQZlXvBC8RG?=
 =?us-ascii?Q?+3igxdbJyQ29dEW5GUcHau4TO0rZ9+Zq7z4pg0nTBU9PJ3PTppM9E9oxg058?=
 =?us-ascii?Q?YAEmQC9PFujUL1S2vGI3JXDZcM0HXguo/LTcqTYKf/yCSPB6eAcWjXkqd1Qz?=
 =?us-ascii?Q?ELqcMwxM3pubFJIquJwjBBx2ScmPL0kT7+UnvKIYsHvzsklHmMrWZ8TQWMDh?=
 =?us-ascii?Q?o1hbVE9fpun9hdf5GVu2PkbS40xXkAlLGSOkj+JiPz+xEkJN0nttdUwIXfiJ?=
 =?us-ascii?Q?ePtlAF2s0t+zhuboeSeaPCenrV6yhQpOu4qL8X5iP1TFNSSkIvYoi4m5gjcl?=
 =?us-ascii?Q?KBlF7uZk4HrCc6UNI5RDGRrhvuXs/hp5KdZs99GHfEy4Ntdxe1mLb5QwQzUV?=
 =?us-ascii?Q?kHVlm4KnfPhcJdd922eFJZkUINRxJBiuNY1R8VpNqXa1cFyNHPAeylhhmyLt?=
 =?us-ascii?Q?rCIVIuI4TZh5KgPQZBu3gDChA1UUMi+zq3mD9ddB+dd0lsLgXCjVdfhMdlLX?=
 =?us-ascii?Q?TRp7pSE8CsrAB9jneoElFoDDa0//JVvXpAaoipEX11+o9wKxtWxtfTiK5flS?=
 =?us-ascii?Q?KVgFUwEqqE+UqcCSxPJOyUoh4cxZUnnjpx5nNdw+M1rEVGhGn6iGqfOqJVCu?=
 =?us-ascii?Q?DwU15dUX3F2wQv5Jype+qRXIXxLmzCCrrhI10tFK6xawTzhJJX86UuerIxEh?=
 =?us-ascii?Q?LRJRHaVsKvkR0uFKw2fU/wKArEx8dOBMJIG9xF0vJnRKPzsvd5Harip/3P3v?=
 =?us-ascii?Q?MnDihvZjU9B7WnOGjoT9uD3evMOM0KeurT2KYH4/YdDM8vawxvN9QqNrjFM/?=
 =?us-ascii?Q?BxWirD0WFQVrZDFTtx87vfFpN0wRxrOlpVnbF/q2dovvOi0Mw76NAo9htDIW?=
 =?us-ascii?Q?s98YFdwBf/iecXlzMSkil36vv6/BeP9GC2NsV8w0CnYN/GciWtyY7CkFUH3K?=
 =?us-ascii?Q?Ubm/6LjKwgWk8Q0BrQuC6ZWWcLeBqhm1HOl9h13X8/RFFG13lC9WrLpUSh6S?=
 =?us-ascii?Q?aSE9NNhWli8cbeDOTY5HMHsmLYCo24oi+wv16FITC9X6Adn6X88rU0U4EQ4S?=
 =?us-ascii?Q?wiJNXKuqq73ZjY3iEjqlrm63vOSURDnWXLXkbslM6+X+hsTVu+h+IwLfr7rr?=
 =?us-ascii?Q?Ojt5KRvRi8t8xhZK1bKSv1FVcMXeL5r3LosamjSpE9fzV6eCrEjUFqcQHU+M?=
 =?us-ascii?Q?GE88He84irTYhTTtH5WJOeO5f0ciTYXB2DsK/E2wDo7Iz3nH4Nm7ojISdq8T?=
 =?us-ascii?Q?OD1UklZqtfuNhw4jU25ELbeZsaW8dv1BGGRniuc7GygRYWTJJ8OGEcH9RgSj?=
 =?us-ascii?Q?87Sik1H7ombtL4Sf/U+dd4MyojU5/MW9Lo6/A62qGvv6s5CYG+cas8oSePty?=
 =?us-ascii?Q?jLZ7o1BiR4E3/UgqLmvXXlvw+C4LHSGcf0ambZuIctPmZvvbAO29+6ommxrt?=
 =?us-ascii?Q?DYJ/dJ+41R4qItBjzAu9+UUq1/HmdpCRc/UW4Im5GEoy38M90KCkgMBeshMB?=
 =?us-ascii?Q?jhZscXKAzSodt21swyxNbFsIz62qu9gl71x7GzeK/friImrlm6kTX1BmZX2f?=
 =?us-ascii?Q?Wqu3k6u3bRUWV151fxt9zfLtyIIsQvFaFaPgImDJoM+wxcnMT5EFhYHvH2aN?=
 =?us-ascii?Q?fg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 09b6cc32-46d1-4da7-93a9-08dd09432ee7
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2024 09:10:31.0426
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9jJ1b1vdGUEDzRIt3lxmh6KuJVl3bQ0ZB9tef90jguByNLeF44EeyQBAr+URwTdurcEASEtLU7AWzT28G13Hzd/gXoeYvBQ7+QfI+dLNsiQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11886

Hi Wolfram Sang,

Thanks for the work.

> -----Original Message-----
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Sent: 20 November 2024 08:50
> Subject: [PATCH] arm64: dts: renesas: rzg3s-smarc: Enable I2C1 and connec=
ted power monitor
>=20
> Enable I2C1 for the carrier board and the connected power monitor ISL2802=
2. Limit the bus speed to the
> maximum the power monitor supports.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>=20
> i2c1 gets enabled in the current SoM-DTSI as well, but to be safe regardi=
ng other SoM DTSIs to come, I
> opted for explicitly enabling it in the carrier board as well.
>=20
> I picked the 'average-samples' value using my gut feeling. If someone has=
 a reason to pick a better
> one, I am all for it.
>=20
>  arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi b/arch/arm64/bo=
ot/dts/renesas/rzg3s-
> smarc.dtsi
> index 7945d44e6ee1..5e4bfaeafd20 100644
> --- a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
> @@ -73,6 +73,19 @@ &i2c0 {
>  	clock-frequency =3D <1000000>;
>  };
>=20
> +&i2c1 {
> +	status =3D "okay";
> +
> +	clock-frequency =3D <400000>;
> +
> +	power-monitor@44 {
> +		compatible =3D "renesas,isl28022";
> +		reg =3D <0x44>;
> +		shunt-resistor-micro-ohms =3D <8000>;
> +		renesas,average-samples =3D <32>;
> +	};
> +};

How do we test this interface in linux? So far we use windows app to monito=
r the current.

Cheers,
Biju

> +
>  &pinctrl {
>  	key-1-gpio-hog {
>  		gpio-hog;
> --
> 2.45.2
>=20


