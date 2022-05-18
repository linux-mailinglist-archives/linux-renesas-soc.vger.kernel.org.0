Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B775352C126
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 May 2022 19:50:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241186AbiERRof (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 May 2022 13:44:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241174AbiERRoe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 May 2022 13:44:34 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2100.outbound.protection.outlook.com [40.107.114.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C9A2633B8;
        Wed, 18 May 2022 10:44:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kuj7ogp3o9W7qERc76aG2C3TWoYwelozHnDlbXJb48+deDORfDX4mlctPMrzDTGvComBYxnHHuLoRQpNpiYQQZpNjmrv5feLG8bH2faVJ11OtzzkTWjcy9V16iKR17VDRHMCo9C8sTA+Gmq1wyM+1DSt7g2HZZg5t+grAwK2JwB+G6EE78fA2GCj8K4uANxVmUWKH7nzPjq+8HU1mEKFhNoa7DV9/ShGsWDs4sZ59opbaCydKZRi9T7wmWMrKYhW6XWq0K6MmuRtgPPkVImQEjuvpKRnvGSSRswfeP66W/gR7EbRrsER/5G2m2xu3DgGTU4YhoDYIwMYXb4BaQTSsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rg5x365tugxjCzlQVBoHNG8ESs36Y8FziBDdpwprYlU=;
 b=FDmrh8xT49FbYKqP3irmpv9tBXoWmJGAPTghEpC0H9IxU2LlrNm8QangpPxJ7bptjmveQ8LpHgld5QiRy85c/BhbiQ+3AGehLi181orqMO+DTwJhUhXeBq+X8g35OqAhP648Qy5CmFOGUIt+KQtl5Vvze+/EA7eXEVMRCxz7jN0vsxR6OyMyDWbPkM1Og3ivkFiTqvRhrhMOYMLo095ICcVc7lVPt27lg+l7bA4OkEsnu6pO1RlbE+s5TZF9444gup4wDNn/WcjU4CZlNsWL7QzzwvGIUmKr0cwTGYpw/CZ9mvk84iFFiJndnxQoSOSSJucAFp01I/+1tIu8RlJR/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rg5x365tugxjCzlQVBoHNG8ESs36Y8FziBDdpwprYlU=;
 b=i96lqZ4RZsPtON7wRtuyngM3i9tKMlwzdEiXUnNITx2lSkjjx/Ssm3yMv7IewgrNNzoPi0Ig5y8u9mSepEgJ8htheN51zwcFhZ+PTNYOqhx1yO82QFr4kp+cZz+Ph9jw4HEXX1dAxF3Muw4+IsdWyJ2FBUQg8WAcH3VDQ06R63Q=
Received: from OS3PR01MB7080.jpnprd01.prod.outlook.com (2603:1096:604:128::5)
 by TYCPR01MB8359.jpnprd01.prod.outlook.com (2603:1096:400:151::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Wed, 18 May
 2022 17:44:31 +0000
Received: from OS3PR01MB7080.jpnprd01.prod.outlook.com
 ([fe80::d00a:6df:2d6b:70d4]) by OS3PR01MB7080.jpnprd01.prod.outlook.com
 ([fe80::d00a:6df:2d6b:70d4%7]) with mapi id 15.20.5273.014; Wed, 18 May 2022
 17:44:31 +0000
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Ralph Siemsen <ralph.siemsen@linaro.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: RE: [PATCH 2/3] clk: renesas: r9a06g032: drop some unused fields
Thread-Topic: [PATCH 2/3] clk: renesas: r9a06g032: drop some unused fields
Thread-Index: AQHYaty/guB22jCX1kq5qxQKreXegq0k574A
Date:   Wed, 18 May 2022 17:44:31 +0000
Message-ID: <OS3PR01MB70805B370F6186338DCA9472F5D19@OS3PR01MB7080.jpnprd01.prod.outlook.com>
References: <20220518172808.1691450-1-ralph.siemsen@linaro.org>
 <20220518172808.1691450-2-ralph.siemsen@linaro.org>
In-Reply-To: <20220518172808.1691450-2-ralph.siemsen@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c1c5b482-c318-44d1-5d5d-08da38f61064
x-ms-traffictypediagnostic: TYCPR01MB8359:EE_
x-microsoft-antispam-prvs: <TYCPR01MB83595249C16C142E79A459A3F5D19@TYCPR01MB8359.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lv8Nf0cLkfr2pyfe2mb8miDJ1GPqAILex40msgPX5AjQbpZe55yybygipIebDNIKppfIdJNFgOAkYemnshz9uEPRvQKZYagexKcO6b7zBuzE25jNcaTefIpdmTCtZ4HKp7Ygd2kWluhCJKdPVuRJMJx997XwxZ/dDN/OzqzT4r1Ph+BV6NCOI/9hsawjumtsNw1rkNPTGpK0DGLOdtLuyOfqnK/Ngt3glSTOxYKCGmOeYdA5MJoMTRpAxCRDuCrASda4SrDzuR5OSnAom7+xR66aNtGwez1lrPhfCx5Vv8JicoDLmqu6U84Zf6dNcppyc8Kes3udy+1ipGF2J0hzLxzG3XAMf+d5DPd3LWrVxNFQYv34axvttcFCrcK4/F7g90zCWZeZCtx2PMgKz2A7MqYFnwosEQsbIyyK/V7lwLdYSG6rle1w0B5fBZVMPiVxIK0m4rQQfbZxJQTjynygXA08S96nIeH52i/0mi4vJX867V1CAlSpP2QcvhILk6KmqsweS1PeV9Q3h0SDUHVaHUfYB4GVs9rjkH1RIAMDWsXu/9xGGkEp8Z+UeW77WwmvlN7l42FmbytYHkT3+f6ECbCTflkwsvyEbunppif3yqkrz3RzfqkoouutFAN3MTyAyfJT+aR8PLqvGxEmK7uzR5/m9Fx8A4906s7i7C+iMbqofE6xYeSJsTsrFPFId2vB4LFNY43+86ckcA6/s7Cq4w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB7080.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66556008)(66476007)(66446008)(66946007)(38100700002)(64756008)(4326008)(71200400001)(33656002)(38070700005)(508600001)(122000001)(110136005)(5660300002)(54906003)(186003)(53546011)(2906002)(55016003)(52536014)(8676002)(316002)(86362001)(44832011)(76116006)(7696005)(26005)(6506007)(8936002)(83380400001)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QQDQ0ZFm2M0dJuOqN/hWHW/p06uDJ7fy+Qc0CMHpLuCThDaKaJUh4daTMdRo?=
 =?us-ascii?Q?3cZj3tOAyM//Moiiy/4f6wZBVwww68jdgGL+I/f7oIQGGfOGMrN3Z8Y75e0x?=
 =?us-ascii?Q?52qx7lKy8ETTcFvuXJg07ssTcFKiXTncqbDRig4jeHHV33JBYDHCunaK/M/C?=
 =?us-ascii?Q?btn9uxb0OZ+/r1Ou7N0mHEyOBXS0JsKinyj0IQU1y5/5WbCGmmFH8fttwrxL?=
 =?us-ascii?Q?EdX/5wulSa858VraW0Fpqnk87lnydds/7igFtOd7DuamuavqBf6Zuf93ozEa?=
 =?us-ascii?Q?nxIKREWUPWgvY6/AupGVbkyXQtoXnSm8Rq50/yVj5Oh4daIOm5kKikEgJRzz?=
 =?us-ascii?Q?fCgDZjccy+GkiyH9RMvL6zXa/wAfa+0SwKJEhLVeLl7W5Si82E3YQdXg9Kpo?=
 =?us-ascii?Q?nJAyguGj3gZv04SwgPiUACjRG31S7Kt2SW4s9V/UVRU2JwoasU21G0lthacr?=
 =?us-ascii?Q?WUGP8Hs9DdU3MyHDSE5hS3y1VJkqtQTBKc8bEsqWdUaSzX+ujFUrh+6EU0P3?=
 =?us-ascii?Q?C8tUeSkr1FEpbFCV1WTYQqYQrM5Ow0E/Tx3aBcbchmCZu1SzuTA/UOK6P6id?=
 =?us-ascii?Q?tZPAgGNvB2mnjnxqMd3CBKo/riy23nFunq18mxi1ASYq7CtXVKZvjRMV865a?=
 =?us-ascii?Q?c7nqNcQTdgXswFwZK4U4vSZNAPT5qGJHRvOG07P2JqNqrRSxSjWss5mEIIqm?=
 =?us-ascii?Q?tqEyjrGb5BZ5QxLUuR1kuFJ7vXwo29Mi80q8DcuKADkhnfb443TPYLHwzlft?=
 =?us-ascii?Q?HxRYtSQc/wezeKnWsbkEv/zkI82JK6SscsTZLrHhTzbS1B59K3uyTIdrAKOw?=
 =?us-ascii?Q?uDE2P8ZtpTRmtSBJXILSL5g7VSvFi19xL+vQQWK+0/C69Lh3eVGTCR1qu2D5?=
 =?us-ascii?Q?pXqkXsADD0JwJGLBmIQiSjlAU720SksJ4cco6ofrARUqf5FV9enuzeknXlYg?=
 =?us-ascii?Q?8Bv/sxgNMS/ysPFEPe98UwdDheg3zbukGds14fz2GgkfR+WZuepHWoL+Fotr?=
 =?us-ascii?Q?5Hf1OCeeRrE0D270PYT0TpDD3EOzyIBhZJ8s4EI7zE1H+VEErtbAdp8Y2wDk?=
 =?us-ascii?Q?1S+ufORgG2fuJZiN1IMKnyrubnDw2wqfSXmtgaNP8l7YMRd+DJGxzTUCwvy4?=
 =?us-ascii?Q?Be7kZRjoEjTSutYJ/BBjw+ZNRXxoUT58Th8EmQt6GiIgbsbFJij+yerv8dRA?=
 =?us-ascii?Q?mcLeH5xlczoH6YKUGk5AtxxvXbxjG92YP/RJ726mAoVhuozAvBB+c8jhi+wC?=
 =?us-ascii?Q?8ZlW8NDUArAC3pixiIuQFt3yJkrfeFp77aKud7G2/KokfiEbckQtZ17gVaKA?=
 =?us-ascii?Q?8f5isHZB/U+0uF0PsmR49PDDNQP9oGTyDHr1+yM/bfQfxNVTI+CazcHJz8WE?=
 =?us-ascii?Q?CQvLDIOrKWFer2JjJ67dniWhg8I5T+8eWwNHgeuJbMTJPBUyA6XYTsicmoOn?=
 =?us-ascii?Q?xnNnUeFvnQxBIz4XDBaX0WSUPxHgSrgFZvJcUXPqrmX9qPGNBdyL1n3Kxgpv?=
 =?us-ascii?Q?ydr7LD++N6hzX3mjlMiNK+pkJRQfQ1ppCEUY0nYQZRtz/0jBUmZC+9vNNO1d?=
 =?us-ascii?Q?HQDe2lhayAlOlO0VqasiAwGnRjyiLbm+n2u2jEzdQRptHhXuf4l5+ELY+MJh?=
 =?us-ascii?Q?Dc4G56A7WVgLzlJ3NQu/KKu3yb3pZVsQ+fbn5UpqiSTz8fV2bI4joZAzlOJr?=
 =?us-ascii?Q?WuIjiGzat9mtC7CJi/68HoIbF3EgeHLwHQHUgEgWkeq/WOlQoZMnMhV4o/eg?=
 =?us-ascii?Q?FjC6FZOHoiq1v7Bx3Gql7/dPV35ihUc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB7080.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1c5b482-c318-44d1-5d5d-08da38f61064
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2022 17:44:31.4157
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z9r4Rq7rB+FrZeEl4PSuZb0g4xhazDasqGPhKRkRIdB/7f75FWzZy7M4KF2t5WzcWIiExB5ly952J3Hq/k6/rYerHshLnn8kxfVnxmvSrrM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8359
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
> Minor cleanup, remove unused fields from struct r9a06g032_clkdesc.
>=20
> Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
> ---
>  drivers/clk/renesas/r9a06g032-clocks.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/clk/renesas/r9a06g032-clocks.c
> b/drivers/clk/renesas/r9a06g032-clocks.c
> index 0baa6a06ada8..9dbcf9620fa0 100644
> --- a/drivers/clk/renesas/r9a06g032-clocks.c
> +++ b/drivers/clk/renesas/r9a06g032-clocks.c
> @@ -47,11 +47,9 @@ struct r9a06g032_clkdesc {
>  		struct {
>  			u16 div, mul;
>  		};
> -		unsigned int factor;
> -		unsigned int frequency;
>  		/* for dual gate */
>  		struct {
> -			uint16_t group : 1, index: 3;
> +			uint16_t group : 1;
>  			u16 sel, g1, r1, g2, r2;
>  		} dual;
>  	};
> @@ -84,7 +82,7 @@ struct r9a06g032_clkdesc {
>  #define D_UGATE(_idx, _n, _src, _g, _gi, _g1, _r1, _g2, _r2) \
>  	{ .type =3D K_DUALGATE, .index =3D R9A06G032_##_idx, \
>  		.source =3D 1 + R9A06G032_##_src, .name =3D _n, \
> -		.dual =3D { .group =3D _g, .index =3D _gi, \
> +		.dual =3D { .group =3D _g, \
>  			.g1 =3D _g1, .r1 =3D _r1, .g2 =3D _g2, .r2 =3D _r2 }, }
>=20
>  enum { K_GATE =3D 0, K_FFC, K_DIV, K_BITSEL, K_DUALGATE };
> --
> 2.25.1

Reviewed-by: Phil Edworthy <phil.edworthy@renesas.com>

Thanks
Phil
