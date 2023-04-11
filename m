Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B7CA6DDE3E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Apr 2023 16:40:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229677AbjDKOk5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Apr 2023 10:40:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229801AbjDKOk4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Apr 2023 10:40:56 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2096.outbound.protection.outlook.com [40.107.113.96])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49D2DE1;
        Tue, 11 Apr 2023 07:40:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UKhdQQcULWJ2eOkBFPcwgLFf+CNJFcDXbfuA06M02ka0fEyV0HqpINNupDxHf2Jt79gof9bZL8W8v6OG92Sv/AHm3dowwEnzyh8rFZE62xXpt2JzOG26EUdIAhDVN7QDHit/8BFYbZnTXR8rYupMswLUC1YYdQ5EqzWzSRkVrJkuh+ojIjcVEilE1c25DwEaAIsimz2DvA3Xc8mmUnsFT9s9SmlGlw/AbZThgBwRe3XMnEXWFUQ6bq7RFjxgaNKOMPSgYSK6pcM2uJjlGRvtm8xUe27UGpbra9xPeU95j3T/0V2wCHVOVKvhP7UFPYdfBmg0jzk57Wlz4LHbm3Xnhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p+6fV6Rm4cMQQ7ttJ/GHq6yCj/9abHzQh0LVfmb9caU=;
 b=Afo/rhTk5D3LUkgVK9hiYjR0ODAbxz8TJ4NcUQc3Yak8qcQ/mvbol+thDQDj7w0ylT/OcSLd7xk/ljd5te1pGlRjwVxW+TDfd7Tdev7rZ54YIOrs8v8svdFnzjjnOjji+fm8M/8l5XASPARZdvwpQyJzak+oDFwlXtoKP9xGTbD0VJLX+i6VaQzdkR/iz6vTKoa2+aYUfpkX9pQguLdgnMDT5aeaR9eHmCsJlPveeefEw+bFVfq96MQUnw++/z+il3YpeKfDnnIw0gmEeEt22MkLq31cMXpzLqpPKQ69Yzh4zFQCjPLIemWmJXN9hn1INkVS013wjGu6AhfOEWbi9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p+6fV6Rm4cMQQ7ttJ/GHq6yCj/9abHzQh0LVfmb9caU=;
 b=UcYHozWj2QFJ6O4KaXFRRt1VDTfqtMmanY5caM1d+cjFWfj3RVx1+72WhDz6PauiqrwK+k/z2TcBUzTPeVND/ku7yg71P+vP2psGtt6nMHRhffcYBmcXDKnDsCWlB+mq5Obl/717bx5oLOw+i03eBoX/Wvr79aaEpgPNJ2FTPvw=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS0PR01MB5412.jpnprd01.prod.outlook.com (2603:1096:604:a7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.28; Tue, 11 Apr
 2023 14:40:52 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::e521:994c:bb0e:9bf6]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::e521:994c:bb0e:9bf6%8]) with mapi id 15.20.6298.028; Tue, 11 Apr 2023
 14:40:52 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Jiri Slaby <jslaby@suse.com>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        =?iso-8859-1?Q?Niklas_S=F6derlund?= <niklas.soderlund@ragnatech.se>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>, stable <stable@kernel.org>
Subject: RE: [PATCH] tty: serial: sh-sci: Fix transmit end interrupt handler
Thread-Topic: [PATCH] tty: serial: sh-sci: Fix transmit end interrupt handler
Thread-Index: AQHZbF2mA9ahXV82QUyTHfzm1I9HqK8mJzOAgAABW7CAAAUhkA==
Date:   Tue, 11 Apr 2023 14:40:52 +0000
Message-ID: <OS0PR01MB59220D9E0C52F5413046CAFB869A9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230411100859.305617-1-biju.das.jz@bp.renesas.com>
 <2023041129-skeleton-nursery-f9b0@gregkh>
 <OS0PR01MB59225DFD2073B3A6C8249104869A9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB59225DFD2073B3A6C8249104869A9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS0PR01MB5412:EE_
x-ms-office365-filtering-correlation-id: 91c1720f-f5a8-48ae-c331-08db3a9ac013
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r9k+vjARi6UsLSEyZnNQ3X7apfp5KiZnUI18wbZ0MS4SR+6pUsmAObrEPfAtB1FbTKGmuGl9eUkzyaRJHc1aYY891C9sWoco32Y2Fb54FOF4z5ABlR4s9GsPyFPaabOw7pNHpjAy3nJvg3b/7HRczMozw+1JGZH/PWRD1IzAysCiI1thXUgvk6ybJOZlE+ir8dZhxEJwv9HiFSRVwqtFEOYkNwXNRDGBnMrXi8G357lwNIYroTWg8YeA99tXsY7HJL9caAKE6etsNqJROX17jW2QpHBWD+6QvMDjy8Lc8c603K+uNEmAZZO9UWug5FBa0z3Jg9WQXVQyY4mWrwAt0MXG5lvcLO8G3PKICU+UfpXrIWajrNAFsV0v9zg/yZ5hPmEKQMUF2kxJAXVl/tqfiftIvJ6ZDPilsh8w7Hgoet75Vc1Z3Uwy85JkfHvMsy/EsvLBqCnGnTPUl4zPeiCHVhZMH8EDTFeGzANR0AjAS+4ddSy+wp2ry0mWmFNo0k5L4ahMteWSpX+bs0/hhm+Y27XIW+366u4WmpD8wA8mhLQ97clyvo6GNylUuPQb64za0+MP6C8fp/NFmN7eM8l0sj6X0ibrdZuOzDt0QKMnbuYjpbYsqV7i9Pi2PY5W6M/b
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(346002)(366004)(396003)(39860400002)(451199021)(6506007)(9686003)(8676002)(8936002)(86362001)(4326008)(52536014)(5660300002)(6916009)(71200400001)(7696005)(41300700001)(316002)(2906002)(478600001)(66446008)(66946007)(76116006)(66556008)(66476007)(64756008)(54906003)(55016003)(38100700002)(83380400001)(26005)(38070700005)(122000001)(186003)(2940100002)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Scw3a2PDDAb/WX27ypQUEZcXGcXsMe1oANDJ7smGt7qPdfwndARA9JfGRf?=
 =?iso-8859-1?Q?GZlSvVC89K613LuEhqKIP/PT/PVYmcZ5Oqr1RcAuvmg27S4R42la7qrVIv?=
 =?iso-8859-1?Q?AMxDyHYOFzc5WDohalcsh61AE+AoUv11kVPZoRj0GBQrswrXjIuDgHHNcu?=
 =?iso-8859-1?Q?+Lm2rj44SGy3Xw6/y+899BtdIQUlacr05IdffVHljLicXnEPucHRQq0ojk?=
 =?iso-8859-1?Q?KMUR3IIAzS6RUbfVIzpSzFXPQW/AiDs7CI+wn2+xDB87wTmBUPEpu4BiEb?=
 =?iso-8859-1?Q?smrZ97JM2nnpv9hDCNtnMTXqOtDPycWWtvbVvXKupgpJs640YKnlGiPNVv?=
 =?iso-8859-1?Q?hyF90TmD82J6PPNMRI6QihaYJ9z/PufF1KHti9akr6vtNGcl05Fgt9meu2?=
 =?iso-8859-1?Q?n2aU1feWnYlZmLZdOGGSoibYOvrhHeUGBmEyPFNTSs7t4IuJKlD9w+xafk?=
 =?iso-8859-1?Q?eqrixxu47Xo/UWsfcAI2PplAim3WiyKOX1Oprey0BXJ7tQfcnf/I7dJgfK?=
 =?iso-8859-1?Q?kzhkJdOrWNJB6kChoupNChOq1bLjQ3G33CKaewdvE+AMmumsXGwv6Kiav7?=
 =?iso-8859-1?Q?5bCTTmIMiUtVOS5c+26gbJopMFMli7p1iCDXufXUmfhPAml/RMkiMpodGw?=
 =?iso-8859-1?Q?R4c/pZfZUMD3o95chls2RbYzOWn5fBmNLa8AWosTh6/djf1HFsVu5sOvkO?=
 =?iso-8859-1?Q?KLu3PUb/KzMngVGxRSZrbKuTsTu4at4q01SdOGWFYdvc/BuUWQ/BpV5ZeA?=
 =?iso-8859-1?Q?5B2p6dxyuFtnAI7YVZ6A3bOzcyDHaLwrYahxDJTK4OoXrkeFLDILAZkFCQ?=
 =?iso-8859-1?Q?xpHNc/u6pxTuTe57usZsA4x0CetV8ce5ES+bkiQit/9qRMqljiyHgjeRRV?=
 =?iso-8859-1?Q?OEVjHI9wDSXGvf5ppvZpz5xy0fwvRA+OVQa7sqNDGb9TOUgi+zl2VwTlhl?=
 =?iso-8859-1?Q?mMatdemj81rY8m2FF1UAorOeOrPENhz5JODnlJh0oD1nFeSq9aUX5frCyc?=
 =?iso-8859-1?Q?X5+MfibjZGjooiWOYGj1Re16DbmFNFqAmOGz/DZqumDZiEdjGZmYMJ06+F?=
 =?iso-8859-1?Q?tv/Dq2ebFK1kBVZlZxAYThZK1gO3IDKVE+EUrrJ2LMBUDs4xGexWD2jd2X?=
 =?iso-8859-1?Q?cFCW00pMHJYhX7In+7x4UvMUp1dhTqFCWYCmbBJuuqq7GHILk9j9MX2scb?=
 =?iso-8859-1?Q?lxL3OHKAkhuCw3e9C03As0wjgbIlQeH9PUjFBS7Urdxnuomcyk/fJtuhSj?=
 =?iso-8859-1?Q?SaLh9DdOA6EE9zARDVW2FGWkqYCXWznW7BPTvQwRCzCC5I8qqKpVpGjU6U?=
 =?iso-8859-1?Q?K4203TGpJtevb2odrcCaq7iZwKZpD2a3hDn6b8WVfaAeBa2Ztai93/ZuNh?=
 =?iso-8859-1?Q?HeDDaOxNS8t01kzxuOXwBtnzs3aJ4mVEkdETFZn47rIperyZcmA0Iviz5r?=
 =?iso-8859-1?Q?gRU0s3QV4Gk6At/iJMPztbaqBgh8/rjnNTMnkUVd/XXHC2OJmFBAD6PTN3?=
 =?iso-8859-1?Q?ZEIvE1gY+MfOmaTw0lnbcTwTvZXkH29+j8QTbielo7BEhfYRmCwzxybmgU?=
 =?iso-8859-1?Q?VH9Dx583Z9nda9GpLYlEiZFnY3d1zFQhUfOWS+eNk+EhLrezTRzOoEWH0F?=
 =?iso-8859-1?Q?X4jojyVDCek/tAY6wT9E872m5GOHR+FBXI9fiiDJSPRO8h5WeMylBSxA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91c1720f-f5a8-48ae-c331-08db3a9ac013
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2023 14:40:52.4808
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: shXeFqENMZ73trKUQAZO/mA9FG2/hSpoQFbr2DQioNJwwagKo/w1ZeNaJ8umdu4Hh6+XD1OVYJdJ9QfCVtHJ6qIJuUQOubGGEs8scpPswnw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5412
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Greg,

> Subject: RE: [PATCH] tty: serial: sh-sci: Fix transmit end interrupt hand=
ler
>=20
> Hi Greg,
>=20
> Thanks for the feedback.
>=20
> > Subject: Re: [PATCH] tty: serial: sh-sci: Fix transmit end interrupt
> > handler
> >
> > On Tue, Apr 11, 2023 at 11:08:59AM +0100, Biju Das wrote:
> > > commit b43a18647f03c87e77d50d6fe74904b61b96323e upstream.
> > >
> > > The fourth interrupt on SCI port is transmit end interrupt compared
> > > to the break interrupt on other port types. So, shuffle the
> > > interrupts to fix the transmit end interrupt handler.
> > >
> > > Fixes: e1d0be616186 ("sh-sci: Add h8300 SCI")
> > > Cc: stable <stable@kernel.org>
> > > Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > Link:
> > > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > [biju: manually fixed the conflicts]
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > > Resending to 4.14 with confilcts [1] fixed.
> > > [1]
> >
> > You did not actually build your patch, as it breaks the build :(
>=20
> Actually, I build the patch, but did not test it on target as I don't hav=
e
> the platform to test it.
>=20
> I got some issues while building modules which is unrelated to this chang=
e.
>=20
> Anyway, I will double check again and confirm.

I confirm, there is an issue with this patch.

I disabled building modules from my build script and it showed the below er=
ror.=20
So I would like to drop this patch for 4.14 as this header file does not ex=
ist for 4.14.

drivers/tty/serial/sh-sci.c:40:10: fatal error: linux/minmax.h: No such fil=
e or directory
   40 | #include <linux/minmax.h>
      |          ^~~~~~~~~~~~~~~~

Cheers,
Biju
