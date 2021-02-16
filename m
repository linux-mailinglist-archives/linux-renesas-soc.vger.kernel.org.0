Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFD5C31D030
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Feb 2021 19:28:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229572AbhBPS1R (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Feb 2021 13:27:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230186AbhBPS1Q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Feb 2021 13:27:16 -0500
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4586C06174A
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Feb 2021 10:26:35 -0800 (PST)
Received: by mail-yb1-xb2f.google.com with SMTP id k4so11372646ybp.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Feb 2021 10:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=86ZOTfo2pRLUjt+3X3QjxmKkX8aHJubkBHJvWhxkHZg=;
        b=jplIDjDGKUUBlrkHKo/8ABuCOHTog1UcXNNzGLP/87K7e4DMHib05919ZF/TTX7W56
         gksGp+fBfgYV+wRWsJOiz49XBqYw8badhUpVwJ18+IpoBwL952ghsJbcFLQYK0zlvAeK
         u3wGJRA7XC5wM2qVL8egr/TZLGgN6BtChopZGxZc1Z57bW9Ad6lrhz2LnzZA7UWAD5aS
         6bZkf4sTUJl2Kbb9BMeje1rvCS/pmNGoH4CLObA70++6wh8WaxlN/NasICuqSF4sXCub
         zVHKmj68JZUnwKt/ikuoKYdLAxiw+/lw/FPhzU4LARv6YIviQbZlAQWDjbNsQb2Wbx9Q
         NzJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=86ZOTfo2pRLUjt+3X3QjxmKkX8aHJubkBHJvWhxkHZg=;
        b=D5u3Ld/l92w+eE4J7X9OvDqkqtbgbfXlEvbny1tOWe6KxdFiRF5q46cPerCX6BgUOb
         NdqV2u8/GKKtCq9NkfK5xxaYGqPGUtJtNz/EZ5Dl5O8NiubTI8+Epj8f9Bg7nQ7R0bSi
         lMzOJ8OEwiB9iT3eBYVMaLGUv75/P+InDK84pPANCuKzHZLbXYwt2LpkFXUC1XplvEVm
         zbskvJb/HHr1Aetcae2guQPHEPdzzH52rC/3xTwOZsPOrU1fE/5PxSlnmyNzWeqY52fv
         QhFTqHtaA02c4krEqtg6dzP6+4bL0AK7DTzR2uyXI+0BR+jxdouB2rlV0QW9qTUXpS26
         Wi0Q==
X-Gm-Message-State: AOAM5301mGTaD6b0ZIe8pfUryUAhVMfhvCuAjSGPYZTHuBJhjcP5Hs9J
        TyWBIMltUQrC0YSmbQbG8+1xpoY99PEmh7AhVEzCnw==
X-Google-Smtp-Source: ABdhPJyZspXVqzarSXof+RAxF+6vufj39CfyT7WwHzYfMgr/xSoC2BqtLkJKBPt11/r+1as7k8cT/4rUscOBlCdaR9M=
X-Received: by 2002:a25:b74c:: with SMTP id e12mr34402113ybm.20.1613499994962;
 Tue, 16 Feb 2021 10:26:34 -0800 (PST)
MIME-Version: 1.0
References: <20210216123958.3180014-1-geert+renesas@glider.be>
In-Reply-To: <20210216123958.3180014-1-geert+renesas@glider.be>
From:   Saravana Kannan <saravanak@google.com>
Date:   Tue, 16 Feb 2021 10:25:59 -0800
Message-ID: <CAGETcx_YeiNAMkSxtbTSZcsQugxK4=CwhR6UfbSLLHzQ2EfguA@mail.gmail.com>
Subject: Re: [PATCH v2] soc: renesas: rmobile-sysc: Mark fwnode when PM domain
 is added
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Sebastian Reichel <sre@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Feb 16, 2021 at 4:40 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Currently, there are two drivers binding to the R-Mobile System
> Controller (SYSC):
>   - The rmobile-sysc driver registers PM domains from a core_initcall(),
>     and does not use a platform driver,
>   - The optional rmobile-reset driver registers a reset handler, and
>     does use a platform driver.
>
> As fw_devlink only considers devices, commit bab2d712eeaf9d60 ("PM:
> domains: Mark fwnodes when their powerdomain is added/removed") works
> only for PM Domain drivers where the DT node is a real device node, and
> not for PM Domain drivers using a hierarchical representation inside a
> subnode.  Hence if fw_devlink is enabled, probing of on-chip devices
> that are part of the SYSC PM domain is deferred until the optional
> rmobile-reset driver has been bound.   If the rmobile-reset driver is
> not available, this will never happen, and thus lead to complete system
> boot failures.
>
> Fix this by explicitly marking the fwnode initialized.
>
> Suggested-by: Saravana Kannan <saravanak@google.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> This is v2 of "soc: renesas: rmobile-sysc: Set OF_POPULATED and absorb
> reset handling".
> To be queued in renesas-devel as a fix for v5.12 if v5.12-rc1 will have
> fw_devlink enabled.
>
> v2:
>   - Call fwnode_dev_initialized() instead of setting OF_POPULATED,
>   - Drop reset handling move, as fwnode_dev_initialized() does not
>     prevent the rmobile-reset driver from binding against the same
>     device.
> ---
>  drivers/soc/renesas/rmobile-sysc.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/soc/renesas/rmobile-sysc.c b/drivers/soc/renesas/rmobile-sysc.c
> index bf64d052f9245db5..204e6135180b919c 100644
> --- a/drivers/soc/renesas/rmobile-sysc.c
> +++ b/drivers/soc/renesas/rmobile-sysc.c
> @@ -342,6 +342,8 @@ static int __init rmobile_init_pm_domains(void)
>                         of_node_put(np);
>                         break;
>                 }
> +
> +               fwnode_dev_initialized(&np->fwnode, true);
>         }
>
>         put_special_pds();

Acked-by: Saravana Kannan <saravanak@google.com>

Keep in mind that this might have to land in driver-core-next since
that API is currently only in driver-core-next.

-Saravana
