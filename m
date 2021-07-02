Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 436093B9C68
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Jul 2021 08:52:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230109AbhGBGys (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Jul 2021 02:54:48 -0400
Received: from mail-eopbgr1410101.outbound.protection.outlook.com ([40.107.141.101]:11575
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229542AbhGBGyr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Jul 2021 02:54:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M3RPiQBVa7TxEaF4OwkUDdXtc7+WhjXxYJHcbGDwf8ZyHZepGXq2UTrCHvzr4mzQwl87nhbOY9SC+X5B5LkqIJ2Ayozj4OLRPNwYLwAymScbHX6JcCxMbC1/TVr711dIGrI9PP/nBbp/drcYGRH/GwZ4K4ipov+dqSrG8Er6nqdo+/6xbaDkyazavXY7cyTvn3HUa6MaSeP0I3zbbXzq54KFoHJ5x2cqabhLi3DKoB0Sj75YBm/C5F4KcTsQiotqLnOMvmODFAszzwpLPl+Gb1JuZaaL1kBDS1b1mL2o7Rlz952i6d/qyDkRpqnnwPYbGoU6YNTKXdwQimhuU2DouA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CWyTxpkE2+cIoOFmVv00XmQmHt6/GdrNy3x6/8d0pUE=;
 b=XfNPnd0U/H3tmVOeMuJPzZF5H5W3WPJ7NZk9JWxdK2dr41eqTxzOKOtW4y7xoo55fFoSjtXQ6uKPuPb5LZYFvkzLmF3uNzycYO1CI92/PKjOKHy+8FSrD81T9OigdmBPIUq+/AzsZI9pCR+8oE4LPrKuhCoZTLXZZZP6pV8+e81tieOuQXc6xfTJgcs6EqxqwIiFFnyB27IOYNnxk6qjvy132xR19OT9qlwjllZQwjFf7E10GN8sO2Xt9Dwn7fITagFSjFM+6IVSAw/ZVjP/9EbfE0MO1OBrKK4FLUEXQjoCvhUpPdQdXdsIvuRprpr9pjdiNhiEU9UsTkx2rgrxLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CWyTxpkE2+cIoOFmVv00XmQmHt6/GdrNy3x6/8d0pUE=;
 b=PLacUpuR6EphiPuCEiTPsGH4uSgTIHn1uze5EgIwQlU65ytqcFsf0Zi/ZzTzi/aeFhTH6uf1KPhA8awBZ75dQTIjSeYvX3N9GvYFWMZv0LMq243PrJe70eKIMPIIsYRrI86PlCSkkCpMYcybMnwe7OYBaVhh3owd/f029sEnL7c=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB3890.jpnprd01.prod.outlook.com (2603:1096:604:5d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Fri, 2 Jul
 2021 06:52:12 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe%8]) with mapi id 15.20.4287.023; Fri, 2 Jul 2021
 06:52:12 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Alexander Helms <alexander.helms.jy@renesas.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
CC:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "geert+renesas@glider.be" <geert+renesas@glider.be>,
        Alexander Helms <alexander.helms.jy@renesas.com>,
        David Cater <david.cater.jc@renesas.com>,
        "michal.simek@xilinx.com" <michal.simek@xilinx.com>
Subject: RE: [PATCH v2 1/2] dt-bindings: Add binding for Renesas 8T49N241
Thread-Topic: [PATCH v2 1/2] dt-bindings: Add binding for Renesas 8T49N241
Thread-Index: AQHXbtAXZfPZ6grop0um3CZz1s2UNqsvO/eg
Date:   Fri, 2 Jul 2021 06:52:11 +0000
Message-ID: <OS0PR01MB592240DACD7D18609EA70AE0861F9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <202107020640.YyVoU69S-lkp@intel.com>
 <20210701232258.19146-1-alexander.helms.jy@renesas.com>
 <20210701232258.19146-2-alexander.helms.jy@renesas.com>
In-Reply-To: <20210701232258.19146-2-alexander.helms.jy@renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: renesas.com; dkim=none (message not signed)
 header.d=none;renesas.com; dmarc=none action=none header.from=bp.renesas.com;
x-originating-ip: [193.141.219.20]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fb4f43a7-0f1b-44a6-af30-08d93d25eb6b
x-ms-traffictypediagnostic: OSAPR01MB3890:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSAPR01MB3890D23C046F653A1664A5CA861F9@OSAPR01MB3890.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hq4Y7Kb/PuP2UKOoiYwmruyY5rLgTxfeydOXlHDrA41Mqo0vvz8NtFLhjYFGHRicMp28LV3vmZkMnCMn/4gr1KIElW8JZ8FCLQ8ZUJk57BRdpobMIQ7f3eIQwn4ueJ7gBRnEZszcGE5tAtklex6xEvuyNpSmyuEoJD4e13963j/FhcUjnCxOLWxc8kJbGKnMzP0xyPOI1Q4pkYh29TVEkWjSEFCQAbWr7gA91j6sVKpDpLlsDKnsfl4JE3Kfhcho2uph5ln4hrPtxi1G3TDboJXUMufCzC9nM2+Dz/NSiaPreb8mcHF9Ya7HYN1I9IE+FurIR09h0xpCSLXd9Pqm1JrHpN+Ijv0PRhJy4KaVC0EZaAr1Hcbcs7IxPf68uMym6EbdtF2hINnaadAZmZI2xcKa7ynWzi9VYfx0KgLzbgtTa1cOHFENESkBm+wF+n2CiCbQj+eeyKhgRWjoJT86NgOzVdc3lQYInX1c/UTgPmzmUFeN8gSan/r+HayZvv2MYO/ZCJmyqYqgFuRlwR+LnnVrvZJx9ehcsp5KCcCGaU9kYj+Wk6vmH5KlZ5HnY4o522RsKYw812XBaX42VR0gUYTbH8tgrrFtpDxrH6t9Dbdr7z0Ib5uJJpyJezOGrIRL8fYN8kQhTmutNdzIM77nUWt9klgGxNhWq0SsnSdTWKY7IxA4J0OIa8HAK3PMo89AnM4sV/h1o2KYGPcZrpMgYVMEFGGZI56c9D/NL2DJZOveLjGeqVTj8WXeUgqDDPsLbH28NNJgo4m6Bct7DN7ob36svwcWIktC5SHHS0v0m6WH8QfN94Y9bSs7aJ9F5/BzhcoeWDcSp69WBxJ27LU9Sg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(366004)(39860400002)(136003)(5660300002)(54906003)(26005)(110136005)(8676002)(53546011)(316002)(4326008)(33656002)(6506007)(8936002)(86362001)(38100700002)(66556008)(186003)(76116006)(55016002)(478600001)(83380400001)(122000001)(9686003)(52536014)(66476007)(66446008)(71200400001)(66946007)(64756008)(7696005)(2906002)(45080400002)(505234006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?U1nUsE976Dv/VwSDZe64kOyd/ZxsM+OfJQ+FdM60XnAPS+ivu9U7yKukE7MG?=
 =?us-ascii?Q?edzoBXMIS0hmrB2dBPm2tYRZMkpJv5GxI1C3uFuM215sHFrPd0mC2cXwKmEG?=
 =?us-ascii?Q?usS1m2XtMjl6OmOjc7WpwZlcMb7411Kti69rDhsjC9xBfmrwXxuShtAZGQmo?=
 =?us-ascii?Q?jRN0uotuVTadxHo3uf1TMVV8i75QCj1UtI7X998VLRzvU2rzeVtG2Ad2zmz0?=
 =?us-ascii?Q?XsgYjIiBb5MojCq37EW/ImL60e+8Vygzc9u5R/JAMd/TMxhanPBbz+B9GvZs?=
 =?us-ascii?Q?u2iBjA97K0BsuVUhFzRTgehHpfnCYbmPgT6wLl7Zmd6qd0+n/3JhK378d2NJ?=
 =?us-ascii?Q?T+5xd75CvfXl69RTPnYfSVZD9lALvPo6hb8k6p4EVHnd5IqpI8es3+a2Tq9n?=
 =?us-ascii?Q?oBkamOr93MfgiyGJ7bOZd3tmCcYosLqybJv+SVUdGLTiRL81EBmWd3ohgqpo?=
 =?us-ascii?Q?4KuFaa/mOxc6WP0HmSVxazdO6af4px4iccQL+YuLsX5IuTgufBAjBghbk7Q8?=
 =?us-ascii?Q?Ss5qTwciCutQfoLzR9OYgEC3BC51drWB60+bVq71DQ1H/X9ilzOA/+DIqZgc?=
 =?us-ascii?Q?FAA7ZHuPa2rP+4g3w+mITYWVAevgQsLtrQtf/hWEIm9+WzDRn41tLi2dKj/s?=
 =?us-ascii?Q?NIZY4zUk8yIvsD1wFSgAVzv/K3WzBjF657cHm2zSAZQchSWQX8DSgpihEvQf?=
 =?us-ascii?Q?4bhImNvq/Zfazd09l3LOuBHA94gFAjyqrDQXIzqmFnYpD8z+jVxDG7vEyHy8?=
 =?us-ascii?Q?4Kdo+9mLlCQ2OTjgE5w0xFenlh9/Aon7KBS4eOi5ddf6+UY+fT1BAXkFrICM?=
 =?us-ascii?Q?msuq547w4cmW9fw9hBjStZsS/UQGfJUNJ2a6/9uHynXgfuPkDqeOeB0Dbl5v?=
 =?us-ascii?Q?xbrggVsInkvHRi4YmnGJUflPHZHp+276s5wN5AyluvUWSbjNFoVrrjsw9Nor?=
 =?us-ascii?Q?aQRbfgO9Yq2zWEKphLAFd/gcgR8lbjLZImzVDv3obXAId7UfPd+jIlYX+oie?=
 =?us-ascii?Q?SCbulmn6E5FozSCQs/xCqqtFbPlAl1K+ckheFN+KRu8iQnd2Of884ASdbkkr?=
 =?us-ascii?Q?EMpNdZtPFNgc/fi8UEOVofZ+24yULiKmN8GK4SR/xp/aae88XL6Xj6iUEmID?=
 =?us-ascii?Q?2Z7Hx80hPpXoJ8+z0dcQ1111nNKGv+zbTrD4TnN8IW+lk34Ey6eKvMyBSUzL?=
 =?us-ascii?Q?/RYcJ4k5H1yT0alU3CzkHAKqcBA/u4BshTTKH2QXJYQkXJonzjuYk+2FyuEF?=
 =?us-ascii?Q?hBiOvlZ7ipc0Uz2trL68wDGOFlpekmE+lddG4g2A5TTzBMVE8O1mV27MJ+HJ?=
 =?us-ascii?Q?4qag7cMDLNV2+yxJKJouumlt?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb4f43a7-0f1b-44a6-af30-08d93d25eb6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2021 06:52:11.7972
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DgZQ1zRANtpibtud/6kPBZs52FDWewPzeU+r14b07jzl6C905c9SKPTgPE4bNnISrjK3GpWDXjDOvgevKsO6563ZkOLMjCqf37gDVdpbe3M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB3890
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Alex,

Thanks for the patch.

> -----Original Message-----
> From: Alex Helms <alexander.helms.jy@renesas.com>
> Sent: 02 July 2021 00:23
> To: linux-kernel@vger.kernel.org; devicetree@vger.kernel.org; linux-
> clk@vger.kernel.org; linux-renesas-soc@vger.kernel.org
> Cc: robh+dt@kernel.org; sboyd@kernel.org; mturquette@baylibre.com;
> geert+renesas@glider.be; Alexander Helms <alexander.helms.jy@renesas.com>=
;
> David Cater <david.cater.jc@renesas.com>; michal.simek@xilinx.com
> Subject: [PATCH v2 1/2] dt-bindings: Add binding for Renesas 8T49N241
>=20
> Renesas 8T49N241 has 4 outputs, 1 integral and 3 fractional dividers.
> The 8T49N241 accepts up to two differential or single-ended input clocks
> and a fundamental-mode crystal input. The internal PLL can lock to either
> of the input reference clocks or to the crystal to behave as a frequency
> synthesizer.
>=20
> Signed-off-by: Alex Helms <alexander.helms.jy@renesas.com>
> ---
>  .../bindings/clock/renesas,8t49n241.yaml      | 183 ++++++++++++++++++
>  MAINTAINERS                                   |   6 +
>  2 files changed, 189 insertions(+)
>  create mode 100644
> Documentation/devicetree/bindings/clock/renesas,8t49n241.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/clock/renesas,8t49n241.yam=
l
> b/Documentation/devicetree/bindings/clock/renesas,8t49n241.yaml
> new file mode 100644
> index 000000000..d817ec46d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/renesas,8t49n241.yaml
> @@ -0,0 +1,183 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> +---
> +$id:
> +https://jpn01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdevic=
e
> +tree.org%2Fschemas%2Fclock%2Frenesas%2C8t49n24x.yaml%23&amp;data=3D04%7C=
0
> +1%7Cbiju.das.jz%40bp.renesas.com%7Ce51e24d06083403a3d0e08d93ce73933%7C5
> +3d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C637607786063741484%7CUnknown%
> +7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXV
> +CI6Mn0%3D%7C1000&amp;sdata=3DBIKHeHpyG3vloEEO02HzM6TtWqQtDlSGRMifOQVprPI=
%
> +3D&amp;reserved=3D0
> +$schema:
> +https://jpn01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdevic=
e
> +tree.org%2Fmeta-schemas%2Fcore.yaml%23&amp;data=3D04%7C01%7Cbiju.das.jz%=
4
> +0bp.renesas.com%7Ce51e24d06083403a3d0e08d93ce73933%7C53d82571da1947e49c
> +b4625a166a4a2a%7C0%7C0%7C637607786063751443%7CUnknown%7CTWFpbGZsb3d8eyJ
> +WIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&
> +amp;sdata=3D3XhlKhlwT3hr0KVjynaiMlqMC94tq3sEYgNH6LMf9Kc%3D&amp;reserved=
=3D0
> +
> +title: Binding for Renesas 8T49N241 Universal Frequency Translator
> +
> +description: |
> +  The 8T49N241 has one fractional-feedback PLL that can be used as a
> +  jitter attenuator and frequency translator. It is equipped with one
> +  integer and three fractional output dividers, allowing the generation
> +  of up to four different output frequencies, ranging from 8kHz to 1GHz.
> +  These frequencies are completely independent of each other, the input
> +  reference frequencies and the crystal reference frequency. The device
> +  places virtually no constraints on input to output frequency
> +conversion,
> +  supporting all FEC rates, including the new revision of ITU-T
> +  Recommendation G.709 (2009), most with 0ppm conversion error.
> +  The outputs may select among LVPECL, LVDS, HCSL or LVCMOS output
> levels.
> +
> +  The driver can read a full register map from the DT, and will use
> + that  register map to initialize the attached part (via I2C) when the
> + system  boots. Any configuration not supported by the common clock
> + framework  must be done via the full register map, including optimized
> settings.
> +
> +  The 8T49N241 accepts up to two differential or single-ended input
> + clocks  and a fundamental-mode crystal input. The internal PLL can
> + lock to either  of the input reference clocks or just to the crystal
> + to behave as a  frequency synthesizer. The PLL can use the second
> + input for redundant  backup of the primary input reference, but in
> + this case, both input clock  references must be related in frequency.
> +
> +  All outputs are currently assumed to be LVDS, unless overridden in
> + the  full register map in the DT.
> +
> +maintainers:
> +  - Alex Helms <alexander.helms.jy@renesas.com>
> +  - David Cater <david.cater.jc@renesas.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - 8t49n241
> +
> +  reg:
> +    description: I2C device address
> +    enum: [ 0x7c, 0x6c, 0x7d, 0x6d, 0x7e, 0x6e, 0x7f, 0x6f ]
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  clock-names:
> +    description: Name of the input clock
> +    minItems: 1
> +    maxItems: 3
> +    items:
> +      enum: [ input-xtal, input-clk0, input-clk1 ]
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 3
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#clock-cells'
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    /* 25MHz reference clock */
> +    input_clk0: input_clk0 {
> +      compatible =3D "fixed-clock";
> +      #clock-cells =3D <0>;
> +      clock-frequency =3D <25000000>;
> +    };
> +
> +    i2c@0 {
> +        reg =3D <0x0 0x100>;
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        renesas8t49n241_1: clock-generator@6c {
> +            compatible =3D "renesas,8t49n241";
> +            reg =3D <0x6c>;
> +            #clock-cells =3D <1>;
> +
> +            clocks =3D <&input_clk0>;
> +            clock-names =3D "input-clk0";
> +        };
> +    };
> +
> +    /* Consumer referencing the 8T49N241 Q1 */
> +    consumer {
> +        /* ... */
> +        clocks =3D <&renesas8t49n241_1 1>;
> +        /* ... */
> +    };
> +  - |
> +    /* 40MHz crystal */
> +    input_xtal: input_xtal {
> +      compatible =3D "fixed-clock";
> +      #clock-cells =3D <0>;
> +      clock-frequency =3D <40000000>;
> +    };
> +
> +    i2c@0 {
> +        reg =3D <0x0 0x100>;
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        renesas8t49n241_2: clock-generator@6c {
> +            compatible =3D "renesas,8t49n241";
> +            reg =3D <0x6c>;
> +            #clock-cells =3D <1>;
> +
> +            clocks =3D <&input_xtal>;
> +            clock-names =3D "input-xtal";
> +
> +            settings=3D[

optional or required property?

> +                09 50 00 60 67 C5 6C FF 03 00 30 00 00 01 00 00
> +                01 07 00 00 07 00 00 77 6D 06 00 00 00 00 00 FF
> +                FF FF FF 00 3F 00 2A 00 16 33 33 00 01 00 00 D0
> +                00 00 00 00 00 00 00 00 00 04 00 00 00 02 00 00
> +                00 00 00 00 00 00 00 17 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 D7 0A 2B 20 00 00 00 0B
> +                00 00 00 00 00 00 00 00 00 00 27 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                C3 00 08 01 00 00 00 00 00 00 00 00 00 30 00 00
> +                00 0A 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> +                00 00 00 00 85 00 00 9C 01 D4 02 71 07 00 00 00
> +                00 83 00 10 02 08 8C
> +            ];
> +        };
> +    };
> +

One question,=20
Full regmap or just overriding few registers which is better, assuming the =
device has default values programmed in OTP.
Again that needs {offset, value}???

Regards,
Biju

=20
> +    /* Consumer referencing the 8T49N241 Q1 */
> +    consumer {
> +        /* ... */
> +        clocks =3D <&renesas8t49n241_2 1>;
> +        /* ... */
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0cce91cd5..882d79ead 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15575,6 +15575,12 @@ F:	include/linux/rpmsg/
>  F:	include/uapi/linux/rpmsg.h
>  F:	samples/rpmsg/
>=20
> +RENESAS 8T49N24X DRIVER
> +M:	Alex Helms <alexander.helms.jy@renesas.com>
> +M:	David Cater <david.cater.jc@renesas.com>
> +S:	Odd Fixes
> +F:	Documentation/devicetree/bindings/clock/renesas,8t49n241.yaml
> +
>  RENESAS CLOCK DRIVERS
>  M:	Geert Uytterhoeven <geert+renesas@glider.be>
>  L:	linux-renesas-soc@vger.kernel.org
> --
> 2.30.2

