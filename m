Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27B7742D918
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Oct 2021 14:13:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230373AbhJNMP2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 Oct 2021 08:15:28 -0400
Received: from mail-ua1-f50.google.com ([209.85.222.50]:38428 "EHLO
        mail-ua1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230132AbhJNMPZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Oct 2021 08:15:25 -0400
Received: by mail-ua1-f50.google.com with SMTP id h19so10787196uax.5;
        Thu, 14 Oct 2021 05:13:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YhS/gTTrb9l455SMO6iHYhM3FY5w8DxWX6RtWlx1w0I=;
        b=zPDy5FmK4lHCnGfjQLeIEViDc4Kp36SUC/z8cNWogXFp67TnISNqb8x7WTGrbEBrPz
         Jezb7QFdNHtDrQaX00cBezFYKXoi1EUpFb4SICBLE0hUrKZsIRKCqR5eZmX1uWkxPXYL
         M+UdjlWPqWWpFG/A3bkdZ7A62ozMiUjMNDHInvEk1AyH/qc0LMWTsibv9Ce5Y5zybsdp
         NGOUqPPxHSDLVPY3hKaPwA6Z1gCucPQ7WhsnhYVGC3SZu4YhN9k0q3M4BtbA4F+6ZUsz
         rCx/x32nMaCRAplkVvIn6rM+R05T1Ool9oWaAtBzSXOZ8XfjgeS8A7SRlbXRd2zwc+Pb
         q9Cw==
X-Gm-Message-State: AOAM532KK0RZ6a5CVSu6ntKiEMuKRPrO9FNjDhMjax+FztBUPi3uS74g
        Ppuh2P0kQSo5bipyGPhA86GQnPZDEp8ck35dwJE=
X-Google-Smtp-Source: ABdhPJxmKbrfvHjxzt6ygZC2m0yxQnP8oK0YRtLB0Umnq5Ve3DNVvLMgFddbh0uKNcnVua4mxgnJjfmX6hFIJNUZHEI=
X-Received: by 2002:a67:cb0a:: with SMTP id b10mr6267923vsl.9.1634213599075;
 Thu, 14 Oct 2021 05:13:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210913170436.243-1-alexander.helms.jy@renesas.com> <20210913170436.243-3-alexander.helms.jy@renesas.com>
In-Reply-To: <20210913170436.243-3-alexander.helms.jy@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 14 Oct 2021 14:13:07 +0200
Message-ID: <CAMuHMdVhBFYVpNTcCzr-uTmoS3_t4L8At9+9c3E233MB+RZKwQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] clk: Add ccf driver for Renesas 8T49N241
To:     Alex Helms <alexander.helms.jy@renesas.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        david.cater.jc@renesas.com, Michal Simek <michal.simek@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

(Hi Alex,

On Mon, Sep 13, 2021 at 7:05 PM Alex Helms
<alexander.helms.jy@renesas.com> wrote:
> This is a common clock framework driver that supports the 8T49N241 chip.
> No other chips in the family are currently supported. The driver
> supports setting the rate for all four outputs on the chip and
> automatically calculating/setting the appropriate VCO value.
>
> The driver can read a full register map from the device tree
> and will use that register map to initialize the attached device
> (via I2C) when the system boots. Any configuration not supported by
> the common clock framework must be done via the full register map,
> including optimized settings.
>
> All outputs are currently assumed to be LVDS unless overridden in
> the full register map in the DT.
>
> Signed-off-by: Alex Helms <alexander.helms.jy@renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/clk/8t49n24x-core.c
> @@ -0,0 +1,836 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* 8t49n24x-core.c - Program 8T49N24x settings via I2C (common code)
> + *
> + * Copyright (C) 2018, Renesas Electronics America <david.cater.jc@renesas.com>
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/regmap.h>
> +
> +#include "8t49n24x-core.h"
> +
> +/*
> + * In Timing Commander, Q0 is changed from 25MHz to Q0 75MHz, the following
> + * changes occur:
> + *
> + * 2 bytes change in EEPROM data string.
> + *
> + * DSM_INT R0025[0],R0026[7:0] : 35 => 30
> + * NS2_Q0 R0040[7:0],R0041[7:0] : 14 => 4
> + *
> + * In EEPROM
> + * 1. R0026
> + * 2. R0041
> + *
> + * Note that VCO_Frequency (metadata) also changed (3500 =>3000).
> + * This reflects a change to DSM_INT.
> + *
> + * Note that the Timing Commander code has workarounds in the workflow scripts
> + * to handle dividers for the 8T49N241 (because the development of that GUI
> + * predates chip override functionality). That affects NS1_Qx (x in 1-3)
> + * and NS2_Qx. NS1_Qx contains the upper bits of NS_Qx, and NS2_Qx contains
> + * the lower bits. That is NOT the case for Q0, though. In that case NS1_Q0
> + * is the 1st stage output divider (/5, /6, /4) and NS2_Q0 is the 16-bit
> + * second stage (with actual divide being twice the value stored in the
> + * register).
> + *
> + * NS1_Q0 R003F[1:0]
> + */
> +
> +#define RENESAS24X_VCO_MIN                     2999997000u
> +#define RENESAS24X_VCO_MAX                     4000004000u
> +#define RENESAS24X_VCO_OPT                     3500000000u
> +#define RENESAS24X_MIN_INT_DIVIDER     6
> +#define RENESAS24X_MIN_NS1                     4
> +#define RENESAS24X_MAX_NS1                     6
> +
> +static u8 q0_ns1_options[3] = { 5, 6, 4 };

const

> +
> +/**
> + * __renesas_bits_to_shift - num bits to shift given specified mask
> + * @mask:      32-bit word input to count zero bits on right
> + *
> + * Given a bit mask indicating where a value will be stored in
> + * a register, return the number of bits you need to shift the value
> + * before ORing it into the register value.
> + *
> + * Return: number of bits to shift
> + */
> +int __renesas_bits_to_shift(unsigned int mask)
> +{
> +       /* the number of zero bits on the right */
> +       unsigned int c = 32;
> +
> +       mask &= ~mask + 1;
> +       if (mask)
> +               c--;
> +       if (mask & 0x0000FFFF)
> +               c -= 16;
> +       if (mask & 0x00FF00FF)
> +               c -= 8;
> +       if (mask & 0x0F0F0F0F)
> +               c -= 4;
> +       if (mask & 0x33333333)
> +               c -= 2;
> +       if (mask & 0x55555555)
> +               c -= 1;
> +       return c;
> +}

Can't you use __ffs() instead?

> +
> +/*
> + * TODO: Consider replacing this with regmap_multi_reg_write, which
> + * supports introducing a delay after each write. Experiment to see if
> + * the writes succeed consistently when using that API.
> + */
> +static int regmap_bulk_write_with_retry(struct regmap *map, unsigned int offset,
> +                                       u8 *val, int val_count,
> +                                       int max_attempts)
> +{
> +       int err = 0, count = 1;
> +
> +       do {
> +               err = regmap_bulk_write(map, offset, val, val_count);
> +               if (err == 0)
> +                       return 0;
> +               usleep_range(100, 200);
> +       } while (count++ <= max_attempts);
> +       return err;
> +}
> +
> +static int regmap_write_with_retry(struct regmap *map, unsigned int offset,
> +                                  unsigned int val, int max_attempts)
> +{
> +       int err = 0, count = 1;
> +
> +       do {
> +               err = regmap_write(map, offset, val);
> +               if (err == 0)
> +                       return 0;

BTW, which error do you see when you get here?

> +               usleep_range(100, 200);
> +       } while (count++ <= max_attempts);
> +       return err;
> +}

Do we need write_poll_timeout()/regmap_write_poll_timeout(), cfr.
the existing read_poll_timeout()/regmap_read_poll_timeout()?

> +
> +/*
> + * TODO: Consider using regmap_multi_reg_write instead. Explore
> + * use of regmap to configure WRITE_BLOCK_SIZE, and using the delay
> + * mechanism in regmap_multi_reg_write instead of retrying multiple
> + * times (regmap_bulk_write_with_retry).
> + */
> +int __renesas_i2c_write_bulk(struct i2c_client *client, struct regmap *map,
> +                            unsigned int reg, u8 val[], size_t val_count)
> +{
> +       char dbg[128];
> +       u8 block[WRITE_BLOCK_SIZE];
> +       unsigned int block_offset = reg;
> +       int x = 0, err = 0, currentOffset = 0;

unsigned int x (or i, for loop counters)

> +
> +       dev_dbg(&client->dev,
> +               "I2C->0x%04x : [hex] . First byte: %02x, Second byte: %02x",
> +               reg, reg >> 8, reg & 0xFF);
> +
> +       dbg[0] = 0;
> +
> +       for (x = 0; x < val_count; x++) {
> +               char data[4];
> +
> +               block[currentOffset++] = val[x];
> +               sprintf(data, "%02x ", val[x]);
> +               strcat(dbg, data);
> +               if (x > 0 && (x + 1) % WRITE_BLOCK_SIZE == 0) {
> +                       dev_dbg(&client->dev, "%s", dbg);

Please use *ph to print the data in val[].
That way you only do the formatting when debugging is enabled,
and you don't need dbg[] on the stack.

See Documentation/core-api/printk-formats.rst.

> +                       dbg[0] = '\0';
> +                       sprintf(dbg,
> +                               "(loop) calling regmap_bulk_write @ 0x%04x [%d bytes]",
> +                               block_offset, WRITE_BLOCK_SIZE);
> +                       dev_dbg(&client->dev, "%s", dbg);
> +                       dbg[0] = '\0';
> +                       err = regmap_bulk_write_with_retry(map, block_offset, block,
> +                                                          WRITE_BLOCK_SIZE, 5);
> +                       if (err)
> +                               break;
> +                       block_offset += WRITE_BLOCK_SIZE;
> +                       currentOffset = 0;
> +               }
> +       }
> +       if (err == 0 && currentOffset > 0) {
> +               dev_dbg(&client->dev, "%s", dbg);
> +               dev_dbg(&client->dev,
> +                       "(final) calling regmap_bulk_write @ 0x%04x [%d bytes]",
> +                       block_offset, currentOffset);
> +               err = regmap_bulk_write_with_retry(map, block_offset, block, currentOffset, 5);
> +       }
> +
> +       return err;
> +}
> +
> +static int __i2c_write(struct i2c_client *client, struct regmap *map,
> +                      unsigned int reg, unsigned int val)
> +{
> +       int err = 0;
> +
> +       dev_dbg(&client->dev, "I2C->0x%x : [hex] %x", reg, val);
> +       err = regmap_write_with_retry(map, reg, val, 5);
> +       usleep_range(100, 200);
> +       return err;
> +}
> +
> +static int __i2c_write_with_mask(struct i2c_client *client, struct regmap *map,
> +                                unsigned int reg, u8 val, u8 original, u8 mask)
> +{
> +       return __i2c_write(client, map, reg,
> +                          ((val << __renesas_bits_to_shift(mask)) & mask) | (original & ~mask));
> +}
> +
> +int renesas24x_get_offsets(u8 output_num, struct clk_register_offsets *offsets)

Perhaps s/renesas24x/r8t49n24x/, everywhere?

> +{
> +       switch (output_num) {
> +       case 0:
> +               offsets->oe_offset = RENESAS24X_REG_OUTEN;
> +               offsets->oe_mask = RENESAS24X_REG_OUTEN0_MASK;
> +               offsets->dis_mask = RENESAS24X_REG_Q0_DIS_MASK;
> +               offsets->ns1_offset = RENESAS24X_REG_NS1_Q0;
> +               offsets->ns1_offset_mask = RENESAS24X_REG_NS1_Q0_MASK;
> +               offsets->ns2_15_8_offset = RENESAS24X_REG_NS2_Q0_15_8;
> +               offsets->ns2_7_0_offset = RENESAS24X_REG_NS2_Q0_7_0;

The last four are never used.

> +               break;
> +       case 1:
> +               offsets->oe_offset = RENESAS24X_REG_OUTEN;
> +               offsets->oe_mask = RENESAS24X_REG_OUTEN1_MASK;
> +               offsets->dis_mask = RENESAS24X_REG_Q1_DIS_MASK;
> +               offsets->n_17_16_offset = RENESAS24X_REG_N_Q1_17_16;
> +               offsets->n_17_16_mask = RENESAS24X_REG_N_Q1_17_16_MASK;
> +               offsets->n_15_8_offset = RENESAS24X_REG_N_Q1_15_8;
> +               offsets->n_7_0_offset = RENESAS24X_REG_N_Q1_7_0;
> +               offsets->nfrac_27_24_offset = RENESAS24X_REG_NFRAC_Q1_27_24;
> +               offsets->nfrac_27_24_mask = RENESAS24X_REG_NFRAC_Q1_27_24_MASK;
> +               offsets->nfrac_23_16_offset = RENESAS24X_REG_NFRAC_Q1_23_16;
> +               offsets->nfrac_15_8_offset = RENESAS24X_REG_NFRAC_Q1_15_8;
> +               offsets->nfrac_7_0_offset = RENESAS24X_REG_NFRAC_Q1_7_0;
> +               break;
> +       case 2:
> +               offsets->oe_offset = RENESAS24X_REG_OUTEN;
> +               offsets->oe_mask = RENESAS24X_REG_OUTEN2_MASK;
> +               offsets->dis_mask = RENESAS24X_REG_Q2_DIS_MASK;
> +               offsets->n_17_16_offset = RENESAS24X_REG_N_Q2_17_16;
> +               offsets->n_17_16_mask = RENESAS24X_REG_N_Q2_17_16_MASK;
> +               offsets->n_15_8_offset = RENESAS24X_REG_N_Q2_15_8;
> +               offsets->n_7_0_offset = RENESAS24X_REG_N_Q2_7_0;
> +               offsets->nfrac_27_24_offset = RENESAS24X_REG_NFRAC_Q2_27_24;
> +               offsets->nfrac_27_24_mask = RENESAS24X_REG_NFRAC_Q2_27_24_MASK;
> +               offsets->nfrac_23_16_offset = RENESAS24X_REG_NFRAC_Q2_23_16;
> +               offsets->nfrac_15_8_offset = RENESAS24X_REG_NFRAC_Q2_15_8;
> +               offsets->nfrac_7_0_offset = RENESAS24X_REG_NFRAC_Q2_7_0;
> +               break;
> +       case 3:
> +               offsets->oe_offset = RENESAS24X_REG_OUTEN;
> +               offsets->oe_mask = RENESAS24X_REG_OUTEN3_MASK;
> +               offsets->dis_mask = RENESAS24X_REG_Q3_DIS_MASK;
> +               offsets->n_17_16_offset = RENESAS24X_REG_N_Q3_17_16;
> +               offsets->n_17_16_mask = RENESAS24X_REG_N_Q3_17_16_MASK;
> +               offsets->n_15_8_offset = RENESAS24X_REG_N_Q3_15_8;
> +               offsets->n_7_0_offset = RENESAS24X_REG_N_Q3_7_0;
> +               offsets->nfrac_27_24_offset = RENESAS24X_REG_NFRAC_Q3_27_24;
> +               offsets->nfrac_27_24_mask = RENESAS24X_REG_NFRAC_Q3_27_24_MASK;
> +               offsets->nfrac_23_16_offset = RENESAS24X_REG_NFRAC_Q3_23_16;
> +               offsets->nfrac_15_8_offset = RENESAS24X_REG_NFRAC_Q3_15_8;
> +               offsets->nfrac_7_0_offset = RENESAS24X_REG_NFRAC_Q3_7_0;
> +               break;

Note that this function does not always initialize all fields of offsets.
Could that be(come) a problem?

> +       default:
> +               return -EINVAL;

This cannot happen.

> +       }
> +       return 0;
> +}
> +
> +/**
> + * renesas24x_calc_div_q0 - Calculate dividers and VCO freq to generate
> + *             the specified Q0 frequency.
> + * @chip:      Device data structure. contains all requested frequencies
> + *             for all outputs.
> + *
> + * The actual output divider is ns1 * ns2 * 2. fOutput = fVCO / (ns1 * ns2 * 2)
> + *
> + * The options for ns1 (when the source is the VCO) are 4,5,6. ns2 is a
> + * 16-bit value.
> + *
> + * chip->divs: structure for specifying ns1/ns2 values. If 0 after this
> + * function, Q0 is not requested
> + *
> + * Return: 0 on success, negative errno otherwise.

Always return zero...

> + */
> +static int renesas24x_calc_div_q0(struct clk_renesas24x_chip *chip)

... so change this to return void?

> +{
> +       u8 x = 0;

unsigned int

> +       u32 min_div = 0, max_div = 0, best_vco = 0;
> +       u16 min_ns2 = 0, max_ns2 = 0;

unsigned int

> +       bool is_lower_vco = false;
> +
> +       chip->divs.ns1_q0 = 0;
> +       chip->divs.ns2_q0 = 0;
> +
> +       if (chip->clk[0].requested == 0)
> +               return 0;
> +
> +       min_div = div64_u64((u64)RENESAS24X_VCO_MIN, chip->clk[0].requested * 2) * 2;
> +       max_div = div64_u64((u64)RENESAS24X_VCO_MAX, chip->clk[0].requested * 2) * 2;

Do you really need an expensive 64-by-64 bit division?
RENESAS24X_VCO_M{IN,AX} fit in 32-bit.

> +
> +       dev_dbg(&chip->i2c_client->dev,
> +               "requested: %u, min_div: %u, max_div: %u",
> +               chip->clk[0].requested, min_div, max_div);
> +
> +       min_ns2 = div64_u64((u64)min_div, RENESAS24X_MAX_NS1 * 2);
> +       max_ns2 = div64_u64((u64)max_div, RENESAS24X_MIN_NS1 * 2);

Likewise, m{in,ax}_div are u32.

> +
> +       dev_dbg(&chip->i2c_client->dev, "min_ns2: %u, max_ns2: %u", min_ns2, max_ns2);
> +
> +       for (x = 0; x < ARRAY_SIZE(q0_ns1_options); x++) {
> +               u16 y = min_ns2;

unsigned int y?

> +/**
> + * renesas24x_calc_divs - Calculate dividers to generate the specified frequency.
> + * @chip:      Device data structure. contains all requested frequencies
> + *             for all outputs.
> + *
> + * Calculate the clock dividers (dsmint, dsmfrac for vco; ns1/ns2 for q0,
> + * n/nfrac for q1-3) for a given target frequency.
> + *
> + * Return: 0 on success, negative errno otherwise.
> + */
> +static int renesas24x_calc_divs(struct clk_renesas24x_chip *chip)
> +{
> +       u32 vco = 0;
> +       int result = 0;
> +
> +       result = renesas24x_calc_div_q0(chip);
> +       if (result < 0)
> +               return result;

renesas24x_calc_div_q0() always returns 0, so this cannot happen.

> +
> +       dev_dbg(&chip->i2c_client->dev,
> +               "after renesas24x_calc_div_q0. ns1: %u [/%u], ns2: %u",
> +               chip->divs.ns1_q0, q0_ns1_options[chip->divs.ns1_q0],
> +               chip->divs.ns2_q0);
> +
> +       chip->divs.dsmint = 0;
> +       chip->divs.dsmfrac = 0;
> +
> +       if (chip->clk[0].requested > 0) {
> +               /* Q0 is in use and is governing the actual VCO freq */
> +               vco = q0_ns1_options[chip->divs.ns1_q0] * chip->divs.ns2_q0
> +                       * 2 * chip->clk[0].requested;
> +       } else {
> +               u32 freq = 0;
> +               u32 walk = 0;

unsigned int (i for loop counters?)

> +               u32 min_div = 0, max_div = 0;
> +               bool is_lower_vco = false;
> +
> +               /*
> +                * Q0 is not in use. Use the first requested (fractional)
> +                * output frequency as the one controlling the VCO.
> +                */
> +               for (walk = 1; walk < NUM_OUTPUTS; walk++) {
> +                       if (chip->clk[walk].requested != 0) {
> +                               freq = chip->clk[walk].requested;
> +                               break;
> +                       }
> +               }
> +
> +               if (freq == 0) {
> +                       dev_err(&chip->i2c_client->dev, "NO FREQUENCIES SPECIFIED");
> +                       return -EINVAL;
> +               }
> +
> +               /*
> +                * First, determine the min/max div for the output frequency.
> +                */
> +               min_div = RENESAS24X_MIN_INT_DIVIDER;
> +               max_div = div64_u64((u64)RENESAS24X_VCO_MAX, freq * 2) * 2;

A 32-bit division will do.

> +
> +               dev_dbg(&chip->i2c_client->dev,
> +                       "calc_divs for fractional output. freq: %u, min_div: %u, max_div: %u",
> +                       freq, min_div, max_div);
> +
> +               walk = min_div;
> +
> +               while (walk <= max_div) {
> +                       u32 current_vco = freq * walk;
> +
> +                       dev_dbg(&chip->i2c_client->dev,
> +                               "calc_divs for fractional output. walk: %u, freq: %u, vco: %u",
> +                               walk, freq, vco);
> +                       if (current_vco >= RENESAS24X_VCO_MIN &&
> +                           vco <= RENESAS24X_VCO_MAX) {
> +                               if (current_vco <= RENESAS24X_VCO_OPT) {
> +                                       if (current_vco > vco || !is_lower_vco) {
> +                                               is_lower_vco = true;
> +                                               vco = current_vco;
> +                                       }
> +                               } else if (!is_lower_vco && current_vco > vco) {
> +                                       vco = current_vco;
> +                               }
> +                       }
> +                       /* Divider must be even. */
> +                       walk += 2;
> +               }
> +       }
> +
> +       if (vco != 0) {

if (vco) and return early, to reduce indentation below?

> +               u32 pfd = 0;
> +               u64 rem = 0;
> +               int x = 0;

unsigned int (i for loop counters?)

> +
> +               /* Setup dividers for outputs with fractional dividers. */
> +               for (x = 1; x < NUM_OUTPUTS; x++) {
> +                       if (chip->clk[x].requested != 0) {
> +                               /*
> +                                * The value written to the chip is half
> +                                * the calculated divider.
> +                                */
> +                               chip->divs.nint[x - 1] = div64_u64_rem((u64)vco,
> +                                                                      chip->clk[x].requested * 2,
> +                                                                      &rem);
> +                               chip->divs.nfrac[x - 1] = div64_u64(rem * 1 << 28,

rem << 28

> +                                                                   chip->clk[x].requested * 2);
> +                               dev_dbg(&chip->i2c_client->dev,
> +                                       "div to get Q%i freq %u from vco %u: int part: %u, rem: %llu, frac part: %u",
> +                                       x, chip->clk[x].requested,
> +                                       vco, chip->divs.nint[x - 1], rem,
> +                                       chip->divs.nfrac[x - 1]);
> +                       }
> +               }
> +
> +               /* Calculate freq for pfd */
> +               pfd = chip->input_clk_freq * (chip->doubler_disabled ? 1 : 2);
> +
> +               /*
> +                * Calculate dsmint & dsmfrac:
> +                * -----------------------------
> +                * dsm = float(vco)/float(pfd)
> +                * dsmfrac = dsm-floor(dsm) * 2^21
> +                * rem = vco % pfd
> +                * therefore:
> +                * dsmfrac = (rem * 2^21)/pfd
> +                */
> +               chip->divs.dsmint = div64_u64_rem(vco, pfd, &rem);
> +               chip->divs.dsmfrac = div64_u64(rem * 1 << 21, pfd);

rem << 21

> +
> +               dev_dbg(&chip->i2c_client->dev,
> +                       "vco: %u, pfd: %u, dsmint: %u, dsmfrac: %u, rem: %llu",
> +                       vco, pfd, chip->divs.dsmint,
> +                       chip->divs.dsmfrac, rem);
> +       } else {
> +               dev_err(&chip->i2c_client->dev, "no integer divider in range found. NOT SUPPORTED.");
> +               return -EINVAL;
> +       }
> +       return 0;
> +}
> +
> +/**
> + * renesas24x_enable_output - Enable/disable a particular output
> + * @chip:      Device data structure
> + * @output:    Output to enable/disable
> + * @enable:    Enable (true/false)
> + *
> + * Return: passes on regmap_write return value.
> + */
> +static int renesas24x_enable_output(struct clk_renesas24x_chip *chip, u8 output,
> +                                   bool enable)
> +{
> +       int err = 0;
> +       struct clk_register_offsets offsets;
> +       struct i2c_client *client = chip->i2c_client;
> +
> +       /*
> +        * When an output is enabled, enable it in the original
> +        * data read from the chip and cached. Otherwise it may be
> +        * accidentally turned off when another output is enabled.
> +        *
> +        * E.g., the driver starts with all outputs off in reg_out_en_x.
> +        * Q1 is enabled with the appropriate mask. Q2 is then enabled,
> +        * which results in Q1 being turned back off (because Q1 was off
> +        * in reg_out_en_x).
> +        */
> +
> +       err = renesas24x_get_offsets(output, &offsets);
> +       if (err) {
> +               dev_err(&client->dev, "error calling renesas24x_get_offsets for %d: %i",
> +                       output, err);
> +               return err;

This cannot happen.

> +       }
> +
> +       dev_dbg(&client->dev,
> +               "q%u enable? %d. reg_out_en_x before: 0x%x, reg_out_mode_0_1 before: 0x%x",
> +               output, enable, chip->reg_out_en_x, chip->reg_out_mode_0_1);
> +
> +       dev_dbg(&client->dev, "reg_out_mode_2_3 before: 0x%x, reg_qx_dis before: 0x%x",
> +               chip->reg_out_mode_2_3, chip->reg_qx_dis);
> +
> +       chip->reg_out_en_x = chip->reg_out_en_x & ~offsets.oe_mask;
> +       if (enable)
> +               chip->reg_out_en_x |= (1 << __renesas_bits_to_shift(offsets.oe_mask));

... |= BIT(...)

> +
> +       chip->reg_qx_dis = chip->reg_qx_dis & ~offsets.dis_mask;
> +       dev_dbg(&client->dev,
> +               "q%u enable? %d. reg_qx_dis mask: 0x%x, before checking enable: 0x%x",
> +               output, enable, offsets.dis_mask, chip->reg_qx_dis);
> +
> +       if (!enable)
> +               chip->reg_qx_dis |= (1 << __renesas_bits_to_shift(offsets.dis_mask));


... |= BIT(...)

> +
> +       dev_dbg(&client->dev,
> +               "q%u enable? %d. reg_out_en_x after: 0x%x, reg_qx_dis after: 0x%x",
> +               output, enable, chip->reg_out_en_x, chip->reg_qx_dis);
> +
> +       err = __i2c_write(client, chip->regmap, RENESAS24X_REG_OUTEN, chip->reg_out_en_x);
> +       if (err) {
> +               dev_err(&client->dev, "error setting RENESAS24X_REG_OUTEN: %i", err);

dev_err(&client->dev, "error setting %s: %i", "RENESAS24X_REG_OUTEN", err)

so the error message can be shared with those below.

> +               return err;
> +       }
> +
> +       err = __i2c_write(client, chip->regmap, RENESAS24X_REG_OUTMODE0_1, chip->reg_out_mode_0_1);
> +       if (err) {
> +               dev_err(&client->dev, "error setting RENESAS24X_REG_OUTMODE0_1: %i", err);
> +               return err;
> +       }
> +
> +       err = __i2c_write(client, chip->regmap, RENESAS24X_REG_OUTMODE2_3, chip->reg_out_mode_2_3);
> +       if (err) {
> +               dev_err(&client->dev, "error setting RENESAS24X_REG_OUTMODE2_3: %i", err);
> +               return err;
> +       }
> +
> +       err = __i2c_write(client, chip->regmap, RENESAS24X_REG_Q_DIS, chip->reg_qx_dis);
> +       if (err) {
> +               dev_err(&client->dev, "error setting RENESAS24X_REG_Q_DIS: %i", err);
> +               return err;
> +       }
> +
> +       return 0;
> +}
> +
> +/**
> + * renesas24x_update_device - write registers to the chip
> + * @chip:      Device data structure
> + *
> + * Write all values to hardware that we        have calculated.
> + *
> + * Return: passes on regmap_bulk_write return value.
> + */
> +static int renesas24x_update_device(struct clk_renesas24x_chip *chip)
> +{
> +       int err = 0, x = -1;

Why preinitialize err to 0? That value is overwritten before first use.
Why preinitialize x to -1? That value is overwritten before first use.

unsigned int i;

> +       struct i2c_client *client = chip->i2c_client;
> +
> +       dev_dbg(&client->dev, "setting DSM_INT_8 (val %u @ %u)",
> +               chip->divs.dsmint >> 8, RENESAS24X_REG_DSM_INT_8);
> +
> +       err = __i2c_write_with_mask(client, chip->regmap, RENESAS24X_REG_DSM_INT_8,
> +                                   (chip->divs.dsmint >> 8) & RENESAS24X_REG_DSM_INT_8_MASK,
> +                                   chip->reg_dsm_int_8, RENESAS24X_REG_DSM_INT_8_MASK);
> +       if (err) {
> +               dev_err(&client->dev, "error setting RENESAS24X_REG_DSM_INT_8: %i", err);
> +               return err;
> +       }
> +
> +       dev_dbg(&client->dev, "setting DSM_INT_7_0 (val %u @ 0x%x)",
> +               chip->divs.dsmint & 0xFF, RENESAS24X_REG_DSM_INT_7_0);
> +
> +       err = __i2c_write(client, chip->regmap, RENESAS24X_REG_DSM_INT_7_0,
> +                         chip->divs.dsmint & 0xFF);
> +       if (err) {
> +               dev_err(&client->dev, "error setting RENESAS24X_REG_DSM_INT_7_0: %i", err);
> +               return err;
> +       }
> +
> +       dev_dbg(&client->dev,
> +               "setting RENESAS24X_REG_DSMFRAC_20_16 (val %u @ 0x%x)",
> +               chip->divs.dsmfrac >> 16,
> +               RENESAS24X_REG_DSMFRAC_20_16);
> +
> +       err = __i2c_write_with_mask(client, chip->regmap, RENESAS24X_REG_DSMFRAC_20_16,
> +                                   (chip->divs.dsmfrac >> 16) & RENESAS24X_REG_DSMFRAC_20_16_MASK,
> +                                   chip->reg_dsm_int_8, RENESAS24X_REG_DSMFRAC_20_16_MASK);
> +       if (err) {
> +               dev_err(&client->dev, "error setting RENESAS24X_REG_DSMFRAC_20_16: %i", err);
> +               return err;
> +       }
> +
> +       dev_dbg(&client->dev,
> +               "setting RENESAS24X_REG_DSMFRAC_15_8 (val %u @ 0x%x)",
> +               (chip->divs.dsmfrac >> 8) & 0xFF,
> +               RENESAS24X_REG_DSMFRAC_15_8);
> +
> +       err = __i2c_write(client, chip->regmap, RENESAS24X_REG_DSMFRAC_15_8,
> +                         (chip->divs.dsmfrac >> 8) & 0xFF);
> +       if (err) {
> +               dev_err(&client->dev, "error setting RENESAS24X_REG_DSMFRAC_15_8: %i", err);
> +               return err;
> +       }
> +
> +       dev_dbg(&client->dev,
> +               "setting RENESAS24X_REG_DSMFRAC_7_0 (val %u @ 0x%x)",
> +               chip->divs.dsmfrac & 0xFF,
> +               RENESAS24X_REG_DSMFRAC_7_0);
> +
> +       err = __i2c_write(client, chip->regmap, RENESAS24X_REG_DSMFRAC_7_0,
> +                         chip->divs.dsmfrac & 0xFF);
> +       if (err) {
> +               dev_err(&client->dev, "error setting RENESAS24X_REG_DSMFRAC_7_0: %i", err);
> +               return err;
> +       }
> +
> +       dev_dbg(&client->dev,
> +               "setting RENESAS24X_REG_NS1_Q0 (val %u @ 0x%x)",
> +               chip->divs.ns1_q0, RENESAS24X_REG_NS1_Q0);
> +
> +       err = __i2c_write_with_mask(client, chip->regmap, RENESAS24X_REG_NS1_Q0,
> +                                   chip->divs.ns1_q0 & RENESAS24X_REG_NS1_Q0_MASK,
> +                                   chip->reg_ns1_q0, RENESAS24X_REG_NS1_Q0_MASK);
> +       if (err) {
> +               dev_err(&client->dev, "error setting RENESAS24X_REG_NS1_Q0: %i", err);
> +               return err;
> +       }
> +
> +       dev_dbg(&client->dev,
> +               "setting RENESAS24X_REG_NS2_Q0_15_8 (val %u @ 0x%x)",
> +               (chip->divs.ns2_q0 >> 8) & 0xFF, RENESAS24X_REG_NS2_Q0_15_8);
> +
> +       err = __i2c_write(client, chip->regmap, RENESAS24X_REG_NS2_Q0_15_8,
> +                         (chip->divs.ns2_q0 >> 8) & 0xFF);
> +       if (err) {
> +               dev_err(&client->dev, "error setting RENESAS24X_REG_NS2_Q0_15_8: %i", err);
> +               return err;
> +       }
> +
> +       dev_dbg(&client->dev,
> +               "setting RENESAS24X_REG_NS2_Q0_7_0 (val %u @ 0x%x)",
> +               chip->divs.ns2_q0 & 0xFF, RENESAS24X_REG_NS2_Q0_7_0);
> +
> +       err = __i2c_write(client, chip->regmap, RENESAS24X_REG_NS2_Q0_7_0,
> +                         chip->divs.ns2_q0 & 0xFF);
> +       if (err) {
> +               dev_err(&client->dev, "error setting RENESAS24X_REG_NS2_Q0_7_0: %i", err);
> +               return err;
> +       }
> +
> +       dev_dbg(&client->dev,
> +               "calling renesas24x_enable_output for Q0. requestedFreq: %u",
> +               chip->clk[0].requested);
> +       renesas24x_enable_output(chip, 0, chip->clk[0].requested != 0);
> +
> +       dev_dbg(&client->dev, "writing values for q1-q3");
> +       for (x = 1; x < NUM_OUTPUTS; x++) {
> +               struct clk_register_offsets offsets;
> +
> +               if (chip->clk[x].requested != 0) {
> +                       dev_dbg(&client->dev, "calling renesas24x_get_offsets for %u", x);
> +                       err = renesas24x_get_offsets(x, &offsets);
> +                       if (err) {
> +                               dev_err(&client->dev, "error calling renesas24x_get_offsets: %i",
> +                                       err);
> +                               return err;

This cannot happen.

> +                       }

> +/**
> + * renesas24x_set_frequency - Adjust output frequency on the attached chip.
> + * @chip:      Device data structure, including all requested frequencies.
> + *
> + * Return: 0 on success.
> + */
> +int renesas24x_set_frequency(struct clk_renesas24x_chip *chip)
> +{
> +       int err = 0, x = 0;

No need to preinitialize err or x.

unsigned int i

> +       bool all_disabled = true;
> +       struct i2c_client *client = chip->i2c_client;
> +
> +       for (x = 0; x < NUM_OUTPUTS; x++) {
> +               if (chip->clk[x].requested == 0) {
> +                       renesas24x_enable_output(chip, x, false);
> +                       chip->clk[x].actual = 0;
> +               } else {
> +                       all_disabled = false;
> +               }
> +       }
> +
> +       if (all_disabled)
> +               /*
> +                * no requested frequencies, so nothing else to calculate
> +                * or write to the chip. If the consumer wants to disable
> +                * all outputs, they can request 0 for all frequencies.
> +                */
> +               return 0;
> +
> +       if (chip->input_clk_freq == 0) {
> +               dev_err(&client->dev, "no input frequency; can't continue.");
> +               return -EINVAL;
> +       }
> +
> +       err = renesas24x_calc_divs(chip);
> +       if (err) {
> +               dev_err(&client->dev,
> +                       "error calling renesas24x_calc_divs: %i", err);

No need to print an error message, as renesas24x_calc_divs()
has already done that.

> +               return err;
> +       }
> +
> +       err = renesas24x_update_device(chip);
> +       if (err) {
> +               dev_err(&client->dev, "error updating the device: %i", err);
> +               return err;
> +       }
> +
> +       return 0;
> +}
> diff --git a/drivers/clk/8t49n24x-core.h b/drivers/clk/8t49n24x-core.h
> new file mode 100644
> index 000000000..0786aa03a
> --- /dev/null
> +++ b/drivers/clk/8t49n24x-core.h

> +/**
> + * struct renesas24x_output - device output information
> + * @hw:                hw registration info for this specific output clcok. This gets
> + *             passed as an argument to CCF api calls (e.g., set_rate).
> + *             container_of can then be used to get the reference to this
> + *             struct.
> + * @chip:      store a reference to the parent device structure. container_of
> + *             cannot be used to get to the parent device structure from
> + *             renesas24x_output, because clk_renesas24x_chip contains an array of
> + *             output structs (for future enhancements to support devices
> + *             with different numbers of output clocks).
> + * @index:     identifies output on the chip; used in debug statements
> + * @requested: requested output clock frequency (in Hz)
> + * @actual:    actual output clock frequency (in Hz). Will only be set after
> + *             successful update of the device.
> + */
> +struct renesas24x_output {
> +       struct clk_hw hw;
> +       struct clk_renesas24x_chip *chip;
> +       u8 index;
> +       u32 requested;
> +       u32 actual;

Note that the Common Clock Framework uses unsigned long for clock
rates, so you may want to change this.  I do know the maximum
supported rate is 1 GHz, which fits in 32-bit, but future variants
may support more.

> +};

> --- /dev/null
> +++ b/drivers/clk/8t49n24x.c
> @@ -0,0 +1,572 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* 8t49n24x.c - Program 8T49N24x settings via I2C.
> + *
> + * Copyright (C) 2018, Renesas Electronics America <david.cater.jc@renesas.com>
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +
> +#include "8t49n24x-core.h"
> +
> +#define OUTPUTMODE_HIGHZ               0
> +#define OUTPUTMODE_LVDS                        2
> +#define RENESAS24X_MIN_FREQ            1000000L
> +#define RENESAS24X_MAX_FREQ            300000000L

Why L-suffixes, and not U-suffixes?
chip.m{in,ax}_freq are u32?

> +
> +enum clk_renesas24x_variant { renesas24x };
> +
> +static u32 __mask_and_shift(u32 value, u8 mask)
> +{
> +       value &= mask;

It looks weird to mask a 32-bit value with an 8-bit mask.
u8 value?

> +       return value >> __renesas_bits_to_shift(mask);
> +}
> +
> +/**
> + * renesas24x_set_output_mode - Set the mode for a particular clock
> + * output in the register.
> + * @reg:       The current register value before setting the mode.
> + * @mask:      The bitmask identifying where in the register the
> + *             output mode is stored.
> + * @mode:      The mode to set.
> + *
> + * Return: the new register value with the specified mode bits set.
> + */
> +static int renesas24x_set_output_mode(u32 reg, u8 mask, u8 mode)

u8 reg

> +{
> +       if (((reg & mask) >> __renesas_bits_to_shift(mask)) == OUTPUTMODE_HIGHZ) {
> +               reg = reg & ~mask;
> +               reg |= OUTPUTMODE_LVDS << __renesas_bits_to_shift(mask);
> +       }
> +       return reg;
> +}
> +
> +/**
> + * renesas24x_read_from_hw - Get the current values on the hw
> + * @chip:      Device data structure
> + *
> + * Return: 0 on success, negative errno otherwise.
> + */
> +static int renesas24x_read_from_hw(struct clk_renesas24x_chip *chip)
> +{
> +       int err = 0;
> +       u32 tmp = 0, tmp2 = 0;
> +       u8 output = 0;

No need to preinitialize err, tmp2, and output

unsigned int i

> +       struct i2c_client *client = chip->i2c_client;
> +
> +       err = regmap_read(chip->regmap, RENESAS24X_REG_DSM_INT_8, &chip->reg_dsm_int_8);
> +       if (err) {
> +               dev_err(&client->dev, "error reading RENESAS24X_REG_DSM_INT_8: %i", err);
> +               return err;
> +       }
> +
> +       dev_dbg(&client->dev, "reg_dsm_int_8: 0x%x", chip->reg_dsm_int_8);
> +
> +       err = regmap_read(chip->regmap, RENESAS24X_REG_DSMFRAC_20_16_MASK,
> +                         &chip->reg_dsm_frac_20_16);
> +       if (err) {
> +               dev_err(&client->dev, "error reading RENESAS24X_REG_DSMFRAC_20_16_MASK: %i", err);
> +               return err;
> +       }
> +
> +       dev_dbg(&client->dev, "reg_dsm_frac_20_16: 0x%x", chip->reg_dsm_frac_20_16);
> +
> +       err = regmap_read(chip->regmap, RENESAS24X_REG_OUTEN, &chip->reg_out_en_x);
> +       if (err) {
> +               dev_err(&client->dev, "error reading RENESAS24X_REG_OUTEN: %i", err);
> +               return err;
> +       }
> +
> +       dev_dbg(&client->dev, "reg_out_en_x: 0x%x", chip->reg_out_en_x);
> +
> +       err = regmap_read(chip->regmap, RENESAS24X_REG_OUTMODE0_1, &tmp);
> +       if (err) {
> +               dev_err(&client->dev, "error reading RENESAS24X_REG_OUTMODE0_1: %i", err);
> +               return err;
> +       }
> +
> +       tmp2 = renesas24x_set_output_mode(tmp, RENESAS24X_REG_OUTMODE0_MASK, OUTPUTMODE_LVDS);
> +       tmp2 = renesas24x_set_output_mode(tmp2, RENESAS24X_REG_OUTMODE1_MASK, OUTPUTMODE_LVDS);
> +       dev_dbg(&client->dev,
> +               "reg_out_mode_0_1 original: 0x%x. After OUT0/1 to LVDS if necessary: 0x%x",
> +               tmp, tmp2);
> +
> +       chip->reg_out_mode_0_1 = tmp2;
> +       err = regmap_read(chip->regmap, RENESAS24X_REG_OUTMODE2_3, &tmp);
> +       if (err) {
> +               dev_err(&client->dev, "error reading RENESAS24X_REG_OUTMODE2_3: %i", err);
> +               return err;
> +       }
> +
> +       tmp2 = renesas24x_set_output_mode(tmp, RENESAS24X_REG_OUTMODE2_MASK, OUTPUTMODE_LVDS);
> +       tmp2 = renesas24x_set_output_mode(tmp2, RENESAS24X_REG_OUTMODE3_MASK, OUTPUTMODE_LVDS);
> +       dev_dbg(&client->dev,
> +               "reg_out_mode_2_3 original: 0x%x. After OUT2/3 to LVDS if necessary: 0x%x",
> +               tmp, tmp2);
> +
> +       chip->reg_out_mode_2_3 = tmp2;
> +       err = regmap_read(chip->regmap, RENESAS24X_REG_Q_DIS, &chip->reg_qx_dis);
> +       if (err) {
> +               dev_err(&client->dev, "error reading RENESAS24X_REG_Q_DIS: %i", err);
> +               return err;
> +       }
> +
> +       dev_dbg(&client->dev, "reg_qx_dis: 0x%x", chip->reg_qx_dis);
> +
> +       err = regmap_read(chip->regmap, RENESAS24X_REG_NS1_Q0, &chip->reg_ns1_q0);
> +       if (err) {
> +               dev_err(&client->dev, "error reading RENESAS24X_REG_NS1_Q0: %i", err);
> +               return err;
> +       }
> +
> +       dev_dbg(&client->dev, "reg_ns1_q0: 0x%x", chip->reg_ns1_q0);
> +
> +       for (output = 1; output <= 3; output++) {

< NUM_OUTPUTS

> +               struct clk_register_offsets offsets;
> +
> +               err = renesas24x_get_offsets(output, &offsets);
> +               if (err) {
> +                       dev_err(&client->dev, "error calling renesas24x_get_offsets: %i", err);
> +                       return err;

This cannot happen.

> +               }
> +
> +               err = regmap_read(chip->regmap, offsets.n_17_16_offset,
> +                                 &chip->reg_n_qx_17_16[output - 1]);
> +               if (err) {
> +                       dev_err(&client->dev,
> +                               "error reading n_17_16_offset output %d (offset: 0x%x): %i",
> +                               output, offsets.n_17_16_offset, err);
> +                       return err;
> +               }
> +
> +               dev_dbg(&client->dev, "reg_n_qx_17_16[Q%u]: 0x%x", output,
> +                       chip->reg_n_qx_17_16[output - 1]);
> +
> +               err = regmap_read(chip->regmap, offsets.nfrac_27_24_offset,
> +                                 &chip->reg_nfrac_qx_27_24[output - 1]);
> +               if (err) {
> +                       dev_err(&client->dev,
> +                               "error reading nfrac_27_24_offset output %d (offset: 0x%x): %i",
> +                               output, offsets.nfrac_27_24_offset,
> +                               err);
> +                       return err;
> +               }
> +
> +               dev_dbg(&client->dev, "reg_nfrac_qx_27_24[Q%u]: 0x%x", output,
> +                       chip->reg_nfrac_qx_27_24[output - 1]);
> +       }
> +
> +       dev_info(&client->dev, "initial values read from chip successfully");

dev_dbg()

> +
> +       /* Also read DBL_DIS to determine whether the doubler is disabled. */
> +       err = regmap_read(chip->regmap, RENESAS24X_REG_DBL_DIS, &tmp);
> +       if (err) {
> +               dev_err(&client->dev, "error reading RENESAS24X_REG_DBL_DIS: %i", err);
> +               return err;
> +       }
> +
> +       chip->doubler_disabled = __mask_and_shift(tmp, RENESAS24X_REG_DBL_DIS_MASK);
> +       dev_dbg(&client->dev, "doubler_disabled: %d", chip->doubler_disabled);
> +
> +       return 0;
> +}
> +
> +/**
> + * renesas24x_set_rate - Sets the specified output clock to the specified rate.
> + * @hw:                clk_hw struct that identifies the specific output clock.
> + * @rate:      the rate (in Hz) for the specified clock.
> + * @parent_rate:(not sure) the rate for a parent signal (e.g.,
> + *             the VCO feeding the output)
> + *
> + * This function will call renesas24x_set_frequency, which means it will
> + * calculate divider for all requested outputs and update the attached
> + * device (issue I2C commands to update the registers).
> + *
> + * Return: 0 on success.
> + */
> +static int renesas24x_set_rate(struct clk_hw *hw, unsigned long rate,
> +                              unsigned long parent_rate)
> +{
> +       int err = 0;

No need to preinitialize.

> +
> +       /*
> +        * hw->clk is the pointer to the specific output clock the user is
> +        * requesting. We use hw to get back to the output structure for
> +        * the output clock. Set the requested rate in the output structure.
> +        * Note that container_of cannot be used to find the device structure
> +        * (clk_renesas24x_chip) from clk_hw, because clk_renesas24x_chip has an array
> +        * of renesas24x_output structs. That is why it is necessary to use
> +        * output->chip to access the device structure.
> +        */
> +       struct renesas24x_output *output = to_renesas24x_output(hw);
> +       struct i2c_client *client = output->chip->i2c_client;
> +
> +       if (rate < output->chip->min_freq || rate > output->chip->max_freq) {
> +               dev_err(&client->dev,
> +                       "requested frequency (%luHz) is out of range\n", rate);

Does this need to print an error message? dev_dbg()?

> +               return -EINVAL;
> +       }
> +
> +       /*
> +        * Set the requested frequency in the output data structure, and then
> +        * call renesas24x_set_frequency. renesas24x_set_frequency considers all
> +        * requested frequencies when deciding on a vco frequency and
> +        * calculating dividers.
> +        */
> +       output->requested = rate;
> +
> +       dev_info(&client->dev, "calling renesas24x_set_frequency for Q%u. rate: %lu",
> +                output->index, rate);

dev_dbg()

> +       err = renesas24x_set_frequency(output->chip);
> +       if (err)
> +               dev_err(&client->dev, "error calling set_frequency: %d", err);

No need to print a message, as renesas24x_set_frequency() has
already done that.

> +
> +       return err;
> +}
> +
> +/**
> + * renesas24x_round_rate - get valid rate that is closest to the requested rate
> + * @hw:                clk_hw struct that identifies the specific output clock.
> + * @rate:      the rate (in Hz) for the specified clock.
> + * @parent_rate:(not sure) the rate for a parent signal (e.g., the VCO
> + *             feeding the output). This is an i/o param.
> + *             If the driver supports a parent clock for the output (e.g.,
> + *             the VCO(?), then set this param to indicate what the rate of
> + *             the parent would be (e.g., the VCO frequency) if the rounded
> + *             rate is used.
> + *
> + * Returns the closest rate to the requested rate actually supported by the
> + * chip.
> + *
> + * Return: adjusted rate
> + */
> +static long renesas24x_round_rate(struct clk_hw *hw, unsigned long rate,
> +                                 unsigned long *parent_rate)

Please implement the .determine_rate() callback instead.

> +{
> +       /*
> +        * The chip has fractional output dividers, so assume it
> +        * can provide the requested rate.
> +        *
> +        * TODO: figure out the closest rate that chip can support
> +        * within a low error threshold and return that rate.
> +        */
> +       return rate;
> +}

> +/*
> + * Note that .prepare and .unprepare appear to be used more in Gates.
> + * They do not appear to be necessary for this device.

You can easily implement them, using renesas24x_enable_output().

> + * Instead, update the device when .set_rate is called.
> + */
> +static const struct clk_ops renesas24x_clk_ops = {
> +       .recalc_rate = renesas24x_recalc_rate,
> +       .round_rate = renesas24x_round_rate,
> +       .set_rate = renesas24x_set_rate,
> +};
> +
> +static bool renesas24x_regmap_is_volatile(struct device *dev, unsigned int reg)
> +{
> +       return false;
> +}
> +
> +static bool renesas24x_regmap_is_writeable(struct device *dev, unsigned int reg)
> +{
> +       return true;

Isn't that the default, if .writeable_reg() is not provided?

> +}
> +
> +static const struct regmap_config renesas24x_regmap_config = {
> +       .reg_bits = 16,
> +       .val_bits = 8,
> +       .cache_type = REGCACHE_RBTREE,
> +       .max_register = 0xffff,
> +       .writeable_reg = renesas24x_regmap_is_writeable,
> +       .volatile_reg = renesas24x_regmap_is_volatile,
> +};
> +
> +/**
> + * renesas24x_clk_notifier_cb - Clock rate change callback
> + * @nb:                Pointer to notifier block
> + * @event:     Notification reason
> + * @data:      Pointer to notification data object
> + *
> + * This function is called when the input clock frequency changes.
> + * The callback checks whether a valid bus frequency can be generated after the
> + * change. If so, the change is acknowledged, otherwise the change is aborted.
> + * New dividers are written to the HW in the pre- or post change notification
> + * depending on the scaling direction.
> + *
> + * Return:     NOTIFY_STOP if the rate change should be aborted, NOTIFY_OK
> + *             to acknowledge the change, NOTIFY_DONE if the notification is
> + *             considered irrelevant.
> + */
> +static int renesas24x_clk_notifier_cb(struct notifier_block *nb,
> +                                     unsigned long event, void *data)
> +{
> +       struct clk_notifier_data *ndata = data;
> +       struct clk_renesas24x_chip *chip = to_clk_renesas24x_from_nb(nb);
> +       int err = 0;

No need to preinitialize.

> +
> +       dev_info(&chip->i2c_client->dev, "input changed: %lu Hz. event: %lu",
> +                ndata->new_rate, event);

dev_dbg()

> +
> +       switch (event) {
> +       case PRE_RATE_CHANGE: {
> +               dev_dbg(&chip->i2c_client->dev, "PRE_RATE_CHANGE\n");
> +               return NOTIFY_OK;
> +       }
> +       case POST_RATE_CHANGE:
> +               chip->input_clk_freq = ndata->new_rate;
> +               /*
> +                * Can't call clock API clk_set_rate here; I believe
> +                * it will be ignored if the rate is the same as we
> +                * set previously. Need to call our internal function.
> +                */
> +               dev_dbg(&chip->i2c_client->dev, "POST_RATE_CHANGE. Calling renesas24x_set_frequency\n");
> +               err = renesas24x_set_frequency(chip);
> +               if (err)
> +                       dev_err(&chip->i2c_client->dev, "error setting frequency (%i)\n", err);
> +               return NOTIFY_OK;
> +       case ABORT_RATE_CHANGE:
> +               return NOTIFY_OK;
> +       default:
> +               return NOTIFY_DONE;
> +       }
> +}
> +
> +static struct clk_hw *of_clk_renesas24x_get(struct of_phandle_args *clkspec,
> +                                           void *_data)
> +{
> +       struct clk_renesas24x_chip *chip = _data;
> +       unsigned int idx = clkspec->args[0];
> +
> +       if (idx >= ARRAY_SIZE(chip->clk)) {
> +               pr_err("invalid index %u\n", idx);

pr_err("invalid clock index %u for provider %pOF\n", idx, clkspec->np);

> +               return ERR_PTR(-EINVAL);
> +       }
> +
> +       return &chip->clk[idx].hw;
> +}
> +
> +/**
> + * renesas24x_probe - main entry point for ccf driver
> + * @client:    pointer to i2c_client structure
> + * @id:                pointer to i2c_device_id structure
> + *
> + * Main entry point function that gets called to initialize the driver.
> + *
> + * Return: 0 for success.
> + */
> +static int renesas24x_probe(struct i2c_client *client,
> +                           const struct i2c_device_id *id)
> +{
> +       struct clk_renesas24x_chip *chip;
> +       struct clk_init_data init;
> +
> +       int err = 0, x = 0;

No need to preinitialize

unsigned int i

> +       char buf[6];
> +
> +       chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
> +       if (!chip)
> +               return -ENOMEM;
> +
> +       init.ops = &renesas24x_clk_ops;
> +       init.flags = 0;
> +       init.num_parents = 0;
> +       chip->i2c_client = client;
> +
> +       chip->min_freq = RENESAS24X_MIN_FREQ;
> +       chip->max_freq = RENESAS24X_MAX_FREQ;
> +
> +       for (x = 0; x < NUM_INPUTS + 1; x++) {
> +               char name[12];
> +
> +               sprintf(name, x == NUM_INPUTS ? "xtal" : "clk%i", x);
> +               dev_dbg(&client->dev, "attempting to get %s", name);
> +               chip->input_clk = devm_clk_get(&client->dev, name);

Probably you want use devm_clk_get_optional()?

> +               if (IS_ERR(chip->input_clk)) {
> +                       err = PTR_ERR(chip->input_clk);
> +                       /*
> +                        * TODO: Handle EPROBE_DEFER error, which indicates
> +                        * that the input_clk isn't available now but may be
> +                        * later when the appropriate module is loaded.
> +                        */

Easy: return dev_err_probe(...) here.

> +               } else {
> +                       err = 0;
> +                       chip->input_clk_num = x;
> +                       break;

So this always uses the first input clock, while there can be multiple?

> +               }
> +       }
> +
> +       if (err) {
> +               dev_err(&client->dev, "Unable to get input clock, error %d", err);
> +               chip->input_clk = NULL;
> +               return err;
> +       }
> +
> +       chip->input_clk_freq = clk_get_rate(chip->input_clk);
> +       dev_dbg(&client->dev, "Frequency from clk in device tree: %uHz", chip->input_clk_freq);
> +
> +       chip->input_clk_nb.notifier_call = renesas24x_clk_notifier_cb;
> +       if (clk_notifier_register(chip->input_clk, &chip->input_clk_nb))
> +               dev_warn(&client->dev, "Unable to register clock notifier for input_clk.");
> +
> +       dev_dbg(&client->dev, "about to read settings: %zu", ARRAY_SIZE(chip->settings));
> +
> +       err = of_property_read_u8_array(client->dev.of_node, "renesas,settings", chip->settings,
> +                                       ARRAY_SIZE(chip->settings));
> +       if (!err) {
> +               dev_dbg(&client->dev, "settings property specified in DT");
> +               chip->has_settings = true;
> +       } else {
> +               if (err == -EOVERFLOW) {

"else if", to reduce indentation below.

> +                       dev_alert(&client->dev, "EOVERFLOW reading settings. ARRAY_SIZE: %zu",
> +                                 ARRAY_SIZE(chip->settings));
> +                       return err;
> +               }
> +               dev_dbg(&client->dev,
> +                       "settings property missing in DT (or an error that can be ignored: %i).",
> +                       err);
> +       }
> +
> +       /*
> +        * Requested output frequencies cannot be specified in the DT.
> +        * Either a consumer needs to use the clock API to request the rate.
> +        * Use clock-names in DT to specify the output clock.
> +        */
> +
> +       chip->regmap = devm_regmap_init_i2c(client, &renesas24x_regmap_config);
> +       if (IS_ERR(chip->regmap)) {
> +               dev_err(&client->dev, "failed to allocate register map\n");
> +               return PTR_ERR(chip->regmap);
> +       }
> +
> +       dev_dbg(&client->dev, "call i2c_set_clientdata");
> +       i2c_set_clientdata(client, chip);
> +
> +       if (chip->has_settings) {
> +               /*
> +                * A raw settings array was specified in the DT. Write the
> +                * settings to the device immediately.
> +                */
> +               err = __renesas_i2c_write_bulk(chip->i2c_client, chip->regmap, 0, chip->settings,
> +                                              ARRAY_SIZE(chip->settings));
> +               if (err) {
> +                       dev_err(&client->dev, "error writing all settings to chip (%i)\n", err);
> +                       return err;
> +               }
> +               dev_dbg(&client->dev, "successfully wrote full settings array");
> +       }
> +
> +       /*
> +        * Whether or not settings were written to the device, read all
> +        * current values from the hw.
> +        */
> +       dev_dbg(&client->dev, "read from HW");
> +       err = renesas24x_read_from_hw(chip);
> +       if (err) {
> +               dev_err(&client->dev, "failed calling renesas24x_read_from_hw (%i)\n", err);

No need to print a message, as renesas24x_read_from_hw()
has already done that.

> +               return err;
> +       }
> +
> +       /* Create all 4 clocks */
> +       for (x = 0; x < NUM_OUTPUTS; x++) {
> +               init.name = kasprintf(GFP_KERNEL, "%s.Q%i", client->dev.of_node->name, x);
> +               chip->clk[x].chip = chip;
> +               chip->clk[x].hw.init = &init;
> +               chip->clk[x].index = x;
> +               err = devm_clk_hw_register(&client->dev, &chip->clk[x].hw);
> +               kfree(init.name); /* clock framework made a copy of the name */
> +               if (err) {
> +                       dev_err(&client->dev, "clock registration failed\n");
> +                       return err;
> +               }
> +               dev_dbg(&client->dev, "successfully registered Q%i", x);
> +       }
> +
> +       if (err) {

This cannot happen.

> +               dev_err(&client->dev, "clock registration failed\n");
> +               return err;
> +       }


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
