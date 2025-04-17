Return-Path: <linux-renesas-soc+bounces-16123-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C22CAA91F3F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Apr 2025 16:15:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B4305A7AE8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Apr 2025 14:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15F1C250C02;
	Thu, 17 Apr 2025 14:15:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E409B1624DC;
	Thu, 17 Apr 2025 14:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744899354; cv=none; b=ohiicU47n+lBH3SMzKKRjSto/QC7doe2+SUbUvNzR87lIP9oKeSJ9DQkTc7x4Qv4L0m5cB2PNSE3Y0yJ0egheSWMzL7BiLcblEMu16rmi6WXZBVa5CZdtQmL/xmws5EDiMoJyS5etQp8IgadZWBGvtmJ9psSgxO6BK8ZQR8h0Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744899354; c=relaxed/simple;
	bh=vazE/OzKBBSg2rjIggOk4OJ14N/Lt5458VFxQiSnZsY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PP2iFpxMEbrxuETNw/f86DTyT3Wcm2PVSPvtsSg+P8L5cOgWaRlyyaAu042gG0IXtukmkVamJ2NN1mrtsbldnP/og/6N0tjJN0EyrVW6wkAw4+7NMkASI5y5Avkh7qM/LafZ7gDrv+YZJALH+yae90M29fPSWb+wMdl8nqmCSf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7c5c815f8efso68376385a.2;
        Thu, 17 Apr 2025 07:15:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744899350; x=1745504150;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6ozcptRYeKioDAf1+hL3+/Kh+TNtMmTVxXgs8Vkwsgs=;
        b=q50mrEJ04CkN/du6CgvgHy0rtam/w/7A5nKGxKPJTz7yUiluY8Rt3VEZp9NVY0Lw7p
         i7TndtmW74qUuzbI0nHLUjBj8ZAUAgGX34kp9o4mm46PRfVC+HhVAyDHXGbcd3ixwSpl
         SpWmOXCayoQj3y+5VpWpvoMoMKh5lPSFl+FM2F9+d8AEVaFyOP0fwN0HiuPZxsRP1C3y
         30qBkrDFR4KgEUWTtS/nXCxcErx4uA36JlQDuar9mYi4YpeotY4BU9k7gU8yHmQcB4tX
         GVPzpjvZ/XEjeQiQq1hEDlWPGHiJpkstVgq+NtgyL4iYwI3Hd0ItedrLSq4EJptBiYGX
         FGaA==
X-Forwarded-Encrypted: i=1; AJvYcCV55mOsaJkHDAcrRc3JdE7lX54x0lq5/zNQkPQ9dzyky4GLpXSv9qkWVEL4pVEzUgsdPJR7HW5CW3CCgOel@vger.kernel.org, AJvYcCVySVkcudgTuqWHRHti2weKPBco7+elNap9u/2opOlk+8XgdliI0WP3k7hK07sJCnN1lYmwje40lFNZph1iCNkrKMo=@vger.kernel.org, AJvYcCXFwS1OUMBKfkJclY+ZAZ9QuQwFA/U+Jb7CCoHliWywd6CHzkU/nEwAme9MZzgdua/dahPrkn2SGMg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIsGaG6R89fFDjJ1FOa5v56uw5wQo/TK8++WU4o+S4r1KTmWIW
	+exZvefRz0jt9R8RoMWBnE2gQSWA1/3EPKY3DSiSfz9QBPFP1EnJdE0tNmR9
X-Gm-Gg: ASbGnctVQGbmXqx1l2O4TKU33iF/riNjOQMEkhLGvXvDxgdJEi7sxyJ+hqSH+zNnlE0
	ziAp/LdHv6Q0OSWFVM4EWoSjCbVxlDxDfEnZGPrms12Bi889GumFUX/PfqC+lVidWBPsQcD9hYG
	3Z0EGzaVKE21x6C7WqZHXx7zVeVJ1ITsYyRhtmKMB3I6ctOvjOzUcswuWv9GcTV6kik4rNYPx5V
	Pg1RVh6x4DZieYzk5QKerXfu6wuRG18W85dTYKdwtp/vyz+uPVBZZGd1MHc55z/koKNgC85R7o7
	kuw/1noSMVICWZyIPuGJIP3dTtpYhInjv8tPGjD4+AR1P+T16uZLDjejV7Pl4Hm/uSyxCjINpLe
	3uW8=
X-Google-Smtp-Source: AGHT+IFJH1AzXuc5IZhd3k9hgLRCWGGutWbYC2A54S0nnZLrcEDWkGjbfg1nvWP/innDXRdFlm0/Og==
X-Received: by 2002:a05:620a:424b:b0:7c5:55be:7bff with SMTP id af79cd13be357-7c9190652c6mr770883185a.43.1744899349835;
        Thu, 17 Apr 2025 07:15:49 -0700 (PDT)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com. [209.85.219.49])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a8969143sm1178126085a.50.2025.04.17.07.15.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 07:15:49 -0700 (PDT)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6e8f4c50a8fso7818786d6.1;
        Thu, 17 Apr 2025 07:15:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUfG3O5gFYP/wzDsg6+DU3TwjdYGv4jUsFTOYKT4jlHOH2VcsxCm0OF85qi2gYPOlDZWrF219U//4Y=@vger.kernel.org, AJvYcCUh+W2t/TyVEPWBSvA5e8ScLVwodDrv/XyOrZbf65AGuHSvLVGgaBulEvJnCKtnmAjvRQI+of0JGS/r8mEzqYPFCtw=@vger.kernel.org, AJvYcCXEWi3D9sfMsNy4jHi1VvXLI1LBBK2Zm4CLZFgzu6WaD+/gYBWPSbeUG3k0zoPs+uOMi3ralU4sR+eCQdaV@vger.kernel.org
X-Received: by 2002:a05:6214:410e:b0:6e6:68e3:8d84 with SMTP id
 6a1803df08f44-6f2b2f8c378mr94221856d6.18.1744899349400; Thu, 17 Apr 2025
 07:15:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403212919.1137670-1-thierry.bultel.yh@bp.renesas.com> <20250403212919.1137670-6-thierry.bultel.yh@bp.renesas.com>
In-Reply-To: <20250403212919.1137670-6-thierry.bultel.yh@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 17 Apr 2025 16:15:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUu4o5VU9Sd1CW5QyEZewKLj--2yMPYCfcwVMut5FiVyg@mail.gmail.com>
X-Gm-Features: ATxdqUGdJarQQ-GgVZlFhU6ALz5FSk5JmuyCNTEwOSgp5rihxYznS7cN1STNyRI
Message-ID: <CAMuHMdUu4o5VU9Sd1CW5QyEZewKLj--2yMPYCfcwVMut5FiVyg@mail.gmail.com>
Subject: Re: [PATCH v7 05/13] clk: renesas: Pass sub struct of cpg_mssr_priv
 to cpg_clk_register
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org, 
	paul.barker.ct@bp.renesas.com, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Thierry,

On Thu, 3 Apr 2025 at 23:30, Thierry Bultel
<thierry.bultel.yh@bp.renesas.com> wrote:
> In a subsequent patch, the registration callback will need more parameters
> from cpg_mssr_priv (like another base address with clock controllers
> with double register block, and also, notifiers and rmw_lock).
> Instead of adding more parameters, move the needed parameters to a public
> sub-struct.
> Instead moving clks to this structure, which would have implied to add
> an allocation (and cleanup) for it, keep the way the allocation is done
> and just have a copy of the pointer in the public structure.
>
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r8a77970-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a77970-cpg-mssr.c
> @@ -218,11 +218,13 @@ static int __init r8a77970_cpg_mssr_init(struct device *dev)
>  }
>
>  static struct clk * __init r8a77970_cpg_clk_register(struct device *dev,
> -       const struct cpg_core_clk *core, const struct cpg_mssr_info *info,
> -       struct clk **clks, void __iomem *base,
> -       struct raw_notifier_head *notifiers)
> +       const struct cpg_core_clk *core,
> +       const struct cpg_mssr_info *info,

These two still fit on a single line, like before.

> +       struct cpg_mssr_pub *pub)
>  {
>         const struct clk_div_table *table;
> +       void __iomem *base = pub->base0;
> +       struct clk **clks = pub->clks;
>         const struct clk *parent;
>         unsigned int shift;
>

> --- a/drivers/clk/renesas/rcar-gen3-cpg.h
> +++ b/drivers/clk/renesas/rcar-gen3-cpg.h
> @@ -80,9 +80,9 @@ struct rcar_gen3_cpg_pll_config {
>  #define CPG_RCKCR      0x240
>
>  struct clk *rcar_gen3_cpg_clk_register(struct device *dev,
> -       const struct cpg_core_clk *core, const struct cpg_mssr_info *info,
> -       struct clk **clks, void __iomem *base,
> -       struct raw_notifier_head *notifiers);
> +       const struct cpg_core_clk *core,
> +       const struct cpg_mssr_info *info,

Likewise.

> +       struct cpg_mssr_pub *pub);
>  int rcar_gen3_cpg_init(const struct rcar_gen3_cpg_pll_config *config,
>                        unsigned int clk_extalr, u32 mode);
>

> --- a/drivers/clk/renesas/rcar-gen4-cpg.c
> +++ b/drivers/clk/renesas/rcar-gen4-cpg.c
> @@ -418,9 +418,11 @@ static const struct clk_div_table cpg_rpcsrc_div_table[] = {
>
>  struct clk * __init rcar_gen4_cpg_clk_register(struct device *dev,
>         const struct cpg_core_clk *core, const struct cpg_mssr_info *info,
> -       struct clk **clks, void __iomem *base,
> -       struct raw_notifier_head *notifiers)
> +       struct cpg_mssr_pub *pub)
>  {
> +       struct raw_notifier_head *notifiers = &pub->notifiers;
> +       void __iomem *base = pub->base0;
> +       struct clk **clks = pub->clks;
>         const struct clk *parent;
>         unsigned int mult = 1;
>         unsigned int div = 1;
> @@ -517,7 +519,7 @@ struct clk * __init rcar_gen4_cpg_clk_register(struct device *dev,
>
>         case CLK_TYPE_GEN4_RPC:
>                 return cpg_rpc_clk_register(core->name, base + CPG_RPCCKCR,
> -                                           __clk_get_name(parent), notifiers);
> +                                           __clk_get_name(parent), &pub->notifiers);

Please drop this unneeded change.

>
>         case CLK_TYPE_GEN4_RPCD2:
>                 return cpg_rpcd2_clk_register(core->name, base + CPG_RPCCKCR,

> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> @@ -127,14 +127,12 @@ static const u16 srstclr_for_gen4[] = {
>   *
>   * @rcdev: Optional reset controller entity
>   * @dev: CPG/MSSR device
> - * @base: CPG/MSSR register block base address
>   * @reg_layout: CPG/MSSR register layout
>   * @rmw_lock: protects RMW register accesses

rmw_lock is removed below.

>   * @np: Device node in DT for this CPG/MSSR module
>   * @num_core_clks: Number of Core Clocks in clks[]
>   * @num_mod_clks: Number of Module Clocks in clks[]
>   * @last_dt_core_clk: ID of the last Core Clock exported to DT
> - * @notifiers: Notifier chain to save/restore clock state for system resume
>   * @status_regs: Pointer to status registers array
>   * @control_regs: Pointer to control registers array
>   * @reset_regs: Pointer to reset registers array
> @@ -143,6 +141,7 @@ static const u16 srstclr_for_gen4[] = {
>   *                 [].val: Saved values of SMSTPCR[]
>   * @reserved_ids: Temporary used, reserved id list
>   * @num_reserved_ids: Temporary used, number of reserved id list
> + * @pub: Data passed to clock registration callback
>   * @clks: Array containing all Core and Module Clocks
>   */
>  struct cpg_mssr_priv {
> @@ -150,16 +149,13 @@ struct cpg_mssr_priv {
>         struct reset_controller_dev rcdev;
>  #endif
>         struct device *dev;
> -       void __iomem *base;
>         enum clk_reg_layout reg_layout;
> -       spinlock_t rmw_lock;
>         struct device_node *np;
>
>         unsigned int num_core_clks;
>         unsigned int num_mod_clks;
>         unsigned int last_dt_core_clk;
>
> -       struct raw_notifier_head notifiers;
>         const u16 *status_regs;
>         const u16 *control_regs;
>         const u16 *reset_regs;
> @@ -172,6 +168,7 @@ struct cpg_mssr_priv {
>         unsigned int *reserved_ids;
>         unsigned int num_reserved_ids;
>
> +       struct cpg_mssr_pub pub;

Perhaps insert this at the top of the structure, so &priv->pub needs
no calculation?

>         struct clk *clks[];
>  };

> --- a/drivers/clk/renesas/renesas-cpg-mssr.h
> +++ b/drivers/clk/renesas/renesas-cpg-mssr.h

> @@ -27,6 +29,21 @@ struct cpg_core_clk {
>         unsigned int div;
>         unsigned int mult;
>         unsigned int offset;
> +
> +/**
> + * struct cpg_mssr_pub - Private data shared with

The "private" sounds a bit weird here, so please just drop it.

> + * device-specific clk registration code
> + *
> + * @base0: CPG/MSSR register block base0 address
> + * @rmw_lock: protects RMW register accesses
> + * @notifiers: Notifier chain to save/restore clock state for system resume

These two lines should be exchanged, to match the declaration order
below.

> + * @clks: pointer to clocks
> + */
> +struct cpg_mssr_pub {
> +       void __iomem *base0;
> +       struct raw_notifier_head notifiers;
> +       spinlock_t rmw_lock;
> +       struct clk **clks;
>  };
>
>  enum clk_types {

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

