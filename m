Return-Path: <linux-renesas-soc+bounces-187-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B7B7F645D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Nov 2023 17:48:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DCCFCB20E82
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Nov 2023 16:48:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1E783D39F;
	Thu, 23 Nov 2023 16:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="o/vsb6Rx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2139.outbound.protection.outlook.com [40.107.113.139])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD5D0BC;
	Thu, 23 Nov 2023 08:48:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IeeAOnd6eLeMADP7y6MHaalvRvl8nNpHqdGBfB+4oBLIgTpu13b184BDrw16HPAc3CdMk8oXF4NN0e0QQE2HVy8YRHq5dWq5yv84eqPDmilx8cGp7xcAem4oAwOLAVUTxs0BDQ6+NSZmh7uC3MIp+U5HK4mpydTWywk+iN4xFKmm4N2om/2TRycmQVANZpq7OrTY4qT2AYJErxI9OvSWRS58u0CSx00CGmdgiRbJq5IEJadr6xg/yNXQSoD8aGy1UKepr5QWzyYKqQ/7BLDXAypwuNS9utF8c9JjkyVkbu0aq6O43Gktann3pDleOjWNjNSXiFM7EQnYO5raJgzFOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LE6L9saRBjuXUhp7b0LfJHEL7/ULv6IAxNnNPFW0XQU=;
 b=kllDSq7mn9lJwug0zTOHrA4f9u/DvoIaCTi+cWEeqyWnNYQ9O2bgI0m0Sohe0rI4UDeROOh0ufGSP9QvXxuGuXiY2tIwVBEKZ5n4ikqaoTucJ16cjyTMkt1Mf5s6edQFwZ0YomKPDOe95FMuXw4he2jSFpjd6vbxIj0pvT9K/FNgQ2YlwfXUfwHcFPWMyw1uciq3UhRyhDLLmpIMo6Y0YX5dW4qUUR25io5EnLGEc01oYwskFwYvFVZfNe0yYR/ki9PXttR5WGgfRLS+yCFmYTvRJKasUEyjoeDtvrCO2VLRjG6sYEuLStObFuSw0oBb62viMLiTaMjtTmDJvTy8gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LE6L9saRBjuXUhp7b0LfJHEL7/ULv6IAxNnNPFW0XQU=;
 b=o/vsb6RxsIquAIvARK01zLAfSD8Ixpk/ZnnrfFN799PIksSxvM2f2t6qQQGn3vTWaNVlzyfBpjBE/MXPjEuiNbAayBWGqqQMB5Ng3LUh+4cd7Uq85VzxJJ1Iil30R5WemgmeHAyoMTbPWPVe/dUV/1ENlXNgpEZMoEQ4rbwx1Ug=
Received: from TYVPR01MB11279.jpnprd01.prod.outlook.com
 (2603:1096:400:366::13) by TYVPR01MB10717.jpnprd01.prod.outlook.com
 (2603:1096:400:2ae::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.20; Thu, 23 Nov
 2023 16:48:32 +0000
Received: from TYVPR01MB11279.jpnprd01.prod.outlook.com
 ([fe80::a19:f001:8736:9310]) by TYVPR01MB11279.jpnprd01.prod.outlook.com
 ([fe80::a19:f001:8736:9310%7]) with mapi id 15.20.7025.020; Thu, 23 Nov 2023
 16:48:32 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Sergey Shtylyov <s.shtylyov@omp.ru>, Claudiu.Beznea
	<claudiu.beznea@tuxon.dev>, "davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>, "kuba@kernel.org"
	<kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "wsa+renesas@sang-engineering.com"
	<wsa+renesas@sang-engineering.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"sergei.shtylyov@cogentembedded.com" <sergei.shtylyov@cogentembedded.com>,
	Mitsuhiro Kimura <mitsuhiro.kimura.kc@renesas.com>, Masaru Nagai
	<masaru.nagai.vx@renesas.com>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>
Subject: RE: [PATCH 06/13] net: ravb: Let IP specific receive function to
 interrogate descriptors
Thread-Topic: [PATCH 06/13] net: ravb: Let IP specific receive function to
 interrogate descriptors
Thread-Index: AQHaG44QUS+I6liACEqT0EASDs/QzbCIH5OAgAAC0rA=
Date: Thu, 23 Nov 2023 16:48:32 +0000
Message-ID:
 <TYVPR01MB112791203FFACF4484A9EAC4E86B9A@TYVPR01MB11279.jpnprd01.prod.outlook.com>
References: <20231120084606.4083194-1-claudiu.beznea.uj@bp.renesas.com>
 <20231120084606.4083194-7-claudiu.beznea.uj@bp.renesas.com>
 <b626455a-f7a4-2684-725c-c679dd75a515@omp.ru>
In-Reply-To: <b626455a-f7a4-2684-725c-c679dd75a515@omp.ru>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYVPR01MB11279:EE_|TYVPR01MB10717:EE_
x-ms-office365-filtering-correlation-id: e55e58f0-c850-44ea-aa0a-08dbec440744
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 N42Ucu0Px9AZgvvYFNvD+VcU/tddh4BGwbJJcSJAlCyToy53iXkrzBtrQpsXZ2d3985wjyngbPMiLznk9DyJNGaoi8QNUobBIMCz52TQjSxYZK8xMYeZUvYF1/JaWG2kzKoax6erVQkeEzna5jYVciK4kSYqpurMXmsXqynEaVal2jqkstInmyaeRngBZ3wUtZALi/Wa/8dsB/L8nDfnI3QLd6Sohxt5iFx/rYoUOBgg//+1POWAfSz2bbQXGdMYffT5owPbILcfrWFvKfF4oJT82Bdl1jVj7H2xTcjc1OjvKSL+S4MW/K4dNgQDgSvOPdw7f7AA2LZ9A1D+1f0MoVlZ2OzFSXHKbUAjVVOjNXd+36H6puZ00jWS+Fcuka33phvUwcVsklf+peOHGPhObyOb4ocx9JWIbQm/JRRv/QRIMeP/XrqfBXb29SirMbMEl/w9PkFyDaOAk3b5WTW2dZ6OGzxpXGhpPnonZbVbYVwBEDNlHfZvm+xR3HmtSQgSHKAJcYPQJP0mVn2Yzk5GlArdITukjga9azW1I/ZkUy7UgMHUUQHeLxYmlXXhNIHreMjw5SRIq5rAG+Gi9vEs0H9rCLn/qlN/AmU2rVNDAT+wACVl4SRP1kbICncrK2OF
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYVPR01MB11279.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(346002)(39860400002)(376002)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(921008)(38070700009)(55016003)(38100700002)(66556008)(110136005)(76116006)(66476007)(66446008)(66946007)(122000001)(86362001)(33656002)(71200400001)(966005)(83380400001)(107886003)(53546011)(26005)(9686003)(7696005)(41300700001)(478600001)(2906002)(7416002)(45080400002)(316002)(64756008)(54906003)(5660300002)(4326008)(6506007)(8676002)(8936002)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?pETZEQgwA296renR0B0ZBIvmG4j0uAIpjxgxD3Ga6sjnjY54KjvQ/Pa1f/Sq?=
 =?us-ascii?Q?JO7cK1A3PMx5jMFiMfPumaHGl1l/6uU2mWKDH+cgnIbwTH6BIu1KEuJVMPy/?=
 =?us-ascii?Q?8vUZx3fd0sCiNaU6K2Fl0FvdLjVjmZt72YYYOJp/Z7dp8IqWfVAhNqiVScDR?=
 =?us-ascii?Q?l4YsbXCNZTVy8361aQM+60dHUZJwdQXk2dQjXyoe9LyGzYThraU9ngxAjY0x?=
 =?us-ascii?Q?Xo7nIqf9y+28Nud377n2Kq2N41/4PzBNaJv0zgLtzfiAMiyswm4obCHUHsJI?=
 =?us-ascii?Q?p++gkqDKuIsqKjKzL+PZG63E0AKSwYQ/F5ignw6EyKMcXmhcZ/wrOpkQ+fN+?=
 =?us-ascii?Q?ojovGfdyKkc20ONpnHyqz2sUi+PQ3KgyOkjSjrlmuWBA4U/lP57DyeD18PUd?=
 =?us-ascii?Q?vNO6doX1MRxE2gE1mUO3QYU2/vwxHdorGw9pnEeu1rAd+OjnCWgLunnren7U?=
 =?us-ascii?Q?j73Pig29O1yJqomODBYvrdAJvhjS8BP/gLW0aKWDBjdjI2+IA1oQC/ER0/No?=
 =?us-ascii?Q?vCe/ngS9OfHfrmb+lLZyvJJe8ITtvJRJ5n6hHRUosQu8RBtxQJ48ACg57znH?=
 =?us-ascii?Q?g8zxOis6hw6Sr8NNTgms18sUovBkn4HDRZHGKPbHuHSmEDEXQO3ZKhKJdXGV?=
 =?us-ascii?Q?rqzMiPdJj2CNS6pNk06ofClLOR0917ei2C+HZf1OJyUA4LfHDg8eNNEgeGQZ?=
 =?us-ascii?Q?DOFb+kteAyfMbN3mlle1bvbV/ua4kEj93yiHQdzXzw7l6Mo2ymA1J+7l9uyh?=
 =?us-ascii?Q?6CjyejMv4haTXQM4hapI/wvt1gfPywV9uhN52wrmGeiKFqM/cs+XGSrtcYrO?=
 =?us-ascii?Q?3HQkUSdqTuoY9p+oJUmp+GqfzuJFiwDAI9Rp5lEJA+2T+zyGbYyilnrcwqjn?=
 =?us-ascii?Q?FWxSIAW8SO171WaXgE4DVxy+9+hqh4W/Hga26uZnYdIT284tE8cT4xNYkzvi?=
 =?us-ascii?Q?2f4NnYExc9GIs/Ucyqcg5wjDnjwICJCN7ZoPHuttnDiLpY+PLk8yGQlyr43i?=
 =?us-ascii?Q?TcbMVjg2fwFrlLXDuTFpSWlIZCyAs61rdViegQW/GB6/d1sObXeIGumCjDTY?=
 =?us-ascii?Q?9kWGgrGa4jzuUyM51TEENHpb/Kz/1tBwwY4ygvnbF3qtka05fuxH9r0VQ+Qo?=
 =?us-ascii?Q?dmp3+fXTPLDKbfv+Ybw8JwpM7O5sryQLj5/F5LnqI1OZibK2t7EKpVHC/wRj?=
 =?us-ascii?Q?DCODRjR3OspSjXCBZ5xJXsaQvPGrdTvGUTFoFrZqTOXeDaS3rEn/sErtSGzu?=
 =?us-ascii?Q?ooxmYMGqhJbBTVKUPJ9ywOOC/5EnJhn/jJYodYr+BAbMDIhsQC2fdcDdZ+48?=
 =?us-ascii?Q?r0dIk7jmihYnn0qh9CSO+tJDXBJT3KCnr8LvjWZpVjnrexcMQdvdLAW59spu?=
 =?us-ascii?Q?Vfrf+T6n9LnW6R6WgIlBF2yBxa3ErZywhq/oRQ/j36u+rfx3zPI97I1kw938?=
 =?us-ascii?Q?hnySPv7niJd0AG0+/hVY7u4KT5fSahjYgUEo+n5Vrlupe7828C0O59rqinLL?=
 =?us-ascii?Q?9lmfi1+XuR/Abv0f8lpiB7b5sjqNA4XvrQSUNj1UaamovFBj+V7gXTjljJXz?=
 =?us-ascii?Q?WYCzGrNvPjQlw51uD4fT8xJrlTZpJp2dlmyiIb1kY0wpTSTsAqPx/EPWZ30m?=
 =?us-ascii?Q?QQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYVPR01MB11279.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e55e58f0-c850-44ea-aa0a-08dbec440744
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2023 16:48:32.6363
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nFEmNjP1ujjOEHoduIEmx7gxzbskLTag7tZP6rsOL8X9MAA6oh96MMJAdWl24wRtPL/ONXz/rV1uRPsVwYF4cp2icHCdxwrE/yYlWDebgjU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB10717

Hi Sergey Shtylyov,

> Subject: Re: [PATCH 06/13] net: ravb: Let IP specific receive function to
> interrogate descriptors
>
> On 11/20/23 11:45 AM, Claudiu wrote:
>
> > From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >
> > ravb_poll() initial code used to interrogate the first descriptor of
> > the RX queue in case gptp is false to know if ravb_rx() should be
> called.
> > This is done for non GPTP IPs. For GPTP IPs the driver PTP specific
>
>    It's called gPTP, AFAIK.
>
> > information was used to know if receive function should be called. As
> > every IP has it's own receive function that interrogates the RX
> > descriptor
>
>    Its own.
>
> > list in the same way the ravb_poll() was doing there is no need to
> > double check this in ravb_poll(). Removing the code form ravb_poll()
> > and
>
>    From ravb_poll().
>
> > adjusting ravb_rx_gbeth() leads to a cleaner code.
> >
> > Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > ---
> >  drivers/net/ethernet/renesas/ravb_main.c | 18 ++++++------------
> >  1 file changed, 6 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/net/ethernet/renesas/ravb_main.c
> > b/drivers/net/ethernet/renesas/ravb_main.c
> > index 588e3be692d3..0fc9810c5e78 100644
> > --- a/drivers/net/ethernet/renesas/ravb_main.c
> > +++ b/drivers/net/ethernet/renesas/ravb_main.c
> > @@ -771,12 +771,15 @@ static bool ravb_rx_gbeth(struct net_device *ndev=
,
> int *quota, int q)
> >     int limit;
> >
> >     entry =3D priv->cur_rx[q] % priv->num_rx_ring[q];
> > +   desc =3D &priv->gbeth_rx_ring[entry];
> > +   if (desc->die_dt =3D=3D DT_FEMPTY)
> > +           return false;
> > +
>
>    I don't understand what this buys us, the following *while* loop will
> be skipped anyway, and the *for* loop as well, I think... And
> ravb_rx_rcar() doesn't have that anyway...
>
> > @@ -1279,25 +1282,16 @@ static int ravb_poll(struct napi_struct *napi,
> int budget)
> >     struct net_device *ndev =3D napi->dev;
> >     struct ravb_private *priv =3D netdev_priv(ndev);
> >     const struct ravb_hw_info *info =3D priv->info;
> > -   bool gptp =3D info->gptp || info->ccc_gac;
> > -   struct ravb_rx_desc *desc;
> >     unsigned long flags;
> >     int q =3D napi - priv->napi;
> >     int mask =3D BIT(q);
> >     int quota =3D budget;
> > -   unsigned int entry;
> >
> > -   if (!gptp) {
> > -           entry =3D priv->cur_rx[q] % priv->num_rx_ring[q];
> > -           desc =3D &priv->gbeth_rx_ring[entry];
> > -   }
> >     /* Processing RX Descriptor Ring */
> >     /* Clear RX interrupt */
> >     ravb_write(ndev, ~(mask | RIS0_RESERVED), RIS0);
> > -   if (gptp || desc->die_dt !=3D DT_FEMPTY) {
> > -           if (ravb_rx(ndev, &quota, q))
> > -                   goto out;
> > -   }
>
>   I don't really understand this code (despite I've AKCed it)...
> Biju, could you explain this (well, you tried already but I don't buy it
> anymore)?

It was initial version of the driver. Now Claudiu optimized.

Cheers,
Biju

>
> > +   if (ravb_rx(ndev, &quota, q))
> > +           goto out;
>
>    This restores the behavior before:
>
> https://git.kern/
> el.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%2Fcommit=
%
> 2F%3Fid%3D3d4e37df882b0f4f28b7223a42492650b71252c5&data=3D05%7C01%7Cbiju.=
das
> .jz%40bp.renesas.com%7C3c7d64ca68104738fb3f08dbec427e84%7C53d82571da1947e=
4
> 9cb4625a166a4a2a%7C0%7C0%7C638363542555838396%7CUnknown%7CTWFpbGZsb3d8eyJ=
W
> IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%=
7
> C%7C&sdata=3DlGBD8FdwY26OygYAV4Sd8bzIIO4rS7rNiYabQKaQAtA%3D&reserved=3D0
>
>    So does look correct. :-)
>
> MBR, Sergey

