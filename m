Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47183448107
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Nov 2021 15:12:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238926AbhKHOPS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Nov 2021 09:15:18 -0500
Received: from mail-vk1-f181.google.com ([209.85.221.181]:44580 "EHLO
        mail-vk1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237250AbhKHOPR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Nov 2021 09:15:17 -0500
Received: by mail-vk1-f181.google.com with SMTP id d128so8246855vkf.11;
        Mon, 08 Nov 2021 06:12:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BPrzNjKOLau3hKF+y8oEKhXRBCES6tkh2qL6Bflm6IE=;
        b=ebHAKzmUSnHOFSGkTFQaGS8FV4RI5yhUiO1RiBaFIIYrNz9OVHYoA6iZjmMJH3d+aI
         l/njNmbKnFc1R+LaHcI9VRxY6xdd75MDckedmpmb9THcH1R7Q2TOa5fEJdxxYVkBkfL6
         hGuG1YBVagHeAFxV21W7l6rVmMsrxSGjyx/IrTg6Zsp9qiL91Z6C58MjZUqGJzjq8m9u
         A/+YF+iKnohLMyfKE9Hw58qbZN2Pl74rtscAsftmh1PFM4jGZLSVF07Uc1S0Ah3ga6O2
         9peCChU3O8PpSERxYN5tn1GuIwl3q2DAoL+RBlhCyjc2PDdM8UPze1UtyGw1Xs8biNcJ
         Zd4A==
X-Gm-Message-State: AOAM530pXj3D6pPvKJGrP/2qhxMh9+7ExlCHLw5elpwBIK87yFOE75k5
        7xKdDCZRbAZ92Ka6W6emHQJ2Px3Hy3+tTxDO
X-Google-Smtp-Source: ABdhPJzdYP6krv5UfwBjHy/wLWmObTsStfKHvpfjnzyOK/NZ21hk8+GcmHgVCeu3d97H+lDOppxTbA==
X-Received: by 2002:a05:6122:1812:: with SMTP id ay18mr12453769vkb.18.1636380752676;
        Mon, 08 Nov 2021 06:12:32 -0800 (PST)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id m186sm3140724vsm.11.2021.11.08.06.12.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 06:12:32 -0800 (PST)
Received: by mail-vk1-f174.google.com with SMTP id b192so2619943vkf.3;
        Mon, 08 Nov 2021 06:12:32 -0800 (PST)
X-Received: by 2002:a05:6122:20ab:: with SMTP id i43mr21826948vkd.19.1636380752180;
 Mon, 08 Nov 2021 06:12:32 -0800 (PST)
MIME-Version: 1.0
References: <20211108101157.15189-1-bp@alien8.de> <20211108101157.15189-5-bp@alien8.de>
In-Reply-To: <20211108101157.15189-5-bp@alien8.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 8 Nov 2021 15:12:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUSvU6mW8cpiNGru7cv+B3hCvF=ou8ujTOz5czZqLrAxw@mail.gmail.com>
Message-ID: <CAMuHMdUSvU6mW8cpiNGru7cv+B3hCvF=ou8ujTOz5czZqLrAxw@mail.gmail.com>
Subject: Re: [PATCH v0 04/42] clk: renesas: Check notifier registration return value
To:     Borislav Petkov <bp@alien8.de>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Borislav,

Thanks for your patch!

On Mon, Nov 8, 2021 at 1:49 PM Borislav Petkov <bp@alien8.de> wrote:
> From: Borislav Petkov <bp@suse.de>
>
> Avoid homegrown notifier registration checks.

Which homegrown notifier registration check is avoided?
IIANM, you're adding a homegrown notifier registration check?

> No functional changes.
>
> Signed-off-by: Borislav Petkov <bp@suse.de>

> --- a/drivers/clk/renesas/clk-div6.c
> +++ b/drivers/clk/renesas/clk-div6.c
> @@ -306,7 +306,9 @@ struct clk * __init cpg_div6_register(const char *name,
>
>         if (notifiers) {
>                 clock->nb.notifier_call = cpg_div6_clock_notifier_call;
> -               raw_notifier_chain_register(notifiers, &clock->nb);
> +
> +               if (raw_notifier_chain_register(notifiers, &clock->nb))
> +                       pr_warn("CPG DIV6 clock notifier already registered\n");

A duplicate registration cannot happen, as the notifier is freshly allocated.

>         }
>
>         return clk;
> diff --git a/drivers/clk/renesas/rcar-cpg-lib.c b/drivers/clk/renesas/rcar-cpg-lib.c
> index e93f0011eb07..fbbb6f4a8148 100644
> --- a/drivers/clk/renesas/rcar-cpg-lib.c
> +++ b/drivers/clk/renesas/rcar-cpg-lib.c
> @@ -59,7 +59,9 @@ void cpg_simple_notifier_register(struct raw_notifier_head *notifiers,
>                                   struct cpg_simple_notifier *csn)
>  {
>         csn->nb.notifier_call = cpg_simple_notifier_call;
> -       raw_notifier_chain_register(notifiers, &csn->nb);
> +
> +       if (raw_notifier_chain_register(notifiers, &csn->nb))
> +               pr_warn("CPG notifier already registered\n");

A duplicate registration cannot happen, as the notifier is freshly allocated.

>  }
>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
