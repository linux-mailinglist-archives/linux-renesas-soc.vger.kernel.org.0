Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3511C24FD89
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Aug 2020 14:15:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725906AbgHXMPI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Aug 2020 08:15:08 -0400
Received: from mail-eopbgr1300103.outbound.protection.outlook.com ([40.107.130.103]:6069
        "EHLO APC01-HK2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726627AbgHXMPG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Aug 2020 08:15:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J2MF+1B+6UHboKUJZIYNCY96EiiBZFl7+PjSbsbflqAOuWjUk/bwdL9ylAjZKBrU2iuvAhvbbyrYhZyLZEaE0ySSnJzQsLUYJjO+n5HN5tVekRl/QCuySdqumccgY8BW8X3QAPJf+JRr5R34ket/Qy5WjVL8u/QUHxZ7j0N3l0Pbkkz2ADiRnrI5Ty/Kkrttyz6oUqYLB+KIkJS5DZED4AotHZ9rEFnjuGqV14YCYmsoxKu5td/e1ijk/vHwrGhQffLlXdAHKvMLJd39apBJimfxjojzIqQkd0+4F+kAwOYacH3vNbEhYZf1v/dl1WyN3bc+cxiZcfvqFsloC2wMIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=umoUPLO83z3qGdsMcP7Sp2QJ8RQ57oI27gkyD8SoECE=;
 b=H5j95a6DUf7UerxxXwmozr9zfdDqrFtxlbVbgRCzL2Y0fsctffaEIpIdVe2402un46N6OnHTnrGA6pw4AIECKE3rEmmUCWYz5qFGGaueI1aqPM3DihXN7RLGizWlpd33u2f91VU5jiPVMKKitlFEwFNzKUCjP6RiXRIW1cnMdKLKjPwr4hGmlsN2GD966fxF2FsDF7w4/ximZ+oqjFm0YslsR8ZKiWn/nKezh4bt3Gdor6G50q/F4ksueZMkxJ9Nx7yrpXafIjD5wWKk9QxM6YqpB1qDRBlFoeiDw9mm2zCVNse25X8ci6f/C/mukHgCXAxBS+V1da5CJKGGA1OIkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=umoUPLO83z3qGdsMcP7Sp2QJ8RQ57oI27gkyD8SoECE=;
 b=CrK0WqWfA6tALensiISGVkuhjJd1nMuCIzv413I+YGHnxUWTUd9TnrkYq9Fie282NA13zW9+gR05JQOmrWhUzpfq7MVJjjFJFhdtxdAzvA6MZMmrD/of+OaqcN9ic4ljoqqdCngMuZ5rzGFczQwKUil3abOlHpS5FwfcQbijoNs=
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 (2603:1096:404:8025::15) by TY2PR01MB4748.jpnprd01.prod.outlook.com
 (2603:1096:404:113::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Mon, 24 Aug
 2020 12:14:59 +0000
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::c141:37ba:af8c:b2ee]) by TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::c141:37ba:af8c:b2ee%7]) with mapi id 15.20.3305.026; Mon, 24 Aug 2020
 12:14:59 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 2/5] dt-bindings: usb: renesas,usb3-peri: Document HS
 and SS data bus
Thread-Topic: [PATCH v2 2/5] dt-bindings: usb: renesas,usb3-peri: Document HS
 and SS data bus
Thread-Index: AQHWb7XJ1I14VMJHCkaYe4cyMOAsmqlHNFEAgAAAbsCAAApjgIAAALTg
Date:   Mon, 24 Aug 2020 12:14:59 +0000
Message-ID: <TYBPR01MB5309AF5A271AE94EC36E076586560@TYBPR01MB5309.jpnprd01.prod.outlook.com>
References: <20200811080227.3170-1-biju.das.jz@bp.renesas.com>
 <20200811080227.3170-3-biju.das.jz@bp.renesas.com>
 <TY2PR01MB36928D9A5BF4A43429662BCED8560@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <TYBPR01MB53094D6F8B941E2D94198A3486560@TYBPR01MB5309.jpnprd01.prod.outlook.com>
 <TY2PR01MB3692F94908BF9CD36A629110D8560@TY2PR01MB3692.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB3692F94908BF9CD36A629110D8560@TY2PR01MB3692.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: renesas.com; dkim=none (message not signed)
 header.d=none;renesas.com; dmarc=none action=none header.from=bp.renesas.com;
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4fd062ba-9905-4507-6bbd-08d848275226
x-ms-traffictypediagnostic: TY2PR01MB4748:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY2PR01MB47487F1FDE13393279FC7CAF86560@TY2PR01MB4748.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zIJUiOaVVXSjsGoWkh2qfMNd13V9wMASp5gvwBUJ6tWJkXSOegvvWQwhAosMFZfc6+LBkFKZRqwGQmUS+xJlXaUnHq3iiXHRA2ciOhvoDVDLhmQx5poGOlzBMqEHLrjr9AeuNP91q9RvP7oz3qc1quXGM/Xnw5VfdQHZTCO7sPf41s6AjaoEQtDt9zMtMN+9dGg8eRr994i8P2fTgt6WC+egmXijLjjXuPsTt6McYd3fG9NihFgFmL++mR8cg6enfcwquOr1x3zy/eMp+TPhQJr4r6COBctPzv8B+gxZAbIzCTK6TUy2Gw2PhZanUoNKQBsB8OBL9+L4RS0sNE+liCXxP3ISItOPEW/WDeNjnAgiz/SF+5/JPuwwSYg64SZvFora5dVWSoE+g5MWfM//kryiT6hpnLQH6ScCcVCfjjaakB389twgE45Ej9ykHZqmOnvCEZXKENcKpbpNN7qFCw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5309.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(366004)(376002)(136003)(346002)(4326008)(55016002)(33656002)(64756008)(71200400001)(66476007)(66556008)(66946007)(76116006)(86362001)(9686003)(66446008)(7696005)(52536014)(5660300002)(966005)(8676002)(8936002)(2906002)(186003)(6506007)(316002)(26005)(110136005)(54906003)(478600001)(142933001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: cuIEXGgciOuh9BzVTo0f6PRSkYQ04CVlUxWN2uqjEw0owBVKCLyAmDw0CJYAWHDT3qJviNCWInLYXT09jU3JUGazs10Fg/YUdAydDhsBd+wqfqHqg5PMYeY/9BZQe9HGy9YOl8gHrCGiPx1/4njdboCFQmXom3HjyH4Wc6ykGgW+PhflQkkgStS9AP869hlZtqycTGzAvHKFcTmwYd6fd3dsp9VXP1wHYFS4SHN9gTin0Anac63L626H5HXW0yd+Zaoqhwao2MQeZsZEh0lQIZMNnmnTcuhgTy0A4cH9ooz38yv1rd9xXGU+RrKqY5sdDFPYDMPcDgIdxqBnmp9sTJVdpVHvJ+Nih2sMJPJk1LoqUbjRwX5+hNMy2pQ5T4q2quTYxTvhyJFNQx+IomdhQRegcy++JRqbs0shZNtBBZbHEkUXWnMLGAPcxU655S0tY1M4rf6d4tO/juXUGZY0K0fepXfB9wCVZSU0BrwkVbbVuc4yGJYx0m3v5A3rjSxejNvig18Kpa4c2F2QdQHBD0BfBxnmWi32YNZXYRaHqNioFt3FVxqtZ6sgnWp3bofHatSystuip4ilWa6EZz3QlQG2SzuSRDyflgQ86nu1PQ1sxS/pc875xA7CynPakRqQaDVP8tY73mE8X6ruIMX3tA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5309.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fd062ba-9905-4507-6bbd-08d848275226
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2020 12:14:59.0526
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RcmfUntK23P96U3BSjMHvOl5YqvLceM9WZZeHnd3BnrCQceFh/afzS6Kh37McLxoZhGxoynIy0fr3hKoDO1W30ZZoDL5yti7rcq9RrGyShg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4748
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-San,

Thanks for the feedback.

> Subject: RE: [PATCH v2 2/5] dt-bindings: usb: renesas,usb3-peri: Document
> HS and SS data bus
>
> Hi Biju-san,
>
> > From: Biju Das, Sent: Monday, August 24, 2020 8:55 PM
> >
> > Hi Shimoda-San,
> >
> > Thanks for the feedback.
> >
> <snip>
> > > > --- a/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml
> > > > +++ b/Documentation/devicetree/bindings/usb/renesas,usb3-
> peri.yaml
> > > <snip>
> > > > @@ -79,9 +92,20 @@ examples:
> > > >          companion =3D <&xhci0>;
> > > >          usb-role-switch;
> > > >
> > > > -        port {
> > > > -            usb3_role_switch: endpoint {
> > > > -                remote-endpoint =3D <&hd3ss3220_ep>;
> > > > -            };
> > > > -        };
> > > > +    ports {
> > >
> > > I think we should use spaces instead of tab here and below.
> >
> > I have ran dt_binding_check on this file and it did n't complain.
> >
> > First 5 character must be space, after that if you use tab, it won't co=
mplain.
> > I am not sure is it the correct way or not?
> >
> > Geert/Shimoda-San can you please comment.
> > Based on your input, if needed I will send v3 with only spaces.
>
> I don't know why dt_binding_check didn't complain though, according to
> writing_schema.rst:
> ---
> examples
>   Optional. A list of one or more DTS hunks implementing the
>   binding. Note: YAML doesn't allow leading tabs, so spaces must be used
> instead.
> ---
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocu
> mentation/devicetree/writing-schema.rst?h=3Dv5.9-rc2#n71

Thanks for the pointers. I will send v3 with only spaces.

Cheers,
Biju


Renesas Electronics Europe GmbH, Geschaeftsfuehrer/President: Carsten Jauch=
, Sitz der Gesellschaft/Registered office: Duesseldorf, Arcadiastrasse 10, =
40472 Duesseldorf, Germany, Handelsregister/Commercial Register: Duesseldor=
f, HRB 3708 USt-IDNr./Tax identification no.: DE 119353406 WEEE-Reg.-Nr./WE=
EE reg. no.: DE 14978647
