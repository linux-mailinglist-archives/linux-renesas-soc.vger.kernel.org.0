Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E51674509A6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Nov 2021 17:31:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230201AbhKOQeH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 Nov 2021 11:34:07 -0500
Received: from mail-eopbgr1400120.outbound.protection.outlook.com ([40.107.140.120]:4896
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229940AbhKOQeD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Nov 2021 11:34:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gHjhnOFzHkm2WOiXpME3+t6fhJAnbZXBSka8cW4/5QWg8L3lbL5BQVc6X2TWszSPOU2CUZuLKJ4Inh6yfgr5+cQO+OiKuvwJR2+jtdAwAKBNOsD8aykpblthbX6xJBZdFB3g2eFwLhcX70mrChG60iLzb4K6kljyclCM3hBkHrXH9Us+7hsIvN1N1yG9dKFqHDeUNRcqGbJifABtdYOWBi5LOsEgRj85PyV4d+RV1QBcSzZfewn7hR3BL8Uq5t4yPsethXB9c1br3aR42BlSBKqcOaZQo5SdK73ICtBKdiWKYmEGStoobz7znv+ov72W1xnHxzvtP8ywprwEn7iypQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ThGuPiFMdX2Qe5PSDiRsSnqG4cxKG0mF9jvNxaDojKU=;
 b=SSExOCgO96QbFVY1O97AiJoCndlulXGXKrVKMhm23AXHTh7hw48XLAfnw3WogncnTwOx9eYukr5Tsllps2ziUGn08uaIcCSzPumn9swodFs5x1dlK5Zo5xjvHUJEbC5zEihk33nFoTTV7xB8ZKPrRrEE9QP65hdjJRr7hL1/5bTrmL9oEC0jJ0RHukBNdnvOr5M2u3Z5jRRFLPbVWv2ZNvTofxlLHDRb/vqpMaDBJ4nvgTuECJr0c7toXILp5/XwSouczWazAeaawlMwUiQEnBavHw81rCKHLCFAWRq7hfNGiowKsgwp26tl6jGkCUkQilpMXi3GYW6Oxg++UaWxAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ThGuPiFMdX2Qe5PSDiRsSnqG4cxKG0mF9jvNxaDojKU=;
 b=Uv+5+QeGXBLSU+7fIj0kJqZxDr3IHWGj/0hJQkl09itDe1R9rhwM/fQ2pt294wnO2uYhBcNiTJ809aQvVfxSmT93Y7qXm+/mAAP4jDHINgGA+9gBpKzXZMbA2DztRCeG8YlA/OWx3eybM57iLyrKhG9lVEFSpqRdpcYk/k9BTE4=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (20.183.20.197) by
 OSZPR01MB6680.jpnprd01.prod.outlook.com (13.101.246.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.20; Mon, 15 Nov 2021 16:31:02 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153%8]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 16:31:02 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
CC:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Subject: RE: [PATCH v3] dt-bindings: mmc: renesas,sdhi: add optional SDnH
 clock
Thread-Topic: [PATCH v3] dt-bindings: mmc: renesas,sdhi: add optional SDnH
 clock
Thread-Index: AQHX2jrE4eSX7ohpXUa1PkZIvz7h+6wEx4Ew
Date:   Mon, 15 Nov 2021 16:31:02 +0000
Message-ID: <OS0PR01MB59220D97CD59F44918DE4FA586989@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20211115160600.4455-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20211115160600.4455-1-wsa+renesas@sang-engineering.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9933969f-d424-456e-9490-08d9a8555049
x-ms-traffictypediagnostic: OSZPR01MB6680:
x-microsoft-antispam-prvs: <OSZPR01MB6680C7EDCF32D29B3BD0527986989@OSZPR01MB6680.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7b7znMx3qUEwO6ihELsX7DW7Os1Ih9lySvtuxCX8bH6Z0finkfclxi5xx846tg9e+vmNNk15kSxhryOYrBXyGo7EaWMWDZMXc8UyXz0Wu0qzU+BMxthnUqU5m6lBkmLyj9TPb0V7cEwS38Nx6igBF/0pPqP9OOjpebixzpZmVPfOsdbiCxUCjnYuxyj1ugprXL7UuRLP7PwlxfKvGW3f+13NX7NSWmKrNC4ClYE6oicuG8d/wPe8zGw2sf10up55FmNsWRr/J9ZdX+LaZTTMbL02KjZpHpKp4MdXebOg+hcG5RmlLJ+g/kGgyvh77JwM/pOs74JU5XhrrsMiGKJjPgIaIkzgIVdESSoTQK7q1ye2SxKQ1xrS1MVStLUrDVUG34665w3CsCfxGA6NHndX2tdkNRivjbeVh3dV8grZdAsoYOmIEXkGynEjyvwTP1IGF9l/c7y0yZDrIkEhF4dCGei1T32KCq8BtnV1IFiyUrr5uifo+zjf+/XNzFxl6WR7oDMhR6IZugGA0vSSPnHIJ1AhF8MZBLiEPDuPFmiEmYk6jLu91nKOIiKbeO9/4wL7mOrfgb3eaF0R/05xYMksI5+Ie0nV8GsR007E0EWs0Zlq06dwNBbo+SOFEk4MbgVf/nU/Q6iplBkvEv7xJQsYKz8NXhH13FunwhsXTTKcWwOtP+0R1TPDPC8VKhOprL9PMOONw1cZiPLv/MjHdABGIQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(122000001)(38100700002)(54906003)(55016002)(110136005)(6506007)(9686003)(52536014)(66556008)(66476007)(38070700005)(66446008)(186003)(26005)(64756008)(66946007)(316002)(33656002)(8676002)(2906002)(5660300002)(83380400001)(7696005)(8936002)(508600001)(86362001)(4326008)(71200400001)(76116006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6cIV+8LtFgET83nGrQqmx9HDIcD63+HH3aB9RMiQDixtuH8haBImlo/JjqEa?=
 =?us-ascii?Q?DdROd0cIY1EVWWx1NgRg/qW9FnaSZbQGiqdvfM6c6rZjCY+pbSuDEujAaKfe?=
 =?us-ascii?Q?rGDkt55cHx3FNlvBUyI3WMZ/k7WUrK+b/S1rLnHJnmO2gXu/andQMU3TlD8j?=
 =?us-ascii?Q?HdaQux8cfwjZKXR1NCuEvElH7qURIkHkeZIeFt5cJY0Va2DjDIRZek0Yv0FJ?=
 =?us-ascii?Q?tDYbK3Bm8mULThO4E8o9stMG2JJMNYRhQItzsGjP6Nz8OArKQ7Fw2xBjuTZ/?=
 =?us-ascii?Q?eZXXcSjNRK8DI3shWL+QPdBhKHId1nJlsYSncP6HkTTRQeBMWtTAUT/3oZ2s?=
 =?us-ascii?Q?Sj42sxTC1adnCQgAg3X7tYcmmVVZrzsrFaQHCmcL0gFs0t0vznFq6lqsjUTs?=
 =?us-ascii?Q?Fwkj+2IgQv2DUJsom9ooMnXcGUj+TAD80BeEk0VDixiQaUEqBWfryj8LvUfT?=
 =?us-ascii?Q?2T1gAmjC5v8Me7mHvrdXsKKeoUmM9aMdJrqB+/RLQFXKS5ioBcW+jfxptZjW?=
 =?us-ascii?Q?qqzXeeHGm2ro0babk7Qg59hIJtmywZlKaYFtVRC7n8detI9OXRKkYlrnunWH?=
 =?us-ascii?Q?YcO/+j++rpP0BbhUQOMBRC3dm8fKbNLJJqu203fwp7fBm3JjdjEfcE+lpVag?=
 =?us-ascii?Q?Hw/a1exGBADw9IcgujFqn3Sz+j+aWngsZN3HVQHVnt6ED3P3LkkBFHimC/lW?=
 =?us-ascii?Q?kh7YQbrqPklVAEDCVqyGWYL51YYbZM7oeed96cAuQb71eEW6aZn+cedW81LX?=
 =?us-ascii?Q?3ohsJOiUy+5fuzUijHHLr6yXijuc1ZQ3UYHsmWH/OMzTBJZh7UXfHGglOSA5?=
 =?us-ascii?Q?FzzLxvUcO4syUZOblifIo6wEjYcjpC3t0QFWZkk4n/NbUy5WmNM9cF85K7Il?=
 =?us-ascii?Q?UokvPWqFFb83eCXEYpvRMfBYRpzrgRJNjYDUYKqehcbx0WM7Qgbwive4gMiF?=
 =?us-ascii?Q?D6LmZ21FEminKe4TJyLzXvMqYWe0KW38vCn/I6d9q++nyfv4Oj6xb3fnCMqV?=
 =?us-ascii?Q?3FLmcoE+BVhb9VjszkhDRlPpPPopa2R0nnHt1s5OwHzvZQWqVmQeGwEI0r6/?=
 =?us-ascii?Q?k2S5CvfUzieL7OzbB6q0UjDNMmlHTNj83vi2a6+v+0yXHT8SfZLsUsTj/aPU?=
 =?us-ascii?Q?JfyScnWzgHHjKC67uvmxUcmJQeeQRYlRMP7nQKjkOBfHvPcQ2eJBRsQp01WW?=
 =?us-ascii?Q?kx+qCsBEvgvTnA5/4439+MGI7QMH2C4+7wcXhbNUn5hDNy4ByJ9ECXfaY0GG?=
 =?us-ascii?Q?M87BPbrWEZLK/XMklRMznWgfhawxYIypzydsQ3TsHCPRA+JMFkruZ12Qyhml?=
 =?us-ascii?Q?7FpsaoheaBkk2PN5ffEzdWGwG0jKCsbZbXsLJ8A+1gjbS3hmgOO4HRgW+gS/?=
 =?us-ascii?Q?1V6gaaskIjNwYWx44wA0O+KanRIzSxiD/Suf8QgRtFMwQAam0v81AN4ASOgk?=
 =?us-ascii?Q?09IDLMYJDLtjjuUkstAm1h7ifcMjBWVdNd3TJpUWavz7eHWy1y6kkagFEiGI?=
 =?us-ascii?Q?wEQEuVdlPyehKyZp7xo3OUVAafO0yCrYIDZy1FKyPDUpygsSXQuZZ+LsdEis?=
 =?us-ascii?Q?fonWm364oEYwAGpHy4jA9WMeZd43OYIT9u9NCLs5X4ON0Jc4hoYWTuNzx+xO?=
 =?us-ascii?Q?xLpXDmuXLscJXk4poNIeGfw/o7wbnPGf98icH88tBOh4wOBrxApSpvjh3UN3?=
 =?us-ascii?Q?0PqbXA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9933969f-d424-456e-9490-08d9a8555049
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2021 16:31:02.0280
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zUPSr6E9EuksNAxSLj1n6gGgp+TQIPtISb4QCHnM6YxeBkdW8mZNia8RhHJX37U43VUopXSMyEXf6rOBKeAaMkuKlAyBez8Hwd+rvJuenHU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6680
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

Thanks for the patch.

> Subject: [PATCH v3] dt-bindings: mmc: renesas,sdhi: add optional SDnH
> clock
>=20
> This only applies to R-Car Gen2 and later generations, so we need to
> distinguish.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Acked-by: Ulf Hansson <ulf.hansson@linaro.org>
> ---
>=20
> v1 and v2 were part of a 21-patch-series which was accepted now except fo=
r
> this patch. Updated according to Geert's comments and finally also sent t=
o
> Rob and the DT mailing list.
>=20
> Tested with:
> m dtbs_check
> DT_SCHEMA_FILES=3DDocumentation/devicetree/bindings/mmc/renesas,sdhi.yaml
>=20
> I hope it really does what I intended to check.
>=20
> If so, the patch can be applied individually. I think, however, it is mos=
t
> convenient if Geert picks it up together with the 20 other patches.
>=20
>  .../devicetree/bindings/mmc/renesas,sdhi.yaml | 40 ++++++++++++++-----
>  1 file changed, 31 insertions(+), 9 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> index 9f1e7092cf44..43fc6ac56038 100644
> --- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> +++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> @@ -129,15 +129,37 @@ allOf:
>          - clock-names
>          - resets
>      else:
> -      properties:
> -        clocks:
> -          minItems: 1
> -          maxItems: 2
> -        clock-names:
> -          minItems: 1
> -          items:
> -            - const: core
> -            - const: cd
> +      if:
> +        properties:
> +          compatible:
> +            contains:
> +              enum:
> +                - renesas,rcar-gen2-sdhi
> +                - renesas,rcar-gen3-sdhi

What about RZ/G2L, as it has 4 clocks?

Regards,
Biju

> +      then:
> +        properties:
> +          clocks:
> +            minItems: 1
> +            maxItems: 3
> +          clock-names:
> +            minItems: 1
> +            maxItems: 3
> +            uniqueItems: true
> +            items:
> +              - const: core
> +              - enum: [ clkh, cd ]
> +              - const: cd
> +      else:
> +        properties:
> +          clocks:
> +            minItems: 1
> +            maxItems: 2
> +          clock-names:
> +            minItems: 1
> +            maxItems: 2
> +            items:
> +              - const: core
> +              - const: cd
>=20
>    - if:
>        properties:
> --
> 2.30.2

