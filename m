Return-Path: <linux-renesas-soc+bounces-716-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1468805156
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Dec 2023 11:55:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8D1D1C20BA6
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Dec 2023 10:55:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9FAE446B4;
	Tue,  5 Dec 2023 10:55:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EE2810E4;
	Tue,  5 Dec 2023 02:55:16 -0800 (PST)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-d9beb865a40so3774175276.1;
        Tue, 05 Dec 2023 02:55:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701773715; x=1702378515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rOPNIIWTN7dZPbX0FD4G46JR7mV/RH/eYdHF2UsRg+g=;
        b=cmo1xNOdB+6JiOuRDiFTQvOgPFtOYtfYGt6mx4sqzokPcZH+HAZW5vEp1jRytnIxUB
         ffRSHpg3/ytk07SsrnrsN24HuyVIylYkBvlnp0mKUqDaTedzlDPHU+7vl6AWKMYZpCwm
         7mjVGqSJXzcIubNzoNp05N01bt3BJNbrMM92t1uXqWr6CrrsOPwEYw/3HJknUbLoWpuM
         o3afoXEt0HL5SW7UhYQdVMEBu71uL+1vdEOJAsKDbE8DvdhdMJ8kgTLjYILWfE2yRKRX
         bqsEXslRPCD0d0RUDTyMGZ5LhPg3sYPKXGJ7JaCZfOUJbHRStbjXlfTxA92ijn/JvmBu
         Bh1Q==
X-Gm-Message-State: AOJu0Yx/YX0p7p3SXlh7X+5TyJgcvsNDcGk/tV3RVecjp9me9IMloajK
	Bnq3OC5CjnUJWOQnSv6HEvOit7yjkCdx9g==
X-Google-Smtp-Source: AGHT+IHmpPPgRZFrFzcE5Uplrmsp+WNgSebWHXjiEYX7iORnfsd4OGbug9LZPwflzrsWQtosGtj2Vw==
X-Received: by 2002:a5b:f4e:0:b0:db3:9a05:a956 with SMTP id y14-20020a5b0f4e000000b00db39a05a956mr4012139ybr.61.1701773714968;
        Tue, 05 Dec 2023 02:55:14 -0800 (PST)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id k135-20020a25248d000000b00d7360e0b240sm3023528ybk.31.2023.12.05.02.55.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Dec 2023 02:55:14 -0800 (PST)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-5d74186170fso28324727b3.3;
        Tue, 05 Dec 2023 02:55:14 -0800 (PST)
X-Received: by 2002:a05:690c:a16:b0:5d4:3a1:bd94 with SMTP id
 cg22-20020a05690c0a1600b005d403a1bd94mr3739440ywb.11.1701773713774; Tue, 05
 Dec 2023 02:55:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87v89k0yyj.wl-kuninori.morimoto.gx@renesas.com> <87plzs0ywr.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87plzs0ywr.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 Dec 2023 11:55:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXqe2XurNoKa3R=KvmgA6NDS8B_NjWEftn4XWksYJbOtw@mail.gmail.com>
Message-ID: <CAMuHMdXqe2XurNoKa3R=KvmgA6NDS8B_NjWEftn4XWksYJbOtw@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] drivers: clk: renesas: ignore all clocks which is
 assinged to non Linux system
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Frank Rowand <frowand.list@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Aymeric Aillet <aymeric.aillet@iot.bzh>, Yusuke Goda <yusuke.goda.sx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Morimoto-san,

Thanks for the update!

s/is assigned/are assigned/
s/non Linux/non-Linux/

On Thu, Nov 30, 2023 at 3:15=E2=80=AFAM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> Some board might use Linux and another OS in the same time. In such

boards ... at the same

> case, current Linux will stop necessary module clock when booting
> which is not used on Linux side, but is used on another OS side.

... currently, during booting, Linux will stop necessary module clocks
which are not used on the Linux side, but are used by another OS.

> To avoid such situation, renesas-cpg-mssr try to find

tries

> status =3D "reserved" devices (A), and add CLK_IGNORE_UNUSED flag to its

adds

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

> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -453,6 +458,19 @@ static void __init
cpg_mssr_register_mod_clk(const struct mssr_mod_clk *mod,
>                         break;
>                 }
>
> +       /*
> +        * Ignore reserved device.
> +        * see
> +        *      cpg_mssr_reserved_init()
> +        */
> +       for (i =3D 0; i < priv->num_reserved_ids; i++) {
> +               if (id =3D=3D priv->reserved_ids[i]) {
> +                       dev_info(dev, "Ignore Linux non-assigned mod (%s)=
\n", mod->name);
> +                       init.flags |=3D CLK_IGNORE_UNUSED;
> +                       break;
> +               }
> +       }
> +
>         clk =3D clk_register(NULL, &clock->hw);
>         if (IS_ERR(clk))
>                 goto fail;
> @@ -949,6 +967,75 @@ static const struct dev_pm_ops cpg_mssr_pm =3D {
>  #define DEV_PM_OPS     NULL
>  #endif /* CONFIG_PM_SLEEP && CONFIG_ARM_PSCI_FW */
>
> +static void __init cpg_mssr_reserved_exit(struct cpg_mssr_priv *priv)
> +{
> +       kfree(priv->reserved_ids);
> +}
> +
> +static int __init cpg_mssr_reserved_init(struct cpg_mssr_priv *priv,
> +                                        const struct cpg_mssr_info *info=
)
> +{
> +       struct device_node *root =3D of_find_node_by_path("/soc");

s/root/soc/

> +       struct device_node *node =3D NULL;

No need to initialize node.

> +       struct of_phandle_args clkspec;
> +       unsigned int *ids =3D NULL;
> +       unsigned int num =3D 0;
> +
> +       /*
> +        * Because cpg_mssr_info has .num_hw_mod_clks which indicates num=
ber of all Module Clocks,
> +        * and clk_disable_unused() will disable all unused clocks, the d=
evice which is assigned to

"Because clk_disable_unused() will disable all unused clocks, ..."?

> +        * non-Linux system will be disabled when Linux was booted.

a non-Linux
s/was/is/

> +        *
> +        * To avoid such situation, renesas-cpg-mssr assumes the device w=
hich has
> +        * status =3D "reserved" is assigned to non-Linux system, and add=
 CLK_IGNORE_UNUSED flag

a non-Linux ... adds

> +        * to its clocks if it was CPG_MOD.

to its CPG_MOD clocks

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
> +       for_each_reserved_child_of_node(root, node) {
> +               unsigned int i =3D 0;
> +
> +               while (!of_parse_phandle_with_args(node, "clocks", "#cloc=
k-cells", i++, &clkspec)) {

Looks like you missed Rob's comment on v2 to use of_for_each_phandle() inst=
ead?

> +

Please drop this blank line.

> +                       of_node_put(clkspec.np);
> +
> +                       if (clkspec.np =3D=3D priv->dev->of_node &&
> +                           clkspec.args[0] =3D=3D CPG_MOD) {
> +

Please drop this blank line.

> +                               ids =3D krealloc_array(ids, (num + 1), si=
zeof(*ids), GFP_KERNEL);
> +                               if (!ids)
> +                                       return -ENOMEM;
> +
> +                               ids[num] =3D info->num_total_core_clks +
> +                                               MOD_CLK_PACK(clkspec.args=
[1]);

This should use MOD_CLK_PACK_10() in case priv->reg_layout =3D=3D
CLK_REG_LAYOUT_RZ_A.

> +
> +                               num++;
> +                       }
> +               }
> +       }
> +
> +       priv->num_reserved_ids  =3D num;
> +       priv->reserved_ids      =3D ids;
> +
> +       return 0;
> +}

> @@ -1029,6 +1114,10 @@ void __init cpg_mssr_early_init(struct device_node=
 *np,
>         if (error)
>                 return;
>
> +       error =3D cpg_mssr_reserved_init(cpg_mssr_priv, info);
> +       if (error)
> +               goto err;

Please move this into cpg_mssr_common_init(), which is called above.
After that, there is no longer a need to factor out
cpg_mssr_common_exit().

> +
>         for (i =3D 0; i < info->num_early_core_clks; i++)
>                 cpg_mssr_register_core_clk(&info->early_core_clks[i], inf=
o,
>                                            cpg_mssr_priv);
> @@ -1037,6 +1126,12 @@ void __init cpg_mssr_early_init(struct device_node=
 *np,
>                 cpg_mssr_register_mod_clk(&info->early_mod_clks[i], info,
>                                           cpg_mssr_priv);
>
> +       cpg_mssr_reserved_exit(cpg_mssr_priv);

Please drop this, as you still need this data when cpg_mssr_probe()
is called later (yes, when a driver uses cpg_mssr_early_init(),
cpg_mssr_probe() is still called later to register the non-early
clocks).

> +
> +       return;
> +
> +err:
> +       cpg_mssr_common_exit(cpg_mssr_priv);
>  }
>
>  static int __init cpg_mssr_probe(struct platform_device *pdev)
> @@ -1060,6 +1155,10 @@ static int __init cpg_mssr_probe(struct platform_d=
evice *pdev)
>         priv->dev =3D dev;
>         dev_set_drvdata(dev, priv);
>
> +       error =3D cpg_mssr_reserved_init(priv, info);
> +       if (error)
> +               return error;

When a driver uses cpg_mssr_early_init(), this causes the reserved
clock list to be created a second time.  Moving this handling into
cpg_mssr_common_init() would fix that.

> +
>         for (i =3D 0; i < info->num_core_clks; i++)
>                 cpg_mssr_register_core_clk(&info->core_clks[i], info, pri=
v);
>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

