Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC9BD52C180
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 May 2022 19:50:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241208AbiERRpz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 May 2022 13:45:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241174AbiERRpy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 May 2022 13:45:54 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2108.outbound.protection.outlook.com [40.107.113.108])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54CCD3B003;
        Wed, 18 May 2022 10:45:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iHBXIkrTIDBLKYso9/yai0+uZs1Osdc981X71v6POTiklvGntjNIcxUJiaMx6/8d/XR0MSQeIzWv1fQhHzskTj1WSwR2jhoAEcMciYiscchPB+cAAVgjUma+KEYC8izpAKgBGiW1QL2tRQ/E91Xb+tXc/kAxaKI7aGic8zMwMPwU7duYZtSVjerZvvMjNIz+798syggy/6I0Mywr0UqpFoWEXP9WOjN9mSmUYly8gRhhc/oKfcI0mdkzWxdBxsBlkarqyfDFOPm1GOOUC2CMShOCNYhNyNLwZLA+zAdgrMaZeXxMlvzGuwScwbbM/dKoDYwqgPwv7zBwA5eCXYPscA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w+F7b0RficfQAnQro9N08YEMXkyefyGTJk8Xu0QkVUI=;
 b=F67YZ7LSHmG5jyOLdgh1CPCRCpuK6pALkBBdl18cRxu8uFTdPcbw98mPde0WCchsDQIX65EhxNbVaCr/L5v2EOojXDy+NW1LaGpPPHvDQhR092vUhpkHWWVta4BMTTYv11j0VF59Z5b6BxhNUHUhFgxsylij2G/CqTl+MQA57wRTT+mYHspADiiPTbPwO5ZzgqK88tmHk98mq/o7VFJA1CCJSXySLFl+tWUYLGthe/wobsG8YjZttwe0rxvx4aYtmZ87+ePfDXvyNxhHwm1ShIWZPIj4/Cyo4VUZZUpbmlq5ahopu9VLcTakCEsliMaHEEbk3n79K/+3oeTdFsCVUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w+F7b0RficfQAnQro9N08YEMXkyefyGTJk8Xu0QkVUI=;
 b=aXdFI3W44QM9X3BDJclf5ZszAFuBYQDZfPO+vcrmZE1V1bTK3j0MXytcaHbl1+JZycr6mEZgJx3KZRypvSd1/8QWASWja61N/Gjwly6PC1+EAXBoAJ2WekQkPLNsdzSCF+x/ialhoc1Bl1OF0jcB0gXzUb0NyLjRmOPQkmGUSDA=
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com (2603:1096:400:de::11)
 by OSBPR01MB2325.jpnprd01.prod.outlook.com (2603:1096:604:1c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Wed, 18 May
 2022 17:45:48 +0000
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::e180:5c8b:8ddf:7244]) by TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::e180:5c8b:8ddf:7244%7]) with mapi id 15.20.5250.019; Wed, 18 May 2022
 17:45:46 +0000
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Ralph Siemsen <ralph.siemsen@linaro.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: RE: [PATCH 3/3] clk: renesas: r9a06g032: remove unused field
Thread-Topic: [PATCH 3/3] clk: renesas: r9a06g032: remove unused field
Thread-Index: AQHYatzNpucbCnxetU2DWZEUj/eQ/a0k6EmA
Date:   Wed, 18 May 2022 17:45:45 +0000
Message-ID: <TYYPR01MB70868FBA9C7FBA416BAE8CC9F5D19@TYYPR01MB7086.jpnprd01.prod.outlook.com>
References: <20220518172808.1691450-1-ralph.siemsen@linaro.org>
 <20220518172808.1691450-3-ralph.siemsen@linaro.org>
In-Reply-To: <20220518172808.1691450-3-ralph.siemsen@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0348b49b-ef81-43a5-6db9-08da38f63d0f
x-ms-traffictypediagnostic: OSBPR01MB2325:EE_
x-microsoft-antispam-prvs: <OSBPR01MB232598E89C64928AA138F36BF5D19@OSBPR01MB2325.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qUlEGwe94x70J+Up4S0aXwulO9jpfd5c1oK2X4ydHRSrZAQTl3F0OOa6X3YhKDadly0V4IgZTZRCkeggTJ620aKapTGtZWISMyGDuku6fpb6h8QEdYUY8VyrNVoNGSe9F7kT2FJdHVVIE2hOjk1Ku0C+Ca49Y1B4ezP1gtdi9MPcB3aSe2sqsShSIYatmgyx6lsD1cThYRfrR3m0oOvM8G2UMq/CiemoUwkO1L5IiFaaRzEjyszmrxTZnCxNgdtRZCwRJNh6a8WPn4gokZvF1WBLkNAd3vcRxGE6KHnobBxULXoviJy47lWtkhtKXR/o7ddcUuU1ot/xOd0oEItmuSO6gvH1Isodu1c5CofEPDJ86p6OlVvauYMUMm2mURXFGCxluU68/bHyKZO8KBsw9YzBEAukq0MMPq8x7DvmkO+vw4idIw+FDKTqJ5Z7+KaAr2Ij4hl/04L4zceFJ6XIIrtq9mQduDFod7XDuZTuZhhUq3V98uLoGgyX5t4+VOE50/7a48c2Jjmf8B37eZZabtDOIK67ZS3XcIZlIr+6JVfcxD2mVERxjI/WN/9hd8MxLgifOckD5sgVHNW6Cg9xuEI6tYhJ94bu1wj7fp9OlIMrT/ABFUkfktcRpa6eR9e3jP63JKqsrS0dMFkWtDuwcobqtWcmbxZaiYbqtFqpcbxhoGtEQRQYdLowx45WQR65xH9Un432eT5fKD687orK8g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7086.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(4326008)(66556008)(64756008)(66446008)(38070700005)(66946007)(66476007)(122000001)(8676002)(76116006)(38100700002)(8936002)(55016003)(52536014)(110136005)(54906003)(5660300002)(316002)(44832011)(186003)(9686003)(7696005)(6506007)(26005)(33656002)(53546011)(71200400001)(508600001)(83380400001)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kByRCza7eXRK4kxr4yNOlBiuA9zkniSsjUkMWG2Cxpwm8IaPhIAcjbrY6aCO?=
 =?us-ascii?Q?F3QwG/z4dMXc/6WKINJZ1Fpxe+o7OzC3QkFFb0nZ8Xf05/QzcB08Yq2LQACX?=
 =?us-ascii?Q?TGrjXQQpJCp2Y9v1vEgDXIo2AxLrhEG8sN9XOJ+sN2eHIPlvrGVG95nAtv2x?=
 =?us-ascii?Q?9FZjwJvjHcSG1banqSpmjrhWds8i/nmhRBJ/r2KlwDZ5rxiYG1PDoiJVwNZy?=
 =?us-ascii?Q?5hjMyfqrjitzwxJwCaNrid4sy24QI5tfHJCQJp+cMrf+EVFLPYiwC/qR2VF8?=
 =?us-ascii?Q?/KEk9vwbbHdEQ/VR/LGyg7JUQXl5H9TeRfP39p7v24RfRU0+PksXLvhtl2Mr?=
 =?us-ascii?Q?Uu/1aOzJ7VpwfyRdoNFuJ7ND0x61eylM/LYaq+R2DTRQ9+v+1agXP+ShtWTQ?=
 =?us-ascii?Q?ZftbcnlV6wud4UNAtLFhr/bBLDdReKlyAG0aGuKUUmD/T7X8wPvo2CYythAe?=
 =?us-ascii?Q?ax+GRLjTycn2ektEdL7gGcJMjUZsgAK17uhB1r6bn4mDYbNJ2KUMPP2CPp0w?=
 =?us-ascii?Q?COEC207cRC8UfD/TYV2J5LmrDpUb9S+fVIR3X+26UNIpEZcdIsHNXARTxQFW?=
 =?us-ascii?Q?etA418yaE4RWB4mML7UjyIPJ15B4uK4+vji2o1wGqEj7ClZG7o0Z1N9Y4Z0b?=
 =?us-ascii?Q?eD25UHrOo8ndhkizlD9IPC2D2mg/8r8AGwxi2bZEAVmqdaKC23vEa9DIYNQV?=
 =?us-ascii?Q?T+OyQ8MqohukQSiMNGVBbi34Hq7+povs+uQG4LdZmkaxFURHHwsKArteUsxF?=
 =?us-ascii?Q?oQkbLE0qFUdwPpXLyxuioyzxeAYgvFY2hWBIUKOqvKqVVFFlBrifokno6xY8?=
 =?us-ascii?Q?Rwli/tvg/1VwGyaMTLPTim2RGu+vzNPQI8xdVm/l7dJvzH8dzEngGkCyKvx6?=
 =?us-ascii?Q?I2sg3FOzr8yJ06Oz6EKESOXlWMam9e5G1TwqydE/KzhKRHC/9WP7jCvD/O3d?=
 =?us-ascii?Q?WU7CbBzv+ub+pCZ7ebeQ/VV7Mfyng+r31KjKB7mzADi8UIVQM93/de5lYDc5?=
 =?us-ascii?Q?64mzp1nFrnSBj5KNnCIzHiovy1N/FY9/gK5WgqdjN5EcmJYMpHJOaKHwH34C?=
 =?us-ascii?Q?ezF90kZA9LO5a0NXmHx4MA8n8GQ3a/SVDm9wezl8x6QVkbNAl7TnMbKx/WFX?=
 =?us-ascii?Q?CH5AbxY4PT3Lp+RbcM/PXKwkxqeqUadKbAL8+1hHfB167jnnTJokvHpH4nFD?=
 =?us-ascii?Q?TIy0f141XS64rPTj6mOaiqEJ5JqQ+dGcpjT5b2yga4HVzTGUixEkN054Z70d?=
 =?us-ascii?Q?03HM+iLsIKkqzJkPv/67MhldylCsTMiQlI7vwT4e3PNjU4TAfDmkI4bnS9Uy?=
 =?us-ascii?Q?j7evci3NluE/c6MsJaWSlBpdn9PUf04MfiAGhE80gFvJY/crYn1od+K6cn8N?=
 =?us-ascii?Q?RAHnYKNAG2aDkXzcPH15u3piHlJD8BzfqW6vumKCmsBV9JYv+jUegZkfSTW+?=
 =?us-ascii?Q?crfla3Vxc3f3Ka8X1XOYjioDvfEpZY9020GhEio2iLcYzgB3+M/xHMnJnoIG?=
 =?us-ascii?Q?OeRYRUpm32bW3iG32XyULSC8ntSi/t6qZ/RP7bOkW8TEEIa+mCsogHFn/J5o?=
 =?us-ascii?Q?cvtjjlLUEITfFPDdSWswWddjwjbNpZapSTy3Q08kgIxErtndf61koKz+1+4e?=
 =?us-ascii?Q?S142tkW/bHZWTOEEjRGp16NPX2uGsnfbRVP8L4+StNhgpv9YFwC/lm3ShNIh?=
 =?us-ascii?Q?cESyiW2eSa9yNdVbHpFn31due/q8HsMEJ0gyU8Q/IQHVtBC2HVVwQRUKgtus?=
 =?us-ascii?Q?DlEaXya7vDULiSt/METcZZSo9k5Ar/4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7086.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0348b49b-ef81-43a5-6db9-08da38f63d0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2022 17:45:46.3253
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jomCFuDkDrlEOnKOEbuMb9xRUO++GTzMRQiAqIcniiVcWXIKQLAx+rfxtXvZmlCjEajOxQ+nQz0LLddYckJCNNkgwOv2SY2FAkGKXTR3wKc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2325
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Ralph,

Thanks for your patch!

On 18 May 2022 18:27 Ralph Siemsen wrote:
> As the D_UGATE macro no longer uses _gi, drop it from all declarations.
>=20
> Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
> ---
>  drivers/clk/renesas/r9a06g032-clocks.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/clk/renesas/r9a06g032-clocks.c
> b/drivers/clk/renesas/r9a06g032-clocks.c
> index 9dbcf9620fa0..fe56560c54df 100644
> --- a/drivers/clk/renesas/r9a06g032-clocks.c
> +++ b/drivers/clk/renesas/r9a06g032-clocks.c
> @@ -79,7 +79,7 @@ struct r9a06g032_clkdesc {
>  		.source =3D 1 + R9A06G032_##_src, .name =3D _n, \
>  		.reg =3D _reg, .div_min =3D _min, .div_max =3D _max, \
>  		.div_table =3D { __VA_ARGS__ } }
> -#define D_UGATE(_idx, _n, _src, _g, _gi, _g1, _r1, _g2, _r2) \
> +#define D_UGATE(_idx, _n, _src, _g, _g1, _r1, _g2, _r2) \
>  	{ .type =3D K_DUALGATE, .index =3D R9A06G032_##_idx, \
>  		.source =3D 1 + R9A06G032_##_src, .name =3D _n, \
>  		.dual =3D { .group =3D _g, \
> @@ -297,14 +297,14 @@ static const struct r9a06g032_clkdesc
> r9a06g032_clocks[] =3D {
>  		.dual.sel =3D ((0xec / 4) << 5) | 24,
>  		.dual.group =3D 1,
>  	},
> -	D_UGATE(CLK_UART0, "clk_uart0", UART_GROUP_012, 0, 0, 0x1b2, 0x1b3,
> 0x1b4, 0x1b5),
> -	D_UGATE(CLK_UART1, "clk_uart1", UART_GROUP_012, 0, 1, 0x1b6, 0x1b7,
> 0x1b8, 0x1b9),
> -	D_UGATE(CLK_UART2, "clk_uart2", UART_GROUP_012, 0, 2, 0x1ba, 0x1bb,
> 0x1bc, 0x1bd),
> -	D_UGATE(CLK_UART3, "clk_uart3", UART_GROUP_34567, 1, 0, 0x760,
> 0x761, 0x762, 0x763),
> -	D_UGATE(CLK_UART4, "clk_uart4", UART_GROUP_34567, 1, 1, 0x764,
> 0x765, 0x766, 0x767),
> -	D_UGATE(CLK_UART5, "clk_uart5", UART_GROUP_34567, 1, 2, 0x768,
> 0x769, 0x76a, 0x76b),
> -	D_UGATE(CLK_UART6, "clk_uart6", UART_GROUP_34567, 1, 3, 0x76c,
> 0x76d, 0x76e, 0x76f),
> -	D_UGATE(CLK_UART7, "clk_uart7", UART_GROUP_34567, 1, 4, 0x770,
> 0x771, 0x772, 0x773),
> +	D_UGATE(CLK_UART0, "clk_uart0", UART_GROUP_012, 0, 0x1b2, 0x1b3,
> 0x1b4, 0x1b5),
> +	D_UGATE(CLK_UART1, "clk_uart1", UART_GROUP_012, 0, 0x1b6, 0x1b7,
> 0x1b8, 0x1b9),
> +	D_UGATE(CLK_UART2, "clk_uart2", UART_GROUP_012, 0, 0x1ba, 0x1bb,
> 0x1bc, 0x1bd),
> +	D_UGATE(CLK_UART3, "clk_uart3", UART_GROUP_34567, 1, 0x760, 0x761,
> 0x762, 0x763),
> +	D_UGATE(CLK_UART4, "clk_uart4", UART_GROUP_34567, 1, 0x764, 0x765,
> 0x766, 0x767),
> +	D_UGATE(CLK_UART5, "clk_uart5", UART_GROUP_34567, 1, 0x768, 0x769,
> 0x76a, 0x76b),
> +	D_UGATE(CLK_UART6, "clk_uart6", UART_GROUP_34567, 1, 0x76c, 0x76d,
> 0x76e, 0x76f),
> +	D_UGATE(CLK_UART7, "clk_uart7", UART_GROUP_34567, 1, 0x770, 0x771,
> 0x772, 0x773),
>  };
>=20
>  struct r9a06g032_priv {
> --
> 2.25.1

Reviewed-by: Phil Edworthy <phil.edworthy@renesas.com>

Thanks
Phil
