Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A053701C40
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 14 May 2023 10:05:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229834AbjENIE5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 14 May 2023 04:04:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbjENIE4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 14 May 2023 04:04:56 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2122.outbound.protection.outlook.com [40.107.114.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33967131;
        Sun, 14 May 2023 01:04:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A5etiDSJpiGkXfoKckYTMlMWSWFcl0KDU76ch7Y0IBL6lxHh2cfAagBW9gj+HGAiqkdFZSPDEIgO9aHvF25xAEJetr+0dknXdS2SOf5Ne33i4qIDx/RqFrnyp0VEXIKq0vU5ojhEG7onvYe/mAhJDrJRWSlf8A7Hdn0PvJV7UXbwlcw9AVSuNIUo5VK9MaPCU3j5iUFoheh0iUHS3JpvbWhohohms8WvMh+WC0ndjqF1Ypg0vMMQ2ghZLgmN39FDbOnbz7x3GEYKemjEZTkd3YCpWJO9MnymVlGlgc6UudT9g/QcyxBykil2XacGyoSZ7tL5kgkta8h9fjGhhOrf0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8zm4pOgT15BwV4Nl+zho2ohEkPE2Q1Nd+K+jJhwjXok=;
 b=UYdMkIHrmW2e+RgGOtHeey4Xs82tIaAdJ1e5IOK1mF/nswW6Jh+ymidv7/9dQ9DKvohvu7mxhcFd18QAA0rqcJgFojJGnqwoswzJOIjoY3K5SkNJcI8Zvy2Z3xtwq2+3gPklBFeKTXrWdu7B1lnAQI4MheGVyUdqM+cHHms46r+IUURqt3BiCGz/yTFFIe6dzEpO60ReKCiHVlr44bS5sw5jNLaEiC/QwPVNUSoTfd3DtQWQNzaONDdgukMAK3jUg97Kz96+1OAKqExH2xfjGOgp9MG+y0sYxvXGs5Eu4Mwtf7zua6eh8aaoTwPI+VdYQHJ6JNyPU6RUn7paBZyJqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8zm4pOgT15BwV4Nl+zho2ohEkPE2Q1Nd+K+jJhwjXok=;
 b=Lf5v3dxBX8yuUK1tYQuwnhpYRJ7nATG2xhEvYH8NOj4N+FEn5KLmBumpQxV/dLb0ZbXFCAx4Iiaq/UCgajUbh8uJg/uVn2fH8BMJMKI/oPE7x+llMI0/oClhHfsrX4xWPN+eXaLgUYmkgkz/lY6PWpgZ0nnkKqslhnTfykpxKJU=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB9960.jpnprd01.prod.outlook.com (2603:1096:604:1df::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.29; Sun, 14 May
 2023 08:04:49 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6387.029; Sun, 14 May 2023
 08:04:46 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: RE: [PATCH v3 3/5] dt-bindings: mfd: Add Renesas RAA215300 PMIC
 bindings
Thread-Topic: [PATCH v3 3/5] dt-bindings: mfd: Add Renesas RAA215300 PMIC
 bindings
Thread-Index: AQHZhbtbMOqhbQvWykaInHFTxQ/ddq9YhVeAgADjl4A=
Date:   Sun, 14 May 2023 08:04:46 +0000
Message-ID: <OS0PR01MB5922ED710AD6A1B3C01587E7867B9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230513165227.13117-1-biju.das.jz@bp.renesas.com>
 <20230513165227.13117-4-biju.das.jz@bp.renesas.com>
 <d2c681da-ef15-2bf8-4341-ddbad4ee9957@linaro.org>
In-Reply-To: <d2c681da-ef15-2bf8-4341-ddbad4ee9957@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS3PR01MB9960:EE_
x-ms-office365-filtering-correlation-id: 3ea2581e-13ab-4f8b-ecde-08db5451e220
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eCJevcX4JE7q9rS38fBAGNekK2SNs20eKWMSkFKlIW2vTkh73+XlPtgyYvUW3vETALwwBlQdr7jqY7YMmWCADKA9BzWdI0asTj3KidLwPVEuddHGBf6SLxHugm46+jhR8q/KRFjxaW0rrt6sucehTuhYg02duCBIjE5616+H7/QOlvJJ4j70ZBj23FAkhykSfYcXR29Sti+XRo7Uvd3MbtTHm8h5EEbs2Lzca8lvaOdeq6rTtCiWptg6VQSVjvGN83HB9ku/JBKl/0497M8PyMPjDETxanFvm/IovMiWBgnAtYHSSlzOGu8vP7jF/95oN775FEw2oKzHf0yTQu3JD1CP4AQ03UbcYT7eBiER6qOt+lwbTVjwbEssLVzWlpro0shn57lckSqS1bphVcX4X2t4OiTL+ZXqQlXu0ulQ6I2JPlaq8J/pj4hS8Oj6vEQjfU2JPnR0joBUdoQ6YhGFDeVGJ+aIJxtgrvu7CIwWoE/lz5JDIZLgx2zA4df3qnsKVpXsNcZkDJjpciT5LRCBkvJ6AOwvhU2be6a6qjatX1gPjbUvyMDvh7qfGlszTbmxfCgT/Gcnivvv6I43oKtWMzUXuIzrYFiACm6KycZwYoQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(366004)(136003)(39860400002)(451199021)(2906002)(107886003)(6506007)(9686003)(966005)(38070700005)(38100700002)(122000001)(83380400001)(53546011)(186003)(33656002)(8676002)(8936002)(5660300002)(52536014)(478600001)(110136005)(54906003)(86362001)(55016003)(71200400001)(7696005)(4326008)(41300700001)(64756008)(316002)(66476007)(66946007)(76116006)(66446008)(66556008)(26005)(66899021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?UTfHuD0GgNG9Nd49TZ2vnoBSQPGkeLS56WcJes5/rZVyXXYNix0QaVmNHYb0?=
 =?us-ascii?Q?rXs1UO3P5UX6viQJonMon+b1YA1IHQ1qZzGLGhoADxJKlm2E04gXfTyXaW2J?=
 =?us-ascii?Q?SpZ2PxI/GgUO9KSvOi3fQxgJSH08uozQQw74HsgeuhXgP0dXSHapBckubEks?=
 =?us-ascii?Q?j7Do/HNdqh0Zd2DEdeY6+QZCqmYGuNf3yIbJ6+QaylPwNZAzxnfXxiFdBcqr?=
 =?us-ascii?Q?Wi+bGGo4N/3O6YM5XK5NEl4OzQY+MqEOsWM6JsTS9YMI42iGfclCUlDOg6pb?=
 =?us-ascii?Q?2wJcf0OT5Oa9MTTe8QdesihU2nC7YDXC+NBZHSlBUkBaBWm65eQ5N+RzcTka?=
 =?us-ascii?Q?ZalaIbPUbxVt8WYOI7zIabq9CnQA5s+q1sATsryzPLYZFSRrTF1+74Ux/tzQ?=
 =?us-ascii?Q?MLV9kXiWTmws+lGvaxN8LpWByHMX5UowEqr2jTmGbz7ql5yIhHVj/AQe3K4s?=
 =?us-ascii?Q?y72V6TBR0GYwYNcD4G2EUZru9N7EQYgfTNsIux6OyokifFaobIWvd5KSkdTy?=
 =?us-ascii?Q?VQklK4Q89rD6jqQsV7xJnWz2EEj8+JUYhWaKnT/tWG8qesDo4YS1GKNjsoyq?=
 =?us-ascii?Q?aSpTc28QZoWrkHyHbTzG5Si8PXaIBnzuhkJu0/htKGcDIsKPDG/GwelVmppq?=
 =?us-ascii?Q?GKQjJlR2o3bAHvl6KjIUzgdsDPmcAMz0pMxDsDwJJwq4rq+AVC6EAAxmJjhh?=
 =?us-ascii?Q?ybz/2nZI+/+7cU/Ak+Nx3poG6AnvohizrgsTdum8wd3bMSiR0s/8GFJ7oeMk?=
 =?us-ascii?Q?dxPgZT+G5/gFeQsgZxPKFek8lYBHeTFyDQhU4lnrrHwC6/tCCi434UFoT72+?=
 =?us-ascii?Q?NQFaYbQVFbE5kOq2a9FrKnAkd0EJvJN2OLp7Boa+A1ujhrtM6BThPvtpRLHQ?=
 =?us-ascii?Q?XrU+X7FThdUV0tIHVkqG6tOJ8HLoCpqDkwaePZLXgBnBlhiDgTEd0VjL0BxY?=
 =?us-ascii?Q?7vaUDf8Iqihe+wcQBO0gDxkqQw2qP9yZ11Z+Yg2N7uZ28bg1kT7qqipYO9fe?=
 =?us-ascii?Q?YNzyyPD57OuBa3NSqk+HNsdX23dEOm2DQRzzmRMqKDhTgyEaEVDaenvMP80D?=
 =?us-ascii?Q?1vfejzVMTc1Z3lDi0dvdMS9He3ucX/RBSb6HSB0/XS5ynT2Gj9RjXNpIbg02?=
 =?us-ascii?Q?FF4RBktXdFjU9aWViPGb2ZqlKIhSqwD5bR1XdJZK9vZ1dOi1r17CdmQ94ang?=
 =?us-ascii?Q?lgIchhIHENkGu7WoIKr9Sg6GU31qgkwEtBoMiwl2Wc4DmIWVhRLGwUS/qZDB?=
 =?us-ascii?Q?JBUFa1BB8ujfka1SWfTuoAoCZVsxhA/w9UpatLINzP/lOPhCOjudTKmlyW+a?=
 =?us-ascii?Q?kcIWE76Sr/6e1YDaDOD1WnHkwP+yw7QmZjrGSGb4qK381RbH56pWiyYUFx4N?=
 =?us-ascii?Q?qnrGXFTfCwclhdNWiUrK3NjB+TpncGI3ve9kWMKPDL5rPrnUoehX0mL22VNV?=
 =?us-ascii?Q?Spj52P/iDBSlD9X8hluRwd6rLg+DtN6viPPkPYaTXtjMFvEjtQtPxN1JiDVq?=
 =?us-ascii?Q?h5Ql4jSnPCeI4l7Eo2a7GsdzrlqAQxhSAK8fWJLKfeaIsS9gV9A/iKEOGbVx?=
 =?us-ascii?Q?GNWUi+MEn1ku+iCKPlsxO6NmT4TmflVW2rlHRQZN?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ea2581e-13ab-4f8b-ecde-08db5451e220
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2023 08:04:46.5626
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yFW3ppYeMyIV999aDFxD2XmTff095pxyWTZDy+9aEbCmpadRVgXu1SsWRalgsrdmh9lCv+DWbygWlUXvFZQpGgDUOBpxeJnoOLFhVotG/wc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9960
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Krzysztof Kozlowski,

Thanks for the feedback.

> Subject: Re: [PATCH v3 3/5] dt-bindings: mfd: Add Renesas RAA215300 PMIC
> bindings
>=20
> On 13/05/2023 18:52, Biju Das wrote:
> > Document Renesas RAA215300 PMIC bindings.
> >
> > The RAA215300 is a high Performance 9-Channel PMIC supporting DDR
> > Memory, with Built-In Charger and RTC.
> >
> > It supports DDR3, DDR3L, DDR4, and LPDDR4 memory power requirements.
> > The internally compensated regulators, built-in Real-Time Clock (RTC),
> > 32kHz crystal oscillator, and coin cell battery charger provide a
> > highly integrated, small footprint power solution ideal for
> > System-On-Module (SOM) applications. A spread spectrum feature
> > provides an ease-of-use solution for noise-sensitive audio or RF
> > applications.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > v2->v3:
> >  * Added more detailed description for renesas,rtc-enabled property.
> > RFC->v2:
> >  * Updated reg property
> >  * Added optional reg-names, interrupts and renesas,rtc-enabled
> >    properties.
> >  * Fixed the node name in the example
> >  * Dropped the cross link property renesas,raa215300-rtc.
> >  * Updated the example
> > ---
> >  .../bindings/mfd/renesas,raa215300.yaml       | 70
> +++++++++++++++++++
> >  1 file changed, 70 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/mfd/renesas,raa215300.yaml
> >
> > diff --git
> > a/Documentation/devicetree/bindings/mfd/renesas,raa215300.yaml
> > b/Documentation/devicetree/bindings/mfd/renesas,raa215300.yaml
> > new file mode 100644
> > index 000000000000..04d34e5be23e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/renesas,raa215300.yaml
> > @@ -0,0 +1,70 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > +---
> > +$id:
> > +
> > +title: Renesas RAA215300 Power Management Integrated Circuit (PMIC)
> > +
> > +maintainers:
> > +  - Biju Das <biju.das.jz@bp.renesas.com>
> > +
> > +description: |
> > +  The RAA215300 is a high-performance, low-cost 9-channel PMIC
> > +designed for
> > +  32-bit and 64-bit MCU and MPU applications. It supports DDR3,
> > +DDR3L, DDR4,
> > +  and LPDDR4 memory power requirements. The internally compensated
> > +regulators,
> > +  built-in Real-Time Clock (RTC), 32kHz crystal oscillator, and coin
> > +cell
> > +  battery charger provide a highly integrated, small footprint power
> > +solution
> > +  ideal for System-On-Module (SOM) applications. A spread spectrum
> > +feature
> > +  provides an ease-of-use solution for noise-sensitive audio or RF
> applications.
> > +
> > +  This device exposes two devices via I2C. One for the integrated RTC
> > + IP, and  one for everything else.
> > +
> > +  Link to datasheet:
> > +
> > + https://www.renesas.com/in/en/products/power-power-management/multi-
> > + channel-power-management-ics-pmics/ssdsoc-power-management-ics-pmic-
> > + and-pmus/raa215300-high-performance-9-channel-pmic-supporting-ddr-me
> > + mory-built-charger-and-rtc
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - renesas,raa215300
> > +
> > +  reg:
> > +    minItems: 1
> > +    maxItems: 2
> > +
> > +  reg-names:
> > +    items:
> > +      - const: main
> > +      - const: rtc
>=20
> I missed it last time. This does not match your reg. I suggest to drop
> minItems from reg, assuming your device always has two address spaces.

OK, will drop minItems.

Also, in next-version, will add reg-names as required-properties .

+required:
+  - compatible
+  - reg
+  - reg-names

I will send next version, based on feedback from others.

Cheers,
Biju

