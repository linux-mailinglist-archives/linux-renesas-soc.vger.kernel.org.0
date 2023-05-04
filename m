Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F03306F6FA9
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 May 2023 18:13:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbjEDQNk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 4 May 2023 12:13:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbjEDQNh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 May 2023 12:13:37 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2138.outbound.protection.outlook.com [40.107.113.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 634324ECD;
        Thu,  4 May 2023 09:13:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GxEFQ8fiNk24fhmAKHz/GKQgSdqSlvJf1gByJ+yNGegXelcKa2goX3ToNgQJiR+gQWKMBdNNFOtwJSjAVEC6mlDUtHHZMm++Qwi2oLDWTOgCh6/p2H1TH4m2mzWBd0fNq8Ovatrcf0h4LV9MSLiOsVrIUQkMEwBq1ouFV9T2cZTpp8XMffd74czrumB9R8Rw7weltKnLT4zOX/FX7M8AtE4swBnVIhsvLrOiDq8SQrbQkffcwj4a/G8+Sebwu51PPadDuQyne+tKYnnE2uRiBPBGRiD7894KBhAbPNbW4oCHhElYAxZzmp0CxiO4Kf7ZyWwF6zrlADf+QaNYUHy7Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6CnxMwNsMW2Y5qVfe97dbbnamQEAx68E8RhdBRWE7ak=;
 b=WO6Mhel01Eg3xvkQi8DdYJV/Tw8xFGJJJElF4ElmZE3kNyISPS/P6BNJBiJACAV86H8ZDtR7MLyW5xo43HflSzbBC3zkt7ki9K57hudqD/2gEesGpeTbJlPLRfQOQSa5lngkhZFOFGqkU2OdlSKjn6RxIUHVgvnwcQUAPXEew5CaGuncdXkXZ8zFWum4iJ5ETUN6F9Sj6VDbS10/TVUZfdGgTRW1jP6ZSdMa1vDmXg74r2X0ephopTnF6BJqN8lOBwQ/zO+QqwZ+yxAH4DYWarDF5rCKCHtIbh15lV1bBR+6pzVoEaDbF8MOmADYfCYwvJqGliehnr03LbmLBuavGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6CnxMwNsMW2Y5qVfe97dbbnamQEAx68E8RhdBRWE7ak=;
 b=rSS7BsN9JzNfwF1GWzGUPVv8QObYnhBif9BIyxhSrAY0Dp4LZv26R7KidIoxsQZ+IO3xvibsVWa3X/cg6pTo6jusDSXaUQPOzkwS+mbIU0r5+QaS+V+tqK3Yj3cTTsQngSskxvzf7iatF928iC+RA38NsfXplBVDoJQALp0Aj9c=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSZPR01MB8292.jpnprd01.prod.outlook.com (2603:1096:604:181::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Thu, 4 May
 2023 16:13:13 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6363.026; Thu, 4 May 2023
 16:13:13 +0000
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
Subject: RE: [PATCH RFC 1/6] dt-bindings: mfd: Add Renesas RAA215300 PMIC
 bindings
Thread-Topic: [PATCH RFC 1/6] dt-bindings: mfd: Add Renesas RAA215300 PMIC
 bindings
Thread-Index: AQHZfZu8ZyJhHVfu6UKCJMS/J3k6Qa9JsxMAgACXqiA=
Date:   Thu, 4 May 2023 16:13:13 +0000
Message-ID: <OS0PR01MB5922B1520AF46095263BD74F866D9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230503084608.14008-1-biju.das.jz@bp.renesas.com>
 <20230503084608.14008-2-biju.das.jz@bp.renesas.com>
 <ca926221-ffc2-8572-39ab-0f849ac91b5f@linaro.org>
In-Reply-To: <ca926221-ffc2-8572-39ab-0f849ac91b5f@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OSZPR01MB8292:EE_
x-ms-office365-filtering-correlation-id: 72c17097-e0c1-4a9b-7a98-08db4cba7642
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HpfAshTWagDWHI86P1NGccrl9mLfz7BaXjV01eWwmxt3Hc/jdMdGCbleeCnyYBPmdnHTRkFw/dOFEVzSKK853l/VRkDnuXiJ27ZX8i6EXIZZRimqz5L+q4cnuzUR8IN8cvf3BDI9DOJ5jIr3sBjow1pP21mB8qYLZP2G4GvheJzWiwgQl7Ag1Es69J9QsqG8pQVLub+DtyY0gbaC459AwcaQlrJ0Nk2VqXPbLjgvBEniWvQ8woleL/C7Ikf2gcGPXQ7Im14jw1BLc3y/yLA70ukZ2F0PUviiszPcF2V9sh/MWxL9SV8ei/9Eb0KLOiPJFGDaXoGieSytzP6k17ReLwvL9tOKqqfEw93v2xyhEhqaUi0TTncUYUb36+e8AgwjV8F+61wKSzLqOIUJVaBimkB9byWT+ggb+WFyw9r3lSWMuBLXuFexVX+l3lAmHNC9ZzYgRw2q5tA2inXPUD+OtYhqyxfDG0vOYPfZ8QvOW0jfExb+j48AGksc6LduB4nzQ05Q8iFe25QVu3+NZhojOyDj3ajIZiCI8l+/BwrB0UPgUuTqzcM8WU5neWZhB+3keNcN9EPQ9DuKQpXIme7gu84MyJxa+AlBGpRonOCujog=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(346002)(136003)(396003)(366004)(451199021)(38070700005)(8676002)(107886003)(8936002)(5660300002)(2906002)(83380400001)(66899021)(6506007)(26005)(9686003)(53546011)(33656002)(122000001)(478600001)(41300700001)(86362001)(66556008)(4326008)(64756008)(66446008)(66476007)(52536014)(55016003)(71200400001)(966005)(7696005)(186003)(38100700002)(316002)(66946007)(76116006)(110136005)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CwMTE+LcKm9rFacYwmjzp/uVtrAGf/NKF8sQ+fy3dNfDIer15B/InjcY+i2/?=
 =?us-ascii?Q?eCT7pqYEstJhN8R+GOzhLE4rL5ylzOf5/xV3q1fmzekAp9Di/6fQhAn6hiTJ?=
 =?us-ascii?Q?NgYuMpEnEPXwAlMXhPjfAzGEx1Qxu2B/tWv5WJMktiVUZZWpWsrVBV0lsm12?=
 =?us-ascii?Q?ZC3w/T+7YOt1EO+LYOyj879efzk8qjasQl+JVgpuo2b4sV0om94IFIdZsZew?=
 =?us-ascii?Q?AHlnGSeX9bgg/SxXp9isKH1Bxu+35pHa0CtZPkfm+Qrhs0VG9B7nLqD9QJtJ?=
 =?us-ascii?Q?nbu9QzdbC3vnFLHmnH3VWbWaasDNOV6iS8ObYYOtT5NjcZt+NRBcUFLskW7w?=
 =?us-ascii?Q?bIDPaPA3iL5v/VQLoNsfU1e+7z8jofljS+wMw7AeLK6vtJghvfchdg6n/iu2?=
 =?us-ascii?Q?H8IXe3rZEni+6faiFXQKwLXGzgNefr4WLDzd+LMwYl0iI8aK9FmxPeOj8rSi?=
 =?us-ascii?Q?n1ySNnerxNAnu0aj2wzm2020UA0t4mIp6hNM8xiPWo+6QfbUisurdOr2snBM?=
 =?us-ascii?Q?s7CmB7oQfXvXQ5diOzRY23M/Dtp3MH0GuOsRZHykxMQN1fLSqr49uufuudLe?=
 =?us-ascii?Q?/hgaG7Z10s0/3MyLEeFW0sJXb5ljdeG76Uls9VHRzBRQLPqEUCUpD5Z7INK1?=
 =?us-ascii?Q?qluWmXitviy1OOi0AjUuSXkZQCD0tDwDLnSmChDCUfmfqaa6f09zKtbfE7l2?=
 =?us-ascii?Q?Slzta+c2xJRmjS0t6AEl3wBjlrdLWP2n37SdF4fK179tcfYyhWp6W6gdbi+h?=
 =?us-ascii?Q?kmFf9mVeRL6hk4XG0/ZAFi9ggiEiNSEFy2kl7V2KDBNYwTEZBNZcZ5unMP4d?=
 =?us-ascii?Q?55srXL7EHwtUrgr1Zah5lpUea+4EqAp5nG3xjRwhb5d5mRD21k6mhlS3sFAy?=
 =?us-ascii?Q?553JIkEZsd1ZlCPb8FCNjVgI+gMnaN7XUiZSmL5V4RmcN6AnzYaP53bMQWKK?=
 =?us-ascii?Q?RomryRcbzszu0EHn6E7AGP2r9XyWUaBwP5P9fieKfEy0b1lrZ36JjXpUqEI5?=
 =?us-ascii?Q?6cvNPLKtrPo6C/OoBmK6pQyUoSjoDypwPT5o5pI/FUab//ygOmW6mlRrizQt?=
 =?us-ascii?Q?htFsxq/dpvqsVaDYJWl9hvAE+tKT9d3YeCftaZzKyVKwlawL5ySUXuNf2ZkZ?=
 =?us-ascii?Q?+PLYMIMsrgeImHVrHN9/tfJ02RpFSAgxta5OD1UsrqohHjC5dc18bHPQGXDt?=
 =?us-ascii?Q?2FfJ9I5PV4SYS0PRxYJMObKDSJYYektXaRcvd/s+AW4czWCylwgkp/yw8IhI?=
 =?us-ascii?Q?cB1pPSoNCCm2R/Vdn9gTVdlx9PDE6SqQcug0uOLo8/6/v2aXMFN6jl8IcxS+?=
 =?us-ascii?Q?WOAPnbXKC2DVXTPYQ7KwXgqOZQCjpGQYSpiLaFeBuAJJ4IAfcndV0yl5yRbB?=
 =?us-ascii?Q?vrjteMgTQ/QD5mjmtsYgNr5ruLa/89xbc8GHEhGJeDjqpLyYJcFLtI86FmC/?=
 =?us-ascii?Q?ezKkYx5KzqHuAF6X0gIWuLc+2NTbmhQGGsNqaLMoqmUBZz+ejARnZqClPN9s?=
 =?us-ascii?Q?kL3Z+81eoMw4s130XbaaTluXoBhkZGQQ/vua3FCt7jP2LorCGs2J1Ely6tpU?=
 =?us-ascii?Q?mfxrI0ZkiZ5iRVdSNOhNGYVv+sUD0zHnXVWqP3pL?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72c17097-e0c1-4a9b-7a98-08db4cba7642
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2023 16:13:13.4269
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qOcuAWAlyE2WmU3lyEbaHeGtCnBp2tbFOcBLCevd3NAuKFQBFSmc3B8PxYrKBWrmeJDB60PNEKqXMb03N9zjvAIXjND98WT66cU57g/K4hU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8292
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Krzysztof Kozlowski,

Thanks for the feedback.

> Subject: Re: [PATCH RFC 1/6] dt-bindings: mfd: Add Renesas RAA215300 PMIC
> bindings
>=20
> On 03/05/2023 10:46, Biju Das wrote:
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
> >  .../bindings/mfd/renesas,raa215300.yaml       | 57 +++++++++++++++++++
> >  1 file changed, 57 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/mfd/renesas,raa215300.yaml
> >
> > diff --git
> > a/Documentation/devicetree/bindings/mfd/renesas,raa215300.yaml
> > b/Documentation/devicetree/bindings/mfd/renesas,raa215300.yaml
> > new file mode 100644
> > index 000000000000..1e65f7618333
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/renesas,raa215300.yaml
> > @@ -0,0 +1,57 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > +---
> > +$id:
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
> > +    maxItems: 1
> > +
> > +  renesas,raa215300-rtc:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: phandle to the built-in RTC device.
>=20
> Why do you need phandle to anything else? This looks like wrong relations=
hip
> described. If these are siblings, why do you need cross-linking via
> phandles?
>=20
> Most of PMICs are described with one node, even though RTC is on separate
> address.

OK, will model like below

	raa215300: pmic@12 {
		compatible =3D "renesas,raa215300";
		reg =3D <0x12 0x6f>;
		reg-names =3D "main", "rtc";
	};

Cheers,
Biju

>=20
>=20
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        pmic: raa215300@12 {
>=20
> Node names should be generic.

OK, will fix.
>=20
> > +            compatible =3D "renesas,raa215300";
> > +            reg =3D <0x12>;
> > +
> > +            renesas,raa215300-rtc =3D <&rtc_raa215300>;
> > +        };
> > +    };
>=20
> Best regards,
> Krzysztof

