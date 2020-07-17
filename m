Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8885622369C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jul 2020 10:09:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726426AbgGQIJg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Jul 2020 04:09:36 -0400
Received: from mail-eopbgr1400139.outbound.protection.outlook.com ([40.107.140.139]:19920
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726113AbgGQIJf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Jul 2020 04:09:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L6xwS8m4mE2I4b6HOaAx3lWCWsNjkDuUOitaDtSAfi9wrINavLQl3BN63FwKoIx/kFDghBbs4cutYWybBmvw6j41RjgRy0T6EiFNI9kFj9NXN67hlNWtzadMqJj9prTJDGSY14cCBNmZ+MoQhPyhnuBGBI2CKSTAvDElVMCv7/XXAP7n8uGHY7K7sse4DyxGtL2wK0XQCT88qdCfekwAvcrBtprvIyKiOxUzJxJmcfcZKnJdMsJNB3YXxy1mrMuOhXoBuqlcIJjEElqxe+CwOQrejdOr59u6N2qKO8WaMKVdDqSSgH54rSN+TAKSoV9sdj+gxcv54p8kYM2utxzOEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NHOHNhjKmoE0XibRU22aTnlev4k9xaN0xwTyNRUrpkM=;
 b=MK4EIvJSXsOMh6M4D/56M0Cup6uqbGWm2mW6WvzAMShDkJBg9ktwXz3TREtcymWFBaE+p7oSN+7CoO4EgaQtgrYrWE+FQf1sCEsVwLRlNPa0SMhSCc1c2PYm8WiN1TAnO2V5rVvLMFtY8fNa6WqLUEyOrwgkJ1r/Wk+abV2TEuwvo3Ky3UhkrJVELuyajSAX3m1jtfb9Tjc/vSgyyaYhciATrChbACLzVHhEWYyvreafZqz6EmoXC1mhyG6Y9MEfcuSARXtPeRBXaPd5FABhFlxFfpBPHHBnQOd1l5eODos6cqHznhY/X6zkVx9aOk+ZvPnw/vWjJY+EfH7iSSMgDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NHOHNhjKmoE0XibRU22aTnlev4k9xaN0xwTyNRUrpkM=;
 b=PLzdD4SE2M9EQoJ2IpRLtaNmaO3HkuNN0pBPupnios6zA27b00XKgz+JZ3xX4mZujvO01B1xv0Upti29tOQGfWI70GTGKYBFKwog6tgUhSuG64yhsv1Q1sOr0wu7tKgFIBfhAfs6fX6OOrPFqQhrPJTwP+osOPptO7sY9RHQftI=
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 (2603:1096:404:8025::15) by TYAPR01MB4687.jpnprd01.prod.outlook.com
 (2603:1096:404:125::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18; Fri, 17 Jul
 2020 08:09:31 +0000
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::590e:ebc:1f09:f160]) by TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::590e:ebc:1f09:f160%7]) with mapi id 15.20.3174.026; Fri, 17 Jul 2020
 08:09:31 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Prashant Malani <pmalani@chromium.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Maxime Ripard <mripard@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Thierry Reding <treding@nvidia.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 1/2] dt-bindings: update usb-c-connector required property
Thread-Topic: [PATCH 1/2] dt-bindings: update usb-c-connector required
 property
Thread-Index: AQHWXA1B01B9KGsloUa+j9zNs/1Vr6kLZwAAgAACdYA=
Date:   Fri, 17 Jul 2020 08:09:31 +0000
Message-ID: <TYBPR01MB5309AED7152585BD238DD013867C0@TYBPR01MB5309.jpnprd01.prod.outlook.com>
References: <1594971274-48027-1-git-send-email-biju.das.jz@bp.renesas.com>
 <20200717075452.GD68629@google.com>
In-Reply-To: <20200717075452.GD68629@google.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=none action=none
 header.from=bp.renesas.com;
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: af2b836b-0e0a-4d07-ea13-08d82a28bbec
x-ms-traffictypediagnostic: TYAPR01MB4687:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYAPR01MB46877720D92644225E829A26867C0@TYAPR01MB4687.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qmA/lOByk3xyMqiC6S8nm4u+gEPVeYZx59/H2haFEr/zPM9zTFoD7cDA1aXRjWAVk/oKOzdlEkhErgHe+E+WoVUg6zOqUd+XdnUQtjI6j725Em0T/Zp/NvB3RhcIZypVWFEtLKX60um3hsZYgOSPAn2jh2DRrESjCxtb/giIVYsYkBBje8jENgVtDy1bt0dc8ggZBfCX24JHppZIecw1yvm20sbvM6RxQuofjE6A2BVpQYX4jt44ezww6hx5J3YxdXHxSUy4nd1bRGsaw1b01Hp+i+M9uLEJG6ulJdtGwY3aX2QugC0AFNYDvp1B+zKGNokYdqAmdfHhH+f7U+mS9X6oF8UkZ4V2Qua1oFuUYzPNVlCnBkbv8xc1YDyCqxlW//0K0iu8GTDYVI9pUNUfdQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5309.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(136003)(39860400002)(376002)(366004)(396003)(86362001)(8936002)(55016002)(83380400001)(478600001)(5660300002)(4326008)(33656002)(2906002)(15650500001)(7696005)(7416002)(6506007)(76116006)(52536014)(966005)(66476007)(9686003)(66946007)(186003)(26005)(54906003)(316002)(6916009)(66556008)(8676002)(71200400001)(66446008)(64756008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: da8xi5HpRtjaAzOk+bOUUqfVXRuYU5IOeGcpZ56OqY2ciSmIFMQoDMwBkbuVauw53AiuzSHSGd/Ai5MLFRQfwJOcvkcRMZqU3bFukvWbbBy0f4QgX0Q3BqgCPQIt+5atB5I4KtoOY7qX7CKvWhr7kvaD0yAnmCOXQvKKh+qSJIyXNM5E7Mm+lODewnrC9cYUCeYMfN0OwVqucJc/qn9Yb/QdsOOK5AjS3S1XP9ib1nS83jb+ZIK2O4yPRHjcJvkHdeL3KwMQgKbB+t/6T4qzvYJkEV4URom+sMMONoBBzjF05gP7tOS4aRMIND+Uf1TVEt3zCX5laZzaOjWn/baq8HRPYVzkwlOxM460TX717CGjOyNAP2BHmA04c17dXACdL4Xn1jQQeu+YYAiNuKAg6aDA/Eo7ryL+u/f9zuP3fVo4jY4SR8yDEMvOKNvOYJxncfGESf4Tsgvoo79MTfTyexqkeMj1cVpP/8q1/9bk0ANzW5K1Fz7gDytMmi3dE0SY
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5309.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af2b836b-0e0a-4d07-ea13-08d82a28bbec
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2020 08:09:31.1107
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SE29drQGrXv8gZhWLW8Z3BDeEqhIgKUJPkX5kPtpDObuWmyaKRjAYCSnLU8AmZ0VflHJabUxHReNnXGQ79w0PqgAPYO+U89PBx9xxtsyW9E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4687
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prashant,

Thanks for the feedback.

> On Fri, Jul 17, 2020 at 08:34:33AM +0100, Biju Das wrote:
> > Some boards have a single SS capable connector. Update usb-c-connector
> > bindings to list port@1 as at least one of the required property.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-
> lad.rj@bp.renesas.com>
> > ---
> >  Ref: https://patchwork.kernel.org/patch/11129567/
> > ---
> >  Documentation/devicetree/bindings/connector/usb-connector.yaml | 7
> > +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/connector/usb-connector.yaml
> > b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> > index 9bd52e6..41e0685 100644
> > --- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
> > +++ b/Documentation/devicetree/bindings/connector/usb-
> connector.yaml
> > @@ -139,8 +139,11 @@ properties:
> >          description: Sideband Use (SBU), present in USB-C. This descri=
bes the
> >            alternate mode connection of which SBU is a part.
> >
> > -    required:
> > -      - port@0
> > +    anyOf:
> > +      - required:
> > +        - port@0
> > +      - required:
> > +        - port@1
>
> So the connector[1] doesn't have any High Speed (D+/D-) lanes? Those are
> supposed to be present on all Type C connectors.

Yes , USB-TypeC connector has  USB3HS0_DP and USB3HS0_DM signals apart from=
 USB3S0_CLK_P, USB3S0_CLK_M,USB3S0_RX_P,USB3S0_RX_M,USB3S0_TX_P,USB3S0_TX_M=
,
USB3HS0_DP,USB3HS0_DM, USB30_PWEN and USB30_OVC.

But the Connector is a SS Capable connector which supports UFP/DFP and DRP.

Cheers,
Biju

> [1] : https://patchwork.kernel.org/patch/11129567/
>
> Regards,
>
> -Prashant
> >
> >  required:
> >    - compatible
> > --
> > 2.7.4
> >


Renesas Electronics Europe GmbH, Geschaeftsfuehrer/President: Carsten Jauch=
, Sitz der Gesellschaft/Registered office: Duesseldorf, Arcadiastrasse 10, =
40472 Duesseldorf, Germany, Handelsregister/Commercial Register: Duesseldor=
f, HRB 3708 USt-IDNr./Tax identification no.: DE 119353406 WEEE-Reg.-Nr./WE=
EE reg. no.: DE 14978647
