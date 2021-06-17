Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 394163AB51E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Jun 2021 15:46:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232490AbhFQNsL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Jun 2021 09:48:11 -0400
Received: from mail-vs1-f48.google.com ([209.85.217.48]:44839 "EHLO
        mail-vs1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231510AbhFQNsL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Jun 2021 09:48:11 -0400
Received: by mail-vs1-f48.google.com with SMTP id x13so3012413vsf.11;
        Thu, 17 Jun 2021 06:46:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d84Gq/yVf/MqrPW3CvNRxxLF/yfxRWhECTrNMNwlkFg=;
        b=QwRtOUR8bTv41rKi3MC9yvoKb8sEBnkyThLVtou1//AiSLxPMHhneRRHnknHGcleBQ
         om8tNx61pPZYMG6xHNxSVbfqC4o0+2lK2UPcBJCww7evQD5TCteC4zSiLbR/rOkAaM3G
         wJ0Pp+1DbeyMiJfPClZdEUsd4fms/s3isdW8aDikiWEbjuyZ1ZACnKLHJftsvKXq9ti/
         FMnHkyA6VIAhMN6lyQ5S/ZLqt0giz/dCpD+TBBD4BX1YSQO1hTFYyiuRIwTp3dUvEGKv
         ZAQPbgjZUN+JrsJUIg4ck69Jb19UYbmfFF+RnGxRAFGJT1BN3xKXgzWivcfycJN+LeR5
         YQ5w==
X-Gm-Message-State: AOAM532OSmcgWd9K/HzykZm5RV/SGT4LgUT2Ad+qGLUgCvXtCyiFaEap
        +Ptdhdw0nzb1LeG41EElvAyfs/LAzrZi7mJyVok=
X-Google-Smtp-Source: ABdhPJyT4ut7DJ4qi05g9Fadh67VNF0phrojXnPxHLsQp3dJV7apiyseHhPdUDmO+5wYsON0wXfI5iVmIvOPx0rfUGM=
X-Received: by 2002:a05:6102:2011:: with SMTP id p17mr4690894vsr.40.1623937561805;
 Thu, 17 Jun 2021 06:46:01 -0700 (PDT)
MIME-Version: 1.0
References: <YMtQN++uwH41TAg0@mwanda>
In-Reply-To: <YMtQN++uwH41TAg0@mwanda>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 17 Jun 2021 15:45:50 +0200
Message-ID: <CAMuHMdUfMSPa2Oh1s+V=QR+XLv2tVYoJt2sjwdNZeobE76AZwg@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: fix a double free on error
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Dan,

On Thu, Jun 17, 2021 at 3:38 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> The "clock" pointer is allocated with devm_kzalloc() so freeing it
> here will lead to a double free.
>
> Fixes: ef3c613ccd68 ("clk: renesas: Add CPG core wrapper for RZ/G2L SoC")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks for your patch!

While the double free is unlikely to happen (the error is not
propagated upstream, and the driver cannot be unloaded), kernel
test robot reported two of these errors.  The other one is at line 202.
Care to fix that as well?

> --- a/drivers/clk/renesas/renesas-rzg2l-cpg.c
> +++ b/drivers/clk/renesas/renesas-rzg2l-cpg.c
> @@ -473,7 +473,6 @@ rzg2l_cpg_register_mod_clk(const struct rzg2l_mod_clk *mod,
>  fail:
>         dev_err(dev, "Failed to register %s clock %s: %ld\n", "module",
>                 mod->name, PTR_ERR(clk));
> -       kfree(clock);
>  }

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
