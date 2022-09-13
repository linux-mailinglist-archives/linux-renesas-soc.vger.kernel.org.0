Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68F865B6BA9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Sep 2022 12:30:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229749AbiIMKa4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Sep 2022 06:30:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231563AbiIMKay (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Sep 2022 06:30:54 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2091.outbound.protection.outlook.com [40.107.114.91])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D4B55D0DA;
        Tue, 13 Sep 2022 03:30:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NTI0jSU6wUSDfRLqjrUGhobf1IXXWcQXTkpYkls54WtRGBXAvOVmsbUzBlmR8w+QzMgyzIRYvlIOW0hklPhUJrFqw5gJBBFZp5sMBCOnyyOqvvPrwEgshggtKuNfpdT9n/oYcaUI82pkKeh7lLKWeMhX4P/eG0uzS9d3yUR4cgCtPC9wHChx04s9wgGYpR5hOg5t5770KT/nVNS3NvpxAG1j0ihiakuolIg+/OlhP3u6eNckMWo4fkqswCJgOHTWCFflmV1/GE9aGS10EU7OUyqUuepj0PtUiizUOOkapmPF47KO4VmK9nLv2AMPl1Hqk5NoVGYt8UqxSPlpHzpSyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U9T2r7W1xV/eMJ64qbp/DqG9Aj3fo/MaiN/0kOxHzF4=;
 b=Lm3avS48hWHRIGR9awDBN3KFIzZUmypgfQmFRchqaRyZ+kKKLNsw1ne/BT9fdUlpaM49/b7E5uLXpxGN8sGa4gGlt2xGNt1riXfEsFbzrHdJ7kJOSI0riMq+loLX8Wray8aenovfRKHDQ+YeWM2VhJ8maipCxazSV2lcLUtMPz2PCf65F9Si47kJpuZ+C8fDSoHErev34vkMozmu9BvfZM3OCmP5B/LFpZWxOQj7tOrq9WNg9opw58LqpgQUPFjhDnGvpsb5gAby3IwQtaIUAwaqSG/Xz1kGzF1AQ/cqW5PVOS5Ctz7tOoYOobgVp2dmJ87Fvypv4Km78TRIfm0m8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U9T2r7W1xV/eMJ64qbp/DqG9Aj3fo/MaiN/0kOxHzF4=;
 b=BtsaI01QUNeLSONKj7g5FhgYSXXvx11fNhvnKJ4l+T8kyRgq8wgcnkRVMTnIb/fLvfS/Yfvr2tscV5vqQiwuL2/9vyjvWTpeKzLDUHaoIVFJj9MnHZrQgfhlzBLFOfJN3XfJAIeoRSuR9gbs18FFqwAQ+Ea0CFlwoDBs8rtFD9E=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB10250.jpnprd01.prod.outlook.com (2603:1096:604:1e2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Tue, 13 Sep
 2022 10:30:50 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c502:8f9f:ec5e:8e3f]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c502:8f9f:ec5e:8e3f%3]) with mapi id 15.20.5612.022; Tue, 13 Sep 2022
 10:30:50 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: RE: [PATCH] clk: renesas: r9a07g044: Fix 533MHz PLL2/3 clock
 multiplier and divider values
Thread-Topic: [PATCH] clk: renesas: r9a07g044: Fix 533MHz PLL2/3 clock
 multiplier and divider values
Thread-Index: AQHYx00SZzRJbu1f4Een84uOmb7F263dDxQAgAABfCCAAArXgIAABpuAgAAGFLA=
Date:   Tue, 13 Sep 2022 10:30:50 +0000
Message-ID: <OS0PR01MB5922B00508A1F6F1B409AE2A86479@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220913084434.1191619-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdX9PCdTFsY_H6dqPVFs82HGqWzydhBaFNmL3_YR6vvWzQ@mail.gmail.com>
 <OS0PR01MB5922F5F3302A3AF05820229186479@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdXdAt5kfgPbyY-ragOL=abS_GUg4U_E1ovA3Ps0sZqHhg@mail.gmail.com>
 <YyBV1VDQZkyZ6Sq+@shikoro>
In-Reply-To: <YyBV1VDQZkyZ6Sq+@shikoro>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS3PR01MB10250:EE_
x-ms-office365-filtering-correlation-id: 3bf7d937-d930-42a2-e5fb-08da95730753
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OaYB7GqyYoFS2cxcbiFjoaZShy2kS3dLezQ7PsLjM4Zm3DctrHvEvN+7Zsr5/wXNeIfjdC8/ulA/VABy1FHth81QisYR8xXJXBPs6sxy20eIIhrBhE4TCaaRfjKn/A2Dgu+xmxzClLVJrLzQW0T49G2xL39GIEaohCfIaxMoqPVNTBKZ/IlpPmvgeCy+0dGtwb9lD4pAzSLvepHApP3RjyXQ2yAOlPH/WJtR6R6HhRpeS7a82lEF3KybU9YuugAxiW/DyseWA7KxxF8HAshYekC4fGT0+8t4y5tf2xlzKhGqZrYeacOqy8fKJ0THxpZm5gO1dZrDo9oStHR4pGyk9s+UnpepWBRt571zznJgyiWAvbDs8unLa91CFIBBbwnOatyMTrNDOwpfcVt6dNOZQi69rowD7Z43TUbVZgCQ5yk3qIHXA+JC8J8p0gbR6NuyS8VFP+iWroUlJ0D9+1cmlpg/aGnBR2IB6DtcO2kf8QHy7vt14HudyVV8vbvhUPrSyTDgIgyCLtRHj/+ltVgMuDEdVHJX9mre+Jy9CFn23E2oJGZeAQcFBiVEJJVVVTlFvZWYbG3gamDJgaNgerrZkCbsvaA3FQdbf9MJtzhlioOruqTctFkBN4QE5eEBI0u9FMS3nAm2ROrEZQKw/i4Ef4GysKpLIuAiYeis/n7l1HXf4/LO+D8TZ3cBy94EoIbR3AaMjqbemaLw/kBGXO3v6miwUOTcGpCVJ63aCYMJXNClvY2ra886SFqOk8EEzFnN2urJdl6uTSuYawqjbz68zQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(396003)(346002)(136003)(366004)(451199015)(83380400001)(55016003)(9686003)(186003)(52536014)(8676002)(54906003)(5660300002)(110136005)(4326008)(71200400001)(86362001)(66556008)(6506007)(7696005)(107886003)(66476007)(76116006)(33656002)(8936002)(38100700002)(478600001)(2906002)(122000001)(64756008)(66946007)(41300700001)(316002)(26005)(66446008)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?C/OaB8FgnbK7BVbKBcdxo3/H407w3r4RzRDmhO+4mz/xZr1Yg5iVJDb4nlDO?=
 =?us-ascii?Q?EypCgM2c8SSu3MlIDhQJhIPpqbN32N6I6dvkEXh5kKl7ZLFVuuoBo8E8XNdD?=
 =?us-ascii?Q?pMULV/QVOPjYXBcWZqkVkb3LxjEp90YdEqjgBCnj0h+sKNk5KqqkMyA8glOQ?=
 =?us-ascii?Q?ieIKZO1DskYd1O8C3OV2n1AgP2KSmq8k4Fx2wXbZ0d90jjnJMFLAiwpcnJeR?=
 =?us-ascii?Q?ri3dOs40MMid3RI/HDd7nLWz2nNjyYZ81ZuxaLyN0KmcswBNSDM86ZKl6Mxl?=
 =?us-ascii?Q?8yOuUv3zhtnGeOpxPcMF0Ok1y1HCeHzDGi6TX/NJO1csGpN41dpnh4fJdw8m?=
 =?us-ascii?Q?m57DQw+sQVzSm7p0ebyL9yH4fstja+3IoPMWO8va7qFc0kZ0atQEmCJObRV2?=
 =?us-ascii?Q?HdX8vD53Q6aHRV+7pwiXSGnErWK0bobC3KJQWqiP+ShJd74L/fswZcgA003N?=
 =?us-ascii?Q?uAlLwv/TDcYC2AAGBxI3orSzpSjnsvK+JwyZbFiVKI7sz01jPPqJUqj6mP6a?=
 =?us-ascii?Q?Fvq32S+lkfShqzV1CaVKVMjqMSVbZpChOGMAnMM0oCMoazAeqiN8Zp3ZazrY?=
 =?us-ascii?Q?Wu+g7ZtwaqPzvl+kiCcNFxT6uXTThBcNCPIFC46zu3ZvQihFcIHCKsp9bCii?=
 =?us-ascii?Q?dc/lGGAJXmOkALpTsMGFJUiZdXTwFNZ1YiINrPlKsnIO2JjRNrZFkjSxSJar?=
 =?us-ascii?Q?yHpiPxFKO6kDCz/NzN6l9E1zLpQz17fp82speVIufx2dal75Ei1uBv2EsgpJ?=
 =?us-ascii?Q?Lzwk3uwkApWFJwS9zDFan935sb1kmpLjDKs4deyx/WFb2WNMJf2zQP2LBHPx?=
 =?us-ascii?Q?J2L/8O9LkJZEPEShI0GPVIBe7s+XaQgIpCl4UM/lA9rFk4dUPB8iRi0JdiP9?=
 =?us-ascii?Q?aHjz/fHjJuW2PxlnJen3GuIgXPefYzVVSlrIDmL/5sFDdVZ+iB+8UJp1n6vh?=
 =?us-ascii?Q?zX/wK4lp86xYpPpwvS5q+h97BCHn8b6nts8KtrbGQ1qttCrEbbBQAMcyHBVU?=
 =?us-ascii?Q?dDMpap0a3cjBcue6sSWIjygntOQ0aQZlYtlvVSGfSwggGEGSmwsU3UgetvIg?=
 =?us-ascii?Q?dIND50ydF6ISZ+SYIFXLPAiqvQiGpzQebczTaP5VpVEe6GrJFIs2sN9ZX71N?=
 =?us-ascii?Q?6zyuDGCqrmlva6XMk59yeel/Q72Lw0F/p1xDjn8rNBARAFe91T7vIkDMKyZA?=
 =?us-ascii?Q?NmXp+mYdfwBPGIyneNbzYzqRDaF/8Yb2+PIMvaqhg7gStXAGIdSO4v8wovui?=
 =?us-ascii?Q?veZNtcjtinFwGL8iRBYVp3aksAYBHJejBoGIFlMeI0Xtj3ZodFig2d/fzeOL?=
 =?us-ascii?Q?SZ4ByL/6GmpT01J/rn6osTPDlPgthAHti1muXbCzrOEDhhmdiU/LykidIHnD?=
 =?us-ascii?Q?v7Q7AztgwhxL07i8S6py9vU9ZdBN6/veQnQGGUwlgRV4cVtwKs1C2EGDOj9o?=
 =?us-ascii?Q?c0AsglOkhplWTeJYDBNju/nmDoeZHfl1AR+3UX4xkhPsljjG6do1WmBgk3nF?=
 =?us-ascii?Q?xzhtWudMv7D7LdykonitPCFWG0b6q2m+NeaS4enYAyPMU3oYvAyCe9pBsc4e?=
 =?us-ascii?Q?rlVnPFPCOik9I1fGCHc6+yENXrcc98fjnhI5ZE4M?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bf7d937-d930-42a2-e5fb-08da95730753
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2022 10:30:50.2750
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oOCkk4KAf04gytzLYNygYCaQ1khQdkmWAcSU/40hc1JMul9cq8x7rDw/ENjSEtfSGL2ON6hgr3pHQnviRqTsdMZAlRocQaYxNI0l2yjFnMM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10250
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram and Geert,

> Subject: Re: [PATCH] clk: renesas: r9a07g044: Fix 533MHz PLL2/3 clock
> multiplier and divider values
>=20
>=20
> > Perhaps the "if (freq > (ccccc))" check in
> > renesas_sdhi_clk_update() can be slightly relaxed, so it allows e.g. a
> > 0.1% (or 1/1024th?) higher clock rate than requested?
>=20
> Yes, we can do that.

		freq =3D clk_round_rate(ref_clk, new_clock << i);
	      + pr_err("%s## freq/new_clock=3D%llu/%llu",__func__,freq,(new_clock =
<< i));
		if (freq > (new_clock << i)) {

This is how it ended up in selecting 400MHz clk.

For (new_clock << i) =3D 533333332, clk_round_rate becomes 400MHz and it se=
lected that clock.

[   18.364948] renesas_sdhi_clk_update## freq/new_clock=3D533333333/4266666=
656
[   18.364980] renesas_sdhi_clk_update## freq/new_clock=3D533333333/2133333=
328
[   18.371871] renesas_sdhi_clk_update## freq/new_clock=3D533333333/1066666=
664
[   18.381122] renesas_sdhi_clk_update## freq/new_clock=3D400000000/5333333=
32
[   18.388033] renesas_sdhi_clk_update## freq/new_clock=3D533333333/4266666=
656
[   18.394936] renesas_sdhi_clk_update## freq/new_clock=3D533333333/2133333=
328
[   18.401829] renesas_sdhi_clk_update## freq/new_clock=3D533333333/1066666=
664
[   18.408760] renesas_sdhi_clk_update## freq/new_clock=3D400000000/5333333=
32

Cheers,
Biju
