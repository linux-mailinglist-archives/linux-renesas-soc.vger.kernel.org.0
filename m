Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96E6B7B10AF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Sep 2023 04:13:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229493AbjI1CNZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 27 Sep 2023 22:13:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjI1CNZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Sep 2023 22:13:25 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2101.outbound.protection.outlook.com [40.107.114.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59C18AC;
        Wed, 27 Sep 2023 19:13:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dODEe7gmrjdWfmP2Af6dYr8CJwHb0K9S8h8lgUHJxtTnUVAn1dN5Ow7d8Kl09O2UpbfAjmtUT7kIZd7zS+dsiasSMCx60f9s6WtazKs916re9Aad8mtW1w/JUNKgnL/mqGSm/wscWBjn3XMeVH0TAewJ0Fd8Vyf5uHTR1j/6eiBLiXHQACITq7l9PTdHzybzAnPhwIz8kCeqLDbsm3WtxP4qYTR/lnpvlAW9VWfIijoa5XYflcJNctKFy9VllAVZ4yoi1An2E9HLd10UriWg2Zm2BBfq4zYUQL41FEElUHwU6rcw4zSO/+nlsGtftcV5MfkqFZy7Mfe843RPevf9Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vrpMNM8FXCR161NffR5FTH5maCWVIhJ2sDo+NpAdvH8=;
 b=ZfQK6daTO0ll7RCpfyat+gYcIP8IpxF8yncPEm8Odp2PDkBg4V/7NJCzcmvTU5Wr+MFcR4RdzvhB8OANq9FsCgBaPp6MS0KdMEe8Q2Y95izl4RMK4ddLEBMWOPuX3KQYpZcPzzrGzXeVJy/eZbBT6Yc7FhccTXJZBTt1XHaAbdbJIXklf1IHt8aaBc4s/oln5ZWH4mxtP0wQ7d++89fWdYIcqckm78wEa87C92cwTZAJc2RqOysufp6XvjvLG6at9NYOXN7fpW5UzePT613wLQVipQfF0j/QRofhIPdWobunuTmn30VccJ15APSWRoMxhO0x8pLglYZ9iedGCgEsiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vrpMNM8FXCR161NffR5FTH5maCWVIhJ2sDo+NpAdvH8=;
 b=QyKMI6IcA82wOSWbyHXN7OxYPuORMfmgL87vn5p9/2btA4kdX2jyBk6gTdp6pfKvfRa/dEKXUXBrhS9FCELBeYzZR7P0d9wzhCluEhOJvFwD8e3PKyYbXrikM6ogwNr55ZZEHC4PYcvtpXGY15ZzRvHrVi7aNYNITfonavSFB58=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TYCPR01MB9717.jpnprd01.prod.outlook.com
 (2603:1096:400:208::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.21; Thu, 28 Sep
 2023 02:13:18 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::1dc4:e923:9916:c0f7]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::1dc4:e923:9916:c0f7%6]) with mapi id 15.20.6813.027; Thu, 28 Sep 2023
 02:13:18 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Andrew Lunn <andrew@lunn.ch>,
        "Geert Uytterhoeven (geert@linux-m68k.org)" <geert@linux-m68k.org>
CC:     "s.shtylyov@omp.ru" <s.shtylyov@omp.ru>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "edumazet@google.com" <edumazet@google.com>,
        "kuba@kernel.org" <kuba@kernel.org>,
        "pabeni@redhat.com" <pabeni@redhat.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Tam Nguyen <tam.nguyen.xa@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: RE: [PATCH net v3] rswitch: Fix PHY station management clock setting
Thread-Topic: [PATCH net v3] rswitch: Fix PHY station management clock setting
Thread-Index: AQHZ8HVQ3VCH2935SU+nC4wlSYXzu7Aun5cAgADdkEA=
Date:   Thu, 28 Sep 2023 02:13:18 +0000
Message-ID: <TYBPR01MB5341BA14DCF0BEEFBBED95D0D8C1A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20230926123054.3976752-1-yoshihiro.shimoda.uh@renesas.com>
 <c88ebcd5-614d-41ce-9f13-bc3c0e4920d7@lunn.ch>
In-Reply-To: <c88ebcd5-614d-41ce-9f13-bc3c0e4920d7@lunn.ch>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|TYCPR01MB9717:EE_
x-ms-office365-filtering-correlation-id: 067b4589-8596-42f8-936c-08dbbfc87b6b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4lBV1UkfBGKi50rmY8GS9EUKk3xHad0DaqZ/i9nEkAi+Lwig3ywN1dE5/8k8XiLvF/6j9PaNuzOxz1pz7BsWZv90C0b9L0OIWhNZFw1PIa02OOmrGNXdADb6qsAebuqHHhZb7DliRX7C3NMGDB9zFttpfdq1/8536GRt0oI4UM1SNtdfbaw3Ij6J3e/cdPVwahbpOYBzemX0c8CCu0K788iESnTGFp0xkwLYKm7drTfkuLjtaGkWE01nVJgxJIa+JemfXghbY9W2QjqbAB8sVQljRNlJmzAHQzCRM6CnX3UVHQTagU08i/Bh1CjEZPXhv5fTXOJed2j3/MdxVnPKo9K1vGShgMfd+PtHgVeT3ukx0IqL12rAtYBfsCHeavzBkiaQLZCPeFIp+xHUl86Ka8lZh6qIh+x6RwZ0VGbM58IiIDTxMbugDKbipVsY4hhETyZoLIsXvkmSeTFvCMqgjddLXoI0wIGrgk1cUzrs0ZQYorC5ex9vEko4pvFJLHCbRYtN9/IyEXUrcEAYs7vQgwOqoJAGedV+U2ot8pjMJHBCpbjf5SMYfja0s/e3JCQQMNcI9xVE+mIDT/hxbERUQo4CZm0lFmiLcqLU3+bRX9xoH9ZnRWs3j67dskOgK/nS
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(396003)(39860400002)(366004)(346002)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(107886003)(9686003)(7696005)(6506007)(86362001)(122000001)(55016003)(38070700005)(38100700002)(33656002)(83380400001)(110136005)(76116006)(2906002)(66476007)(54906003)(64756008)(66946007)(316002)(66446008)(8936002)(41300700001)(4326008)(8676002)(66556008)(5660300002)(52536014)(71200400001)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?w8ZIiq5Zn8iFep7kZ5rUFa1lJq73WMvX8hBTyJ4/LAYTbVcrba57UdSyRuvR?=
 =?us-ascii?Q?1gkM+5nn2Wd4vcEnfQZztklsYfOEYRSBdlF3q6S92EnFSVwYy0oIyNk0Nopr?=
 =?us-ascii?Q?vZv8d5q6VNIp/LnfIOZEBPPZFPnUS/MgvMS6RpOspKQ9+jv5ANrSvPq6W+w6?=
 =?us-ascii?Q?WTM1H+IR253wgv30prpYWckAlb6FHRnNXFaGEwAQtu3hj8ULfFuVz21+TD6W?=
 =?us-ascii?Q?N/2aMX6eIkmCDK9msc89xIRSJH3EAciwWs7Hzi789bDck/pIkCp+SUlMivhn?=
 =?us-ascii?Q?oNDxV1rIAv1+SGids5FxUGP8C9Hv6yPhDE05socRWO5K8h6fJMYNVyI6+AlF?=
 =?us-ascii?Q?mI3Rr4S+WmcUEUbD2bIWdEpBi7SIc6recFlg1liFO3/BjOJFFuzhQ8T9TT7c?=
 =?us-ascii?Q?bP6ioBvUlphxTBnYffn1tTQ2ca/yjNJikKedcnsvJn2AjrbdU46F+tdfmgmY?=
 =?us-ascii?Q?AHMdK6k6ClbcJeLpuGLsgmidvUQkriHyAbkgvTNOfGG+Mrd0zOocIf4Zoszn?=
 =?us-ascii?Q?UlVxuHwoNUwXxiEjycjRfWVbjPmchUMy+/sq4OsCNUvFySGM2tLGesbBAenS?=
 =?us-ascii?Q?tmDG2E5I1QYw8SaUiZN+rosnflzgXAXN9wZbOx/JNs1DpeEUAwy0/mSgYIZC?=
 =?us-ascii?Q?wtIVe/guWsE47d4LyVDX9xaMsuE9eDB+e0REcY2X4e+cqNmZpF1X8+Y8f3C1?=
 =?us-ascii?Q?cYweArMV9/St+Y/VuwH/IjuNQhFZkSLqeJ9gVUSb8dW2neD3vO9n3BujdxAE?=
 =?us-ascii?Q?qRmPfgQFlh9rLG2hvlW7HFmKzzA2KUqpMJtpcC48Lw8ltmFIC8tv1uQg8ZcQ?=
 =?us-ascii?Q?noB15XAVJ2Qj/lOe4qyCD1XLopSOmvLrU/PsAQu9jzUNB0Yhr2zFTzPcUqiz?=
 =?us-ascii?Q?SqQerv6n+0qun7LNzjD7rxOeCavAKoKCWSDf4B3ZVWIiPBe9thJsh38OS2rp?=
 =?us-ascii?Q?M9gbRfrK46j0URUfEZwCt++p64RKZ+XeDoDWjnDxhgqRF4POZe015f263xL4?=
 =?us-ascii?Q?qZ+3w4QnWQTsU3ulYNTvWzcknwCXLjgQXckO51r4+Kwu3PrZBpCtqe2TD/1U?=
 =?us-ascii?Q?faw9B1r4mMpuMrhsQQ9EvfbXu9r3YCYRQdBZYH9l5SVMpbX7f6GcH7w61r7Z?=
 =?us-ascii?Q?uoT3kNDQKsxt3azCnTlszDAuAlMACiwIacW3a/4Nyhrw7ilhG1PZFI0oF7wC?=
 =?us-ascii?Q?R3lCEfSPmWAmAc5+ZdOJlVvZBNXdQTcQpDPL6Utf7PKo3Dru0/trZLl6epgK?=
 =?us-ascii?Q?oWZs72LVFaatgWVJwJ11m8gQJbPfz0RyDnEL7GrLaJm+EXteLhGJdnD4dsU/?=
 =?us-ascii?Q?cPSQAlOtySbpmzbFy1o6Kcqvh9GXyiIAL9QYHQNaXGcMiUQvhTu2VM48sDrG?=
 =?us-ascii?Q?REDy2BX6KSONxf9hr/Mgvltlcdc/QL/oU4xOs94/yRdUFaXmTyYZcBSC0fCp?=
 =?us-ascii?Q?LIHb4WSnDlpd9INShZO5pjM4lzhzyODtBeRYrvK0DosCcuRqcUHfKSnvL1qe?=
 =?us-ascii?Q?cNEY56SOQPpwSEfhsNGpXqVr2rcTVeov9/IO2U7gwg3qWuXFLhh2/z2eGQyq?=
 =?us-ascii?Q?ixtv0sUvbPhUOPwhHLFawc1jQlPID26EIYpX/CvN8cGdjdpKdBObT9+SoAK5?=
 =?us-ascii?Q?pG/Latzbz1VQKmExgjJvpGDZhKLtZPCnKyZUU2+SLbWetdYoFa0QTGEY/tz3?=
 =?us-ascii?Q?tuQdSQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 067b4589-8596-42f8-936c-08dbbfc87b6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2023 02:13:18.7586
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QcBkeWqsXnJUMayfgDX23B3jNAJ8BGsAa3ZMGs6VSiplgc85wir6Wukh6TFllsf+L1pGtBQ582hMY1xBfRY64did9g/DDB3GdG8lDVnUvsEtHbqwfDrdRViNir/sf8ja
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9717
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Andrew,

> From: Andrew Lunn, Sent: Wednesday, September 27, 2023 9:44 PM
>=20
> > +
> > +	/* MPIC.PSMCS =3D (clk [MHz] / (MDC frequency [MHz] * 2) - 1.
> > +	 * Calculating PSMCS value as MDC frequency =3D 2.5MHz. So, multiply
> > +	 * both the numerator and the denominator by 10.
> > +	 */
> > +	etha->psmcs =3D clk_get_rate(priv->clk) / 100000 / (25 * 2) - 1;
> >  }
> >
> >  static int rswitch_device_alloc(struct rswitch_private *priv, int inde=
x)
> > @@ -1900,6 +1907,10 @@ static int renesas_eth_sw_probe(struct platform_=
device *pdev)
> >  		return -ENOMEM;
> >  	spin_lock_init(&priv->lock);
> >
> > +	priv->clk =3D devm_clk_get(&pdev->dev, NULL);
> > +	if (IS_ERR(priv->clk))
> > +		return PTR_ERR(priv->clk);
> > +
>=20
> /**
>  * clk_get_rate - obtain the current clock rate (in Hz) for a clock sourc=
e.
>  *		  This is only valid once the clock source has been enabled.
>  * @clk: clock source
>  */
> unsigned long clk_get_rate(struct clk *clk);
>=20
> I don't see the clock being enabled anywhere.

Since GENPD_FLAG_PM_CLK is set in the drivers/pmdomain/renesas/rcar-gen4-sy=
sc.c,
pm_runtime_get_sync() will enable the clock. That's why this code works cor=
rectly
without clk_enable() calling.

> Also, is the clock documented in the device tree binding?

Yes, but this is a "clocks" property only though. In the dt-bindings doc:
---
examples:
...
        clocks =3D <&cpg CPG_MOD 1505>;
---

And, in the drivers/clk/renesas/r8a779f0-cpg-mssr.c:
---
        DEF_FIXED("rsw2",       R8A779F0_CLK_RSW2,      CLK_PLL5_DIV2,  5, =
1),
...
        DEF_MOD("rswitch2",     1505,   R8A779F0_CLK_RSW2),
---
So, the device will get the paranet clock " R8A779F0_CLK_RSW2".
And according to the clk_summary in the debugfs:
---
# grep rsw /sys/kernel/debug/clk/clk_summary
             rsw2                     1        1        0   320000000      =
    0     0  50000         Y
                rswitch2              1        1        0   320000000      =
    0     0  50000         Y
---

I found that i2c-rcar.c and pwm-rcar.c are also the same implementation
which call clk_get_rate() without clk_enable(). But, perhaps, we should ena=
ble
the clock by clk API?

To Geert-san, do you have any opinion?

Best regards,
Yoshihiro Shimoda

>       Andrew
