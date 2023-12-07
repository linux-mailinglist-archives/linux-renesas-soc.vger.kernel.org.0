Return-Path: <linux-renesas-soc+bounces-793-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44ADD807D05
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Dec 2023 01:26:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC48728160F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Dec 2023 00:26:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42C9936B;
	Thu,  7 Dec 2023 00:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ORBIM6XT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2114.outbound.protection.outlook.com [40.107.113.114])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CED8E18D;
	Wed,  6 Dec 2023 16:25:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CTLQn0BqVTzAO4c4ZTrmfapj2Zt7zcAU4s67MGPZdpo4Snt+zuwCuQY7PWuQhK+r3ciEPfEP2HZ3d5oSvqwYArVwq3JMOiN2bDSLEHSo8Rumn+J4H3RHZ+FBGCFQm+Bq5B/iSrOYewE3akAruv6ANkxeXJkpQokmbjdvMcS9RMZLuzFLY8zVqo3HRUlCkSza6mVvu0Pq2/f3M7uE+qs6RGR6xYt2+vcuaqoVV5ZsspdKEOUCRKDgHFqvsANCFQz7oxxc4DuWiXJ1nnfLDDlOxCEvmuSHS21pDwg0bZmRy6dxEwnZW87LCJcHnVaNF6Ij8hRzOQwaPC3QCnOLekVS4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wjj+KdWzaZ7W+Aqo9+wOoLb1C80olw6EJAM3lOJoaMc=;
 b=mp+qwTCkXIVMwJasBoMl5tFIwZH1YNvo5DcRTkTNfvGfQ4KfpGOSkUJ9PpsVMhI1Suln4Ywho9t9fc3pABFJNgN0TmLIkk2YQ7ahOkOOTQ+eccHqvYuxg6p8OxFSD0bK0h329vN5Yna28Xvd3ZTNZTaFwLywVDwI7x9WHtK42zF9h8PZ6KMhHK8U5zpZO2XBO0xx0kz83JpGQXmEQ4qp6pemA8mecZWv4j2+dKCxXGXIC22kUoLuJoFbvZ2Ch32hkpHu5aRviqva/SqZnYkDnGEzDnoSmdQoFBg6p9qRrwKTuZ2EEOztD/Muzed9O3lUDI+pICTDMGQ4uF1GelqsXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wjj+KdWzaZ7W+Aqo9+wOoLb1C80olw6EJAM3lOJoaMc=;
 b=ORBIM6XTzEqBCxRwYGHUkvvjiij1rmI9shq7Pc53CmWuH4g5zPVc3fE2Cdq6hDosJs+7mluk2/SXee3AFCCcorGWlM2jwUMKakoVQdMvl7nZL8AwbpH6f431q1bVy16bcIVk5dz6UcmXB32RQsywpxt3WFsk66UGmQMmWiLcovo=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TY3PR01MB11431.jpnprd01.prod.outlook.com
 (2603:1096:400:377::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Thu, 7 Dec
 2023 00:25:54 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::50f5:eb2b:710a:b7c7]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::50f5:eb2b:710a:b7c7%7]) with mapi id 15.20.7046.034; Thu, 7 Dec 2023
 00:25:54 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Simon Horman <horms@kernel.org>
CC: "s.shtylyov@omp.ru" <s.shtylyov@omp.ru>, "davem@davemloft.net"
	<davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH net-next v3 3/9] net: rswitch: Use build_skb() for RX
Thread-Topic: [PATCH net-next v3 3/9] net: rswitch: Use build_skb() for RX
Thread-Index: AQHaJlAmDYJjXN3A4UquWgEUJMZea7CcomwAgABYUEA=
Date: Thu, 7 Dec 2023 00:25:54 +0000
Message-ID:
 <TYBPR01MB5341F67A3FDC5097F64AFB7DD88BA@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20231204012058.3876078-1-yoshihiro.shimoda.uh@renesas.com>
 <20231204012058.3876078-4-yoshihiro.shimoda.uh@renesas.com>
 <20231206190758.GZ50400@kernel.org>
In-Reply-To: <20231206190758.GZ50400@kernel.org>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|TY3PR01MB11431:EE_
x-ms-office365-filtering-correlation-id: 05216796-05a9-47dc-6129-08dbf6bb130e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 NIwAJFf9v5yDvBb1+rh44DCrJr5V3zjLcibwZXgw1m0JJhEQegZ6dn6+TP6pDR1A4rCT9+o8xggrWi+6U06PWLIz7pAa7L4vfPqQ4MIhEMwxHN7SbEjZKXvu6DAreOXX24GG7FslC5iLVQ5txKLyQfCK/KpzqJukxPxEttT5mTND/aSC11AgwTmkCrkZStimiTeZCuOJR0qkS0fWYDBzq7NuKVaQlQpKK1W39klZuOiA/lHtl4bmv9rIcUDKpxpiQlnh/h0qKAn/saXAtBmphUxJfWIhdBis82nof+BcE3paW/j/DObkEzYjMTsHdZG7VE/mcbXUNMkb9OqXEOaIkoJ/oroD8KpYis4gJ8ZQ/Lr5Qpk2Prc41BPlxmrAphec84Ob7ocTZdZqI5miYrTLLsRbLWVSjMLkhCzU+wxJ5Cs8RuyC+5i5fggep2VFcadcC0Z40Em3BDkWPzFQ3SaQ+T8/HweqDDEGuAg3ZHensojp42prrW1cnVbkT4TSeb4VQyJ73CzeRhdSBAinPX3fdycloqaupxj249XFX6jd1nxImxiQq2qzglMma9uwE/f+zQ7XuBV7M2KG347/55JWIx+6u3p9T02RGHywNLZmAo64rIN7OsY+TA4D9lSgMy11FmjfALDwDTDpfZ+tB/Slxw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(396003)(136003)(366004)(39860400002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(55016003)(122000001)(38100700002)(33656002)(38070700009)(5660300002)(71200400001)(2906002)(6506007)(7696005)(9686003)(41300700001)(66946007)(4326008)(66446008)(76116006)(478600001)(6916009)(86362001)(66556008)(54906003)(8676002)(52536014)(64756008)(66476007)(8936002)(316002)(83323001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?x8KFMwluqZdz6w98LTL4hlgkTktpHHUNV52NbxweEO7iatSfoa4f/F1iLF5Q?=
 =?us-ascii?Q?+QQePdXeaHO5C+zcC1oJ/52XHKXcqGEjTyTjBbgquwxIQmaXysdwb2z2oFEN?=
 =?us-ascii?Q?eizfIshsXGliijLbFnH+F7GK8Af8dJ69k741rnxA/PFAqMjgITaB6IZ54vr2?=
 =?us-ascii?Q?cE7JSD7GKCWcjOn/AZAe/3PyUMXFK4aRQwqhUsOySuVSXlK5YC3RoYK5S7MS?=
 =?us-ascii?Q?P9TOthqWJIqC69WyDPY3+6/qSd9EXrDuXN6vhbWQlnb4ltMOk0lhEq3JsWU+?=
 =?us-ascii?Q?NLTXpMSr/1AtZoyjw9yZR0y6s4iLDPjgU2yciorYqT+QhI235Dj2odiWZ6Q0?=
 =?us-ascii?Q?dK0Ts7KJLj2qwu3chzM+qFIK8setPtMOSiq/t94+ag4DLor1rhnu8PEeMfGn?=
 =?us-ascii?Q?VNj0mLc6Elp0zUrLVd/BqNeFnY8D/iMIZb4VBvcM6hN/e/HJJK3IylfmoTDR?=
 =?us-ascii?Q?2ERwlDr+ZZlXkcH1ZZ5S8/4aMs46HBKEaEylmBjzCAMFgaLA90TQNU7xchsW?=
 =?us-ascii?Q?Umfug80XQEgg9y1v22MSwgNwSKRXlei45SWHvHHOMF3qHtWfazTXbimj0g7g?=
 =?us-ascii?Q?C7T7ir+ocYTdiBXUMgqAgJrXby4mCmIUMoE4KVQx61KpOjIXonnLrYtBICen?=
 =?us-ascii?Q?bhUl/iel7wCGvFlNrdDtpf78QxdfRJSSs63spTRiZtJSlqzAC/UZ28UXHojr?=
 =?us-ascii?Q?BxkWspXgO2OjBDBVZPj6Hr9+NfCQXogA3UYYB/4SAr5BdjILNrVugFECs6LX?=
 =?us-ascii?Q?1zV1wxq5O6fBKv/ISLI6z/zWYrgDYspULRYJcCLwbk5bUeE7yuIdRQs0OcFx?=
 =?us-ascii?Q?poi88QgrBSqRwBBl/p2weCBVsP9mYCpPkx9j47lbIGR9ueGKjPacxXIWA8+F?=
 =?us-ascii?Q?SdhYleHh37gPrLt1mxFV3xLt3oGxjEuPVm3MvgrKK/lszVOMBmdtLiq7uHD+?=
 =?us-ascii?Q?HkhHU7y+Ten+68UtSiNT3W0RTlxMrDJ7kBzP+Uis8ToTciJhaGCjU6z/ZZTY?=
 =?us-ascii?Q?5nfAIQYdoJRfYeouIhtAupdk+goeC5ZmqwlCW0U2Us1PueGZUPUDe9xZptwR?=
 =?us-ascii?Q?4h61CvqWlH/rmdANork8yYuhQ+LkYr/pSdB3FCNNoSy1ycmOxdusiIW+OF4C?=
 =?us-ascii?Q?yNiYKy0NS2AR/DmvuZePLbIypnRaD6VmL2cwi+Ad0ZeDmaSS5hNchLNGf8fl?=
 =?us-ascii?Q?McV9yFBHRnLEWxkxA4Xa43eq0hDDODIKViaKM80AZyWxrPB5Mb/HGbOji23f?=
 =?us-ascii?Q?UYK7ignKznH7/u5kCKE/4Md4RlvXGqrBDB7zoWfXJ6tyQrZGvg3NJD/Q9rOa?=
 =?us-ascii?Q?0G6R+DMgMkKhAe/Bz9OZ/QGsy9904mAhPK6GkEaVajLznEYRc9KJppgIZFY6?=
 =?us-ascii?Q?tv45iTcd0eekWNdPa6jbh4IOsgWWhnaaOzEKHbxhUoMjeKuYItC+VIX1Sqfo?=
 =?us-ascii?Q?Yw6EmZAAgA1WNWyN+3dGzX1SPbxCXJGgrL5UggzQIAUDWb2QFHqCH+walLNq?=
 =?us-ascii?Q?nxhZqjNo9O0LAxSkPyW8RISWTzKnhhWNwvTzZFHwa5m7nVUImePbXlVA/KY3?=
 =?us-ascii?Q?ItWVjbqd+K4nrgPgn/xCMiI5iwyEc2wGX1A1aJWMDo0tzwV6fYW7D65WvO2f?=
 =?us-ascii?Q?6CVPNoKjiY6cLYKwbewWlTMq4y4LhN+uJkecg2kL0Me1f0Lopb23NSfFSBqf?=
 =?us-ascii?Q?WO4A0A=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05216796-05a9-47dc-6129-08dbf6bb130e
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2023 00:25:54.1767
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DS4+E4EfE4sW6Vl8vY8NEArfIbhCECkVw787YsOGo0jAmKbJ9eZLx5lw5iDCuKNJkJv3C09RniaJAySXBNM4ukqQ0Hl/XLgcWqk41XiW/PBRKP9G24jefd8f2+3kE9Fx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11431

Hello Simon-san,

> From: Simon Horman, Sent: Thursday, December 7, 2023 4:08 AM
>=20
> On Mon, Dec 04, 2023 at 10:20:52AM +0900, Yoshihiro Shimoda wrote:
> > If this hardware receives a jumbo frame like 2KiB or more, it will be
> > split into multiple queues. In the near future, to support this, use
> > build_skb() instead of netdev_alloc_skb_ip_align().
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>=20
> ...
>=20
> >  static void rswitch_gwca_ts_queue_free(struct rswitch_private *priv)
> > @@ -308,17 +308,19 @@ static int rswitch_gwca_queue_alloc(struct net_de=
vice *ndev,
> >  	gq->ring_size =3D ring_size;
> >  	gq->ndev =3D ndev;
> >
> > -	gq->skbs =3D kcalloc(gq->ring_size, sizeof(*gq->skbs), GFP_KERNEL);
> > -	if (!gq->skbs)
> > -		return -ENOMEM;
> > -
> >  	if (!dir_tx) {
> > -		rswitch_gwca_queue_alloc_skb(gq, 0, gq->ring_size);
> > +		gq->rx_bufs =3D kcalloc(gq->ring_size, sizeof(*gq->rx_bufs), GFP_KER=
NEL);
> > +		if (!gq->rx_bufs)
> > +			goto out;
>=20
> Hi Shimoda-san,
>=20
> there is no need to re-spin because of this,
> but I have some commends on error handling.
>=20
> I think that for consistency this can just return -ENOMEM.

Thank you for your comments! I think so. So, I'll fix it on v4.

> Or alternatively, perhaps 'goto out' can be used for the (!gq->skbs)
> condition below.
>=20
> > +		rswitch_gwca_queue_alloc_rx_buf(gq, 0, gq->ring_size);
>=20
> Not strictly related to this patch, but should
> the return value of rswitch_gwca_queue_alloc_rx_buf be checked?

I think so. I'll fix it.

Best regards,
Yoshihiro Shimoda


> >
> >  		gq->rx_ring =3D dma_alloc_coherent(ndev->dev.parent,
> >  						 sizeof(struct rswitch_ext_ts_desc) *
> >  						 (gq->ring_size + 1), &gq->ring_dma, GFP_KERNEL);
> >  	} else {
> > +		gq->skbs =3D kcalloc(gq->ring_size, sizeof(*gq->skbs), GFP_KERNEL);
> > +		if (!gq->skbs)
> > +			return -ENOMEM;
> >  		gq->tx_ring =3D dma_alloc_coherent(ndev->dev.parent,
> >  						 sizeof(struct rswitch_ext_desc) *
> >  						 (gq->ring_size + 1), &gq->ring_dma, GFP_KERNEL);
>=20
> ...

