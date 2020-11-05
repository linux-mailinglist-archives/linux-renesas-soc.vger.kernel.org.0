Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 712A32A7457
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Nov 2020 02:04:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731147AbgKEBEq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Nov 2020 20:04:46 -0500
Received: from mail-eopbgr1310107.outbound.protection.outlook.com ([40.107.131.107]:56206
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726900AbgKEBEn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Nov 2020 20:04:43 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kCDtkUCG3wUrgK1fEVxJNsUejllP90h4o9yvOHHwwvFdJFNZHOMmSpQRerb/UaIbUqLKP+m6dnEodiAPaLLlbc4nCDOrw8BoDN6JQqUNO0cwDz/5kZ2zdWSw3vztBDIR1/HRh3G6eBc5Xq+3qS9NcSSKecy4hdaquFEltOjmV1yCm2DmLmmLUEAGJzod1YfQMqT+eIkgsCBH4RVwZ4YQadCs7hj4xpSWiRNGU5vPxmm8AI+8LPhaQXV+EZUiu52370i/9XwhB9m/5Vv+8CemcREF0Bz21B192c8IypldoMPqMwCxNvHjEVUkxBHSIomNtwQFOdbdLmvqdpMhasnbeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XuL8cheIvsn+r8qdgcUadIfQzeyFHs1d9ice4uromSs=;
 b=na49SDU6z3rdrFJsPdVhKs8W+IijJFyIO1gFmEPNL7FXFbcBTIE4WogdaiQ0Y/KbBXtUyQwQT8PhKhNTgB59Ddv7PtyPc+/TWm+3c4SuY0B16ommS0tT0+MHXogcCFl6ebgevt2q0rPadOjhppPdftp3G5S0V6fBP/yTFL60N3A38Nj9elfQwgmrzO3JE2Lkd59xMiYCwzN370aiXlFIG0hknpak+mV/sKo2284p9mpqNqKJTkXSScOFa9gPd5+8jJ7cbGB46pT6uDcwOCFh0raQV4IDXjwpRK5HhwSuFeGPPFIvKjCE0PmsTcGRYBBxpLKMkudeUb9aGat5p/SwKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XuL8cheIvsn+r8qdgcUadIfQzeyFHs1d9ice4uromSs=;
 b=Mv7XLcU9zlt6Yjz5WRlJXX+dMr+j5CAF9fEh+sUH+oT9utHkbO8uKAQD4560Aa76uM3lWOb1cBkXJeBTbXy/FNNye/7TJHS+8m98RuNOCZL62OAWqI2Bwmql9VSRks4PnsK/3HlffQ13TcpaP6wtt9ak/X2xMLkR7nNouTuSJ48=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB3515.jpnprd01.prod.outlook.com (2603:1096:404:d6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.28; Thu, 5 Nov
 2020 01:04:37 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::bcba:dccf:7d4c:c883]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::bcba:dccf:7d4c:c883%4]) with mapi id 15.20.3499.032; Thu, 5 Nov 2020
 01:04:36 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Rob Herring <robh@kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "geert+renesas@glider.be" <geert+renesas@glider.be>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: RE: [PATCH] dt-bindings: clock: renesas: rcar-usb2-clock-sel: Convert
 bindings to json-schema
Thread-Topic: [PATCH] dt-bindings: clock: renesas: rcar-usb2-clock-sel:
 Convert bindings to json-schema
Thread-Index: AQHWsnxkJUZdGY05iEWVciGAUzt69Km4VbmAgABhmYA=
Date:   Thu, 5 Nov 2020 01:04:36 +0000
Message-ID: <TY2PR01MB3692F5D579C943B5C4C8EC00D8EE0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1604475005-29495-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20201104190441.GB3957380@bogus>
In-Reply-To: <20201104190441.GB3957380@bogus>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:d410:ae4c:fae8:5565]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c8d1019d-a502-4242-123e-08d88126c3fc
x-ms-traffictypediagnostic: TY2PR01MB3515:
x-microsoft-antispam-prvs: <TY2PR01MB3515FCDF522D2D070F1F39B6D8EE0@TY2PR01MB3515.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: W2QbqpAqdoIdxVs5RFVDZRgVMfBfTFHDNAanVnRX1HyRSj2V0Ju9qzZHbjIHMvC3ifIBSiauRwMcHLt+waOVM5vagSvJmjzlxMChA8ss/S3lhdO8sPXq/PAqjMzZtoqbBzj+qrXP1R+YxpxhfX2YyCGVcORtFxyW2gwjn8Kg9WS/00hYfsnnJa0N82Oq+Mfn8nE3GW6jAP72JLF4S82JayZYcUbUdxPgf8iA7qHy9/K8qNwxsuh8h9Tf7NmBOggRwhmaU55fdN8dWny4c1Jvm8i3RyeyDLyVx8liWSko8+khKIDxFfYSpAdZWczRkQ6J
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(39860400002)(376002)(396003)(346002)(54906003)(4326008)(9686003)(478600001)(55016002)(316002)(83380400001)(7696005)(86362001)(71200400001)(52536014)(6506007)(186003)(66446008)(5660300002)(66556008)(2906002)(8676002)(8936002)(76116006)(64756008)(33656002)(66946007)(6916009)(66476007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: Mi8rtwBksjBxOuetlG1Gmtctfk8nZGZlritNoknfBj4oZO7gG8OW5bqlEGY9OcswY2X+dtXnlox8MqEtA6ILTdFkV5Wd1LOmwKsk04Dg8YtAhiIl5mPzVG6IHdpzBz82Dw/+dv/eksz+iQwNVfPExDYZimpUnMw8UPZk+EIUMqFKK6Juqf0QcfjIrwjvutZ21osAn0muv0592EkewkJ18r+Bgx1l4skwwvJLDA0e17kEFRKYhB2EGsB7sn4nreX5FqlmonXpL4kvEpeb3DqRbO/4RGDYzmbDtkl/66H/FZI3cd7JHzrLjRH5lgEuGkuPTUmfjQlhNMhgPFbo9YQm9X/g/akn7R/6NSaOz1+NXplv1M6zMGpm2UKbKwHR4TFdW2aDyHesI5wDH4qpGsyG9I1wLTloINP/aXrE33RpzIgzq5xFEnAUs6PtXI+J7hCTxSl18iIjriepLt4kJzBmTvQ/RAmLXkLZp+xiaxXtIDOB1hMPS7N7YO1CgPRhfxwb1CsWgskuIzl+0DIf5lMroXrikpaGFnHIfV3Ee0x47ca9lfuwgIf75pJeLnI00GlTA30OT1pXeTlw+CwrEXCo1dwDKM/M7s/A8/+XqANLuqF/J2bw/i4QsED66WFBtHhImoj5VL3WQsCEUrX8ax/icXfOiLklbBaNZyy2aa/qflN2EP/TP4DHJJ0/f2ZlmRz8iJaeIEbq2T1p1EynyqYrWg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8d1019d-a502-4242-123e-08d88126c3fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2020 01:04:36.8742
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T+E/kelyeAc1n7pf0gPouYhFWNDS76DwAgZcZHh3e27Npk3GJXWtp2aF55o9+G5mIuLA1j7Rw3JzQbL2bDqyKfITeWVNwVcxMMHUcsSMFjH8l3XgBv+DgqtwsPrGvbqZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3515
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob,

Thank you for your review!

> From: Rob Herring, Sent: Thursday, November 5, 2020 4:05 AM
>=20
> On Wed, 04 Nov 2020 16:30:05 +0900, Yoshihiro Shimoda wrote:
> > Convert Renesas R-Car USB 2.0 clock selector bindings documentation
> > to json-schema.
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > ---
> >  .../bindings/clock/renesas,rcar-usb2-clock-sel.txt |  68 -------------=
-
> >  .../clock/renesas,rcar-usb2-clock-sel.yaml         | 100 +++++++++++++=
++++++++
> >  2 files changed, 100 insertions(+), 68 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/clock/renesas,rca=
r-usb2-clock-sel.txt
> >  create mode 100644 Documentation/devicetree/bindings/clock/renesas,rca=
r-usb2-clock-sel.yaml
> >
>=20
>=20
> My bot found errors running 'make dt_binding_check' on your patch:
>=20
> yamllint warnings/errors:
>=20
> dtschema/dtc warnings/errors:
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/cloc=
k/renesas,rcar-usb2-clock-sel.yaml:
> 'additionalProperties' is a required property
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/cloc=
k/renesas,rcar-usb2-clock-sel.yaml: ignoring,
> error in schema:
> warning: no schema found in file: ./Documentation/devicetree/bindings/clo=
ck/renesas,rcar-usb2-clock-sel.yaml

I didn't detect these errors because I used dtschema 2020.8.1.
As the README.md of dt-schema mentioned like below, I'm thinking
I should have used the latest master branch of dt-schema before
I run 'make dt_binding_check'.

 $ pip3 list --user | grep dtschema
 dtschema        2020.8.1   <dt-schema path>
 --> This version didn't detect the errors above.

 $ pip3 list --user | grep dtschema
 dtschema        2020.8.2.dev11+gf66186d   < dt-schema path >
 --> This version could detect the errors above.

I'll fix the errors on v2.

Best regards,
Yoshihiro Shimoda

