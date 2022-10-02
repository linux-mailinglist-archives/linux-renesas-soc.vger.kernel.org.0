Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 699F25F2427
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  2 Oct 2022 18:51:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229594AbiJBQvA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 2 Oct 2022 12:51:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229847AbiJBQu7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 2 Oct 2022 12:50:59 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2120.outbound.protection.outlook.com [40.107.114.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 019D33C172;
        Sun,  2 Oct 2022 09:50:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eZ3W4RhWAipq/SZJQj/no4uBAtx6nefZqemeft42wOv54IgbHC32vXCAo3qZQ1405svuT0gZxvvJgWLPet6E11D3/7qqY2x1IusP26Qrvb8d92zrBCsP1vI88zjM+S1wp9hkloSmhLdARPqiAiBKpt4RsH4A1RBW4/2cq7ad0OqQ7rMMKbfieFQVA0qdzCXH0elDWC3WX+IF4b8t/C0+o2iy6LgWcZ5JuC5FeB4qTu3b4nE9DTkyqco4afGxZJkdzjvvnMTQwcNvUl8lvA7XbyXUeXAtSm5BiNXfTS2L1MWnZeaU/ZB0WG8CPPDPWR143QtSgVYKADKU321dezbtPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fRqPfZ0hdL51O984JrrnWwdyDEX2jVviBnLIJR4C64k=;
 b=HuQXMIKo+s3wwqSc0qWMsTsZCAmWwk4e2zhaFVGWfT24XY2DdxlKpJjCYsQr96T1JvO3dKB1Yjq4j4tUnfwUgR8wSo7SevIzHDlk9VT1+ufdiiz2I0bAt85cfl+QIfIFXjhij1HA9IzSAhQJUbzZqAGsnTqS7YnM1LUq4HgwjML9fqZeYMsT4xPk4bp3EsPemBvv39rl5bPZnzuYEX+nFHwGZDcoS9w4cYiDp35KuFxh2nZu3YpNCd+6RkuuIiWtCJRArKg1NvnLHcwiIFEcA0lZ+8eeh9ffJ96ID1U26S5kggbP/4XU4ea+eXvGwH1NscOfHCYkBNl5923SQfCpQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fRqPfZ0hdL51O984JrrnWwdyDEX2jVviBnLIJR4C64k=;
 b=I4khpsjDRHHH+SEdFGxnyopuJaKUJvSFoJgqrMT/AlaXRwZaAECpojYgdAW5b0+Fq1iJ520i5gmpfKvTgaS+/Mf6/HXQshUB5iEU92iQ+9R+H+2TNtYjlgQs6GxqWQqKGh+f55+xwSgoG2K4+WP7S+AIRqPWn2Z4y0EcfrdGWNo=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB10072.jpnprd01.prod.outlook.com (2603:1096:604:1de::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Sun, 2 Oct
 2022 16:50:55 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::73a6:588d:1198:7262]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::73a6:588d:1198:7262%7]) with mapi id 15.20.5676.028; Sun, 2 Oct 2022
 16:50:55 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh@kernel.org>
CC:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Lee Jones <lee@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        William Breathitt Gray <william.gray@linaro.org>
Subject: RE: [PATCH RFC 2/7] dt-bindings: mfd: rzg2l-mtu3: Document RZ/G2L
 MTU3 counter
Thread-Topic: [PATCH RFC 2/7] dt-bindings: mfd: rzg2l-mtu3: Document RZ/G2L
 MTU3 counter
Thread-Index: AQHY0+6QMJg3ImvQdU+tHO/G3uPsOq34VrSAgAFnmeCAAZT6oA==
Date:   Sun, 2 Oct 2022 16:50:55 +0000
Message-ID: <OS0PR01MB5922D4675E1075B06E62449386589@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220929103043.1228235-1-biju.das.jz@bp.renesas.com>
 <20220929103043.1228235-3-biju.das.jz@bp.renesas.com>
 <20220930190311.GA651384-robh@kernel.org>
 <OS0PR01MB5922F394728BA8ED1B2828BB86599@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922F394728BA8ED1B2828BB86599@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS3PR01MB10072:EE_
x-ms-office365-filtering-correlation-id: 7252a07f-1b31-4519-cb10-08daa4964604
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8Iv2fWuQsXJW2M3lCx/7OQaUWIRpeHHG8DJ6BhriNV0e+v49tTCXI7eSGZJ6O31ffk/phHgq0DhrWxFMFWZrwgdhj/3fm30wpUCDKWY1VfwKyweolVtoIdySDrAtMR9xFLM9PCiOBpRTloP29aP/bYIsAy5vV1vGdlVj/QuidFihDziNsS6X1WbB3HMxySQPx/OiKjLatFGCX3LRBHXHdFill3hUynHUNzQ9/nxuYJAG9G82phd4QN3SEeotZ0fq18w8Etf87t0YBi0MqpJIzRjhrzcmF3uBf3YxGe4k2B6kZHZKQC9J1erpH3O7slkF34eLRVx/SBOWsZn2QT0YFvoviSZQ3Qz/U+Qo7SqTpNvOkz4eACKpJO/y+7OkhX87kA8a0CQRcNzcc4GOx5bwyWvPsr17jq42xphK4SS2o1O0XJ6i2BRJb7IizMbJfNVcG1a48HKQE3SfATdSEILDbc0LWVGJx2rDaHanGOSNbYCwNGlQNTdW/ovcfVm0H0FAvyRLLEmDcUDL9eHzqqt6yreboJANjT78/QiY0e+h9dxoNFBk84omwNrDcjYRTwSbmSRUkpdDjYKlzHLmPtd0QKiWDc6wCMLg927OuAjHa9LO/zw8ER897acAtSWXQ2eOX46hHliCJHfdEzL2+6yEm90IH9f5ve2buPeoXJEMCpDlQJKxS4ZTE8FR+PUU1SMqLNobdEc1U1N8QB0Pfcx6B44gunnS9jevi+sg7i5sw4m2PhRzA0NL0MFqJz9gYTrPpk8bS57e/2vuqxuAfL4DTLJpq73ROZw6SHwUh5JHxm4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(39860400002)(346002)(396003)(136003)(451199015)(122000001)(38100700002)(55016003)(86362001)(33656002)(478600001)(38070700005)(966005)(45080400002)(8936002)(2906002)(66946007)(8676002)(5660300002)(66476007)(66556008)(4326008)(66446008)(54906003)(41300700001)(316002)(6916009)(83380400001)(52536014)(64756008)(76116006)(26005)(9686003)(71200400001)(7696005)(6506007)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JPO554a48+lJJIWrEdL0OAtG3X0fYmvOfqWho8XOnWqprwvAuUqLvmqBMN+8?=
 =?us-ascii?Q?biZIfiI0kFYBQVJ6z1ntEydTp36Ll4NsEa2sXj7TtUGdqibeHbS985M53Eoh?=
 =?us-ascii?Q?8XzmTOG0JGxcUgq7wZoxXI6ee9+xJ3y2m/Nuh594rQiYDk1eetxwxt4noICk?=
 =?us-ascii?Q?J/eP3ClN24RouYq7UYsuqSpGh9WQkCxXWIotYSNxTztfkrefV5BCPfPAxhoi?=
 =?us-ascii?Q?m8dQ52VWC+wveF7TOTc5wzWy1fjnM0LhbD/wws1gAjh14eQlyZB+zqzxtOs/?=
 =?us-ascii?Q?7gJ13bqlHO2FDtIrBRQP3QCmV7UayvLT6N3TX5ZNWUbe9bZy7fjYXsaYEaDw?=
 =?us-ascii?Q?1TwWaLcMiIUB16xByMc1jw05SzkiDHje1FVApsiaQf5pTx1NB58o2lLDuHvc?=
 =?us-ascii?Q?Nvm3BiEnBSXxiMmRz1cSydBIczN0BhibLg0MO7PVJ170YSoRTjki1vu5RRwR?=
 =?us-ascii?Q?7Ictb6zubDpKk9WUqIED1/bsdWSbRVfaj/WkPvMpzcCYz09ZC1mXafQjYhzz?=
 =?us-ascii?Q?weyZAaumk40pH9ScHqOZ0gKjRaOWyCPD2203HrpWWLLNb6/jMv5T59/U9TfO?=
 =?us-ascii?Q?7I/kVC/rH9IKg0KWoUwNbT/9J+qHTsrJnpWxllYz64HxTg2/0IWSBftVz4n/?=
 =?us-ascii?Q?/XFD0i8Y6MhCBiFU3y/t024IkmjdNgWIsU5Ns2jgFyhz5E/OOik9uZaDT84R?=
 =?us-ascii?Q?MveYYsWN4gKO9af/8uGbXPm3ASM+swDhKN3dUEWiH8I2j0KtjWO4uUWHlUIr?=
 =?us-ascii?Q?EnD4MNpqwr72v+8G+HJ1iVVz4QStbvzSm3obcOEMMlrmFtrPRJgMBuBra/Yp?=
 =?us-ascii?Q?gZ5PjY+F/JT6j0OcvOvrzMWPf3j9kvW1IrKORjG6oXuYg8VL1zzFIeaKLN2Z?=
 =?us-ascii?Q?UKNbZqCg+s/wqXtGjIiWv92lgcfdWxxokgaIFJBfjSpuT0yXzcSDZQkvT//d?=
 =?us-ascii?Q?5NjkFI/Nuh2dpetHgEg/Lki1sBHa1Q/xrCnbg3Bx/1lHEjCQ4Kj4vyozpRNV?=
 =?us-ascii?Q?v1d00e8Ecl96sNWt7bje4CkE1BSQtOi0I7Dx0mg590qFA5NjRvtV0A9kbGe/?=
 =?us-ascii?Q?O7UjsUGzBXAVFtGQ6TrJFgYhZaZQmzDtM/xCiAjDSRdjH1wP4Sd2vRS5k9Cu?=
 =?us-ascii?Q?tmA1t2td+e7mLkzUTxlGaSnSq6zUolzcAx1BGdjZDCkM482hSdxuBeEHVKSU?=
 =?us-ascii?Q?4IgPl1VqwTSSrUdHK8tT44htqse2IDBM9awICdqKbBgsRWilG/VSW3A4g8Np?=
 =?us-ascii?Q?b++skEwN5OWzOSIPSyABwg42sz9JLWWEdG3U3u1sTQPrCW/Xkm2aUupgaTYt?=
 =?us-ascii?Q?+QjEC2ZSiCHxsvYRw3lVk37Bo+WXxyoTUyg5ZC1i/vNrL9zKruRHZW4+7lAG?=
 =?us-ascii?Q?+yw8cVtnlB28egkhqG+jlXrFC4by10SBbKoyFPK8/pR3R+/+m4zNtNYos8fQ?=
 =?us-ascii?Q?cfivWEuiyo8KZtrYXk8VwL1d9C17sJVDwWGbjw7cqnFfhF7MnWIIlp/VYQjS?=
 =?us-ascii?Q?BFyCVmZgYOU2VUdotLW0nR782kG2o+2yAXoIqLrqlrEzVXHYBd5ZMth66ZQc?=
 =?us-ascii?Q?J6Li2ZUK7ouv/Sc5dY4H6uKlFf6QcQOKBUwlonq1?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7252a07f-1b31-4519-cb10-08daa4964604
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2022 16:50:55.2646
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6Eoc/ftbj4wjN+KdCPgX5cA+EPBZHwcoERvXeYD0VGGpw/9E2+MvYzWYU9a7AV9YzbLgmYUWE3/UqMV2dn9KuRzTsOpVT2f7VH33fWTCJ88=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10072
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob,

> Subject: RE: [PATCH RFC 2/7] dt-bindings: mfd: rzg2l-mtu3: Document
> RZ/G2L MTU3 counter
>=20
> Hi Rob,
>=20
> Thanks for the feedback.
>=20
> > Subject: Re: [PATCH RFC 2/7] dt-bindings: mfd: rzg2l-mtu3: Document
> > RZ/G2L MTU3 counter
> >
> > On Thu, Sep 29, 2022 at 11:30:38AM +0100, Biju Das wrote:
> > > Document 16-bit and 32-bit phase counting mode support on RZ/G2L
> > MTU3
> > > IP.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > >  * Updated commit header.
> > > ---
> > >  .../bindings/mfd/renesas,rzg2l-mtu3.yaml      | 35
> > +++++++++++++++++++
> > >  1 file changed, 35 insertions(+)
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/mfd/renesas,rzg2l-mtu3.yaml
> > > b/Documentation/devicetree/bindings/mfd/renesas,rzg2l-mtu3.yaml
> > > index c1fae8e8d9f9..c4bcf28623d6 100644
> > > --- a/Documentation/devicetree/bindings/mfd/renesas,rzg2l-
> mtu3.yaml
> > > +++ b/Documentation/devicetree/bindings/mfd/renesas,rzg2l-
> mtu3.yaml
> > > @@ -192,6 +192,37 @@ properties:
> > >    "#size-cells":
> > >      const: 0
> > >
> > > +patternProperties:
> > > +  "^counter@[1-2]+$":
> > > +    type: object
> > > +
> > > +    properties:
> > > +      compatible:
> > > +        const: renesas,rzg2l-mtu3-counter
> > > +
> > > +      reg:
> > > +        description: Identify counter channels.
> > > +        items:
> > > +          enum: [ 1, 2 ]
> > > +
> > > +      renesas,32bit-phase-counting:
> > > +        type: boolean
> > > +        description: Enable 32-bit phase counting mode.
> > > +
> > > +      renesas,ext-input-phase-clock-select:
> > > +        $ref: /schemas/types.yaml#/definitions/uint32
> > > +        enum: [ 0, 1 ]
> > > +        default: 1
> > > +        description: |
> > > +          Selects the external clock pin for phase counting mode.
> > > +            <0> : MTCLKA and MTCLKB are selected for the external
> > phase clock.
> > > +            <1> : MTCLKC and MTCLKD are selected for the external
> > phase clock
> > > +                  (default)
> >
> > Why do these belong in DT?
>=20
> Hardware supports 4 pins for phase counting mode,
>=20
> MTCLKA Input External clock A input pin (MTU1/MTU2 phase counting mode
> A phase input) MTCLKB Input External clock B input pin (MTU1/MTU2
> phase counting mode B phase input) MTCLKC Input External clock C input
> pin (MTU2 phase counting mode A phase input) MTCLKD Input External
> clock D input pin (MTU2 phase counting mode B phase input)
>=20
> For MTU1, it is fixed MTCLKA and MTCLKB.
> But for MTU2, it can be either 0-{ MTCLKA, MTCLKB} or 1 - { MTCLKC ,
> MTCLKD} On reset it is set to { MTCLKC , MTCLKD}.
>=20
> If user want to change based on board design, they can use this
> property.
> Otherwise, runtime using sysfs. If sysfs, do we need to document here?

As per [1], it is going to be modelled as=20

  counter:
    type: object

    properties:
      compatible:
        const: renesas,rzg2l-mtu3-counter

With the following counters taken care internally.=20
 count0 :- MTU1 (16-bit phase counting mode)
 count1 :- MTU2 (16-bit phase counting mode)
 count2 :- MTU1 + MTU2 (32-bit phase counting mode)

and there will be a sysfs property for Selecting the external clock pin for=
 phase counting mode.

Is it ok for you?

[1]
https://lore.kernel.org/linux-renesas-soc/OS0PR01MB59223F69EA3215528519F490=
86599@OS0PR01MB5922.jpnprd01.prod.outlook.com/T/#m1ee6f933603c7acd480d7652d=
1ec2e0d9858c842

Cheers,
Biju



>=20
>=20
> >
> >
> > > +
> > > +    required:
> > > +      - compatible
> > > +      - reg
> > > +
> > >  required:
> > >    - compatible
> > >    - reg
> > > @@ -270,6 +301,10 @@ examples:
> > >        clocks =3D <&cpg CPG_MOD R9A07G044_MTU_X_MCK_MTU3>;
> > >        power-domains =3D <&cpg>;
> > >        resets =3D <&cpg R9A07G044_MTU_X_PRESET_MTU3>;
> > > +      counter@1 {
> > > +        compatible =3D "renesas,rzg2l-mtu3-counter";
> > > +        reg =3D <1>;
> > > +      };
> > >      };
> > >
> > >  ...
> > > --
> > > 2.25.1
> > >
> > >
