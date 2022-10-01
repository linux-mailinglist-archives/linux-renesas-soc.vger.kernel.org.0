Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 042385F1DAD
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  1 Oct 2022 18:36:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229623AbiJAQgn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 1 Oct 2022 12:36:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229730AbiJAQge (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 1 Oct 2022 12:36:34 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2122.outbound.protection.outlook.com [40.107.113.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A04B6565A;
        Sat,  1 Oct 2022 09:36:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fCkkC3m+MZ45rQ9vmZrNz1iTXD2e9DF0VRRl0070m14cbcaa2g+Tw65phZa788f+ab+EX7vlzIdSnfVWfZh3ohBQf1YtNdzcDcEoQjrFdzpvpKEfilg/4xXGCqZdaP+3AZ58imEPo9o9iQDDHNgUqnEHKDpLzMpmN5Ob1MoGSHawQbDoneuC17NiB0BP+VuIvK53vImMCdG5h5Tr4OY04uxY1zWo7jJzrFIlyZcRRWbmri2jPZnis20VRjGFIBQbqyIIYYaNqCcV/LCSFIxWlrdIpGBwtf0j8FPDMowJumAJ3uep7kpRpJQo+qhH1rLwR7eoU4OV4vGaJPlCZenmGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PzBldWUzMc9reW/ogzsD/mQ4qOmPBygOnQoI29qqGqA=;
 b=UzItYXlwn4OY9qWT9fS0xz7JDjAw7pGgLSVitCalfup+j2MdMAEJA58d/VrHLZ5Apsybq+HeEcn8YOgyZZe0qrxAVavEx1ov6Lpkx9vLVGN8U4cbcXe1wABHdbbBcgAdkLFykWYauDvI1e+tpScOynKgypGyozF1B0vxicw7jz9QrM671IjLlwJkAUrh4xtDkIRh8c0zfL16qiCjlFGHfn18EPGfqTO+LZrKEW1lbGGOjRm/786zTsgQkVjTRUOjX1dm4WYETTQjnCjGSayQz2+kEziKWg8W2+uE+dW0L45KUEcwkhhEdgJiaRjBuofFtfXRwTDBWOs1WPIE63g+8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PzBldWUzMc9reW/ogzsD/mQ4qOmPBygOnQoI29qqGqA=;
 b=OHLTOe5YxnimlmdDXl+hVdzdTczD4H6QscSJgApHX88FwbFj0AczdPh23rJs9NwsjuJgZ/xqfzkW7SpqjrnwIfZpVsjvDW77SzwTr3rbk5bhOMQ7vF/wNrUoek42Sjn7NpIaqOxpAN0rkZ3yQSIeYUZ+E0W5k/nABUmclLKFKFg=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB10139.jpnprd01.prod.outlook.com (2603:1096:604:1e2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Sat, 1 Oct
 2022 16:36:26 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::73a6:588d:1198:7262]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::73a6:588d:1198:7262%7]) with mapi id 15.20.5676.026; Sat, 1 Oct 2022
 16:36:26 +0000
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
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH RFC 2/7] dt-bindings: mfd: rzg2l-mtu3: Document RZ/G2L
 MTU3 counter
Thread-Topic: [PATCH RFC 2/7] dt-bindings: mfd: rzg2l-mtu3: Document RZ/G2L
 MTU3 counter
Thread-Index: AQHY0+6QMJg3ImvQdU+tHO/G3uPsOq34VrSAgAFnmeA=
Date:   Sat, 1 Oct 2022 16:36:26 +0000
Message-ID: <OS0PR01MB5922F394728BA8ED1B2828BB86599@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220929103043.1228235-1-biju.das.jz@bp.renesas.com>
 <20220929103043.1228235-3-biju.das.jz@bp.renesas.com>
 <20220930190311.GA651384-robh@kernel.org>
In-Reply-To: <20220930190311.GA651384-robh@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS3PR01MB10139:EE_
x-ms-office365-filtering-correlation-id: 361a39e2-f56f-4002-fc41-08daa3cb15c2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SaEsCDl8GuiSNhQINUqsLiq7wZ8vm9IypZ9iCFo+S8AmAnYkQLvxqVGce93vEL3fXPuCxJuGmHZELJ6HotaaWYOPBSUsK3ie7LRxUpeQesRXhHVAdWeNk2Vd8DqNAKTJMMchPBmWxCHM2ELDjKh1+bxtOBDxvfI9Ayubkdg+XsSH1RtFc6u9cxH0hm5sJV8XHW/Rr06g6Mad8pAxZFD8NeBvvHrhhJ7/u16V5osCdcvDWp+YCRznE9iInvryd7SB7+rogu3YHH//MksNGuvKGAjQscBYfT79+BLLEsBFhUsUj1y9Xp3VXILb9BvLtNYLL+MGC1xH+U1+KGzd3di6uvzBK9pKidqffTIqYj921QpVxdnH1Kiy9eqU+CZMFpqhxdWP4fWnOKa+efOoK2wCWuFZFizVADt9C+IQelO9rGjn1EwH5AChzVWzl7nC4GP2T31sYWMHzP70aBYN/QMYldgRWQxllTvi7psSPFd3UGx9a1QT3sgIhAeOSl8nOSd6ezoZtgj2CWCpVxxNMRDTPPhhcpxc58yVHwuqZpjuwPHNIu10pS9/Id/rfeqfOeeH6I9cSR19Z2RcSLD8Tj2HN++eXupxz19SOQpaaVtojYvYqLqwx0p3j20vSR2bHiKs3CRoDdr8Nb3amgdT+Q8AehBq5t9i2C6pC9PW63hHr2C10AP5drVEc/LhV2YeOQbV+VxIlcYKMDCO98JZYZkcj+w8Oq2VaZblNkWWolMzPvvO0c60bwPzxvyjsKjLertW6PZNb92DTH76vecCyCvK4Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(366004)(39860400002)(376002)(136003)(451199015)(38070700005)(122000001)(478600001)(2906002)(38100700002)(71200400001)(41300700001)(6506007)(7696005)(83380400001)(4326008)(86362001)(8936002)(54906003)(6916009)(316002)(64756008)(66476007)(66556008)(66446008)(52536014)(8676002)(33656002)(5660300002)(55016003)(186003)(9686003)(76116006)(66946007)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/VrZTFJ8PRhzkMe1OfeNqS/2WUMBM2DKDNjHmDpSJlwFLQgh2eWpxRblJWTB?=
 =?us-ascii?Q?Q8OT3KKNBIg9K2k2uoqy47bIRh1qv1ZKg9VQBP78PsInmJP+1+ujLUzESvNf?=
 =?us-ascii?Q?noBDqqT4oLpqWK4hoBiimHGMfjS8/nGEXvfgBsNq5cG8778YgKA/Jtq+Ha4a?=
 =?us-ascii?Q?gaoGH9zzT6rC84gvv+lTCCQcYb0auDSayh4N7f8W3eQuJbGHHdKAOK4cHpCd?=
 =?us-ascii?Q?NxWjmMJzCViGBpma5PB203anN5qM3Ed0ySg4d0ALmQqL3Ss/hEdFWgQHOklv?=
 =?us-ascii?Q?LbgCyzGOzDj2QHFjGqL0TT3aoJDZzDz/gK46f9HEk9pPHqfh7KG9uXt/tiHl?=
 =?us-ascii?Q?wOmhuBjgImvv5R7A+4jTGSmR5HoYtLNkQNh5uwogGTFRs/OxEd2b8FWBdwyQ?=
 =?us-ascii?Q?5oQywBQfsBP7jfJDf4Ny3++svTt1wahkazJHwkt11QWk1H0xW2QHk8zXrAJo?=
 =?us-ascii?Q?SgZegWXbLJdKjqV5Ua9dXao7Ba2bXhkup9+foYz/qgXzxZeYHZ7e60n+blxE?=
 =?us-ascii?Q?i+6ahYV9Lduadi/NFTfVmTHxKkuctnN/ZV0Ooqrrksw6KB9011sO9DSGY9eh?=
 =?us-ascii?Q?iU5tP0hNKkvm1eV5hbBZ6UA7baTK/kSyrjJ6fxHKN8v7eeJONkNI0r7gRyfH?=
 =?us-ascii?Q?WDhpolb+36v2J68A+v/3+3GylaOVB4EHwPy0qluskbelygzpK2z7DVkflxT5?=
 =?us-ascii?Q?6gXyKdEdcLS/wkcO0JI5wXBbWiCXWT/Z4+kn95LQq8UpzG4i9nmwRCco0GeI?=
 =?us-ascii?Q?VlftErqKxYnFwYOGD0BZ0ORFm1INvS0m7XrcYVdy/a6v6CY6CNhE3j7F5gn6?=
 =?us-ascii?Q?TMz7wjQE7/k38s7y+W2p6Nq2q5oHEzzRELDTBynF7ZK+g4jhWqsa8IageJh1?=
 =?us-ascii?Q?OSAmT/IURxZEVxQhoYrJ0NMdG2MWWxRwjP4PT0UYOFIVHmprg3BAipu/atgz?=
 =?us-ascii?Q?CuWM4evVLok3OWWmjcX3juU+k0JcTeY7JJ+VPMJ88QtEmviB2uun0iVrRbQe?=
 =?us-ascii?Q?JcR4m7gzHAIUtasA1/qUP437SVRf2vCyay6xY6lxe1E7k748xRnhJlDNuWMm?=
 =?us-ascii?Q?Q7U/BL5dvmaBq2Nk0xjSg1ZxHvCwaj69ZFFsOwDZPJBGt5X31EfZjytynstc?=
 =?us-ascii?Q?RcsNc5whTolvDsZp+3sE/YE7+D4KAQuGyezLZB0MVvDOoBWxdeWQVIUAs8Dw?=
 =?us-ascii?Q?gN+ZIbxftLkqJ9Vf9NycGUjh0I8FYadBoFtf7YcDXPI6xncnPzSBGEMoi9zF?=
 =?us-ascii?Q?okUnRkWlUdxxIm9YLMKvvf6q4txbV4Moh9ZuJ08rjbNk89pH2tPgatm8MFzx?=
 =?us-ascii?Q?esB9sLkl/5hX0VefaPI5HUAnIcEs6u1wkXPNRiTgNUMs2+Yv+PdHqNB6fZHD?=
 =?us-ascii?Q?61mQzS6UjIs8PD1Nxc0M3qsuq1buNx8CwFMdro3fdg3lH/Rqngt7sJkaLio2?=
 =?us-ascii?Q?AnVtqoFk0za0jZu8G8bjlH2JKnuS3suDF10heWbqLTXI//FDc4aPTNU7JyJ/?=
 =?us-ascii?Q?PxMOT10gPBjgWajB2Bg/rriGcwmr3L0eLqz6033vzJf9BmXCIYGFIaUs/Qqw?=
 =?us-ascii?Q?NpxwTjSzcgOAoy3xWEwnmUiDDLKnfm6JKmdHPUQE?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 361a39e2-f56f-4002-fc41-08daa3cb15c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2022 16:36:26.4823
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FzK53y2k8kAbNcczjOlPqKINmOBy9e+QmJ+0ZsRq5SQqBGBGo59t34eBFYjeVQgDSVe/1+NZM+NAfNKtH7nE1RoMvqEkWqD1U/09rC5CI1o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10139
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob,

Thanks for the feedback.

> Subject: Re: [PATCH RFC 2/7] dt-bindings: mfd: rzg2l-mtu3: Document
> RZ/G2L MTU3 counter
>=20
> On Thu, Sep 29, 2022 at 11:30:38AM +0100, Biju Das wrote:
> > Document 16-bit and 32-bit phase counting mode support on RZ/G2L
> MTU3
> > IP.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> >  * Updated commit header.
> > ---
> >  .../bindings/mfd/renesas,rzg2l-mtu3.yaml      | 35
> +++++++++++++++++++
> >  1 file changed, 35 insertions(+)
> >
> > diff --git
> > a/Documentation/devicetree/bindings/mfd/renesas,rzg2l-mtu3.yaml
> > b/Documentation/devicetree/bindings/mfd/renesas,rzg2l-mtu3.yaml
> > index c1fae8e8d9f9..c4bcf28623d6 100644
> > --- a/Documentation/devicetree/bindings/mfd/renesas,rzg2l-mtu3.yaml
> > +++ b/Documentation/devicetree/bindings/mfd/renesas,rzg2l-mtu3.yaml
> > @@ -192,6 +192,37 @@ properties:
> >    "#size-cells":
> >      const: 0
> >
> > +patternProperties:
> > +  "^counter@[1-2]+$":
> > +    type: object
> > +
> > +    properties:
> > +      compatible:
> > +        const: renesas,rzg2l-mtu3-counter
> > +
> > +      reg:
> > +        description: Identify counter channels.
> > +        items:
> > +          enum: [ 1, 2 ]
> > +
> > +      renesas,32bit-phase-counting:
> > +        type: boolean
> > +        description: Enable 32-bit phase counting mode.
> > +
> > +      renesas,ext-input-phase-clock-select:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        enum: [ 0, 1 ]
> > +        default: 1
> > +        description: |
> > +          Selects the external clock pin for phase counting mode.
> > +            <0> : MTCLKA and MTCLKB are selected for the external
> phase clock.
> > +            <1> : MTCLKC and MTCLKD are selected for the external
> phase clock
> > +                  (default)
>=20
> Why do these belong in DT?

Hardware supports 4 pins for phase counting mode,

MTCLKA Input External clock A input pin (MTU1/MTU2 phase counting mode A ph=
ase input)
MTCLKB Input External clock B input pin (MTU1/MTU2 phase counting mode B ph=
ase input)
MTCLKC Input External clock C input pin (MTU2 phase counting mode A phase i=
nput)
MTCLKD Input External clock D input pin (MTU2 phase counting mode B phase i=
nput)

For MTU1, it is fixed MTCLKA and MTCLKB.
But for MTU2, it can be either 0-{ MTCLKA, MTCLKB} or 1 - { MTCLKC , MTCLKD=
}
On reset it is set to { MTCLKC , MTCLKD}.

If user want to change based on board design, they can use this property.
Otherwise, runtime using sysfs. If sysfs, do we need to document here?

Cheers,
Biju


>=20
>=20
> > +
> > +    required:
> > +      - compatible
> > +      - reg
> > +
> >  required:
> >    - compatible
> >    - reg
> > @@ -270,6 +301,10 @@ examples:
> >        clocks =3D <&cpg CPG_MOD R9A07G044_MTU_X_MCK_MTU3>;
> >        power-domains =3D <&cpg>;
> >        resets =3D <&cpg R9A07G044_MTU_X_PRESET_MTU3>;
> > +      counter@1 {
> > +        compatible =3D "renesas,rzg2l-mtu3-counter";
> > +        reg =3D <1>;
> > +      };
> >      };
> >
> >  ...
> > --
> > 2.25.1
> >
> >
