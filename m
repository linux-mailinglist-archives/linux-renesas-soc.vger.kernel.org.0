Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F05B435BDB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Oct 2021 09:38:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231158AbhJUHkf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Oct 2021 03:40:35 -0400
Received: from mail-ua1-f46.google.com ([209.85.222.46]:39564 "EHLO
        mail-ua1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbhJUHke (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Oct 2021 03:40:34 -0400
Received: by mail-ua1-f46.google.com with SMTP id f3so11482170uap.6;
        Thu, 21 Oct 2021 00:38:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=voDa2N+FeOQLolAqjDJAarZO+jbTBLQ/wYxY/R3eJhs=;
        b=cizmF8r8KBANjNubGTzpHmlPltZVAUDvdPQ97FF2HiljTvEEk9ykKX7ZKhQ+Lvbe3k
         CdPFnvEyQ7SMVLqPCmSZllgNqv+NXYe9NF4hViisKEJvF6TWocyc3ptFZrG/8TAlkMpU
         bLXw4wRnPqiVmfK4JXJwhGN2GvrcbwEDFOH4qDOTGh3T5+G3PQODQ3ufkSwy0UGc3ZI9
         bOnkAuIHYtC8JFBh8OuDYZ1gRfUjkhPAbcQKS4X5URhDkf1hx5+erFbBOD0+xWLH6HXc
         +9smAC0omSoNLSmzf9nfwDqZLDypDqSfavmxoHJJDbp/3yA3RYqhBcwCjPnbwQTHUBLo
         /5qg==
X-Gm-Message-State: AOAM531v+s8KYgtP78n8hJKsd2PlAJ4bknK0Pj4MqJ/RolaAOr9snHHu
        hi7n6qVQyaPQXFqKsSb7eEJSekzA8yMFDg==
X-Google-Smtp-Source: ABdhPJy5kO6Wg8tN0dh2S58VkTLHW7L8pTudUJrH2VO77fuPLH3QinMAnIootl1KVr2fDmb2rKeRAA==
X-Received: by 2002:ab0:5741:: with SMTP id t1mr4476233uac.72.1634801898212;
        Thu, 21 Oct 2021 00:38:18 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id n3sm2479959vsq.28.2021.10.21.00.38.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Oct 2021 00:38:17 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id 34so13293236vkl.13;
        Thu, 21 Oct 2021 00:38:17 -0700 (PDT)
X-Received: by 2002:a1f:5e84:: with SMTP id s126mr3692002vkb.7.1634801897101;
 Thu, 21 Oct 2021 00:38:17 -0700 (PDT)
MIME-Version: 1.0
References: <20211020180949.15024-1-alexander.helms.jy@renesas.com> <20211020180949.15024-3-alexander.helms.jy@renesas.com>
In-Reply-To: <20211020180949.15024-3-alexander.helms.jy@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 21 Oct 2021 09:38:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWxQ1f=ZAd-B3RCQuoGE-2k_X7ee+1sY1q6F79pGxbmOw@mail.gmail.com>
Message-ID: <CAMuHMdWxQ1f=ZAd-B3RCQuoGE-2k_X7ee+1sY1q6F79pGxbmOw@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] clk: Add ccf driver for Renesas 8T49N241
To:     Alex Helms <alexander.helms.jy@renesas.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        david.cater.jc@renesas.com, Michal Simek <michal.simek@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Alex,

On Wed, Oct 20, 2021 at 8:10 PM Alex Helms
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
> Acked-by: Michal Simek <michal.simek@xilinx.com>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/clk/8t49n24x-core.c

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
> +       if (mask) {
> +               // ffs considers the first bit position 1, we need an index
> +               return ffs(mask) - 1;

ffs(x) - 1 == __ffs(x), isn't it?

> +       } else {
> +               return 0;
> +       }
> +}
> +
> +int __renesas_i2c_write_bulk(struct i2c_client *client, struct regmap *map,
> +                            unsigned int reg, u8 val[], size_t val_count)
> +{
> +       u8 block[WRITE_BLOCK_SIZE];
> +       unsigned int block_offset = reg;
> +       unsigned int i, err, currentOffset = 0;

int err, as regmap_bulk_write() returns negative error codes.

> +
> +       dev_dbg(&client->dev,
> +               "I2C->0x%04x : [hex] . First byte: %02x, Second byte: %02x",
> +               reg, reg >> 8, reg & 0xFF);
> +
> +       print_hex_dump_debug("i2c_write_bulk: ", DUMP_PREFIX_NONE,
> +                            16, 1, val, val_count, false);
> +
> +       for (i = 0; i < val_count; i++) {
> +               block[currentOffset++] = val[i];
> +
> +               if (i > 0 && (i + 1) % WRITE_BLOCK_SIZE == 0) {
> +                       err = regmap_bulk_write(map, block_offset, block, WRITE_BLOCK_SIZE);
> +                       if (err)
> +                               break;
> +                       block_offset += WRITE_BLOCK_SIZE;
> +                       currentOffset = 0;
> +               }
> +       }
> +
> +       if (err == 0 && currentOffset > 0)
> +               err = regmap_bulk_write(map, block_offset, block, currentOffset);
> +
> +       return err;
> +}
> +
> +static int __i2c_write(struct i2c_client *client, struct regmap *map,
> +                      unsigned int reg, unsigned int val)
> +{
> +       dev_dbg(&client->dev, "I2C->0x%x : [hex] %x", reg, val);
> +       return regmap_write(map, reg, val);
> +}
> +
> +static int __i2c_write_with_mask(struct i2c_client *client, struct regmap *map,
> +                                unsigned int reg, u8 val, u8 original, u8 mask)
> +{
> +       return __i2c_write(client, map, reg,
> +                          ((val << __renesas_bits_to_shift(mask)) & mask) | (original & ~mask));
> +}
> +
> +void r8t49n24x_get_offsets(u8 output_num, struct clk_register_offsets *offsets)
> +{
> +       offsets->oe_offset = 0;
> +       offsets->oe_mask = 0;
> +       offsets->dis_mask = 0;
> +       offsets->n_17_16_offset = 0;
> +       offsets->n_17_16_mask = 0;
> +       offsets->n_15_8_offset = 0;
> +       offsets->n_7_0_offset = 0;
> +       offsets->nfrac_27_24_offset = 0;
> +       offsets->nfrac_27_24_mask = 0;
> +       offsets->nfrac_23_16_offset = 0;
> +       offsets->nfrac_15_8_offset = 0;
> +       offsets->nfrac_7_0_offset = 0;
> +
> +       switch (output_num) {
> +       case 0:
> +               offsets->oe_offset = R8T49N24X_REG_OUTEN;
> +               offsets->oe_mask = R8T49N24X_REG_OUTEN0_MASK;
> +               offsets->dis_mask = R8T49N24X_REG_Q0_DIS_MASK;
> +               break;
> +       case 1:
> +               offsets->oe_offset = R8T49N24X_REG_OUTEN;
> +               offsets->oe_mask = R8T49N24X_REG_OUTEN1_MASK;
> +               offsets->dis_mask = R8T49N24X_REG_Q1_DIS_MASK;
> +               offsets->n_17_16_offset = R8T49N24X_REG_N_Q1_17_16;
> +               offsets->n_17_16_mask = R8T49N24X_REG_N_Q1_17_16_MASK;
> +               offsets->n_15_8_offset = R8T49N24X_REG_N_Q1_15_8;
> +               offsets->n_7_0_offset = R8T49N24X_REG_N_Q1_7_0;
> +               offsets->nfrac_27_24_offset = R8T49N24X_REG_NFRAC_Q1_27_24;
> +               offsets->nfrac_27_24_mask = R8T49N24X_REG_NFRAC_Q1_27_24_MASK;
> +               offsets->nfrac_23_16_offset = R8T49N24X_REG_NFRAC_Q1_23_16;
> +               offsets->nfrac_15_8_offset = R8T49N24X_REG_NFRAC_Q1_15_8;
> +               offsets->nfrac_7_0_offset = R8T49N24X_REG_NFRAC_Q1_7_0;
> +               break;
> +       case 2:
> +               offsets->oe_offset = R8T49N24X_REG_OUTEN;
> +               offsets->oe_mask = R8T49N24X_REG_OUTEN2_MASK;
> +               offsets->dis_mask = R8T49N24X_REG_Q2_DIS_MASK;
> +               offsets->n_17_16_offset = R8T49N24X_REG_N_Q2_17_16;
> +               offsets->n_17_16_mask = R8T49N24X_REG_N_Q2_17_16_MASK;
> +               offsets->n_15_8_offset = R8T49N24X_REG_N_Q2_15_8;
> +               offsets->n_7_0_offset = R8T49N24X_REG_N_Q2_7_0;
> +               offsets->nfrac_27_24_offset = R8T49N24X_REG_NFRAC_Q2_27_24;
> +               offsets->nfrac_27_24_mask = R8T49N24X_REG_NFRAC_Q2_27_24_MASK;
> +               offsets->nfrac_23_16_offset = R8T49N24X_REG_NFRAC_Q2_23_16;
> +               offsets->nfrac_15_8_offset = R8T49N24X_REG_NFRAC_Q2_15_8;
> +               offsets->nfrac_7_0_offset = R8T49N24X_REG_NFRAC_Q2_7_0;
> +               break;
> +       case 3:
> +               offsets->oe_offset = R8T49N24X_REG_OUTEN;
> +               offsets->oe_mask = R8T49N24X_REG_OUTEN3_MASK;
> +               offsets->dis_mask = R8T49N24X_REG_Q3_DIS_MASK;
> +               offsets->n_17_16_offset = R8T49N24X_REG_N_Q3_17_16;
> +               offsets->n_17_16_mask = R8T49N24X_REG_N_Q3_17_16_MASK;
> +               offsets->n_15_8_offset = R8T49N24X_REG_N_Q3_15_8;
> +               offsets->n_7_0_offset = R8T49N24X_REG_N_Q3_7_0;
> +               offsets->nfrac_27_24_offset = R8T49N24X_REG_NFRAC_Q3_27_24;
> +               offsets->nfrac_27_24_mask = R8T49N24X_REG_NFRAC_Q3_27_24_MASK;
> +               offsets->nfrac_23_16_offset = R8T49N24X_REG_NFRAC_Q3_23_16;
> +               offsets->nfrac_15_8_offset = R8T49N24X_REG_NFRAC_Q3_15_8;
> +               offsets->nfrac_7_0_offset = R8T49N24X_REG_NFRAC_Q3_7_0;
> +               break;
> +       }
> +}
> +
> +/**
> + * r8t49n24x_calc_div_q0 - Calculate dividers and VCO freq to generate
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
> + */
> +static void r8t49n24x_calc_div_q0(struct clk_r8t49n24x_chip *chip)
> +{
> +       unsigned int i;
> +       unsigned int min_div = 0, max_div = 0, best_vco = 0;
> +       unsigned int min_ns2 = 0, max_ns2 = 0;
> +       bool is_lower_vco = false;
> +
> +       chip->divs.ns1_q0 = 0;
> +       chip->divs.ns2_q0 = 0;
> +
> +       if (chip->clk[0].requested == 0)
> +               return;
> +
> +       min_div = (R8T49N24X_VCO_MIN / (chip->clk[0].requested * 2)) * 2;

To avoid overflow, you may want to write this as:

    min_div = (R8T49N24X_VCO_MIN / 2 / chip->clk[0].requested * 2) * 2;

> +       max_div = (R8T49N24X_VCO_MAX / (chip->clk[0].requested * 2)) * 2;

Likewise.

> +/**
> + * r8t49n24x_calc_divs - Calculate dividers to generate the specified frequency.
> + * @chip:      Device data structure. contains all requested frequencies
> + *             for all outputs.
> + *
> + * Calculate the clock dividers (dsmint, dsmfrac for vco; ns1/ns2 for q0,
> + * n/nfrac for q1-3) for a given target frequency.
> + *
> + * Return: 0 on success, negative errno otherwise.
> + */
> +static int r8t49n24x_calc_divs(struct clk_r8t49n24x_chip *chip)
> +{
> +       unsigned int i;
> +       unsigned int vco = 0;
> +       unsigned int pfd = 0;
> +       u64 rem = 0;
> +
> +       r8t49n24x_calc_div_q0(chip);
> +
> +       dev_dbg(&chip->i2c_client->dev,
> +               "after r8t49n24x_calc_div_q0. ns1: %u [/%u], ns2: %u",
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
> +               unsigned int freq = 0;
> +               unsigned int min_div = 0, max_div = 0;
> +               unsigned int i = 0;
> +               bool is_lower_vco = false;
> +
> +               /*
> +                * Q0 is not in use. Use the first requested (fractional)
> +                * output frequency as the one controlling the VCO.
> +                */
> +               for (i = 1; i < NUM_OUTPUTS; i++) {
> +                       if (chip->clk[i].requested != 0) {
> +                               freq = chip->clk[i].requested;
> +                               break;
> +                       }
> +               }
> +
> +               if (!freq) {
> +                       dev_err(&chip->i2c_client->dev, "NO FREQUENCIES SPECIFIED");
> +                       return -EINVAL;
> +               }
> +
> +               /*
> +                * First, determine the min/max div for the output frequency.
> +                */
> +               min_div = R8T49N24X_MIN_INT_DIVIDER;
> +               max_div = (R8T49N24X_VCO_MAX / (freq * 2)) * 2;

(R8T49N24X_VCO_MAX / 2 / freq) * 2

> +
> +               dev_dbg(&chip->i2c_client->dev,
> +                       "calc_divs for fractional output. freq: %u, min_div: %u, max_div: %u",
> +                       freq, min_div, max_div);
> +
> +               i = min_div;
> +
> +               while (i <= max_div) {
> +                       unsigned int current_vco = freq * i;
> +
> +                       dev_dbg(&chip->i2c_client->dev,
> +                               "calc_divs for fractional output. walk: %u, freq: %u, vco: %u",
> +                               i, freq, vco);
> +
> +                       if (current_vco >= R8T49N24X_VCO_MIN &&
> +                           vco <= R8T49N24X_VCO_MAX) {
> +                               if (current_vco <= R8T49N24X_VCO_OPT) {
> +                                       if (current_vco > vco || !is_lower_vco) {
> +                                               is_lower_vco = true;
> +                                               vco = current_vco;
> +                                       }
> +                               } else if (!is_lower_vco && current_vco > vco) {
> +                                       vco = current_vco;
> +                               }
> +                       }
> +                       /* Divider must be even. */
> +                       i += 2;
> +               }
> +       }
> +
> +       if (!vco) {
> +               dev_err(&chip->i2c_client->dev, "no integer divider in range found. NOT SUPPORTED.");
> +               return -EINVAL;
> +       }
> +
> +       /* Setup dividers for outputs with fractional dividers. */
> +       for (i = 1; i < NUM_OUTPUTS; i++) {
> +               if (chip->clk[i].requested) {
> +                       /*
> +                        * The value written to the chip is half
> +                        * the calculated divider.
> +                        */
> +                       chip->divs.nint[i - 1] = div64_u64_rem((u64)vco,
> +                                                              chip->clk[i].requested * 2,
> +                                                              &rem);

vco is 32-bit, so no need for an expensive 64-by-64 remainder
calculation.

> +                       chip->divs.nfrac[i - 1] = div64_u64(rem << 28,
> +                                                           chip->clk[i].requested * 2);

chip->clk[i].requested is unsigned long, so div64_ul() will do.

> +
> +                       dev_dbg(&chip->i2c_client->dev,
> +                               "div to get Q%i freq %lu from vco %u: int part: %u, rem: %llu, frac part: %u",
> +                               i, chip->clk[i].requested,
> +                               vco, chip->divs.nint[i - 1], rem,
> +                               chip->divs.nfrac[i - 1]);
> +               }
> +       }
> +
> +       /* Calculate freq for pfd */
> +       pfd = chip->input_clk_freq * (chip->doubler_disabled ? 1 : 2);
> +
> +       /*
> +        * Calculate dsmint & dsmfrac:
> +        * -----------------------------
> +        * dsm = float(vco)/float(pfd)
> +        * dsmfrac = dsm-floor(dsm) * 2^21
> +        * rem = vco % pfd
> +        * therefore:
> +        * dsmfrac = (rem * 2^21)/pfd
> +        */
> +       chip->divs.dsmint = div64_u64_rem(vco, pfd, &rem);

vco and pfd are both 32-bit.

> +       chip->divs.dsmfrac = div64_u64(rem << 21, pfd);

div64_ul().

> +
> +       dev_dbg(&chip->i2c_client->dev,
> +               "vco: %u, pfd: %u, dsmint: %u, dsmfrac: %u, rem: %llu",
> +               vco, pfd, chip->divs.dsmint,
> +               chip->divs.dsmfrac, rem);
> +
> +       return 0;
> +}

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
