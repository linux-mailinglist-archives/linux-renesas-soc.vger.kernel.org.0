Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E59064F016
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Dec 2022 18:10:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231687AbiLPRK0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 16 Dec 2022 12:10:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230429AbiLPRKU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Dec 2022 12:10:20 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2105.outbound.protection.outlook.com [40.107.114.105])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 921BA6DCF1;
        Fri, 16 Dec 2022 09:10:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VqX3Z8ajhdHuzVbaqV3tdIB4c4NZkg7N55jxBCBTorA+ciHIglCSPnucODY67F7jpydNsv23f0lZ6uaQHjKVMO+zBcJ5SiO5vnoPpzg7ZaRCnmOmEaydW2cy7yCNejPLo0bnb2RqGy7AlYGfL/8mexxGAKVJm3VuMiamlgKgCYkxxFBMeSQCF4BuQ9K5XWyKE3OM530QoupIbCeDP1+kuihYgXJouEIzuzhuNMqsJnWQeBxDcnE9oYZdIUI6EwqPuO982z9Wc+ke9iZH+a4+PFpEgWQ06GwfU7gq8LMpViI5ZtSbROZXvv6Jp0T6BMUGEYDpN/aUKYVkSI49VF96gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fl5pGAZbljJk3PAhwiYMA06prciozynsl9if9LUyUw4=;
 b=jHYWubLU1sNitMwvbsb61WQIm9qNLqcAzDSpML3K8YdBEbSOwBU8ZVOOPohNvq4Rl0JNBQHTut/ip++90b2z7vO0ZMfk2fyAeeMDV9zbqE3crBd1VABxAJl/ABlvh8kl7TW3UBsD9LczDqeCfQlyvJletzwad+Z8h1i/Z2m15kFd1+LVfmww3fJ0s9wt/v4yuAfyS3ASaqAT5O32tlaIgqqW2bQHH/6A73vzVpQqFNa3ENS07Ys2/9wDVBRHjONF0NArH1oa5mT1urVRXnweMXD2XVaICd9D6l4GPzY/ew0AfU9AdBKVz1Bi/IZ+AwiFVDAFRwBXUcLsii9gLIK/WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fl5pGAZbljJk3PAhwiYMA06prciozynsl9if9LUyUw4=;
 b=daYW0Aj87MDsRWEcacjQ7V230F84YwADu+TF2eH2CuPgJoi0JXiafhtCE2k8ARvnD0osEQxUP8X7b4W8NF3AX+j5Z31uE9LjQaOz50TfK//ZQN22qwCdUbhy9ZY76MX0XCqlkVB6v0OhnSZebC7Eyqcw3QxN/jnx5uzK/qlfo/U=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB5631.jpnprd01.prod.outlook.com (2603:1096:400:43::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12; Fri, 16 Dec
 2022 17:10:17 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::69ad:8673:1ba1:d7]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::69ad:8673:1ba1:d7%4]) with mapi id 15.20.5924.016; Fri, 16 Dec 2022
 17:10:17 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh@kernel.org>
CC:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 04/16] dt-bindings: usb: renesas,usb-xhci: Document RZ/V2M
 support
Thread-Topic: [PATCH 04/16] dt-bindings: usb: renesas,usb-xhci: Document
 RZ/V2M support
Thread-Index: AQHZDk8m3j+fXrSm40qaamZzF8Xy7q5wtVCAgAAQWpA=
Date:   Fri, 16 Dec 2022 17:10:17 +0000
Message-ID: <OS0PR01MB592205A7B38C9ED9DF1C264786E69@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20221212172804.1277751-1-biju.das.jz@bp.renesas.com>
 <20221212172804.1277751-5-biju.das.jz@bp.renesas.com>
 <20221216161051.GA2837295-robh@kernel.org>
In-Reply-To: <20221216161051.GA2837295-robh@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB5631:EE_
x-ms-office365-filtering-correlation-id: d33116f3-2c1b-4ce6-c483-08dadf8867ce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ek7sykBA1QQ7tNzTSD2/W7NF4C9479HbXpRO0QUN5PV42XGK3H8RnKk5eLgRrKURFbw6cZJ8/ilVGRQVARufJaJFrq+ezasd4N2ej7Hu6FMmH6qcDc/WO5oZaznNx1i+MXIT5YOICUyaZntXhPNb+/0aUVQEc6NML+hIaf565fQDOS1GKgfK60VddC8HP7/JL/bxHU544vr9hF1qpXoL8ZfI7uNKTAK1p9KTlkkLt+frIOnHaq0GE2tdCevGqcM3tcCJSke4ZniRquPNPDqHqh3onNkzaXovx6ofvkaotFIeoJahngDaM1jwlb1QxpCHcxUYTpdTsH7irnuIX+XY6+5AMNwxKaEkzmhFN73i1cszs1rZ16ySl9fHz1Fz1QZ+61C09NitLdt1bHWenKhr7ZhTggfswDLAL0ANo1KORqKR71eZ3Pw6j1dyzpZ65lxKDTJqnZtrpjhDZJ801wJtIdDurixYXJfRtcfzlP4AOSo7aTMjSCbVol6yvLo8dUPQa803aRsHP75wjdASy6dMWyrhT9ihKrxsgQwpbKbL3zb33Y+4ITFhicXd8rq167QJioYM9gB8kQ8MK+6VoeMArLoZhgCddx/ZDYb7wmDToJWDiTq44J0M5eG+j9PZLR3URzlVZLB3G6NzDfSEdmYAAIdMJhWvBRyZbjxlKQIrFYI4oRSk7Ozsm17YWHel/6syceZz7wu4jvypIEdwAtOupw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39860400002)(136003)(396003)(346002)(376002)(451199015)(71200400001)(316002)(54906003)(6916009)(38070700005)(478600001)(7696005)(6506007)(26005)(55016003)(33656002)(86362001)(41300700001)(38100700002)(186003)(9686003)(122000001)(8676002)(4326008)(66446008)(76116006)(64756008)(8936002)(2906002)(66556008)(66476007)(66946007)(5660300002)(83380400001)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7XJCUAyNxMSM/VkszSTEvMrbrrXT2WHZ/pfoHzHbVt7iZ4O/zu9yvl1gizq9?=
 =?us-ascii?Q?vqHnjs4NtUk6G2UHNTH0QBoAx83fjBUocJBRhag7mIldtoWuCqFxrw6UmQxH?=
 =?us-ascii?Q?tY7ef1CqZ9Z4L6NPU1GaVwE5Kp1dyj/LaYp4GY5a7Ap9nvOsOdhtmmftcyNF?=
 =?us-ascii?Q?QpFD8mkFDZ7/sK2Mgo1YA1u5abfWslmAz0VOwMn/IMYtySGC9TIYN88LYp7B?=
 =?us-ascii?Q?xCgtU7LxPN+sJZiBd4H8n9bYWa9uUeJgkU8/8VU0R3zLdn0WNkPfEidzOSns?=
 =?us-ascii?Q?K2irzzvvbC2N9rAhTnIQovUitJUDPJU8QrIgRIp0aLKBSvNGzGkyhg/NCc1s?=
 =?us-ascii?Q?z1XWApQaS7eA7ye9ZeLheWMzmhOSLB2zGYtWeU3a6zBnmquhPrrnheRI+WFL?=
 =?us-ascii?Q?fz+BrcNPZGiDe9HFzVeHsDi2V87GW5wM2x9Z33NVmZ1PxDgnly0ruxjnHA8H?=
 =?us-ascii?Q?IWlqKnN3/6+zxOnuocPEF2ulmnHXaeGD9TDUacyolOGvCYnU9vhIEIlhuybR?=
 =?us-ascii?Q?+9OjF14rULYQ6gm9jLMUu8x+sQCZkV/Dc0HxJvW2TRlpWCk0Za4AQka9sO2b?=
 =?us-ascii?Q?NOgGwV5Lsko1iF4vo7/uT9x91gyTgJCfgtJNxJ4g1+/Q/uaHOExKw0ScTDNq?=
 =?us-ascii?Q?KNHoewymLjlLsURvGwY1us2LqXk8ZwraqlOJziuVzT2R70fx40IW38SfYoU8?=
 =?us-ascii?Q?oG/ftrEww5EB8iNzOmznvuAU0EjZCHraZC1W6nTQewBZDVfCoeIAVLVrVMz4?=
 =?us-ascii?Q?qq1jeW98dJ3pS/7KRYzof4wyEh+FjmK7BNzScsm3BbPh4UD1DHbmkScdhtHL?=
 =?us-ascii?Q?KhdeM9nsNC72UG+43GlIT4ZtwxveplbN7ejMewrGSVg60Vd0Hi2L0B9Q2dwG?=
 =?us-ascii?Q?ypYGZ0WiE+sUp5CdLpciZjceeA/apmAHv0uWo9sVaf+R4kBg5SN0XfB5YXrC?=
 =?us-ascii?Q?ONtkQlEwt4snsnyFPtfY7p+NUEZMAGpvXNfAANyit/+pYjBZnxovQGCt0/zh?=
 =?us-ascii?Q?xoobHSl0evWJRZ4kRaAdbBK8cC5x5XiatceL8+f5rbCINHCWizPTlCThAxDl?=
 =?us-ascii?Q?DtQOR1NH1rMkGf8gR3jwq1jRBiwAr1mTA+GeFkOeuHsOERNYAUY4N2g1ndg3?=
 =?us-ascii?Q?2WFtUOnvxfXGgZMz4MWWIFAW30cHxdXYGBzYlLrqpZW6kFZqScrpLX7uMOJU?=
 =?us-ascii?Q?ZmyrcY/FttO2rlPkZFLUMNVAXwXmbBeEQHquLrFMhn+UC3MpaDiVmZ+khvB2?=
 =?us-ascii?Q?o7wmm/ooSg6Ssw6JxbWaYJZ4oyUMGQ43GYbMfQ8/plEP/VJ2YW4RZSM5oCED?=
 =?us-ascii?Q?CjM5Mrd4tciZ5ftTPMSQOWRJf0X2bW+basA0hdQ1dtiqp0+w5LC9HYtQEn72?=
 =?us-ascii?Q?Zg2BRnMwo+qSWtQmmW5pC/lf6SsdObKqY+kuxcre0LfI97x/S1n1YzsMG0jL?=
 =?us-ascii?Q?dWjwwQaWiX5IWpBNAipKi4PTl5j9MgtmuNKnMMHck5hzIrudUmGM+p9RwZ+H?=
 =?us-ascii?Q?J6+ms3LzGt2jYMN/gAIPyGPLzs2j/+yLVduTME8g3uhJXLuMBPlbhhF/hSMO?=
 =?us-ascii?Q?HzDUjmcbDdZJpYNuAQ41sI4V6gbN/W+7w8qPnQKcxbCNo/3YJzP7JWbP55VU?=
 =?us-ascii?Q?XA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d33116f3-2c1b-4ce6-c483-08dadf8867ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2022 17:10:17.6027
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eRyHmVpyadhkb7bpXRcupW/H4uK4ZiNY78HwS07nCBaSGFJEAOXeBhj4HLKAJ0jnw2lHmbDqiIEpaEkxAQ2wmGNMruL3eZG6oL7uhNmlqs4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5631
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob,

> Subject: Re: [PATCH 04/16] dt-bindings: usb: renesas,usb-xhci: Document
> RZ/V2M support
>=20
> On Mon, Dec 12, 2022 at 05:27:52PM +0000, Biju Das wrote:
> > Document the RZ/V2M SoC bindings.
> > The RZ/V2M SoC is a little different to the R-Car implementations.
> > You can access the registers associated with the currently set DRD
> > mode, therefore as part of init, we have to set the DRD mode to host.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> >  .../bindings/usb/renesas,usb-xhci.yaml        | 41 +++++++++++++++++--
> >  1 file changed, 37 insertions(+), 4 deletions(-)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/usb/renesas,usb-xhci.yaml
> > b/Documentation/devicetree/bindings/usb/renesas,usb-xhci.yaml
> > index 4c5efaf02308..ae678d249785 100644
> > --- a/Documentation/devicetree/bindings/usb/renesas,usb-xhci.yaml
> > +++ b/Documentation/devicetree/bindings/usb/renesas,usb-xhci.yaml
> > @@ -10,9 +10,6 @@ maintainers:
> >    - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >    - Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> >
> > -allOf:
> > -  - $ref: "usb-xhci.yaml"
> > -
> >  properties:
> >    compatible:
> >      oneOf:
> > @@ -37,6 +34,11 @@ properties:
> >                - renesas,xhci-r8a77965 # R-Car M3-N
> >                - renesas,xhci-r8a77990 # R-Car E3
> >            - const: renesas,rcar-gen3-xhci # R-Car Gen3 and RZ/G2
> > +      - items:
> > +          - enum:
> > +              - renesas,r9a09g011-xhci # RZ/V2M
> > +              - renesas,r9a09g055-xhci # RZ/V2MA
> > +          - const: renesas,rzv2m-xhci  # RZ/{V2M, V2MA}
> >
> >    reg:
> >      maxItems: 1
> > @@ -45,7 +47,16 @@ properties:
> >      maxItems: 1
> >
> >    clocks:
> > -    maxItems: 1
> > +    minItems: 1
> > +    items:
> > +      - description: Main clock for host
> > +      - description: Register access clock
> > +
> > +  clock-names:
> > +    minItems: 1
> > +    items:
> > +      - const: host_axi
>=20
> Drop 'host_'

OK.

>=20
> > +      - const: reg
> >
> >    phys:
> >      maxItems: 1
> > @@ -68,6 +79,28 @@ required:
> >    - power-domains
> >    - resets
> >
> > +allOf:
> > +  - $ref: "usb-xhci.yaml"
>=20
> Drop quotes since you are touching this.

OK, Will fix this.

Cheers,
Biju

>=20
> With that,
>=20
> Reviewed-by: Rob Herring <robh@kernel.org>
>=20
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - renesas,rzv2m-xhci
> > +    then:
> > +      properties:
> > +        clocks:
> > +          minItems: 2
> > +        clock-names:
> > +          minItems: 2
> > +      required:
> > +        - clock-names
> > +    else:
> > +      properties:
> > +        clocks:
> > +          maxItems: 1
> > +
> >  unevaluatedProperties: false
> >
> >  examples:
> > --
> > 2.25.1
> >
> >
