Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C720B24FD06
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Aug 2020 13:55:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726765AbgHXLy7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Aug 2020 07:54:59 -0400
Received: from mail-eopbgr1400120.outbound.protection.outlook.com ([40.107.140.120]:24409
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726075AbgHXLy4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Aug 2020 07:54:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ca54McSDoK/XZqN8oG8IOdukcCsxx+FNfNZuEyL5fXRSnjytU1qwZAXVdipN3y1PyqiooMvMbaNBJWsI/uxA2pL0CnACAHweyF045+i3EPjSGmMf3zduYMu35uOGUKr/k2G2b2rZjvib/F1LrsiJq318AtOthpl5NsvO82emPS6qtzAwBznwt89AGtgF9GSBeqCnDEeQMo2TDvdLbPtdEnhzjveqPhpJUnm3+60CTVrA5ELBy51A3fQNXQu4ls3BVh7x9UaRmPanqlaPbo3PtBXRXxtNZPBwPsPlIQ04F7SEW4LJBqP62WJQzJH7V7bwdCyHVO8Oz9mPnV5SRTK3Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ud6XsEFlYgtbPsifAH0CaZWXPBgmE6lKty61yseFxo=;
 b=lqj1JM0mUF19ryOntzrenJVd/Iz7n4lWj6bJI1S+91lQZMelFtakRLJwo7FcnaoaGhGUBOWGaFEabPI+DmEDHwEsfF85jwSOFK2537Xl+qLG8pM8KcYQv4yQ2Th9GbyymfiBdOB4DTB8U8ECDYNZjjMkPfOem/QGy9ZgEApeDc1UhJglgIvtOavEr+q9y/DCErJGHBYvlSQwPmIUhSb/7Ogc3IQj3ISVALW1HStCjAkZVBYqxgj/VX4QiYo44//szCgwY9mgf8+fAW4kMWbOVkY46Oly2F+XdJdk7Rro29H0dzJA7dSIu1NuodFnJ+6CdGIhSTOAx0CTj+3N8R/DPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ud6XsEFlYgtbPsifAH0CaZWXPBgmE6lKty61yseFxo=;
 b=NqAnOpYRnRr2x612qIRIYjM4EFcoZ4JnwO+B0D9bSCeCWM9EXsKXgrDjfcwnDJzLdBKHkoPFnNfxI6V6bqHZfsc3iiqze0pvO8iCtjPBjFIHwSTxGMOU/qRlhoOAKAmwl1fcc6J8mmQ70g56z3UItX5qpaLO8endMY8b8LnPWtQ=
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 (2603:1096:404:8025::15) by TY1PR01MB1516.jpnprd01.prod.outlook.com
 (2603:1096:403:7::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Mon, 24 Aug
 2020 11:54:53 +0000
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::c141:37ba:af8c:b2ee]) by TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::c141:37ba:af8c:b2ee%7]) with mapi id 15.20.3305.026; Mon, 24 Aug 2020
 11:54:53 +0000
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
Thread-Index: AQHWb7XJ1I14VMJHCkaYe4cyMOAsmqlHNFEAgAAAbsA=
Date:   Mon, 24 Aug 2020 11:54:53 +0000
Message-ID: <TYBPR01MB53094D6F8B941E2D94198A3486560@TYBPR01MB5309.jpnprd01.prod.outlook.com>
References: <20200811080227.3170-1-biju.das.jz@bp.renesas.com>
 <20200811080227.3170-3-biju.das.jz@bp.renesas.com>
 <TY2PR01MB36928D9A5BF4A43429662BCED8560@TY2PR01MB3692.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB36928D9A5BF4A43429662BCED8560@TY2PR01MB3692.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: renesas.com; dkim=none (message not signed)
 header.d=none;renesas.com; dmarc=none action=none header.from=bp.renesas.com;
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 90afb525-2c29-44f1-75be-08d84824837c
x-ms-traffictypediagnostic: TY1PR01MB1516:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY1PR01MB1516A0475FBC484E78DCDC4B86560@TY1PR01MB1516.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TziHwGW9ppqwXBMCx8WURy4kSPAoZKbzd1MjFBrF4g161lLlVApzM/l5KhtS7gb3U6QnV4dLK9zw+SQK/7uxS0m+F46k1DnVBrvpFAz0IiEYK+KzM+dxpkcPrKbYsNLH2pmu2LIkmHgWF0tsNmsLKWgOe+qBi+JtWbeIk8J+va0QC9KXNJv8ub4j4HLL3rO4AY89lJGF/SljGEZ7Jz42haUwFP+++ptiYS1yi9gxjehDsqMWIDikkC4CKmHKqoJCqLzbd1JRtq2t39gxgkDG8Z847grZr0RGOcK1XggCV71VgtcljUAiphSgS3Ei7YQymIF3uLcQFF+t1ahBj1Qx86wW31gMPkXtoFF8ANXf5OSLvrSM/Zo+tyUWX+ocRkt4At8t/f2iqNNL8JM7R1QGSXpkaADNfWx8b7UcYzQwGhwNDMu0bf6haFmZQL8X8mNg8VIsqwqLjUXlJoZhcOqVUw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5309.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(366004)(39860400002)(396003)(8676002)(478600001)(76116006)(2906002)(83380400001)(71200400001)(55016002)(66476007)(66556008)(66446008)(66946007)(5660300002)(4326008)(7696005)(33656002)(86362001)(52536014)(110136005)(54906003)(316002)(8936002)(26005)(186003)(9686003)(6506007)(64756008)(142933001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: DVmQL8eKGlCOBwVQ1YOUDhMys0isgAJ9busmsEJQJo4GNMROvbLfNPxnKNjzJssySQs2EPqFG75/C8f3afN1QiR91ru6quA9sfR1Umrgd5v2inzzp4lWyuWgZcJpoE48YPyQUM34iHBobHI/JtpdzLTleuuCRkpuTUcH/W2YRHWGfH17xsLrsbVNGkCnuluM4KQMp2wfEPHnaV8QQYN+kU9/JCCeoMxhgmMNvjMVFXmzl8khdZdIPj1553ueRuxeU6fbN05Y+EvP9pu7Lbuqcj2Pe89w/Ug6g8N+kFw2hzwEn/Mj2n176arHn1u1YOqcLQkFmvCN8H2gKB+U0NrFGqgJ98d3YMv/1f4IfA89jewb+a3KxcxPxsI7jIf3b5NlnGtIrgQ9ixs8CR8CFc4+7dkoCAvSCpLsOsaNNK7hh3BHSc0JJv7ZAAXj99YsY6O3crKR6CDbpK/489s95shRUvmYVxnC6ZFH2yib5R0nsWQiBURhVOkDlOi5Dk3M8QX24jJxzKGMNiiJh05vFzpUcgXWiLH1B+fqb5mnLdl4Aybs+4oPRd7QcDhDiELpCwAAyImqQKqZzslyjeLo/C2lf/z0V5Zl2TRv3BUqfrpgfpUf0cHHZxWJvKFkx1n0fMChs53Wg0jxeP7Bxy8dHmMq0w==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5309.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90afb525-2c29-44f1-75be-08d84824837c
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2020 11:54:53.3784
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZF6Ed1zJW4PmhnPYf5YJBeUp9sZXpHcoBaCLZnWP5PRK8ei9RNP0Quy8o8g+29ZrbvrIn+y71nPC55L43yUAgTYYD98Dh2Wrxp6jQflhlwY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1516
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
> Thank you for the patch!
>
> > From: Biju Das, Sent: Tuesday, August 11, 2020 5:02 PM
> >
> > Document HS and SS data bus for the "usb-role-switch" enabled case.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-
> lad.rj@bp.renesas.com>
> > ---
> > v1->v2: No change
> > Ref:https://patchwork.kernel.org/patch/11669423/
> > ---
> >  .../bindings/usb/renesas,usb3-peri.yaml       | 36 +++++++++++++++----
> >  1 file changed, 30 insertions(+), 6 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/renesas,usb3-
> peri.yaml
> > b/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml
> > index e3cdeab1199f..3eb964af37b8 100644
> > --- a/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml
> > +++ b/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml
> <snip>
> > @@ -79,9 +92,20 @@ examples:
> >          companion =3D <&xhci0>;
> >          usb-role-switch;
> >
> > -        port {
> > -            usb3_role_switch: endpoint {
> > -                remote-endpoint =3D <&hd3ss3220_ep>;
> > -            };
> > -        };
> > +    ports {
>
> I think we should use spaces instead of tab here and below.

I have ran dt_binding_check on this file and it did n't complain.

First 5 character must be space, after that if you use tab, it won't compla=
in.
I am not sure is it the correct way or not?

Geert/Shimoda-San can you please comment.
Based on your input, if needed I will send v3 with only spaces.

Cheers,
Biju


> > +    #address-cells =3D <1>;
> > +    #size-cells =3D <0>;
> > +    port@0 {
> > +    reg =3D <0>;
> > +    usb3_hs_ep: endpoint {
> > +    remote-endpoint =3D <&hs_ep>;
> > +    };
> > +    };
> > +    port@1 {
> > +    reg =3D <1>;
> > +    usb3_role_switch: endpoint {
> > +    remote-endpoint =3D <&hd3ss3220_out_ep>;
> > +    };
> > +    };
> > +    };
>
> Best regards,
> Yoshihiro Shimoda
>
> >      };
> > --
> > 2.17.1



Renesas Electronics Europe GmbH, Geschaeftsfuehrer/President: Carsten Jauch=
, Sitz der Gesellschaft/Registered office: Duesseldorf, Arcadiastrasse 10, =
40472 Duesseldorf, Germany, Handelsregister/Commercial Register: Duesseldor=
f, HRB 3708 USt-IDNr./Tax identification no.: DE 119353406 WEEE-Reg.-Nr./WE=
EE reg. no.: DE 14978647
