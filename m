Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EFEC67A803
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jan 2023 01:52:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229528AbjAYAwa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 24 Jan 2023 19:52:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229629AbjAYAw3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Jan 2023 19:52:29 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2128.outbound.protection.outlook.com [40.107.113.128])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25B5C113F2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Jan 2023 16:52:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NovtYSoXc+lDFAE7JR4ytftu948YQimIz6p6WpJBK/f6fX2+19dCz0kW+BhfbdooyVzIMI6BowkaWEFs+f0TAmA5JEm1qF34zYoASM/6/TO12KF5rkAKOWk1xwpsekk2CfKCevHLKf50L+0+K0NEsb0lBhgGkKcX2U1XbrYeTY5uz0A42ztNXdJWmeCN5Zx7+dMnFOKRIqfYUYKm8LM9UZLwbdm2+HTXX89Hd2eMLXmf18H5orqyp0+vEWeFLnxUw6MxqbM1BtwiAXVCtp+zlr2IczN0E9PCHP0SvoluyTZDwjhFm/Q9oUk1rOwDpvAhiQ4a5xDz1j+29JGekgWwpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=swAsELePrPWJBeAUWHTqoEz+R3BRXEZuWumCA2Ld/OI=;
 b=m0q7vXJWkIR4rV7N1wX3InU1UQjdMqckZuQsD5BmRGdnpWc+eqnvZrYOg0uU5QtvXK2XRP7D90PEzvbwWuOk8q9v++iRsdqtUGeQcUZW8QeTkaedzqgr9nHhB31XNehrdwI8ixH2RFsve425HK7+iP2rFYwisjaLJnJ3OREoqTLzbA/uVe4UJknA2/QtS7M4GywXStgX5hZf8mejFCy5zEZtdgVZSyQIFwemPg0A41XR1tdYgp64MbZtlLpeddV3oUP7xEYiNWc5FYRkiAqlN9A1xgE4hRVuUBR9xqKNwLUrs8R2DlsrDSXY8cjKuAEQaJa/UCMlHc1oK9OVFSf4fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=swAsELePrPWJBeAUWHTqoEz+R3BRXEZuWumCA2Ld/OI=;
 b=TyS5pYQ7Qd8ynyN1vh15OVV9hmLNxqwETJP79fmu56VvdjeQWiK04k+S8iloq7ZJGzhQC37G2YahH67Ce5kN4BAvDd4ZLqSDf7uAM37eeBx5ENvEF6MbXv1jn8o4hSNZEWe2Mw9E1bp+TbWFyNKN4C+Xx26IbLG2dxe3eIzsH2k=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TY3PR01MB9967.jpnprd01.prod.outlook.com
 (2603:1096:400:1aa::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 00:52:24 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::3e61:3792:227e:5f18]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::3e61:3792:227e:5f18%9]) with mapi id 15.20.6043.020; Wed, 25 Jan 2023
 00:52:24 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "geert+renesas@glider.be" <geert+renesas@glider.be>,
        "magnus.damm@gmail.com" <magnus.damm@gmail.com>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 3/5] arm64: dts: renesas: r8a779g0: Add IPMMU nodes
Thread-Topic: [PATCH 3/5] arm64: dts: renesas: r8a779g0: Add IPMMU nodes
Thread-Index: AQHZLsrty1X1n3skEUyO5H8IuxS4Cq6uUFGQ
Date:   Wed, 25 Jan 2023 00:52:24 +0000
Message-ID: <TYBPR01MB5341A3746DE45EE185E546E2D8CE9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20230123013448.1250991-1-yoshihiro.shimoda.uh@renesas.com>
 <20230123013448.1250991-4-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20230123013448.1250991-4-yoshihiro.shimoda.uh@renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|TY3PR01MB9967:EE_
x-ms-office365-filtering-correlation-id: fc8092f2-2366-4878-68f7-08dafe6e6c59
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: J4YCXweWvfc78GzSpgcigu4eEgqtXrNnSwMT/dSFno6gVJcl2G2WDKuU5yRiz8zRamidnwdKMUgD7tFtgaU940m7wJ83u81NCaGP6gIDlIskIMHNYFJKNt2nK/D6FUSCVdTujwIviqO2GbQFs9OhfO8Zd8is3m3UC89cfc40Elxc9IEDEGEC1eqyGCcYZSvN7j14/I67S9nVc5sJ3Bbimmu5u4OhsbmeXm/lP/9rHmdRhBUvXGefntoNMVlBa9FiSHXfRnbTvSSjsSyGxgk7EDBH2saeZpxzY175emxNOzaNHSlBbH1aqF70WM+yiNYTGf0yjHFN7EToboh1AB35nms40ZRtX8qhggHFTzOIT1KZDgA905DUiGljEQ0KXo9ZhupmaNO7FDZ6txXpERScrFQqOdWDxZwAG6hGXWqmr0hWUqmrtAiheejEHaAJD0B+I7yCIjwsWhTzDvcuhWigVUmeAYn3DoLHOUFBqWFnxOTi56Z35/ZBLlTU48SOuB0nqiqg9oPTSpLhKkgW0X1QhDMeoge86w0I87Y3VOG+cNO0OqsK5KZtNzD6PK2S6KE3VhR6lW51QC29LpadjgR5/44EOtzOwuNgMM/pV773YFwdYHUM7lKrwXrlfpWoYwWd+7O7R4WRehvWhMNekKPucYXPtxrf8Laami9KQHr2FXnYzPCiJEJ9E82ht+D3Lc0iPRDzGltv9xdb2lWd2WAd2A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(346002)(39860400002)(376002)(366004)(136003)(451199018)(38100700002)(4326008)(33656002)(122000001)(64756008)(66476007)(38070700005)(55016003)(478600001)(316002)(66556008)(86362001)(8676002)(76116006)(66946007)(110136005)(7696005)(71200400001)(6506007)(66446008)(2906002)(186003)(52536014)(41300700001)(9686003)(8936002)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?W4Jp6bcVCHg+ASQ2GQRbBY7YfsgZJbCJxE0aV0DzfIbvYovnZTt1Q5tQuQc/?=
 =?us-ascii?Q?rcQEPHZqueVypa+vT5Xz0ynlFZn971IbfszY3bY6IXgdLjaFPgeAXBg4dxBD?=
 =?us-ascii?Q?tAsrwqSuC2btgP3YLsv/0vswCRtP/xyOw53a2Valvr/iGresQmziDG0CtCL1?=
 =?us-ascii?Q?H6Xz4LvRCGe0wODP37NzzneWrPc8b64qzHNCRFr4qGzDNxA8g9QyfVq9HlqK?=
 =?us-ascii?Q?FCAecL5S/1uit2go5cYUNnDcnx1Wdma1Xp3q7kW8GBXBHuAawKj1qXw6mK8L?=
 =?us-ascii?Q?MJqODwKjqvE6IJTGcrwK2A8MMrdmUCnsQnAbkmGj2ETE8u8wvO1KRMPhsn7b?=
 =?us-ascii?Q?KrUMjA5uNzrXi9uPDTLCbekFyUcVN445ICh1/cQ/qJTgHBsdYaDhBuBmI1GV?=
 =?us-ascii?Q?IZeH+Q13x+vgH1i35vLwNQGffXsxJalr5glyTIGhcbBzfM3H9bFwx9cG28Eh?=
 =?us-ascii?Q?8AmwcsieH47y8/4on9VfDMMcuPtzb9+39iFMuN0FUDo9MyDTLArsYQXG1DrE?=
 =?us-ascii?Q?gZGrTUA5mFryvaewu5LIGMXfkm0AUpZLhqrXWuy8/EdbI6haVY4ZO+qX29wD?=
 =?us-ascii?Q?vg3rOQtsuY+HQED4rYGyXbrgnsh0a+4QxBU1uURUK2F8IfD5tIwZ7XF3V4gL?=
 =?us-ascii?Q?wf7mX7XgnMxf6EJaB/J19ibywiNnCQ2lTDEUTV3slB98rlwXWHJW0nZKJKk2?=
 =?us-ascii?Q?fA7Z4Q47HuVLmvswEzEplJp8xMZkyTxaUhMTs4Uo1ecat5PoLIXqlanYjC3w?=
 =?us-ascii?Q?VEyfZBNHqdGf8T7thuuMttoSjwmhagXXi2Bzu7rHB+vyAv57yRBRE1KOt/sz?=
 =?us-ascii?Q?7Pujoh0M2HQq6efN2y1vZu6dn4NNx8pSsort9Sfi/3l5vwwniBCwcAB/oiSp?=
 =?us-ascii?Q?1Y1iUYdnuW77Y2rr9h6OKNhH1WmC9Ru5Op6YpVMTznIwf9wXySPtwtfhN53t?=
 =?us-ascii?Q?wCzDxgv3Pz5Fl7TooGxeSUYb/182RYa4Uz2kYX0/3EKK9kFA8bfit0PY38Xi?=
 =?us-ascii?Q?ndVA3aBk2fFIz7YDK7eTqFwVFJbOP5VJDXEzg/X84SVitIc7Un3I35z/XVo0?=
 =?us-ascii?Q?xWPpHd4T0fPKQblXsb1av5pVMzh8EhArANR//mx/pFE5l/PcDkege5RK5kuB?=
 =?us-ascii?Q?f4EwXLt+F06NGmrD65btZ9PyJXYtv35VhFm8N9sN3ST9jGivQjAies1i0C3N?=
 =?us-ascii?Q?PZQSlNlICNWyz42igmV5ABvvGW/LH9u1qbHbmyPlR5juu2P6pNFXgf//2IQ6?=
 =?us-ascii?Q?P150Nl67r59MN3ZVvMhVmkaegMLzPYhTs+D3KB5kyCxFWymhCLiMlB4fKkih?=
 =?us-ascii?Q?gQlwO46ZyQkSbwf6WgyMZlvAJEzSxDoR66qUf5rw+uOtEJxAU9i5yUxJXgIE?=
 =?us-ascii?Q?8CVyUZAdbtEiPpdmBJnqYMGEw8OfqtmCWuT4asXlEdX9jXt1mJ23utYiYIdU?=
 =?us-ascii?Q?nWGBa8pygmZdYVVxmhSfc5yks2jYqRmHfs2rYc9UehB+HIqbndLFNFOpq5Jc?=
 =?us-ascii?Q?7sc4Sr6CJJazr9jGhGkCbNHprn7qjBAIAmfvUH8BgRefcxYH/2em0eMA6L0C?=
 =?us-ascii?Q?MoO8NPz0MQRyfsVc115pbhJYqI+9TiKWR+r07XmoIWCTbR8UdAEJfmG8269m?=
 =?us-ascii?Q?V+xoZV3ag7jX0FOy2meZNzOIYFpJY4Be3CJ3CIJJuaTu/5zSSvOTGm558GIK?=
 =?us-ascii?Q?3RkZow=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc8092f2-2366-4878-68f7-08dafe6e6c59
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2023 00:52:24.3846
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FuLJDW2//7EsuVD/pHU/6Lm09y6RO2lZ0CJ8OIg9JVN0DsL0tOhH4JYd2nJ6alQx4JUTzzNcNGxYeP9+bkPM1144QshG6ikAtHwx7z1xIObVqTas++LlFiFbIC2PsEQA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9967
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert-san,

> From: Yoshihiro Shimoda, Sent: Monday, January 23, 2023 10:35 AM
>=20
> Add IPMMU nodes for r8a779g0.
>=20
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 109 ++++++++++++++++++++++
>  1 file changed, 109 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/=
dts/renesas/r8a779g0.dtsi
> index 83d1666a2ea1..631192dec514 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> @@ -1162,6 +1162,115 @@ dmac1: dma-controller@e7351000 {
>  			dma-channels =3D <16>;
>  		};
>=20
> +		ipmmu_rt0: iommu@ee480000 {
> +			compatible =3D "renesas,ipmmu-r8a779g0",
> +				     "renesas,rcar-gen4-ipmmu-vmsa";
> +			reg =3D <0 0xee480000 0 0x20000>;
> +			renesas,ipmmu-main =3D <&ipmmu_mm 4>;
> +			power-domains =3D <&sysc R8A779G0_PD_ALWAYS_ON>;
> +			#iommu-cells =3D <1>;
> +		};
> +
> +		ipmmu_rt1: iommu@ee4c0000 {
> +			compatible =3D "renesas,ipmmu-r8a779g0",
> +				     "renesas,rcar-gen4-ipmmu-vmsa";
> +			reg =3D <0 0xee4c0000 0 0x20000>;
> +			renesas,ipmmu-main =3D <&ipmmu_mm 5>;
> +			power-domains =3D <&sysc R8A779G0_PD_ALWAYS_ON>;
> +			#iommu-cells =3D <1>;
> +		};
> +
> +		ipmmu_ds0: iommu@eed00000 {
> +			compatible =3D "renesas,ipmmu-r8a779g0",
> +				     "renesas,rcar-gen4-ipmmu-vmsa";
> +			reg =3D <0 0xeed00000 0 0x20000>;
> +			renesas,ipmmu-main =3D <&ipmmu_mm 6>;
> +			power-domains =3D <&sysc R8A779G0_PD_ALWAYS_ON>;
> +			#iommu-cells =3D <1>;
> +		};
> +
> +		ipmmu_hsc: iommu@eed40000 {
> +			compatible =3D "renesas,ipmmu-r8a779g0",
> +				     "renesas,rcar-gen4-ipmmu-vmsa";
> +			reg =3D <0 0xeed40000 0 0x20000>;
> +			renesas,ipmmu-main =3D <&ipmmu_mm 7>;
> +			power-domains =3D <&sysc R8A779G0_PD_ALWAYS_ON>;
> +			#iommu-cells =3D <1>;
> +		};
> +
> +		ipmmu_ir: iommu@eed80000 {
> +			compatible =3D "renesas,ipmmu-r8a779g0",
> +				     "renesas,rcar-gen4-ipmmu-vmsa";
> +			reg =3D <0 0xeed80000 0 0x20000>;
> +			renesas,ipmmu-main =3D <&ipmmu_mm 3>;
> +			power-domains =3D <&sysc R8A779G0_PD_ALWAYS_ON>;

The power-domains should be R8A779G0_PD_A3IR.
So, I'll send v2 patch after we discussed updating dt-bindings of "renesas,=
ipmmu-main".

Best regards,
Yoshihiro Shimoda

> +			#iommu-cells =3D <1>;
> +		};
> +
> +		ipmmu_vc0: iommu@eedc0000 {
> +			compatible =3D "renesas,ipmmu-r8a779g0",
> +				     "renesas,rcar-gen4-ipmmu-vmsa";
> +			reg =3D <0 0xeedc0000 0 0x20000>;
> +			renesas,ipmmu-main =3D <&ipmmu_mm 2>;
> +			power-domains =3D <&sysc R8A779G0_PD_ALWAYS_ON>;
> +			#iommu-cells =3D <1>;
> +		};
> +
> +		ipmmu_3dg: iommu@eee00000 {
> +			compatible =3D "renesas,ipmmu-r8a779g0",
> +				     "renesas,rcar-gen4-ipmmu-vmsa";
> +			reg =3D <0 0xeee00000 0 0x20000>;
> +			renesas,ipmmu-main =3D <&ipmmu_mm 10>;
> +			power-domains =3D <&sysc R8A779G0_PD_ALWAYS_ON>;
> +			#iommu-cells =3D <1>;
> +		};
> +
> +		ipmmu_vi0: iommu@eee80000 {
> +			compatible =3D "renesas,ipmmu-r8a779g0",
> +				     "renesas,rcar-gen4-ipmmu-vmsa";
> +			reg =3D <0 0xeee80000 0 0x20000>;
> +			renesas,ipmmu-main =3D <&ipmmu_mm 0>;
> +			power-domains =3D <&sysc R8A779G0_PD_ALWAYS_ON>;
> +			#iommu-cells =3D <1>;
> +		};
> +
> +		ipmmu_vi1: iommu@eeec0000 {
> +			compatible =3D "renesas,ipmmu-r8a779g0",
> +				     "renesas,rcar-gen4-ipmmu-vmsa";
> +			reg =3D <0 0xeeec0000 0 0x20000>;
> +			renesas,ipmmu-main =3D <&ipmmu_mm 1>;
> +			power-domains =3D <&sysc R8A779G0_PD_ALWAYS_ON>;
> +			#iommu-cells =3D <1>;
> +		};
> +
> +		ipmmu_vip0: iommu@eef00000 {
> +			compatible =3D "renesas,ipmmu-r8a779g0",
> +				     "renesas,rcar-gen4-ipmmu-vmsa";
> +			reg =3D <0 0xeef00000 0 0x20000>;
> +			renesas,ipmmu-main =3D <&ipmmu_mm 8>;
> +			power-domains =3D <&sysc R8A779G0_PD_ALWAYS_ON>;
> +			#iommu-cells =3D <1>;
> +		};
> +
> +		ipmmu_vip1: iommu@eef40000 {
> +			compatible =3D "renesas,ipmmu-r8a779g0",
> +				     "renesas,rcar-gen4-ipmmu-vmsa";
> +			reg =3D <0 0xeef40000 0 0x20000>;
> +			renesas,ipmmu-main =3D <&ipmmu_mm 8>;
> +			power-domains =3D <&sysc R8A779G0_PD_ALWAYS_ON>;
> +			#iommu-cells =3D <1>;
> +		};
> +
> +		ipmmu_mm: iommu@eefc0000 {
> +			compatible =3D "renesas,ipmmu-r8a779g0",
> +				     "renesas,rcar-gen4-ipmmu-vmsa";
> +			reg =3D <0 0xeefc0000 0 0x20000>;
> +			interrupts =3D <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>;
> +			power-domains =3D <&sysc R8A779G0_PD_ALWAYS_ON>;
> +			#iommu-cells =3D <1>;
> +		};
> +
>  		mmc0: mmc@ee140000 {
>  			compatible =3D "renesas,sdhi-r8a779g0",
>  				     "renesas,rcar-gen4-sdhi";
> --
> 2.25.1

