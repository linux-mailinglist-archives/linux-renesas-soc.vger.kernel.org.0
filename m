Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1512B66224A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Jan 2023 11:00:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbjAIKAe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Jan 2023 05:00:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233682AbjAIJ7B (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Jan 2023 04:59:01 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2120.outbound.protection.outlook.com [40.107.113.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 026F813CCE
        for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Jan 2023 01:57:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LFbPQzb6DTpbZBIKCO203A6bm6sjqqquci6fAZjclmTbWh5ZO9CO5rAJlZJYdt6+jvPw/SC98HYpWSSmOBxRzolAC4dRvMwHmugdQQiRjqglxmhuAjN1bC6FebYLGcxnR9tiDBM8qzU1PoR/XYgY3YLVsq8WGs8P6mc1OzzY9LY7OLy0rQtTqwffq1307gkXJh5akrMdDTIaOk+q8I9Zu1gEWi5LeZzmkyFW8EDZq422LlCRRWOOk5kQBUddRogiyGRTATvk8ZueXuLPIUupRwFHRgQgU2/JRAG8nSqSWon/iaoBQ42bVzez/9phtb2I/+a19FjFM4TwepraHf1z1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/+IiFwlzjW+Z9TpU4NPvMbKFDSVILYh2mFzU+hK+Grg=;
 b=gldzQ0xMXsCGnLHWRv1bZmzr+nMjXtHVthCmZ4rmHauwGVd0UlEYwb4R9ucxZSAoK78nY4fjizL7WLb1gc+6hzZA2mU43N2YNv49K247Z8jnx4NkuR3W8ZQUk6VJY5qZ0gaUq1i9W7C6QjsPaMUr//BbkS29EfDts/VoLD4uqoxlOInfqaPnWrT2OAuXEne8bMb/wDjLl4lDzbTaWHfqOd13jD7ukbtpInK8ObgeCds635uxPhWGLO04KPgjug/YyYMMw/popXkyO8tDWiPtht6wHPQMoUNH1d+uRh1wnIFHLVhtMo5i25a0oIl7y54iaTZsLolRtfpyKzIZm+o+QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/+IiFwlzjW+Z9TpU4NPvMbKFDSVILYh2mFzU+hK+Grg=;
 b=ji2IpCW9Bzh2MZNyH7JAF0jKIg6uF20G3AvEk6Ib7eZrsJfqNawV5Tm5APFtCFN+EfDBEQdj4JZefSeRkZhxA4fLwo62n8kY6u+wye44AziwqcqkYFWvwjOxAchlgdX5pKGs19x1bIR0cfz/Ek4p3ggkfzcF2nNAhZsrJGUu8ko=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB9923.jpnprd01.prod.outlook.com (2603:1096:400:237::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 09:57:43 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e%3]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 09:57:43 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v10 2/5] clocksource/drivers: Add Renesas RZ/G2L MTU3a
 core driver
Thread-Topic: [PATCH v10 2/5] clocksource/drivers: Add Renesas RZ/G2L MTU3a
 core driver
Thread-Index: AQHZEZASQIO+fjwcCkSxLHnyVEGbM66V/Y9g
Date:   Mon, 9 Jan 2023 09:57:43 +0000
Message-ID: <OS0PR01MB592206FB90733D1A62B9F6B986FE9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20221216205028.340795-1-biju.das.jz@bp.renesas.com>
 <20221216205028.340795-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20221216205028.340795-3-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYWPR01MB9923:EE_
x-ms-office365-filtering-correlation-id: 6ad10d13-7d67-410f-db1a-08daf227f3c8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iIc/J2Y2D0kL4yn42b9Walwwm4m0c/R3hfKgeF+8wDwB46PHVOAfY4SyQFGj9z3y+Jiy6YeMR9SMORwkZPvr83gRr+SV0FlnPqtgPsgBLdm5s0/6clqzpXPAZUju8gFVLXRPSGp0fC4bf9LVOljQeNAIgvIqmQGWOR7PADd2CCMGBHn5KRJZVyVabV+lNp0l2uoFiHFZiyhu0hvKC7S+9ca0byJRD/pQ2Qrj+BI2dgfxVb99B6I0ivbLbrGEJO5ag1ViUCdJlJLnqCPcmYEKw1jkM+SfsxPF/AaKLjKSa4ad6awvU8PNFUztMn29c/kfVXrUgmQCvHukWEZWaG/YvMp7HzLdkuT+azBLWXjGszNaYeW5aaXbHAEU9dEL0PPV53YIfEqAMAEvFYl+Du8BKrjrdBKvWX1oAfEWC5vCyWkhDvQw9TEvCYxWtzHgsiNaIq4HLvGu8K6vGgye3SXQdCJcsuHRFsPTQC6hakulIsoPFHG2q1eQjg7ek/anfDcFj0S9fwrz1+uHRbBgZFhABwDackzEFdsRzsEAzH0Wh6U+frbq9t9VOlzeAA7fsYUl8tQCCvIs73eVSfT3ZKIVOUyIRDFV0SQYhkLVi76OqcOSBZ2aHBWqh7ctzq18EEbGfD4oLvmVWsQ0sqbNqIq1FKwsL9ygvYFFv0XkoKIISkILTk0FZlbN3mOpYwDykZJtvZenEYk6+9OQ7rPSUjxYmsMwEtm1XTZrGDIl9qJ2rfQ/02j1jDAKAcQFuQl+BU2K4lXtu0QQWn3UxkPIvyYL5/EQSkiQqb6gzqvQQ7Xa2is=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(396003)(376002)(346002)(366004)(451199015)(52536014)(2906002)(8936002)(5660300002)(30864003)(66556008)(41300700001)(8676002)(66946007)(66446008)(66476007)(76116006)(64756008)(316002)(71200400001)(7696005)(110136005)(54906003)(4326008)(33656002)(966005)(53546011)(26005)(478600001)(6506007)(9686003)(186003)(55016003)(86362001)(83380400001)(38070700005)(122000001)(38100700002)(32563001)(559001)(579004)(309714004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MKSxdXlmOmIETrMhhMzGnxd9/QSTYNxgjsUP5fqP4xi2L0x17j82Igd44UL3?=
 =?us-ascii?Q?7F/bAfMR+xZ6oKdyPRJIKm37gAOFstP3gCQYyrWUpOvR5FQoSqEi63MnZ6sV?=
 =?us-ascii?Q?OI3fI/z5/KlWycvHJXLycZfoONckbcoRjB58Gh6VWW4YCSar0qWGpStNsehv?=
 =?us-ascii?Q?5HAUSwtATbeaGoVdgUXbDTGY1uIK56jKfy4HZvlPtC6gcASlF0quU5rL03Yb?=
 =?us-ascii?Q?BMxYAOK0pMQsnv378rxq2YfalWkJQxDuNyUD6y7LXxLwqcrHHo4Ujodd+zbo?=
 =?us-ascii?Q?eAnrDx4JUObN7Laz0DzYKiBRbOIqyL4LEP7bqXNqWiWouFPd7eJF6ZuaQzgA?=
 =?us-ascii?Q?ACQUOlju+vlfl4belNK/45ImTmGO8tTNrlmhUTGrYdb+T4+ZMEnyR1Ef7jxI?=
 =?us-ascii?Q?jpCEDMj7mjcwa8055OCJmE6wURN0gFGgkTOKZF60UjgogmKWtr0p06p1ZYbs?=
 =?us-ascii?Q?oVxsxiL1rHkV9YjBcsiDc/P+tGeAyfdThO48741MlEcMJMgW/LtDPovJN9ui?=
 =?us-ascii?Q?1u3MroSvf+1fsiSOCuTuKjSdsNKC6CUuMBwkrBFdTJqD0k7OZtjhfjarf51u?=
 =?us-ascii?Q?SvJtO1C2+njyWI9rP+3ssvahwX23f89I3tfZRJ/8AyX4y7t0bctVe+3IoxJb?=
 =?us-ascii?Q?hWkCCRy20CT2bPhhVr7lc+17qbWgNNwTLXh2csj/WzXFBlHrJR5v0SDy7O2t?=
 =?us-ascii?Q?TcvKSlIdtOgOPAWp+CrhZSpZJYOmoXv9tC6yefuQMCBawfaEols8KeDu/Hdv?=
 =?us-ascii?Q?zUjvCeRDhVb1lk3XIwcg1isnRDui4kO6msHoiIi8fuO24t93cblfCRMzudxa?=
 =?us-ascii?Q?fdK2oeTJoPqnZ3ktbCnAaOrzz3Pf+7ikCgt9k3rVYF+S1oWl3rhv6q3/4yOP?=
 =?us-ascii?Q?asCwywnL+X4xJB51tAiAW3x0kCZi3Rw5swUUDTgzPBHKCaPQIoWWA53QPjPm?=
 =?us-ascii?Q?gjqKQLa+hEB41M3isONePU+yLo63/yiIjd0rLVuu02QvcA+KBxeiSZs0XHnn?=
 =?us-ascii?Q?qi2Xf3gTuzuCHo/ydiDKKgpkQS2g9yZ9XY5nnwRf73nzmhu8b4DblRND9GzV?=
 =?us-ascii?Q?zIppfJiKA3g/dL+2RFK0Y98NDnR+ZPtxH/ltXlM4GFOwa+5tzpcy+D402TFm?=
 =?us-ascii?Q?j/BdKBGgj2ZjcGNpDEu2h0Wfl46cR32x3UHr6JbWBdNDK8hG/TbhwLwc/l02?=
 =?us-ascii?Q?3/EoLRGo95jl3geSdZSrGQh9budWQ9OqwgQ+fLRQs+0KEOaU3tn7IwuRsrRL?=
 =?us-ascii?Q?HcMHIo43gqZfW0IvZtFKeYY5CDllTyo+CWlBsmV/l/JQ/FRjscRPIeWp9I53?=
 =?us-ascii?Q?FTiuUxQ5NAkQmpUORnbaGQf7XuzS2kKdBBNMUVBvtr4lS0ob2mNrkCQbC8Kl?=
 =?us-ascii?Q?yb3sCc6wGEFcyS1ANEv5ndq4cv02TbMuDY+fbNwaaK5lP5pR7Hhz98cr0UFz?=
 =?us-ascii?Q?+7isqYSUoseGzEioquANTb6QVivSKYr/1Pg7dg6k/7v4SvNQTY7hYlYOuUJn?=
 =?us-ascii?Q?pLPnILVxw1EgR3TFD/JSg0sKqcqOayZVjnFSMY6XIC6BWKFWCmCxpPofDUTF?=
 =?us-ascii?Q?KXPZ4wt/Z0DmA7tzi/tAzgYMfmTSXwv+eJPLyodUlbDn43UFXOPO9fNYuzLO?=
 =?us-ascii?Q?Tw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ad10d13-7d67-410f-db1a-08daf227f3c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2023 09:57:43.3550
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mCD4yU48YUohkoRtsGq3itymZjyBuGkyTktI2HKpMu0P3mrmWiWTnx6Mgz0adJCer9cRoGVL95eg+0o1dC6vMK181BN8ezqAXkMIgq0hrWU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9923
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Daniel Lezcano, Thomas Gleixner and Timer folks,

Gentle ping for reviewing the core driver.=20

Cheers,
Biju

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: 16 December 2022 20:50
> To: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Biju Das <biju.das.jz@bp.renesas.com>; Daniel Lezcano
> <daniel.lezcano@linaro.org>; Thomas Gleixner <tglx@linutronix.de>; Geert
> Uytterhoeven <geert+renesas@glider.be>; Chris Paterson
> <Chris.Paterson2@renesas.com>; Prabhakar Mahadev Lad <prabhakar.mahadev-
> lad.rj@bp.renesas.com>; linux-renesas-soc@vger.kernel.org
> Subject: [PATCH v10 2/5] clocksource/drivers: Add Renesas RZ/G2L MTU3a co=
re
> driver
>=20
> The RZ/G2L multi-function timer pulse unit 3 (MTU3a) is embedded in the
> Renesas RZ/G2L family SoCs. It consists of eight 16-bit timer channels an=
d
> one 32-bit timer channel. It supports the following functions
>  - Counter
>  - Timer
>  - PWM
>=20
> The 8/16/32 bit registers are mixed in each channel.
>=20
> Add MTU3a core driver for RZ/G2L SoC. The core driver shares the clk and
> channel register access for the other child devices like Counter, PWM and
> Clock event.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> Ref:
> https://patchwork.kernel.org/project/linux-renesas-soc/patch/202210101452=
22.1047748-2-biju.das.jz@bp.renesas.com/
>=20
> v9->v10:
>  * No change.
> v8->v9:
>  * No change.
> v7->v8:
>  * Add locking for RMW on rz_mtu3_shared_reg_update_bit()
>  * Replaced enum rz_mtu3_functions with channel busy flag
>  * Added API for request and release a channel.
> v6->v7:
>  * Added channel specific mutex to avoid races between child devices
>    (for eg: pwm and counter)
>  * Added rz_mtu3_shared_reg_update_bit() to update bit.
> v5->v6:
>  * Updated commit and KConfig description
>  * Selected MFD_CORE to avoid build error if CONFIG_MFD_CORE not set.
>  * Improved error handling in probe().
>  * Updated MODULE_DESCRIPTION and title.
> v4->v5:
>  * Moved core driver from MFD to timer
>  * Child devices instatiated using mfd_add_devices()
> v3->v4:
>  * A single driver that registers both the counter and the pwm
> functionalities
>    that binds against "renesas,rz-mtu3".
>  * Moved PM handling from child devices to here.
>  * replaced include/linux/mfd/rz-mtu3.h->drivers/mfd/rz-mtu3.h
>  * Removed "remove" callback
> v2->v3:
>  * removed unwanted header files
>  * Added LUT for 32 bit registers as it needed for 32-bit cascade countin=
g.
>  * Exported 32 bit read/write functions.
> v1->v2:
>  * Changed the compatible name
>  * Replaced devm_reset_control_get->devm_reset_control_get_exclusive
>  * Renamed function names rzg2l_mtu3->rz_mtu3 as this is generic IP
>    in RZ family SoC's.
> ---
>  drivers/clocksource/Kconfig   |  11 +
>  drivers/clocksource/Makefile  |   1 +
>  drivers/clocksource/rz-mtu3.c | 459 ++++++++++++++++++++++++++++++++++
>  include/clocksource/rz-mtu3.h | 237 ++++++++++++++++++
>  4 files changed, 708 insertions(+)
>  create mode 100644 drivers/clocksource/rz-mtu3.c  create mode 100644
> include/clocksource/rz-mtu3.h
>=20
> diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig in=
dex
> 4469e7f555e9..cd7d549d18f3 100644
> --- a/drivers/clocksource/Kconfig
> +++ b/drivers/clocksource/Kconfig
> @@ -524,6 +524,17 @@ config SH_TIMER_MTU2
>  	  Timer Pulse Unit 2 (MTU2) hardware available on SoCs from Renesas.
>  	  This hardware comes with 16-bit timer registers.
>=20
> +config RZ_MTU3
> +	bool "Renesas RZ/G2L MTU3a core driver"
> +	select MFD_CORE
> +	depends on (ARCH_RZG2L && OF) || COMPILE_TEST
> +	help
> +	  Select this option to enable Renesas RZ/G2L MTU3a core driver for
> +	  the Multi-Function Timer Pulse Unit 3 (MTU3a) hardware available
> +	  on SoCs from Renesas. The core driver shares the clk and channel
> +	  register access for the other child devices like Counter, PWM,
> +	  Clock Source, and Clock event.
> +
>  config RENESAS_OSTM
>  	bool "Renesas OSTM timer driver"
>  	depends on ARCH_RENESAS || COMPILE_TEST diff --git
> a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile index
> 64ab547de97b..9ffb46614d98 100644
> --- a/drivers/clocksource/Makefile
> +++ b/drivers/clocksource/Makefile
> @@ -10,6 +10,7 @@ obj-$(CONFIG_CS5535_CLOCK_EVENT_SRC)	+=3D timer-cs5535.=
o
>  obj-$(CONFIG_CLKSRC_JCORE_PIT)		+=3D jcore-pit.o
>  obj-$(CONFIG_SH_TIMER_CMT)	+=3D sh_cmt.o
>  obj-$(CONFIG_SH_TIMER_MTU2)	+=3D sh_mtu2.o
> +obj-$(CONFIG_RZ_MTU3)		+=3D rz-mtu3.o
>  obj-$(CONFIG_RENESAS_OSTM)	+=3D renesas-ostm.o
>  obj-$(CONFIG_SH_TIMER_TMU)	+=3D sh_tmu.o
>  obj-$(CONFIG_EM_TIMER_STI)	+=3D em_sti.o
> diff --git a/drivers/clocksource/rz-mtu3.c b/drivers/clocksource/rz-mtu3.=
c
> new file mode 100644 index 000000000000..b7d3bb9f3dc3
> --- /dev/null
> +++ b/drivers/clocksource/rz-mtu3.c
> @@ -0,0 +1,459 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Renesas RZ/G2L Multi-Function Timer Pulse Unit 3(MTU3a) Core driver
> + *
> + * Copyright (C) 2022 Renesas Electronics Corporation  */
> +
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/interrupt.h>
> +#include <linux/irq.h>
> +#include <linux/mfd/core.h>
> +#include <linux/of_platform.h>
> +#include <linux/reset.h>
> +#include <linux/spinlock.h>
> +
> +#include <clocksource/rz-mtu3.h>
> +
> +static const unsigned long rz_mtu3_8bit_ch_reg_offs[][13] =3D {
> +	{
> +		[RZ_MTU3_TIER] =3D 0x4, [RZ_MTU3_NFCR] =3D 0x70,
> +		[RZ_MTU3_TCR] =3D 0x0, [RZ_MTU3_TCR2] =3D 0x28,
> +		[RZ_MTU3_TMDR1] =3D 0x1, [RZ_MTU3_TIORH] =3D 0x2,
> +		[RZ_MTU3_TIORL] =3D 0x3
> +	},
> +	{
> +		[RZ_MTU3_TIER] =3D 0x4, [RZ_MTU3_NFCR] =3D 0xef,
> +		[RZ_MTU3_TSR] =3D 0x5, [RZ_MTU3_TCR] =3D 0x0,
> +		[RZ_MTU3_TCR2] =3D 0x14, [RZ_MTU3_TMDR1] =3D 0x1,
> +		[RZ_MTU3_TIOR] =3D 0x2
> +	},
> +	{
> +		[RZ_MTU3_TIER] =3D 0x4, [RZ_MTU3_NFCR] =3D 0x16e,
> +		[RZ_MTU3_TSR] =3D 0x5, [RZ_MTU3_TCR] =3D 0x0,
> +		[RZ_MTU3_TCR2] =3D 0xc, [RZ_MTU3_TMDR1] =3D 0x1,
> +		[RZ_MTU3_TIOR] =3D 0x2
> +	},
> +	{
> +		[RZ_MTU3_TIER] =3D 0x8, [RZ_MTU3_NFCR] =3D 0x93,
> +		[RZ_MTU3_TSR] =3D 0x2c, [RZ_MTU3_TCR] =3D 0x0,
> +		[RZ_MTU3_TCR2] =3D 0x4c, [RZ_MTU3_TMDR1] =3D 0x2,
> +		[RZ_MTU3_TIORH] =3D 0x4, [RZ_MTU3_TIORL] =3D 0x5,
> +		[RZ_MTU3_TBTM] =3D 0x38
> +	},
> +	{
> +		[RZ_MTU3_TIER] =3D 0x8, [RZ_MTU3_NFCR] =3D 0x93,
> +		[RZ_MTU3_TSR] =3D 0x2c, [RZ_MTU3_TCR] =3D 0x0,
> +		[RZ_MTU3_TCR2] =3D 0x4c, [RZ_MTU3_TMDR1] =3D 0x2,
> +		[RZ_MTU3_TIORH] =3D 0x5, [RZ_MTU3_TIORL] =3D 0x6,
> +		[RZ_MTU3_TBTM] =3D 0x38
> +	},
> +	{
> +		[RZ_MTU3_TIER] =3D 0x32, [RZ_MTU3_NFCR] =3D 0x1eb,
> +		[RZ_MTU3_TSTR] =3D 0x34, [RZ_MTU3_TCNTCMPCLR] =3D 0x36,
> +		[RZ_MTU3_TCRU] =3D 0x4, [RZ_MTU3_TCR2U] =3D 0x5,
> +		[RZ_MTU3_TIORU] =3D 0x6, [RZ_MTU3_TCRV] =3D 0x14,
> +		[RZ_MTU3_TCR2V] =3D 0x15, [RZ_MTU3_TIORV] =3D 0x16,
> +		[RZ_MTU3_TCRW] =3D 0x24, [RZ_MTU3_TCR2W] =3D 0x25,
> +		[RZ_MTU3_TIORW] =3D 0x26
> +	},
> +	{
> +		[RZ_MTU3_TIER] =3D 0x8, [RZ_MTU3_NFCR] =3D 0x93,
> +		[RZ_MTU3_TSR] =3D 0x2c, [RZ_MTU3_TCR] =3D 0x0,
> +		[RZ_MTU3_TCR2] =3D 0x4c, [RZ_MTU3_TMDR1] =3D 0x2,
> +		[RZ_MTU3_TIORH] =3D 0x4, [RZ_MTU3_TIORL] =3D 0x5,
> +		[RZ_MTU3_TBTM] =3D 0x38
> +	},
> +	{
> +		[RZ_MTU3_TIER] =3D 0x8, [RZ_MTU3_NFCR] =3D 0x93,
> +		[RZ_MTU3_TSR] =3D 0x2c, [RZ_MTU3_TCR] =3D 0x0,
> +		[RZ_MTU3_TCR2] =3D 0x4c, [RZ_MTU3_TMDR1] =3D 0x2,
> +		[RZ_MTU3_TIORH] =3D 0x5, [RZ_MTU3_TIORL] =3D 0x6,
> +		[RZ_MTU3_TBTM] =3D 0x38
> +	},
> +	{
> +		[RZ_MTU3_TIER] =3D 0x4, [RZ_MTU3_NFCR] =3D 0x368,
> +		[RZ_MTU3_TCR] =3D 0x0, [RZ_MTU3_TCR2] =3D 0x6,
> +		[RZ_MTU3_TMDR1] =3D 0x1, [RZ_MTU3_TIORH] =3D 0x2,
> +		[RZ_MTU3_TIORL] =3D 0x3
> +	}
> +};
> +
> +static const unsigned long rz_mtu3_16bit_ch_reg_offs[][12] =3D {
> +	{
> +		[RZ_MTU3_TCNT] =3D 0x6, [RZ_MTU3_TGRA] =3D 0x8,
> +		[RZ_MTU3_TGRB] =3D 0xa, [RZ_MTU3_TGRC] =3D 0xc,
> +		[RZ_MTU3_TGRD] =3D 0xe, [RZ_MTU3_TGRE] =3D 0x20,
> +		[RZ_MTU3_TGRF] =3D 0x22
> +	},
> +	{
> +		[RZ_MTU3_TCNT] =3D 0x6, [RZ_MTU3_TGRA] =3D 0x8,
> +		[RZ_MTU3_TGRB] =3D 0xa
> +	},
> +	{
> +		[RZ_MTU3_TCNT] =3D 0x6, [RZ_MTU3_TGRA] =3D 0x8,
> +		[RZ_MTU3_TGRB] =3D 0xa
> +	},
> +	{
> +		[RZ_MTU3_TCNT] =3D 0x10, [RZ_MTU3_TGRA] =3D 0x18,
> +		[RZ_MTU3_TGRB] =3D 0x1a, [RZ_MTU3_TGRC] =3D 0x24,
> +		[RZ_MTU3_TGRD] =3D 0x26, [RZ_MTU3_TGRE] =3D 0x72
> +	},
> +	{
> +		[RZ_MTU3_TCNT] =3D 0x11, [RZ_MTU3_TGRA] =3D 0x1b,
> +		[RZ_MTU3_TGRB] =3D 0x1d, [RZ_MTU3_TGRC] =3D 0x27,
> +		[RZ_MTU3_TGRD] =3D 0x29, [RZ_MTU3_TGRE] =3D 0x73,
> +		[RZ_MTU3_TGRF] =3D 0x75, [RZ_MTU3_TADCR] =3D 0x3f,
> +		[RZ_MTU3_TADCORA] =3D 0x43, [RZ_MTU3_TADCORB] =3D 0x45,
> +		[RZ_MTU3_TADCOBRA] =3D 0x47,
> +		[RZ_MTU3_TADCOBRB] =3D 0x49
> +	},
> +	{
> +		[RZ_MTU3_TCNTU] =3D 0x0, [RZ_MTU3_TGRU] =3D 0x2,
> +		[RZ_MTU3_TCNTV] =3D 0x10, [RZ_MTU3_TGRV] =3D 0x12,
> +		[RZ_MTU3_TCNTW] =3D 0x20, [RZ_MTU3_TGRW] =3D 0x22
> +	},
> +	{
> +		[RZ_MTU3_TCNT] =3D 0x10, [RZ_MTU3_TGRA] =3D 0x18,
> +		[RZ_MTU3_TGRB] =3D 0x1a, [RZ_MTU3_TGRC] =3D 0x24,
> +		[RZ_MTU3_TGRD] =3D 0x26, [RZ_MTU3_TGRE] =3D 0x72
> +	},
> +	{
> +		[RZ_MTU3_TCNT] =3D 0x11, [RZ_MTU3_TGRA] =3D 0x1b,
> +		[RZ_MTU3_TGRB] =3D 0x1d, [RZ_MTU3_TGRC] =3D 0x27,
> +		[RZ_MTU3_TGRD] =3D 0x29, [RZ_MTU3_TGRE] =3D 0x73,
> +		[RZ_MTU3_TGRF] =3D 0x75, [RZ_MTU3_TADCR] =3D 0x3f,
> +		[RZ_MTU3_TADCORA] =3D 0x43, [RZ_MTU3_TADCORB] =3D 0x45,
> +		[RZ_MTU3_TADCOBRA] =3D 0x47,
> +		[RZ_MTU3_TADCOBRB] =3D 0x49
> +	},
> +};
> +
> +static const unsigned long rz_mtu3_32bit_ch_reg_offs[][5] =3D {
> +	{
> +		[RZ_MTU3_TCNTLW] =3D 0x20, [RZ_MTU3_TGRALW] =3D 0x24,
> +		[RZ_MTU3_TGRBLW] =3D 0x28
> +	},
> +	{	[RZ_MTU3_TCNT] =3D 0x8, [RZ_MTU3_TGRA] =3D 0xc,
> +		[RZ_MTU3_TGRB] =3D 0x10, [RZ_MTU3_TGRC] =3D 0x14,
> +		[RZ_MTU3_TGRD] =3D 0x18
> +	}
> +};
> +
> +static bool rz_mtu3_is_16bit_shared_reg(u16 off) {
> +	return (off =3D=3D RZ_MTU3_TDDRA || off =3D=3D RZ_MTU3_TDDRB ||
> +		off =3D=3D RZ_MTU3_TCDRA || off =3D=3D RZ_MTU3_TCDRB ||
> +		off =3D=3D RZ_MTU3_TCBRA || off =3D=3D RZ_MTU3_TCBRB ||
> +		off =3D=3D RZ_MTU3_TCNTSA || off =3D=3D RZ_MTU3_TCNTSB); }
> +
> +u16 rz_mtu3_shared_reg_read(struct rz_mtu3_channel *ch, u16 off) {
> +	struct rz_mtu3 *mtu =3D dev_get_drvdata(ch->dev->parent);
> +
> +	if (rz_mtu3_is_16bit_shared_reg(off))
> +		return readw(mtu->mmio + off);
> +	else
> +		return readb(mtu->mmio + off);
> +}
> +EXPORT_SYMBOL_GPL(rz_mtu3_shared_reg_read);
> +
> +u8 rz_mtu3_8bit_ch_read(struct rz_mtu3_channel *ch, u16 off) {
> +	u16 ch_offs;
> +
> +	ch_offs =3D rz_mtu3_8bit_ch_reg_offs[ch->index][off];
> +	if (off !=3D RZ_MTU3_TCR && ch_offs =3D=3D 0)
> +		return -EINVAL;
> +
> +	/*
> +	 * NFCR register addresses on MTU{0,1,2,5,8} channels are smaller than
> +	 * channel's base address.
> +	 */
> +	if (off =3D=3D RZ_MTU3_NFCR && (ch->index <=3D RZ_MTU2 ||
> +				    ch->index =3D=3D RZ_MTU5 ||
> +				    ch->index =3D=3D RZ_MTU8))
> +		return readb(ch->base - ch_offs);
> +	else
> +		return readb(ch->base + ch_offs);
> +}
> +EXPORT_SYMBOL_GPL(rz_mtu3_8bit_ch_read);
> +
> +u16 rz_mtu3_16bit_ch_read(struct rz_mtu3_channel *ch, u16 off) {
> +	u16 ch_offs;
> +
> +	/* MTU8 doesn't have 16-bit registers */
> +	if (ch->index =3D=3D RZ_MTU8)
> +		return 0;
> +
> +	ch_offs =3D rz_mtu3_16bit_ch_reg_offs[ch->index][off];
> +	if (ch->index !=3D RZ_MTU5 && off !=3D RZ_MTU3_TCNTU && ch_offs =3D=3D =
0)
> +		return 0;
> +
> +	return readw(ch->base + ch_offs);
> +}
> +EXPORT_SYMBOL_GPL(rz_mtu3_16bit_ch_read);
> +
> +u32 rz_mtu3_32bit_ch_read(struct rz_mtu3_channel *ch, u16 off) {
> +	u16 ch_offs;
> +
> +	if (ch->index =3D=3D RZ_MTU1)
> +		ch_offs =3D rz_mtu3_32bit_ch_reg_offs[0][off];
> +	else if (ch->index =3D=3D RZ_MTU8)
> +		ch_offs =3D rz_mtu3_32bit_ch_reg_offs[1][off];
> +
> +	if (!ch_offs)
> +		return -EINVAL;
> +
> +	return readl(ch->base + ch_offs);
> +}
> +EXPORT_SYMBOL_GPL(rz_mtu3_32bit_ch_read);
> +
> +void rz_mtu3_8bit_ch_write(struct rz_mtu3_channel *ch, u16 off, u8 val)
> +{
> +	u16 ch_offs;
> +
> +	ch_offs =3D rz_mtu3_8bit_ch_reg_offs[ch->index][off];
> +	if (ch->index !=3D RZ_MTU5 && off !=3D RZ_MTU3_TCR && ch_offs =3D=3D 0)
> +		return;
> +
> +	/*
> +	 * NFCR register addresses on MTU{0,1,2,5,8} channels are smaller than
> +	 * channel's base address.
> +	 */
> +	if (off =3D=3D RZ_MTU3_NFCR && (ch->index <=3D RZ_MTU2 ||
> +				    ch->index =3D=3D RZ_MTU5 ||
> +				    ch->index =3D=3D RZ_MTU8))
> +		writeb(val, ch->base - ch_offs);
> +	else
> +		writeb(val, ch->base + ch_offs);
> +}
> +EXPORT_SYMBOL_GPL(rz_mtu3_8bit_ch_write);
> +
> +void rz_mtu3_16bit_ch_write(struct rz_mtu3_channel *ch, u16 off, u16
> +val) {
> +	u16 ch_offs;
> +
> +	/* MTU8 doesn't have 16-bit registers */
> +	if (ch->index =3D=3D RZ_MTU8)
> +		return;
> +
> +	ch_offs =3D rz_mtu3_16bit_ch_reg_offs[ch->index][off];
> +	if (ch->index !=3D RZ_MTU5 && off !=3D RZ_MTU3_TCNTU && ch_offs =3D=3D =
0)
> +		return;
> +
> +	writew(val, ch->base + ch_offs);
> +}
> +EXPORT_SYMBOL_GPL(rz_mtu3_16bit_ch_write);
> +
> +void rz_mtu3_32bit_ch_write(struct rz_mtu3_channel *ch, u16 off, u32
> +val) {
> +	u16 ch_offs;
> +
> +	if (ch->index =3D=3D RZ_MTU1)
> +		ch_offs =3D rz_mtu3_32bit_ch_reg_offs[0][off];
> +	else if (ch->index =3D=3D RZ_MTU8)
> +		ch_offs =3D rz_mtu3_32bit_ch_reg_offs[1][off];
> +
> +	if (!ch_offs)
> +		return;
> +
> +	writel(val, ch->base + ch_offs);
> +}
> +EXPORT_SYMBOL_GPL(rz_mtu3_32bit_ch_write);
> +
> +void rz_mtu3_shared_reg_write(struct rz_mtu3_channel *ch, u16 off, u16
> +value) {
> +	struct rz_mtu3 *mtu =3D dev_get_drvdata(ch->dev->parent);
> +
> +	if (rz_mtu3_is_16bit_shared_reg(off))
> +		writew(value, mtu->mmio + off);
> +	else
> +		writeb((u8)value, mtu->mmio + off);
> +}
> +EXPORT_SYMBOL_GPL(rz_mtu3_shared_reg_write);
> +
> +void rz_mtu3_shared_reg_update_bit(struct rz_mtu3_channel *ch, u16 off,
> +				   u16 pos, u8 val)
> +{
> +	struct rz_mtu3 *mtu =3D dev_get_drvdata(ch->dev->parent);
> +	unsigned long tmdr, flags;
> +
> +	raw_spin_lock_irqsave(&mtu->lock, flags);
> +	tmdr =3D rz_mtu3_shared_reg_read(ch, off);
> +	__assign_bit(pos, &tmdr, !!val);
> +	rz_mtu3_shared_reg_write(ch, off, tmdr);
> +	raw_spin_unlock_irqrestore(&mtu->lock, flags); }
> +EXPORT_SYMBOL_GPL(rz_mtu3_shared_reg_update_bit);
> +
> +static void rz_mtu3_start_stop_ch(struct rz_mtu3_channel *ch, bool
> +start) {
> +	struct rz_mtu3 *mtu =3D dev_get_drvdata(ch->dev->parent);
> +	unsigned long flags, value;
> +	u8 offs;
> +
> +	/* start stop register shared by multiple timer channels */
> +	raw_spin_lock_irqsave(&mtu->lock, flags);
> +
> +	if (ch->index =3D=3D RZ_MTU6 || ch->index =3D=3D RZ_MTU7) {
> +		value =3D rz_mtu3_shared_reg_read(ch, RZ_MTU3_TSTRB);
> +		if (start)
> +			value |=3D 1 << ch->index;
> +		else
> +			value &=3D ~(1 << ch->index);
> +		rz_mtu3_shared_reg_write(ch, RZ_MTU3_TSTRB, value);
> +	} else if (ch->index !=3D RZ_MTU5) {
> +		value =3D rz_mtu3_shared_reg_read(ch, RZ_MTU3_TSTRA);
> +		if (ch->index =3D=3D RZ_MTU8)
> +			offs =3D 0x08;
> +		else if (ch->index < RZ_MTU3)
> +			offs =3D 1 << ch->index;
> +		else
> +			offs =3D 1 << (ch->index + 3);
> +		if (start)
> +			value |=3D offs;
> +		else
> +			value &=3D ~offs;
> +		rz_mtu3_shared_reg_write(ch, RZ_MTU3_TSTRA, value);
> +	}
> +
> +	raw_spin_unlock_irqrestore(&mtu->lock, flags); }
> +
> +bool rz_mtu3_is_enabled(struct rz_mtu3_channel *ch) {
> +	struct rz_mtu3 *mtu =3D dev_get_drvdata(ch->dev->parent);
> +	unsigned long flags, value;
> +	bool ret =3D false;
> +	u8 offs;
> +
> +	/* start stop register shared by multiple timer channels */
> +	raw_spin_lock_irqsave(&mtu->lock, flags);
> +
> +	if (ch->index =3D=3D RZ_MTU6 || ch->index =3D=3D RZ_MTU7) {
> +		value =3D rz_mtu3_shared_reg_read(ch, RZ_MTU3_TSTRB);
> +		ret =3D value & (1 << ch->index);
> +	} else if (ch->index !=3D RZ_MTU5) {
> +		value =3D rz_mtu3_shared_reg_read(ch, RZ_MTU3_TSTRA);
> +		if (ch->index =3D=3D RZ_MTU8)
> +			offs =3D 0x08;
> +		else if (ch->index < RZ_MTU3)
> +			offs =3D 1 << ch->index;
> +		else
> +			offs =3D 1 << (ch->index + 3);
> +
> +		ret =3D value & offs;
> +	}
> +
> +	raw_spin_unlock_irqrestore(&mtu->lock, flags);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(rz_mtu3_is_enabled);
> +
> +int rz_mtu3_enable(struct rz_mtu3_channel *ch) {
> +	/* enable channel */
> +	rz_mtu3_start_stop_ch(ch, true);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(rz_mtu3_enable);
> +
> +void rz_mtu3_disable(struct rz_mtu3_channel *ch) {
> +	/* disable channel */
> +	rz_mtu3_start_stop_ch(ch, false);
> +}
> +EXPORT_SYMBOL_GPL(rz_mtu3_disable);
> +
> +static const unsigned int ch_reg_offsets[] =3D {
> +	0x100, 0x180, 0x200, 0x000, 0x001, 0xa80, 0x800, 0x801, 0x400 };
> +
> +static void rz_mtu3_reset_assert(void *data) {
> +	struct rz_mtu3 *mtu =3D dev_get_drvdata(data);
> +
> +	mfd_remove_devices(data);
> +	reset_control_assert(mtu->rstc);
> +}
> +
> +static const struct mfd_cell rz_mtu3_devs[] =3D {
> +	{
> +		.name =3D "rz-mtu3-counter",
> +	},
> +	{
> +		.name =3D "pwm-rz-mtu3",
> +	},
> +};
> +
> +static int rz_mtu3_probe(struct platform_device *pdev) {
> +	struct rz_mtu3 *ddata;
> +	unsigned int i;
> +	int ret;
> +
> +	ddata =3D devm_kzalloc(&pdev->dev, sizeof(*ddata), GFP_KERNEL);
> +	if (!ddata)
> +		return -ENOMEM;
> +
> +	ddata->mmio =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(ddata->mmio))
> +		return PTR_ERR(ddata->mmio);
> +
> +	ddata->rstc =3D devm_reset_control_get_exclusive(&pdev->dev, NULL);
> +	if (IS_ERR(ddata->rstc))
> +		return PTR_ERR(ddata->rstc);
> +
> +	ddata->clk =3D devm_clk_get(&pdev->dev, NULL);
> +	if (IS_ERR(ddata->clk))
> +		return PTR_ERR(ddata->clk);
> +
> +	reset_control_deassert(ddata->rstc);
> +	raw_spin_lock_init(&ddata->lock);
> +	platform_set_drvdata(pdev, ddata);
> +
> +	for (i =3D 0; i < RZ_MTU_NUM_CHANNELS; i++) {
> +		ddata->channels[i].index =3D i;
> +		ddata->channels[i].is_busy =3D false;
> +		ddata->channels[i].base =3D ddata->mmio + ch_reg_offsets[i];
> +		mutex_init(&ddata->channels[i].lock);
> +	}
> +
> +	ret =3D mfd_add_devices(&pdev->dev, 0, rz_mtu3_devs,
> +			      ARRAY_SIZE(rz_mtu3_devs), NULL, 0, NULL);
> +	if (ret < 0)
> +		goto err_assert;
> +
> +	return devm_add_action_or_reset(&pdev->dev, rz_mtu3_reset_assert,
> +					&pdev->dev);
> +
> +err_assert:
> +	reset_control_assert(ddata->rstc);
> +	return ret;
> +}
> +
> +static const struct of_device_id rz_mtu3_of_match[] =3D {
> +	{ .compatible =3D "renesas,rz-mtu3", },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, rz_mtu3_of_match);
> +
> +static struct platform_driver rz_mtu3_driver =3D {
> +	.probe =3D rz_mtu3_probe,
> +	.driver	=3D {
> +		.name =3D "rz-mtu3",
> +		.of_match_table =3D rz_mtu3_of_match,
> +	},
> +};
> +module_platform_driver(rz_mtu3_driver);
> +
> +MODULE_AUTHOR("Biju Das <biju.das.jz@bp.renesas.com>");
> +MODULE_DESCRIPTION("Renesas RZ/G2L MTU3a Core Driver");
> +MODULE_LICENSE("GPL");
> diff --git a/include/clocksource/rz-mtu3.h b/include/clocksource/rz-mtu3.=
h
> new file mode 100644 index 000000000000..43b87186348b
> --- /dev/null
> +++ b/include/clocksource/rz-mtu3.h
> @@ -0,0 +1,237 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2022 Renesas Electronics Corporation  */ #ifndef
> +__LINUX_RZ_MTU3_H__ #define __LINUX_RZ_MTU3_H__
> +
> +#include <linux/clk.h>
> +
> +/* 8-bit shared register offsets macros */
> +#define RZ_MTU3_TSTRA	0x080 /* Timer start register A */
> +#define RZ_MTU3_TSTRB	0x880 /* Timer start register B */
> +
> +/* 16-bit shared register offset macros */
> +#define RZ_MTU3_TDDRA	0x016 /* Timer dead time data register A */
> +#define RZ_MTU3_TDDRB	0x816 /* Timer dead time data register B */
> +#define RZ_MTU3_TCDRA	0x014 /* Timer cycle data register A */
> +#define RZ_MTU3_TCDRB	0x814 /* Timer cycle data register B */
> +#define RZ_MTU3_TCBRA	0x022 /* Timer cycle buffer register A */
> +#define RZ_MTU3_TCBRB	0x822 /* Timer cycle buffer register B */
> +#define RZ_MTU3_TCNTSA	0x020 /* Timer subcounter A */
> +#define RZ_MTU3_TCNTSB	0x820 /* Timer subcounter B */
> +
> +/*
> + * MTU5 contains 3 timer counter registers and is totaly different
> + * from other channels, so we must separate its offset  */
> +
> +/* 8-bit register offset macros of MTU3 channels except MTU5 */
> +#define RZ_MTU3_TIER	0 /* Timer interrupt register */
> +#define RZ_MTU3_NFCR	1 /* Noise filter control register */
> +#define RZ_MTU3_TSR	2 /* Timer status register */
> +#define RZ_MTU3_TCR	3 /* Timer control register */
> +#define RZ_MTU3_TCR2	4 /* Timer control register 2 */
> +#define RZ_MTU3_TMDR1	5 /* Timer mode register 1 */
> +#define RZ_MTU3_TIOR	6 /* Timer I/O control register */
> +#define RZ_MTU3_TIORH	6 /* Timer I/O control register H */
> +#define RZ_MTU3_TIORL	7 /* Timer I/O control register L */
> +/* Only MTU3/4/6/7 have TBTM registers */
> +#define RZ_MTU3_TBTM	8 /* Timer buffer operation transfer mode register
> */
> +
> +/* 8-bit MTU5 register offset macros */
> +#define RZ_MTU3_TSTR		2 /* MTU5 Timer start register */
> +#define RZ_MTU3_TCNTCMPCLR	3 /* MTU5 Timer compare match clear register
> */
> +#define RZ_MTU3_TCRU		4 /* Timer control register U */
> +#define RZ_MTU3_TCR2U		5 /* Timer control register 2U */
> +#define RZ_MTU3_TIORU		6 /* Timer I/O control register U */
> +#define RZ_MTU3_TCRV		7 /* Timer control register V */
> +#define RZ_MTU3_TCR2V		8 /* Timer control register 2V */
> +#define RZ_MTU3_TIORV		9 /* Timer I/O control register V */
> +#define RZ_MTU3_TCRW		10 /* Timer control register W */
> +#define RZ_MTU3_TCR2W		11 /* Timer control register 2W */
> +#define RZ_MTU3_TIORW		12 /* Timer I/O control register W */
> +
> +/* 16-bit register offset macros of MTU3 channels except MTU5 */
> +#define RZ_MTU3_TCNT		0 /* Timer counter */
> +#define RZ_MTU3_TGRA		1 /* Timer general register A */
> +#define RZ_MTU3_TGRB		2 /* Timer general register B */
> +#define RZ_MTU3_TGRC		3 /* Timer general register C */
> +#define RZ_MTU3_TGRD		4 /* Timer general register D */
> +#define RZ_MTU3_TGRE		5 /* Timer general register E */
> +#define RZ_MTU3_TGRF		6 /* Timer general register F */
> +/* Timer A/D converter start request registers */
> +#define RZ_MTU3_TADCR		7 /* control register */
> +#define RZ_MTU3_TADCORA		8 /* cycle set register A */
> +#define RZ_MTU3_TADCORB		9 /* cycle set register B */
> +#define RZ_MTU3_TADCOBRA	10 /* cycle set buffer register A */
> +#define RZ_MTU3_TADCOBRB	11 /* cycle set buffer register B */
> +
> +/* 16-bit MTU5 register offset macros */
> +#define RZ_MTU3_TCNTU		0 /* MTU5 Timer counter U */
> +#define RZ_MTU3_TGRU		1 /* MTU5 Timer general register U */
> +#define RZ_MTU3_TCNTV		2 /* MTU5 Timer counter V */
> +#define RZ_MTU3_TGRV		3 /* MTU5 Timer general register V */
> +#define RZ_MTU3_TCNTW		4 /* MTU5 Timer counter W */
> +#define RZ_MTU3_TGRW		5 /* MTU5 Timer general register W */
> +
> +/* 32-bit register offset */
> +#define RZ_MTU3_TCNTLW		0 /* Timer longword counter */
> +#define RZ_MTU3_TGRALW		1 /* Timer longword general register A */
> +#define RZ_MTU3_TGRBLW		2 /* Timer longowrd general register B */
> +
> +#define RZ_MTU3_TMDR3		0x191 /* MTU1 Timer Mode Register 3 */
> +
> +/* Macros for setting registers */
> +#define RZ_MTU3_TCR_CCLR_TGRA	BIT(5)
> +
> +enum rz_mtu3_channels {
> +	RZ_MTU0,
> +	RZ_MTU1,
> +	RZ_MTU2,
> +	RZ_MTU3,
> +	RZ_MTU4,
> +	RZ_MTU5,
> +	RZ_MTU6,
> +	RZ_MTU7,
> +	RZ_MTU8,
> +	RZ_MTU_NUM_CHANNELS
> +};
> +
> +/**
> + * struct rz_mtu3_channel - MTU3 channel private data
> + *
> + * @dev: device handle
> + * @index: channel index
> + * @base: channel base address
> + * @lock: Lock to protect channel state
> + * @is_busy: channel state
> + */
> +struct rz_mtu3_channel {
> +	struct device *dev;
> +	unsigned int index;
> +	void __iomem *base;
> +	struct mutex lock; /* Protect channel state */
> +	bool is_busy;
> +};
> +
> +/**
> + * struct rz_mtu3 - MTU3 core private data
> + *
> + * @clk: MTU3 module clock
> + * @mmio: MTU3 module clock
> + * @lock: Lock to protect shared register access
> + * @rz_mtu3_channel: HW channels
> + */
> +struct rz_mtu3 {
> +	void *priv_rz_mtu3;
> +	void __iomem *mmio;
> +	struct clk *clk;
> +	struct reset_control *rstc;
> +	raw_spinlock_t lock; /* Protect the shared registers */
> +	struct rz_mtu3_channel channels[RZ_MTU_NUM_CHANNELS]; };
> +
> +#if IS_ENABLED(CONFIG_RZ_MTU3)
> +static inline bool rz_mtu3_request_channel(struct rz_mtu3_channel *ch)
> +{
> +	bool is_idle;
> +
> +	mutex_lock(&ch->lock);
> +	is_idle =3D !ch->is_busy;
> +	if (is_idle)
> +		ch->is_busy =3D true;
> +	mutex_unlock(&ch->lock);
> +
> +	return is_idle;
> +}
> +
> +static inline void rz_mtu3_release_channel(struct rz_mtu3_channel *ch)
> +{
> +	mutex_lock(&ch->lock);
> +	ch->is_busy =3D false;
> +	mutex_unlock(&ch->lock);
> +}
> +
> +bool rz_mtu3_is_enabled(struct rz_mtu3_channel *ch); void
> +rz_mtu3_disable(struct rz_mtu3_channel *ch); int rz_mtu3_enable(struct
> +rz_mtu3_channel *ch);
> +
> +u8 rz_mtu3_8bit_ch_read(struct rz_mtu3_channel *ch, u16 off);
> +u16 rz_mtu3_16bit_ch_read(struct rz_mtu3_channel *ch, u16 off);
> +u32 rz_mtu3_32bit_ch_read(struct rz_mtu3_channel *ch, u16 off);
> +u16 rz_mtu3_shared_reg_read(struct rz_mtu3_channel *ch, u16 off);
> +
> +void rz_mtu3_8bit_ch_write(struct rz_mtu3_channel *ch, u16 off, u8
> +val); void rz_mtu3_16bit_ch_write(struct rz_mtu3_channel *ch, u16 off,
> +u16 val); void rz_mtu3_32bit_ch_write(struct rz_mtu3_channel *ch, u16
> +off, u32 val); void rz_mtu3_shared_reg_write(struct rz_mtu3_channel
> +*ch, u16 off, u16 val); void rz_mtu3_shared_reg_update_bit(struct
> rz_mtu3_channel *ch, u16 off,
> +				   u16 pos, u8 val);
> +#else
> +static inline bool rz_mtu3_request_channel(struct rz_mtu3_channel *ch)
> +{
> +	return false;
> +}
> +
> +static inline void rz_mtu3_release_channel(struct rz_mtu3_channel *ch)
> +{ }
> +
> +static inline bool rz_mtu3_is_enabled(struct rz_mtu3_channel *ch) {
> +	return false;
> +}
> +
> +static inline void rz_mtu3_disable(struct rz_mtu3_channel *ch) { }
> +
> +static inline int rz_mtu3_enable(struct rz_mtu3_channel *ch) {
> +	return 0;
> +}
> +
> +static inline u8 rz_mtu3_8bit_ch_read(struct rz_mtu3_channel *ch, u16
> +off) {
> +	return 0;
> +}
> +
> +static inline u16 rz_mtu3_16bit_ch_read(struct rz_mtu3_channel *ch, u16
> +off) {
> +	return 0;
> +}
> +
> +static inline u32 rz_mtu3_32bit_ch_read(struct rz_mtu3_channel *ch, u16
> +off) {
> +	return 0;
> +}
> +
> +static inline u16 rz_mtu3_shared_reg_read(struct rz_mtu3_channel *ch,
> +u16 off) {
> +	return 0;
> +}
> +
> +static inline void rz_mtu3_8bit_ch_write(struct rz_mtu3_channel *ch,
> +u16 off, u8 val) { }
> +
> +static inline void rz_mtu3_16bit_ch_write(struct rz_mtu3_channel *ch,
> +u16 off, u16 val) { }
> +
> +static inline void rz_mtu3_32bit_ch_write(struct rz_mtu3_channel *ch,
> +u16 off, u32 val) { }
> +
> +static inline void rz_mtu3_shared_reg_write(struct rz_mtu3_channel *ch,
> +u16 off, u16 val) { }
> +
> +static inline void rz_mtu3_shared_reg_update_bit(struct rz_mtu3_channel
> *ch,
> +						 u16 off, u16 pos, u8 val)
> +{
> +}
> +#endif
> +
> +#endif /* __LINUX_RZ_MTU3_H__ */
> --
> 2.25.1

