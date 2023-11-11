Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9139F7E8BBE
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Nov 2023 17:51:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229464AbjKKQv3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 11 Nov 2023 11:51:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbjKKQv3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 11 Nov 2023 11:51:29 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2134.outbound.protection.outlook.com [40.107.113.134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1014258D;
        Sat, 11 Nov 2023 08:51:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JlIAnUNTHjc/4buR+uD/a+wSXVTJd0sCHJIq9T9UJwsmnJBECasNHMmxEzm6YnGc0+omb1DsxePe9KXp7hIgwdl1lyv1l7Afk3JK6foj8QNn/8SnIXLhb33FhSeMeHQZLyPOv98x/eovHxwvQRjwFjn/0neGINyHjVubXsv0HZt5I+YTevKw9Wx7yPAy8zQB6xYucv2SOsXFwdmcqc79NvPAL2qVYsLwIdJ8sK9QkdnR9ik4PGlk2LBtkkuqoIDhoyD+Ls8YJfOH6++qei5Aql3OU0IHrEAFMzYuKbAWAGrWOioI/MUnZvhNlz4y+JBmaZF8kDL2oE8G8bVc/gTcjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ppbmIP17FsZUNn6I8L8cg5kLs+dMY0OP+nxhLs/fc58=;
 b=JjuvZE4WCYlhtzZ1EIJsb/U9FXYNoC8lPBSxFsTW/+8WlE1JuHqSzXOe55S1P/8YwZ//sriZi48OSYXcKI6skorxSu/jcE0qqfNXvsUEigmBpc/JZaZGz6ScW86CKyt5FHb9rpW0nky/ZnK96EnFjN++bmAgH8YIiu2pN6dIY3hu0m3654ngslzuDYtXrvF3UlmNXSiSVn0FWPsZobKPBh9VKINiPkPrJYzjG8YYeLDRs0kLh3KC3vXBy39XIzU5UlM7kxPxJCPFDQ592ESLqhTNgaF1jAz2uhBmE5FVQCkTXkIYYpGVd75NVhgQ7TonEsO1dFU467bSt1isc6H8xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ppbmIP17FsZUNn6I8L8cg5kLs+dMY0OP+nxhLs/fc58=;
 b=fe187zwPHVK2Zt7sXl+nJXXDuT/lhMB076dwk9LZgnXG2mwAhMCBvuIDzIeajXYUViDw0z1Ncdb1O8PghfZ17jzxGCUmKwcb9cuXlYS+HkDq9+Pb5UeKedJUmgcun3nre++FGnAZdyTa9OZvp6wHS7If0+uIHrkm6FQPtiz0/CI=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by OS7PR01MB11903.jpnprd01.prod.outlook.com
 (2603:1096:604:239::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.22; Sat, 11 Nov
 2023 16:51:23 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::3a3a:7ecd:de5d:e8b8]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::3a3a:7ecd:de5d:e8b8%7]) with mapi id 15.20.6977.026; Sat, 11 Nov 2023
 16:51:23 +0000
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
Subject: RE: [PATCH v2 2/4] clk: rs9: Limit check to vendor ID in VID register
Thread-Topic: [PATCH v2 2/4] clk: rs9: Limit check to vendor ID in VID
 register
Thread-Index: AQHaFLlTZrDu9sD3bkKcGzgrM5LWY7B1VPdg
Date:   Sat, 11 Nov 2023 16:51:23 +0000
Message-ID: <TYCPR01MB11269433248DD92A216ECDF1C86ADA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20231111160806.32954-1-marek.vasut+renesas@mailbox.org>
 <20231111160806.32954-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20231111160806.32954-2-marek.vasut+renesas@mailbox.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|OS7PR01MB11903:EE_
x-ms-office365-filtering-correlation-id: c87c9f5a-683a-4abc-3be2-08dbe2d66ff9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0cN8fwIcMrJ+Tf6PbadD9I34Q4E4GVO3VsOMsJJaKyYTr2XCQTaEPFX1USLlYFD2CrHiqjZiZKjM+dGGAVseIihxV10xnL/+EKx+O9U0WwBN4+R563W+ZN9tMcfag8hdHuXDMp1iKsDEBJbpyG5F9WGWGGjgmg0WNv72B4u5mZisVEov1vGSugzD4oBoaJ8gSiRBDynp09A26/Zl9wAqvmySO9Fmcfh5/if+tmZR8/S72O31QN1bBR+33nJiVE5zHZ9cxXiJhybyHS9YnBzDx+dDTBMqZuzShxtfgGsrcDh3HTHOj9mG+URBJc+N9pD6cG6HSqn8gYH+IOzJiz/3tQsseQdJC4lmcKonu2RfA4YGewv8y0JYHTVESscJqgOy4bHStWow7M0wn/6Y+eLafvdwNteuXiRELXWvERFy/zWe/G9jMj8ZIWl3W/s3UWg3WHSZMVLtTCe90WPloZdnsTWRX5RFVyR4kYWdDlyiCFDq8JNpdMq/B6Orv25SS/Ny03aJjtPJTVZYtBZboPzuArreZDGGtfmtGPpHmYkcO3HYSTpXsxgGGHeHaiGfrLEQZABnySIdTeDyKApYykvaSnIl45oYLkyyCbfq/EDXEIf4WzFRVxZeXWl+u8YvF1Ae
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(366004)(136003)(346002)(39860400002)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(83380400001)(2906002)(71200400001)(122000001)(38070700009)(478600001)(33656002)(38100700002)(86362001)(316002)(41300700001)(64756008)(54906003)(110136005)(66446008)(66476007)(66946007)(76116006)(66556008)(8936002)(8676002)(4326008)(5660300002)(6506007)(7696005)(7416002)(55016003)(52536014)(9686003)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?G1bInNjSY1/9RUh2vMw4WnxsIqhKiqtAJAKcUv25lZjKeYwQJskimn3SS9oM?=
 =?us-ascii?Q?9IPmyuosy7xHeb4vNq3ROIkMaUv4s+Zjc/Q1u9TsU09Xqo1cQ9VxCvAGZRee?=
 =?us-ascii?Q?IzBF9AtG7YYAtswsezTxixmhA1BMa1KOdF2ZI/yTDsct7N/zUSazpJCRvaoA?=
 =?us-ascii?Q?6GKv0Y0B98rsRI2ATOZT3HjQ5Lw97t5C6I07SwqHwfTZCM7+elpBe0WAKiF2?=
 =?us-ascii?Q?gLmJLVGSxR8AgQMo1SYh8gDdHEvYtb/8a2QUQOIoD3MhOBEd713kI4LAq8dC?=
 =?us-ascii?Q?Zv+5wMeK6Iti0ew5SDHr9GCnQqJNDOhuh/r4XtdIl5hgvJ/L1qwnKFIf7I6g?=
 =?us-ascii?Q?KQXLnhRLYspeO9Ah5CHl1VaKgvhekgI2QYVmnjRU7uxFtmS/sNLxrUg6j3UT?=
 =?us-ascii?Q?jy1tvXWyo+vbtRAzoYr8WJTXvn7G3CqCnyjELEV/NF5YFyScqNFdoNR3ECGi?=
 =?us-ascii?Q?qBoMebHa07ykdq/aT74cf7/Fs/EgXrfNYqmeCMzLbgOWS8BuTklyWv//tuva?=
 =?us-ascii?Q?6Huczc+1/GtKE5gQMxqnDUhn1jqpCvCZa3wJs/UNYBZKgTVWHsMXmBJRpfFI?=
 =?us-ascii?Q?97JO2n6ZSe10OoZEz6bOpLFXCRqJ216jOJGRwtQAHidf2wcbVNe6FOPGELQD?=
 =?us-ascii?Q?3QlJPRgZKC7mn8LOwgINq+4jm9UhPIg62lfsFL1admF391qiAfjAtm98p0Ca?=
 =?us-ascii?Q?k74XXgkkgP+ivjV145p2jPAOWT4V+Jon1r+bdvIuv9ZKTYTqDWV6t4qvkqZa?=
 =?us-ascii?Q?gcPOHJZNWehi46MKEg+PUkwDbAQPIQjb/3KnTkaz2Y3g1nzdiWkUdW3jyal2?=
 =?us-ascii?Q?24+U9Hsi11dsnMdgZx2pwkvrmrt9JDaSXxRH1r6RdREbY+pHNMwpGqX+XBfm?=
 =?us-ascii?Q?J0mfsMZchHwyrw6sH0BdCRQAG0FrkBnrHATm8W1vlMRxR8cdkUmoswOOujoE?=
 =?us-ascii?Q?nHxD52j2NRI1wqkoktrxfoIOgyryVFX7vbFych6M7rOFpw4ZZk+S7Ga9Ubx3?=
 =?us-ascii?Q?gYL6CQzosvQCEqWXkMaLram5BjgQ6X/arY9kaFF14KUG8DRsuGq4lXD703C+?=
 =?us-ascii?Q?lwtwBh94EjdwV5ft4eXmGmBFm0ucHHo8LMVWrP0bGFYxoNC7ypRtHSaeY6vZ?=
 =?us-ascii?Q?xHDsqCNnr9OLzuuCZNtoG0qUrRAqkt5dHcJCN4FZhbio0QwHYTiSNfrrICf1?=
 =?us-ascii?Q?e/QrCcdQ4Bwal9L4s8E9jczl99DoqUjh7hrkT9gkfESdv1F8X9cDyG+YPoiy?=
 =?us-ascii?Q?1m5qR/NyuFg95hDAJRlcvmSp1doU1Sw8yP4LzzkUeHrhLk2WxZwQac0sNo6y?=
 =?us-ascii?Q?Fnmfxi7fwHjoqio3MexeF2AwP7WEjjL0tNjn1aLyjhqawMO6Z3OX1si5syvs?=
 =?us-ascii?Q?mK2+FDVITzp9wuZ82o5CefEjyHh7HqGSX4cX5T+1gX/CfiA8LL2CZc84fBVQ?=
 =?us-ascii?Q?jhY2JS8w4DMciz1nGxOVabr3IkpBYiz0jow1mbpuL7L9Ix69PVNoRQiXrtEQ?=
 =?us-ascii?Q?8yl74J+9qPt27eUdRPRRTm9QNWXwJIxalwGPkEp8uKNSv5S+YOh5vSX5jeo0?=
 =?us-ascii?Q?ll1AanWyEhzCY2DIiSVgOk5N5XfvKb88BQfZop+vhpEkRGW8XmZ5cd9T2zUu?=
 =?us-ascii?Q?fA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c87c9f5a-683a-4abc-3be2-08dbe2d66ff9
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2023 16:51:23.2440
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 98iUs6yierRgUW3A11ptga7FZJRFGWvMwbVzr4ECiDhheTid9ywC9vbDJSCann09AX6Ag46+SgeXs2DLN9AXfaR3kZLyUtfuKRn6z5AiyxI=
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

> Subject: [PATCH v2 2/4] clk: rs9: Limit check to vendor ID in VID registe=
r
>=20
> Extract only vendor ID from VID register, the top 4 bits are revision ID
> which are not useful for the vendor ID check.
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
> V2: Split off patch from 4/4
> ---
>  drivers/clk/clk-renesas-pcie.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/clk/clk-renesas-pcie.c b/drivers/clk/clk-renesas-
> pcie.c index 6606aba253c5..b5c430e4899c 100644
> --- a/drivers/clk/clk-renesas-pcie.c
> +++ b/drivers/clk/clk-renesas-pcie.c
> @@ -42,6 +42,7 @@
>  #define RS9_REG_DID				0x6
>  #define RS9_REG_BCP				0x7
>=20
> +#define RS9_REG_VID_MASK			GENMASK(3, 0)
>  #define RS9_REG_VID_IDT				0x01
>=20
>  #define RS9_REG_DID_TYPE_FGV			(0x0 << RS9_REG_DID_TYPE_SHIFT)
> @@ -333,6 +334,7 @@ static int rs9_probe(struct i2c_client *client)
>  	if (ret < 0)
>  		return ret;
>=20
> +	vid &=3D RS9_REG_VID_MASK;
>  	if (vid !=3D RS9_REG_VID_IDT || did !=3D rs9->chip_info->did)
>  		return dev_err_probe(&client->dev, -ENODEV,
>  				     "Incorrect VID/DID: %#02x, %#02x.
> Expected %#02x, %#02x\n",
> --
> 2.42.0

