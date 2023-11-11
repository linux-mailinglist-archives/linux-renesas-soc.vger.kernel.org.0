Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EFC87E8B88
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Nov 2023 17:14:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231301AbjKKQOb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 11 Nov 2023 11:14:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229797AbjKKQOa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 11 Nov 2023 11:14:30 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2139.outbound.protection.outlook.com [40.107.114.139])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC951EA;
        Sat, 11 Nov 2023 08:14:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aFHDVuNqbGEWfrtPKy/qcUilYpyCHy16TcBfOQqUkUhXGFVRlt9X64W9bwIy5lgdgNoXXXbm0DkbM11YuWWmbBLZnif4ofAx/4TpQpTn/e9BMnJLv3uaR2g7baXhhY0QiDvlOx3t+cZ/rf0i2X/RArjloi4bxdZlBc20OEe4eLffDHiUIPvodhtU09IE54ZKiJ3LVWa6IncYU6HgFeFqhDKzVMZp2mbkO+1zwNYNSlSHrByFMZtU+cUoyOs6I+uSTURyqva7vVSWreLN4UjygNvCwjIKH7Z5WZrVTVinv38wp8+KGhaBSV3Z9WsTmGCx2DZW6oJcFoT9WJuu71vMYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UTCIlIP9yZFyROgheIr/HqdR5L8U7pU4hPJ7rwvw6iQ=;
 b=SBdVej/GT7ZiJfKoBMoEogx8ltj2sUxgFoU/juMWGj4aexTn0ofEU455ORqAde1ywHNXKHFx73DJZrsE6QI/1Odb04lehZZcIyTyJW2JPG6wm1ISBSTJ8Y7P7sv7xwBnLnefxxVzKy+8LOfULYnrN2glxV599xblBw7vMkOlvt7+tVERgIN4zvcseAKUHEHsMIgshk6vVqY14caVkaMTI0SCArqDRlgyrD1C9uy2Z5/944Ahnv95TkOK3Tu4pDeRTxRYhaKwXM8BQC315bnNUczPq00HkKbqDSVy0O9/xo9HaWTGm1DxBFswcJhnc8IpiBba41H59BwI7xRZp8epPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UTCIlIP9yZFyROgheIr/HqdR5L8U7pU4hPJ7rwvw6iQ=;
 b=q1ymbqtT2LnvUexgLA6JXfYiKpuu+DqiDSWYkDmdBK6gkVLlI2F2WXolL40qSerzvlZZ+oaL/WiQYDIgT2l/YZqFDyrbX1JgK+elALKTdl+tsGn4XOP/bL0TCQRlhcBAgdKD284FvWZ/F3zdvEnO0x/VoNLhWjedMbZ1tfR/GWY=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYVPR01MB10749.jpnprd01.prod.outlook.com
 (2603:1096:400:2ae::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.26; Sat, 11 Nov
 2023 16:14:21 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::3a3a:7ecd:de5d:e8b8]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::3a3a:7ecd:de5d:e8b8%7]) with mapi id 15.20.6977.026; Sat, 11 Nov 2023
 16:14:19 +0000
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
Subject: RE: [PATCH v2 3/4] clk: rs9: Replace model check with bitshift from
 chip data
Thread-Topic: [PATCH v2 3/4] clk: rs9: Replace model check with bitshift from
 chip data
Thread-Index: AQHaFLlT/yVwlGcvPEOHgwNYx8CJW7B1SYSA
Date:   Sat, 11 Nov 2023 16:14:19 +0000
Message-ID: <TYCPR01MB1126976075211411D9A3CDE4286ADA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20231111160806.32954-1-marek.vasut+renesas@mailbox.org>
 <20231111160806.32954-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20231111160806.32954-3-marek.vasut+renesas@mailbox.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYVPR01MB10749:EE_
x-ms-office365-filtering-correlation-id: 8e7da948-3c61-437a-4c9a-08dbe2d14260
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vOMSKcXwk7i2XcvTQdvhD5zDADwkdHfMRF0rprPC6UbGa6z381yt/hSzL8PXQY17VtnxWllqeCOd5bE95Ptli3kLN/J6gmcjjoJDkaXypEgjgn0co0qMJBdutEt8EzNvGwTLmxCU/a3KD2HdkaDr5Uc1Ba4gh8jM+J5LAO/llq532hbOTFWQ+UJ8mw3SzgjcJEMfUQ+z+u7h1snwDqSbXPHJBX1rhuMDe9PF369691KdDFcHEDbXdrD5cLo0PdpPUxR2iYvBYaemf+Nb0899byhR2Z9XuliSPX3ZBaUiGo8E+jYZ9UHr8xymHg5vMG1R0rrecR8A7nmCxgMEEMT3Lsli34QHlKJTN5g2uKcf57QSAVD8zbWzbEX6nHxG4IhmUEk6jHgNBNWST9v8fUpRF4FILQPoJAw6iLjCD9hLAt/0EnyxGlI9cPyfnKkN9mX/9Tu6wOA7BHchxG2oni9SvAQq7XEMJcJOQP9q/NNk88BW9E8lJaEjVwOvz2pGreFHoADbh/1BiWRWLPg9NU/8aOVeM3Nzi9O1GlE90Br76GZzK1pbBg3WEM6VppKjheJnnP3Qs5ihGce8NAl7KsPEdQNSd7NPRcnNzAPJ4OLG9uc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(346002)(39860400002)(376002)(136003)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(4326008)(8676002)(8936002)(52536014)(316002)(66946007)(76116006)(66556008)(66476007)(66446008)(54906003)(64756008)(110136005)(2906002)(33656002)(41300700001)(86362001)(5660300002)(7416002)(83380400001)(55016003)(38070700009)(122000001)(26005)(38100700002)(478600001)(71200400001)(9686003)(7696005)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6hhprChzcl4K4FDfnvLyDGExJUtzhTZcTiTYUf1CljrYSiIoj84pIxMJkUYS?=
 =?us-ascii?Q?QqqMoljvVrqg0LtLX5H0vdpDcamrKEcwwfoN4Q6xjP8NTjGysDF0szOFJZTq?=
 =?us-ascii?Q?iMmOO/rtctJdk8pDJ64a4MAuGTj8g9sGGLSkePOIAEHBNHMyKQRHMICsIe9A?=
 =?us-ascii?Q?dbv2VRKTKPxsdSxc/EHsnv0NizXdzIoyI/oLEYFGzinFi43aLptyFlhshWNC?=
 =?us-ascii?Q?Y1CZy2AZYuXot+OtE+cvL5UCMYjIwrp++Udm1bMLh+uf8EN+4ttn49GPqHzO?=
 =?us-ascii?Q?dWvQvykXOs+mPy9ZJ/w7Mw6wVQfYQQQWWhOgNyjG59lpzTNSHnNBlwUo3JwR?=
 =?us-ascii?Q?DQzhIweyIjt48eaUMdyeC/OpWHdNY2gnc6ZUVPXbCnDpUYEKlksQKBDYS1vz?=
 =?us-ascii?Q?BiGiEy0sAdECVZsWQNHiGivz0vhpf+D1bFLT25YUxVLmZXUBXqADAdwqgZk1?=
 =?us-ascii?Q?Xk2NKDGThLV1TYoDwpRpAeUOD0elTZ/q/5x/kwLXH2tGRcCJY2MZDMJLiBHm?=
 =?us-ascii?Q?aK1Oxve9fs6Wn++cpfRBqni64teNdQv+Ss8G9+XgRd5ZP/CyeIWPdOniNfmi?=
 =?us-ascii?Q?EQXgtT/tJHcAsjOE8vXLIeSQ2xIf3beVoyZFEe1e3wFpySMM4ImTogfVUQRa?=
 =?us-ascii?Q?kAP3BlZfj9frxrxFD7aybObdrvgXj0BwF0cEwxdBvKDk9tn+/Y2FfJOZMb7C?=
 =?us-ascii?Q?1UT00X6ntOQbkWj/xqC4jzsuJsshNpmtTvSW8j6nsDXZD3cpT2eDxf6Kno4+?=
 =?us-ascii?Q?QZUg6CylxQpWIDRiIK+loF8hgn5xB1isjJw0X9DUr4+zdCh+6+fgGwD9CaB1?=
 =?us-ascii?Q?npa641xwt2lH41VCxP771ucUFRcG3raw1U6U3lBmzpoFGiUR7qRHzhwNhmAb?=
 =?us-ascii?Q?J/E9Zqys82U0UHpgAHzaOYYUTNAlVlkKHVe2zeaK0hSoU1+Xxzde5oHyIt4f?=
 =?us-ascii?Q?ka9GIr+Dnt0DsHhHfauxTF79uJ30Isk9tbh4Di5Y2LzrR8dLumc5tY8RpCZ6?=
 =?us-ascii?Q?eTDLK0SGDsBNMz/7maP8+WcWiNRKEnyTz3KueoZEzu/qn+cNGFlAW/YDZblh?=
 =?us-ascii?Q?Oyy6RBEYog7kTFjYnX76Npvrk4fw720e1bV5FCVOGnefCKLA+NfDCCjWP1PM?=
 =?us-ascii?Q?fnJUjcQM7Txqq43Q6+iZJ2THxT4CCWprckyMjcNyz4446P/fzR/JiN/+mLfg?=
 =?us-ascii?Q?pA+Hwdz9Gp7bzJLzF6OUwsD3OViBjp1I1VGrQyhqP9qecv6ehW8k5QZntWA5?=
 =?us-ascii?Q?hMiKmp2PUVYhfTeLk6ROgbhOKXNzsEc6OOtMKI6CR1/QLY1zczCMJD4OLm0w?=
 =?us-ascii?Q?lI6m122piDH+gs23qkCjqlozQMLuC3PFdc2YPJbePIzoQlbZlrTSW48zPyj8?=
 =?us-ascii?Q?woqMo0zTWhdkee3OfMoFhn+/NT/4Fc4gJBrvnpwA6az2P9PFPfAVkLD1kMNm?=
 =?us-ascii?Q?L4uhL1r6E/pJ75VKN7Rppsa3KImXmVQ+lzjXkRQgYDF1x3m3w5HYzYKn/CFX?=
 =?us-ascii?Q?17po2GuanjUsC+OQxHNmTT4zSpHsYLY/G5pujn8wC7LOaU0IbMpxXrR21epW?=
 =?us-ascii?Q?7yl8SCo3FpE/k/kJJymou7TH7zz48adCh2AGtKKd8W4dqgrOyLYurQ5SvnK8?=
 =?us-ascii?Q?+g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e7da948-3c61-437a-4c9a-08dbe2d14260
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2023 16:14:19.2340
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 77BAFfEVSzWclkTZtOMMD0NgthjYDAa5ablPmOyJWMIowPEo2U5RiXoIfsRxbvRn4OxQqG48HZKEKipJ4UFd8oXkeh+DBdRGGsDmddLZmEQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB10749
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

> Subject: [PATCH v2 3/4] clk: rs9: Replace model check with bitshift from
> chip data
>=20
> Adjust rs9_calc_dif() to special-case the 9FGV0241 where DIFx bits start
> at 1, encode this shift into chip data and drop the model check entirely.
>=20
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
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
> V2: New patch

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Do you need enum rs9_model as it is unused after this patch??

Cheers,
Biju

> ---
>  drivers/clk/clk-renesas-pcie.c | 20 +++++++++-----------
>  1 file changed, 9 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/clk/clk-renesas-pcie.c b/drivers/clk/clk-renesas-
> pcie.c index b5c430e4899c..5064016afbc3 100644
> --- a/drivers/clk/clk-renesas-pcie.c
> +++ b/drivers/clk/clk-renesas-pcie.c
> @@ -58,8 +58,8 @@ enum rs9_model {
>=20
>  /* Structure to describe features of a particular 9-series model */
> struct rs9_chip_info {
> -	const enum rs9_model	model;
>  	unsigned int		num_clks;
> +	u8			outshift;
>  	u8			did;
>  };
>=20
> @@ -161,14 +161,12 @@ static const struct regmap_config rs9_regmap_config
> =3D {
>=20
>  static u8 rs9_calc_dif(const struct rs9_driver_data *rs9, int idx)  {
> -	enum rs9_model model =3D rs9->chip_info->model;
> -
> -	if (model =3D=3D RENESAS_9FGV0241)
> -		return BIT(idx + 1);
> -	else if (model =3D=3D RENESAS_9FGV0441)
> -		return BIT(idx);
> -
> -	return 0;
> +	/*
> +	 * On 9FGV0241, the DIF OE0 is BIT(1) and DIF OE(1) is BIT(2),
> +	 * on 9FGV0441 and 9FGV0841 the DIF OE0 is BIT(0) and so on.
> +	 * Increment the index in the 9FGV0241 special case here.
> +	 */
> +	return BIT(idx + rs9->chip_info->outshift);
>  }
>=20
>  static int rs9_get_output_config(struct rs9_driver_data *rs9, int idx) @=
@
> -382,14 +380,14 @@ static int __maybe_unused rs9_resume(struct device
> *dev)  }
>=20
>  static const struct rs9_chip_info renesas_9fgv0241_info =3D {
> -	.model		=3D RENESAS_9FGV0241,
>  	.num_clks	=3D 2,
> +	.outshift	=3D 1,
>  	.did		=3D RS9_REG_DID_TYPE_FGV | 0x02,
>  };
>=20
>  static const struct rs9_chip_info renesas_9fgv0441_info =3D {
> -	.model		=3D RENESAS_9FGV0441,
>  	.num_clks	=3D 4,
> +	.outshift	=3D 0,
>  	.did		=3D RS9_REG_DID_TYPE_FGV | 0x04,
>  };
>=20
> --
> 2.42.0

