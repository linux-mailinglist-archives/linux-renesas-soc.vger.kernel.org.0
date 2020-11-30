Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF1492C8F12
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Nov 2020 21:23:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727938AbgK3UXd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 30 Nov 2020 15:23:33 -0500
Received: from mail-oo1-f67.google.com ([209.85.161.67]:45543 "EHLO
        mail-oo1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726339AbgK3UXc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Nov 2020 15:23:32 -0500
Received: by mail-oo1-f67.google.com with SMTP id p15so1330844oop.12
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Nov 2020 12:23:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JTo2uTAwgPC3cDUv86tIL6JBjaxahrkEejFjpxRU+pw=;
        b=cdpezUuquMp+Xr10Dh2gqCKkBjM37iEw8gk76VfiGIRrp/phEMcf5V6qKy2PKwHUAh
         hbgySRi+Grpr2Q1PrMZdHzGe+O3EydebPCuDdmTGpKoTc8CuayVchtbJIseiOtBHHh59
         RcTfv28Ka1nu/gT5jUGQ1PPydcUEyR84Ug6GMxzBthFxqVhpc+FCLP5BEFnp4elDLxDI
         ZBjD5eHnMBWBs0LI+6QFRl/2YSXMvPc26pq/gvYsgzYgXGu73WCpswp381NaWWsekaUu
         JH3fMAnvf+PRE6/CK0Qai3PNXLEMlz3OQEV8WvLEC/aRys4zWOjocoMer8Qo5rtIlJQz
         KkPQ==
X-Gm-Message-State: AOAM533E0UoiEb46v+oauqeOccqyoPHHUuFeRdqKKR+ZQI9sO46RH7om
        B0OZyOeQRTYarj7OQHc8iNMvkPvOHKhHpar2kDUms63gSk8=
X-Google-Smtp-Source: ABdhPJwu0ctUuo9Q4zm3+WGcMOpV9ka7An0qrt3TJ1+gW2RrNiNJyFd1y6GqvNGxz80mQarfqv3zCm7683tEoGjjEcc=
X-Received: by 2002:a4a:274b:: with SMTP id w11mr16842446oow.11.1606767769798;
 Mon, 30 Nov 2020 12:22:49 -0800 (PST)
MIME-Version: 1.0
References: <20201126172058.25275-1-uli+renesas@fpond.eu> <20201126172058.25275-3-uli+renesas@fpond.eu>
In-Reply-To: <20201126172058.25275-3-uli+renesas@fpond.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 30 Nov 2020 21:22:38 +0100
Message-ID: <CAMuHMdVSF_8JmR5t1aMPktY=J7=BvUbWLzPGnb9=QnRrLeA2ew@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: renesas: Initial R8A779A0 (V3U) PFC support
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>, hoai.luu.ub@renesas.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Uli,

On Thu, Nov 26, 2020 at 6:21 PM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> This patch adds initial pinctrl support for the R8A779A0 (V3U) SoC,
> including bias control.
>
> Based on patch by LUU HOAI <hoai.luu.ub@renesas.com>.
>
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/pinctrl/renesas/pfc-r8a779a0.c
> @@ -0,0 +1,2525 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * R8A779A0 processor support - PFC hardware block.
> + *
> + * Copyright (C) 2020 Renesas Electronics Corp.
> + *
> + * This file is based on the drivers/pinctrl/renesas/pfc-r8a7795.c
> + */
> +
> +#include <linux/errno.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +
> +#include "core.h"
> +#include "sh_pfc.h"
> +
> +#define CFG_FLAGS (SH_PFC_PIN_CFG_DRIVE_STRENGTH | SH_PFC_PIN_CFG_PULL_UP_DOWN)
> +
> +#define CPU_ALL_GP(fn, sfx)    \

> +       PORT_GP_CFG_30(1, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE),      \
> +       PORT_GP_CFG_1(1, 30, fn, sfx, CFG_FLAGS | SH_PFC_PIN_CFG_IO_VOLTAGE),   \

Please add PORT_GP_CFG_31(), and use that.

> +       PORT_GP_CFG_1(2, 0, fn, sfx, CFG_FLAGS),        \
> +       PORT_GP_CFG_1(2, 1, fn, sfx, CFG_FLAGS),        \

Please add PORT_GP_CFG_2(), and use that.

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
> +       PORT_GP_CFG_1(2, 16, fn, sfx, CFG_FLAGS),       \
> +       PORT_GP_CFG_1(2, 17, fn, sfx, CFG_FLAGS),       \
> +       PORT_GP_CFG_1(2, 18, fn, sfx, CFG_FLAGS),       \
> +       PORT_GP_CFG_1(2, 19, fn, sfx, CFG_FLAGS),       \
> +       PORT_GP_CFG_1(2, 20, fn, sfx, CFG_FLAGS),       \
> +       PORT_GP_CFG_1(2, 21, fn, sfx, CFG_FLAGS),       \
> +       PORT_GP_CFG_1(2, 22, fn, sfx, CFG_FLAGS),       \
> +       PORT_GP_CFG_1(2, 23, fn, sfx, CFG_FLAGS),       \
> +       PORT_GP_CFG_1(2, 24, fn, sfx, CFG_FLAGS),       \

Looks like we could use some new macros for a range of pins that do not
start of offset 0, to collapse the above (and more below)?

> +       PORT_GP_CFG_1(2, 25, fn, sfx, CFG_FLAGS),       \

GP2_25 does not exist.

> +/* GPSR2 */
> +#define GPSR2_24       F_(TCLK2,               IP1SR2_11_8)

As this is TCLK2_A, which is a single-function pin, I think this should
be

    #define GPSR2_24       FM(TCLK2_A)

> +#define GPSR2_23       F_(TCLK1,               IP2SR2_31_28)

TCLK1_A

> +#define GPSR2_22       F_(TPU0TO1,             IP2SR2_27_24)
> +#define GPSR2_21       F_(TPU0TO0,             IP2SR2_23_20)
> +#define GPSR2_20       F_(CLK_EXTFXR,  IP2SR2_19_16)
> +#define GPSR2_19       F_(RXDB_EXTFXR, IP2SR2_15_12)
> +#define GPSR2_18       F_(FXR_TXDB,    IP2SR2_11_8)
> +#define GPSR2_17       F_(RXDA_EXTFXR, IP2SR2_7_4)

RXDA_EXTFXR_A

> +#define GPSR2_16       F_(FXR_TXDA,    IP2SR2_3_0)

FXR_TXDA_A

> +#define GPSR2_15       F_(GP2_15,              IP1SR2_31_28)
> +#define GPSR2_14       F_(GP2_14,              IP1SR2_27_24)
> +#define GPSR2_13       F_(GP2_13,              IP1SR2_23_20)
> +#define GPSR2_12       F_(GP2_12,              IP1SR2_19_16)
> +#define GPSR2_11       F_(GP2_11,              IP1SR2_15_12)
> +#define GPSR2_10       F_(GP2_10,              IP1SR2_11_8)
> +#define GPSR2_9                F_(GP2_09,              IP1SR2_7_4)
> +#define GPSR2_8                F_(GP2_08,              IP1SR2_3_0)
> +#define GPSR2_7                F_(GP2_07,              IP0SR2_31_28)
> +#define GPSR2_6                F_(GP2_06,              IP0SR2_27_24)
> +#define GPSR2_5                F_(GP2_05,              IP0SR2_23_20)
> +#define GPSR2_4                F_(GP2_04,              IP0SR2_19_16)
> +#define GPSR2_3                F_(GP2_03,              IP0SR2_15_12)
> +#define GPSR2_2                F_(GP2_02,              IP0SR2_11_8)
> +#define GPSR2_1                F_(IPC_CLKOUT,  IP0SR2_7_4)
> +#define GPSR2_0                F_(IPC_CLKIN,   IP0SR2_3_0)

[...]

> +/* IP0SR1 */                   /* 0 */                 /* 1 */         /* 2 */         /* 3 */         /* 4 */         /* 5 */         /* 6 - F */
> +#define IP0SR1_3_0             FM(SCIF_CLK)    F_(0, 0)        F_(0, 0)        F_(0, 0)        F_(0, 0)        FM(A0)          F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP0SR1_7_4             FM(HRX0)                FM(RX0)         F_(0, 0)        F_(0, 0)        F_(0, 0)        FM(A1)          F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP0SR1_11_8            FM(HSCK0)               FM(SCK0)        F_(0, 0)        F_(0, 0)        F_(0, 0)        FM(A2)          F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP0SR1_15_12   FM(HRTS0_N)             FM(RTS0_N)      F_(0, 0)        F_(0, 0)        F_(0, 0)        FM(A3)          F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP0SR1_19_16   FM(HCTS0_N)             FM(CTS0_N)      F_(0, 0)        F_(0, 0)        F_(0, 0)        FM(A4)          F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP0SR1_23_20   FM(HTX0)                FM(TX0)         F_(0, 0)        F_(0, 0)        F_(0, 0)        FM(A5)          F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP0SR1_27_24   FM(MSIOF0_RXD)  F_(0, 0)        F_(0, 0)        F_(0, 0)        FM(DU_DR2)      FM(A6)          F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP0SR1_31_28   FM(MSIOF0_TXD)  F_(0, 0)        F_(0, 0)        F_(0, 0)        FM(DU_DR3)      FM(A7)          F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)

Please align the columns, here and below.

[...]

> +/* IP2SR1 */                   /* 0 */                 /* 1 */         /* 2 */         /* 3 */         /* 4 */         /* 5 */         /* 6 - F */
> +#define IP2SR1_3_0             FM(MSIOF1_SS1)  FM(HCTS3_N)     FM(RX3)         F_(0, 0)        FM(DU_DG6)      FM(A16)         F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP2SR1_7_4             FM(MSIOF1_SS2)  FM(HTX3)        FM(TX3)         F_(0, 0)        FM(DU_DG7)      FM(A17)         F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP2SR1_11_8            FM(MSIOF2_RXD)  FM(HSCK1)       FM(SCK1)        F_(0, 0)        FM(DU_DB2)      FM(A18)         F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP2SR1_15_12   FM(MSIOF2_TXD)  FM(HCTS1_N)     FM(CTS1_N)      F_(0, 0)        FM(DU_DB3)      FM(A19)         F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP2SR1_19_16   FM(MSIOF2_SCK)  FM(HRTS1_N)     FM(RTS1_N)      F_(0, 0)        FM(DU_DB4)      FM(A20)         F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP2SR1_23_20   FM(MSIOF2_SYNC) FM(HRX1)        FM(RX1)         F_(0, 0)        FM(DU_DB5)      FM(A21)         F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP2SR1_27_24   FM(MSIOF2_SS1)  FM(HTX1)        FM(TX1)         F_(0, 0)        FM(DU_DB6)      FM(A22)         F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +/*
> + * From HW manual, there are 2 definition for TCLK1, that lead to duplicated
> + * definition in source code.
> + * For this reason, the definition of TCLK1 in IP2SR1_31_28 bits is removed.
> + */

There are two sets of TCLK1 (and TCLK2): A and B.
Unfortunately they are not clearly distinguished in the User's Manual,
but they are in the Pin Multiplex Table...

> +#define IP2SR1_31_28   FM(MSIOF2_SS2)  F_(0, 0)        F_(0, 0)        F_(0, 0)        FM(DU_DB7)      FM(A23)         F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)

... hence the first "F_(0, 0)" should be "FM(TCLK1_B)".

[...]

> +/* IP1SR2 */                   /* 0 */                 /* 1 */         /* 2 */                 /* 3 */         /* 4 */         /* 5 */         /* 6 - F */
> +#define IP1SR2_3_0             FM(GP2_08)              FM(HRX2)        FM(MSIOF4_SS1)  FM(RX4)         F_(0, 0)        FM(D9)          F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP1SR2_7_4             FM(GP2_09)              FM(HTX2)        FM(MSIOF4_SS2)  FM(TX4)         F_(0, 0)        FM(D10)         F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP1SR2_11_8            FM(GP2_10)              FM(TCLK2)       FM(MSIOF5_RXD)  F_(0, 0)        F_(0, 0)        FM(D11)         F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)

TCLK2_B

> +#define IP1SR2_15_12   FM(GP2_11)              FM(TCLK3)       FM(MSIOF5_TXD)  F_(0, 0)        F_(0, 0)        FM(D12)         F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP1SR2_19_16   FM(GP2_12)              FM(TCLK4)       FM(MSIOF5_SCK)  F_(0, 0)        F_(0, 0)        FM(D13)         F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP1SR2_23_20   FM(GP2_13)              F_(0, 0)        FM(MSIOF5_SYNC) F_(0, 0)        F_(0, 0)        FM(D14)         F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP1SR2_27_24   FM(GP2_14)              FM(IRQ4)        FM(MSIOF5_SS1)  F_(0, 0)        F_(0, 0)        FM(D15)         F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP1SR2_31_28   FM(GP2_15)              FM(IRQ5)        FM(MSIOF5_SS2)  FM(CPG_CPCKOUT) F_(0, 0)        F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +/* IP2SR2 */                   /* 0 */                 /* 1 */                 /* 2 */         /* 3 */         /* 4 */         /* 5 */         /* 6 - F */
> +#define IP2SR2_3_0             FM(FXR_TXDA)    FM(MSIOF3_SS1)  F_(0, 0)        F_(0, 0)        F_(0, 0)        F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)

FXR_TXDA_A

> +#define IP2SR2_7_4             FM(RXDA_EXTFXR) FM(MSIOF3_SS2)  F_(0, 0)        F_(0, 0)        F_(0, 0)        FM(BS_N)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)

RXDA_EXTFXR_A

> +#define IP2SR2_11_8            FM(FXR_TXDB)    FM(MSIOF3_RXD)  F_(0, 0)        F_(0, 0)        F_(0, 0)        FM(RD_N)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP2SR2_15_12   FM(RXDB_EXTFXR) FM(MSIOF3_TXD)  F_(0, 0)        F_(0, 0)        F_(0, 0)        FM(WE0_N)       F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP2SR2_19_16   FM(CLK_EXTFXR)  FM(MSIOF3_SCK)  F_(0, 0)        F_(0, 0)        F_(0, 0)        FM(WE1_N)       F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP2SR2_23_20   FM(TPU0TO0)             FM(MSIOF3_SYNC) F_(0, 0)        F_(0, 0)        F_(0, 0)        FM(RD_WR_N)     F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP2SR2_27_24   FM(TPU0TO1)             F_(0, 0)                F_(0, 0)        F_(0, 0)        F_(0, 0)        FM(CLKOUT)      F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP2SR2_31_28   FM(TCLK1)               F_(0, 0)                F_(0, 0)        F_(0, 0)        F_(0, 0)        FM(EX_WAIT0)    F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)

TCLK1_A

> +
> +/* IP0SR3 */                   /* 0 */                 /* 1 */                 /* 2 */         /* 3 */         /* 4 */         /* 5 */         /* 6 - F */
> +#define IP0SR3_3_0             F_(0, 0)                F_(0, 0)                F_(0, 0)        F_(0, 0)        F_(0, 0)        F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +/*
> + * From HW manual, there are 2 definition for FXR_TXDA, RXDA_EXTFXR, TX1, RX1
> + * that lead to duplicated definition in source code.
> + * For this reason, the definitions of FXR_TXDA, TX1 in IP0SR3_7_4 bits
> + * and the definitions of RXDA_EXTFXR, RX1 in IP0SR3_11_8 bits are removed.
> + */
> +#define IP0SR3_7_4             FM(CANFD0_TX)   F_(0, 0)                F_(0, 0)                F_(0, 0)        F_(0, 0)        F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)

The first "F_(0, 0)" should be FM(FXR_TXDA_B)", the second "FM(TX1_B)".

> +#define IP0SR3_11_8            FM(CANFD0_RX)   F_(0, 0)                F_(0, 0)                F_(0, 0)        F_(0, 0)        F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)

The first "F_(0, 0)" should be FM(RXDA_EXTFXR_B)", the second "FM(RX1_B)".

> +#define IP0SR3_15_12   F_(0, 0)                F_(0, 0)                F_(0, 0)        F_(0, 0)        F_(0, 0)        F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP0SR3_19_16   F_(0, 0)                F_(0, 0)                F_(0, 0)        F_(0, 0)        F_(0, 0)        F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP0SR3_23_20   FM(CANFD2_TX)   FM(TPU0TO2)             FM(PWM0)        F_(0, 0)        F_(0, 0)        F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP0SR3_27_24   FM(CANFD2_RX)   FM(TPU0TO3)             FM(PWM1)        F_(0, 0)        F_(0, 0)        F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP0SR3_31_28   FM(CANFD3_TX)   F_(0, 0)                FM(PWM2)        F_(0, 0)        F_(0, 0)        F_(0, 0)        F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)

[...]

> +#define PINMUX_IPSR    \
> +\
> +FM(IP0SR1_3_0)         IP0SR1_3_0              FM(IP1SR1_3_0)          IP1SR1_3_0              FM(IP2SR1_3_0)          IP2SR1_3_0              FM(IP3SR1_3_0)          IP3SR1_3_0 \
> +FM(IP0SR1_7_4)         IP0SR1_7_4              FM(IP1SR1_7_4)          IP1SR1_7_4              FM(IP2SR1_7_4)          IP2SR1_7_4              FM(IP3SR1_7_4)          IP3SR1_7_4 \
> +FM(IP0SR1_11_8)                IP0SR1_11_8             FM(IP1SR1_11_8)         IP1SR1_11_8             FM(IP2SR1_11_8)         IP2SR1_11_8             FM(IP3SR1_11_8)         IP3SR1_11_8 \
> +FM(IP0SR1_15_12)       IP0SR1_15_12    FM(IP1SR1_15_12)        IP1SR1_15_12    FM(IP2SR1_15_12)        IP2SR1_15_12    FM(IP3SR1_15_12)        IP3SR1_15_12 \
> +FM(IP0SR1_19_16)       IP0SR1_19_16    FM(IP1SR1_19_16)        IP1SR1_19_16    FM(IP2SR1_19_16)        IP2SR1_19_16    FM(IP3SR1_19_16)        IP3SR1_19_16 \
> +FM(IP0SR1_23_20)       IP0SR1_23_20    FM(IP1SR1_23_20)        IP1SR1_23_20    FM(IP2SR1_23_20)        IP2SR1_23_20    FM(IP3SR1_23_20)        IP3SR1_23_20 \
> +FM(IP0SR1_27_24)       IP0SR1_27_24    FM(IP1SR1_27_24)        IP1SR1_27_24    FM(IP2SR1_27_24)        IP2SR1_27_24    FM(IP3SR1_27_24)        IP3SR1_27_24 \
> +FM(IP0SR1_31_28)       IP0SR1_31_28    FM(IP1SR1_31_28)        IP1SR1_31_28    FM(IP2SR1_31_28)        IP2SR1_31_28    FM(IP3SR1_31_28)        IP3SR1_31_28 \

Please align the columns, here and below.

[...]

> +/* MOD_SEL2 */                         /* 0 */         /* 1 */         /* 2 */         /* 3 */
> +#define MOD_SEL2_14_15         F_(0, 0)        F_(0, 0)        F_(0, 0)        FM(SEL_I2C6_3)
> +#define MOD_SEL2_12_13         F_(0, 0)        F_(0, 0)        F_(0, 0)        FM(SEL_I2C5_3)
> +#define MOD_SEL2_10_11         F_(0, 0)        F_(0, 0)        F_(0, 0)        FM(SEL_I2C4_3)
> +#define MOD_SEL2_8_9           F_(0, 0)        F_(0, 0)        F_(0, 0)        FM(SEL_I2C3_3)
> +#define MOD_SEL2_6_7           F_(0, 0)        F_(0, 0)        F_(0, 0)        FM(SEL_I2C2_3)
> +#define MOD_SEL2_4_5           F_(0, 0)        F_(0, 0)        F_(0, 0)        FM(SEL_I2C1_3)
> +#define MOD_SEL2_2_3           F_(0, 0)        F_(0, 0)        F_(0, 0)        FM(SEL_I2C0_3)

Shouldn't the first column contain "FM(SEL_I2Cn_0)" instead of "F_(0, 0)",
to support selecting a non-I2C function?

> +
> +#define PINMUX_MOD_SELS \
> +\
> +MOD_SEL2_14_15 \
> +MOD_SEL2_12_13 \
> +MOD_SEL2_10_11 \
> +MOD_SEL2_8_9 \
> +MOD_SEL2_6_7 \
> +MOD_SEL2_4_5 \
> +MOD_SEL2_2_3
> +


> +enum {
> +       PINMUX_RESERVED = 0,
> +
> +       PINMUX_DATA_BEGIN,
> +       GP_ALL(DATA),
> +       PINMUX_DATA_END,
> +
> +#define F_(x, y)
> +#define FM(x)   FN_##x,
> +       PINMUX_FUNCTION_BEGIN,
> +       GP_ALL(FN),
> +       PINMUX_GPSR
> +       PINMUX_IPSR
> +       PINMUX_MOD_SELS
> +       PINMUX_FUNCTION_END,
> +#undef F_
> +#undef FM
> +
> +#define F_(x, y)
> +#define FM(x)  x##_MARK,
> +       PINMUX_MARK_BEGIN,
> +       PINMUX_GPSR
> +       PINMUX_IPSR
> +       PINMUX_MOD_SELS

Don't we need PINMUX_PHYS(), for the physically-muxed SCLn/SDAn?

> +       PINMUX_MARK_END,
> +#undef F_
> +#undef FM
> +};
> +
> +static const u16 pinmux_data[] = {

[...]

> +       PINMUX_SINGLE(AVB0_PHY_INT),

AVB0_MAGIC, AVB0_MDC, AVB0_MDIO, AVB0_TXCREFCLK?

> +
> +       PINMUX_SINGLE(AVB1_PHY_INT),

AVB1_MAGIC, AVB1_MDC, AVB1_MDIO, AVB1_TXCREFCLK?

[...]

> +       /* IP2SR1 */
> +       PINMUX_IPSR_GPSR(IP2SR1_3_0,    MSIOF1_SS1),
> +       PINMUX_IPSR_GPSR(IP2SR1_3_0,    HCTS3_N),
> +       PINMUX_IPSR_GPSR(IP2SR1_3_0,    RX3),
> +       PINMUX_IPSR_GPSR(IP2SR1_3_0,    DU_DG6),
> +       PINMUX_IPSR_GPSR(IP2SR1_3_0,    A16),
> +
> +       PINMUX_IPSR_GPSR(IP2SR1_7_4,    MSIOF1_SS2),
> +       PINMUX_IPSR_GPSR(IP2SR1_7_4,    HTX3),
> +       PINMUX_IPSR_GPSR(IP2SR1_7_4,    TX3),
> +       PINMUX_IPSR_GPSR(IP2SR1_7_4,    DU_DG7),
> +       PINMUX_IPSR_GPSR(IP2SR1_7_4,    A17),
> +
> +       PINMUX_IPSR_GPSR(IP2SR1_11_8,   MSIOF2_RXD),
> +       PINMUX_IPSR_GPSR(IP2SR1_11_8,   HSCK1),
> +       PINMUX_IPSR_GPSR(IP2SR1_11_8,   SCK1),
> +       PINMUX_IPSR_GPSR(IP2SR1_11_8,   DU_DB2),
> +       PINMUX_IPSR_GPSR(IP2SR1_11_8,   A18),
> +
> +       PINMUX_IPSR_GPSR(IP2SR1_15_12,  MSIOF2_TXD),
> +       PINMUX_IPSR_GPSR(IP2SR1_15_12,  HCTS1_N),
> +       PINMUX_IPSR_GPSR(IP2SR1_15_12,  CTS1_N),
> +       PINMUX_IPSR_GPSR(IP2SR1_15_12,  DU_DB3),
> +       PINMUX_IPSR_GPSR(IP2SR1_15_12,  A19),
> +
> +       PINMUX_IPSR_GPSR(IP2SR1_19_16,  MSIOF2_SCK),
> +       PINMUX_IPSR_GPSR(IP2SR1_19_16,  HRTS1_N),
> +       PINMUX_IPSR_GPSR(IP2SR1_19_16,  RTS1_N),
> +       PINMUX_IPSR_GPSR(IP2SR1_19_16,  DU_DB4),
> +       PINMUX_IPSR_GPSR(IP2SR1_19_16,  A20),
> +
> +       PINMUX_IPSR_GPSR(IP2SR1_23_20,  MSIOF2_SYNC),
> +       PINMUX_IPSR_GPSR(IP2SR1_23_20,  HRX1),
> +       PINMUX_IPSR_GPSR(IP2SR1_23_20,  RX1),

This should be RX1_A.

> +       PINMUX_IPSR_GPSR(IP2SR1_23_20,  DU_DB5),
> +       PINMUX_IPSR_GPSR(IP2SR1_23_20,  A21),
> +
> +       PINMUX_IPSR_GPSR(IP2SR1_27_24,  MSIOF2_SS1),
> +       PINMUX_IPSR_GPSR(IP2SR1_27_24,  HTX1),
> +       PINMUX_IPSR_GPSR(IP2SR1_27_24,  TX1),

This should be TX1_A.

> +       PINMUX_IPSR_GPSR(IP2SR1_27_24,  DU_DB6),
> +       PINMUX_IPSR_GPSR(IP2SR1_27_24,  A22),
> +
> +       PINMUX_IPSR_GPSR(IP2SR1_31_28,  MSIOF2_SS2),

Missing TCLK1_B

> +       PINMUX_IPSR_GPSR(IP2SR1_31_28,  DU_DB7),
> +       PINMUX_IPSR_GPSR(IP2SR1_31_28,  A23),

[...]

> +       /* IP0SR2 */
> +       PINMUX_IPSR_GPSR(IP0SR2_3_0,    IPC_CLKIN),
> +       PINMUX_IPSR_GPSR(IP0SR2_3_0,    IPC_CLKEN_IN),
> +       PINMUX_IPSR_GPSR(IP0SR2_3_0,    DU_DOTCLKIN),
> +
> +       PINMUX_IPSR_GPSR(IP0SR2_7_4,    IPC_CLKOUT),
> +       PINMUX_IPSR_GPSR(IP0SR2_7_4,    IPC_CLKEN_OUT),
> +
> +       /* GP2_02 = SCL0 */
> +       PINMUX_IPSR_MSEL(IP0SR2_11_8,   GP2_02, SEL_I2C0_3),
> +       PINMUX_IPSR_GPSR(IP0SR2_11_8,   D3),

PINMUX_IPSR_PHYS(), for all physically-muxed SCLn/SDAn?
And PINMUX_IPSR_PHYS_MSEL(..., ..., SEL_I2Cn_0, ...) to select a
non-I2C function?

> +
> +       /* GP2_03 = SDA0 */
> +       PINMUX_IPSR_MSEL(IP0SR2_15_12,  GP2_03, SEL_I2C0_3),
> +       PINMUX_IPSR_GPSR(IP0SR2_15_12,  D4),
> +
> +       /* GP2_04 = SCL1 */
> +       PINMUX_IPSR_MSEL(IP0SR2_19_16,  GP2_04, SEL_I2C1_3),
> +       PINMUX_IPSR_GPSR(IP0SR2_19_16,  MSIOF4_RXD),
> +       PINMUX_IPSR_GPSR(IP0SR2_19_16,  D5),
> +
> +       /* GP2_05 = SDA1 */
> +       PINMUX_IPSR_MSEL(IP0SR2_23_20,  GP2_05, SEL_I2C1_3),
> +       PINMUX_IPSR_GPSR(IP0SR2_23_20,  HSCK2),
> +       PINMUX_IPSR_GPSR(IP0SR2_23_20,  MSIOF4_TXD),
> +       PINMUX_IPSR_GPSR(IP0SR2_23_20,  SCK4),
> +       PINMUX_IPSR_GPSR(IP0SR2_23_20,  D6),
> +
> +       /* GP2_06 = SCL2 */
> +       PINMUX_IPSR_MSEL(IP0SR2_27_24,  GP2_06, SEL_I2C2_3),
> +       PINMUX_IPSR_GPSR(IP0SR2_27_24,  HCTS2_N),
> +       PINMUX_IPSR_GPSR(IP0SR2_27_24,  MSIOF4_SCK),
> +       PINMUX_IPSR_GPSR(IP0SR2_27_24,  CTS4_N),
> +       PINMUX_IPSR_GPSR(IP0SR2_27_24,  D7),
> +
> +       /* GP2_07 = SDA2 */
> +       PINMUX_IPSR_MSEL(IP0SR2_31_28,  GP2_07, SEL_I2C2_3),
> +       PINMUX_IPSR_GPSR(IP0SR2_31_28,  HRTS2_N),
> +       PINMUX_IPSR_GPSR(IP0SR2_31_28,  MSIOF4_SYNC),
> +       PINMUX_IPSR_GPSR(IP0SR2_31_28,  RTS4_N),
> +       PINMUX_IPSR_GPSR(IP0SR2_31_28,  D8),
> +
> +       /* GP2_08 = SCL3 */
> +       PINMUX_IPSR_MSEL(IP1SR2_3_0,    GP2_08, SEL_I2C3_3),
> +       PINMUX_IPSR_GPSR(IP1SR2_3_0,    HRX2),
> +       PINMUX_IPSR_GPSR(IP1SR2_3_0,    MSIOF4_SS1),
> +       PINMUX_IPSR_GPSR(IP1SR2_3_0,    RX4),
> +       PINMUX_IPSR_GPSR(IP1SR2_3_0,    D9),
> +
> +       /* GP2_09 = SDA3 */
> +       PINMUX_IPSR_MSEL(IP1SR2_7_4,    GP2_09, SEL_I2C3_3),
> +       PINMUX_IPSR_GPSR(IP1SR2_7_4,    HTX2),
> +       PINMUX_IPSR_GPSR(IP1SR2_7_4,    MSIOF4_SS2),
> +       PINMUX_IPSR_GPSR(IP1SR2_7_4,    TX4),
> +       PINMUX_IPSR_GPSR(IP1SR2_7_4,    D10),
> +
> +       /* GP2_10 = SCL4 */
> +       PINMUX_IPSR_MSEL(IP1SR2_11_8,   GP2_10, SEL_I2C4_3),
> +       PINMUX_IPSR_GPSR(IP1SR2_11_8,   TCLK2),

TCLK2_B

> +       PINMUX_IPSR_GPSR(IP1SR2_11_8,   MSIOF5_RXD),
> +       PINMUX_IPSR_GPSR(IP1SR2_11_8,   D11),
> +
> +       /* GP2_11 = SDA4 */
> +       PINMUX_IPSR_MSEL(IP1SR2_15_12,  GP2_11, SEL_I2C4_3),
> +       PINMUX_IPSR_GPSR(IP1SR2_15_12,  TCLK3),
> +       PINMUX_IPSR_GPSR(IP1SR2_15_12,  MSIOF5_TXD),
> +       PINMUX_IPSR_GPSR(IP1SR2_15_12,  D12),
> +
> +       /* GP2_12 = SCL5 */
> +       PINMUX_IPSR_MSEL(IP1SR2_19_16,  GP2_12, SEL_I2C5_3),
> +       PINMUX_IPSR_GPSR(IP1SR2_19_16,  TCLK4),
> +       PINMUX_IPSR_GPSR(IP1SR2_19_16,  MSIOF5_SCK),
> +       PINMUX_IPSR_GPSR(IP1SR2_19_16,  D13),
> +
> +       /* GP2_13 = SDA5 */
> +       PINMUX_IPSR_MSEL(IP1SR2_23_20,  GP2_13, SEL_I2C5_3),
> +       PINMUX_IPSR_GPSR(IP1SR2_23_20,  MSIOF5_SYNC),
> +       PINMUX_IPSR_GPSR(IP1SR2_23_20,  D14),
> +
> +       /* GP2_14 = SCL6 */
> +       PINMUX_IPSR_MSEL(IP1SR2_27_24,  GP2_14, SEL_I2C6_3),
> +       PINMUX_IPSR_GPSR(IP1SR2_27_24,  IRQ4),
> +       PINMUX_IPSR_GPSR(IP1SR2_27_24,  MSIOF5_SS1),
> +       PINMUX_IPSR_GPSR(IP1SR2_27_24,  D15),
> +
> +       /* GP2_15 = SDA6 */
> +       PINMUX_IPSR_MSEL(IP1SR2_31_28,  GP2_15, SEL_I2C6_3),
> +       PINMUX_IPSR_GPSR(IP1SR2_31_28,  IRQ5),
> +       PINMUX_IPSR_GPSR(IP1SR2_31_28,  MSIOF5_SS2),
> +       PINMUX_IPSR_GPSR(IP1SR2_31_28,  CPG_CPCKOUT),
> +
> +       /* IP2SR2 */
> +       PINMUX_IPSR_GPSR(IP2SR2_3_0,    FXR_TXDA),

FXR_TXDA_A

> +       PINMUX_IPSR_GPSR(IP2SR2_3_0,    MSIOF3_SS1),
> +
> +       PINMUX_IPSR_GPSR(IP2SR2_7_4,    RXDA_EXTFXR),

RXDA_EXTFXR_A

> +       PINMUX_IPSR_GPSR(IP2SR2_7_4,    MSIOF3_SS2),
> +       PINMUX_IPSR_GPSR(IP2SR2_7_4,    BS_N),
> +
> +       PINMUX_IPSR_GPSR(IP2SR2_11_8,   FXR_TXDB),
> +       PINMUX_IPSR_GPSR(IP2SR2_11_8,   MSIOF3_RXD),
> +       PINMUX_IPSR_GPSR(IP2SR2_11_8,   RD_N),
> +
> +       PINMUX_IPSR_GPSR(IP2SR2_15_12,  RXDB_EXTFXR),
> +       PINMUX_IPSR_GPSR(IP2SR2_15_12,  MSIOF3_TXD),
> +       PINMUX_IPSR_GPSR(IP2SR2_15_12,  WE0_N),
> +
> +       PINMUX_IPSR_GPSR(IP2SR2_19_16,  CLK_EXTFXR),
> +       PINMUX_IPSR_GPSR(IP2SR2_19_16,  MSIOF3_SCK),
> +       PINMUX_IPSR_GPSR(IP2SR2_19_16,  WE1_N),
> +
> +       PINMUX_IPSR_GPSR(IP2SR2_23_20,  TPU0TO0),
> +       PINMUX_IPSR_GPSR(IP2SR2_23_20,  MSIOF3_SYNC),
> +       PINMUX_IPSR_GPSR(IP2SR2_23_20,  RD_WR_N),
> +
> +       PINMUX_IPSR_GPSR(IP2SR2_27_24,  TPU0TO1),
> +       PINMUX_IPSR_GPSR(IP2SR2_27_24,  CLKOUT),
> +
> +       PINMUX_IPSR_GPSR(IP2SR2_31_28,  TCLK1),

This should be TCLK1_A.

> +       PINMUX_IPSR_GPSR(IP2SR2_31_28,  EX_WAIT0),
> +


> +       /* IP0SR3 */
> +       PINMUX_IPSR_GPSR(IP0SR3_7_4,    CANFD0_TX),

FXR_TXDA_B?
TX1_B?

> +
> +       PINMUX_IPSR_GPSR(IP0SR3_11_8,   CANFD0_RX),

RXDA_EXTFXR_B?
RX1_B?

[...]

> +static const struct pinmux_drive_reg pinmux_drive_regs[] = {

> +       { PINMUX_DRIVE_REG("DRV2CTRL9", 0xe6069888) {
> +               { RCAR_GP_PIN(9, 20), 16, 3 },  /* AVB5_AVTP_PPS */
> +               { RCAR_GP_PIN(9, 19), 12, 3 },  /* AVB5_AVTP_CAPTURE */
> +               { RCAR_GP_PIN(9, 18),  8, 3 },  /* AVB5_AVTP_MATCH */
> +               { RCAR_GP_PIN(9, 17),  4, 3 },  /* AVB5_LINK */
> +               { RCAR_GP_PIN(9, 16),  0, 3 },  /* AVB5_PHY_INT */
> +       } },

Do we need DRV0CTRLSYS and DRV1CTRLSYS?

> +       { },
> +};
> +
> +enum ioctrl_regs {
> +       POC0,
> +       POC1,
> +       POC2,
> +       POC3,

Shouldn't we omit POC3? It has no documented bits.

> +       POC4,
> +       POC5,
> +       POC6,
> +       POC7,
> +       POC8,
> +       POC9,
> +       TD1SEL0,
> +};
> +
> +static const struct pinmux_ioctrl_reg pinmux_ioctrl_regs[] = {
> +       [POC0] = { 0xe60580a0, },
> +       [POC1] = { 0xe60500a0, },
> +       [POC2] = { 0xe60508a0, },
> +       [POC3] = { 0xe60588a0, },

Should we list POC3? It has no documented bits.

> +       [POC4] = { 0xe60600a0, },
> +       [POC5] = { 0xe60608a0, },
> +       [POC6] = { 0xe60680a0, },
> +       [POC7] = { 0xe60688a0, },
> +       [POC8] = { 0xe60690a0, },
> +       [POC9] = { 0xe60698a0, },
> +       [TD1SEL0] = { 0xe6058124, },
> +       { /* sentinel */ },
> +};

> +static const struct pinmux_bias_reg pinmux_bias_regs[] = {
> +       { PINMUX_BIAS_REG("PUEN0", 0xe60580c0, "PUD0", 0xe60580e0) {
> +               [ 0] = RCAR_GP_PIN(0,  0),
> +               [ 1] = RCAR_GP_PIN(0,  1),
> +               [ 2] = RCAR_GP_PIN(0,  2),
> +               [ 3] = RCAR_GP_PIN(0,  3),
> +               [ 4] = RCAR_GP_PIN(0,  4),
> +               [ 5] = RCAR_GP_PIN(0,  5),
> +               [ 6] = RCAR_GP_PIN(0,  6),
> +               [ 7] = RCAR_GP_PIN(0,  7),
> +               [ 8] = RCAR_GP_PIN(0,  8),
> +               [ 9] = RCAR_GP_PIN(0,  9),
> +               [10] = RCAR_GP_PIN(0, 10),
> +               [11] = RCAR_GP_PIN(0, 11),
> +               [12] = RCAR_GP_PIN(0, 12),
> +               [13] = RCAR_GP_PIN(0, 13),
> +               [14] = RCAR_GP_PIN(0, 14),
> +               [15] = RCAR_GP_PIN(0, 15),
> +               [16] = RCAR_GP_PIN(0, 16),
> +               [17] = RCAR_GP_PIN(0, 17),
> +               [18] = RCAR_GP_PIN(0, 18),
> +               [19] = RCAR_GP_PIN(0, 19),
> +               [20] = RCAR_GP_PIN(0, 20),
> +               [21] = RCAR_GP_PIN(0, 21),
> +               [22] = RCAR_GP_PIN(0, 22),
> +               [23] = RCAR_GP_PIN(0, 23),
> +               [24] = RCAR_GP_PIN(0, 24),
> +               [25] = RCAR_GP_PIN(0, 25),
> +               [26] = RCAR_GP_PIN(0, 26),
> +               [27] = RCAR_GP_PIN(0, 27),
> +               [28] = SH_PFC_PIN_NONE,
> +               [29] = SH_PFC_PIN_NONE,
> +               [30] = SH_PFC_PIN_NONE,
> +               [31] = SH_PFC_PIN_NONE,
> +       } },

[...]

I think it wouldn't hurt to add comments with the pin names, like we
have for other R-Car SoCs, as the PUENn/PUDn register documentation
in the User Manual refers to pin names.

> +       { /* sentinel */ },

What about PUDSYS?

> +};
> +
> +static unsigned int r8a779a0_pinmux_get_bias(struct sh_pfc *pfc,
> +                                           unsigned int pin)
> +{
> +       const struct pinmux_bias_reg *reg;
> +       unsigned int bit;
> +
> +       reg = sh_pfc_pin_to_bias_reg(pfc, pin, &bit);
> +       if (!reg)
> +               return PIN_CONFIG_BIAS_DISABLE;
> +
> +       if (!(sh_pfc_read(pfc, reg->puen) & BIT(bit)))
> +               return PIN_CONFIG_BIAS_DISABLE;
> +       else if (sh_pfc_read(pfc, reg->pud) & BIT(bit))
> +               return PIN_CONFIG_BIAS_PULL_UP;
> +       else
> +               return PIN_CONFIG_BIAS_PULL_DOWN;
> +}
> +
> +static void r8a779a0_pinmux_set_bias(struct sh_pfc *pfc, unsigned int pin,
> +                                  unsigned int bias)
> +{
> +       const struct pinmux_bias_reg *reg;
> +       u32 enable, updown;
> +       unsigned int bit;
> +
> +       reg = sh_pfc_pin_to_bias_reg(pfc, pin, &bit);
> +       if (!reg)
> +               return;
> +
> +       enable = sh_pfc_read(pfc, reg->puen) & ~BIT(bit);
> +       if (bias != PIN_CONFIG_BIAS_DISABLE)
> +               enable |= BIT(bit);
> +
> +       updown = sh_pfc_read(pfc, reg->pud) & ~BIT(bit);
> +       if (bias == PIN_CONFIG_BIAS_PULL_UP)
> +               updown |= BIT(bit);
> +
> +       sh_pfc_write(pfc, reg->pud, updown);
> +       sh_pfc_write(pfc, reg->puen, enable);
> +}
> +
> +static const struct sh_pfc_soc_operations pinmux_ops = {
> +       .pin_to_pocctrl = r8a779a0_pin_to_pocctrl,
> +       .get_bias = r8a779a0_pinmux_get_bias,
> +       .set_bias = r8a779a0_pinmux_set_bias,

You can just use the common rcar_pinmux_[gs]et_bias() helpers.

> +};

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
