Return-Path: <linux-renesas-soc+bounces-1850-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE6783CF27
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jan 2024 23:08:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 98183B22ADC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jan 2024 22:08:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC73213A27D;
	Thu, 25 Jan 2024 22:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="T2ms+k0Z"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2108.outbound.protection.outlook.com [40.107.114.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0913E131E4F;
	Thu, 25 Jan 2024 22:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706220519; cv=fail; b=aCPhkD9Q/VXtIvdCBVnnYp03w1F9uUJxIHCKvsCCs2Kuxez9Cm5XI7gMbBlAfamJzNwylsKC3cFHx18rBRW7s8ZW2Wpm96jQrOZWimOqJjg24ROSRCTNs47p8JsUis8NDZoKfhMNsXdJ5V9PwDvQagzSJdiuVBx7htDpepeFhEE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706220519; c=relaxed/simple;
	bh=EEQ7D9G1XXroNug/+L8Vem8zDIYx8cWKngm3tri9YFs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rrMH4s/z7PzWL7fvQpxNnGsmEr4kypDInCPhSwszve9FCCnmBHhqKUiGw4HQInNY9rfnQP04ChKpmylpIEX4CFtjJqWQp2G9gcOwAmbwnlXdFGtG24mY+szr3h0H3E+Xcf4r6wvaxSP7FOSO+lQ27ioyLioc025fWoNi4WdEo3M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=T2ms+k0Z; arc=fail smtp.client-ip=40.107.114.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TiJuHH3mO1/scwKEB2FD0RF+4EANl+nPCKaU9Gn09+wnARziJ2Dp6tnGqAGBxYZf9DzGZps2+UmKUI0v4Sq92j/UlIVVOL5fiEw4nu8b2aWzetKymIrERC2RX/+yCtgIUUCtxedcSp8S2EZkbYghgIhtrrJbYmeCWFXJCd3/j72rxCO/nqh+NTx0NReXZaV9I5c5tUvPqjanMhdvBwcF4xWP78w8bBPVC8Yz2qpTxiljty2wug8h4M8tVYliCixTyNViIpOcCjrytGJWKs4q9jqSbqmxS4evaD6ppvd16cSY/0An2MxT0NIYv3oE80MDvPTlASVUWEJEGQlL+FrtiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=foEEHc/EWmnvZ1G/9dVxocdjQs+KgLYFYLwCkHrjp/c=;
 b=Onv39dTkgXL1IH2g2HA6+VJJNZdefpcJQ+6JL9CmYHvG+3SZ78sVUNexu/lFbRSZ2tNn1FTNqlWhc+GORvvp3wjkgm+5Ne6ytgqJATz9cUjgqeoBRaDXWL+Aa+5K3TDdsIOkckzq62t71ST/cw+AiTKdSIOofnroF24fCB2QkMZDaO2enxGKB+NB1hMCcC+7sF2Zp6G0s5l8OqbxD9C9TG+3TDoh+z42To+eK7b1sta3GFZrIXaASKIhpifxqA0MPXYTnTxuhsUAbyQP46iejTI7w27vwXS85PRSOmSErhTHgEXN08fg0vEIZShxev7cIYLDhWJweS7rkqdvuoxDMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=foEEHc/EWmnvZ1G/9dVxocdjQs+KgLYFYLwCkHrjp/c=;
 b=T2ms+k0ZHKTK7/VE7Agq01jwuvmD5Rc3gHrYFz6zg0HbuFZAmo51ONtV6bbqYELnBjUk0Mn00Ku6SBKO2LnKBvyd9wQsmtxPbdKaEsjSYOEYaCYDeZ1X34lIQqD1G0YdI5hEHsF/pXkqMQP7W/GuarNphVBQJH+VwsrPZJh5tJY=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by OS3PR01MB8351.jpnprd01.prod.outlook.com
 (2603:1096:604:192::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.12; Thu, 25 Jan
 2024 22:08:32 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::8d12:a02a:9fdc:9c78]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::8d12:a02a:9fdc:9c78%5]) with mapi id 15.20.7249.013; Thu, 25 Jan 2024
 22:08:32 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Sergey Shtylyov <s.shtylyov@omp.ru>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
CC: Vincent Guittot <vincent.guittot@linaro.org>, "peterz@infradead.org"
	<peterz@infradead.org>, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, nikita.yoush
	<nikita.yoush@cogentembedded.com>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH net-next v2 0/2] Add HW checksum offload support for
 RZ/G2L GbEthernet IP
Thread-Topic: [PATCH net-next v2 0/2] Add HW checksum offload support for
 RZ/G2L GbEthernet IP
Thread-Index: AQHaTq8Vk87GJ4m6nEOlufLgrj9VWLDq5xKAgAAwRNA=
Date: Thu, 25 Jan 2024 22:08:32 +0000
Message-ID:
 <TYCPR01MB11269BFD4A300AA71BA02DA85867A2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20240124102115.132154-1-biju.das.jz@bp.renesas.com>
 <5245e582-5eea-ccdf-2ba3-fda58e261172@omp.ru>
In-Reply-To: <5245e582-5eea-ccdf-2ba3-fda58e261172@omp.ru>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|OS3PR01MB8351:EE_
x-ms-office365-filtering-correlation-id: 097b21f0-6921-494b-3349-08dc1df22b27
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 szftxXPqk9jaSOgkQIa+rUwfWy8obUMzA0XcoAyzlwINLn7CxJPTo/aujtDl4zp/rTkIw9puaJdqkZOsmjJ+WvLVGJPAwYLcn7Pim58kR1TlPsGGAm0VbhELwVkd/GuxuFFsS9X5ya/pwyOvjMY1OMUXszP1YSFSRW11HwoYzhPGyNf5UP4xXGM28fmrK968Mb//aEjxoJ9BeEspeOKeU0h3xJWPHD/Fr6dGZJKc80fcyQCLiz2VmZoaDlDCNWbGf7bPcyFHoKMh2QGDL2cBiTSG1imW1JXuNHXZJVIA2qvajrgd+xEeX9CY5vwvOVBkl9p939V2poOeMM1Si3qFN/fjPLm0LoK0xr5J4pN9tvZpeW6FjPjqCRbAOiYCQSuVXSj/LHK2Nxqxx9ayUP6MGiZFudnviNI4X9pROfDdUylw5GgcFuT0bhtblIOo6Wbf8LfT1hqDIzJjJ0MCwHSoj+dEj0pExBrDUiYic7ayQ61WxDmIXID2y6ouhf0Y4nGLeIUbdn+eKHhu8QUxmhzd7c1FxaRPG9jf04KoIaYsysV7Je6uq6MvIBkg2YufSynpXfAOtoN+p5ihtS+yWjDCL1VsQScF4PlbYT++5MIMT6mWGpubeHBYMe+Rny5HahGKcX8sml71hMzP4GLGeAr4XA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(6029001)(39860400002)(376002)(346002)(396003)(136003)(366004)(230273577357003)(230922051799003)(230173577357003)(1800799012)(186009)(451199024)(64100799003)(9686003)(6506007)(26005)(53546011)(71200400001)(2906002)(122000001)(83380400001)(5660300002)(7416002)(4326008)(52536014)(8676002)(41300700001)(966005)(478600001)(64756008)(316002)(54906003)(66446008)(76116006)(66476007)(66946007)(110136005)(66556008)(8936002)(33656002)(86362001)(38100700002)(38070700009)(7696005)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?pNiOF8Vr1nwslITuzm8i5PqdHfVSX/a3ewAqUaHAnHArq11LWlbX0ZjHGh4z?=
 =?us-ascii?Q?e8MogyOKms3+/nMGYC4yLNPlHC2mztEvJBPDRERzaJaeseb5l3QPGEHE/WXc?=
 =?us-ascii?Q?CeEukbN2KN5ur7gb87lpAKm0mBvVZtvQD3nhwCEGOlLSyguHdq64Qh3f4LOG?=
 =?us-ascii?Q?ll/W3FEqTGedPZbT3PpKzikWxHHge2H1KweBZvv7NXBVc50jfuwpDSgUCOsV?=
 =?us-ascii?Q?x/ojoCYx5XvIj9Aoi/aGLnSU8iHsNp+BhWLB7GwyIly7PKQczZhMj3CRGitE?=
 =?us-ascii?Q?pxtk5aO5mfqoK+b8NOGRziGTefHbd8I2sTTXvGer8HlQFgEZNquM5JPU7DIX?=
 =?us-ascii?Q?XMbUOTMIMVUaSarLFl6CJ63v8UHYvhnT+523XAkB2eVC042Cc3Nh5GaqT+I7?=
 =?us-ascii?Q?CllHQRmOhvjl0oCR6KJ9z659QR2ozAkeYmhmqJOxf61zNSKsvM1ejVO8qo4M?=
 =?us-ascii?Q?cMstLVz2hY1WSdVNPdcsmfJDcKBgocg69PKI2n1WXodRcM/oqfha0UcjQAZ4?=
 =?us-ascii?Q?yw4slUotaI8hQc3RIMTra3HOiu+qs2944ja2kSC31WuyGZ5HqSUZxtc6tZb8?=
 =?us-ascii?Q?KwMcZOiozAT1yzT+aGfmXZs6jISjB31AdXqW0rTjIrkWVEiJWjGV2o7LiFC6?=
 =?us-ascii?Q?sC17Dd0B7Qov616KnaWG9DVpTZYaFW5ET+kz4csZo3I5Ral/ZiHE96BaQ2Kg?=
 =?us-ascii?Q?YIjXb+rvTnQIVvL6hs7ci1RqBl+r5xHTGGkiQUeeh5yp5dk8EKmHx8Bx7veo?=
 =?us-ascii?Q?s9d2+T3ea1Ou85wz9Wt7dVCN7rA+NTa9z5Ts5q71TW+Q0+E7jzbd701fB2Gg?=
 =?us-ascii?Q?QSbbo1zwZ5vB+abFHqYj4Y6UCLJhCaxT73pz/TOd2hNDIsTt2jzHOEjeXo2T?=
 =?us-ascii?Q?BkZtP1YKw/upj3nGQGrFUCIDm01F5dWGAoPdQsD7vWbrzTJMWEomj9RP6GH1?=
 =?us-ascii?Q?mpM1BoJMVbOEaUGWPDbEf3+nn8PPf6xprY444Pp3J3RVObrKb7VDcHG3LR58?=
 =?us-ascii?Q?sXYGIYCUsbLNOqcK+r0bYUikXdwhZAXpGOgV8VGCjCQ+CLDUK3gCjHUcClzU?=
 =?us-ascii?Q?tN9TmBzdV44ZNI7RS1HMItCFwhKaRhMUgqu8EhGSamauOLZYOEBiUGeKRjLm?=
 =?us-ascii?Q?Uk9QnEd6BWof3TAFYkYI4Pg9zCV+0crJR8AearnTgon2LF8X6K0YAfO4p5c+?=
 =?us-ascii?Q?C3jVyO+kgZIGYubu+nqMF01dQPcec0s6JYMcUEUPKxMu12pfWa6Sk2Rqqbu0?=
 =?us-ascii?Q?c5yvdI9gWlXUNo682N9E7UAVpYChYY5HPWugVfgxr+Lmkda85AkngalgxDgJ?=
 =?us-ascii?Q?W/VhU9Fx1RUujl187dNOStbiZy/dwlmfaqeJ+n+5BFeKA0d6gm0ZAIT7dc0J?=
 =?us-ascii?Q?YBlMA58alyCNhqG3ZUTwrXn58KmY+yl+xQzjZoR3FNZV6UNvUa0qRJdyqYfn?=
 =?us-ascii?Q?Pv7XR1MLaUeeA/2tRuBlgc5dfBaILwY4fF9BjHNMPrFFMHmYPQvIMXP85uEI?=
 =?us-ascii?Q?7xB1ZEWC1/wx2YUM8ZzFEsFK99OVCXQjDRVEfFc2hsq69VS7Bb7Fo0UQkoCx?=
 =?us-ascii?Q?9/bSVdTyqRMxpXlahQmCvinRW1d9y7g1WFIQJVDnphGzLlCg0oQQZhiX/ggo?=
 =?us-ascii?Q?pQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 097b21f0-6921-494b-3349-08dc1df22b27
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2024 22:08:32.2648
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ULH3KdrpBHvlMbo5NdZ9ksUEVICGG0+4xdTQYEurlD3gNTYZabSe6zOfFISSimWoDm9Y+HCLrIXnv9unSc4LEcNtORdOnLI7J2yhp+oLbxg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8351

Hello Sergey,

Thanks for the feedback.

> -----Original Message-----
> From: Sergey Shtylyov <s.shtylyov@omp.ru>
> Sent: Thursday, January 25, 2024 7:11 PM
> Subject: Re: [PATCH net-next v2 0/2] Add HW checksum offload support for
> RZ/G2L GbEthernet IP
>=20
> Hello!
>=20
> On 1/24/24 1:21 PM, Biju Das wrote:
>=20
> > This patch series aims to add HW checksum offload supported by TOE
> > module found on the RZ/G2L Gb ethernet IP.
>=20
>    Your previous try was back in 2021, still the cover letter has the sam=
e
> issues (hm, I didn't point out those back then).

Thanks for correcting my bad English.

>=20
> > The TOE has hw support for calculating IP header and TCP/UDP/ICMP
> > checksum for both IPV4 and IPV6.
> >
> > For Rx, the result of checksum calculation is attached to last 4byte
> > of ethernet frames.
>=20
>    "For Rx, the 4-byte result of checksum calculation is attached to the
> Ethernet frames", you wanted to say?

Ok.

>=20
> > First 2bytes is result of IPV4 header checksum and next 2 bytes is
> > TCP/UDP/ICMP.
>=20
>    TCP/UDP/ICMP checksum, you mean?

Yes.

>=20
> > If frame does not have error "0000" attached to checksum calculation
>=20
>    "If a frame does not have error, 0x0000 is attached as a checksum
> calculation result", you wanted to say?
>=20
> > result. For unsupported frames "ffff" is attached to checksum
> > calculation
>=20
>    s/to/as/, again?

OK.

>=20
> > result. Cases like IPV6, IPV4 header is always set to "FFFF".
>=20
>    In case of an IPv6 packet, IPv4 checksum is always set to 0xFFFF", you
> wanted to say?
>=20
> > For Tx, the result of checksum calculation is set to the checksum
> > field of each IPv4 Header/TCP/UDP/ICMP of ethernet frames. For the
> > unsupported frames, those fields are not changed. If a transmission
> > frame is an UDP frame of IPv4 and its checksum value in the UDP header
> > field is H'0000,
>=20
>    I think you can call it just UDPv4...

OK.

>=20
> > TOE does not calculate checksum for UDP part of this frame as it is
> > optional function as per standards.
> >
> > Add Tx/Rx checksum offload supported by TOE for IPV4 and TCP/UDP
> protocols.
> >
> > Results of iperf3 in Mbps
> >
> > RZ/V2L:
> > TCP(Tx/Rx) results with checksum offload Enabled:	{921,932}
> > TCP(Tx/Rx) results with checksum offload Disabled:	{867,612}
> >
> > UDP(Tx/Rx) results with checksum offload Enabled:	{950,946}
> > UDP(Tx/Rx) results with checksum offload Disabled:	{952,920}
> >
> > RZ/G2L:
> > TCP(Tx/Rx) results with checksum offload Enabled:	{920,936}
> > TCP(Tx/Rx) results with checksum offload Disabled:	{871,626}
> >
> > UDP(Tx/Rx) results with checksum offload Enabled:	{953,950}
> > UDP(Tx/Rx) results with checksum offload Disabled:	{954,920}
> >
> > RZ/G2LC:
> > TCP(Tx/Rx) results with checksum offload Enabled:	{927,936}
> > TCP(Tx/Rx) results with checksum offload Disabled:	{889,626}
> >
> > UDP(Tx/Rx) results with checksum offload Enabled:	{950,946}
> > UDP(Tx/Rx) results with checksum offload Disabled:	{949,944}
>=20
>    Too many figures, I think... :-)
>    How RZ/G2L SoC is different from RZ/G2LC?

Just want to share with the wider community how the HW checksum is
improving the performance of various SoCs in the RZ/G2L family.

and the results show improved performance on all 3 SoCs.
>=20
> > v1->v2:
> >  * Updated covering letter and results
> >  * Fixed the sparse warnings for patch#1 by replacing __sum16->__wsum.
> >
> > Note:
> >  This patches are tested with [1] without the CPU performance is not
> > good
>=20
>    Without CPU? I guess the performance would be 0. Seriously, this is
> hardly parseable... :-)

without the patch [1] CPU performance is not good which impacts the
network throughput.

[1] https://lore.kernel.org/all/20240117190545.596057-1-vincent.guittot@lin=
aro.org/

Cheers,
Biju




