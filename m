Return-Path: <linux-renesas-soc+bounces-2300-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DD58486A2
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  3 Feb 2024 15:03:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7752F1F24366
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  3 Feb 2024 14:03:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBA2C5DF01;
	Sat,  3 Feb 2024 14:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="EpKPcK2w"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2120.outbound.protection.outlook.com [40.107.113.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7EA5D90C;
	Sat,  3 Feb 2024 14:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706968983; cv=fail; b=RDbCzYJK+xGCE6enbxI8rwNDzE3CKBgJAXGWL3DucTDfKUj2DfbuReqjb7tzFbIgpZHzw7wXd9EKMRY+tzIyEIKIW0JUqpGOdAb+PO7FzeigAEeP21MLqAHZNn51/qH4BxSkvJij5WbKI5rOhpkotZQe76BmsMRfaFaJfsWEU1Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706968983; c=relaxed/simple;
	bh=5s11NveULpWXR9rc4X6ZbxaOkz9NpEJsGv4dTaYHxs4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EzClv+N+pAZmAYhNMG3eqlR0/KmhdvJsCLzfd+ts0YN1a4o68+O3ZxJk8apOahfJaZohzxRb/B0v63IN6lZdahvhEF7ToehvCbJbHByjpsekAl7NGe0UiJuoapF/FMXX6fSuepbFKOuy4mFdM1n0mWlW5X7nRAbCnTFjowGdqWs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=EpKPcK2w; arc=fail smtp.client-ip=40.107.113.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NKs8Y7k74sJ6ErfbtwxF+gmAbY6furb4ZqKWlLkiAPtJjHBQkgKh8mhmU/GeB4fePFkepnrd0LeNAiy49AKXxhVhuwQkGuN2sKFlEWvc2A/yMtZ90qbe/6hsYjTFGFyeilFyVzWlb5w3uM6swEqRvJXXjct1iMhnxPKfYJRTuiqT+4lMmS5UWbdq2jsOb8MpL2v9DDYDvmvNDgt9vcDpEW+kYrIz8MUkrBViuYYLNqQdBuDcrfxarsm3Xqt272rVZiO5kfHPXXdPQ4QCX+0ESFJTtY+rJ7aLSkj/G9MBw8fPtGMvRicJbllrkCck6IMzxeoVrHXMaye6yI4zsYYIEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pq5Va8lTr9sN0fML+lkgt0abaeWuXJpNMOWTvJXK/yE=;
 b=UjE3EtIGhD5qzIledk5LZx6jjjy0oh4D5Db7vqk4u781jln9j7FaD/55UfyQrAxAOOzn68QkZaByiYn1mwb0BjPDjA1Ue0c0d1wAP7wxkq0zjuD0vq6V29fIVeXnxI/yPG0Lm1DJNmCnypd50+ynPzpyCFYXyDwZfUB51UK7y5X9hCgevNxVuifmBuIkZK06SXFo3UVfybb4YUu9Owe9IctOFwyKfSTlbjrPwUhsKJ4CrarLIpWsexMtVoHQG659ggDYToNG97NRKwCFb3DF3yppu61YbxztoDnnIH7iYhPu1yNLBi/0Z5YtUc/lCvpKZS8iJsAfByxvmaRJE2J0Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pq5Va8lTr9sN0fML+lkgt0abaeWuXJpNMOWTvJXK/yE=;
 b=EpKPcK2wk8pSjmsOl5BbUvIIrbluxcGfreUrBfwUci7d4/Bk0Ky5pgKOpgAKfR5Tt06NzbtGOsMykR0+Oh5miCZ+JXjxNyJ48iUScP0ieVxelRoWtOjqGGgJDX6xHZX8LIXa0LXoP8ESDWUkjey+UmResi1oi41zu1QBXC4G5Yo=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by OS0PR01MB5332.jpnprd01.prod.outlook.com
 (2603:1096:604:a7::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.24; Sat, 3 Feb
 2024 14:02:58 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0%3]) with mapi id 15.20.7249.027; Sat, 3 Feb 2024
 14:02:57 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Sergey Shtylyov <s.shtylyov@omp.ru>, biju.das.au <biju.das.au@gmail.com>
CC: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, nikita.yoush
	<nikita.yoush@cogentembedded.com>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v3 net-next 2/2] ravb: Add Tx checksum offload support for
 GbEth
Thread-Topic: [PATCH v3 net-next 2/2] ravb: Add Tx checksum offload support
 for GbEth
Thread-Index: AQHaVUc+xBgFY7+iVUqRE9tEu3lenLD194yAgAAFBACAAX2tAIABLlfg
Date: Sat, 3 Feb 2024 14:02:57 +0000
Message-ID:
 <TYCPR01MB11269851FEFD6FA7EEBCE724786412@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20240201194521.139472-1-biju.das.jz@bp.renesas.com>
 <20240201194521.139472-3-biju.das.jz@bp.renesas.com>
 <d3a6657d-0a67-a826-24b1-17ec8f43ee81@omp.ru>
 <CADT+UeAeT0dC2AV1RP8H10V7LY2WLeET=6C-U_cXEDW95eYgYg@mail.gmail.com>
 <2e17fe94-e398-ec91-e9bb-dead0c4c1219@omp.ru>
In-Reply-To: <2e17fe94-e398-ec91-e9bb-dead0c4c1219@omp.ru>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|OS0PR01MB5332:EE_
x-ms-office365-filtering-correlation-id: 4efcb209-a0fd-468e-6106-08dc24c0d36b
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 NgnYLOIsUgLlLhMSiAbPPjkO26xcxBTjiVsCObReTgOXNpZnPFjqaQcPZMCr0XXs3X27/lrNqApdp0jrbS5gkRRBAZRuLbA50rO3vuTbIv07d2QPa/XKs/FKopoSE5i7xRYdUWUg5ODP7l9GeRUsfDWLgakGGma1YkHQErroacxoVVTFw+g+cGpj38ToTG6IhTnu7akr3D4pi4VaX4HJu4R9wjZcH7FVWMVOnI6ia91ibHXblm7rAFLzZEQmzPlqoiX/h11OFqfZnnvE/f4vbh4YGQJDMx9JB4WeYVLJGomgISkaz0sVn0gCV5hWS/iALQ6DmRo7L1JSTqn1gqzyE/hyLOqaZMNyMUXmGP4qHTtPwjxnB5oKyS74L2B/gvdjuOkdHg4r5r5gJ/cSasxg0B48R++C6EjE7N+NqHEoXleomT/nEaTGcNeoXvgTgQL16O+qPwm+auewewNAMedYzcyGi2FDPp2Q85WmBjFUYrO9I3nNzTT/kXphgjlLb9L90YdTOs0hCG1ZBrWMBtKGJm+1m3RYRw2VT+8zLbqcwYLnc4k8h/xgSkHXtRPxtThCeORncKpXleVr39RiYsu1Kih/sILl3osvjpLasWnRCo6GRrM1GSDXTMby/GpAMPrj
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(6029001)(346002)(396003)(366004)(39860400002)(376002)(136003)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(55016003)(38070700009)(66556008)(7696005)(53546011)(8676002)(478600001)(107886003)(110136005)(54906003)(26005)(8936002)(64756008)(2906002)(71200400001)(4326008)(55236004)(5660300002)(6506007)(316002)(66446008)(66476007)(9686003)(83380400001)(52536014)(66946007)(76116006)(7416002)(122000001)(86362001)(41300700001)(38100700002)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?cPbzBTCXqxWQoRCRCaw+eEUImeA2tZsIhcN7G2Rs3PXMHmF8yjsCUc3GDT+w?=
 =?us-ascii?Q?c/XC910khVImzhsX6WMDKw9aYkQa8Y+J3c/CSSWtbl88rRPPpYcDsAJvM6s6?=
 =?us-ascii?Q?B5oFt2FBUuzFRV08GWEmBbaDUAEUOZTbtiA4/jxBJSMTWxJa4IVY2i6fHZZl?=
 =?us-ascii?Q?G2onQdTErmHsR9fP9QM9NAi3O4t9OqOn1vBts/gVC22DbzX5+St0fbhkLSQy?=
 =?us-ascii?Q?fkv2S6sK543GZlGoWNuyYZNPtktYobSQpcP+Uk8H0dTUen2ydR9YP91AdupT?=
 =?us-ascii?Q?tAxAU/shMPvq3mwRJB3xF0Uto2lnOJQGs4eqiPu0VMmdzpMoFfOQ+DD/aiQK?=
 =?us-ascii?Q?/7KUXqTgBVkRTGLkbXNiLoMt39ETlpiGD5E5GSvp4XucsmBGy6vrssyGaD8y?=
 =?us-ascii?Q?pBLsTHziQhlkZERzMGyDRRjQodAnj6JRMqhjJwjZI8tYUdrpy30y6W2ajKU/?=
 =?us-ascii?Q?c/qgQEXwbmBottiGQQNirFtOQqs9xaAUK3L74AiZKEyGqgwGiJRFwFjF3soI?=
 =?us-ascii?Q?VZ+02cVTTkMEW+If33kWQZw/O/HHl0wVoka9Syzc9wQcSRn1G9x97cjwfIrP?=
 =?us-ascii?Q?C5YR10ngtty/RkjlPL52Uy4waBkxOLExthj/y/tTFi9jOMVtmDNvjJkH11hg?=
 =?us-ascii?Q?hWE8JMc78FrggvpUY9j1AEtZ2w+AyBLM1abfJYNGwK6RO/hVmAmzEWjfGHIK?=
 =?us-ascii?Q?GaCh6WFy622n01pKZtznxYKVn04EDqMEVPTeJMyvO3UXJdN9/r2sYDHT5Wa/?=
 =?us-ascii?Q?oS7qOuI5xHMQGGNOJqwBnJTxvwA3TiI8bwFzait2XLoZxG+avOrzApnCAoE8?=
 =?us-ascii?Q?DYYslqzOGsTPYyiOGzObPQ09VPxv83Da++gmBGRPc1rLl+i8VhzWAQ1gtaG9?=
 =?us-ascii?Q?brNCAu385D5bT/rrpDV1zG4A4coGhXPe53f69kva2biO1ssyNbT/h2ektMXD?=
 =?us-ascii?Q?GO77vdtSH2bxy8m/IANCX6CjcgqhXwFjhBID97hNuIJIlDX0srcpx20hozGi?=
 =?us-ascii?Q?teCnTK8F+/146LZA0Cvy7LvIrvh04DaRSumWzNRNRMCw/Dey/Yur09irrQ0g?=
 =?us-ascii?Q?RsvXNi/kUhqqv+YU8k3+qzIVEs4yF+dzNirx6BxgQ81LTTYYQ8GWeDD4aY5B?=
 =?us-ascii?Q?2TxxKQuFEkuVb8ilVtLtlXhapvdi7bmGMrYqi/RdGu0qqtub9KURZcR6rCv3?=
 =?us-ascii?Q?W+Xv1iUHqGUqGJ6vGqOUds8WsyzqSvNwIyvisvzxBRQBfUBhH/2hkMmNVVeZ?=
 =?us-ascii?Q?kCnxgoTpkXdqb0XWiQLG4CUEPNUdDry+/b/H0v4QO7Jl0ZF97KH15H5tI9Nn?=
 =?us-ascii?Q?h2QQ8FLd7vhH5vatyrX2ehVWnu2paFw+I6ubO13iM5blrSA6wE3E1icuRKY6?=
 =?us-ascii?Q?X/Lee7Hg/E8sGRrLJKsdM9d5Q4MNY8M39Q77nR/dzb0WYVYeZAy2wveqD+Nd?=
 =?us-ascii?Q?jzS3Pq5aOx3nsc1SCa/dXlgwFeCyj98EA6vhOkxbCPc0UWhjRi2z+BBrGdEH?=
 =?us-ascii?Q?w5YqWrifQxL33MUDpBexsxejTek3g+5yqF0VwJfaZ0xZUwUUg8EdVj16lV8o?=
 =?us-ascii?Q?RbK8s6JXoE2xbj3UbeReh+Y9P+NQmliCSYmlj6JOqUEr2bUlXPA1u8/vlB7Q?=
 =?us-ascii?Q?vQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4efcb209-a0fd-468e-6106-08dc24c0d36b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2024 14:02:57.8614
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zVYNvFD9o3edynfnYIebmRRd7tR4cmpWG4fc5CjsAXKK+3c6gLe/EVTG3Q8G9Sx38GaHgGLkVGSltDAxjiB3+lnS4eZcBnZo52aqRJfMDj8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5332

Hi Sergey,

> -----Original Message-----
> From: Sergey Shtylyov <s.shtylyov@omp.ru>
> Sent: Friday, February 2, 2024 8:00 PM
> Subject: Re: [PATCH v3 net-next 2/2] ravb: Add Tx checksum offload suppor=
t
> for GbEth
>=20
> On 2/2/24 12:13 AM, Biju Das wrote:
> [...]
>=20
> >>> TOE has hardware support for calculating IP header and TCP/UDP/ICMP
> >>> checksum for both IPv4 and IPv6.
> >>>
> >>> Add Tx checksum offload supported by TOE for IPv4 and TCP/UDP.
> >>>
> >>> For Tx, the result of checksum calculation is set to the checksum
> >>> field of each IPv4 Header/TCP/UDP/ICMP of ethernet frames. For the
> >>> unsupported frames, those fields are not changed. If a transmission
> >>> frame is an UDPv4 frame and its checksum value in the UDP header
> >>> field is 0x0000, TOE does not calculate checksum for UDP part of
> >>> this frame as it is optional function as per standards.
> >>>
> >>> We can test this functionality by the below commands
> >>>
> >>> ethtool -K eth0 tx on --> to turn on Tx checksum offload ethtool -K
> >>> eth0 tx off --> to turn off Tx checksum offload
> >>>
> >>> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> [...]
>=20
> >>> diff --git a/drivers/net/ethernet/renesas/ravb_main.c
> >>> b/drivers/net/ethernet/renesas/ravb_main.c
> >>> index c4dc6ec54287..042dc565d1a5 100644
> >>> --- a/drivers/net/ethernet/renesas/ravb_main.c
> >>> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> [...]
> >>> @@ -1986,6 +1999,35 @@ static void ravb_tx_timeout_work(struct
> >>> work_struct *work)
> [...]
> >>> +     case IPPROTO_ICMP:
> >>> +             fallthrough;
> >>
> >>    You don't even need fallthrough, actually...
> >
> > Clang Compiler will complain.
> >
>=20
>    That's not like our case. If clang can't compile:
>=20
> 	case IPPROTO_ICMP:
> 	default:
> 		return false;
>=20
> it's seriously broken!
>=20
> >>    But why do you return false for ICMP? Isn't it supported by TOE?
> >
> > It is supported by the hardware, but not the network subsystem.
>=20
>    Then I don't think we should set CSR1.TICMP{4|6}, so TOE wouldn't try
> to replace the checksum in the ICMP packets...

OK will drop ICMP and send v4.

Cheers,
Biju

