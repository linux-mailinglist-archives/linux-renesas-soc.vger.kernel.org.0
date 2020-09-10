Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99C382653B7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Sep 2020 23:39:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728223AbgIJVju (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Sep 2020 17:39:50 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:43768 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730361AbgIJNHJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Sep 2020 09:07:09 -0400
Received: by mail-oi1-f195.google.com with SMTP id i17so5821297oig.10
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Sep 2020 06:07:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jZS5YRLpcUe8XDQGUh/r8dVKb0sLcbU5LrWnfXHnp90=;
        b=qR8YovF25oey7Y6MnBLOvxBulOUB/4xJtXxxwivBsXlDCrog8lT+f13oU+spf1fFbH
         uXqsQE/e2lLq1pBgxRmjko6p9L8HeAY+t2rjgRsTOqnV8ULsaEioF0WFq0USUo1aXBHV
         QQ+OVVGlIsALFOwLkNI8DzCIZH91c/aV6pyRAwxqO4p5BgnUWiJE7HYHZk3/ailalHTn
         GUuPvna04yf8fz/g9uLjUBWGdggEJPVBRvJlZkhOqzlhJCnM/WjmXBuEoMQrSSr4VWqT
         apspoBQ13NEDYkjw8v7RCT/3TISJnXjnJUq7ZeCQGlcUPJ6taFWn+Sw27CURfdZYpjsR
         Mk8g==
X-Gm-Message-State: AOAM531paEG5hSv3OL1SW/I8dZavpnVqq2zdx7WXoeCDaB7UNR6wx4w6
        VCVfTMphH/SyfLvZkO3NPdFrMkCdbq8bDw+ERg4=
X-Google-Smtp-Source: ABdhPJxogQc5yiVwOxQj0SWrVAiBom0ISEEBlE0pPMUH8ILoNjILl1SaHWMNRMhh7kvZr4MINrwtRPBCj0y18eYyH+g=
X-Received: by 2002:aca:52d6:: with SMTP id g205mr17198oib.54.1599743226960;
 Thu, 10 Sep 2020 06:07:06 -0700 (PDT)
MIME-Version: 1.0
References: <1599657211-17504-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1599657211-17504-3-git-send-email-yoshihiro.shimoda.uh@renesas.com> <CAMuHMdX0--GqyjqWH+0Hi_6_A2BC8qda6k2wuUtQ6=FjabG5ZQ@mail.gmail.com>
In-Reply-To: <CAMuHMdX0--GqyjqWH+0Hi_6_A2BC8qda6k2wuUtQ6=FjabG5ZQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Sep 2020 15:06:56 +0200
Message-ID: <CAMuHMdUxkFDA4mOZ76Sx6_mJ5Nqs6cvxBAAA5hJa65LkAnx09Q@mail.gmail.com>
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

On Thu, Sep 10, 2020 at 3:06 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Wed, Sep 9, 2020 at 3:13 PM Yoshihiro Shimoda
> <yoshihiro.shimoda.uh@renesas.com> wrote:
> > Geert suggested defining multiple registers layout variants using
> > an enum [1] to support further devices like R-Car V3U. So, use enum
> > clk_reg_layout instead of a boolean .stbyctrl flag. No behavior change.
> >
> > [1]
> > https://lore.kernel.org/linux-renesas-soc/CAMuHMdVAgN69p9FFnQdO4iHk2CHkeNaVui2Q-FOY6_BFVjQ-Nw@mail.gmail.com/
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>
> > --- a/drivers/clk/renesas/renesas-cpg-mssr.h
> > +++ b/drivers/clk/renesas/renesas-cpg-mssr.h
>
> > @@ -130,7 +135,7 @@ struct cpg_mssr_info {
> >         unsigned int num_core_clks;
> >         unsigned int last_dt_core_clk;
> >         unsigned int num_total_core_clks;
> > -       bool stbyctrl;
> > +       enum clk_reg_layout reg_layout;
>
> Seems like you forgot to update the struct's kerneldoc for this rename?

With that fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
