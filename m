Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4564E7E8BB9
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Nov 2023 17:49:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229472AbjKKQtu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 11 Nov 2023 11:49:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbjKKQtt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 11 Nov 2023 11:49:49 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2138.outbound.protection.outlook.com [40.107.113.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D3132590;
        Sat, 11 Nov 2023 08:49:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XLgnU7wRgLMekXsHU+a2tPud+XeR6oG0volUsAymc+U6UV63fAYY4EzkImjjFd3+SQwbskkjga1o/2fIiIEC1TiFVGvoVf8KGMWsMMVDeQ/BrH2wU6CfFrLYf8YP6g9b+5vgYwgev7pVS+UweFo5Q94VpgtM+M8/PZ9A72r9EK+ov+QIalRpM2Tobah9FrQL1Iu6+KJgKABYtZ4xocpXVsP48lITL2SZ9tOfe3fBF21gJqcuDciO+sUXsrTv4fpT6s7eFpF5RYJtDmnBlxMWTur/60syNM7sAvBP13jFiMthPmW6WGKtxWVCL5TcMFF2Dk658RBKNG2Mdq+coYZSOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KUtJpJ3AzJyCMObIQ+k4MAuP7GfOvMxgwmFIGVnTDG4=;
 b=mst3HiMpi1QChvPfvGT2y+JpqX1pAbDQwHltHTYO4rxac/SGhOYy08NdDsWl5eTBpse6PesHGKQB6DAz2rpS58ile48vDI/HHpieD14BizkHpk+fE33yUKlbUKa/pr9hqoyITyXpWmiLMgPdJB6KSXQdUWF1rJsD2hjn0GPZTphTEKeiV7PbXIn9tpG3mpB4nzLQ63wdePXUDbwb+yqZlP6+ILVfz4qzU4lLsvzcxDGbrhQWl9ljCW00GXzQzSFVc/vR6GNZ1wrTJ9VBTPHxsXaTQWfR+3MgFfTy2GTPJbnLQcrdnnIW4wdsLHyFaCnhh+34D461qyuW0t4y+kfpYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KUtJpJ3AzJyCMObIQ+k4MAuP7GfOvMxgwmFIGVnTDG4=;
 b=l5iSFWjQlgRT28fSjx9IkpA40m2JhOmXn6DUXID5EcQ7u8odxXKiPKH/FLyi1ujsDNcwXBECpaFscJ4gd3p8caNofxHeRUIwn+R+k+YDVs2SilKBA8EL2qLkVNrguiauNHAllzIgQ6+pWjLnAz48P8xk9ukTSyZVC2fEsfOTc1g=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by OS7PR01MB11903.jpnprd01.prod.outlook.com
 (2603:1096:604:239::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.22; Sat, 11 Nov
 2023 16:49:42 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::3a3a:7ecd:de5d:e8b8]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::3a3a:7ecd:de5d:e8b8%7]) with mapi id 15.20.6977.026; Sat, 11 Nov 2023
 16:49:41 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Marek Vasut <marek.vasut+renesas@mailbox.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
CC:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 4/4] clk: rs9: Add support for 9FGV0841
Thread-Topic: [PATCH v2 4/4] clk: rs9: Add support for 9FGV0841
Thread-Index: AQHaFLlUKVdwh4MVvUSAC/fwbAlL9LB1VHMA
Date:   Sat, 11 Nov 2023 16:49:41 +0000
Message-ID: <TYCPR01MB11269368DC4F56ED7B8F50E8F86ADA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20231111160806.32954-1-marek.vasut+renesas@mailbox.org>
 <20231111160806.32954-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20231111160806.32954-4-marek.vasut+renesas@mailbox.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|OS7PR01MB11903:EE_
x-ms-office365-filtering-correlation-id: 33b10a7b-7764-4779-4170-08dbe2d6330f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pYH1HQwZCn59gaT+0mmAWbQVgx/aI3T8k1EDTA4TP0A8m0OEpyuiD5c+jCK+MPMWy9alBkdQ5nLu55S04I5gYBVbz2V0oAQoCzJF7JyhObw7bRLaMWRswtEHQoxL6jOwVjneCxa6++ZE00Up2EIpj+lh2bvIB5F4WgsDYGYYE5vmDPn9FEnl/F9cvWCsziUCCdTsCjZWEJnHVtHr1czwpn6E/eAnzZGEmi7LILoTiVnj5hDFvw58HyoMUi+T3A4RGh/fa00DzMvysAH5qf5MFmgVsXZGN8tBbuR+6j+zYQDvDGKIj0Jn92+/aVkTQa3EyBo496qAVPlNBWHdpWAcdgoBBjtoWtWy6i1w8CbcRUVfD9+hbanbmEZSwUQdZ+UMCIZejCPCaLd3zEYuYqLjCm2WyooYw/L8ZFGgIR70HD+0TPJRMW2pH91Cn+2BgEUwcjOGh8ebUYRbNvw6wSZPhxIfn8nEGacylxXyHTLpmRH8KdBL30XcYSFwFYchVbbKlH3ULRy+FyC0XASehd6ZW88jBpwI7YMCrrGPxKt3/oBHldDmEYQ/xC0/elvdPLmMaBCbE4XFPOJtJuo5sV34Fv8cCemIyLK5IIPtVQMnrz8jkf2aD4L49Ds7rvSLgex4
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(366004)(136003)(346002)(39860400002)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(83380400001)(2906002)(71200400001)(122000001)(38070700009)(478600001)(33656002)(38100700002)(86362001)(316002)(41300700001)(64756008)(54906003)(110136005)(66446008)(66476007)(66946007)(76116006)(66556008)(8936002)(8676002)(4326008)(5660300002)(6506007)(7696005)(7416002)(55016003)(52536014)(9686003)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3eP6wJR0mAV9twdapmPXjCE363W4OUpF1NEe13+Vxu26UyFLdF6Qb/QuPI7U?=
 =?us-ascii?Q?QSxI1O0hoXRNjgQhotBnyAx5Z+4rdQj7A4uQPJLHXAn/0trIc/GKBWwph36V?=
 =?us-ascii?Q?UNkjUuWWi+tdl/eaHM2mGoGiplHA7zM6k+KJwjpSONrJ/mog9J/E1iSTcdSW?=
 =?us-ascii?Q?p+23YVtVMx9n/eVtNewFI95fDPvXDdlamu5YU7+hpgRXAEpawU4GpjY9IGX5?=
 =?us-ascii?Q?+QNRpJqY6sXlCGa4y2bri6+7Us9ETRfQ6tl6s5o25U1vB/IQndNE3+UWvBJI?=
 =?us-ascii?Q?4KE76iha0BFeD0dT9nMW94ikujSRpEVgKnKdUtIkJrVzIA9r/sCQh35hKf+8?=
 =?us-ascii?Q?OyU2wsxJOEJclYz+pWp6c2jj51r8ylt/4XhONxkzj9dYEC3Z5PONTq1z8IDY?=
 =?us-ascii?Q?yLqrgNCRAA6Dg44zO/MlOjtOpiq02EZe1ZUGG1JT2rh/UV8cOeNdQfn2wroJ?=
 =?us-ascii?Q?rY4Az34+dch3gp6++HUYom6YuOUanrQG/EAz/rxESn0XUnZA9EVReXifDCpk?=
 =?us-ascii?Q?bEUQZiSRq6ToHmdM8/wGpgoD52Dq044Ch1ekVHXnAblSurU+ZvJgF4/gurA+?=
 =?us-ascii?Q?54PIb/4+Ddd+WKHyBqSJ9sbDsEue8z2dToYwIq0TXjn8TXPwQWybob2IIhNb?=
 =?us-ascii?Q?xTN5ne2IldCr1DNm6AAoaULqZflXRMAXccEqw4NgcC2MTez38JM/qhod83fg?=
 =?us-ascii?Q?X53noI+Ls4xlO/WqaivAQAKNpQcV37QVc1OG6smZNcnqymSUyEehSwK3yWMB?=
 =?us-ascii?Q?GqoxJ+8RtxVjZchmUf/S/JiXxbPs2qjNhAj4KNEOwJoz/ECP9NmifmIwPm/F?=
 =?us-ascii?Q?WlNSjkJVE6iOtZ9fHXLtwwupovCgYxseOHUaeaVc8dcalpouqNd5/vvNeQAq?=
 =?us-ascii?Q?5/cObGTUFYkLAGSBOLRZpD31Ro7BDymnyfpmmkUFnR9z8vFJ6H8p8RF6mrMt?=
 =?us-ascii?Q?bwcjZDBFEO4JiRaDyaRD/UVf4f/7EJA82JfEZvuMhjt3vjP8vkAsI6EzSFQF?=
 =?us-ascii?Q?wBypmqbL/PXIEBH4WcF8ka5u1+jkkH8x9gwBvsFMTJAHIhUBy3L3Y6k+5a2Y?=
 =?us-ascii?Q?Y478TM8e9SWOGQHdA2kHlvsi9rm1dPk8StomCUWLyTQQCzOOPSjPhLMoTipk?=
 =?us-ascii?Q?56d8xV51GjTjxMBRdcywdyJV76MF8Wrniord4EDHPrIyVeMEj01gc9rpnjVL?=
 =?us-ascii?Q?qwzzJ8q8Q8TXxdaT9TQMt4BPRY0zNBU6fVmpgTniV17UX87HSFywLnfDct8h?=
 =?us-ascii?Q?E2ntyySWy9bETBr5Iq2EoJflGzp4raPbA63ag3b9GdgNM7qAiMGxj1xeQABT?=
 =?us-ascii?Q?IZ1e+gxAJ6nde3coe9E4Qp2lwrX7ijtOGCo1ylPnuA3W3Q4W4vOBZIOwWwzO?=
 =?us-ascii?Q?AcbcHEXHTMr0UO9vuk5bWPbxFo+BCIVOyrjyTw4JcahHvQFG76M/SZsWXQ7I?=
 =?us-ascii?Q?eMvr9bFlgfgYCMp1vGBIXhaMmyhsSmkxGs9hyycBlomKeVxZvK2ZfYKH4Jkr?=
 =?us-ascii?Q?eFMogEsoiDyOhweaf6o69Xlo5NkkVBuuMRdekZBitW8Fy9VStrVwpYZebe7g?=
 =?us-ascii?Q?Bq6hguQyheF1XKziqyG7D/0bkudrLnnNCK04vbATuei4gZkQ8tQROf7ozrF4?=
 =?us-ascii?Q?Lw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33b10a7b-7764-4779-4170-08dbe2d6330f
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2023 16:49:41.0576
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yv0MqYuTfWGokx7dQtTOzjDv2x0wiJdlfVZyOZ0nRu51eYVYSoRGDaiohf1ehSL+AeP9qIftXHGNKhD/spL3CZbVwerDX2g85n+XXrQ2ze0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11903
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Marek Vasut,

Thanks for the patch.

> Subject: [PATCH v2 4/4] clk: rs9: Add support for 9FGV0841
>=20
> This model is similar to 9FGV0441, the DIFx bits start at bit 0 again,
> except this chip has 8 outputs.
>=20
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju

> ---
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V2: Update on top of 2/4 and 3/4
> ---
>  drivers/clk/clk-renesas-pcie.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/drivers/clk/clk-renesas-pcie.c b/drivers/clk/clk-renesas-
> pcie.c index 5064016afbc3..6d494e5f8fa7 100644
> --- a/drivers/clk/clk-renesas-pcie.c
> +++ b/drivers/clk/clk-renesas-pcie.c
> @@ -7,6 +7,7 @@
>   * Currently supported:
>   *   - 9FGV0241
>   *   - 9FGV0441
> + *   - 9FGV0841
>   *
>   * Copyright (C) 2022 Marek Vasut <marex@denx.de>
>   */
> @@ -54,6 +55,7 @@
>  enum rs9_model {
>  	RENESAS_9FGV0241,
>  	RENESAS_9FGV0441,
> +	RENESAS_9FGV0841,
>  };
>=20
>  /* Structure to describe features of a particular 9-series model */ @@ -
> 391,9 +393,16 @@ static const struct rs9_chip_info renesas_9fgv0441_info =
=3D
> {
>  	.did		=3D RS9_REG_DID_TYPE_FGV | 0x04,
>  };
>=20
> +static const struct rs9_chip_info renesas_9fgv0841_info =3D {
> +	.num_clks	=3D 8,
> +	.outshift	=3D 0,
> +	.did		=3D RS9_REG_DID_TYPE_FGV | 0x08,
> +};
> +
>  static const struct i2c_device_id rs9_id[] =3D {
>  	{ "9fgv0241", .driver_data =3D
> (kernel_ulong_t)&renesas_9fgv0241_info },
>  	{ "9fgv0441", .driver_data =3D
> (kernel_ulong_t)&renesas_9fgv0441_info },
> +	{ "9fgv0841", .driver_data =3D
> (kernel_ulong_t)&renesas_9fgv0841_info },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, rs9_id);
> @@ -401,6 +410,7 @@ MODULE_DEVICE_TABLE(i2c, rs9_id);  static const struc=
t
> of_device_id clk_rs9_of_match[] =3D {
>  	{ .compatible =3D "renesas,9fgv0241", .data =3D
> &renesas_9fgv0241_info },
>  	{ .compatible =3D "renesas,9fgv0441", .data =3D
> &renesas_9fgv0441_info },
> +	{ .compatible =3D "renesas,9fgv0841", .data =3D
> &renesas_9fgv0841_info },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, clk_rs9_of_match);
> --
> 2.42.0

