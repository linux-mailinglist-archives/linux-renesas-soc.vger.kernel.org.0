Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBDA93EBBCF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Aug 2021 20:03:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232297AbhHMSEB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Aug 2021 14:04:01 -0400
Received: from mail-eopbgr1410121.outbound.protection.outlook.com ([40.107.141.121]:24896
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229607AbhHMSD7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Aug 2021 14:03:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GzhWXS/3Qbuuw4iH5HjzCg9ZUA8d604zEF4lyjqydRYcKElpEZNVOSpwNl9ckj/vev5d+Cf/Cekho9XBT/BxpUEMb9Hw1Q3QYP2ZEIV9BQEE9Lu8stq1Itpa94lJPgFdbqJ1q3d7oOCSxe8ow/mhxkLp8AgZdNIpERPKg9D1Rfzv0PTyO1k/Mhy/RBS8+48a9qddBGggPc8RQJwfxFplSnvG5+Gml53ayij3ay55ATaMlOPcSLqoX4XqY8fXFBWT9rkMexQDVmSTh5i6nfv7jkLMsKiZ2Lmyq82F3k9NiNCWe1ZMi+jyvGAK+OiozJtkgX06RyI55pT0F2qeFgxo7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2wXesEsZ5Agdej8LdWlK3TqIjsuXXyERajd26BSUF4M=;
 b=YoJbixR5OZGgCDyqrTsSAFW8znUjrkUFCGQiCML2ocW7o/VlkG16ZJ1sTuyLhNdUj8W6WIhd9C+VnCxRmMdSZ1TfMg6k8CTSeEZckGMtE6Tqy8n8AxCIB4hNIp/eU9zaBAoNRDurBSqBU/DFKNA9aY4xT0NeYDHlCqvrgYk1rOu9Cs4n3/XmMOvWngu16Vh2iALvSnub2oPtSkUPU18YbxsT7AcoE8MulI1+HQttyfhf298q14omE0gUvyo7nf028CsuSEuVFWuA7SS1U3DXPhMgE1asJdU80YLPuP7o6wZhNgdqjwA47UXmnB+rxXfPwBf0NiGSxrKNjVs+pmQ8tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2wXesEsZ5Agdej8LdWlK3TqIjsuXXyERajd26BSUF4M=;
 b=dee56huE7Bk2fw5KxKtcY6SHHPJ4qx2Z/mYETnQCw0st6x+dZPdyGFIGRQqV9AoBVh01TunXXqpHxy6MM3dqWclDetQ0+pIYSnhM/1bypR2qHmFSYky+HxdSezVhPVtrmKe6XxLEwzA97oaVlKjr+V5itpkeLVXexP/fkclCsWo=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB4081.jpnprd01.prod.outlook.com (2603:1096:604:31::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.18; Fri, 13 Aug
 2021 18:03:30 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe%9]) with mapi id 15.20.4415.020; Fri, 13 Aug 2021
 18:03:30 +0000
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
Subject: RE: [PATCH v3 1/2] dt-bindings: mmc: renesas,sdhi: Fix dtbs-check
 warning
Thread-Topic: [PATCH v3 1/2] dt-bindings: mmc: renesas,sdhi: Fix dtbs-check
 warning
Thread-Index: AQHXiUuu+yFYLYQtYU2lS8DVs3XaK6txwdcAgAAGDiA=
Date:   Fri, 13 Aug 2021 18:03:30 +0000
Message-ID: <OS0PR01MB5922C908376EA089037DD5F786FA9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210804161325.26996-1-biju.das.jz@bp.renesas.com>
 <20210804161325.26996-2-biju.das.jz@bp.renesas.com>
 <YRauZkjqGnIi84cf@robh.at.kernel.org>
In-Reply-To: <YRauZkjqGnIi84cf@robh.at.kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9b5bf191-8027-46a6-249b-08d95e84a85d
x-ms-traffictypediagnostic: OSAPR01MB4081:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSAPR01MB4081561CADE3B49F4A6D21A186FA9@OSAPR01MB4081.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kE4yFyMFxOryZEmNFJp1r2apeCJMSbHU0PAWP4KFlZ7cUhIVCWHjBrbucVufA4FZSR34qBJ0GnI6W1YSJQpA0Li+e3EwVkyzQR7MCxBIH4MzER85tAAGF/pdo9Glb7MjzKEnb2A3ZJSKqRVbmsig9wOmTRjNEEzaHwOGMljtbe46NGKHUdtFy3lhZ8kYwHD9hG15CT/cp3ivWsg78B1RI/MbmPrZe7wklK/3kuKNv3ViSyVFYnAWLwl24RWZ858XtVsbpm+ZrdVLIdlwKsgxAdcz0xPW+6dEg9s081AuAvZmPfxpYZSHV3cmyLeMlz7HG8M3kbZD5PR0xncuqrUgWaKP2BSr3+hl8Cn252vc/y1Na/GU1PDC6tmo0J/FkeDf6jCg7mMnER9vLs4UPGR4IyM4xgTabQp+HPw34rR25bzQDa8m2B+QLMPL0u/PEPZcD+UU3+SMKSEqYQ5N84d1c9wSTN7H+PZJhBWcEddqrNAke/PugzXDzsRTwpz9PR5iWU773hSFU7o23EVpeuNrjFBDPmQ9XGw3ioBNw+rcjoziUrTwuNeWGq2j7Cj6h+7onuQLecZt1SAjQorGQBlvENMAq2PwsiV1FfjziE9sD/eP3t/qSEENNW/Iw7cRp/1nOrvjzHfJ/VmdH6lL24fMZcm7CNIQJA+hkoTZ8fEZmTQa7QOPFFRkAssa6aR48wQFiT8cxbaAQOG38UCimxyn87wtT1eCyfxS1CLvEWdoBse/xWmlU/utJJMt1/DzIeiL5oei0guBbNM3dwnEVGUy/BnRTcXWCYSaILGCciRb2v8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(396003)(39850400004)(136003)(346002)(478600001)(66446008)(64756008)(66476007)(66556008)(8936002)(5660300002)(33656002)(45080400002)(316002)(966005)(122000001)(38070700005)(76116006)(8676002)(38100700002)(52536014)(2906002)(7696005)(6506007)(186003)(83380400001)(9686003)(54906003)(86362001)(71200400001)(6916009)(26005)(4326008)(66946007)(55016002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/MYbiGqD0IUzAg4YZC3zLO0qwFwrKt7lga3Kp9WCHLhmO8LIF22uiRY9xpLa?=
 =?us-ascii?Q?yKbOnzEKiwjRWDr3uMUGqIyenjFbjIQ5h7rAcQgvKVit3srkkU15oM5C3kZS?=
 =?us-ascii?Q?WtJ4YTONdWBptCwMgxKMVNeSvQt5drqnKconKoWqlo4eGS+xLvUiYhIDkBmu?=
 =?us-ascii?Q?fU6OMPiAzSxYPogtv/Y/U2oghPJVtpIPp2cu5/lpiqdgwfv3b7A+E8Nw070k?=
 =?us-ascii?Q?CaIOVML0q9YLXvkRuTk+tDbw+HNXMW/btU3doKrRJFW3zggep81uSmqGogxK?=
 =?us-ascii?Q?L67KiU+DBHtKHqJw6O72/77vEWX0YUTONsSJ2tdPwjnGjMASNJxWR4rITwaV?=
 =?us-ascii?Q?6tXb4g6EJYXExq20gTUDmj/0x4N6IGRj4/9hmymFbCqNjfakuf6iFkG1wXGs?=
 =?us-ascii?Q?xI0uC7Wpb4gKxD0VKeXLwND0kqynr2ZeZVbyDd1CN+05gBTspn0JP6qJtuSD?=
 =?us-ascii?Q?h0XsyBm8Ngkdqwo2hbA0f4hM+bsy5WiWqqq4ojM2VdtzheDjBJYPwAhviSz/?=
 =?us-ascii?Q?U+ks//NpqP4U4bbHcKCSZ5dYir6eOGgetYGxtejAvEJmDstytzUdIPK/KfMx?=
 =?us-ascii?Q?hozyxrT3+4/HPaMdXw9xrXNlz/tHxbxrvUN7ivXPhuwYqyI+pfNm1bwrpWat?=
 =?us-ascii?Q?rePcZhvyE2aA+Oj7wisNq78BGTImJF3B6eS8GZ+sQAEsOETZynIz1Kl4zBt5?=
 =?us-ascii?Q?4y7Rww1KUdBJT94kE/5CwikAwzuFbQFZkYWEn+m90AKtTohGHPMy1gOHwRzB?=
 =?us-ascii?Q?hBVJInIP/MvgcvwXu+dOKnxUQYDMuHIRk9QtlczeJxZ3bZnQAgpp0xeSSONm?=
 =?us-ascii?Q?8FFGzxnnychJ2PVf2cuMd8jKSsOE5KHlZp8AIIPNZic8af1Rybcd2Onu5n77?=
 =?us-ascii?Q?Un8URkMzPTCXhnt6Ds6a8uQ4m4TUZxeqAxUTHPj7xFRWWCCgbU0pC8ciKNhU?=
 =?us-ascii?Q?D26D6bCXzxbZEgEj2wjijmY2WU/UcCRwLz/RwY1q9PgkDt9B3iI80XGUPbcR?=
 =?us-ascii?Q?PueVDvNqnE3UZOUbeQvCvG7tEsk6HDtT6FhAs4R1fDfavy4R5dHgu4Zttkkm?=
 =?us-ascii?Q?Y3c4RqICC9fJUlqQIZSQVY4nCfREJtKmCD+bpHu2S24e0oJiug2ecwa5nchV?=
 =?us-ascii?Q?EVFYz+TwmclKb4bL21Pn32rvnVRMVKP/WU7iBaDizZo51NJ88la1krPMlLOm?=
 =?us-ascii?Q?wzYe6JkvAptK6T7ydbt+7SGp3oiMMWfoDmdRm393qjw6tdcAZff5+Tijskht?=
 =?us-ascii?Q?HoCSf7GuQW+adnMd2Gcj+VZIjQl/2Ju3v8JArerTizhNggMsSQevm07I3sEE?=
 =?us-ascii?Q?e5vO4L540MjmL+jqppsZDAKR?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b5bf191-8027-46a6-249b-08d95e84a85d
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2021 18:03:30.0880
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gvtIE5qrz54q08nQaxSgMHFyOx79w62nWUMSbjB9xpzw/A3YpzFUOsChQOuUlBPpkzD32YXkcBCY4xbsBu6Br53bRqYHA+nnNgUPwmdAp6A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB4081
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob,

Thanks for the feedback.

> Subject: Re: [PATCH v3 1/2] dt-bindings: mmc: renesas,sdhi: Fix dtbs-chec=
k
> warning
>=20
> On Wed, Aug 04, 2021 at 05:13:24PM +0100, Biju Das wrote:
> > Fix dtbs-check warning pinctrl-names:0:'default' was expected for
> > r8a77470-iwg23s-sbc.dts file.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v3:
> >  * New patch to fix the dtbs-check warnings
> >  Ref:-
> > https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpat=
c
> > hwork.ozlabs.org%2Fproject%2Fdevicetree-bindings%2Fpatch%2F20210804091
> > 940.23983-1-biju.das.jz%40bp.renesas.com%2F&amp;data=3D04%7C01%7Cbiju.d=
a
> > s.jz%40bp.renesas.com%7C265c317c047442b7b49608d95e815cb6%7C53d82571da1
> > 947e49cb4625a166a4a2a%7C0%7C0%7C637644731970005717%7CUnknown%7CTWFpbGZ
> > sb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3
> > D%7C1000&amp;sdata=3Dq4IgcCqJJPRomA3mhjkRNNdnSbgewIYAvhfBps6Y0Ng%3D&amp=
;
> > reserved=3D0
> > ---
> >  .../devicetree/bindings/mmc/renesas,sdhi.yaml | 65
> > ++++++++++++-------
> >  1 file changed, 42 insertions(+), 23 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> > b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> > index 677989bc5924..543eeb825dc3 100644
> > --- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> > +++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> > @@ -9,9 +9,6 @@ title: Renesas SDHI SD/MMC controller
> >  maintainers:
> >    - Wolfram Sang <wsa+renesas@sang-engineering.com>
> >
> > -allOf:
> > -  - $ref: "mmc-controller.yaml"
> > -
> >  properties:
> >    compatible:
> >      oneOf:
> > @@ -104,14 +101,51 @@ properties:
> >    pinctrl-1:
> >      maxItems: 1
> >
> > -  pinctrl-names:
> > -    minItems: 1
> > -    items:
> > -      - const: default
> > -      - const: state_uhs
> > +  pinctrl-names: true
> >
> >    max-frequency: true
> >
> > +allOf:
> > +  - $ref: "mmc-controller.yaml"
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: renesas,sdhi-mmc-r8a77470
> > +    then:
> > +      properties:
> > +        pinctrl-names:
> > +          items:
> > +            - const: state_uhs
> > +    else:
> > +      properties:
> > +        pinctrl-names:
> > +          minItems: 1
> > +          items:
> > +            - const: default
> > +            - const: state_uhs
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - renesas,sdhi-r7s72100
> > +              - renesas,sdhi-r7s9210
> > +    then:
> > +      properties:
> > +        clock-names:
> > +          items:
> > +            - const: core
> > +            - const: cd
>=20
> This is already defined in the main section, no need for it here.

Thanks missed it. Will fix it in the next version

Cheers,
Biju

>=20
> > +      required:
> > +        - clock-names
> > +      description:
> > +        The internal card detection logic that exists in these
> controllers is
> > +        sectioned off to be run by a separate second clock source to
> allow
> > +        the main core clock to be turned off to save power.
> > +
> >  required:
> >    - compatible
> >    - reg
> > @@ -119,21 +153,6 @@ required:
> >    - clocks
> >    - power-domains
> >
> > -if:
> > -  properties:
> > -    compatible:
> > -      contains:
> > -        enum:
> > -          - renesas,sdhi-r7s72100
> > -          - renesas,sdhi-r7s9210
> > -then:
> > -  required:
> > -    - clock-names
> > -  description:
> > -    The internal card detection logic that exists in these controllers
> is
> > -    sectioned off to be run by a separate second clock source to allow
> > -    the main core clock to be turned off to save power.
> > -
> >  unevaluatedProperties: false
> >
> >  examples:
> > --
> > 2.17.1
> >
> >
