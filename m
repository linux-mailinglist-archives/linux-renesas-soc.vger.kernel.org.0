Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 991C4275412
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Sep 2020 11:10:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726419AbgIWJK3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Sep 2020 05:10:29 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:39738 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726338AbgIWJK3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Sep 2020 05:10:29 -0400
Received: by mail-oi1-f195.google.com with SMTP id c13so24291435oiy.6;
        Wed, 23 Sep 2020 02:10:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0mYSC4kkHIJP+4bMDumjNsLF1GD/gg4zgKaMqe/GqZg=;
        b=QGlFwqe8/vAFJIohpiljuNN3u2ZftbFBvOn8+JlrLWvVxLYucmgwPrYW6p/RKZ4Fnn
         nVbT27M3z89pxagAEdNViAoKMNhYkilwEcOLC3qXWVAU4NjGo1u/T+vnEjs7QnF1foPe
         0EHnnjDDlkRVBQLYOCdNxt2u28YtUKq2N6gdbvMQPYq/4/L4PuF5nC9cnEsMF2br11zQ
         zrgWC67bBSh34Yftqde1kW8wFNyFBpIILndjay/2zVFbeP8xtxdK/MHt66pPT2c/sILT
         fu2eXbRs53xNEo6KAM51dkghGhJtjAVuAagUbA8XleDIG+4rJq+PkYe7nSFHl3QY9tGh
         0ZTQ==
X-Gm-Message-State: AOAM531nuVjNw+q4rnEAbdL66ho4cpf1dUM1bmDKCPv0dl3Ao3KAWrEr
        1MqJ1F05NSG00/CD00uY/rCcQi0A8zxHWUDC/jU=
X-Google-Smtp-Source: ABdhPJwWLwQa9iQWpN4ecqK4IS6c4WBCcTWe3lGPFVtXaRNM9+D+WBiPIKq7kgzN8xVVDKRd8cBcetEenEqxJzwo08o=
X-Received: by 2002:aca:52d6:: with SMTP id g205mr5131935oib.54.1600852228744;
 Wed, 23 Sep 2020 02:10:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200923084458.GD1454948@mwanda>
In-Reply-To: <20200923084458.GD1454948@mwanda>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 23 Sep 2020 11:10:17 +0200
Message-ID: <CAMuHMdXyM1dUPJ7ZDAk6-cEjaG_bVBfsE=bqdpf7pA0ChdRLVw@mail.gmail.com>
Subject: Re: [PATCH] soc: renesas: rmobile-sysc: Fix some leaks in rmobile_init_pm_domains()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Dan,

On Wed, Sep 23, 2020 at 10:47 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> This code needs to call iounmap() on the error paths.

Thanks for your patch!

> Fixes: 2ed29e15e4b2 ("ARM: shmobile: R-Mobile: Move pm-rmobile to drivers/soc/renesas/")

This is not the commit that introduced the issue.

Fixes: 2173fc7cb681c38b ("ARM: shmobile: R-Mobile: Add DT support for
PM domains")

> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

> --- a/drivers/soc/renesas/rmobile-sysc.c
> +++ b/drivers/soc/renesas/rmobile-sysc.c
> @@ -328,6 +328,7 @@ static int __init rmobile_init_pm_domains(void)
>                 pmd = of_get_child_by_name(np, "pm-domains");
>                 if (!pmd) {
>                         pr_warn("%pOF lacks pm-domains node\n", np);
> +                       iounmap(base);

This one I can agree with, although that case is a bug in the DTS.

>                         continue;
>                 }
>
> @@ -341,6 +342,7 @@ static int __init rmobile_init_pm_domains(void)
>                 of_node_put(pmd);
>                 if (ret) {
>                         of_node_put(np);
> +                       iounmap(base);

This one I cannot: in the (unlikely, only if OOM) case
rmobile_add_pm_domains() returns an error, one or more PM subdomains may
have been registered already.  Hence if you call iounmap() here, the
code will try to access unmapped registers later, leading to a crash.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
