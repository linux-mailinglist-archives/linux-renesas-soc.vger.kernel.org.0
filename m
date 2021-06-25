Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 846463B4138
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Jun 2021 12:12:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230251AbhFYKOX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Jun 2021 06:14:23 -0400
Received: from mail-eopbgr1400119.outbound.protection.outlook.com ([40.107.140.119]:40402
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229940AbhFYKOW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Jun 2021 06:14:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LprOxfWBe+RRYVpX59K/4+kvs2+Rxu5h0jKKUed+FaZMe1/X9AtYh+ByHIY6klKxgZBv8glCCrHKxp98zYFB6sT43DlZlNW1ajaPr5k1b1CG5WlKeJpfyTmAJBeVXZqBrc7WYDvn6sdfButFCHhNNQXbFRIvFA4QphIYJU4WDvo+ANK2K8o1NhpeDV+upwZ29D4prw33uXj3mw73aKMyP4J6WOqTQILc9bSBnKcecLVarr4ibtrzciXMkhjA6BQ63lVAZ7wIWrrRy1eroYZ+ChxIb5r/DLRZY1yL1kTSIe3rAusY9E2gG3XbmnBbsv6fj04z3Ij5XyMyZUTdq9Eg5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bQyaMDAKxChLi6MlTj/DK287NVjGG4ElbYKRiuht4S0=;
 b=f7gK093n1YWqFVFWtEEKdUxjqE54tPyveXx8XmcBX39e7kyC+ppVaJ0jKko/kIL4ELBR/nQRkaIPkNfgT8qp3oTAGAUkIL+Oi6vAdqATX2DCj5hjo9RG2vqIChWXzaQZokUuT9pAh6g4BqlXrVvYRNFpgkqS0xm5kWiKb8vv6sJfyt3r2xisOIWK5MZDVo3CNARDxhGjdW5OMfNV/ZTy8f6zu99XM4Cu70Xp5kG2hFieSW2T/0hOrEzjtOumarOkaP3npiL25wB1Whmef1BBMOPAPfkGk+6V6oB/RCTUgpyRdPOm+M/BdRvN9gnVymEG0dC1CWE7HCOTnEOcVByaDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bQyaMDAKxChLi6MlTj/DK287NVjGG4ElbYKRiuht4S0=;
 b=r1V5t4BMoB77LiLDPuo/cL9wiBDGUJxxsi5WKDkgf++PTmxf7bTNM0etuqPoscMdgoa74u2qbNZa430w1xvLjOwU/vGS/GEGsodEV5LlMlvUaLwAG74V/b5pq652Rf83Z3pAOx+tVEH9sP36/mJO6oNC0SySaX+2B2Zxb3wJgcY=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB2675.jpnprd01.prod.outlook.com (2603:1096:604:8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Fri, 25 Jun
 2021 10:11:59 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b834:5e50:2ce8:9ae0]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b834:5e50:2ce8:9ae0%3]) with mapi id 15.20.4264.019; Fri, 25 Jun 2021
 10:11:59 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh@kernel.org>
CC:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 01/11] dt-bindings: phy: renesas: Document RZ/G2L USB
 PHY Control bindings
Thread-Topic: [PATCH v2 01/11] dt-bindings: phy: renesas: Document RZ/G2L USB
 PHY Control bindings
Thread-Index: AQHXZoFkEsylYGbSPUy+XB9R+DfKg6sgQr2AgAFYKgCAAAvXAIAAFwGwgAK5rAA=
Date:   Fri, 25 Jun 2021 10:11:58 +0000
Message-ID: <OS0PR01MB59227E0C129668A5FFF861E186069@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210621093943.12143-1-biju.das.jz@bp.renesas.com>
 <20210621093943.12143-2-biju.das.jz@bp.renesas.com>
 <20210622165851.GA3840386@robh.at.kernel.org>
 <OS0PR01MB5922ECC2B573F1F8E170744F86089@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAL_JsqK_6_LUD-ffkDCuDEds2RiYftJfynZyPN4io3Lt3MnQ4g@mail.gmail.com>
 <OS0PR01MB5922742488532EC506334AC786089@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922742488532EC506334AC786089@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=bp.renesas.com;
x-originating-ip: [193.141.219.20]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d8a33852-e07a-4104-a59c-08d937c1ab4f
x-ms-traffictypediagnostic: OSAPR01MB2675:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSAPR01MB26756A78C50BBDE64B46750786069@OSAPR01MB2675.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EBk51oV9/rmbfRdq57Jgdk4S2vAVgeGuqUKhTtI/LAP0j+pEcMI9lfqRs2sGysJmKjQibs0p9sNiZoo+b66Xh6G4PSRU0ai6mfYh17gpRBYFTkUYdvoKk0UoHENapzFpXJNMcZZqGKiNoWdhpK+17XAKlEBHxMm93nnbUZHx1+jxrT9VUZ/7pACD9QLtlXyDv3dQwJ3K518CJB0Q2HogWktkVD0hTzYN/lZetxj9b6arS/IjSRXtxJbBgOyBHn98aQvQG3rjjv/6NKKrfLUqAwISEx3BODdM/sZ8T4gTp7GjGe085XAUNOUpElPzGQXNBCO2U1NP6tJ2H0ek8KE4FYztKIlfArY4wGHIgme7rB4r9RzYX5eXM6H3jKMtlcgi5h/gPc1uvFmHjSDAx4l7BBq7xNnPqdEZ6Gt2eApTWIhk9w5d2s0fBR6tfRfsOOo7vb4RjNa6LeFRh6a1G5PemxGELYWRJKZve3ZWSmM68InOxzVub+wX8dFWc4qS1zHq9QzSWnGKxIVj2KBY/oVmKHoyMB1HuU8TuzHFOLEuu0pk0ZCtCdACuIrJgXnpHdYE/Q6A0qdBKwIZezJGXU6yJAcl/T9q3EKF3GteozDbXFpE4Cx4i0oblghW1i+7h65mjHZxyf15i1Zz41Srq3MCFv53Pudu5rb82ebtx3oWFRAtdy//53UxYmKDyvQynBcZrXwYrw7h+4rO3GFp04Hao02kXnKzi3+60U2PULONk2A=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(366004)(346002)(376002)(71200400001)(66476007)(64756008)(66446008)(52536014)(5660300002)(2906002)(4326008)(7696005)(83380400001)(66556008)(54906003)(316002)(38100700002)(76116006)(122000001)(66946007)(186003)(478600001)(9686003)(6916009)(55016002)(8676002)(8936002)(53546011)(45080400002)(26005)(86362001)(33656002)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QSSBjeaoS0d+cDjgY+coafO5HSKgIQ6m0Tf8BdrkG6Btq7v57h+RYW8f+DgI?=
 =?us-ascii?Q?XiBNOlyk55BJAkpjo3hHFwiwtglCkS08nFPQQ3uunBzo8qJ3ATdqBzbcIwrJ?=
 =?us-ascii?Q?EE+mHzrGepZ4fyrsYBKFpiaCbXuVQgBhxrVZL82PCPoj/I/t9M/ji7OBsyUk?=
 =?us-ascii?Q?Z3z5CkTzkLlJ2VThax72F6x0Q6aUUS+xtyjT8Rn71fFvLUkVydaCannuATXb?=
 =?us-ascii?Q?ttzDCbOBMrzFufAx3Uyra0r5r5q3SABn1YkU4z21ERkEkhzjuq0Gs2VL5lcK?=
 =?us-ascii?Q?TJ62h0xmR/RftwBOiQbDrugCZ2Sv6BmU52NkP8kyMu+02CYZvlkroKAOnQdX?=
 =?us-ascii?Q?1+7n2lLIZAvQVUFnq/2CxsaCmIZx4+EaCiuQguQ4Ds1pRXTR/oO2N+DW8jsw?=
 =?us-ascii?Q?aY40v53uG77xrc68GXsUNaIFsoeIVe1jCk7lJXDsMI+E9ENGsIMvlRxpNX+/?=
 =?us-ascii?Q?5QefTyanTykXrf64vKtKtpQO8ptIQfXLcrmNLVxgHh2TKaDxVNRNzJ/yAUvc?=
 =?us-ascii?Q?dkWr+EJ1IwuXZH87QHjDxJEN8Bkq0BHUhrq8ORMQL2GGzcaK2mUqtSPJLTcy?=
 =?us-ascii?Q?Xw25ZdhT4RjrYl3+Xr07/ezW1Zjw4tV3wy0uCQ34DIyOUqqVVgRKsiA5peFY?=
 =?us-ascii?Q?z4c2nnT6BM7dBFk8s9q3Vhz/FL0d8zZ7QjL8tgBOg3tIczBGSmHY03jwevx5?=
 =?us-ascii?Q?mABbqMIXLF4d1MFumy9C3DjymZpDG8Q/TQ2McyR25sdfpvSmT7RdsYBNoFsU?=
 =?us-ascii?Q?1kjmigKX//7fY2odGN/zuX0rjTQx5/FZikYyWIRYSDQXCX0OyqfPs09GbFgM?=
 =?us-ascii?Q?3TrBBIfB49ABOshlBTP7EbdrLdNBHapDH+Itxn9CBCziyTFnOLymxcT/fKlM?=
 =?us-ascii?Q?6ab81JwG2t//Mmt7QdfXS2E0dFzVMiaEDrHGQPW/yVhW069vwKjGwESaxBrz?=
 =?us-ascii?Q?5Ssm47sF+K0HtUv1xTUAdkNOedfVp/ccm1CUj7IL2M7S6Ef6jSk3Frz/6fUD?=
 =?us-ascii?Q?1m9teI23klDgYgCUlJkkouogZDfynTlFZu2IuAy9miCCA+EO3YlcqFWlkpqE?=
 =?us-ascii?Q?RPNwpCY4Ba/TS6En36wEI6iEluTHN+GpfrN9QDaWMWF2GXScWI606mZajzvU?=
 =?us-ascii?Q?wbYB9KvCih5G6i+trmSbnSA2Xhfunahu2J/vf3T82oDpShss7CeOwAij76UY?=
 =?us-ascii?Q?IFDp2vGq2bRTN3dUu+FLDtFBWGt8LvvFWBL3LLkaAC0uljHjFDUuxLz5YqPo?=
 =?us-ascii?Q?FtVB9JjlNf0qKfqQQka1tvS36Y1lrd9nGIVmvq9UHZbRLljkI2/FG1zouZze?=
 =?us-ascii?Q?li8v5neRxlmgu5RerSNcmwBD?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8a33852-e07a-4104-a59c-08d937c1ab4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2021 10:11:58.9336
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DaDE0ShlF14xhujc65/qONoXjxtGvVNseBQrTA9qnD2z+L6oXHlyOIREnqVxSJeMU/Bb2p33BOaTj6ala6liOIFp6JLzlB8m+T3WaQi9chM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB2675
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob,

> Subject: RE: [PATCH v2 01/11] dt-bindings: phy: renesas: Document RZ/G2L
> USB PHY Control bindings
>=20
> Hi Rob,
>=20
> Thanks for the feedback.
>=20
> > Subject: Re: [PATCH v2 01/11] dt-bindings: phy: renesas: Document
> > RZ/G2L USB PHY Control bindings
> >
> > On Wed, Jun 23, 2021 at 7:38 AM Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > >
> > > Hi Rob,
> > >
> > > Thanks for the feedback.
> > >
> > > > Subject: Re: [PATCH v2 01/11] dt-bindings: phy: renesas: Document
> > > > RZ/G2L USB PHY Control bindings
> > > >
> > > > On Mon, Jun 21, 2021 at 10:39:33AM +0100, Biju Das wrote:
> > > > > Add device tree binding document for RZ/G2L USB PHY control
> driver.
> > > > >
> > > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > > Reviewed-by: Lad Prabhakar
> > > > > <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > ---
> > > > > V1->V2:
> > > > >  * Add clock properties
> > > > > ---
> > > > >  .../phy/renesas,rzg2l-usbphyctrl.yaml         | 65
> > +++++++++++++++++++
> > > > >  1 file changed, 65 insertions(+)  create mode 100644
> > > > > Documentation/devicetree/bindings/phy/renesas,rzg2l-usbphyctrl.y
> > > > > am
> > > > > l
> > > > >
> > > > > diff --git
> > > > > a/Documentation/devicetree/bindings/phy/renesas,rzg2l-usbphyctrl
> > > > > .y
> > > > > aml
> > > > > b/Documentation/devicetree/bindings/phy/renesas,rzg2l-usbphyctrl
> > > > > .y
> > > > > aml
> > > > > new file mode 100644
> > > > > index 000000000000..8e8ba43f595d
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/phy/renesas,rzg2l-usbphy
> > > > > +++ ct
> > > > > +++ rl.y
> > > > > +++ aml
> > > > > @@ -0,0 +1,65 @@
> > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML
> > > > > +1.2
> > > > > +---
> > > > > +$id:
> > > > > +https://jpn01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F=
%
> > > > > +2F
> > > > > +devi
> > > > > +cetree.org%2Fschemas%2Fphy%2Frenesas%2Crzg2l-usbphyctrl.yaml%23
> > > > > +&a
> > > > > +mp;d
> > > > > +ata=3D04%7C01%7Cbiju.das.jz%40bp.renesas.com%7Cc6bbf5f6ce334eaa7=
2
> > > > > +2a
> > > > > +08d9
> > > > > +359f07ad%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C637599779
> > > > > +42
> > > > > +1910
> > > > > +039%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzI
> > > > > +iL
> > > > > +CJBT
> > > > > +iI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DJcf6Om4DehifCe1KO1r=
m
> > > > > +t5
> > > > > +LxTB
> > > > > +6jtGoQLD1MoqWGM%2F0%3D&amp;reserved=3D0
> > > > > +$schema:
> > > > > +https://jpn01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F=
%
> > > > > +2F
> > > > > +devi
> > > > > +cetree.org%2Fmeta-
> > schemas%2Fcore.yaml%23&amp;data=3D04%7C01%7Cbiju.das.
> > > > > +jz%40bp.renesas.com%7Cc6bbf5f6ce334eaa722a08d9359f07ad%7C53d825
> > > > > +71
> > > > > +da19
> > > > > +47e49cb4625a166a4a2a%7C0%7C0%7C637599779421910039%7CUnknown%7CT
> > > > > +WF
> > > > > +pbGZ
> > > > > +sb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC
> > > > > +I6
> > > > > +Mn0%
> > > > > +3D%7C1000&amp;sdata=3DLlqPRLf9%2BGrEdSapxCFhwxVKcXTVh9ECr%2FXPN0=
S
> > > > > +Iz
> > > > > +i4%3
> > > > > +D&amp;reserved=3D0
> > > > > +
> > > > > +title: Renesas RZ/G2L USB2.0 PHY Control
> > > > > +
> > > > > +maintainers:
> > > > > +  - Biju Das <biju.das.jz@bp.renesas.com>
> > > > > +
> > > > > +description:
> > > > > +  The RZ/G2L USB2.0 PHY Control mainly controls reset and power
> > > > > +down of the
> > > > > +  USB/PHY.
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    items:
> > > > > +      - enum:
> > > > > +          - renesas,r9a07g044-usbphyctrl # RZ/G2{L,LC}
> > > > > +      - const: renesas,rzg2l-usbphyctrl
> > > > > +
> > > > > +  reg:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  clocks:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  resets:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  power-domains:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  '#phy-cells':
> > > > > +    # see phy-bindings.txt in the same directory
> > > > > +    const: 1
> > > > > +    description: |
> > > > > +      The phandle's argument in the PHY specifier is the phy
> > > > > + reset
> > > > control bit
> > > > > +      of usb phy control.
> > > > > +      0 =3D Port 1 Phy reset
> > > > > +      1 =3D Port 2 Phy reset
> > > > > +    enum: [ 0, 1 ]
> > > >
> > > > You already have the const, so this doesn't do anything.
> > >
> > > OK, will take out const.
> >
> > No, 'const' is correct. This is the value of '#phy-cells', not the
> > contents (we don't have a way to express schema for that).
>=20
> OK.
>=20
> >
> > > > > +required:
> > > > > +  - compatible
> > > > > +  - reg
> > > > > +  - clocks
> > > > > +  - '#phy-cells'
> > > > > +
> > > > > +additionalProperties: false
> > > > > +
> > > > > +examples:
> > > > > +  - |
> > > > > +    #include <dt-bindings/clock/r9a07g044-cpg.h>
> > > > > +
> > > > > +    usbphyctrl@11c40000 {
> > > >
> > > > usb-phy@...
> > >
> > > The IP is called USBPHY control. It mainly controls reset and power
> > > down
> > of the USB2.0/PHY.
> >
> > Sounds like it should be using the reset binding...

OK, Will model this as a reset binding. Since the IP mainly controls reset =
and power down
Of the USB2.0/PHY. So it is better to have reset binding.

Regards,
Biju

> This IP has reset, clock control , connection control , clock status and
> power down setting registers.
> Currenty we are using reset registers for turning ON USB/PHY block.
>=20
> Since it has extra registers I thought of modelling it as a phy device.
> But we could model as reset device as well.
> But it has extra functionalities apart from reset.
>=20
> So what do you propose here? Model as a reset device or phy device since
> it is related to phy?
> Please share your opinion on this.
>=20
> Regards,
> Biju
>=20
> > >
> > > So not sure usb-phy is right one here ? I prefer usb-phy-ctrl instead=
.
> > Is it ok? Please let me know.
> >
> > A node with #phy-cells should use the standard phy node names unless
> > it has other controls.
>=20
> Apart from reset, it has other controls like  clock control , connection
> control , clock status and powerdown setting registers.
>=20
> Cheers,
> Biju
>=20
> As I said, this doesn't seem to be a phy, so using
> > #phy-cells here is what seems wrong.
> >
> > > > > +        compatible =3D "renesas,r9a07g044-usbphyctrl",
> > > > > +                     "renesas,rzg2l-usbphyctrl";
> > > > > +        reg =3D <0x11c40000 0x10000>;
> > > > > +        clocks =3D <&cpg CPG_MOD R9A07G044_USB_PCLK>;
> > > > > +        resets =3D <&cpg R9A07G044_USB_PCLK>;
> > > > > +        power-domains =3D <&cpg>;
> >
> > Also, are these all resources of the usbphyctrl block and not just
> > resources you happen to want in the driver? For example, the
> > power-domain should be the power island that this block resides in.
> >
> > > > > +        #phy-cells =3D <1>;
> > > > > +    };
> > > > > --
> > > > > 2.17.1
> > > > >
> > > > >
