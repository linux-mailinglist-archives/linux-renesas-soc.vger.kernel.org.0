Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 343302653C5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Sep 2020 23:40:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726539AbgIJVkh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Sep 2020 17:40:37 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:46492 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730462AbgIJNHD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Sep 2020 09:07:03 -0400
Received: by mail-oi1-f195.google.com with SMTP id u126so5787577oif.13
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Sep 2020 06:06:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H8F0uoQSTLMyEDc0NM0wgvwkiKPpTJgPIRUxBG5NJ1E=;
        b=sP2ms1SHT5NFK0aKmW6ZMcHQo1hdttB+ZYFpPOFzhm/Qo+tQb7GhpZsypK+1uY+tm6
         2sByN5rYzJ3IdqFMwikg5Pr9lhtrlQRTB1eP8Pcyevj/YyHZyUnriyxx9OFLRPzPaJzW
         PEV9i3fVi+EVcS2g1EH3oRrzSW9+E5hwil4hAsL+VcN0un+Tf9e8F7cGu+Ntj/Kn4tGG
         XspoIM49X1IcfbsSthjE54yyYAPhePg7gWcAS4H0wYXR7b4tNG9ZwQ+KU2oU8FyRZBcM
         XtJjMJK858sxpACgUXJGB1yMSuO6iicQ8HHfBfK8tzwlW1GvX8rkF5EjTkanOQ0aDhSp
         JkcA==
X-Gm-Message-State: AOAM533kjkpR8t50dCd2sjEhqwuSlzWkhr9YY2lSkx5SDb5VKHuABowT
        dbRoJgXqUsJzJCc1umx03RSOez4MEgWV4FcoeP0=
X-Google-Smtp-Source: ABdhPJzOqIo5S03/4AT1LsSOHUz8rnOYlqG45hfrVzn6WOLV4twsw8n8TVKx4wIckitLCW7bbi0RCjzyithgi8uNbfQ=
X-Received: by 2002:aca:4441:: with SMTP id r62mr3421363oia.153.1599743196268;
 Thu, 10 Sep 2020 06:06:36 -0700 (PDT)
MIME-Version: 1.0
References: <1599657211-17504-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1599657211-17504-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1599657211-17504-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Sep 2020 15:06:24 +0200
Message-ID: <CAMuHMdX0--GqyjqWH+0Hi_6_A2BC8qda6k2wuUtQ6=FjabG5ZQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] clk: renesas: cpg-mssr: Use enum clk_reg_layout
 instead of a boolean flag
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Wed, Sep 9, 2020 at 3:13 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Geert suggested defining multiple registers layout variants using
> an enum [1] to support further devices like R-Car V3U. So, use enum
> clk_reg_layout instead of a boolean .stbyctrl flag. No behavior change.
>
> [1]
> https://lore.kernel.org/linux-renesas-soc/CAMuHMdVAgN69p9FFnQdO4iHk2CHkeNaVui2Q-FOY6_BFVjQ-Nw@mail.gmail.com/
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

> --- a/drivers/clk/renesas/renesas-cpg-mssr.h
> +++ b/drivers/clk/renesas/renesas-cpg-mssr.h

> @@ -130,7 +135,7 @@ struct cpg_mssr_info {
>         unsigned int num_core_clks;
>         unsigned int last_dt_core_clk;
>         unsigned int num_total_core_clks;
> -       bool stbyctrl;
> +       enum clk_reg_layout reg_layout;

Seems like you forgot to update the struct's kerneldoc for this rename?

>
>         /* Module Clocks */
>         const struct mssr_mod_clk *mod_clks;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
