Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C8313CFFD2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jul 2021 18:56:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229845AbhGTQP6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 20 Jul 2021 12:15:58 -0400
Received: from mail-eopbgr1410120.outbound.protection.outlook.com ([40.107.141.120]:37024
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229675AbhGTQPy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Jul 2021 12:15:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E7B4wMSCKOQPkLJBPvodX/QRPgLQJqFwufYlfSk9yXNWI8YC4DQzxoRmw5t9DzRFKZaIbgSEG9tDmSGCxuc+OCkAMgUN8QyQnt/RRn5JPhi7HBZMEPPiAN0QfDRLthSsBxUirUfQRr7SkytBh8jhHefpDnsgsBOX/Op5yNquzHyP9NAXx6nxVKBATF43+58hT8yqN9oBQW2DknzRyupqZqZMChdkGUa/FgDDEW1diVnrMHv5g1wMG2xbaiJ1JGHrTinEAOiKtCtbTOshmi5fi6ahA3pLS4fCj0PdTRq6+lBLpwVf2v7ha1J1wgCeG8Pk/RKMRziIy0tfSeGdKmapwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q3ycY1ZOa927AeHkA99WT6LDybk4svld1+0H959stnQ=;
 b=L+NgKTspXfND7aVCs7L9qimtnk1kfUmehhdwTTueKLkzB7S1tao8EsmgjNd8aD4hRHrPELCl4ZpkZXPm2JUr4aG67e2qVDmV6rfIpOZSpGuSfcVOsNFbOjZTY9VlClH6N8sfimgpm3jvRQoLk1JxtQKFsQxamJo3iSLdVNdsRNZgBwU+4WUbeikVUcMVzBexHDOEOdT3lQTD5ObnbKfl/1h3r+rzugRsguGuvdn4XQe+WZV99gneL0DPMWGR1uhLb51lmUnCpRjWs2OwIWC39mfeBNMkyhPZ5wplrp8NJTTNbv+8wHHZAafLFX4RTedCm6YEyJxGrJvh4y5YH9CRJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q3ycY1ZOa927AeHkA99WT6LDybk4svld1+0H959stnQ=;
 b=mksMsJB1a2AhJq8zmwUmq5dxI8VSC83Jh5DPoyjCSA92pPGvtrw7yGRTaMd8wxQji+T8pwZtZEgtp+6YrWKQVfTN2deaOUkIXdSDN+/NWxYYKdaG6scw6H6Xci2FU7Qs3ZgXM6GjiOGhshcTui3jji1i13VJiQOzCMEbANvCQxU=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB5959.jpnprd01.prod.outlook.com (2603:1096:604:d9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.24; Tue, 20 Jul
 2021 16:56:30 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe%9]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 16:56:30 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh@kernel.org>
CC:     Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH v4 03/10] dt-bindings: reset: Document RZ/G2L USBPHY
 Control bindings
Thread-Topic: [PATCH v4 03/10] dt-bindings: reset: Document RZ/G2L USBPHY
 Control bindings
Thread-Index: AQHXfJhh/kDhqnmFpUiBOlWmBuVtv6tKbB6AgAFOejCAAFcQAIAAA57g
Date:   Tue, 20 Jul 2021 16:56:29 +0000
Message-ID: <OS0PR01MB5922E45FB6E607347424447686E29@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210719121938.6532-1-biju.das.jz@bp.renesas.com>
 <20210719121938.6532-4-biju.das.jz@bp.renesas.com>
 <1626708479.397199.1967264.nullmailer@robh.at.kernel.org>
 <OS0PR01MB5922E245F143076435A9000186E29@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAL_JsqKPA5XUhWHBTtNEmA_aqHOyUt_woEB79WKgiFWRn7CT7g@mail.gmail.com>
In-Reply-To: <CAL_JsqKPA5XUhWHBTtNEmA_aqHOyUt_woEB79WKgiFWRn7CT7g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 049a6c14-fe74-4109-e3a2-08d94b9f523c
x-ms-traffictypediagnostic: OS3PR01MB5959:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OS3PR01MB5959657DD9FC459DA683097686E29@OS3PR01MB5959.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bH3n65znFm7NJirHIUX87zwATXOXt/9Rih/AME1k+cj8LoEnk3lLtln9widuA7qyihrxgc8ntprQLd1xlHrCsROdl2lZURj0ajoFTUcUVJlyvMqzWzpf8m+MaW/HSVCcpxl0Z2UrA3g35DL1BzPfqXiCuUHVO+kj5MmuLZhHlQ3iVJGvh6xY8spdzbAZdqZDYWvEmiQRHrTvUJ8P+8U0qdnALZh8PbjEdl0rLOLmvjcla3agqamniUd8Sm4R2zzV+y0htxbbIPwyw9bgtl605s1hFKkUowCkTyF6+/l+zZKmpx1gQUv7ZmnPcONkJULbDfNNphQxhomaYs6kqyaheBWrvhU2lcuYfaMf7SFT6G4S6wntQn7Rt6j/70aBzfkO602B/w2AAlD8onyJxlV1DoUeYjsE7y3AkFS9fC2l2UtnNn+/fBWr7xjQHPF4PsU84tOoFBokURATJ5g5E3VpzlhHyeeLFHiHAJ7sp9FJ6yjVkuN/Vz56EDAHKlvoiHGipguXWUA+UtXsOpCSpg9wSUuu78+LzGmP19R046eJWjzm40ulGjOtF2WnONvsKmYcVz854kUhCl99im2v5WsAXZ3+hfO9MChdEoGCky0PwlI/5wvuVD/z7i554R4gSqIkPo3azil+fFx7Xw3GFeT3HwKX7VQaP65Lqq1BPr5gpx+WmdhWk4AT1jZKjw1/AxsRKFE8MGSZetvWK7esy6INxcaCjhY4xuem7KWKeP1OE/S1wfkKx1bN7tFHkcfPGVPri6OxIne+pQTfCDwmr6vX9vaTdtqHnF4phkCB9D+rHQI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(7696005)(186003)(4326008)(53546011)(2906002)(38100700002)(83380400001)(86362001)(54906003)(33656002)(122000001)(316002)(71200400001)(26005)(45080400002)(5660300002)(66446008)(8936002)(9686003)(76116006)(66556008)(66476007)(966005)(55016002)(6916009)(52536014)(64756008)(8676002)(508600001)(66946007)(6506007)(38070700004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6k9srf0t3wTFKq73+NNCazYWlAcGslIrpJzZrPhVbeVLO/xty6GhBlXyKzWR?=
 =?us-ascii?Q?94fjifzEtqY2v1MWcFZ1CSV8z5rEA9IYWSfWvN/Or6XbBzka4/6C4TFKO83v?=
 =?us-ascii?Q?3JyNAK9yBU34wblo54DRj8Md7IfiGLM0U4uIfadZeg5DJZzaJ2xhNywPtR6a?=
 =?us-ascii?Q?XAWVrYUc9qFoFfOiFj7DwTUE1dtikm9a6fLGa7uPzJW6SRwjQjM17iH27zt7?=
 =?us-ascii?Q?8jcmC2TSH1SKjmYJ1U8fB1pQkPRMfbY/Tk/Iavv3+gEBN8audCqc/1pwguyU?=
 =?us-ascii?Q?U+jRtpTmK+eiZJiUN5yaTYhe36+J0Svf+qHRNJm06Cvf1v2JisszMUqa5ZeU?=
 =?us-ascii?Q?m3WEYC84q29gL3XMnZClwv7P8o0PVKH+TALkY3OA3dMMgiurGenBfZgmUasm?=
 =?us-ascii?Q?WblpstQ8HhqipvInkl2HBoD25RGAMlUKfn2QWXtWr5kDdVmXwvIpaBmQGbCR?=
 =?us-ascii?Q?Y0pr5G32x7MxiAjlw8UYolRw2jWXYUdxwyIQa86j+7q2oWyyzn0o5RcqX0ml?=
 =?us-ascii?Q?fvgR4+LOri4uPuu0+vKEMD9/nYQMKahLD/T3fTqK6a0kzT+zXeED5/GzZgdA?=
 =?us-ascii?Q?XGC85bEFZSEXwxiYM5J3PO156kvr64UoV01ix1tOr1AlUKSQ5a8DFa+hZk50?=
 =?us-ascii?Q?Vnx/k+IDSCZbYXKs06VGIA8fXcGpxEAmuiUQAoEeVW+Ju7TmrfqJrbVquYPO?=
 =?us-ascii?Q?A7Fd4A7QabLupqOVlOV5FbiRTp1b1VdSsN2ZMXjjApSIpzNYy2DQGXVx2qKm?=
 =?us-ascii?Q?TfrAOfkOWyMuZPDlrekyyrAjVt2HjrIN/pluMkuaeZh6Aprx2WJ3DKCGT6A5?=
 =?us-ascii?Q?suZedrBBxI2BXTFowMz1/KLlndDsoscA/RQEa5RVeLN45jC0q087lFxgk1Ra?=
 =?us-ascii?Q?375CkOI55lLgFYNwa75QBdqsis7+Kco7UJAF5xSRRI06MKb4rdY3LGJD6Cw/?=
 =?us-ascii?Q?0u/ouVxTAGE5PktJBkEdIJ2omF0rq+YhNDZLXqgNw00hnxgh7bp+qUL95+Cz?=
 =?us-ascii?Q?oWrZrG7fJvISkZkRxx2dcjW5akgLZEKX1TcJSWGi2yrqBz20O+tpysjFgmb4?=
 =?us-ascii?Q?AyUkNiPoOufAA5y4YQOcMnnbNoRROOb2d08oztcHiJNaf5UyBWxLwrnV+w9p?=
 =?us-ascii?Q?4LSpO5jmCMW3Yza81dtbtDNq3X5sPMOrzvCP6mv8pxZFRbWln/ZzJDSUvX7R?=
 =?us-ascii?Q?8s0JpA8wZBuCLkWYihxIxGm9JPcq08JAnyHK4SWji8sySSfr53iC2BWednQm?=
 =?us-ascii?Q?XqQMR8YENM17xNVkfPy5q58HgXQkTeuWekpVijZ/uFAuJJpeluAU/vdqz9lr?=
 =?us-ascii?Q?CtN35u09raEWTNMV40ZbUz8q?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 049a6c14-fe74-4109-e3a2-08d94b9f523c
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2021 16:56:29.9608
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RuXBkPYrC1wmPERlTqzxw6ggFz71483XlAbUTq30482KcMgmo7ezFjj433rmQhJ4+ef7Onsp4XBYB7K15py0UQ111i+zsMcRq7AoNCethis=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5959
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob,

Thanks for the feedback.

> Subject: Re: [PATCH v4 03/10] dt-bindings: reset: Document RZ/G2L USBPHY
> Control bindings
>=20
> On Tue, Jul 20, 2021 at 5:26 AM Biju Das <biju.das.jz@bp.renesas.com>
> wrote:
> >
> > Hi Rob,
> >
> > > Subject: Re: [PATCH v4 03/10] dt-bindings: reset: Document RZ/G2L
> > > USBPHY Control bindings
> > >
> > > On Mon, 19 Jul 2021 13:19:31 +0100, Biju Das wrote:
> > > > Add device tree binding document for RZ/G2L USBPHY Control Device.
> > > > It mainly controls reset and power down of the USB/PHY.
> > > >
> > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > Reviewed-by: Lad Prabhakar
> > > > <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > > ---
> > > > v3->v4:
> > > >   * Dropped reset reference.
> > > >   * Added Rb-tag from Rob.
> > > >  v3:
> > > >   * New patch.
> > > >   * Modelled USBPHY control from phy bindings to reset bindings,
> > > > since
> > > the
> > > >     IP mainly contols the reset of USB PHY.
> > > > ---
> > > >  .../reset/renesas,rzg2l-usbphy-ctrl.yaml      | 65
> +++++++++++++++++++
> > > >  1 file changed, 65 insertions(+)
> > > >  create mode 100644
> > > > Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.
> > > > yaml
> > > >
> > >
> > > My bot found errors running 'make DT_CHECKER_FLAGS=3D-m
> dt_binding_check'
> > > on your patch (DT_CHECKER_FLAGS is new in v5.13):
> > >
> > > yamllint warnings/errors:
> > >
> > > dtschema/dtc warnings/errors:
> > > Error: Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-
> > > ctrl.example.dts:25.30-31 syntax error FATAL ERROR: Unable to parse
> > > input tree
> > > make[1]: *** [scripts/Makefile.lib:380:
> > > Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-
> > > ctrl.example.dt.yaml] Error 1
> > > make[1]: *** Waiting for unfinished jobs....
> > > make: *** [Makefile:1418: dt_binding_check] Error 2 \ndoc reference
> > > errors (make refcheckdocs):
> > >
> > > See
> > > https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fp=
a
> > > tchwor
> > > k.ozlabs.org%2Fpatch%2F1506961&amp;data=3D04%7C01%7Cbiju.das.jz%40bp.=
r
> > > enesas
> > > .com%7Cb02057306f9b4db2426008d94ac9ce37%7C53d82571da1947e49cb4625a16
> > > 6a4a2a
> > > %7C0%7C0%7C637623052878040806%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLj
> > > AwMDAi
> > > LCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DN4%=
2
> > > F9GofL
> > > NWbtPDddI38ActeGRqtfxdNANC4T241Or1M%3D&amp;reserved=3D0
> > >
> > > This check can fail if there are any dependencies. The base for a
> > > patch series is generally the most recent rc1.
> >
> > The dependency patch for the bot error is present on 5.14-rc2 but not o=
n
> 5.14-rc1.
>=20
> Ok, I've updated the base to rc2. Please note a dependency like that
> (anything that's not the last rc1) next time.

Agreed. Do I need to resend the current binding patch? Please let me know.

Regards,
Biju
