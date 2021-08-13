Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1FFC3EBBDE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Aug 2021 20:10:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232315AbhHMSLO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Aug 2021 14:11:14 -0400
Received: from mail-eopbgr1400111.outbound.protection.outlook.com ([40.107.140.111]:62048
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229612AbhHMSLO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Aug 2021 14:11:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QLZUDvIlBjSMMUTlbGT7o0nggZT3q27OEqz+TWOmGEsYAgvGaaZU/iRGk24DHFBCNiCIVlZGA3xZXUXpF1MScl33CxkMl83mL1bc3QSaDAGWBOBg5wmkXlvb2h4eAVWEYX3xD7Cn0M2esYMxqmZNNjFpFe/x6qlAxDthSoBnkAcu0fafc6Rqw/vkfAkuhmtPkjFmvmHu8cz4ZdPeODCjAel4JPbEXXMtsoSDfGsoZylUkFskefVf104SMLxJgAIzE6QdzcPk1wD9iZYgYRfFrfrAwTN2p1wZQpedOWggefFsAjwq5OmfGeJ7zAKKo+b06OB7/zyLCFXIWxVEc8ET2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hN9+aVMETc+WlmQZCwlAiMC7koQdchmuSlQpM7ylgwI=;
 b=An+dhTdkVImsDZIFk/xMBVLmHv3WD98LhqATjk29ho7QA7p3qjbCtQgP434dK6HdpzQkBCxzxK25I33+RgGfxeTP87Ebj/ZDQEH54JJhXZGThIrZRZZVWoLpdnkSE0P5oaN2iKaEhoY4z5ok42rzxnycL7HypIBg+2ENCWt4W8Q9jz2JhLKtk9c+T394PKLRp8l94SSzs6fYb/wYQJAPlGC7F7xET+q6xMOsvs2q10L+4eRIf8M/uvYOVUsselWL2LI4SKEx5VR94/v3SWEsDdaAEI8pg5yk2m5OQw0mPb0Cqx4E72D3IkhE4EoPF4lQBXxUDqvkc8c32nlNgpMlDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hN9+aVMETc+WlmQZCwlAiMC7koQdchmuSlQpM7ylgwI=;
 b=jMIiEAqX4j4lXSOoxOVDYS/BifxMbzBHCBNaIRxAsoALF70ymU3jrm3F8mi40Dnc+rk/UT/ry3ln9YgKlyRViBGda/ARHykucGQ184T7DOiDweth15tArJkcZXv4Tx7uRhvR6ZWS+PC2fUZO630lsVx6xCfr1xclFOSFabOxAno=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB2916.jpnprd01.prod.outlook.com (2603:1096:604:6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16; Fri, 13 Aug
 2021 18:10:42 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe%9]) with mapi id 15.20.4415.020; Fri, 13 Aug 2021
 18:10:42 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh@kernel.org>
CC:     Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 2/2] dt-bindings: mmc: renesas,sdhi: Document RZ/G2L
 bindings
Thread-Topic: [PATCH v3 2/2] dt-bindings: mmc: renesas,sdhi: Document RZ/G2L
 bindings
Thread-Index: AQHXiUuw8DvCnkT2NkqFk7HcMcDFmqtxwlAAgAAGJ7A=
Date:   Fri, 13 Aug 2021 18:10:42 +0000
Message-ID: <OS0PR01MB59228CA22DBE9A33DF0ADD1E86FA9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210804161325.26996-1-biju.das.jz@bp.renesas.com>
 <20210804161325.26996-3-biju.das.jz@bp.renesas.com>
 <YRauzGwUUceTmlyG@robh.at.kernel.org>
In-Reply-To: <YRauzGwUUceTmlyG@robh.at.kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a36149e0-ae60-4571-640a-08d95e85a9f6
x-ms-traffictypediagnostic: OSAPR01MB2916:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSAPR01MB2916DEEE6422230A300D225186FA9@OSAPR01MB2916.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Sit2VkIzYhODU6+s8CFRvH6cmxreDOdmk09/QDYpUm0uSiwGa4VmGkUAe+tLMN2G9cyNEyW35uKTWqVsIznEjNRr3B2r+YJF61K2rj7nt4zKOtgd9Gvx8wnS8vBxtLyZLc8b5dz0Gr7htELN1VDpyjK1+rwwvwivm56f0QyzStGHjozekcKA5m/4+X3oxisVUr06S8Qz/G2cG2UQkfNKJIKD+nGFdg1d9rsl24oJ9te1XHxq3MqMu8ZSWWRQTbmFWzaZfe49Q4mSU+is9fiBUMIKQH1znlLvqZW8iDJ1Kx7wP/TKmzhVhYpznxf9jb5eOUk4BkH6fa/3YWDUrPUz1RO6hPNJvCSB7UAY5fn0bffGL0tB978Tx8ELF/HnzDdoJhOVTr8b0D1OlybGRH4liVxVJ1kx/2gcOijXAMLQP7AEq10VJiqNumIT8ib2zQzVqsxB+qpAeoN8jldCgDij0rxnRClhyZCBP+OZ8KALdEYEYhhdnxJFv8k005RBQaLB60yHanRtMqb+w/qLalgvaVpNTa33wyd2N3+pHiW+q4aj/yarVHpCipB1n/5nLSH+0bugN35BE5t17DrCgXod/SNfNIGh+YvCecQdaOn1q2QQbOdYSDV2qBGwd7Qg8j5wGtyR3n+ujas3MSWUc285m9bzYxHeS8YaGv2OOHlPECRvQR2alJBzGSqvdfH0oox8toiuShQLx1Se4PGsy6WFZA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(39850400004)(376002)(346002)(86362001)(83380400001)(316002)(52536014)(478600001)(54906003)(71200400001)(55016002)(9686003)(33656002)(186003)(26005)(6916009)(66446008)(66476007)(66946007)(64756008)(66556008)(8676002)(6506007)(76116006)(8936002)(7696005)(4326008)(122000001)(38100700002)(38070700005)(2906002)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CiR8NmsA99Q3Q7Z1g4r5zV23ebBA8YW/m4h2IHTesMr3dH8BAaNxYMT2sNUj?=
 =?us-ascii?Q?IfQjOBh9Z+3xQNBdFZPpoMq6YAO83MC0LHyTUybSc2LJttPzfH2aO8/UCWYH?=
 =?us-ascii?Q?aeLJpPDxcYpDjTfdXw9I1yrW+HNUSdo8M7quSq0keEIVkqebej19Fs2Mw9SX?=
 =?us-ascii?Q?iC0CEDyAiI2g/dUMSckMsoybjtiZjL1Tog5UMvLz3Fkvrk4OSR67Jaxpmg5J?=
 =?us-ascii?Q?jE3ZaCa1BuUbgHH+PH3wMtqH2WauvYZShPCDVR+bO7ylnUBTjEViZCl56n3B?=
 =?us-ascii?Q?bhXAcX8FgWNZO8ynlhfrlSAoAg+dQKaBDhw6sWJNYY/ksMk8r3gMRh6GJrGp?=
 =?us-ascii?Q?ucHoVZ6U7ACeca0xG0tylNAZRH8W3763nwjDDbXJS7iuY2tCFJDHRHT3dvfy?=
 =?us-ascii?Q?m0xhCTncoHM+w3ZKhFXeMJ49TzaLXg5v5olYJigC9ICAp9+bqkkDu81CYEX5?=
 =?us-ascii?Q?qOVsGsD6Gg++dVaDSWkosXp7Oapf9wK/HOooPWhPC+UyNr+qAmrjOUwVXo/v?=
 =?us-ascii?Q?l9lZHShtQA3bpBcPst+qeg1TCnn4M/RNci3zFJmxx2+2+Fje3Z7VU1EmkNjn?=
 =?us-ascii?Q?H7vNCHPIrrC1NywffMdsTZJHojtyxGj9hrXmfjvQLnpYzHPK5PEXSo6G2D5d?=
 =?us-ascii?Q?2JilUdjzbxk8P1wK9VBMuZO2C3Q5PNm/ndGbXIb6jUkVIez8sH53OjeFGKQD?=
 =?us-ascii?Q?e3vZFBD+qaaV9FyMTEbCR22siPBS+1reOWIpKhsJOPGdSLX6irKn8GS2XUsC?=
 =?us-ascii?Q?h+GB3iAsNyf20QWzBkOT42ji1ScXTMF4HdaeZj4QlmcLCg5vM1tZvDenkCYd?=
 =?us-ascii?Q?Hy/7D9VL8koFvtIs26MLUNrUy6oFJ5ioim4L5O4J1FnOyT5cePwnDPAevj3f?=
 =?us-ascii?Q?yJVZdqcs2onq5p2taLYPyphjWjaUZrtyjcQY4QxQap9sNY1nocUJVfcJg8BU?=
 =?us-ascii?Q?dMOlAmBY2gd5bpAZotESJ4j9xMprs4+wCtu50HCZ+zHgkH6E2uGX1WHmLECl?=
 =?us-ascii?Q?d97qzyTqAAufagZd4+k0eRNg0mzIn7OI8ySnAjVYRhrzOv2U7EaWD72HmIy8?=
 =?us-ascii?Q?qZUvehhMuY+B2TbowP6RJalUTMzlk9uQXFw0pHN8wcm43P27KzCpIUwvB3d4?=
 =?us-ascii?Q?70E5u8sAbr82yRM0rlDw3maTH3DyVLhHaflm/8vU8Us5WkT3YNjRlamRjcS7?=
 =?us-ascii?Q?x4r/nB0XRn9LkGk22hk+TFMded+8DaP9IUX4UAYXBCiTIHKX17necYS6bil9?=
 =?us-ascii?Q?KI59DfHwnNx95JlF+ApIoNnwK+aNJObHHMPdvZmwDk1KjKStlUjUcnF9NFQx?=
 =?us-ascii?Q?0/5b2HIZAKeX1R4GeyViLDnW?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a36149e0-ae60-4571-640a-08d95e85a9f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2021 18:10:42.3539
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gWvNrrKNJxY8hc38vDIkql0l7JoJWCKjiOHg6bMNfRyDNFeFVe5kaFALrDQs7b2ZWR25EetwIMr6MPbHBYqpUm99sg3yANtxC11YctAmigE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB2916
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob,

Thanks for the feedback.

> Subject: Re: [PATCH v3 2/2] dt-bindings: mmc: renesas,sdhi: Document
> RZ/G2L bindings
>=20
> On Wed, Aug 04, 2021 at 05:13:25PM +0100, Biju Das wrote:
> > Document RZ/G2L SDHI controller bindings.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v2->v3:
> >  * This patch depends up on the previous patch in this series.
> > v1->v2:
> >  * Fixed dtbs-check issue for RZ/A{1,2} platforms.
> > ---
> >  .../devicetree/bindings/mmc/renesas,sdhi.yaml | 54 +++++++++++++------
> >  1 file changed, 37 insertions(+), 17 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> > index 543eeb825dc3..e195ee5c0900 100644
> > --- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> > +++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> > @@ -44,19 +44,20 @@ properties:
> >            - const: renesas,sdhi-mmc-r8a77470 # RZ/G1C (SDHI/MMC IP)
> >        - items:
> >            - enum:
> > -              - renesas,sdhi-r8a774a1 # RZ/G2M
> > -              - renesas,sdhi-r8a774b1 # RZ/G2N
> > -              - renesas,sdhi-r8a774c0 # RZ/G2E
> > -              - renesas,sdhi-r8a774e1 # RZ/G2H
> > -              - renesas,sdhi-r8a7795  # R-Car H3
> > -              - renesas,sdhi-r8a7796  # R-Car M3-W
> > -              - renesas,sdhi-r8a77961 # R-Car M3-W+
> > -              - renesas,sdhi-r8a77965 # R-Car M3-N
> > -              - renesas,sdhi-r8a77970 # R-Car V3M
> > -              - renesas,sdhi-r8a77980 # R-Car V3H
> > -              - renesas,sdhi-r8a77990 # R-Car E3
> > -              - renesas,sdhi-r8a77995 # R-Car D3
> > -              - renesas,sdhi-r8a779a0 # R-Car V3U
> > +              - renesas,sdhi-r8a774a1  # RZ/G2M
> > +              - renesas,sdhi-r8a774b1  # RZ/G2N
> > +              - renesas,sdhi-r8a774c0  # RZ/G2E
> > +              - renesas,sdhi-r8a774e1  # RZ/G2H
> > +              - renesas,sdhi-r8a7795   # R-Car H3
> > +              - renesas,sdhi-r8a7796   # R-Car M3-W
> > +              - renesas,sdhi-r8a77961  # R-Car M3-W+
> > +              - renesas,sdhi-r8a77965  # R-Car M3-N
> > +              - renesas,sdhi-r8a77970  # R-Car V3M
> > +              - renesas,sdhi-r8a77980  # R-Car V3H
> > +              - renesas,sdhi-r8a77990  # R-Car E3
> > +              - renesas,sdhi-r8a77995  # R-Car D3
> > +              - renesas,sdhi-r8a779a0  # R-Car V3U
> > +              - renesas,sdhi-r9a07g044 # RZ/G2{L,LC}
> >            - const: renesas,rcar-gen3-sdhi # R-Car Gen3 or RZ/G2
> >
> >    reg:
> > @@ -68,13 +69,11 @@ properties:
> >
> >    clocks:
> >      minItems: 1
> > -    maxItems: 2
> > +    maxItems: 4
> >
> >    clock-names:
> >      minItems: 1
> > -    items:
> > -      - const: core
> > -      - const: cd
> > +    maxItems: 4
>=20
> The names need to be defined.

Will do. Here we have 3 cases, single clock-name for majority of SoC's,  Tw=
o clock-names for sdhi-r7s9210 ("core" and "cd")
and 4 clock names for sdhi-r9a07g044 ("mainclk1", "mainclk2", "hsclk" and "=
busclk")

Cheers,
Biju

>=20
> >
> >    dmas:
> >      minItems: 4
> > @@ -135,6 +134,8 @@ allOf:
> >                - renesas,sdhi-r7s9210
> >      then:
> >        properties:
> > +        clocks:
> > +          maxItems: 2
> >          clock-names:
> >            items:
> >              - const: core
> > @@ -146,6 +147,25 @@ allOf:
> >          sectioned off to be run by a separate second clock source to
> allow
> >          the main core clock to be turned off to save power.
> >
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: renesas,sdhi-r9a07g044
> > +    then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: IMCLK, SDHI channel main clock1.
> > +            - description: IMCLK2, SDHI channel main clock2. When this
> clock is
> > +                           turned off, external SD card detection
> cannot be
> > +                           detected.
> > +            - description: CLK_HS, SDHI channel High speed clock which
> operates
> > +                           4 times that of SDHI channel main clock1.
> > +            - description: ACLK, SDHI channel bus clock.
> > +      required:
> > +        - resets
> > +
> >  required:
> >    - compatible
> >    - reg
> > --
> > 2.17.1
> >
> >
