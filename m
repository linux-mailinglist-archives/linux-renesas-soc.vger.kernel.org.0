Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76589606D28
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Oct 2022 03:47:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229509AbiJUBrl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 20 Oct 2022 21:47:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229731AbiJUBrj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Oct 2022 21:47:39 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on20714.outbound.protection.outlook.com [IPv6:2a01:111:f403:7010::714])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F05E3F1DF;
        Thu, 20 Oct 2022 18:47:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IOAyoYRCmi9ntJsE1BvNAIa5td3NZ5vhzfCNrJNsy2EPqgCEMqnMiX5pVOXDHyqrfLpiaLDLzdkDFFi5d4mT3Od+SPP0cZ4yybI7TQEVxBpuUsG+Y5kLTCQiZTwCRJKT8vYJSPeEMZe78j1j7YOxhIpmBRRNeMWJf+UL893PimH7Nx8H8HuSySEVUFi9QQz6BLFF6Jyh//uVBGsvurpNmYKXKpMYkA/PCRyYtw4LB/2d/d6WEm70FiEHWW+AuDXB6UhMxrWFvYpJJCgKyKM9Az4Jt4y3GRJYqzvAdsjPww/Sga4nMLdHSOa+ZVHbWuzh8yMQmc6QpzgLy05vFpj6Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VsBtdr0zWPrwwUaULXQKGvg4jl48c9V7J4rXjkbgJJU=;
 b=EIjeNqA5S3nqSxCY3Y41LnPQ9qBIu4/guKO8NL/FId9ktGbwLIwpMQyq96N+zk/Av9nknox3HFvnije1tMU77I/s40jdJB6cl/VKG55pxthPfezzwmX3y395mQWu3xh0CkAT/8F4rLKb3jtcAP2snBznYjdmOCm0m4ZgB3+7jdEYcOs3fNvspf5gedJhydU1aQCFYYb8NrUah63yMiFU0CeyT7mouiD3fTv6ofKhpBRxnjWLbzfqn643keAzsKwedX0Nnrc09EY7jAyHr9WWycA/P46x02Dg/4b56tt/A/UXR7ik7VCpzM2KiLqCgD9ygWu1qKF9JQFFrBuFSnub/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VsBtdr0zWPrwwUaULXQKGvg4jl48c9V7J4rXjkbgJJU=;
 b=lwggn1Hu5Q9fJTkS0CV2/g7JXhiLd1ZJuAnABHVZemRS6tJYwaw8C8pHgqVXM29UaPB9tdCPWCVqU7zfgfvikRMX3BaAFu71dSYk7UVy4OxYlIbawQ8GlXT82e22+naIegg744pV7bWRLAGwuww6HKhrw5/mA03PqI6CA9rW5Xk=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TY1PR01MB10723.jpnprd01.prod.outlook.com
 (2603:1096:400:31c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.36; Fri, 21 Oct
 2022 01:47:34 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::cc96:57cc:13f2:a939]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::cc96:57cc:13f2:a939%3]) with mapi id 15.20.5746.021; Fri, 21 Oct 2022
 01:47:34 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        "kishon@ti.com" <kishon@ti.com>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>
CC:     "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 1/2] dt-bindings: phy: renesas: Document Renesas
 Ethernet SERDES
Thread-Topic: [PATCH v2 1/2] dt-bindings: phy: renesas: Document Renesas
 Ethernet SERDES
Thread-Index: AQHY45WqmGXDS0XxlEeTCuZp9JLL2q4YBu8AgAAPVfA=
Date:   Fri, 21 Oct 2022 01:47:34 +0000
Message-ID: <TYBPR01MB53410F9EF50837AF8B87DC2AD82D9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20221019083449.933005-1-yoshihiro.shimoda.uh@renesas.com>
 <20221019083449.933005-2-yoshihiro.shimoda.uh@renesas.com>
 <2694afda-fe53-8f6c-85dd-390b42a39d93@linaro.org>
In-Reply-To: <2694afda-fe53-8f6c-85dd-390b42a39d93@linaro.org>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|TY1PR01MB10723:EE_
x-ms-office365-filtering-correlation-id: 206b7ba8-4989-41a6-f1da-08dab306396c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: y/5/Bxdns41+U2dfXDJXxbPwAP0xtyber4bSVaNMptf0hCSKtIS+VSHfZPCzXEiDABjfuS/b4Ws6ASr2fYFZZZGk2ZstxWO8frwKrnP+9rWql5ntOCFEpMbWsTXdo626t2eZuau8feei+Ud5xzXv8wW3cAMnTLG/oZBfRmsYONXDjjpzA6LZmfq4U2jXElHSNaly9gcOWHIk5EQ5jYtVKAvg4tk/nXDtx6mycmK+KMIeDCTHv6nZUf3h38phmXoCu6dvZbFBs2HoMku5MPDbVIm3bftM0PPSgzQ9MQt051Oy7Kvswh1S5Oiq2zTeZIfzhOlEJq/qfXZjej2xztdB/v0D+CwpzQ1aytvsQ7MuZxgttNqAwv8a1Ec0QCRzVp5qRw0cgKqBzgn13laWiWdbuqeUHnYpXms3vIpPaq/w4gWXuP2Xd5llcmqVW4wPjgHOFmOLdET+XudEav/Cq61Ogi5K4QAj3IdiJO5DYK5c3kD8TFthHe00NLVkOD1joIL41rVk4mq3p4FI62fTEe5Uv/LUbL9yXI24I+3KmQJ5kNZ7Rnv3NOYXwjbyKEVOcPgw+bMJ/TvvDv4j9RdV1Bz5uQJu1lPya3Z3jAsosnG5eVvW5vtceerwTeH5ecLGaIykJ+y1mdvWS/EajbCdN4LhWu0MpCcLN86TAT8k9L6nncI4pPAva94+N7pnk0C5u8ykKGg/YieWSq+GDfnIkkHzYKlwoFNX9UjR0uw4RIF+P5Hg1FrZeCD76/dVykL2j3xd+lr+YX1nHCiiMbqjezCJNw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(366004)(376002)(346002)(396003)(39860400002)(451199015)(5660300002)(52536014)(8936002)(2906002)(54906003)(316002)(76116006)(41300700001)(66946007)(33656002)(110136005)(66476007)(66446008)(64756008)(8676002)(4326008)(66556008)(86362001)(478600001)(186003)(83380400001)(7696005)(6506007)(53546011)(9686003)(38070700005)(55016003)(71200400001)(122000001)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DiTEM9PdI0Uhx3MJaGWNQvzeDkeUo5e6L0QuNTet24I2vyrbm5Aez7hppTyN?=
 =?us-ascii?Q?mDTUwVM1ebBaX4WdTJWBFluLh9pRYvRAzZtPwVmS4HZkPAqUHhApwEU2/4Z+?=
 =?us-ascii?Q?0T9XQ14evYewfUplL1ht2RXWB2l6lBVbKxPgWrDPe65okcLcW/UGCysoPAv9?=
 =?us-ascii?Q?1gr+4jQSokFf61BFcXszaXIumaNLsi69VIcFCxlWLvsv1mhhuP2ACCfreQI0?=
 =?us-ascii?Q?lwd5y7JANW3mJB1rYg/Y03IzNTSQyTvu0soQ22dqh3aqfljPaLmCAEdowOOL?=
 =?us-ascii?Q?ORe1NPjD+wqjIOfpn5rhGHi2/9cmb5go5Jp3SNqHx5hyd8+UuPt1jrsEiZyJ?=
 =?us-ascii?Q?odudSl4lX7JfqLwn10yg8uWgzuvm/dXFa8VvSSVVc+e3LeRdr4i+UUWvvAZH?=
 =?us-ascii?Q?v99Vkz9dJPrhrXr6IGpwRmMCLzha16qkdMtin8tAcFU+BuYDb27tlHBbI2oF?=
 =?us-ascii?Q?trLSbWpj0XJqoYIVJCrOS/kbZ1ns3u8LdgOUtZbhZkfvYs6vMhx5/nQboxgm?=
 =?us-ascii?Q?BSaZx3DV1rjC8GnVAJkZ2wMSUqqFzs0OETHHwOvk62EWJ0fgl5aNyGbiyzJY?=
 =?us-ascii?Q?pSd8zhucuTFeWyA/k/Uc2rfJYOT4qw0EQWmMMPMuZmSU8cK++cp0wVnzgKsf?=
 =?us-ascii?Q?P73F2mcsLCSWY1yO8ilsP5AaWvjQ4yAk9EGl4+pDCneebrfT/hrgHquxGjKE?=
 =?us-ascii?Q?D0/LbH94QlScI/UXgocDuEorYyNEY7OrlCgFTIuKy98QS1h2fJI5EjDUC2Bs?=
 =?us-ascii?Q?QAXmT7U3AMqiGEZCTHNCZf+xh12DPCbJBZtGTkQXqsBjwF53Ty1M9T0T2FxZ?=
 =?us-ascii?Q?MleYEyODpOSBYneuBuGzYu6ciNzQ7R2VRzBYnUOaTvO/m1xqHcFmAwEQTmmF?=
 =?us-ascii?Q?09nh1prLIIXrXWP4Boi7aC8gb5mCzT6f2guIahMGXNIbb0QAnQCdLced0HtE?=
 =?us-ascii?Q?uoJqid9zsvkDioww7ICQch8LawvCaNZkbwuYZ7ym1arLVhD2lE7sDj/UXLyJ?=
 =?us-ascii?Q?PKo5U2mz2FMmDjE+OJp1/kIi1Mt7ulaFCRBpJZKeJFGK1Vw3jgXEmdeTX7KQ?=
 =?us-ascii?Q?Vyj0Tf8aJ9CvB0xlQmMPO2140ebHFVQWjR413zUixGDAS2FMjkwnnIglHyiD?=
 =?us-ascii?Q?S0uf0TCuLpZ0ZRCtrWNOPoEO6lmYdLzQm5KNoSmnfPXnEv0GA7WM8RlhxeaB?=
 =?us-ascii?Q?ZInTUbRTh4LRVNWys9Y+dZ+AkXm2Tb4QXC0hIxEfZ+a24orLNg5mhudu3wqi?=
 =?us-ascii?Q?hZ3gwqMCdyW8PGIrKIsE0WG46xWpfjETdrPX5URDV91x3b2/HG5LKA2dcVPE?=
 =?us-ascii?Q?ajRkn8Ffa7VSWaRpKzG8RkAbhQLQco7lpQCqIM3OCjLpwu+A8fGr1AbgyqUi?=
 =?us-ascii?Q?vnErRCJ+HLXSbZufJumXowZRb/PXoE4ZuFBLxnbKbK6/wn2pO8QWyVy1wG0o?=
 =?us-ascii?Q?xc/jDtODXMFnmMAzFk35DLK29i6zSZBpP0cuTWJaVdgrhv+aCk37Km6+Bydg?=
 =?us-ascii?Q?Qn2S5q45BqYIX4XydzWZyAyydfKNiRlFDT7tG5MczUM+4g0Oe3uF5+WZ5G3i?=
 =?us-ascii?Q?lq4ONliDGnvX+QDBqgUe//Naxxcd4R5nhx1D7vALISo/pPGkk6IgESTYiTj7?=
 =?us-ascii?Q?fcPDZunAPTKbgoluuCc0IPSC/ask4RIjgp8IRmrm/F9Gz5gD9mNeznWGRvE1?=
 =?us-ascii?Q?Altu+w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 206b7ba8-4989-41a6-f1da-08dab306396c
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2022 01:47:34.0650
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xUeD2E07MYM87gXV7lCeA/xnH1oJydQMPJN5doTo5sduN5wiXUi2lJqplVzbUzBq2oSXsy75OosFFd0+V13mAzNJKCZ3JU4XsuvwV/jSCbJl55/d9OMERyXyuL+1bBAJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB10723
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Krzysztof,

> From: Krzysztof Kozlowski, Sent: Friday, October 21, 2022 9:50 AM
>=20
> On 19/10/2022 04:34, Yoshihiro Shimoda wrote:
> > Document Renesas Etherent SERDES for R-Car S4-8 (r8a779f0).
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > ---
> >  .../phy/renesas,r8a779f0-ether-serdes.yaml    | 54 +++++++++++++++++++
> >  1 file changed, 54 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/phy/renesas,r8a77=
9f0-ether-serdes.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/phy/renesas,r8a779f0-eth=
er-serdes.yaml
> b/Documentation/devicetree/bindings/phy/renesas,r8a779f0-ether-serdes.yam=
l
> > new file mode 100644
> > index 000000000000..ea392cd6e947
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/renesas,r8a779f0-ether-serd=
es.yaml
> > @@ -0,0 +1,54 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id:
<snip>
> > +$schema:
<snip>
> > +
> > +title: Renesas Ethernet SERDES
> > +
> > +maintainers:
> > +  - Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: renesas,r8a779f0-ether-serdes
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  resets:
> > +    maxItems: 1
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  '#phy-cells':
> > +    description: Port number of SERDES.
> > +    const: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - resets
> > +  - power-domains
> > +  - '#phy-cells'
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/r8a779f0-cpg-mssr.h>
> > +    #include <dt-bindings/power/r8a779f0-sysc.h>
> > +
> > +    serdes@e6444000 {
>=20
> Phy devices are usually named "phy" and you use it as a phy device. As
> serdes I guess you refer to actual hardware implementation, but still
> the role is phy, isn't it?

You're correct. I'll fix the name.

> > +            compatible =3D "renesas,r8a779f0-ether-serdes";
>=20
> Use 4 spaces for example indentation.

Oops! I'll fix the indentation.

Best regards,
Yoshihiro Shimoda

> > +            reg =3D <0xe6444000 0xc00>;
> > +            clocks =3D <&cpg CPG_MOD 1506>;
> > +            power-domains =3D <&sysc R8A779F0_PD_ALWAYS_ON>;
> > +            resets =3D <&cpg 1506>;
> > +            #phy-cells =3D <1>;
> > +    };
>=20
> Best regards,
> Krzysztof

