Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38A392E09D2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Dec 2020 12:43:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726095AbgLVLnQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Dec 2020 06:43:16 -0500
Received: from mail-oi1-f179.google.com ([209.85.167.179]:40748 "EHLO
        mail-oi1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725985AbgLVLnP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Dec 2020 06:43:15 -0500
Received: by mail-oi1-f179.google.com with SMTP id p126so14447766oif.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Dec 2020 03:42:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C8rIrFFllj3usEihfRcUF/0wbqwGDbbQfEnNaww0THY=;
        b=HN58VO3ORvs7RJWO8d5ZngrxOLZjJnHxJCZNEds2ps0fyWQ0tCpNakkdpUTmUzsHUq
         dpPjROujjxW0cDhanFqOJSu/trR8yOc0DgpbbqKJUTQouUP9Xefna7Cc5YGRDs+FiPN1
         Mn5YrKbYj3vcPq0H4oJE3tZQwMS3dGA+1/UwDX2gCvqaR3L3lGmakcHuGl6m2HMJD5LS
         er1pSBU2pQ+98Rs7HbvbGMFKRyYbBABj70mOgz2R40WJOyCx5v33pf/xD2lYPpd5ig9C
         cb8pOl6maDXtaPUOdtoQPSqbOCDnrxPysLtIa9gPy3cnUXzV4xa43HpelzELAeEfoHm2
         dosg==
X-Gm-Message-State: AOAM531h7udY0oqkLjbP6HkfTitGkzC0G33YoefJczWELCqcVdhHh0jL
        ZcdAD666FSVyITZvWSp4yp25MaAaQ0FDHtEc40Y=
X-Google-Smtp-Source: ABdhPJynkmwV94lff1Dpe9deZhiCHf91vThIO6Me7YUCk9W7iaRkYSsyPwzHSxhFR+0NmSkATykhEvqc+G0yx3krzO4=
X-Received: by 2002:aca:ec09:: with SMTP id k9mr13904779oih.153.1608637353645;
 Tue, 22 Dec 2020 03:42:33 -0800 (PST)
MIME-Version: 1.0
References: <20201221165448.27312-1-uli+renesas@fpond.eu> <20201221165448.27312-5-uli+renesas@fpond.eu>
In-Reply-To: <20201221165448.27312-5-uli+renesas@fpond.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 22 Dec 2020 12:42:22 +0100
Message-ID: <CAMuHMdWVC-E-=r2yGDNpXRbothAML6jvMozm9k=4PgDrDrcFqg@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] pinctrl: renesas: Initial R8A779A0 (V3U) PFC support
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>, hoai.luu.ub@renesas.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Uli,

On Mon, Dec 21, 2020 at 5:55 PM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> This patch adds initial pinctrl support for the R8A779A0 (V3U) SoC,
> including bias, drive strength and voltage control.
>
> Based on patch by LUU HOAI <hoai.luu.ub@renesas.com>.
>
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/pinctrl/renesas/pfc-r8a779a0.c
> @@ -0,0 +1,2527 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * R8A779A0 processor support - PFC hardware block.
> + *
> + * Copyright (C) 2020 Renesas Electronics Corp.
> + *
> + * This file is based on the drivers/pinctrl/renesas/pfc-r8a7795.c

based on drivers/pinctrl/renesas/pfc-r8a77951.c?

> +#define CPU_ALL_GP(fn, sfx)    \
> +       PORT_GP_CFG_15(0, fn, sfx, CFG_FLAGS),  \
> +       PORT_GP_CFG_1(0, 15, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE),   \
> +       PORT_GP_CFG_1(0, 16, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE),   \
> +       PORT_GP_CFG_1(0, 17, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE),   \
> +       PORT_GP_CFG_1(0, 18, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE),   \
> +       PORT_GP_CFG_1(0, 19, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE),   \
> +       PORT_GP_CFG_1(0, 20, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE),   \
> +       PORT_GP_CFG_1(0, 21, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE),   \
> +       PORT_GP_CFG_1(0, 22, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE),   \
> +       PORT_GP_CFG_1(0, 23, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE),   \
> +       PORT_GP_CFG_1(0, 24, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE),   \
> +       PORT_GP_CFG_1(0, 25, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE),   \
> +       PORT_GP_CFG_1(0, 26, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE),   \
> +       PORT_GP_CFG_1(0, 27, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE),   \
> +       PORT_GP_CFG_31(1, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE),      \
> +       PORT_GP_CFG_2(2, fn, sfx, CFG_FLAGS),                                   \
> +       PORT_GP_CFG_1(2, 2, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE),    \
> +       PORT_GP_CFG_1(2, 3, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE),    \
> +       PORT_GP_CFG_1(2, 4, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE),    \
> +       PORT_GP_CFG_1(2, 5, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE),    \
> +       PORT_GP_CFG_1(2, 6, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE),    \
> +       PORT_GP_CFG_1(2, 7, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE),    \
> +       PORT_GP_CFG_1(2, 8, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE),    \
> +       PORT_GP_CFG_1(2, 9, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE),    \
> +       PORT_GP_CFG_1(2, 10, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE),   \
> +       PORT_GP_CFG_1(2, 11, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE),   \
> +       PORT_GP_CFG_1(2, 12, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE),   \
> +       PORT_GP_CFG_1(2, 13, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE),   \
> +       PORT_GP_CFG_1(2, 14, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE),   \
> +       PORT_GP_CFG_1(2, 15, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE),   \

I guess it wouldn't hurt to make the voltage options explicit, and start using
SH_PFC_PIN_CFG_IO_VOLTAGE_18_33?

> +       PORT_GP_CFG_1(2, 16, fn, sfx, CFG_FLAGS),       \
> +       PORT_GP_CFG_1(2, 17, fn, sfx, CFG_FLAGS),       \
> +       PORT_GP_CFG_1(2, 18, fn, sfx, CFG_FLAGS),       \
> +       PORT_GP_CFG_1(2, 19, fn, sfx, CFG_FLAGS),       \
> +       PORT_GP_CFG_1(2, 20, fn, sfx, CFG_FLAGS),       \
> +       PORT_GP_CFG_1(2, 21, fn, sfx, CFG_FLAGS),       \
> +       PORT_GP_CFG_1(2, 22, fn, sfx, CFG_FLAGS),       \
> +       PORT_GP_CFG_1(2, 23, fn, sfx, CFG_FLAGS),       \
> +       PORT_GP_CFG_1(2, 24, fn, sfx, CFG_FLAGS),       \
> +       PORT_GP_CFG_17(3, fn, sfx, CFG_FLAGS),  \
> +       PORT_GP_CFG_18(4, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE_25_33),\
> +       PORT_GP_CFG_1(4, 18, fn, sfx, CFG_FLAGS),       \
> +       PORT_GP_CFG_1(4, 19, fn, sfx, CFG_FLAGS),       \
> +       PORT_GP_CFG_1(4, 20, fn, sfx, CFG_FLAGS),       \
> +       PORT_GP_CFG_1(4, 21, fn, sfx, CFG_FLAGS),       \
> +       PORT_GP_CFG_1(4, 22, fn, sfx, CFG_FLAGS),       \
> +       PORT_GP_CFG_1(4, 23, fn, sfx, CFG_FLAGS),       \
> +       PORT_GP_CFG_1(4, 24, fn, sfx, CFG_FLAGS),       \
> +       PORT_GP_CFG_1(4, 25, fn, sfx, CFG_FLAGS),       \
> +       PORT_GP_CFG_1(4, 26, fn, sfx, CFG_FLAGS),       \
> +       PORT_GP_CFG_18(5, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE_25_33),\
> +       PORT_GP_CFG_1(5, 18, fn, sfx, CFG_FLAGS),       \
> +       PORT_GP_CFG_1(5, 19, fn, sfx, CFG_FLAGS),       \
> +       PORT_GP_CFG_1(5, 20, fn, sfx, CFG_FLAGS),       \
> +       PORT_GP_CFG_18(6, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE_25_33),\
> +       PORT_GP_CFG_1(6, 18, fn, sfx, CFG_FLAGS),       \
> +       PORT_GP_CFG_1(6, 19, fn, sfx, CFG_FLAGS),       \
> +       PORT_GP_CFG_1(6, 20, fn, sfx, CFG_FLAGS),       \
> +       PORT_GP_CFG_18(7, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE_25_33),\
> +       PORT_GP_CFG_1(7, 18, fn, sfx, CFG_FLAGS),       \
> +       PORT_GP_CFG_1(7, 19, fn, sfx, CFG_FLAGS),       \
> +       PORT_GP_CFG_1(7, 20, fn, sfx, CFG_FLAGS),       \
> +       PORT_GP_CFG_18(8, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE_25_33),\
> +       PORT_GP_CFG_1(8, 18, fn, sfx, CFG_FLAGS),       \
> +       PORT_GP_CFG_1(8, 19, fn, sfx, CFG_FLAGS),       \
> +       PORT_GP_CFG_1(8, 20, fn, sfx, CFG_FLAGS),       \
> +       PORT_GP_CFG_18(9, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE_25_33),\
> +       PORT_GP_CFG_1(9, 18, fn, sfx, CFG_FLAGS),       \
> +       PORT_GP_CFG_1(9, 19, fn, sfx, CFG_FLAGS),       \
> +       PORT_GP_CFG_1(9, 20, fn, sfx, CFG_FLAGS)

> +/* GPSR1 */
> +#define GPSR1_30       F_(GP1_30,              IP3SR1_27_24)
> +#define GPSR1_29       F_(GP1_29,              IP3SR1_23_20)
> +#define GPSR1_28       F_(GP1_28,              IP3SR1_19_16)
> +#define GPSR1_27       F_(IRQ3,                IP3SR1_15_12)
> +#define GPSR1_26       F_(IRQ2,                IP3SR1_11_8)
> +#define GPSR1_25       F_(IRQ1,                IP3SR1_7_4)
> +#define GPSR1_24       F_(IRQ0,                IP3SR1_3_0)

Please align definitions (also for other GPSR below)

> +#define GPSR1_23       F_(MSIOF2_SS2,  IP2SR1_31_28)
> +#define GPSR1_22       F_(MSIOF2_SS1,  IP2SR1_27_24)
> +#define GPSR1_21       F_(MSIOF2_SYNC, IP2SR1_23_20)
> +#define GPSR1_20       F_(MSIOF2_SCK,  IP2SR1_19_16)
> +#define GPSR1_19       F_(MSIOF2_TXD,  IP2SR1_15_12)
> +#define GPSR1_18       F_(MSIOF2_RXD,  IP2SR1_11_8)
> +#define GPSR1_17       F_(MSIOF1_SS2,  IP2SR1_7_4)
> +#define GPSR1_16       F_(MSIOF1_SS1,  IP2SR1_3_0)
> +#define GPSR1_15       F_(MSIOF1_SYNC, IP1SR1_31_28)
> +#define GPSR1_14       F_(MSIOF1_SCK,  IP1SR1_27_24)
> +#define GPSR1_13       F_(MSIOF1_TXD,  IP1SR1_23_20)
> +#define GPSR1_12       F_(MSIOF1_RXD,  IP1SR1_19_16)
> +#define GPSR1_11       F_(MSIOF0_SS2,  IP1SR1_15_12)
> +#define GPSR1_10       F_(MSIOF0_SS1,  IP1SR1_11_8)
> +#define GPSR1_9                F_(MSIOF0_SYNC, IP1SR1_7_4)
> +#define GPSR1_8                F_(MSIOF0_SCK,  IP1SR1_3_0)
> +#define GPSR1_7                F_(MSIOF0_TXD,  IP0SR1_31_28)
> +#define GPSR1_6                F_(MSIOF0_RXD,  IP0SR1_27_24)
> +#define GPSR1_5                F_(HTX0,                IP0SR1_23_20)
> +#define GPSR1_4                F_(HCTS0_N,             IP0SR1_19_16)
> +#define GPSR1_3                F_(HRTS0_N,             IP0SR1_15_12)
> +#define GPSR1_2                F_(HSCK0,               IP0SR1_11_8)
> +#define GPSR1_1                F_(HRX0,                IP0SR1_7_4)
> +#define GPSR1_0                F_(SCIF_CLK,    IP0SR1_3_0)

> +/* IP3SR1 */           /* 0 */                 /* 1 */         /* 2 */         /* 3 */         /* 4 */         /* 5 */         /* 6 - F */
> +#define IP3SR1_3_0     FM(IRQ0)                F_(0, 0)        F_(0, 0)        F_(0, 0)        FM(DU_DOTCLKOUT)        FM(A24) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP3SR1_7_4     FM(IRQ1)                F_(0, 0)        F_(0, 0)        F_(0, 0)        FM(DU_HSYNC)    FM(A25) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP3SR1_11_8    FM(IRQ2)                F_(0, 0)        F_(0, 0)        F_(0, 0)        FM(DU_VSYNC)    FM(CS1_N_A26)   F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP3SR1_15_12   FM(IRQ3)                F_(0, 0)        F_(0, 0)        F_(0, 0)        FM(DU_ODDF_DISP_CDE)    FM(CS0_N)       F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)

Please align columns

> +#define IP3SR1_19_16   FM(GP1_28)              F_(0, 0)        F_(0, 0)        F_(0, 0)        F_(0, 0)        FM(D0)          F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP3SR1_23_20   FM(GP1_29)              F_(0, 0)        F_(0, 0)        F_(0, 0)        F_(0, 0)        FM(D1)          F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP3SR1_27_24   FM(GP1_30)              F_(0, 0)        F_(0, 0)        F_(0, 0)        F_(0, 0)        FM(D2)          F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP3SR1_31_28   F_(0, 0)                F_(0, 0)        F_(0, 0)        F_(0, 0)        F_(0, 0)        F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)

> +       { PINMUX_DRIVE_REG("DRV2CTRL2", 0xe6050888) {
> +               { RCAR_GP_PIN(2, 23), 28, 3 },  /* TCLK1_A */
> +               { RCAR_GP_PIN(2, 22), 24, 3 },  /* TPU0TO1 */
> +               { RCAR_GP_PIN(2, 21), 20, 3 },  /* TPU0TO0 */
> +               { RCAR_GP_PIN(2, 20), 16, 3 },  /* CLK_EXTFXR */
> +               { RCAR_GP_PIN(2, 19), 12, 3 },  /* RXDB_EXTFXR */
> +               { RCAR_GP_PIN(2, 18),  8, 3 },  /* FXR_TXDB */
> +               { RCAR_GP_PIN(2, 17),  4, 3 },  /* RXDA_EXTFXR */

RXDA_EXTFXR_A

> +               { RCAR_GP_PIN(2, 16),  0, 3 },  /* FXR_TXDA */

FXR_TXDA_A

> +       } },

> +       { PINMUX_BIAS_REG("PUEN2", 0xe60508c0, "PUD2", 0xe60508e0) {
> +               [ 0] = RCAR_GP_PIN(2,  0),      /* IPC_CLKIN */
> +               [ 1] = RCAR_GP_PIN(2,  1),      /* IPC_CLKOUT */
> +               [ 2] = RCAR_GP_PIN(2,  2),      /* GP2_02 */
> +               [ 3] = RCAR_GP_PIN(2,  3),      /* GP2_03 */
> +               [ 4] = RCAR_GP_PIN(2,  4),      /* GP2_04 */
> +               [ 5] = RCAR_GP_PIN(2,  5),      /* GP2_05 */
> +               [ 6] = RCAR_GP_PIN(2,  6),      /* GP2_06 */
> +               [ 7] = RCAR_GP_PIN(2,  7),      /* GP2_07 */
> +               [ 8] = RCAR_GP_PIN(2,  8),      /* GP2_08 */
> +               [ 9] = RCAR_GP_PIN(2,  9),      /* GP2_09 */
> +               [10] = RCAR_GP_PIN(2, 10),      /* GP2_10 */
> +               [11] = RCAR_GP_PIN(2, 11),      /* GP2_11 */
> +               [12] = RCAR_GP_PIN(2, 12),      /* GP2_12 */
> +               [13] = RCAR_GP_PIN(2, 13),      /* GP2_13 */
> +               [14] = RCAR_GP_PIN(2, 14),      /* GP2_14 */
> +               [15] = RCAR_GP_PIN(2, 15),      /* GP2_15 */
> +               [16] = RCAR_GP_PIN(2, 16),      /* FXR_TXDA */

FXR_TXDA_A

> +               [17] = RCAR_GP_PIN(2, 17),      /* RXDA_EXTFXR */

RXDA_EXTFXR_A

> +               [18] = RCAR_GP_PIN(2, 18),      /* FXR_TXDB */
> +               [19] = RCAR_GP_PIN(2, 19),      /* RXDB_EXTFXR */
> +               [20] = RCAR_GP_PIN(2, 20),      /* CLK_EXTFXR */
> +               [21] = RCAR_GP_PIN(2, 21),      /* TPU0TO0 */
> +               [22] = RCAR_GP_PIN(2, 22),      /* TPU0TO1 */
> +               [23] = RCAR_GP_PIN(2, 23),      /* TCLK1_A */
> +               [24] = RCAR_GP_PIN(2, 24),      /* TCLK2_A */
> +               [25] = SH_PFC_PIN_NONE,
> +               [26] = SH_PFC_PIN_NONE,
> +               [27] = SH_PFC_PIN_NONE,
> +               [28] = SH_PFC_PIN_NONE,
> +               [29] = SH_PFC_PIN_NONE,
> +               [30] = SH_PFC_PIN_NONE,
> +               [31] = SH_PFC_PIN_NONE,
> +       } },

> +       { PINMUX_BIAS_REG("PUEN9", 0xe60698c0, "PUD9", 0xe60698e0) {
> +               [ 0] = RCAR_GP_PIN(9,  0),      /* AVB5_RX_CTL */
> +               [ 1] = RCAR_GP_PIN(9,  1),      /* AVB5_RXC */
> +               [ 2] = RCAR_GP_PIN(9,  2),      /* AVB5_RD0 */
> +               [ 3] = RCAR_GP_PIN(9,  3),      /* AVB5_RD1 */
> +               [ 4] = RCAR_GP_PIN(9,  4),      /* AVB5_RD2 */
> +               [ 5] = RCAR_GP_PIN(9,  5),      /* AVB5_RD3 */
> +               [ 6] = RCAR_GP_PIN(9,  6),      /* AVB5_TX_CTL */
> +               [ 7] = RCAR_GP_PIN(9,  7),      /* AVB5_TXC */
> +               [ 8] = RCAR_GP_PIN(9,  8),      /* AVB5_TD0 */
> +               [ 9] = RCAR_GP_PIN(9,  9),      /* AVB5_TD1 */
> +               [10] = RCAR_GP_PIN(9, 10),      /* AVB5_TD2 */
> +               [11] = RCAR_GP_PIN(9, 11),      /* AVB5_TD3 */
> +               [12] = RCAR_GP_PIN(9, 12),      /* AVB5_TXCREFCLK */
> +               [13] = RCAR_GP_PIN(9, 13),      /* AVB5_MDIO */
> +               [14] = RCAR_GP_PIN(9, 14),      /* AVB5_MDC */
> +               [15] = RCAR_GP_PIN(9, 15),      /* AVB5_MAGIC */
> +               [16] = RCAR_GP_PIN(9, 16),      /* AVB5_PHY_INT */
> +               [17] = RCAR_GP_PIN(9, 17),      /* AVB5_LINK */
> +               [18] = RCAR_GP_PIN(9, 18),      /* AVB5_AVTP_MATCH */
> +               [19] = RCAR_GP_PIN(9, 19),      /* AVB5_AVTP_CAPTURE */
> +               [20] = RCAR_GP_PIN(9, 20),      /* AVB5_AVTP_PPS */
> +               [21] = SH_PFC_PIN_NONE,
> +               [22] = SH_PFC_PIN_NONE,
> +               [23] = SH_PFC_PIN_NONE,
> +               [24] = SH_PFC_PIN_NONE,
> +               [25] = SH_PFC_PIN_NONE,
> +               [26] = SH_PFC_PIN_NONE,
> +               [27] = SH_PFC_PIN_NONE,
> +               [28] = SH_PFC_PIN_NONE,
> +               [29] = SH_PFC_PIN_NONE,
> +               [30] = SH_PFC_PIN_NONE,
> +               [31] = SH_PFC_PIN_NONE,
> +               [21] = SH_PFC_PIN_NONE,
> +               [22] = SH_PFC_PIN_NONE,
> +               [23] = SH_PFC_PIN_NONE,
> +               [24] = SH_PFC_PIN_NONE,
> +               [25] = SH_PFC_PIN_NONE,
> +               [26] = SH_PFC_PIN_NONE,
> +               [27] = SH_PFC_PIN_NONE,
> +               [28] = SH_PFC_PIN_NONE,
> +               [29] = SH_PFC_PIN_NONE,
> +               [30] = SH_PFC_PIN_NONE,
> +               [31] = SH_PFC_PIN_NONE,

Duplicated entries.

> +       } },

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
