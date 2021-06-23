Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E80A03B1C50
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 16:20:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231303AbhFWOXG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Jun 2021 10:23:06 -0400
Received: from mail-eopbgr1400127.outbound.protection.outlook.com ([40.107.140.127]:8456
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230292AbhFWOXF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jun 2021 10:23:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C0bXdXu5FTNHVsheKIns63DWo1In4S0s1L0QAHIBwdvi1jj3G46TIWMnr5gUIg/Sy8ZM8devOq7gGaZaTDolsQAM+a/U73gPEJSKraQRwaH69J0Rrm+GKlohGF0d6Llu1tLor6mFuuN2c3SstPg60gUEUBJhC7A74be+Ud7yACQU2VrUHdvOv1rw2lrJPLU0CRssQbv8L7b3Xjl/v5A84Orl3avsvVCPKnRYfcRn1oSccw+ER9dcM++hbRWBTaKrGMj0gLjv+imbk6pEaAFj8XJL6euzB0mjhu4P2ZuKsJNnE58O4+7t4byPa1fk5B+AVUuDcPbUOV8uWIj89rpgNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MWKdXDtRmyZ3VKbOJNnZrVRAnIk9wdFUm14RqxXjL/8=;
 b=BswdLS2mGmHtCgWXN//3fx3ZAOBK8xYMMdqZxfGSgTbfe2jmKCv89e7tOJoZtUYvqnOIIAObdG71UDoWmJVHuMhqhGPCOQXfPiYl6WfjkxVwilYW3LKL/me09rxofeKV8WmuiVe1HU8nUKlJtcYTkIODBabFUd2JINBuXPIUOx/yDI2z3vjG2rK8R7wwFxbXypTmdqM1pcJ7Nn0FVMS6Yf3qC9gr1KssX1s3MGl1L/Ps5jQJbywXzrWcsvtni2PEHG44EN9YcRXnPPFDVlmFXPraLBWdAjYI7BJDNMflc2wCwXgJKy+XAMPRdcXgz9RvCYCZ5e1VRgFks2cjW9kCsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MWKdXDtRmyZ3VKbOJNnZrVRAnIk9wdFUm14RqxXjL/8=;
 b=H4qqP4bJ/TI6sDHgxSSLYjuOavXqAjm1sBkgzpHZ9slNcTenZyKWceim/LSfzIngDBT8mHc91lXY3h8rvvWbnFbi9TOnyenJkIkqKgG/kz+vw59exRcKlAmNDVpxMBA58QQIvLtfy1tdWbFaREo9Be7yGrfp/v4uX6yhLqGLMlA=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB6487.jpnprd01.prod.outlook.com (2603:1096:604:e1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Wed, 23 Jun
 2021 14:20:44 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b834:5e50:2ce8:9ae0]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b834:5e50:2ce8:9ae0%3]) with mapi id 15.20.4242.024; Wed, 23 Jun 2021
 14:20:44 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh@kernel.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 06/11] dt-bindings: usb: generic-ohci: Document RZ/G2L
 SoC bindings
Thread-Topic: [PATCH v2 06/11] dt-bindings: usb: generic-ohci: Document RZ/G2L
 SoC bindings
Thread-Index: AQHXZoFtyAkoi2PHe0KRV4IWK/6abqsgbSuAgAE4hCA=
Date:   Wed, 23 Jun 2021 14:20:44 +0000
Message-ID: <OS0PR01MB5922FAA0B3C8896E63BE545586089@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210621093943.12143-1-biju.das.jz@bp.renesas.com>
 <20210621093943.12143-7-biju.das.jz@bp.renesas.com>
 <20210622193043.GA4176942@robh.at.kernel.org>
In-Reply-To: <20210622193043.GA4176942@robh.at.kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=bp.renesas.com;
x-originating-ip: [86.139.26.177]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 33ef6d98-7a26-4c4a-5c64-08d93652169a
x-ms-traffictypediagnostic: OS3PR01MB6487:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OS3PR01MB64875D7F9E5AA5FDA6AC22CC86089@OS3PR01MB6487.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bfDsA27mrTAdXvo1CRs2WRy1VJWCk4dU4/taXXImmXmOdLtihCmCSPB8tcowY/kZ28wbUEKxGb15ALNgXmCftCw3ATgEh7dsFE1Xch9n/sn6/MBZ+qKYQcqpuGHcs7lqC1SX30iA9bRYChG9o1mONLQ2Yi8zCWlf9TayjeCHV6S/aCcChOuGqOxLtkybTVl61uufzeNTr6uCd+XHeuCFdWOm6sTCBWxTs9rgZY+jzn54C9b/8QNVdz0ky0+TyDHCDzMV+B+uLzRJiRUWCwRtq2ForaVziNqr56aN0YbW2mzKYoNbF4r+q95X3CDxDmA0Oew+DGruSk56B6k0PU9J9jv2Z+K3xb1aIhxGMQ9NbFYTV4zXyBtc0x0SMhtDrXWQEcbvKM9Rkl9imWiKez6YaM+p3rluKpd5SiUQKgMulxm83l/2KreVEmIY0pOBZ+TjOkwRbcyEdUkoWtbPEq34Z9dDwNyyJidcDjw0Vq921HHfE9JNI2VpsicU+3CORNQeVO0nCeJszTwUv2bui7P1IJH9yglqIafFrn3BqlBVM7qhvzJx6ceDSdIXlBq59mKxs8g9g1RJngnovVtSotoE23GA53GFdbDhVMvwGK00FqE6neLHO5bFVRJO8dg5btr+KKCuKSgOehEoCiy38l9K8MpwZU134ViRhrupncjR2WnbxGqgwgyl4h8BFasaX5wlgkr2MqB25jrNb2YMHnX4rU1i3ljOqMCR1DkJXqdkylBuogV0TWieu90oSnl7TaIlsHkvEvH4AE8WsT21cPldvA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(136003)(346002)(366004)(396003)(83380400001)(55016002)(54906003)(38100700002)(9686003)(71200400001)(966005)(2906002)(122000001)(478600001)(86362001)(316002)(26005)(5660300002)(8676002)(76116006)(52536014)(186003)(7696005)(8936002)(6506007)(66946007)(6916009)(66556008)(33656002)(4326008)(64756008)(66476007)(66446008)(41533002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9vfxfg0+MQ6y9VUi8qon2KDBU1BBOOT/gTPyuXNhte80+KfeCM3o5uAYJbyX?=
 =?us-ascii?Q?gA4TLXweStASIx/moFLmZhrlIyqb9uAwKvtt2QNIRaD+djOMGZAnFkfJDBX1?=
 =?us-ascii?Q?1jq8W4xg01jYn7zOh0JwpLdNWyu+h16CkdhLXkD+SS0U5Af1EzX7AwVmfC+4?=
 =?us-ascii?Q?Zf1j71m7l6Ajc2q+oTv/m0DD3rBhFmeUiL49QFcEQYn0eqtVmEJHTCRI9dN6?=
 =?us-ascii?Q?OxM00jHTCfU57FUUHtZRaZHhbFu6hfa2elcl5H6R/iaP/WabTTyE3gimzfIY?=
 =?us-ascii?Q?w6WSyLz4CEWmZLSnxpgvWi9G52zymh3RCQo4ErgjTekOlXFvDDMdIn99ZIP6?=
 =?us-ascii?Q?XRwUoXEL6bqquqCdGqiUb8G7C6YQXYbAjLcrByPpmcDgyQzh3Tbarli5p6Cc?=
 =?us-ascii?Q?flwYtrcSAcENqLX5oV77elV7R3cfLN+xxH/LunNHmKcWHOjZnPjkpQXxbYwm?=
 =?us-ascii?Q?FkhljVkam8jGox9PNyLytb34Yz2IcfaJ0vWQ5M+6uSgxTvH2M8bsDT5ZfEcu?=
 =?us-ascii?Q?UfVUeByXP1rpmSi3UxbRuKAfCj15/STTnPtrQ+8GBJEcdzCJgipJsKcB1+dQ?=
 =?us-ascii?Q?YnPov2JZ1/cpW0FGJFV0ckKl/GfWs03DY7G7nZz9KKMsUvAZJyhvgDPCTdDS?=
 =?us-ascii?Q?IPfDt6sYzRWLfpQ0yCpakcgDnh4v7POS3gmOGPLj5Wqc7kE2oykvcnaZJxzD?=
 =?us-ascii?Q?9WJ3bCDb3EDaAwgOcwg6d0UEFgc/fb/aSZlsGvcM1Zp6UQpINoLY6kx1Wmj9?=
 =?us-ascii?Q?a0B+Ob82xdczdqEXsO3c1nguiSTDnqnhsZ5Vk3bDd2/NpT3HrM2cJvH0YEYO?=
 =?us-ascii?Q?5fOrTNbmXFLgIunRJGKIrerjPklR7cBYllmQj41DR3TOB9VXf7fargXtK31D?=
 =?us-ascii?Q?ZoYMASykDOkKv0uhgsx8Fg9eccWmdroTpekOUzWNc8QhbPPhnGZUr+KyDoSd?=
 =?us-ascii?Q?8eDFWZJdcVJ0DoRCRso2fGLwaZFVLLjSim5f57Q/d6sf9JOhztEdortPdsF0?=
 =?us-ascii?Q?bpPZqYqe/QsRSJ2udv68AnqNDZjzgHiLw1CScL+ocrAYSkb4MpgDMTMYd5Xs?=
 =?us-ascii?Q?tKjsTmwVd1qVGOLPbnp8eXTg2uuhbOeIFV12K2s67Z8ULBPESFn00YZ1Skwx?=
 =?us-ascii?Q?uIKJHfI2Xorf2vtumOrElG+7WBUHqisl+Fasjep26FRgVac8Zgr9sa/9LUBV?=
 =?us-ascii?Q?tlvplflZehS4NVbOcFNhsCAuxoim5AKjgEXwAiztslHAhCTEl9LKwdqxe9JQ?=
 =?us-ascii?Q?EsvTlorxkqlkNOEOS5AvcPaPafKtYhJopVz4ENKpzeDvKFN3vFEoyq61uQam?=
 =?us-ascii?Q?VP61VoNbK+3hcgX+LforKMXT?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33ef6d98-7a26-4c4a-5c64-08d93652169a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2021 14:20:44.3162
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J+K7uMNd6t+pj2WyIwYx2immnuxgaAm7yrnUT+QKaOlN6kUwZ3tr35wjnqmEdeqU5aOpae1kcNjbEA7cfSOIC8gTo/1Nu2wRgOl2qTNN7Hw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6487
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob,

Thanks for the feedback.

> Subject: Re: [PATCH v2 06/11] dt-bindings: usb: generic-ohci: Document
> RZ/G2L SoC bindings
>=20
> On Mon, Jun 21, 2021 at 10:39:38AM +0100, Biju Das wrote:
> > Renesas RZ/G2L SoC has USBPHY Control and USB2.0 PHY module. We need
> > to turn on both these phy modules before accessing host registers.
> >
> > Apart from this, document the optional property dr_mode present on
> > both
> > RZ/G2 and R-Car Gen3 SoCs.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  .../devicetree/bindings/usb/generic-ohci.yaml | 32
> > +++++++++++++++++--
> >  1 file changed, 30 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml
> > b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
> > index 0f5f6ea702d0..c0644fae5db9 100644
> > --- a/Documentation/devicetree/bindings/usb/generic-ohci.yaml
> > +++ b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
> > @@ -8,6 +8,26 @@ title: USB OHCI Controller Device Tree Bindings
> >
> >  allOf:
> >    - $ref: "usb-hcd.yaml"
> > +  - if:
> > +      properties:
> > +        compatible:
> > +            contains:
> > +              const: renesas,r9a07g044-ohci
> > +    then:
> > +      properties:
> > +        phys:
> > +          maxItems: 2
> > +        phy-names:
> > +          items:
> > +            - const: usbphyctrl
> > +            - const: usb
>=20
> Why can't your extra thing be last? Then you only need to set
> minItems/maxItems in the if/then schema.

OK. will move this to the last and will take out phy-names.

>=20
> Though this seems like an abuse of the phy binding. There's not 2 phys,
> right? Just some extra registers related to the phy? Can't it be hidden i=
n
> your phy driver?

Usbphyctrl is separate IP block which mainly controls reset and power down =
of the actual USB/PHY.
This block has separate registers. So modelled as separate driver and devic=
e handles port reset
Based on port index.

Will remove phy-names "usbphyctrl" and will just use "usb" like example her=
e[1]. Is it ok?

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/devicetree/bindings/usb/usb-hcd.yaml?h=3Dv5.13-rc7

Regards,
Biju


>=20
> > +    else:
> > +      properties:
> > +        phys:
> > +          maxItems: 1
> > +        phy-names:
> > +          items:
> > +            - const: usb
> >
> >  maintainers:
> >    - Greg Kroah-Hartman <gregkh@linuxfoundation.org> @@ -43,6 +63,7 @@
> > properties:
> >                - brcm,bcm7435-ohci
> >                - ibm,476gtr-ohci
> >                - ingenic,jz4740-ohci
> > +              - renesas,r9a07g044-ohci
> >                - snps,hsdk-v1.0-ohci
> >            - const: generic-ohci
> >        - const: generic-ohci
> > @@ -101,14 +122,21 @@ properties:
> >        Overrides the detected port count
> >
> >    phys:
> > -    maxItems: 1
> > +    minItems: 1
> > +    maxItems: 2
> >
> >    phy-names:
> > -    const: usb
> > +    minItems: 1
> > +    maxItems: 2
> >
> >    iommus:
> >      maxItems: 1
> >
> > +  dr_mode:
> > +    enum:
> > +      - host
> > +      - otg
> > +
> >  required:
> >    - compatible
> >    - reg
> > --
> > 2.17.1
> >
> >
