Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 475266C3E61
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Mar 2023 00:16:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230035AbjCUXQL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 Mar 2023 19:16:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbjCUXQK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Mar 2023 19:16:10 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 401653BC6D;
        Tue, 21 Mar 2023 16:16:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CFDA561ED6;
        Tue, 21 Mar 2023 23:16:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A196C433D2;
        Tue, 21 Mar 2023 23:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679440568;
        bh=/M8W1SHtPyJEINPYzcVea0a9v+JMaf9CiVoRpkQcGQ4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=mfIYhulVMQVGJiaDtYPDTG9cOWgPyQ+NAqVw1MEzByEVkTehjZ1yF7KRkXRz3RFzv
         sWxTDY0RTFP3hO8tyi2swSsNmReZHP28WAgBVo5IcusLbE6eBCo2zrufq1J50UiHQU
         dm7/6qMnQSsbM42mA5hz3MUT1kz/JvRS3q5PWlh31psGW3UJPMLwd0zjsaourFeGse
         D+Jx/O04RO7gJZ96OD47q517MPM/yKRZ7VUWWSrpvLxRSH0dcaFV+4n7xIUdtRfUDB
         W2Yn86RudlgfHzhpZS4bz3gmTnISI8xUTA1mAkQIzMUJnB9GAx6WNEJbu74MmyZLbm
         38TV410dt8fqA==
Message-ID: <fbb9d1bf8643b4ddce6e9498911f3137.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230309165529.223052-3-biju.das.jz@bp.renesas.com>
References: <20230309165529.223052-1-biju.das.jz@bp.renesas.com> <20230309165529.223052-3-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2 2/3] drivers: clk: Add support for versa3 clock driver
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Tue, 21 Mar 2023 16:16:05 -0700
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Biju Das (2023-03-09 08:55:28)
> diff --git a/drivers/clk/clk-versaclock3.c b/drivers/clk/clk-versaclock3.c
> new file mode 100644
> index 000000000000..6c5c8b37f6af
> --- /dev/null
> +++ b/drivers/clk/clk-versaclock3.c
> @@ -0,0 +1,1139 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Driver for Renesas Versaclock 3
> + *
> + * Copyright (C) 2021 Renesas Electronics Corp.
> + */
> +
[...]
> +       [vc3_se1] =3D "se1",
> +       [vc3_ref] =3D "ref"
> +};
> +
> +static const struct clk_parent_data pfdmux_p[] =3D {
> +       { .fw_name =3D vc3_fin_name, .name =3D vc3_fin_name },

New drivers should only have .fw_name here. I don't think you're
migrating an existing driver to clk_parent_data so .name should be
removed. And then maybe you'll want to simply use the index instead so
that we don't have to do any string comparisons to find clk parents.

> +       { .fw_name =3D "div2", .name =3D "div2" }
> +};
> +
[...]
> +
> +static unsigned long vc3_clk_out_recalc_rate(struct clk_hw *hw,
> +                                            unsigned long parent_rate)
> +{
> +       return parent_rate;
> +}
> +
> +static long vc3_clk_out_round_rate(struct clk_hw *hw, unsigned long rate,
> +                                  unsigned long *prate)
> +{
> +       *prate =3D clk_hw_round_rate(clk_hw_get_parent(hw), rate);
> +
> +       return *prate;
> +}
> +
> +static int vc3_clk_out_set_rate(struct clk_hw *hw, unsigned long rate,
> +                               unsigned long parent_rate)
> +{
> +       /*
> +        * We must report success. round_rate() propagates rate to the
> +        * parent and based on the rate mux changes its parent.
> +        */
> +
> +       return 0;
> +}
> +
> +const struct clk_ops vc3_clk_out_ops =3D {
> +       .recalc_rate =3D vc3_clk_out_recalc_rate,
> +       .round_rate =3D vc3_clk_out_round_rate,
> +       .set_rate =3D vc3_clk_out_set_rate,
> +};

Are any of these clk ops necessary? They don't do anything besides pass
up to the parent, so you can set CLK_SET_RATE_PARENT and be done?

> +
> +static bool vc3_regmap_is_writeable(struct device *dev, unsigned int reg)
> +{
> +       return true;
> +}
> +
> +static const struct regmap_config vc3_regmap_config =3D {
> +       .reg_bits =3D 8,
> +       .val_bits =3D 8,
> +       .cache_type =3D REGCACHE_RBTREE,
> +       .max_register =3D 0x24,
> +       .writeable_reg =3D vc3_regmap_is_writeable,
> +};
> +
> +static struct clk_hw *vc3_of_clk_get(struct of_phandle_args *clkspec,
> +                                    void *data)
> +{
> +       struct vc3_driver_data *vc3 =3D data;
> +       unsigned int idx =3D clkspec->args[0];
> +
> +       if (idx >=3D ARRAY_SIZE(clk_out_data)) {
> +               pr_err("invalid clk index %u for provider %pOF\n", idx, c=
lkspec->np);
> +               return ERR_PTR(-EINVAL);
> +       }
> +
> +       return &vc3->clk_out[idx].hw;
> +}
> +
> +static void vc3_divider_type_parse_dt(struct device *dev,
> +                                     struct vc3_driver_data *vc3)
> +{
> +       struct device_node *np =3D dev->of_node;
> +       struct property *prop;
> +       const __be32 *p;
> +       u32 i =3D 0;
> +       u32 val;
> +
> +       of_property_for_each_u32(np, "assigned-clock-rates",

This is an interesting use of assigned-clock-rates.

> +                                prop, p, val) {
> +               if (i >=3D ARRAY_SIZE(div_data))
> +                       break;
> +               if (val)
> +                       vc3->clk_div[i].flags =3D CLK_DIVIDER_READ_ONLY;

Why would assigned clock rates change the read only flag?
