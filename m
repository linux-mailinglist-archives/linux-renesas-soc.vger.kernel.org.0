Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0EF344E782
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Nov 2021 14:38:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231920AbhKLNlt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Nov 2021 08:41:49 -0500
Received: from mail-vk1-f170.google.com ([209.85.221.170]:39437 "EHLO
        mail-vk1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231436AbhKLNls (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Nov 2021 08:41:48 -0500
Received: by mail-vk1-f170.google.com with SMTP id 84so5123898vkc.6;
        Fri, 12 Nov 2021 05:38:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mRW639hVziDNS87gwHKkIz/A/us73dAx7QueybDdUKU=;
        b=UdXpmlCdjXfW+9mMlu4kxBb4omRaWe/fEW6Ubwl+E3SpyV9WSQHr3NthMDX6YjYny3
         E8+L4cef+sUaXtdOzczchO2LPRfO9LYQhIZ15n32GgSMOjDKPooflbwsXYM3JdNge43R
         huqKusfThGbf1g3MmISfatPs39KgZmMe6GylwvXlHbE8625/yCiyVAyUEY/U2NbEgCNl
         qJO+JOzNnU3VSQCHsasBxSYZ2av2xkDR6HvOeFLvDTMX+xJp0Vw9gybzvO0B9tYYpON7
         cQxBnIr/TBNXPCZnzxYIN+/2orKns8fwPFqwiuPjZmuJ0TyiVEODA1fOnz932HkqZoCn
         a5SA==
X-Gm-Message-State: AOAM530Q8jjqfmVLCcZ3CSQDZ86/uDfgjBBHfMOWa4N68/GUw23/eQ2q
        c1FRUfgfohQIkS70o88jPa9tw95WyCYR6w==
X-Google-Smtp-Source: ABdhPJyhZtbKC8XeWlwwrdGtgS012sqPekvM0M0Gmetknb+UmVbBxf5oNP1Vupruotx2k8J0VpKLHQ==
X-Received: by 2002:a1f:288:: with SMTP id 130mr23649104vkc.1.1636724337298;
        Fri, 12 Nov 2021 05:38:57 -0800 (PST)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id m15sm3883926vkl.40.2021.11.12.05.38.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 05:38:56 -0800 (PST)
Received: by mail-vk1-f169.google.com with SMTP id a129so5096902vkb.8;
        Fri, 12 Nov 2021 05:38:56 -0800 (PST)
X-Received: by 2002:a05:6122:7d4:: with SMTP id l20mr23449497vkr.26.1636724336081;
 Fri, 12 Nov 2021 05:38:56 -0800 (PST)
MIME-Version: 1.0
References: <20211110191610.5664-1-wsa+renesas@sang-engineering.com> <20211110191610.5664-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20211110191610.5664-2-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 12 Nov 2021 14:38:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXg59gH=5gcV51AYyZYXrkFBsFcQhDSnqMdcM75D42SmQ@mail.gmail.com>
Message-ID: <CAMuHMdXg59gH=5gcV51AYyZYXrkFBsFcQhDSnqMdcM75D42SmQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 01/21] clk: renesas: rcar-gen3: add dummy SDnH clock
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

CC clk

On Wed, Nov 10, 2021 at 8:16 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Currently, SDnH is handled together with SDn. This caused lots of
> problems, so we want SDnH as a separate clock. Introduce a dummy SDnH
> type here which creates a fixed-factor clock with factor 1. That allows
> us to convert the per-SoC CPG drivers while keeping the old behaviour
> for now. A later patch then will add the proper functionality.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>
> Changes since RFC v1:
> * fixed typo in commit message
> * added tag from Geert
>
>  drivers/clk/renesas/rcar-cpg-lib.c  | 9 +++++++++
>  drivers/clk/renesas/rcar-cpg-lib.h  | 4 ++++
>  drivers/clk/renesas/rcar-gen3-cpg.c | 4 ++++
>  drivers/clk/renesas/rcar-gen3-cpg.h | 4 ++++
>  4 files changed, 21 insertions(+)
>
> diff --git a/drivers/clk/renesas/rcar-cpg-lib.c b/drivers/clk/renesas/rcar-cpg-lib.c
> index 5678768ee1f2..351cb9c04f5c 100644
> --- a/drivers/clk/renesas/rcar-cpg-lib.c
> +++ b/drivers/clk/renesas/rcar-cpg-lib.c
> @@ -65,6 +65,15 @@ void cpg_simple_notifier_register(struct raw_notifier_head *notifiers,
>  /*
>   * SDn Clock
>   */
> +
> +struct clk * __init cpg_sdh_clk_register(const char *name,
> +       void __iomem *sdnckcr, const char *parent_name,
> +       struct raw_notifier_head *notifiers)
> +{
> +       /* placeholder during transition */
> +       return clk_register_fixed_factor(NULL, name, parent_name, 0, 1, 1);
> +}
> +
>  #define CPG_SD_STP_HCK         BIT(9)
>  #define CPG_SD_STP_CK          BIT(8)
>
> diff --git a/drivers/clk/renesas/rcar-cpg-lib.h b/drivers/clk/renesas/rcar-cpg-lib.h
> index d00c91b116ca..548cb9562f35 100644
> --- a/drivers/clk/renesas/rcar-cpg-lib.h
> +++ b/drivers/clk/renesas/rcar-cpg-lib.h
> @@ -26,6 +26,10 @@ void cpg_simple_notifier_register(struct raw_notifier_head *notifiers,
>
>  void cpg_reg_modify(void __iomem *reg, u32 clear, u32 set);
>
> +struct clk * __init cpg_sdh_clk_register(const char *name,
> +       void __iomem *sdnckcr, const char *parent_name,
> +       struct raw_notifier_head *notifiers);
> +
>  struct clk * __init cpg_sd_clk_register(const char *name,
>         void __iomem *base, unsigned int offset, const char *parent_name,
>         struct raw_notifier_head *notifiers, bool skip_first);
> diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
> index 558191c99b48..182b189bc8f4 100644
> --- a/drivers/clk/renesas/rcar-gen3-cpg.c
> +++ b/drivers/clk/renesas/rcar-gen3-cpg.c
> @@ -486,6 +486,10 @@ struct clk * __init rcar_gen3_cpg_clk_register(struct device *dev,
>                         mult *= 2;
>                 break;
>
> +       case CLK_TYPE_GEN3_SDH:
> +               return cpg_sdh_clk_register(core->name, base + core->offset,
> +                                          __clk_get_name(parent), notifiers);
> +
>         case CLK_TYPE_GEN3_SD:
>                 return cpg_sd_clk_register(core->name, base, core->offset,
>                                            __clk_get_name(parent), notifiers,
> diff --git a/drivers/clk/renesas/rcar-gen3-cpg.h b/drivers/clk/renesas/rcar-gen3-cpg.h
> index 3d949c4a3244..2bc0afadf604 100644
> --- a/drivers/clk/renesas/rcar-gen3-cpg.h
> +++ b/drivers/clk/renesas/rcar-gen3-cpg.h
> @@ -17,6 +17,7 @@ enum rcar_gen3_clk_types {
>         CLK_TYPE_GEN3_PLL2,
>         CLK_TYPE_GEN3_PLL3,
>         CLK_TYPE_GEN3_PLL4,
> +       CLK_TYPE_GEN3_SDH,
>         CLK_TYPE_GEN3_SD,
>         CLK_TYPE_GEN3_R,
>         CLK_TYPE_GEN3_MDSEL,    /* Select parent/divider using mode pin */
> @@ -32,6 +33,9 @@ enum rcar_gen3_clk_types {
>         CLK_TYPE_GEN3_SOC_BASE,
>  };
>
> +#define DEF_GEN3_SDH(_name, _id, _parent, _offset)     \
> +       DEF_BASE(_name, _id, CLK_TYPE_GEN3_SDH, _parent, .offset = _offset)
> +
>  #define DEF_GEN3_SD(_name, _id, _parent, _offset)      \
>         DEF_BASE(_name, _id, CLK_TYPE_GEN3_SD, _parent, .offset = _offset)
>
> --
> 2.30.2
