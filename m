Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2095524667
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 May 2022 09:04:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350662AbiELHEW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 May 2022 03:04:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350688AbiELHEU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 May 2022 03:04:20 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2090.outbound.protection.outlook.com [40.107.113.90])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63DED5EDD2;
        Thu, 12 May 2022 00:04:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O44yJEzXBnl2/9ePNnwkbiyAn6FGZSa6XCdmjbo0Mn6lxDUSsH5pusAwfZlIK42CQeuiT13HiHBpJmzykYmRQpQ0gtBzgeDHCCvtkMr40gaWo2ol8iN6Fhbxx2H0sEtWC1+rcfJJHwCV5H3xPfrQlbhOfF9Ad8bkS1wxJnfNb8MJoc2FtwC2MwNgSXD8U1bYwakvdtloBLmQrTCCGFAIrDQEM8swbSsSHZ078P/9SATqZR90wbmPFXPHwagYeXhvsGLcxI/vN4yuw6NSfJsMPqnuAYCXsTka6aj1CjwBy7WsTXBRgwO3n+T5R08liz51TqKR4DMqmYUwIIo577iucg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ta2y51RFLdCgWAgUtmwIogS7U+iZs1dLOANORUOt1Mo=;
 b=LI03vzZQMGWvBafgIsN7ta3Y5NJ7r8Z0b2HJqnzcFeSudKEdCSbWjR1z93/Z767YYDTYI+9f2F2ljlXGxLntQzEe2YOo6eGi2xeWZi8VE/kUNgAFaJmejIBNtOVOZy/o+V82HWTjjUKoeqNZzRjCfi3R5mdtAqAIWPjx1OVeLKXQDoue7zp6HauKhNfrVtVP6lmjTtnFe7bP2mZCG86XlkIBjMJUihVFIq0oHIlV2iyA5vB56xK9hGcaj+8p9luFXgBxWEis6FamOW9Z2fXLSM+egRNLwvGDsR0LQjGxdkYc7nnpnwLTafxU2u0PsL8NpSCFONmgsTEiCbRetcC6ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ta2y51RFLdCgWAgUtmwIogS7U+iZs1dLOANORUOt1Mo=;
 b=A4kms17eJkeGliob41OAoQHOjxpyT+fatG2/IxxdosTLfrlLdofAWmQ3mDozVRhWHaXRYVBkFfLIonnUv83TTy99VXpwILRYMzBOUt9wj8FK4xhUngKm6pFfYWFIASrCZtg0mw7ML0zBmUzk9NG3I+oMpDRS5cmaafOOTf/hdlA=
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com (2603:1096:400:de::11)
 by TYYPR01MB6571.jpnprd01.prod.outlook.com (2603:1096:400:e0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20; Thu, 12 May
 2022 07:04:07 +0000
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::e180:5c8b:8ddf:7244]) by TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::e180:5c8b:8ddf:7244%7]) with mapi id 15.20.5250.014; Thu, 12 May 2022
 07:04:07 +0000
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Rob Herring <robh@kernel.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH v4 1/2] dt-bindings: serial: renesas,em-uart: Add RZ/V2M
 clock to access the registers
Thread-Topic: [PATCH v4 1/2] dt-bindings: serial: renesas,em-uart: Add RZ/V2M
 clock to access the registers
Thread-Index: AQHYX5ur2S9SLAdqdE6hMnKUk4Qgwa0Z0XYAgAEL/xA=
Date:   Thu, 12 May 2022 07:04:07 +0000
Message-ID: <TYYPR01MB7086D060B952E349A0F62A91F5CB9@TYYPR01MB7086.jpnprd01.prod.outlook.com>
References: <20220504094456.24386-1-phil.edworthy@renesas.com>
 <20220504094456.24386-2-phil.edworthy@renesas.com>
 <20220511150358.GA305958-robh@kernel.org>
In-Reply-To: <20220511150358.GA305958-robh@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b9e7ad4d-1962-4cb3-efa9-08da33e59b3a
x-ms-traffictypediagnostic: TYYPR01MB6571:EE_
x-microsoft-antispam-prvs: <TYYPR01MB6571C33693CDEA8C869818B3F5CB9@TYYPR01MB6571.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Afu90GFG0aZTZvG2YdvfMVQuvdTIJwZyu2ejtD+fZhNWwFSSNGbq5VlzR1hcKRDIBbXjbAvJP1tJVLCdm7b7OFNqn7IN1M94e4aCj8vYp+2whSHo9OBe2j0pAc8Tb5r1ukxH+0S0X1aIYQYep/IdzCuGstCQYmp+6u8jx5SSIa1wW1W9seS3hWTbSoLIGcvq48cHVxdcDMvmgmAM3eHbBsGcylrfgL9sZXCwYnyJ8YUD093dc2sn5MxntXf7wULWRFnItJZZOtqsfOdKgmJH+JXK9lDU/JNXERJKud4+bH6KESbYPC1I1JxL35W4RZJkuZgHR6Ye5cCyajhE00Cjl1OmOrMrV6vwcGd+cElbvV0njAxWKqCvNMorzEOPF71SasT5T3iB4t2LBlz15v5gpkw4AW0nMSyQaOoanNZyM7U/ivWmQbkZ6vPDsBJ5ULAz/OQNTiVy+sE794YOhVn8+vdKCtLmNwDL7NvKg8OZBtS2BYapvaFM8q/w3OzHVKVQGzjnK6Mc2AJAqTFSbrVx9kenqzsHot994rcvD9y/IEDSNr4HqW8U+CTHN8qDxIpPUVHZwcUH0n76+Gypp5CQ9CVZq6og1PdktFiSY3wDZeFEKjQun+9YfgBNk/wBl88atkwjRHUuPl984wagryjKe4si8QP57xSJk2S1FLbJ8S48FwIyPFMaevgSkWFqDjMXFxhOALDPpkHct//FgZSYcw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7086.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(9686003)(5660300002)(86362001)(186003)(26005)(44832011)(52536014)(8936002)(122000001)(64756008)(4326008)(8676002)(66446008)(66556008)(66946007)(83380400001)(66476007)(2906002)(38100700002)(38070700005)(76116006)(6506007)(71200400001)(6916009)(53546011)(508600001)(54906003)(33656002)(7696005)(316002)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+4jOYNLeN64JEP2AdWK/FuISIDDv2ZdqrCWK4aZh4KC56cyOohmkhqjM7eD5?=
 =?us-ascii?Q?yG6zpwNI/WSQWx3hQs8ICf0uTEM1XYMED++QnGF5wukOzX5TeYL9hZXoPtvp?=
 =?us-ascii?Q?4DHGC5kiF0kfvqKuONOmPnYhLVCHmvH2qdPMcKWnhX430TOiMgkM18po25AS?=
 =?us-ascii?Q?DNv3QnM1ykBFcmq7Oi3uCL+ymxuTChfRuyy0OtZ/UEJqj4XwqlDq9zwQwNbh?=
 =?us-ascii?Q?BVA5fq9nqJsfCz1cdV/N/Sg/yKY4A9BnWoRLABfJKzbhYM93OB2Q3L35L2yN?=
 =?us-ascii?Q?DZlME0EC+ipuPcON7VXa7Y+H9dfoN2ZHKInfdNvrHO5nHVJHPMA/ViY2ZSZ0?=
 =?us-ascii?Q?KwWVW8ZE8aFyPR2z7T8zvScf2wIPztLTqpLLuO4CAa+Eeuxvp+ao7MXa2++D?=
 =?us-ascii?Q?IDJ3TSEfBTVlyEEFUqicsgwU4fDnNcCGvDjA+9ssZ6WAihO1uGWa3VNOP9uB?=
 =?us-ascii?Q?BNdQVeyZVgdcfaM3uFVLMN4Ztp0Xf73Vbapv/aJOTLyhd0N04nRMPBsc/0h+?=
 =?us-ascii?Q?ve0zyzgV8ICCmQb9X7YufnH+s5/NUN8utNkNy0kue6ZysOyunJ7Yr+w06VLg?=
 =?us-ascii?Q?VorY8dHTB6EKucdMTyHHBFd7a1DwrG60y6sadgcqfmUQ7zPwFqF16mhRPUfg?=
 =?us-ascii?Q?z5QB5DIuokY3re57nzvqmOeomGCTt6nO47ibd5k7rwVjL2ItzittYkWB4Q7e?=
 =?us-ascii?Q?dFHvdu5QiNsVSgymTI6/5r/QRsp7Lb/nRHNS10lTqRWAgTj9TcBZgbJg0Y+d?=
 =?us-ascii?Q?s/XqVQZVSjFuGYW0iu+hhsvYWIXrpzYGChMzEpHguNsMEbUmV9kysV3lqfMk?=
 =?us-ascii?Q?hDAc7OcqFAWxdr+oUzxp5iuVJ1z4IIP9gz5h1QBnB8IhdehiMxbdgsdqfBzR?=
 =?us-ascii?Q?EvErE1Ma7VYVdAm7FyU+iljV55TEz/yIuMDUu97aWDNkL2No2NxclsS5jreN?=
 =?us-ascii?Q?+shC27stJNxC/M21qIE7+IX6Sa+fkhTXUpI76FQdVV6y5xlADOJKvw+oPReI?=
 =?us-ascii?Q?TeEr7IqPUlTGJZGLrHHt9+5A8ssukFdpnDN/dtbgobMqSAwvAUrJQTE3EvgO?=
 =?us-ascii?Q?0Ew5kB71VLyhOpjPYG2Kqnsk7TIz84VQbvp0OhQ6h2XdeAXljm9DLVHGn/Tf?=
 =?us-ascii?Q?BP74jnF6Uq13bVdjcFU19maA3Uajp6WRLxtosVm182LSa+rxms2WNzgP2zjx?=
 =?us-ascii?Q?y6LiWtKUxj0wkI3Cfx49A2TNKbctdErTit03rLY8PTKNgTf6VCrT86XLMIDr?=
 =?us-ascii?Q?YIpzF8cyoB3T1PblQCCijEhqtaMG7hM7/uO8uMh71NzqIkmyZb4nGhk50Eci?=
 =?us-ascii?Q?6e6yHRhlLjdWw0ypIVPj4AhLG6qrvGxrIZHSqwcn/qhS6sPCn0onXzrIIYcY?=
 =?us-ascii?Q?yeUgKUBRJyQSiW/goBycGvdQulSMrpTOKB2xXF0wVxs1zvbE5QzV6ISQm96A?=
 =?us-ascii?Q?SZvsQd/mZg6YL7S1p77Fa8OeuAbo0qwIiYBTwpsDFmdwjYfmI8oyO4NBR5mA?=
 =?us-ascii?Q?q+xSS6PG8DMPvTC9LEDiH3He7+KTxqP6Hk5u1c3oZ4//viRLBlF4qcsrfsyS?=
 =?us-ascii?Q?xOhh2SZ8cdsdIoZKIjo4umiBjAfVGduToqVseVdMho5kH4AjWHdppFry7CRN?=
 =?us-ascii?Q?L2lvfKvvL1hzhTJIRPDS2q/PixLV3aLpWVU6kUMSwvCK34IkY7u1NDfegqYq?=
 =?us-ascii?Q?1ik0xgQB3QSUxl8TB5MUcIIaWaOiN7bZ41PZblVz9jjvLjfdPQZSBofyo2O0?=
 =?us-ascii?Q?tPxf52bn3P1cHzu7/f6Oedo0RVbaYP4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7086.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9e7ad4d-1962-4cb3-efa9-08da33e59b3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2022 07:04:07.0892
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DiNsFquD9bPliJ4/SNC65sPlti94NOWT/M0M9vl8N7ho/0aBuevGCAOqwwwmlpXPt/VKbqOYfycYfj0tN0Vz75v6yKFGI/u+MWJwp6N6MqU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB6571
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob,

On 11 May 2022 16:04 Rob Herring wrote:
> On Wed, May 04, 2022 at 10:44:55AM +0100, Phil Edworthy wrote:
> > The RZ/V2M SoC has an additional clock to access the registers. The HW
> > manual says this clock should not be touched as it is used by the
> > "ISP Firmware".
> >
> > Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v4:
> >  - Removed "optional" from description of clock to access the registers
> > v3:
> >  - New patch added
> > ---
> >  .../bindings/serial/renesas,em-uart.yaml      | 32 +++++++++++++++----
> >  1 file changed, 25 insertions(+), 7 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/serial/renesas,em-
> uart.yaml b/Documentation/devicetree/bindings/serial/renesas,em-uart.yaml
> > index 332c385618e1..40a03f255666 100644
> > --- a/Documentation/devicetree/bindings/serial/renesas,em-uart.yaml
> > +++ b/Documentation/devicetree/bindings/serial/renesas,em-uart.yaml
> > @@ -9,9 +9,6 @@ title: Renesas EMMA Mobile UART Interface
> >  maintainers:
> >    - Magnus Damm <magnus.damm@gmail.com>
> >
> > -allOf:
> > -  - $ref: serial.yaml#
> > -
> >  properties:
> >    compatible:
> >      oneOf:
> > @@ -29,11 +26,32 @@ properties:
> >    interrupts:
> >      maxItems: 1
> >
> > -  clocks:
> > -    maxItems: 1
> > +allOf:
> > +  - $ref: serial.yaml#
> >
> > -  clock-names:
> > -    const: sclk
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: renesas,r9a09g011-uart
> > +    then:
> > +      properties:
>=20
> > +        clocks:
> > +          items:
> > +            - description: UART functional clock
> > +            - description: Internal clock to access the registers
> > +        clock-names:
> > +          items:
> > +            - const: sclk
> > +            - const: pclk
>=20
> Better to put all this at the top level with 'minItems: 1' and then use
> minItems/maxItems in the if/then schema to define which platforms have 1
> or 2 clocks.

Thanks Rob, will do!
Phil


> > +    else:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: UART functional clock
> > +        clock-names:
> > +          items:
> > +            - const: sclk
> >
> >  required:
> >    - compatible
> > --
> > 2.32.0
> >
> >
