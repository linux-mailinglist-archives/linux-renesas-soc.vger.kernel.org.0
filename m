Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 317B82E8569
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Jan 2021 19:59:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727306AbhAAS66 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 1 Jan 2021 13:58:58 -0500
Received: from mail-eopbgr1410091.outbound.protection.outlook.com ([40.107.141.91]:48496
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727138AbhAAS65 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Jan 2021 13:58:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dPGvxOK/zrEOkfQ9uqBpEar21hgaG2n3ChmktrYX0C3vmVP3Yccp2/+jsBpeoJGADdBOZ/Z5qVPYFfvtLJUqz+CSyF2xT41dqVOxyJdTyhsD3zUzaLQsnzg40GZuvV5tQitiFClAsaEsJHQO955qCFYX51e0q/mQknfL19vwXCRLvTVBttJxZniT295FuUwZwRugBm90duzi4m7g5HjFq6vqoACKlE5GJMoNFzVaw1UkBxpt/U0jQlnRHJPGsq309q1b0gKRGVbM811wTlSweGSq9d+H24aJFQPRY7kPym8KxDMUmAJ9wgFZ9x0A8idhNO/ugKlbict3alXkgooP8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cLZG4doio3DhSqJaJwQiwMCind5NDAvJM+U1J1+r6x0=;
 b=Q0grPuAOmR/bzr/H9eQPldCJGwLjdphq8dA5+SLE3FO/F99XiVcnwh4yRRRhynVn3glsuj6IKHjSGnW0TIxPqnQHspXPB/zR9c4zxu9SJTR8KkxeeZg4HqN4c5dpmFzeVbwaXNgRYmpnqJs/Xr1y80mkgHENVCBnsoIsSSiIGsqaxOPbetlTPhj5Zly9on9lFTahhlsTdxNX604nzHlp0bIO+O0CU4iSBapOmvBx3+bl5TdzC4iULlZJ53P8jE2AfmRlwtvI4bifeYbotwPqQtyTet5K2cMvLbIlns5tJaY/eCLceOWIqu5w2K0bzacUu/NFZ9BWveT9nw3kuqH44A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cLZG4doio3DhSqJaJwQiwMCind5NDAvJM+U1J1+r6x0=;
 b=bstQIpZO+VpdH4DFbZdq945AwhT1bP3KR4T0d1IdiZXelTSIdQ61+DevqegNqgEeElmBdoCdVtTCa3O5e62AOLp6czSGgjxhbWsvddTLBCNKU6so4wllFNvZlhzx36Z+7t/KM0R0BY64TmSllbY+t3C4NHNvFz68YSY5G+jG3Ik=
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 (2603:1096:404:8025::15) by TYAPR01MB2655.jpnprd01.prod.outlook.com
 (2603:1096:404:88::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.19; Fri, 1 Jan
 2021 18:58:07 +0000
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::5d23:de2f:4a70:97db]) by TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::5d23:de2f:4a70:97db%3]) with mapi id 15.20.3700.032; Fri, 1 Jan 2021
 18:58:07 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Adam Ford <aford173@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
CC:     "aford@beaconembedded.com" <aford@beaconembedded.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH 1/2] dt-bindings: memory: Renesas RPC-IF:  Add support for
 RZ/G2 Series
Thread-Topic: [PATCH 1/2] dt-bindings: memory: Renesas RPC-IF:  Add support
 for RZ/G2 Series
Thread-Index: AQHW4DL0ZP8Q38rzAESFTJF1agdBJqoTHuaw
Date:   Fri, 1 Jan 2021 18:58:07 +0000
Message-ID: <TYBPR01MB5309353C04568B16E029261686D50@TYBPR01MB5309.jpnprd01.prod.outlook.com>
References: <20210101113927.3252309-1-aford173@gmail.com>
In-Reply-To: <20210101113927.3252309-1-aford173@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=bp.renesas.com;
x-originating-ip: [81.135.30.249]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 902d04eb-e06e-4c84-ceca-08d8ae872d13
x-ms-traffictypediagnostic: TYAPR01MB2655:
x-microsoft-antispam-prvs: <TYAPR01MB265514D3166CAF59DBF35F0886D50@TYAPR01MB2655.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GDiCMsqH/4QiRh3CyH4xne7tfD8Xf2ghkNWLHsOvmRJG3GL7YIJ5XexFiqjbUfh6idCwtyMUpeezOumC9HMNfqvk/CEg3l8hHPnbaxd3j8ImqtxMMMIulL18D1JcI3OqmL3qZ2vSUeHHVWRSTofT5p8PoyM5xTl5Lbf1AEhyyocEhp1P3J2qLgXLZ9ysu0P2efrvlCGhz4NcsnnaxrVGRB5DwFCU+HIKPz53EG8dbW0YJHflEtvEyUVRUN3aSe1Lw/G3FoKTdFDlO9csRRnVF5mqtwsBEag5YTHlYiX40DqieL773UuCew0sryIjIGsdHjmcZURUdaRopyxUw3eHr2Pa3ZvFyRTkI7lZ4p0UHryb/eeqdsuM9RC2MmijEuUtOo4BqcWvy01csIQfTHbpuA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5309.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(366004)(39860400002)(396003)(7416002)(66556008)(86362001)(33656002)(66476007)(110136005)(186003)(64756008)(7696005)(54906003)(66946007)(76116006)(8936002)(71200400001)(2906002)(5660300002)(66446008)(478600001)(316002)(8676002)(9686003)(83380400001)(26005)(4326008)(52536014)(55016002)(53546011)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?msr9BoajisQCwSuLdeDm/IVGOtHuDeZNs0M2eH0BEPiVsHXXYQMZ9u3oKBwe?=
 =?us-ascii?Q?4m8AYVmqqhc5duD8u3BCLTHvCiF27Bi+IGfla1LGJf+YAIdJCUXB3Qzny82s?=
 =?us-ascii?Q?9bAFz9IXzAhatyEd9yEPZy7Ho2dAFxlfsqrOYcGdLpsQ5e7u9gqFskdIvOmI?=
 =?us-ascii?Q?ppwltJWg5EJblwB6TKFP7Mf7YLDSsieOFXZUGZYqCCAF10Mz+V2gBtQZnNs0?=
 =?us-ascii?Q?X3ixxdZ082tsqHy1yN6197/kMaNzSYOT/k9Qt7F20K0WEBZ3X7s61FYle5pn?=
 =?us-ascii?Q?uC3uPLy/cChl6IfAo8zw26kh56kdkv29hGWEzkAyb5JrjYwZTCeDgqaAZ4j/?=
 =?us-ascii?Q?mrLEOwtCmrsaMah1o3HIpDDYgt4GQNcnYoIBI4qrtUSIDcEyvvyBOCN5cehs?=
 =?us-ascii?Q?TPIQ7Wj9EmQS97TfcFo7hRJLfmBZy+uLQr/DlUq5P2LlasUsWH/ckHjjzK0S?=
 =?us-ascii?Q?EhsnTq86cGs2mSXjttOlRDX8phDvxCeawW1cTpUgF/sD+Hu1TEU4oBoz2rBU?=
 =?us-ascii?Q?yxmRdF7CVAOZ4FNeQgLW0e3SRWkTGhfvjeP8VusFzNZETtL3Lqa35UBYDADd?=
 =?us-ascii?Q?iLAPsOem8zpLhQDrZMUOvLlEbTKMx0XKZX5gZ0SBrMqltm9x6jwHPEOScuMT?=
 =?us-ascii?Q?L3ovGBprD58sEam8yEY54Uc+xjS5kIHzhLOgUDJIW3iwAcfS3UrpjsS0TlBX?=
 =?us-ascii?Q?4TDyf9tCxVlklscERpjFSSveQEpIJyK7/kLD5ro3RqStdOmIzOH+06AbYK7c?=
 =?us-ascii?Q?xdjRN/LsyKCRrSImGjNGqn8JmCJHd0DGU7vmMk8/PQpHcg1Yu7QDkivMZDaf?=
 =?us-ascii?Q?dvUSrVK9PLLnqqAWYQamhabBjDcsJagjPvbPMXy2qjctJ/t2epRjHQoKE9ld?=
 =?us-ascii?Q?rZSB+gnrx6vQnxn25PoGnBJYo/MKYAhAypZtuu0Co7gJ/WHMKXB6wDOmssRL?=
 =?us-ascii?Q?c8VH+HK700lCe8dsI6yOmBXvO/HxmyZ8gWiHSdxgNbM=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5309.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 902d04eb-e06e-4c84-ceca-08d8ae872d13
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jan 2021 18:58:07.0297
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Gt/kmXS9yX4VHnGz6CSwna/nyolnTUoloOz4e6HOB/Mwyhmj4YMKW2FnUxJlumMn+Frme+xKQ191FyibjIGCw5OxU2ZlhkOchCRrcxIAfSk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2655
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Adam,

Thanks for the patch.

> -----Original Message-----
> From: Adam Ford <aford173@gmail.com>
> Sent: 01 January 2021 11:39
> To: linux-renesas-soc@vger.kernel.org
> Cc: aford@beaconembedded.com; Adam Ford <aford173@gmail.com>; Krzysztof
> Kozlowski <krzk@kernel.org>; Rob Herring <robh+dt@kernel.org>; Geert
> Uytterhoeven <geert+renesas@glider.be>; Magnus Damm
> <magnus.damm@gmail.com>; Sergei Shtylyov <sergei.shtylyov@gmail.com>;
> linux-kernel@vger.kernel.org; devicetree@vger.kernel.org
> Subject: [PATCH 1/2] dt-bindings: memory: Renesas RPC-IF: Add support for
> RZ/G2 Series
>=20
> The RZ/G2 Series has the RPC-IF interface.
> Update bindings to support: r8a774a1, r8a774b1, r8a774c0, and r8a774e1
>=20
> Signed-off-by: Adam Ford <aford173@gmail.com>
> ---
>  .../bindings/memory-controllers/renesas,rpc-if.yaml           | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/memory-
> controllers/renesas,rpc-if.yaml
> b/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yam=
l
> index 6d6ba608fd22..050c66af8c2c 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-
> if.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-
> if.yaml
> @@ -26,6 +26,10 @@ properties:
>    compatible:
>      items:
>        - enum:
> +          - renesas,r8a774a1-rpc-if       # RZ/G2M
> +          - renesas,r8a774b1-rpc-if       # RZ/G2N
> +          - renesas,r8a774c0-rpc-if       # RZ/G2E
> +          - renesas,r8a774e1-rpc-if       # RZ/G2H
>            - renesas,r8a77970-rpc-if       # R-Car V3M
>            - renesas,r8a77980-rpc-if       # R-Car V3H
>            - renesas,r8a77995-rpc-if       # R-Car D3

May be we need to update the below description as well to cover RZ/G2 devic=
e??

- const: renesas,rcar-gen3-rpc-if   # a generic R-Car gen3 device

Cheers,
Biju


> --
> 2.25.1

