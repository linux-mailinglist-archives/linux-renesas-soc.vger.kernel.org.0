Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94F747CB821
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Oct 2023 03:54:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231955AbjJQByk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Oct 2023 21:54:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232096AbjJQByj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Oct 2023 21:54:39 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2123.outbound.protection.outlook.com [40.107.114.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDBCBB4;
        Mon, 16 Oct 2023 18:54:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bFL/olPJS6M3mTPa3m2cpBOJAiAr8uj9zyojSgqPIgWTA1Je66OuuOUWHdSzbjP+7BWKeOkyg13XkLIvRgUhKZCLLJ94sQ49BygDGYL2ZMN/O0DslRzldqrayRJdeWM6Qb9p3NtyyqhQ5b5EL9Ryy0iYeYNgmYR/t61q49z80Bgrid7o70hySfU+J99md+Gj1ecs5mq3vVyZ3BBrtLmBUbISZKU2Vpx3MmqX0B0eVxZUeJz6bfZuOBWeCAQGv4TvZIw5e2c3ULfjaa3qaCJQoobmeyu0ctq1ZgLsGbU0ndFB+9pwz60jNs5GcAi1pri+HiktL9nBLtth9bIshljthg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e8J9DYOqsUtC/F7ONoqlftSeTRJNwlwZDAJAvWbiVdU=;
 b=GgmoN2Vy3UDO6CT/hxD8n8hRe/p5asxpArPtM3apDefbe8NYNnDhJzMQG8T9V/Rh1bZyB64AaPpbc5XKQak5h+uQXc+ftb5I/pj+N6YUuAUZvGY4YEIby/qD5A2gOeBGJGIkiHKx9PxFS2bxjMW4MhJuA7oBV5KzXminJre+F6PdE+tNc2erUPSkNSjEV/vAvGFJ5TJ6jw1WQBjDxYRRjyQXWN8ZQg3xEMhPZLidb784Tl8fcVv4Cx7LFFAUqsaaewV5LgJptrgXVX8QRtOYsxgfoCtKAVaOImW4pzzMFYuOM3rO6sdHIuU9LL8umnOsbRhfETkeNeyZAFIaAgryJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e8J9DYOqsUtC/F7ONoqlftSeTRJNwlwZDAJAvWbiVdU=;
 b=o+RJG0qe/AV7y9mhvv6hcbtPeVfjD7WWxofbZAP0OzOYohDhS2fqcF7TlhVKdLntfpHS45zWaRNgfVqHtwd5earfrgg6LujUFGW8CdSlu8iI35qNz6ghDPhyWMHkQYvYYyCXI+MbsBc1Q5nbky8qwdOcxtuZgV7aNyiGWRhVOug=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TYCPR01MB11434.jpnprd01.prod.outlook.com
 (2603:1096:400:379::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Tue, 17 Oct
 2023 01:54:31 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::a188:9424:be62:e5fb]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::a188:9424:be62:e5fb%6]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 01:54:31 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Simon Horman <horms@kernel.org>
CC:     "s.shtylyov@omp.ru" <s.shtylyov@omp.ru>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "edumazet@google.com" <edumazet@google.com>,
        "kuba@kernel.org" <kuba@kernel.org>,
        "pabeni@redhat.com" <pabeni@redhat.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: RE: [PATCH net-next v2 1/2] rswitch: Use unsigned int for array index
Thread-Topic: [PATCH net-next v2 1/2] rswitch: Use unsigned int for array
 index
Thread-Index: AQHZ/c+MN7TDtivt2EOCpIc5XPXdOLBM2fiAgABjd5A=
Date:   Tue, 17 Oct 2023 01:54:31 +0000
Message-ID: <TYBPR01MB5341051E73885669A556E1A1D8D6A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20231013121936.364678-1-yoshihiro.shimoda.uh@renesas.com>
 <20231013121936.364678-2-yoshihiro.shimoda.uh@renesas.com>
 <20231016195605.GA1751252@kernel.org>
In-Reply-To: <20231016195605.GA1751252@kernel.org>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|TYCPR01MB11434:EE_
x-ms-office365-filtering-correlation-id: fc45bf03-b1ac-40c1-d00c-08dbceb4013f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i4xIj/bn+xTmNf7IvbWu8Z1JdSVPavVriaw8H3HSw3WOgGUHLNu6WKsYyltRDqL9DZk7HEYqm9xrkKpkXzb5nVYO/H1yegH62yt4GZPNfUwDdX7e8L5PXO2Fdh43XxkzCfG8BoGm0xcaXgCE7+XXluWudcK3/d3oznEzanuvLc31JcL9QaApgzSjIFAkky76wUq2nnpdCyMUH/YOpYKbDjx1LUmK0+jvdGR8HYZgdX+BbaSnlebkvsMa03IhseaKc+VNR5AzX+BZOmrEb48Egs8c63UcRLW8kaSkCus4cf9Aiu3KNUvRtjtzto9CktXo8I+D4m3hUGMDs2gmZi6Ut2oplnWbFbzoWtz83W5jRwDhlkqqPVjUTHpxcOEUFg7mC/KJKK7s3efRsfZRHE+CGAUqsI2RrQh0phSk5+GJqgmN8TY/A5nbIKnWi7iw7ciSXHiAi/UC3sJEtAF1YYNBOnijHDgF0h7qncBxYGwDwAygdHxPLwEy0zASuv3VQKw0zsZRRQ/o6mCqrVHZEpQVJHnZbtWFIFa/UAAulEejwScDZ33qcMFZVGtbHG+GEXCEi8jzZjVTlO+SfRg8HAzxDDLr2MHlGpDZRR/A9bCav5yGj2zdOb7YeegtmbXLqAFi
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(346002)(376002)(396003)(366004)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(2906002)(41300700001)(86362001)(478600001)(64756008)(54906003)(66556008)(66446008)(66476007)(66946007)(6916009)(9686003)(76116006)(7696005)(6506007)(316002)(38070700005)(8936002)(8676002)(52536014)(55016003)(83380400001)(122000001)(4326008)(71200400001)(33656002)(5660300002)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2Omz8Gs6PWnVfb2w6WN9GSzecrZBSHxJxtYEFZDgMIV3ecR2ge683/M3ODo8?=
 =?us-ascii?Q?OxFJZptRCLmbwyz0A8FGiyKzd/WS1QjBX5V5isdmsO786CS7pySWOVkqwD31?=
 =?us-ascii?Q?4EEqeroAIVN0X0bt63tkrMK5f/XQntK7sp3vFJRrJcGA+Kn8hSRH9kuDXFP9?=
 =?us-ascii?Q?c9Hx0er96raApdNKjeh+jrZ7sMTHpxYE7GhgdZuRSUiWah4lcuLrxohPURyd?=
 =?us-ascii?Q?nIlPqN3pmOug0jewATBWqcGPQKK9UWTQVVAkeVjOVKeiu9j7m3dMG7d7f2ZW?=
 =?us-ascii?Q?+0gOFGnd6ca6SsxxmeFQJefT8rx+HnC9bFJaHmjjxA1S6T77loWdE1v6X9LJ?=
 =?us-ascii?Q?HZByoB2pJG+6N7f+HAgBJlGoig096YL9VzbXasZDwgeKLna53mu7mEGsxq0u?=
 =?us-ascii?Q?BmZ2EPU6P/O4sqsJ1utO/A2k4ftM+BUI6Bh8cTvpVTwvQ9cTuCiWZhHFGxWo?=
 =?us-ascii?Q?JiYTh7mhyi6E3w0djAB9caoMuxP8g9DyZCP781xN0UYrPFY7tvNLVT1IJY97?=
 =?us-ascii?Q?MHr2ZyL4UGS23jmvep++Z5FFnb7CQxas9rl99oECBa6uZ9hdht/7c1P0kjht?=
 =?us-ascii?Q?9QTj1QGOQ3WCxG0lOb6NmWcV3tI925Q8W2lexPeuXAKQynFbRu4xaeCYlUkh?=
 =?us-ascii?Q?1m8Q2jwGja7BGXfRm0mMa4GIOXZwWafr6QP56L3VUWktCygFJ/Jf+xrp2WFs?=
 =?us-ascii?Q?e+81A74zEfkOOV+fsuhazMir1LgRli7DHNb1/M5gFP1FsGxJa9zJAXZWF3BQ?=
 =?us-ascii?Q?ktj63yCyx/bJ+Da9+I9iVbRfK3mnNO6i4c+40difR6fh70kngyBOmTP4yVKq?=
 =?us-ascii?Q?D1bFrABiDnI0cFbjSros4pm0BJE0jtjO6sYlcrevIVFxwjJ7vM9+1m9He2Az?=
 =?us-ascii?Q?iZCbSu8jGQ8ftzNhmVT47V5GezyOBgY3iqA8Tw80tSWYXKhmuyvyTJNC6QZB?=
 =?us-ascii?Q?XhSh2y1dJUSXbXofnI7RqpFsEodw9ppaErKujm/PJk/FagrOADiwTHk2zK0t?=
 =?us-ascii?Q?AWquF/NErbSphGFQlqddCPoh/XtDZLRbKU5QVCGfQuaT20wJQrAVptCVF3vA?=
 =?us-ascii?Q?CGC2Bu/H9M8PilPmk4RSR+NgP/j6dT4Jm3m4T+N82be+dg/fdBeNTzOYd1Zl?=
 =?us-ascii?Q?q3H+oUZLSphPwM6g7Wi5RTY56xEZeu3uq9R2Xn4cStDqL8gMdcFUI4aOp2Gt?=
 =?us-ascii?Q?DOAbtr3QbqJRbYM/wo50eBID7yfTNG09wC44cLjrloJXo7RwZnPzetSrtfFk?=
 =?us-ascii?Q?JSR12bFzAeskMEebY89EaFgc4fmYjunW9JGM3g73zgJRXTS/GqFB20KG8jhn?=
 =?us-ascii?Q?VjyrGXCgZLaQgHPJthnpsHaGdz47Rkpy6okDORGcqO0QdipswMwDwPC/wtg2?=
 =?us-ascii?Q?aIwjrIZNEDWpdFmY0KI/kjkiSOPwuc4QpRUQh/iFPOmjSfQ95YOOccdeAGOo?=
 =?us-ascii?Q?Yc2Kg0U1i2LfTlJXD3Trtw5zfNQCfaDHxW6kt/mGVx3y9NGHkA4UdEVVyVMO?=
 =?us-ascii?Q?8nOiXXTbeW8iWrUBA7dD/P6AsbzcCLZz6UgXWZwIhx+N0kf7UEj9QyxM5I+s?=
 =?us-ascii?Q?OivzCKAyVUeAm0yDjwUhvm2hnPpy4IuVJ8abd4SIgLTbL+5gjJwSutx43UmP?=
 =?us-ascii?Q?Adpm+1LoNKnJqT/OnvPhxJ1jH7eWf6YmNswnTkrg7mdQQhJfQBRDXJvY5Hnp?=
 =?us-ascii?Q?wLDl4A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc45bf03-b1ac-40c1-d00c-08dbceb4013f
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2023 01:54:31.3246
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G5ifLZOvbhkJU2uCOwVSuSWYoiqEfQgGA53Uqz6PxWc0JpCiaQp/7B8Q/2b7d2OOrfTqmNAeSIig1MDHsjk6L+TPK//HVNPjLnhFZ1Ngk9Z44wBk8djiWpJPU7kkXjUU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11434
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon-san,

> From: Simon Horman, Sent: Tuesday, October 17, 2023 4:56 AM
>=20
> + Geert Uytterhoeven
>=20
> On Fri, Oct 13, 2023 at 09:19:35PM +0900, Yoshihiro Shimoda wrote:
> > The array index should not be negative, so modify the condition of
> > rswitch_for_each_enabled_port_continue_reverse() macro, and then
> > use unsigned int instead.
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > ---
> >  drivers/net/ethernet/renesas/rswitch.c | 8 +++++---
> >  drivers/net/ethernet/renesas/rswitch.h | 2 +-
> >  2 files changed, 6 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ether=
net/renesas/rswitch.c
> > index 112e605f104a..7640144db79b 100644
> > --- a/drivers/net/ethernet/renesas/rswitch.c
> > +++ b/drivers/net/ethernet/renesas/rswitch.c
> > @@ -1405,7 +1405,8 @@ static void rswitch_ether_port_deinit_one(struct =
rswitch_device *rdev)
> >
> >  static int rswitch_ether_port_init_all(struct rswitch_private *priv)
> >  {
> > -	int i, err;
> > +	unsigned int i;
> > +	int err;
> >
> >  	rswitch_for_each_enabled_port(priv, i) {
> >  		err =3D rswitch_ether_port_init_one(priv->rdev[i]);
> > @@ -1786,7 +1787,8 @@ static void rswitch_device_free(struct rswitch_pr=
ivate *priv, int index)
> >
> >  static int rswitch_init(struct rswitch_private *priv)
> >  {
> > -	int i, err;
> > +	unsigned int i;
> > +	int err;
> >
> >  	for (i =3D 0; i < RSWITCH_NUM_PORTS; i++)
> >  		rswitch_etha_init(priv, i);
>=20
> Hi Shimoda-san,
>=20
> Immediately below this hunk, the following code appears.
>=20
>                 if (err < 0) {
>                         for (i--; i >=3D 0; i--)
>                                 rswitch_device_free(priv, i);
>                         goto err_device_alloc;
>                 }
>=20
> I suspect that the for loop should be updated in a similar way to
> that in rswitch_for_each_enabled_port_continue_reverse as,
> now that i is unsigned, i >=3D 0 will always be true.
>=20
> As flagged by Smatch and Coccinelle.

Thank you for your comment! I should have checked the patch-set by such too=
ls...
Anyway, I'll submit v3 patches.

> Otherwise this patch-set looks good to me.

Thank you for your review!

Best regards,
Yoshihiro Shimoda

> > @@ -1959,7 +1961,7 @@ static int renesas_eth_sw_probe(struct platform_d=
evice *pdev)
> >
> >  static void rswitch_deinit(struct rswitch_private *priv)
> >  {
> > -	int i;
> > +	unsigned int i;
> >
> >  	rswitch_gwca_hw_deinit(priv);
> >  	rcar_gen4_ptp_unregister(priv->ptp_priv);
> > diff --git a/drivers/net/ethernet/renesas/rswitch.h b/drivers/net/ether=
net/renesas/rswitch.h
> > index 04f49a7a5843..27c9d3872c0e 100644
> > --- a/drivers/net/ethernet/renesas/rswitch.h
> > +++ b/drivers/net/ethernet/renesas/rswitch.h
> > @@ -20,7 +20,7 @@
> >  		else
> >
> >  #define rswitch_for_each_enabled_port_continue_reverse(priv, i)	\
> > -	for (i--; i >=3D 0; i--)					\
> > +	for (; i-- > 0; )					\
> >  		if (priv->rdev[i]->disabled)			\
> >  			continue;				\
> >  		else
>=20
> --
> pw-bot: changes-requested
