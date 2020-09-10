Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CACCF2646DE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Sep 2020 15:24:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730336AbgIJNYE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Sep 2020 09:24:04 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:42358 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730131AbgIJNLZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Sep 2020 09:11:25 -0400
Received: by mail-ot1-f66.google.com with SMTP id g10so5269049otq.9
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Sep 2020 06:11:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kTxrQxjlXCXYRxUF7VwkUwbVyAfGqaT/aCsiLx65qhU=;
        b=bOw/1v9i5a1Ti/GsS8AnfHpaD8LB2My3i/FTBYiYuGZcyOoyWr9i0oAnrh9BeYTTRt
         tQaaeSe5tj+A0+Wsg0Arv9jnuG3mbQUMG7d60Ox1+dxbL6tSIzzglEce7vj6zrheVgxu
         P4Ujy1Io6s/9+ku68VhjWt1OVg4eUiPqVJd7dkfeLGauTQ5+FzMR4Opms7qp0Ch0kNgv
         N8mcmUwpnctQC3jYuGSt6mZkt5Aujvj0mpE2/WEJGuR+GmMP/27/uMyj17nx9D4GV4YZ
         0VFC13qynDDlrs20W0jV2QQTfamEbad0O2F5yfyvT8TpZff/IoMOQOPHoGuTt37F0vf8
         KJmw==
X-Gm-Message-State: AOAM533az1qtSi9EgMOLq5O9sLJ8Zw+S/wa2WiMQttC4+m8tGUuo7Hmi
        z7/d8Lq2ZROdG4SCyDoicuPRLKxqxz2ecOkbu7I=
X-Google-Smtp-Source: ABdhPJyMYxSD1LXG9iWjLGUOxZUaqRL7BJLikPmpYtcWF6JGYP4G9VY5+xlnceWjfvW0D/nZjDt13T7NTfStF3HXNVQ=
X-Received: by 2002:a9d:3b76:: with SMTP id z109mr3949067otb.250.1599743485311;
 Thu, 10 Sep 2020 06:11:25 -0700 (PDT)
MIME-Version: 1.0
References: <1599657211-17504-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1599657211-17504-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1599657211-17504-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Sep 2020 15:11:14 +0200
Message-ID: <CAMuHMdV=svSDGJu4HoaeiEdWT2nk4eQFARMZKn3x7kvJx2QBgQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] clk: renesas: cpg-mssr: add register pointers into
 struct cpg_mssr_priv
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
> To support other register layout in the future, add register pointers
> of control_regs and status_regs into struct cpg_mssr_priv. After that,
> we can remove unused macros like MSTPSR(). No behavior changes.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c

> @@ -137,6 +130,8 @@ struct cpg_mssr_priv {
>         unsigned int last_dt_core_clk;
>
>         struct raw_notifier_head notifiers;
> +       const u16 *status_regs;
> +       const u16 *control_regs;

Please add new fields to the struct's kerneldoc comments above.

Note that you need to use a similar dispatching for the Software Reset
and Software Reset Clearing Registers, as their offsets differ from
previous SoCs.

The reset looks good to me, thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
