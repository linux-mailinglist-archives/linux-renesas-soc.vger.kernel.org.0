Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 225E27E1B7B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Nov 2023 08:49:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230497AbjKFHtV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Nov 2023 02:49:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229803AbjKFHtV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Nov 2023 02:49:21 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2098.outbound.protection.outlook.com [40.107.113.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B22793;
        Sun,  5 Nov 2023 23:49:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mU+UGKtNYcJiO0lUz3Nz08wmLj2TmUno7ErudDB1Z8NpnljSgFYGdG78kEOVcGZ3ra+aps+BHm3tIzDJBBsXzUELNmONL5qnqu/3J7syBwiHNPGdSCyAYy1izVS0HEJ1BVTbm6IzX3p0yp/DQN6fH8TNc9e6yYSGRKzaSOe957jvgvgte3f3Srj8pSf/PSykJ/pXMVow8S7TcTEi6iNAQIdvRKqCelMt6IVA1nDKzNANbsqJ+Eit1yQR9K7d71UK/qDSW1dMNpUlC1U6TV6QMRdDvdnUrJZy/61A49ZcWHBbsNffP91ctcKBdqQgO5B/Ev6kNHQslcWhwbnx2l/GOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w9GNY3xpASn9YZH3cwLZzXC6Sk3x+6ETsCghEJoX0xo=;
 b=gfdSXr1wRi9Zc109URND11r4b0uJRyT84B17VpOPvnfNST5ykjiFftVvYlG3A2+dgKBOYYkA02Zxyhz5BsLHQQzM94XEVI8TkvRRWhKZ2qaFppmgcY3RKadhsy+QfRV7vnnd+GTTzVzVQId2GI3YHetUoC8XsRcZUhkRFFswF0qlVEyB7rYHAKmxlMiLfAlpZHRDdSEWhafduG/fuPXOhSDYyCTT8uk08fmTdUR1wyTFsjmkb/7OOTHiXEA3EeKcAgnJciQQ9b9o/t7eCjP1+ykvnDTAS541p5iCtQsZR4mhPSZroxAScjxxjoVlUYtQL4PkEbK95hHrfKm8mdBAbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w9GNY3xpASn9YZH3cwLZzXC6Sk3x+6ETsCghEJoX0xo=;
 b=wWWhDr3giKjhjrBkuBUdALJm2TsGttVdlNskt8z8N7kt1W0piobSdR/+MrQYwlAhm+3W88oHLWN9PJsPJt1bH0icWeYn+Yjf79BmfUZuBtdiHTwqooA7MX7QuYg5zEOH3RDED41EMINIyxShcy8gOdS6LXJ8lBt9Hqudhpr6lQg=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYWPR01MB11466.jpnprd01.prod.outlook.com
 (2603:1096:400:400::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.27; Mon, 6 Nov
 2023 07:49:13 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6cb:4ed9:b0be:36c0]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6cb:4ed9:b0be:36c0%7]) with mapi id 15.20.6954.027; Mon, 6 Nov 2023
 07:49:11 +0000
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
Subject: RE: [PATCH 2/2] clk: rs9: Add support for 9FGV0841
Thread-Topic: [PATCH 2/2] clk: rs9: Add support for 9FGV0841
Thread-Index: AQHaECPdPQT6l/fGpkiP28IxJEXawbBs6czw
Date:   Mon, 6 Nov 2023 07:49:10 +0000
Message-ID: <TYCPR01MB11269765042382E404A16FAB986AAA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20231105200812.62849-1-marek.vasut+renesas@mailbox.org>
 <20231105200812.62849-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20231105200812.62849-2-marek.vasut+renesas@mailbox.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYWPR01MB11466:EE_
x-ms-office365-filtering-correlation-id: c581574b-8b00-4490-753a-08dbde9cdd30
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pky8PWc8HVfWjrMWpJGt6iPA3/VWDFJ/k9R7Mp40TIkYOhMvzaWd4BxWNnavg09u0gEcBoCX3u4Dw2fbp9bIusIUINQ8KqW7EGl6YkdIlvyidLaLjDU1yw8Gtxn5rIPkKJu2wzKWmFcB+4mi2Kz22M+kYJBa9T5u9Oq7+lS/lBDzCJor+eGkidd8TUi/bqm0oHqnCb7gk6n/T2RVMUgaG+WErESwPdIf9BjJ2gnrUbYSgEqLt2vz5qQDklToqBJcuTpCEPlzGcr/LoRPhUI6HSPqXn21YFw77G4e5i9qfGdkEG3//w9uqfiDUdkPiN4Uuxj+n2h+cO2nSRB573EOgA4Y3wn7P4qTwboeDXRMzfANe+ZBvw8CVSGZQCem1kEAsjdur/JaKXMzdZIhqVUIIlUy6P55JbKe9daaawnn3+gLHLvzcBrOY0/EwC7ZL5vEL1B6/GqMqaTQM+x9SjihxiM2MAWe22Kbgsf8CxsfCTRbwgwlfCkQMHV3ZwspPIedkFbPyQUtKKVKIB2Ral46AQzQyOyztN6ShYtsN98g7benTwFFQ6EY5PNF7DQRVPZzJL3iUDc3IiXf9ZvbtHTM+bJQc5jAieo76twIlAy6n+Evwzr5b9QC/E/F6yObw6aY
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(39860400002)(136003)(396003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(8676002)(4326008)(316002)(41300700001)(8936002)(2906002)(38100700002)(5660300002)(55016003)(53546011)(66476007)(9686003)(33656002)(66446008)(54906003)(64756008)(86362001)(7416002)(52536014)(66556008)(76116006)(66946007)(83380400001)(26005)(38070700009)(122000001)(110136005)(71200400001)(6506007)(478600001)(7696005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vYCKPZZFlruhn6/rCsExWAnxJmAN35uyprNoCj+cK85B2yDIiN5n6bQrwz3F?=
 =?us-ascii?Q?gi5BWVKLK3KbhfkJNfGWt69luQ/SHVHOOT9YPHBkVKU70YUj3LuR/GHoEuq3?=
 =?us-ascii?Q?48CJcnFuuxbWuDnPLOiEoZMk0F9TgLlhy1O65IGADDDfEbWVUKRGILVfXkal?=
 =?us-ascii?Q?dhw/Uko0CF3/fQ8g9Vfme3u+3hC+KvwPMNf9cM6xN3O40vmVqm+QwKbAKi99?=
 =?us-ascii?Q?ZYg5vOJsihWmuQAj0+xNOP4GBGpf5thqz9a04KfCWX8ZrPEHzdE7gJ0gPvd+?=
 =?us-ascii?Q?MqI5RYdsQFgDsPbWcSTFTSOE6jVHFulJhNNME8krLizUQ/CZz4vZgJOWXeUE?=
 =?us-ascii?Q?zQ1NCOqUd+0bgBtLfM7aY8Cq2w5dOJrJmokh5sMHN58z4DUGBPUaxFl0kqXv?=
 =?us-ascii?Q?hhrRl9QgQFe/l/L2bpJRpzRqkw3gnjVO3vD5kAJ8Hd9IKib7h8CdWV7mSQnF?=
 =?us-ascii?Q?efxibKTlEbn9CSxqH7BKJaBp70+wTMpRrwV2OKWSnFkFUgHAj6P5jLQax/eQ?=
 =?us-ascii?Q?ny4Gm51LCzx/qj1ormE2x2gFKzvpAZPIIJRI7cITZjYIpzpI7+7EUVgcf8pW?=
 =?us-ascii?Q?ZxlS8qwkF9nTPHJ8Lsnc0ZgsmPO6z6Z2Zv+aBZyxGF5lb4E40WXpkLJMLJ9U?=
 =?us-ascii?Q?t9cHf2ntbNY5n4H8KocXAbYE7xkw5YLuyixN52h0VdrZgKg2+3L5jhzkTyM+?=
 =?us-ascii?Q?oXJ4NgMAAN8jK66e5IAKPVQfaieRnVHc64LK+Pg3EQWfpuOdGbMFjO1zt2Lb?=
 =?us-ascii?Q?FHsEhjsgV94wy8yvJ4Y8xfYH6Pw/maBL2tLu5bRBKlmFAAVbPqWzF0aKtzbF?=
 =?us-ascii?Q?O66ckGT4GMhWoIuV2EV5rnbHrYta2t17RRWCZSP9pBYwnxxX5JCpur3nYhR9?=
 =?us-ascii?Q?NgyhIr77Cjp4dSJv8190bN5vjzJssIeofLjb2CZl/M3IF+fxA55fzfL/FoM+?=
 =?us-ascii?Q?GgqU1UO4KeYZYo9seSjNgEmdGDTBbMiO0/+dLn0h6Mt+NW7dS4+0RVnGk0ve?=
 =?us-ascii?Q?vJTrbTqijvUmRWa1FMaPBrrACpb1Ov4j2wSC2jC+eETa1dv1TrgyhJDBRh1O?=
 =?us-ascii?Q?sLoBiIWQP74cY0rFW9iLNoNXYP2qmoq1khwbn3F1x6E+ZZ+dVYVVf7+8ID3u?=
 =?us-ascii?Q?Vhj+4iNMhXXp3RstpbgHuUhJtsyrA7fNj273bEz1XJaUKVJjW+cbXhc6YtMs?=
 =?us-ascii?Q?7HyDelPzqVHI1WXUq9hMOP+nARZ4vLLbNpCFB8jHT+PtJ2H1fVqfPDF7mG6O?=
 =?us-ascii?Q?ozUd2PVA7/P61czrcToIh5b+PNHCt1rxfgdGHmREIdSP/bw1lCGuZpol2Gx2?=
 =?us-ascii?Q?biqqqB4CWAkP1EEqF60YmlUImJhwnVIXIGpdfbroMelj8CJ+q8sduhVVSd7y?=
 =?us-ascii?Q?GYyqHOCkq8OzYmmKnSR4TT2gkCf5RMd6YagwthaKB3iKqRtYK7nZj3BqqvKL?=
 =?us-ascii?Q?2xBZFI2J1KkN8k3tXlcKC2D8HC0PegwQpfMtM3bOmRz8EbyHWVDsAiHIo2nm?=
 =?us-ascii?Q?qaurVRIE+roctFhcorEME1pIxbgkRhuptIkcRWlo5sL6Am6Y0lUNuWZ73/nG?=
 =?us-ascii?Q?LEGWBM4LunKiOMsxbIdIay9hLLb2hh6AJ5IwwmqP7O9v/G9CvtXeN8W+KrHX?=
 =?us-ascii?Q?Gw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c581574b-8b00-4490-753a-08dbde9cdd30
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2023 07:49:11.0248
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wpP4wM8M7HWjNWp5HIHgFsw+X73gBezasbu9j6CrbH61lktHr+JN367Lr2G0m7B3yyOqgsTHd2LtABMpaf3zbpJCdczYtX+lwSlo6HOA+IA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11466
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Marek,

Thanks for the patch.

> -----Original Message-----
> From: Marek Vasut <marek.vasut+renesas@mailbox.org>
> Sent: Sunday, November 5, 2023 8:08 PM
> Subject: [PATCH 2/2] clk: rs9: Add support for 9FGV0841
>=20
> This model is similar to 9FGV0441, the DIFx bits start at bit 0 again,
> except this chip has 8 outputs. Adjust rs9_calc_dif() to special-case the
> 9FGV0241 where DIFx bits start at 1. Extract only vendor ID from VID
> register, the top 4 bits are revision ID which are not useful for the
> vendor ID check.
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
>  drivers/clk/clk-renesas-pcie.c | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/clk/clk-renesas-pcie.c b/drivers/clk/clk-renesas-
> pcie.c index 6606aba253c5..f8dd79b18d5a 100644
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
> @@ -42,6 +43,7 @@
>  #define RS9_REG_DID				0x6
>  #define RS9_REG_BCP				0x7
>=20
> +#define RS9_REG_VID_MASK			GENMASK(3, 0)
>  #define RS9_REG_VID_IDT				0x01
>=20
>  #define RS9_REG_DID_TYPE_FGV			(0x0 << RS9_REG_DID_TYPE_SHIFT)
> @@ -53,6 +55,7 @@
>  enum rs9_model {
>  	RENESAS_9FGV0241,
>  	RENESAS_9FGV0441,
> +	RENESAS_9FGV0841,
>  };
>=20
>  /* Structure to describe features of a particular 9-series model */ @@ -
> 162,12 +165,15 @@ static u8 rs9_calc_dif(const struct rs9_driver_data
> *rs9, int idx)  {
>  	enum rs9_model model =3D rs9->chip_info->model;
>=20
> +	/*
> +	 * On 9FGV0241, the DIF OE0 is BIT(1) and DIF OE(1) is BIT(2),
> +	 * on 9FGV0441 and 9FGV0841 the DIF OE0 is BIT(0) and so on.
> +	 * Increment the index in the 9FGV0241 special case here.
> +	 */

I guess model enum variable in struct rs9_chip_info can be replaced with a
variable for the above hardware differences(eg: BIT(idx) value in struct rs=
9_chip_inf) .
Then you don't need this function at all.

Cheers,
Biju


>  	if (model =3D=3D RENESAS_9FGV0241)
> -		return BIT(idx + 1);
> -	else if (model =3D=3D RENESAS_9FGV0441)
> -		return BIT(idx);
> +		idx++;
>=20
> -	return 0;
> +	return BIT(idx);
>  }
>=20
>  static int rs9_get_output_config(struct rs9_driver_data *rs9, int idx) @=
@
> -333,6 +339,7 @@ static int rs9_probe(struct i2c_client *client)
>  	if (ret < 0)
>  		return ret;
>=20
> +	vid &=3D RS9_REG_VID_MASK;
>  	if (vid !=3D RS9_REG_VID_IDT || did !=3D rs9->chip_info->did)
>  		return dev_err_probe(&client->dev, -ENODEV,
>  				     "Incorrect VID/DID: %#02x, %#02x.
> Expected %#02x, %#02x\n", @@ -391,9 +398,16 @@ static const struct
> rs9_chip_info renesas_9fgv0441_info =3D {
>  	.did		=3D RS9_REG_DID_TYPE_FGV | 0x04,
>  };
>=20
> +static const struct rs9_chip_info renesas_9fgv0841_info =3D {
> +	.model		=3D RENESAS_9FGV0841,
> +	.num_clks	=3D 8,
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
> @@ -401,6 +415,7 @@ MODULE_DEVICE_TABLE(i2c, rs9_id);  static const struc=
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

