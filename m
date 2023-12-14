Return-Path: <linux-renesas-soc+bounces-1034-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7524812B1B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Dec 2023 10:07:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E9E6E1C21526
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Dec 2023 09:07:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A69A286B7;
	Thu, 14 Dec 2023 09:07:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9549710A;
	Thu, 14 Dec 2023 01:07:07 -0800 (PST)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-5c85e8fdd2dso76703387b3.2;
        Thu, 14 Dec 2023 01:07:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702544826; x=1703149626;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K62UqS9GxhpYYA4mLJeDhLsQ+jlCTyGKCF6JM+FXF3A=;
        b=HVPnM6AmuQuwlArAaADTvLr6eXfws9WDYnVqd0sBuVPAscKvNZlcYauW9lA4yaXtZz
         MeOvGesji6lQrhxMN3/M1UZLhVhFl992cxWc9H3DEyCFW6Tpodoe2ZAmG/7KAWdmteAn
         GNd3KUSyZGmUU5gf/Qk4/hLmbTkZGMQ0afyfU9efV4YUImkaTkYdPfh3j6QyJRMXh6Gy
         /5elsiFpbuBOKh6SnfDJpr618Cwp6UFvwjI641aVg2lTRTcTtmcF6euY2HKaSu+6WsOw
         EZiJL+4XGDBmdbl4XWc8CuBgEMszOJWU6aBY1Xai0z1NB09AGc3F3waPwDJZu4NTld2T
         vU/A==
X-Gm-Message-State: AOJu0YzEXByAFreqnl6fuGiwtqXjqA/DUQ2YJMNIUaZSikH6/EqhkCnj
	8atShnE9Bk7yJdp0+CGH7bVg0cRZmLTAVw==
X-Google-Smtp-Source: AGHT+IGmbZxoI9gOukxHwcTIG1wP06TzisZ2xtDzGluz9SQNH1lESYPBvdNwam2d5POI+YKw76c27g==
X-Received: by 2002:a0d:eb51:0:b0:5e2:a7a7:b0cb with SMTP id u78-20020a0deb51000000b005e2a7a7b0cbmr2435002ywe.101.1702544826562;
        Thu, 14 Dec 2023 01:07:06 -0800 (PST)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id v7-20020a81a547000000b005869ca8da8esm5237677ywg.146.2023.12.14.01.07.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Dec 2023 01:07:06 -0800 (PST)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dbcdec51ed9so825784276.0;
        Thu, 14 Dec 2023 01:07:06 -0800 (PST)
X-Received: by 2002:a25:9cc3:0:b0:dbc:ddc8:e751 with SMTP id
 z3-20020a259cc3000000b00dbcddc8e751mr1067385ybo.117.1702544826078; Thu, 14
 Dec 2023 01:07:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87wmtlo2zs.wl-kuninori.morimoto.gx@renesas.com> <87r0jto2yq.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87r0jto2yq.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Dec 2023 10:06:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUx-nm6k9LXbUJAJ78ChFYHVcmGcoz0YhWyos7h99R4wg@mail.gmail.com>
Message-ID: <CAMuHMdUx-nm6k9LXbUJAJ78ChFYHVcmGcoz0YhWyos7h99R4wg@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] drivers: clk: renesas: ignore all clocks which are
 assinged to non-Linux system
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Frank Rowand <frowand.list@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Aymeric Aillet <aymeric.aillet@iot.bzh>, 
	Yusuke Goda <yusuke.goda.sx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Morimoto-san,

Thanks for the update!

s/assinged/assigned/

On Mon, Dec 11, 2023 at 4:03=E2=80=AFAM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> Some boards might use Linux and another OS at the same time. In such
> case, currently, during booting, Linux will stop necessary module clocks
> which are not used on the Linux side, but are used by another OS.
>
> To avoid such situation, renesas-cpg-mssr tries to find
> status =3D "reserved" devices (A), and adds CLK_IGNORE_UNUSED flag to its
> <&cgp CPG_MOD xxx> clock (B).
>
> Table 2.4: Values for status property
> https://github.com/devicetree-org/devicetree-specification/releases/downl=
oad/v0.4/devicetree-specification-v0.4.pdf
>
> "reserved"
>         Indicates that the device is operational, but should not be
>         used. Typically this is used for devices that are controlled
>         by another software component, such as platform firmware.
>
> ex)
>         scif5: serial@e6f30000 {
>                 ...
> (B)             clocks =3D <&cpg CPG_MOD 202>,
>                          <&cpg CPG_CORE R8A7795_CLK_S3D1>,
>                          <&scif_clk>;
>                 ...
> (A)             status =3D "reserved";
>         };
>
> Cc: Aymeric Aillet <aymeric.aillet@iot.bzh>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Tested-by: Yusuke Goda <yusuke.goda.sx@renesas.com>

> @@ -949,6 +967,72 @@ static const struct dev_pm_ops cpg_mssr_pm =3D {
>  #define DEV_PM_OPS     NULL
>  #endif /* CONFIG_PM_SLEEP && CONFIG_ARM_PSCI_FW */
>
> +static void __init cpg_mssr_reserved_exit(struct cpg_mssr_priv *priv)
> +{
> +       kfree(priv->reserved_ids);
> +}

This function is called only once, so you might want to inline it manually.

> +
> +static int __init cpg_mssr_reserved_init(struct cpg_mssr_priv *priv,
> +                                        const struct cpg_mssr_info *info=
)
> +{
> +       struct device_node *soc =3D of_find_node_by_path("/soc");
> +       struct device_node *node;
> +       uint32_t args[MAX_PHANDLE_ARGS];
> +       unsigned int *ids =3D NULL;
> +       unsigned int num =3D 0;
> +
> +       /*
> +        * Because clk_disable_unused() will disable all unused clocks, t=
he device which is assigned
> +        * to a non-Linux system will be disabled when Linux is booted.
> +        *
> +        * To avoid such situation, renesas-cpg-mssr assumes the device w=
hich has
> +        * status =3D "reserved" is assigned to a non-Linux system, and a=
dds CLK_IGNORE_UNUSED flag
> +        * to its CPG_MOD clocks.
> +        * see also
> +        *      cpg_mssr_register_mod_clk()
> +        *
> +        *      scif5: serial@e6f30000 {
> +        *              ...
> +        * =3D>           clocks =3D <&cpg CPG_MOD 202>,
> +        *                       <&cpg CPG_CORE R8A7795_CLK_S3D1>,
> +        *                       <&scif_clk>;
> +        *                       ...
> +        *               status =3D "reserved";
> +        *      };
> +        */
> +       for_each_reserved_child_of_node(soc, node) {
> +               struct of_phandle_iterator it;
> +               int rc;
> +
> +               of_for_each_phandle(&it, rc, node, "clocks", "#clock-cell=
s", -1) {
> +                       int idx;
> +
> +                       of_phandle_iterator_args(&it, args, MAX_PHANDLE_A=
RGS);
> +
> +                       if (!(it.node =3D=3D priv->np && args[0] =3D=3D C=
PG_MOD))

I think "(it.node !=3D priv->np || args[0] !=3D CPG_MOD)" is easier to read=
 ;-)

However, I think it would make sense to split this in two separate
checks, to avoid calling of_phandle_iterator_args() when it.node !=3D
priv->np, and to validate the number of arguments:

    if (it.node !=3D priv->np)
            continue;

    if (of_phandle_iterator_args(&it, args, MAX_PHANDLE_ARGS) !=3D 2)
            continue;

    if (args[0] !=3D CPG_MOD)
            continue;

> +                               continue;
> +
> +                       ids =3D krealloc_array(ids, (num + 1), sizeof(*id=
s), GFP_KERNEL);
> +                       if (!ids)
> +                               return -ENOMEM;

Missing of_node_put(it.node) in the error path.

> +
> +                       if (priv->reg_layout =3D=3D CLK_REG_LAYOUT_RZ_A)
> +                               idx =3D MOD_CLK_PACK_10(args[1]); /* for =
DEF_MOD_STB() */
> +                       else
> +                               idx =3D MOD_CLK_PACK(args[1]);    /* for =
DEF_MOD() */
> +
> +                       ids[num] =3D info->num_total_core_clks + idx;
> +
> +                       num++;
> +               }
> +       }
> +
> +       priv->num_reserved_ids  =3D num;
> +       priv->reserved_ids      =3D ids;
> +
> +       return 0;
> +}
> +
>  static int __init cpg_mssr_common_init(struct device *dev,
>                                        struct device_node *np,
>                                        const struct cpg_mssr_info *info)
> @@ -1007,6 +1091,10 @@ static int __init cpg_mssr_common_init(struct devi=
ce *dev,
>         if (error)
>                 goto out_err;
>
> +       error =3D cpg_mssr_reserved_init(priv, info);
> +       if (error)
> +               goto out_err;

Missing of_clk_del_provider() in the error path.

You may want to move the call to cpg_mssr_reserved_init() up, as
reverting that just needs an unconditional call to kfree() (kfree
works fine on NULL), while calling of_clk_del_provider() requires a
new label to jump to.

> +
>         cpg_mssr_priv =3D priv;
>
>         return 0;
> @@ -1070,22 +1158,23 @@ static int __init cpg_mssr_probe(struct platform_=
device *pdev)
>                                          cpg_mssr_del_clk_provider,
>                                          np);
>         if (error)
> -               return error;
> +               goto reserve_err;
>
>         error =3D cpg_mssr_add_clk_domain(dev, info->core_pm_clks,
>                                         info->num_core_pm_clks);
>         if (error)
> -               return error;
> +               goto reserve_err;
>
>         /* Reset Controller not supported for Standby Control SoCs */
>         if (priv->reg_layout =3D=3D CLK_REG_LAYOUT_RZ_A)
> -               return 0;
> +               goto reserve_err;
>
>         error =3D cpg_mssr_reset_controller_register(priv);
> -       if (error)
> -               return error;
>
> -       return 0;
> +reserve_err:

Perhaps rename the label to "reserve_exit", as this is called on
success, too?

> +       cpg_mssr_reserved_exit(priv);
> +
> +       return error;
>  }
>
>  static struct platform_driver cpg_mssr_driver =3D {

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

