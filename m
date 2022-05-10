Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4C5452106F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 May 2022 11:15:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238495AbiEJJTt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 10 May 2022 05:19:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237308AbiEJJTs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 May 2022 05:19:48 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2094.outbound.protection.outlook.com [40.107.113.94])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B7063A5EE;
        Tue, 10 May 2022 02:15:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UsvMY8TwoJIrOC1WZQa2pMlwm3hYAZG1Y7n6kPTguEB3aPTWc655yCQX9W8N84vGrAit40v62GhR8UM5YsIq5lKTrMXZzRABoJd6X+54tMD69Jpozcd87vZpyAFJ3ivLUrfb/6T8ujYyS0S87LKvHb3kAae3J599qyTBXypFUe8OyVXnXbzsOQa8yWkNt1V7Q0GPK+lyCmyvxVqg4sjbUXUXxzgM60HtbjH2wOUb0vsh9UQ8/pbKiDvmz9gBCIM2hoHdG5yYzr5qBRezgZeXtQKlqLaW/t5wFp1gdHojLk1Ampiw1fLRRFQSkqeVkG1mDOcEsiCLpHB1El80MVpy2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xmaMtm+XuTu9673c9AINtpdfcMGLt95QsuXg/TuMzoU=;
 b=WqzxO28wgoyw8WHxj00a3XGPuzXb6RFkq8Q4BjW71Q3G7lgxJGAqEGGITdv9RJqQJSyZ6lEX4vP4lZ9AdZZ/bUZC/r2vAoIZ77KDSovIuxG03Kmr6gX8E3wzCjk/fQ+fKcZXxYt7oISHtjvzFQnrrqIMPHFSSlqP0oYTC+2eOcPnTkTW+OQ2RzVIrVSz/qtngtDXk5D2qepaLfboUPtH3cZmeGds8jY+DS5PP4wUex3xOKkU55AXNKyH0iwTyRWBE9u5P5dE5/MF0RqBhXXrTuhvFWVbUX7Q4pk5O9x2T3PKhO2YdLnIG2PZWvYZP/0nJ2y1u3GquG4NPu959f1ynA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xmaMtm+XuTu9673c9AINtpdfcMGLt95QsuXg/TuMzoU=;
 b=Q+W6+YB0dPlrem4DBxKk6KXUDyC6+m9nT36k8tHmQDBqmFHbpnP6v6P5WkbjzKHtjkzGQfc684ixrkVVRTPheyAGJ/fgma73Y/FFpHlmQMppgJXhOyJyBp0b8AsLsGvZe2ywW3xUwjknXm8pmeS/v9dVtwoERNDNK2YIB/fRUcw=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYAPR01MB5165.jpnprd01.prod.outlook.com (2603:1096:404:12e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20; Tue, 10 May
 2022 09:15:47 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3e:970b:c238:f57]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3e:970b:c238:f57%9]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 09:15:47 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH] arm64: dts: renesas: r9a07g043: Add ADC node
Thread-Topic: [PATCH] arm64: dts: renesas: r9a07g043: Add ADC node
Thread-Index: AQHYYLAXexu1Iz9l/0mXLMs9PUTblK0Xy8wAgAAA//CAAA0fAIAAAPdg
Date:   Tue, 10 May 2022 09:15:47 +0000
Message-ID: <OS0PR01MB5922B28212F59C522FE432B786C99@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220505184353.512133-1-biju.das.jz@bp.renesas.com>
 <b89be37d-ec17-8b6f-561b-63781352e774@gmail.com>
 <OS0PR01MB592248147BA1A775236B080186C99@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <530ed78e-bce5-09bd-f0ef-f20de956cfcf@omp.ru>
In-Reply-To: <530ed78e-bce5-09bd-f0ef-f20de956cfcf@omp.ru>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a7c3b054-792f-4633-eea4-08da3265ab50
x-ms-traffictypediagnostic: TYAPR01MB5165:EE_
x-microsoft-antispam-prvs: <TYAPR01MB516574A65820A1C74585DB8C86C99@TYAPR01MB5165.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8XERLqLsVavJY6QQj0YN55qhPToRx1chwLcvd5pPo2vuuLmxGLRRo57gdSXaAQRY0RKWDlJn6TJuHcdTVGxjvmiFkXQ7LLW7jhZZkv5b7Xlh/K66XXowH1TZoSjIcXEsZiY5Ds+TedPN9BF6gMOGaMiB+oyyYk6elujgRsZK4MDqD4hl++DrR14e7IJyvJSXsujaW3SD6uI4JSjvuZsMBeOXTsgpYG4QsLD70eMr5nonWDOMSkIX0AoxsQtsLwFL1wOvlPZGuuVMYib4BYY9Z0GND6+O3ooeb4PvyaZCopAwbJMlBuA/leBC/ciWYJHWhXJ+7ET/11xKjzPJ/6GvPjLU4lt8wEPnZTkAEOjwY1GN53QhznZdDu7NWC8et8tH8bRWLUQugML4Bb0U30VJJQaPmkcnbcRJqx7h38Vsv7PO6y3KXSiQJ67E0L6swILmZN6Jh9hNT6JxCCOQV0je763fKgyT76/KyjlHitguhcQ73eE9oAA1a5nTXe3KURHQtIgX4DTBa0YqtXHgmmh//Ob6Ll/YJu/nsF2/rQGYU/xodHRTqQBgvb63puUnk7gpq+FHkjaLs06TRtlllXYpsXjsQiIGUopUMn4mDRzc8pqMebqxseKMnzx7cKaphseYTSXvC91T0X+Km0fmgT0Cjh1IV5KKeQlkhsO/sfiVLkO/9geOC1/NF/mrg4T82vQwuCsS8erRjJCqHKORpSAqFw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38070700005)(38100700002)(33656002)(83380400001)(2906002)(186003)(5660300002)(55016003)(4326008)(8936002)(316002)(107886003)(8676002)(86362001)(52536014)(54906003)(76116006)(110136005)(66556008)(66476007)(64756008)(66446008)(66946007)(6506007)(26005)(7696005)(508600001)(71200400001)(122000001)(9686003)(53546011);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VtEYPkd5106CyrZ1daW9xNGSz2BF5h0zP0wkwh5gobSNk+3nwAO8vsuH5BmJ?=
 =?us-ascii?Q?OSrZ2wGp54yRag8IzvXoq6pqS4CNbOYAv7wdUOIqfH0XfImoE5kk/7a9DkHz?=
 =?us-ascii?Q?efNVRRrMTME/B6Qv7E+GU6WyOxbq5JI6or5tg1oBwgp9Em256NFA/MiATWre?=
 =?us-ascii?Q?41qjxh/KbHQ2Qf2P93hYBHiWJ4bYIczAF+XawFGAOQoUIQLhm5jzhzj9KuIP?=
 =?us-ascii?Q?wg/yqLFQTfYlxABPCReyhsQrD9OpS1vXof2tcStj5hYZXBCkhnO9Nsv3SLB3?=
 =?us-ascii?Q?MoYsaCoe/3r/KOClrL1Swc4DWEupRFirP06WIictDNxEohuf4BqFRhlRMLjB?=
 =?us-ascii?Q?VVF8ug4EbGlqNLMlpwjpfLu7gx86YOuqpL8OUEcI42PysSclQ/XUuDMzj5Sx?=
 =?us-ascii?Q?CLACwZs2m/JAQXaUvqtrXNCNWH3oCFy4a+zZdXRja9HUJ4fMK71A3Ty2GFjn?=
 =?us-ascii?Q?+vsx4qd/LIUG3BBDzeOZnpSN+4HYie8xISgSzVH7hA3SUqo3NkWFhcJ10AqR?=
 =?us-ascii?Q?3hetqX1BjiqeZusbVihbHGgSRcsUr38L0KXDTsFlJlCc45+AJ4zwTvw2wGUU?=
 =?us-ascii?Q?Xu3Q+zxm1ZqnjLUxSirI+Ahla0DLX+2U7Rq5J19IyzScgF0eBYVLJrIYx3EM?=
 =?us-ascii?Q?mNFE4yJoSFIBOxf0Q9FbaSnyQ+8Ge1sGnBy2J5Ix8b3FG50QaGMYHBojIRC9?=
 =?us-ascii?Q?PGJpBpjR/E6vuMHe6MLMKDhDrcYpJvgfHJNPh1yn7wH+K1anMCo0/hBnq2Jj?=
 =?us-ascii?Q?QmKCtzpx0o5xPlhEeGcvpaI4wAhnP15SwBp2unEbGBwA8XQFqpyy9slZqJJ4?=
 =?us-ascii?Q?0VhXtW3nTd5Esaw2L+ej1gmy7yY2d9YE6ffgzGCmaHzkjtANekYJVp4sh+Cu?=
 =?us-ascii?Q?9KUzrEnbclX5zk1o58yWipcllMWoFtKQzEd5IqvDR4iXUQT5MG9NtCv0r4/p?=
 =?us-ascii?Q?xp68VTctdkqS7jS/4Zof/wwR6gGQYIYsPt3haUrVF9dzrB58T5ZzSgLv0P4s?=
 =?us-ascii?Q?GZJQtyaC7jIojr1YgGWr9iFQn6iNzM8Ho5gZefj8n0rbhVT6u+CJ26bM4el1?=
 =?us-ascii?Q?OYYkvaoz4kn+pnHxzA2TRp34HoJTcpsWSt8bTX+Y3nWHGKsdW9u1Mw+BdJ2I?=
 =?us-ascii?Q?QIKkVeuBsSeAY2OVVwX28SU7XAMol2cCsEjHIlcxQC0iYkc4uKguSanJw46h?=
 =?us-ascii?Q?3246AO1eJVweZFL3JAULV5Xp8pCJgWLag24Xb5hU6lXvF3CSuuEjNevs4oNC?=
 =?us-ascii?Q?oeOYTL6ySIj6MwMysD6Qj9KrqfXm5QOjAmwqtC2d7EHB1UYYdpfHMg2gRGQU?=
 =?us-ascii?Q?lqUGuLTV5uZeOut5FOanP7OB4/w97LLYKrne1D05z7r3a3HvoiqJABK0p+rZ?=
 =?us-ascii?Q?hdn5Tikf3UVjKQ7KUWXbbKhSV2cH30wXukIwAeBO1it70Vfuy9isGDRLIOZ/?=
 =?us-ascii?Q?5fz4ZsMST9aEWFWE1betQWJ0UrGF/tXQyINgptNs0gAy9E+AWOKA0gQujHi5?=
 =?us-ascii?Q?u17rdsLf4aw1oOrkhgmFvB72I9zWhFNp4So5s4VSkKDmN5FoQUnu9rgNY5Oa?=
 =?us-ascii?Q?FyIcumbbT4wJ0HJTjH6p+0K6vILtFUPGFqYlm+aJmGM0DxTvCjAjrXNeFo+O?=
 =?us-ascii?Q?QxkScVo2rcNIqV8CAdSNP2mwRgl23YHuocoJP/DwtXcywFR9sUjiVzQGRdjy?=
 =?us-ascii?Q?G6uZ3yqDXsPOYSXy/4UIgI3E7+JSbGb9nJ+EgoAhj/MwLp+opLW7uqo+fUNl?=
 =?us-ascii?Q?iqo81no07RLY+XeTZlJFvnv7paBbGwc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7c3b054-792f-4633-eea4-08da3265ab50
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2022 09:15:47.3483
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Iq/cYBaXozrwrta+nBZ7z6WdvD8cL3t2ZFsb9fb9HmL+wsDySI17N+zwxrzP4qeH77AOtEZMVXovsRzIjUNXxs0jCGjvGv1t30y6zSuoTD4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5165
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sergei,

Thanks for the feedback.

> Subject: Re: [PATCH] arm64: dts: renesas: r9a07g043: Add ADC node
>=20
> On 5/10/22 11:24 AM, Biju Das wrote:
> [...]
>=20
> >>> Add ADC node to R9A07G043 (RZ/G2UL) SoC DTSI.
> >>>
> >>> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >>> ---
> >>>  arch/arm64/boot/dts/renesas/r9a07g043.dtsi | 21 ++++++++++++++++++++=
-
> >>>  1 file changed, 20 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
> >> b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
> >>> index b31fb713ae4d..40201a16d653 100644
> >>> --- a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
> >>> +++ b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
> >>> @@ -483,8 +483,27 @@ i2c3: i2c@10058c00 {
> >>>  		};
> >>>
> >>>  		adc: adc@10059000 {
> >>> +			compatible =3D "renesas,r9a07g043-adc", "renesas,rzg2l-
> >> adc";
> >>>  			reg =3D <0 0x10059000 0 0x400>;
> >>> -			/* place holder */
> >>> +			interrupts =3D <GIC_SPI 347 IRQ_TYPE_EDGE_RISING>;
> >>> +			clocks =3D <&cpg CPG_MOD R9A07G043_ADC_ADCLK>,
> >>> +				 <&cpg CPG_MOD R9A07G043_ADC_PCLK>;
> >>> +			clock-names =3D "adclk", "pclk";
> >>> +			resets =3D <&cpg R9A07G043_ADC_PRESETN>,
> >>> +				 <&cpg R9A07G043_ADC_ADRST_N>;
> >>> +			reset-names =3D "presetn", "adrst-n";
> >>
> >>    Not "adrst_n"?
> >
> > As per bindings[1], it is correct ie, "adrst-n"
> >
> >
>=20
>    Then I think the bindings aren't actually correct. But nevermind... :-=
)

Why do you think it is not correct? What difference it make, changing from=
=20
adrst-n->adrst_n? Is it violating any DT specification?

Please clarify.

Regards,
Biju
