Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DE754E5478
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Mar 2022 15:45:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237272AbiCWOqe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Mar 2022 10:46:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229827AbiCWOqd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Mar 2022 10:46:33 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2118.outbound.protection.outlook.com [40.107.114.118])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B2EC5F56;
        Wed, 23 Mar 2022 07:45:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O1nXYYYlW9HUB/DiQdBNKrlFvKYV9Cg6MP9hhldwDYG4D6k7IWZLh6lzbzVppDuYvcAFkRQ6lfl03veSz843zsf6FjYolTHaJZZ0gYUIBGDSK4rfy+QcmVMjzhnMwu+TSS28EMhLDbG4a2ZNYdNz6xR2BHxBgNZ3QaskEpfpQqarj6ZeP43TcktzrtL+7XciUHs2u7z8NnB23nQulUsrvJbrplaT5KW+DaX7cW6EzDj58uX6FPKoxHw9OiJRLI6Njlckk8qmVzKn/R1l40y9q6YCE+qNDbjqW9ad1ZU1Vng4v4Smb3uehdDmjLT6NXPRUT+gJsCiXy7DvDiVQqQ9Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gDBalGH0m5NY1oGQIaF/V6D05P0EtZd8XCxoc8oCKL4=;
 b=mw4Rewa27Y+a6A12FI4sezbMOOPveZxMNSmH5eUFZIKghi+r1ZpZZsPa9EdGisHK7VmPNy+Cp0MwPMr9qZr9jCbyPV9KYI6N+gsG0KURszCCnSVWLSt+L9j24gxNjnpmk1BIErRJ7c+BneAuTvMG5JWSVU5v8sMjMC8Tt4oD1ZKnzfUbMGmu5hjapX9XN8oKZW43uVzLKtybvM4wJ5cIp3O082p5acrHUlppd9cFD8yMKSywZvxlLcQdCDgroD9Rj99JOx3+nifcA7ZTA80WHnHlj1eErg0942i1UDZ1037UeYg7fDfI1UOj5vptqmE7MGR2iiHUrwrB9r43u/oF8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gDBalGH0m5NY1oGQIaF/V6D05P0EtZd8XCxoc8oCKL4=;
 b=AWxnwQqS7xwJTMIkQ6ZCujXigRuINJbePCIlPWN83Zu6rEHKjSolg208CCi66eoU/yJpedBGudugiKfRi6W78Ot6dwW2qdOrLQxLE6j/pQZwaNm4rlgfeFQvYoPJVsNSvGmLKe9RACrAGGCPBMZbeXWWVYmddt+XXgdZeUZLlqk=
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com (2603:1096:400:de::11)
 by OSBPR01MB4326.jpnprd01.prod.outlook.com (2603:1096:604:72::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Wed, 23 Mar
 2022 14:44:58 +0000
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::7120:d44f:518:6daa]) by TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::7120:d44f:518:6daa%8]) with mapi id 15.20.5081.024; Wed, 23 Mar 2022
 14:44:58 +0000
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: RE: [PATCH 02/14] dt-bindings: arm: renesas: Document Renesas RZ/V2M
 System Configuration
Thread-Topic: [PATCH 02/14] dt-bindings: arm: renesas: Document Renesas RZ/V2M
 System Configuration
Thread-Index: AQHYPTpmNSV4D+WM3E6ifjiaTY8S1azMyqiAgAA6GXA=
Date:   Wed, 23 Mar 2022 14:44:58 +0000
Message-ID: <TYYPR01MB70862B27A67D868B196A70E7F5189@TYYPR01MB7086.jpnprd01.prod.outlook.com>
References: <20220321154232.56315-1-phil.edworthy@renesas.com>
 <20220321154232.56315-3-phil.edworthy@renesas.com>
 <a51dec7d-4dfd-5603-3d34-a40b0fd9ec08@kernel.org>
In-Reply-To: <a51dec7d-4dfd-5603-3d34-a40b0fd9ec08@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5fab9f28-3f7e-4f02-f97e-08da0cdbb414
x-ms-traffictypediagnostic: OSBPR01MB4326:EE_
x-microsoft-antispam-prvs: <OSBPR01MB43265949E998592DB71CDBEFF5189@OSBPR01MB4326.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5QLW0qGs7LQXO55GdqZ63OqeZJ+e6Zgb1QZ0vmF3li7js14XvxB+h9W2C8TFO/KtimrCjNpj7sUtrg9tvnRSYyJs0YTLhFxVrZtUne1qjQelt8tYbXtIxpitpSEUyA6N3ljWgdL/EiisR/Z/i3Sr8dcU2UpIm43AO5qk7cPVOkDueFPEIcirRw35hz8wEBmnBQKgb1o+fRhhBdxbFlhShv/4qNtZc9cUg7/vjvwR8hXN5ONxxP5VqEf+9K1vSf6DylcZphtQDXAY3y0KSwqZmg5M9mFB5KGP20tWIHuugUvYuPxRGj6CfbBmWaPvXgTbJ6y2/081b5FtBnChlZeNnToUJlhDqx9IAPgsgxtUJ1rDQh8e2pzLPQt270PcTdc1EsF2SMHukvGCv1zlvSg564r+JHCTwYvfT0NjJTOvfX/mbO0DkGc3Mry+M18D//LFKwDAbWH8lexQWBstnjuoZN2F6r/l8SrntpjM5P9heU2X7AY7dA/8gM+HQCDQcslFiJaYgC9+Yn0/H4aceNuPk3sWvrJahYWdKuifi4HE9U7VNII8xJD0JViXkljGhypqadngKrSFj+6eM3egIQkGXhUtcOxiFHXTwQsGw7OgjjN8RSa0xlswSPg5mDq7CLiYs0O2PpOE0gvAF/5pJer36AI/OmFXlbPI10FzRV+bmfbrNoTzUVW2hqitPXstcmwMd/bsUqA476Fvhczmsk4Elh5Uztj4kXoFTUtULREpAMAv2+lNgGd0kBUrRx3M36+0ghyeQPtX1KEJrWJiqdXl5zqnfuCer+wjtaYUpjWzV3Y+h9VmhVe03ZLvgwrjTzeZAxuyiQ9QUgMiMFqPG/e9Tg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7086.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38070700005)(122000001)(8676002)(2906002)(33656002)(86362001)(9686003)(55016003)(4326008)(54906003)(110136005)(316002)(66946007)(66556008)(66446008)(66476007)(76116006)(38100700002)(64756008)(71200400001)(8936002)(5660300002)(52536014)(508600001)(53546011)(44832011)(7696005)(6506007)(26005)(186003)(83380400001)(107886003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?b7di6jK38dCs8Nnu7ZCuz1LXdlxFNN/o6E96IDxw+Zv2LdADjdtfw2IO7OdU?=
 =?us-ascii?Q?cV/TIdpopqhCh1fZJohbVT4HmG3XvaayB571nQLPB+gSOdtifQwutFKGRmL0?=
 =?us-ascii?Q?uClMEhK5VHAa7Pd+LyA8FOGZ8LTwYRmF36JeW01DXCo13AlYtq09c8dz7qfn?=
 =?us-ascii?Q?CQ9qmtq5GBppXJraiKH4D5EUqxuji7JHuOtbbeD18xkp8cJaCO8pxNGtfY7I?=
 =?us-ascii?Q?umMQq0kvt1LMFosErPjTxxHFt00plN7UvEMv8rh866scb63PZYz1YKV7zyWU?=
 =?us-ascii?Q?Da1AfWMDkqnL0SGmIK6Ffz5KC2mHQ8Xn2Gs0UKJ/QTV3i5tJqKqETUhI69yf?=
 =?us-ascii?Q?vFHTTDgq+sL8M3UPOAwqLsJtsZCHoLao1aTqACwE74LbYlhIr4IyYIVemq+2?=
 =?us-ascii?Q?agPFViXtUfueFuYdIA9EF9ILqdwvs15OFG0w9zwm6JXFHgywvdvhI9OSQ3U3?=
 =?us-ascii?Q?UFlCcDij9RySQf3Z1L7aBo0MZ54f1D2btB/RCHMleaj8X/udJOKBSG/ucZbZ?=
 =?us-ascii?Q?AMWqXzkEcyZQq9Y5UgGPaTBBT8+++ZiJ4jBtJViExVfCP/5odGm2QtDcPD60?=
 =?us-ascii?Q?E9T7BRcblHcCtAmX3ufUfmrWCy2BKfWPSO5YlvEyfRA3r+Wr3L0LES6HIe00?=
 =?us-ascii?Q?Stzl1jJYVn7WX0M/mTWUKsnAMvkgQPKUTBw81heMjwV4poPMn9kXrTGFmj32?=
 =?us-ascii?Q?QhJ63aIcq9ZKsV4p+2TFjBfnEWsNO0m+xoYxaHRgITxZz+5jYTYdkMJpcyse?=
 =?us-ascii?Q?ziKKdKguBnOICGhlJgyMKVI6+QJmgWoxhcXIajRR8cAVfJ+jG2ggutTK89Ts?=
 =?us-ascii?Q?5ds0KOdHwgcayZEaDfJkWWTc0W/Tit0rQnaVagQdU9xUDFA2p852ie1K+FO4?=
 =?us-ascii?Q?tWdyUflttFAgJED2+bW3l0dY6HngkqPU+F7zkvRsAnLiDpGxiZz7JiTtjd/w?=
 =?us-ascii?Q?e2Fw1J/n86ElcxudanxsHS9EtrB5ee8lRTYNLXP0CTZfbgfE9jzufRYAYVAb?=
 =?us-ascii?Q?p3JxFyTiKEzEzkS8z2VlVXzkjRtJAj+L7GZjYCkI39sK3kExOauNHnDidoxY?=
 =?us-ascii?Q?gx3u4OrF2aZVaSK4BfDP2IfgZ2Zshsk88BMoqglHGv/QO/G6o4RI7QcBN5HU?=
 =?us-ascii?Q?+5BTzjRdiUmsCfWpQwYaIrl98W27oJNiuxFrzcvPv/jfgjnRff82PSyN5Hk0?=
 =?us-ascii?Q?/Jy9JwW3WCc9Kxx2nVbMQl67V/JfnemYQGSOOOr3FWstsWYo1pyBbHduCRul?=
 =?us-ascii?Q?wtF1WFDVo41IHJYh6N89HItzCu2hj9l6C8khu6d8qajLlmrETnb2vHc/FNmQ?=
 =?us-ascii?Q?lTt6I3POPluHheU8PhRoGkgmXQdk4WeQQQXmCKG7VALcCPjThM4b6ldYcq9s?=
 =?us-ascii?Q?5KemYPQrakEpRTTxhHiJmZG+RwQFZNc+ItPbqWUE7KHOxY609UUQ46ZA5ZOD?=
 =?us-ascii?Q?SX10XchtNLXH1DdNXKcW9/OhsoGF1GYrf5Nj7WzOJurKpaFn32XHWw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7086.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fab9f28-3f7e-4f02-f97e-08da0cdbb414
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2022 14:44:58.4678
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tKR+vpJZECQCZ0QLPpCU4cLJKIXwR4iRPDZWSvYeKQWwZpSSOUXjYHVjRcs+B4r7XHLk6SFc2sBDWBbCIX2xX0M3Eckeom+zQBEmVLmmA7I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4326
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Krzysztof,

Thanks for the review.

On 23 March 2022 10:42, Krzysztof Kozlowski wrote:
> On 21/03/2022 16:42, Phil Edworthy wrote:
> > Add DT binding documentation for System Configuration (SYS) found on
> > RZ/V2M SoC's.
> >
> > SYS block contains the SYS_VERSION register which can be used to
> retrieve
> > SoC version information.
> >
> > Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Could you send reviewed-by tags publicly? Maybe there was internal
> review, maybe not and it was just copy-pasted to all submissions...
Yes, it was reviewed internally.
We've done it like this for a while, I'll see what we can do to change
the way we do it. Would just copying the person who reviewed it be
enough?

> > ---
> >  .../bindings/arm/renesas,rzv2m-sys.yaml       | 39 +++++++++++++++++++
> >  1 file changed, 39 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/arm/renesas,rzv2m=
-
> sys.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/arm/renesas,rzv2m-
> sys.yaml b/Documentation/devicetree/bindings/arm/renesas,rzv2m-sys.yaml
> > new file mode 100644
> > index 000000000000..1a58906336b8
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/arm/renesas,rzv2m-sys.yaml
> > @@ -0,0 +1,39 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: "http://devicetree.org/schemas/arm/renesas,rzv2m-sys.yaml#"
> > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > +
> > +title: Renesas RZ/V2M System Configuration (SYS)
> > +
> > +maintainers:
> > +  - Geert Uytterhoeven <geert+renesas@glider.be>
> > +
> > +description:
> > +  The RZ/V2M System Configuration (SYS) performs system control of the
> LSI
> > +  and supports the following functions,
> > +  - LSI version
> > +  - 34-bit address space access function
> > +  - PCIe related settings
> > +  - WDT stop control
> > +  - Temperature sensor (TSU) monitor
>=20
> Usually all these are separate devices, so what does it mean that SYS is
> supporting these functions? Is it related to other Renesas System
> Controllers? For example
> Documentation/devicetree/bindings/power/renesas,apmu.yaml
> ?
> Why one is in power and one in arm subdirectory? Maybe you should extend
> existing one?

SYS looks like somewhere to put registers that don't have a logical home.
There are lots of little bits, I just listed the main functions.
On other Renesas SoCs, it's similar but they include power related
registers. Actually, I originally put it in the power directory, then
moved it.

=20
> > +
> > +properties:
> > +  compatible:
> > +    const: renesas,r9a09g011-sys
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    sysc: system-configuration@a3f03000 {
> > +            compatible =3D "renesas,r9a09g011-sys";
> > +            reg =3D <0 0xa3f03000 0 0x400>;
>=20
> Did you actually test it (make dt_binding_check)? This looks wrong.
Sorry, I missed that.
I just tried, but it's failing on some unrelated bindings for a
different SoC. It may be because I'm basing it off next-20220321
at the moment.

> > +    };
>=20
>=20
> Best regards,
> Krzysztof

Thanks
Phil
