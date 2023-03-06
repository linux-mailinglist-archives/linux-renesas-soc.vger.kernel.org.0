Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EAE26ACF12
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Mar 2023 21:22:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229941AbjCFUWZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Mar 2023 15:22:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229685AbjCFUWY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Mar 2023 15:22:24 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD7504B820;
        Mon,  6 Mar 2023 12:22:22 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6614EB8110A;
        Mon,  6 Mar 2023 20:22:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2893C4339B;
        Mon,  6 Mar 2023 20:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678134140;
        bh=JfAIANwji8/9pUNK5L+VT6XjN4r+pqqh/shgcvrIPwM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=RMVe9qUvv6z2HEKPpY9YlL3qR5ciAzjSAyizPmQbhloBk14FnlUjWr5rjOgUbk6dN
         BjlnNcTWIXeOCAnYPKmFH9IpsozFKQ0bUVTk4iEAsnyTpsTPTPs+PqbjaESvK0e+MS
         LQaLq7xkAcxMpAur77vo1iyT6tcGVUdta9B6tPoLGXQ/y8xuUnuvdtdvjzrg08xHXa
         7v/G73+qw69m5B2rYyV8m8BlFs6aE2l9DjJuOwY/F563vYn0DFxoQOvrkWQ7NKKA1+
         9zA8if/y6mqo4DGYy4Rbu68v/kHeO4CKjr/KFBcD6SmeZrxkqOsDUfMWD0jhOc3i69
         iFxPOQNko4BlQ==
Message-ID: <dc7ff43b610bf898d581eb70f4a166c9.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230220131307.269100-3-biju.das.jz@bp.renesas.com>
References: <20230220131307.269100-1-biju.das.jz@bp.renesas.com> <20230220131307.269100-3-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH RFC 2/3] drivers: clk: Add support for versa3 clock driver
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Mon, 06 Mar 2023 12:22:16 -0800
User-Agent: alot/0.10
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Biju Das (2023-02-20 05:13:06)
> diff --git a/drivers/clk/clk-versaclock3.c b/drivers/clk/clk-versaclock3.c
> new file mode 100644
> index 000000000000..561cfad8a243
> --- /dev/null
> +++ b/drivers/clk/clk-versaclock3.c
> @@ -0,0 +1,1134 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Driver for Renesas Versaclock 3
> + *
> + * Copyright (C) 2021 Renesas Electronics Corp.
> + */
> +
> +#include <linux/clk.h>

Please remove this include after moving to 'struct clk_parent_data'.

> +#include <linux/clk-provider.h>
> +#include <linux/i2c.h>
> +#include <linux/limits.h>
> +#include <linux/module.h>
> +#include <linux/regmap.h>
> +
> +#define NUM_CONFIG_REGISTERS           37
> +
[...]
> +
> +static void vc3_clk_flags_parse_dt(struct device *dev, u32 *crt_clks)
> +{
> +       struct device_node *np =3D dev->of_node;
> +       struct property *prop;
> +       const __be32 *p;
> +       u32 i =3D 0;
> +       u32 val;
> +
> +       of_property_for_each_u32(np, "renesas,clock-flags", prop, p, val)=
 {
> +               if (i >=3D ARRAY_SIZE(clk_out_data))
> +                       break;
> +               *crt_clks++ =3D val;
> +               i++;
> +       }
> +}
> +
> +static void vc3_fill_init_data(struct clk_init_data *init,
> +                              const struct vc3_clk_data *mux,
> +                              const struct clk_ops *ops,
> +                              u32 flags, int n,
> +                              const char **pll_parent_names,
> +                              const char **clkin_name)
> +{
> +       unsigned int i;
> +
> +       init->name =3D mux->name;
> +       init->ops =3D ops;
> +       init->flags =3D CLK_SET_RATE_PARENT;
> +       init->num_parents =3D n;
> +       for (i =3D 0; i < n; i++) {
> +               if (!mux->parent_names[i])
> +                       pll_parent_names[i] =3D clkin_name[0];
> +               else
> +                       pll_parent_names[i] =3D mux->parent_names[i];

Instead of string names please use clk_hw pointers or 'struct
clk_parent_data'.

> +       }
> +
> +       init->parent_names =3D pll_parent_names;
> +}
> +
> +static int vc3_clk_register(struct device *dev, struct vc3_driver_data *=
vc3,
> +                           struct vc3_hw_data *data, const void *clk_dat=
a,
> +                           struct clk_init_data *init, int n)

const init pointer?

> +{
> +       data->hw.init =3D init;
> +       data->num =3D n;
> +       data->vc3 =3D vc3;
> +       data->data =3D clk_data;
> +
> +       return devm_clk_hw_register(dev, &data->hw);
> +}
> +
> +static int vc3_probe(struct i2c_client *client)
> +{
> +       struct device *dev =3D &client->dev;
> +       u8 settings[NUM_CONFIG_REGISTERS];
> +       const char *pll_parent_names[3];
> +       struct vc3_driver_data *vc3;
> +       const char *clkin_name[1];
> +       struct clk_init_data init;
> +       u32 crit_clks[6] =3D {};
> +       struct clk *clk;
> +       int ret, i;
> +
> +       vc3 =3D devm_kzalloc(dev, sizeof(*vc3), GFP_KERNEL);
> +       if (!vc3)
> +               return -ENOMEM;
> +
> +       i2c_set_clientdata(client, vc3);
> +       vc3->client =3D client;
> +
> +       vc3->regmap =3D devm_regmap_init_i2c(client, &vc3_regmap_config);
> +       if (IS_ERR(vc3->regmap))
> +               return dev_err_probe(dev, PTR_ERR(vc3->regmap),
> +                                    "failed to allocate register map\n");
> +
> +       ret =3D of_property_read_u8_array(dev->of_node, "renesas,settings=
",
> +                                       settings, ARRAY_SIZE(settings));
> +       if (!ret) {
> +               /*
> +                * A raw settings array was specified in the DT. Write the
> +                * settings to the device immediately.
> +                */
> +               for  (i =3D 0; i < NUM_CONFIG_REGISTERS; i++) {
> +                       ret =3D regmap_write(vc3->regmap, i, settings[i]);
> +                       if (ret) {
> +                               dev_err(dev, "error writing to chip (%i)\=
n", ret);
> +                               return ret;
> +                       }
> +               }
> +       } else if (ret =3D=3D -EOVERFLOW) {
> +               dev_err(&client->dev, "EOVERFLOW reg settings. ARRAY_SIZE=
: %zu",
> +                       ARRAY_SIZE(settings));
> +               return ret;
> +       }
> +
> +       /* Register clock ref */
> +       memset(&init, 0, sizeof(init));
> +
> +       clk =3D devm_clk_get(dev, "x1");
> +       if (PTR_ERR(clk) =3D=3D -EPROBE_DEFER)
> +               return -EPROBE_DEFER;
> +
> +       if (!IS_ERR(clk)) {
> +               clkin_name[0] =3D __clk_get_name(clk);
> +       } else {
> +               clk =3D devm_clk_get(dev, "clkin");
> +               if (PTR_ERR(clk) =3D=3D -EPROBE_DEFER)
> +                       return -EPROBE_DEFER;
> +
> +               if (!IS_ERR(clk))
> +                       clkin_name[0] =3D __clk_get_name(clk);
> +       }

Please use 'struct clk_parent_data' instead of clk consumer APIs.

> +
> +       if (IS_ERR_OR_NULL(clk))
> +               return dev_err_probe(&client->dev, -EINVAL, "no input clk=
\n");
> +
> +       /* Register pfd muxes */
> +       for (i =3D 0; i < ARRAY_SIZE(pfd_mux_data); i++) {
> +               vc3_fill_init_data(&init, &pfd_mux_data[i], &vc3_pfd_mux_=
ops,
> +                                  CLK_SET_RATE_PARENT, 2, pll_parent_nam=
es,
> +                                  clkin_name);
> +               ret =3D vc3_clk_register(dev, vc3, &vc3->clk_pfd_mux[i],
> +                                      &pfd_mux_data[i], &init, i);
> +               if (ret)
> +                       return dev_err_probe(dev, ret, "%s failed\n", ini=
t.name);
> +       }
> +
> +       /* Register pfd's */
> +       for (i =3D 0; i < ARRAY_SIZE(pfd_data); i++) {
> +               if (i =3D=3D VC3_PFD1)
> +                       pll_parent_names[0] =3D clkin_name[0];
> +               else
> +                       pll_parent_names[0] =3D pfd_mux_data[i - 1].name;
> +
> +               init.name =3D pfd_data[i].name;
> +               init.ops =3D &vc3_pfd_ops;
> +               init.flags =3D CLK_SET_RATE_PARENT;
> +               init.num_parents =3D 1;
> +               init.parent_names =3D pll_parent_names;
> +
> +               ret =3D vc3_clk_register(dev, vc3, &vc3->clk_pfd[i],
> +                                      &pfd_data[i], &init, i);
> +               if (ret)
> +                       return dev_err_probe(dev, ret, "%s failed\n", ini=
t.name);
> +       }
> +
> +       /* Register pll's */
> +       for (i =3D 0; i < ARRAY_SIZE(pll_data); i++) {
> +               pll_parent_names[0] =3D pfd_data[i].name;
> +               init.name =3D pll_data[i].name;
> +               init.ops =3D &vc3_pll_ops;
> +               init.flags =3D CLK_SET_RATE_PARENT;
> +               init.num_parents =3D 1;
> +               init.parent_names =3D pll_parent_names;
> +
> +               ret =3D vc3_clk_register(dev, vc3, &vc3->clk_pll[i],
> +                                      &pll_data[i], &init, i);
> +               if (ret)
> +                       return dev_err_probe(dev, ret, "%s failed\n", ini=
t.name);
> +       }
> +
> +       /* Register divider muxes */
> +       for (i =3D 0; i < ARRAY_SIZE(div_mux_data); i++) {
> +               vc3_fill_init_data(&init, &div_mux_data[i], &vc3_div_mux_=
ops,
> +                                  CLK_SET_RATE_PARENT, 2, pll_parent_nam=
es,
> +                                  clkin_name);
> +               ret =3D vc3_clk_register(dev, vc3, &vc3->clk_div_mux[i],
> +                                      &div_mux_data[i], &init, i);
> +               if (ret)
> +                       return dev_err_probe(dev, ret, "%s failed\n", ini=
t.name);
> +       }
> +
> +       vc3_divider_type_parse_dt(dev, vc3);
> +       /* Register dividers */
> +       for (i =3D 0; i < ARRAY_SIZE(div_data); i++) {
> +               switch (i) {
> +               case VC3_DIV1:
> +                       pll_parent_names[0] =3D div_mux_data[VC3_DIV1_MUX=
].name;
> +                       break;
> +               case VC3_DIV2:
> +                       pll_parent_names[0] =3D pll_data[VC3_PLL1].name;
> +                       break;
> +               case VC3_DIV3:
> +                       pll_parent_names[0] =3D div_mux_data[VC3_DIV3_MUX=
].name;
> +                       break;
> +               case VC3_DIV4:
> +                       pll_parent_names[0] =3D div_mux_data[VC3_DIV4_MUX=
].name;
> +                       break;
> +               case VC3_DIV5:
> +                       pll_parent_names[0] =3D pll_data[VC3_PLL3].name;
> +                       break;
> +               }
> +
> +               init.name =3D div_data[i].name;
> +               init.ops =3D &vc3_div_ops;
> +               init.flags =3D CLK_SET_RATE_PARENT;
> +               init.num_parents =3D 1;
> +               init.parent_names =3D pll_parent_names;
> +
> +               ret =3D vc3_clk_register(dev, vc3, &vc3->clk_div[i],
> +                                      &div_data[i], &init, i);
> +               if (ret)
> +                       return dev_err_probe(dev, ret, "%s failed\n", ini=
t.name);
> +       }
> +
> +       /* Register clk muxes */
> +       for (i =3D 0; i < ARRAY_SIZE(clk_mux_data); i++) {
> +               vc3_fill_init_data(&init, &clk_mux_data[i], &vc3_clk_mux_=
ops,
> +                                  CLK_SET_RATE_PARENT, 2, pll_parent_nam=
es,
> +                                  clkin_name);
> +               ret =3D vc3_clk_register(dev, vc3, &vc3->clk_mux[i],
> +                                      &clk_mux_data[i], &init, i);
> +               if (ret)
> +                       return dev_err_probe(dev, ret, "%s failed\n", ini=
t.name);
> +       }
> +
> +       /* Register clk outputs */
> +       vc3_clk_flags_parse_dt(dev, crit_clks);
> +       for (i =3D 0; i < ARRAY_SIZE(clk_out_data); i++) {
> +               vc3_fill_init_data(&init, &clk_out_data[i], &vc3_clk_out_=
ops,
> +                                  crit_clks[i], 1, pll_parent_names,
> +                                  clkin_name);
> +               ret =3D vc3_clk_register(dev, vc3, &vc3->clk_out[i],
> +                                      &clk_out_data[i], &init, i);
> +               if (ret)
> +                       return dev_err_probe(dev, ret, "%s failed\n", ini=
t.name);
> +       }
> +
> +       ret =3D of_clk_add_hw_provider(client->dev.of_node, vc3_of_clk_ge=
t, vc3);

Can you use devm?

> +       if (ret)
> +               return dev_err_probe(dev, ret, "unable to add clk provide=
r\n");
> +
> +       return ret;
> +}
> +
> +static void vc3_remove(struct i2c_client *client)
> +{
> +       of_clk_del_provider(client->dev.of_node);
> +}

Using devm means this whole function can be removed.
