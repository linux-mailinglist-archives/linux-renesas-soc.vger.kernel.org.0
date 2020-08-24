Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0FA224FD7C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Aug 2020 14:08:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726831AbgHXMIg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Aug 2020 08:08:36 -0400
Received: from mail-eopbgr1320137.outbound.protection.outlook.com ([40.107.132.137]:10313
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726187AbgHXMIe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Aug 2020 08:08:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A2JOrYnaKFU41qAhiDN6N/1RegluaFeMC9IGGNOCKGG7xzETIjOzdyzlK2OMrjVx8yVkcaVHlFeHDHRlB46nVZ+Ohw0KWkxYHCkVtCg5LTFgbyjF+hP1/wOrIHQCIi8OhoL5Zq6G4wrUviEybGixdkzI9EpLSxUbm4+puAYXRA5F3m1y/oljLB5yfL/kEj7Rer/hVxEDi/NxkPmjxOEJOxy60Acj8v+DxnT3a2EOUWwhZq1Xo95t8vzc7zgIC+HkqCH4DqlAoowdKFT+amkug7yKqsng43/gsYAPX3L8vElOFNfazJaFxBuZdFWqDeM3aqgpd6m3xrX//kQeT7ugmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Lkt5/LNv42g4SsO8akOe/5RoARgrCOz4B2rE4NmuJo=;
 b=OQKv93KUbtyBXclQDec23FBalw74HnbMrGVVN+56vP3XKK66Ugoxr6HpDFkBaVwRQO1fPYD+M64mAFQYybqDHX5GQfLpLRFp5yQ/2QMIxyTw3kHR4j9K8FE2QR2Fq2jZxhXgfYWlDfwJz/+mtYbVksXONbrvzFfl3Gxso7grDL9gK3UEAmm1MLItWjZY3JQrqE10QasNpU+EoZko5jGyzG4OELdeZYHFnu6pLktgISkzJffiprkoi+gZSIxGjQO11oDD0BhkvAA1J6k6VOyBG91vWIMghY8A65AuStRIwMyQyrODvtvhN58fAjjNqATNv+c9R2tRA2qyDlZaY1xRrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Lkt5/LNv42g4SsO8akOe/5RoARgrCOz4B2rE4NmuJo=;
 b=N3zvfQ0Gdi9+kFT/sbfmLYitkVRTvi4ngqPsfFyJw7TSzfK9atVcvmsBthnzJdonLf8VfkOSfohZNmbdHqNhWH7Oczzo/surIf5l1fMKmckHm3IthGnXQqeme0aMrnF0QIZtUN9zHURh/3BMP0HOVaQx7D9T5tyl9QEDe/Ah+Ws=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB1979.jpnprd01.prod.outlook.com (2603:1096:404:e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Mon, 24 Aug
 2020 12:08:29 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9083:6001:8090:9f3]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::9083:6001:8090:9f3%6]) with mapi id 15.20.3305.026; Mon, 24 Aug 2020
 12:08:29 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
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
Thread-Index: AQHWb7XJjorZCTsTKkiFFP/oeG3wFqlHMPDQgAAKZYCAAAKOsA==
Date:   Mon, 24 Aug 2020 12:08:29 +0000
Message-ID: <TY2PR01MB3692F94908BF9CD36A629110D8560@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20200811080227.3170-1-biju.das.jz@bp.renesas.com>
 <20200811080227.3170-3-biju.das.jz@bp.renesas.com>
 <TY2PR01MB36928D9A5BF4A43429662BCED8560@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <TYBPR01MB53094D6F8B941E2D94198A3486560@TYBPR01MB5309.jpnprd01.prod.outlook.com>
In-Reply-To: <TYBPR01MB53094D6F8B941E2D94198A3486560@TYBPR01MB5309.jpnprd01.prod.outlook.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: bp.renesas.com; dkim=none (message not signed)
 header.d=none;bp.renesas.com; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9769ad29-ef15-4e8d-5d4c-08d8482669d9
x-ms-traffictypediagnostic: TY2PR01MB1979:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY2PR01MB1979695E42113778F5B39854D8560@TY2PR01MB1979.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SwB1Jr36f6Kzw7lS3YOE3H3kRVu9Pd/7LfQV3fqL/opjbKiO4FcvjHDGvU/rAwfsTKRLiMfl6DvrsjJ7q3nYgrcFvoe9sbcpH3GOqc1KYHkjSi6YLKL+bTq2+ytVsWQxlMnbTahoNKo5RCqEZA8tjE7fSa4cSo9tFULNmC0igHnSYta/5Qs6QHfkcmt5gB12TR8NFFJ17gx1350yBi4oXt/g04OcAplPITQVdj7l0SoqIzzisM32BN+5dF9UFQ/8r14mbdeU2s/UHVv5vhtL5/T3BMK1hA1VOzJltubvv7pBI0GFyhcs0uU6FjzGRPHw/7dB6DE+xrFRU4fAst8gro8O2iBqXa9Fo8d58c/TypqN7zNBr99aP0WhQ/vB9hUWVlBcgfxsL7ACkValxYoqqIG321TDNu6a5RHbPySJ9JoXmdg1YwAB3dQ/BjJzsK3AtV+ylFVXCICBb7qIVP5YaQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(366004)(39860400002)(346002)(376002)(71200400001)(966005)(6506007)(4326008)(9686003)(55236004)(186003)(26005)(7696005)(478600001)(33656002)(2906002)(8936002)(76116006)(66946007)(66556008)(55016002)(86362001)(316002)(8676002)(52536014)(54906003)(64756008)(66476007)(5660300002)(66446008)(110136005)(142933001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: /XSywTqCoHq+9k/l7g7WOPhle8tkGQ7RBAhn3oJE3mQgIZ1qhDTYhrQilq1pccAgARLLFa+qBUrDWwrboxKHWbdUKrkgfA9I3bUJDYUfutnO/1CUpdXTYkpX4FxMdlDjzMYGwhsSUP6vk2LoLzKD57pUaZWvmQgX6kzl9Z4fEBoKv4Zt+L3fkZafVnWy/ZNk9FUHBPYzPPXhn92W5+hNYKW/UCZG2zkrZf7YlrovY5fj0NZv9HlFk/ibCBqgRlcKB0RbVAcoNuTGOLYbd0iELHoYIxBINFxh6cv63VjU6k5sSubeP38A4L8SjAIYw8AJMVWijoOswpBz7jItAxoRWRiMXCNX2TsvBrAM7skvkuOGRHkOydQPFn1L7sgKSv90DioUPQEpwQB4KMzRy7h2vX8vfkMK3qswH17yFn4FaOyNu/g7VvEDsKYESOigNmNi/OCG/e2hFT7HIUoPbfX01xY4t17sNWS+6kpzWU+BWi3OjLuDdqlE9MxfcXdmYctYV/Ch0Xtkk73vV3xn9epdqazKT0CPuD/EFHHVvDYGLyI0KXeC2GGRDkUEqtm0fiEDoMk4lhsdm/fyt/li/K7KdqSs0SCcWm5pxL8VAs2MWCk2eY16jXUBsp92Q50ZzettW44j919dysynszwg0LFvNA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9769ad29-ef15-4e8d-5d4c-08d8482669d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2020 12:08:29.3006
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kAeGWeLtrfUzuU4SZiF3y34FpcPb8KgzYN9b5UMToDWoIecouaNB77XFtBOQKCuonPOFqpfcUzYlC8wHF0/rtCptOLtwhUx1Kg9GhbXviFlVj9qr/K/CmMKxNbaadjbX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB1979
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju-san,

> From: Biju Das, Sent: Monday, August 24, 2020 8:55 PM
>=20
> Hi Shimoda-San,
>=20
> Thanks for the feedback.
>=20
<snip>
> > > --- a/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml
> > > +++ b/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml
> > <snip>
> > > @@ -79,9 +92,20 @@ examples:
> > >          companion =3D <&xhci0>;
> > >          usb-role-switch;
> > >
> > > -        port {
> > > -            usb3_role_switch: endpoint {
> > > -                remote-endpoint =3D <&hd3ss3220_ep>;
> > > -            };
> > > -        };
> > > +    	ports {
> >
> > I think we should use spaces instead of tab here and below.
>=20
> I have ran dt_binding_check on this file and it did n't complain.
>=20
> First 5 character must be space, after that if you use tab, it won't comp=
lain.
> I am not sure is it the correct way or not?
>=20
> Geert/Shimoda-San can you please comment.
> Based on your input, if needed I will send v3 with only spaces.

I don't know why dt_binding_check didn't complain though,
according to writing_schema.rst:
---
examples
  Optional. A list of one or more DTS hunks implementing the
  binding. Note: YAML doesn't allow leading tabs, so spaces must be used in=
stead.
---
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Doc=
umentation/devicetree/writing-schema.rst?h=3Dv5.9-rc2#n71

Best regards,
Yoshihiro Shimoda

