Return-Path: <linux-renesas-soc+bounces-10155-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5629B07E1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Oct 2024 17:21:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B551280CB1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Oct 2024 15:21:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37D3B209F31;
	Fri, 25 Oct 2024 15:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="dl7F8s1a"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010035.outbound.protection.outlook.com [52.101.229.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E73185939;
	Fri, 25 Oct 2024 15:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729869445; cv=fail; b=DEIAV7rztabicspHvyXbzZJErU25q36CZ8JGacyfHnitguUwbg/OC5FClDvZmf4eSe82Mbw9XDxrrXp6SREHWgOt5wEkA3LvOlKjjppX5ytfFURA7f4g7dHC+HxHypZt8PqgdCmTqBzWQbqyffmK/dYHKa3TwY1C1EF0cDbzlkE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729869445; c=relaxed/simple;
	bh=euIG9LQJ5w2w1rrnTs+c7j5wnaNhwn9zAkTc62Z+iz8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SLPhxWxELoPgyUFMFllE7Q+mt2CLR6MmjN/58uMLedmUtOx8qUpUv4jzJl5zgYj2DTCO+/hz0LjNi01sb0XL2qWt3ItELdtGZNQcNz6E3k1Np0yb4i5vKi0PKDFazXcMkgYWJjqjK/Rtnd+brS/4xMaE07ZVhfk1lIFQI1XfjO0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=dl7F8s1a; arc=fail smtp.client-ip=52.101.229.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NFi/rAoawspdtJAyVcyZEHdN0DrX8xWphRVI+98se2GdJuHTCsO4WuC9lWkNxP0QATNc9lxJdnA+kfX48JATuJy6k0DEzKGKlV4+xg/OzDIPMvLAAWFUQKK1fjnPtvNAcJwFI3op0UIYzbap369j4clwyhGKNL7GnUPHzpDPjtwrqZdcl8KihOgH4me8W8o3UHw1xL/HhBLQmDE4/BTRfuP1COxYDGlVh5NkjPioD/eqi/931ln+rqlT9jU/n9KXKjhJXAxmfTb9PbdfQitFygsDfFn5Xe4PINXWVogsNm01ElptadH0MC5SLj7klTBqD5yG3rno3M8GbrXjjF1wUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Ue1OP8Ao3kvTHHG4JTi33xQmMtkvFDkYV/zPjMtfu8=;
 b=cMOKwGL05A1o0OqXiJ+Xd0gx9+EAm7nifRn1TevL2FOkH+eF22cVgGdV5Yihf5n5aGIxuQCcWhEKOag57vvUdJ8gt5rCoFhqV4VJlsingqIrOpfzAdG4m7K4MwDSLpM4mZfneigE02teMB+/gP7TFyBxUaAIDOSz6wsZEsre6dz0KuKxXM3Gqh90Spl+9+0SiljGXPDah853Rn5Y4cOiGkJr66x1qxDRSEPG0urbUs7EhBxvn13CV+YgjnnWIZLP//XB7jLHGIdCyGuWf1z1Vd/Ri2LWFm2dxBZagt3wGBZbkqBn2M57ONbWUQFqqYFjatoWg4Dj8mLif5RCfYC4Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Ue1OP8Ao3kvTHHG4JTi33xQmMtkvFDkYV/zPjMtfu8=;
 b=dl7F8s1a6ljNEHgajcQcJKe7sJAtbp3VjUDE/dD5WOT+dg60Z+lR1tA+GGhwxFe+aUQ9Kcc+R4BhqOWXj3omJBJiAvrIvDGgw88J7sBJD/pxXgWxqt9nRGZB6nRJOLgdFycK4/8XffzJ2chGD2vBkVOGiEb8tYcEqpc16JzSSv0=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYAPR01MB5707.jpnprd01.prod.outlook.com (2603:1096:404:8059::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.24; Fri, 25 Oct
 2024 15:17:18 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 15:17:14 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>
CC: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v3 5/5] MAINTAINERS: Add entry for Renesas RZ ASoC driver
Thread-Topic: [PATCH v3 5/5] MAINTAINERS: Add entry for Renesas RZ ASoC driver
Thread-Index: AQHbJu9U3bKms2FiqEecYgge0A0xQbKXk9tQ
Date: Fri, 25 Oct 2024 15:17:14 +0000
Message-ID:
 <TY3PR01MB11346F4D887726EC5833E3C65864F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241025150511.722040-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241025150511.722040-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20241025150511.722040-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYAPR01MB5707:EE_
x-ms-office365-filtering-correlation-id: 70245e6e-7746-4144-4b63-08dcf5081b75
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?ADCRtzrg/zEvKi1YIXMPuusWOEezwrFrn9OsWnhJyCJd01mauDhle+87auv3?=
 =?us-ascii?Q?ecvQGFhGfUj7T4pcsOGcRx0/rBqSx3LHoWnn5eb7hC2THIJ4VpDpgn/SHIZZ?=
 =?us-ascii?Q?A25+OE7bK9ZlE4rm7fo8+u/7fVdhc0H10njxLTg5X5vnU2FsCs+roUs4e12e?=
 =?us-ascii?Q?AQgfwjrMfDBUdXOoAJcACDx1eJREw8Mfc6yEHpf9TJn7hD0XxCJ2fY2Ip6At?=
 =?us-ascii?Q?/cuocDrC8Jl09umHSnbVHPu/zcO/xtSYUUJIwr254jEI3GzmtzaUmCDyuSD6?=
 =?us-ascii?Q?WsanqYz11LXHv0OM4sRBy3+DWIwCxw8ARC3HFlWU+C7+B13yCauzbbtmHOnV?=
 =?us-ascii?Q?PruQyuV5pYmGugV6kHYFxp8/Qa9vasT34uV5ooVd+cGYhnshx8vTjfDk10vz?=
 =?us-ascii?Q?cHisLvHO4vAwx+plZ1sV5gX90KRBrqLomWxWd5dRSyKadqLJgUcp9YTP2+tA?=
 =?us-ascii?Q?Ewt7221a2tmawbdMkOw/ozmjQEZyTCO58V+YMD7jXuDzLt7eoGu4UI/D0DZZ?=
 =?us-ascii?Q?jvJycl11xPSh2ky9SMw+cvZH7HJDKJfB/kaN3fjnd+t7JFkKBrowhq1z70yR?=
 =?us-ascii?Q?6PL58VedK1WKv2ouPtXXpaQTv79k5EMVAQK3PtJ/Bypsg5FfZ2PbrX/W0AvB?=
 =?us-ascii?Q?rizZTdQ7634DBlb2TetTBlui9u54874EHKaa6HjUZNwCmnETgSd0TSYflXTB?=
 =?us-ascii?Q?aawyhvvqeQVR0B4JD69iyjprTldu5WdXhGXbkwe0OuM0mCam0IB9X5D2V2Xm?=
 =?us-ascii?Q?WPW3eskeju8F1sgUz+/0UNsbqI8bTgv+7+hO1dlu6EtcNN4KhmsGGO35KZJU?=
 =?us-ascii?Q?XJN/j4EWf+MCwNZJ75LlYhDV+0H2rINBQPLE2xnhmaoAxj7ei3HTBZOuhYMH?=
 =?us-ascii?Q?Z09jf2G5r4KzA9WHZFOViuInP0CyMnKMUd4lAqd3HVIfY1n26UG02/SnSZ15?=
 =?us-ascii?Q?tG6hvKL1YvNdTSDenQBYIqFzzGyKtlf8wQT7/xFwg9Jvrm9UqZ9Bi6zim22D?=
 =?us-ascii?Q?4mEk1PS6cMBUJzPLMDY54zjFeyeCvdJAz9heRv6rwyOAqR6CVycS0t2Y65/a?=
 =?us-ascii?Q?288d0Xf6M95XxRXsayX7jfD1oaiNyo9lE/fRmeuGDw4RirosFE3VTFN2yRwC?=
 =?us-ascii?Q?p1eWr/MUIszCZdsjoS1vm74fp8nD/Jmg1sF0KmZe5BxF1JtPTyeDrnAt09ec?=
 =?us-ascii?Q?MNdKvl6UDGLz8qX4jocHB0XT3u3tIOch2fuzP/HeBjxh6a9fb5btdKJZ7Ooc?=
 =?us-ascii?Q?VParjevlHgbij6dbT1G7uVSaNmlHmGxt9QhdIQfd32Cfu8QwVMoNFt2qR1Bw?=
 =?us-ascii?Q?6qXV9/2BUjixuxmHqIWW5GTfApmTW9MqsKxfvxQcyFq5n5bnivKRqFLeaZ0S?=
 =?us-ascii?Q?xUSkVEU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Mz2KhlmDsdIE/gg7fsu4vodhX53hos48eXLKpOkYSI21zy/7V0FosemJPqMg?=
 =?us-ascii?Q?8R8jufpmBweIMbXDnAlNzZIE3bpruPJ9VAwWP4kqov0McbFo1XB3PmDC9dqy?=
 =?us-ascii?Q?fpo794y3UnaIgH/kRB8LW7LaMU5Ma063mGQy5hTar8Gw4oeUyTdX8ry6Z8hr?=
 =?us-ascii?Q?rkZbXCwJ1SD+gBBvqaQrvN1dZHVKsnTX9mm/U7IcUuEFpuO0ndeH++UJ96Pe?=
 =?us-ascii?Q?nKTVPplWyEYlqErkQVFBrhKx7lB4SFZP0mppGvAj3j6dIswOLpjOtlDnkiWJ?=
 =?us-ascii?Q?mCXCZ7X2f+egJibCzLMQYfr5bN921byPOP1I2bK2SbN/zmM+84bHhkFH9fkX?=
 =?us-ascii?Q?siuOMyw1YQmjD+5fMfwU1U1sjLAZgyMACHbXR2j6m9+hupQjDQpr8nG7dVVw?=
 =?us-ascii?Q?sMgNwOpmf0QWPoQuq+UpSzFxFJdWj3wJIQSBcln/l76yfMPDv9TCofiZW96K?=
 =?us-ascii?Q?wVO6OfaXe5SC+K5FKUNkYeoU+GvAtvSlNWpRhxcP/V/CEOkTISYZqgZgwrR1?=
 =?us-ascii?Q?cbehHdQ2GMUSmmP8KTROmJe6b4ax46Wrma/VUD5K9ZROMIsJlXQg3s68ifrP?=
 =?us-ascii?Q?gKkOwTbElwZXz5S9+R74PS1dAYS1GfTKMl+Cg2lDP1RU5msfw/FK2qr73jA9?=
 =?us-ascii?Q?NaCmYP4y9s2Bu8oTXB4LwxAb3yLRtQguK9eVISnqyP09WY010gY5hoPeeuzB?=
 =?us-ascii?Q?bwsc9Mlr5IX4G64JD1UTP0F87QoN1CfO3YnBLP63cGL68B8TIvRDgky1IccR?=
 =?us-ascii?Q?ur13GbA+Ztg7NxqrVu4MmtVrTtHSe9yY5rrpWXzQ56ujgg/hx/lSqVeYo1o0?=
 =?us-ascii?Q?yFUDR9bNlNDGNTVepe4rnxuAoOUCRuqikntjCyY8TLFfje+jFs0p6aqPQQXY?=
 =?us-ascii?Q?qdDzTH4qIQkF62410id2cA84wy94qyMohcZQSuwqQkQOA2H/e5LE2uBCPDxS?=
 =?us-ascii?Q?wbR9/q2xiOes4HOBOx9e/7WTS9qwRkM4txXR8Ne9/3/3g9ab9teBHWAcfNau?=
 =?us-ascii?Q?lyUSgv6Z7Q+1oP13R1vrGt0i4fjvuKQt6YKf5ZGcvqKMCuv06yr4VrixieC+?=
 =?us-ascii?Q?fhGAL3L/jd+d3pNOT2AgF7ljnpYyGfvJWwPk4zFSpmtPfW8jaag/q2jbZjZU?=
 =?us-ascii?Q?iQ8e0CKUROCNhbNjHu4RwRsi77EgRVrEfEJRw0yzRTEwFdQJKywHgInGR+zZ?=
 =?us-ascii?Q?Kqb91zSfsXXOlN3aF92ygQxwsqjvOAUx8rj5shHgTjnfh3AwlI9Cwj4tpjxC?=
 =?us-ascii?Q?ea1jDwM6p3Ck26Td+zs/zWAW9VTtbHLvlHbANF0Qfa+XNQ3GfwIGC+VVgxyf?=
 =?us-ascii?Q?e9fpLuFxWTZoUeC2NTU8PagOeQ4kF1D+67DX12RJbOtZWVH2jgXWz9LlYH1i?=
 =?us-ascii?Q?4/ele24Sht/oejRF7A3DSq52n6Z49u1GmL0kz2sg8SzabzKWK1e+e2Y2GKJY?=
 =?us-ascii?Q?/beKuF/8MoN498Xz7Z41NRKYgNZ8lPvjcYTfb17Clt/8sFCdzeN59hWSX4w1?=
 =?us-ascii?Q?rNnPo1iw97DXVRmNTWSqKLltJsc09mkiClnHN5400aQUrxlIKFSWohyQZIuo?=
 =?us-ascii?Q?9m6E7xDeseO9y9McytDzuHBG/J+ZF3XjvzSvde7BKHG8BWT2kAkdfyywTYqM?=
 =?us-ascii?Q?0w=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 70245e6e-7746-4144-4b63-08dcf5081b75
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2024 15:17:14.8893
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zgbUOE2OD/Q5f5/Utm0xffaOB5hUKE6gKTasGDCao/bqkxxXDwWjhZAOAeDnXJu9LTdcGNijPnxI/+67uULhi+Kxh/gCqqXNam2NQ4qWYBw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5707

Hi Prabhakar,

Thanks for the patch.

> -----Original Message-----
> From: Prabhakar <prabhakar.csengg@gmail.com>
> Sent: 25 October 2024 16:05
> Subject: [PATCH v3 5/5] MAINTAINERS: Add entry for Renesas RZ ASoC driver
>=20
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Add a new entry to the MAINTAINERS file for Renesas RZ ASoC driver.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Acked-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju

> ---
>  MAINTAINERS | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 041df0410e81..9e8a17623486 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19734,6 +19734,15 @@ S:	Supported
>  F:	Documentation/devicetree/bindings/i2c/renesas,riic.yaml
>  F:	drivers/i2c/busses/i2c-riic.c
>=20
> +RENESAS RZ AUDIO (ASoC) DRIVER
> +M:	Biju Das <biju.das.jz@bp.renesas.com>
> +M:	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> +L:	linux-sound@vger.kernel.org
> +L:	linux-renesas-soc@vger.kernel.org
> +S:	Supported
> +F:	Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
> +F:	sound/soc/renesas/rz-ssi.c
> +
>  RENESAS RZ/G2L A/D DRIVER
>  M:	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>  L:	linux-iio@vger.kernel.org
> --
> 2.43.0


