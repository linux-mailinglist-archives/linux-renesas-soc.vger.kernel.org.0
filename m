Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60688C9B8D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Oct 2019 12:05:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729785AbfJCKCQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Oct 2019 06:02:16 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:41560 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728207AbfJCKCP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Oct 2019 06:02:15 -0400
Received: by mail-vs1-f68.google.com with SMTP id l2so1271353vsr.8
        for <linux-renesas-soc@vger.kernel.org>; Thu, 03 Oct 2019 03:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L9j8LD9n1/rnTvXeM15o45g67BHvuZ5Bz7byS7S6kVc=;
        b=ZDwNgTSke7WQvmLJiRzveQ1bKNNP6yyU67i3nwD4J5JDwu+g7sfX2+Q2M9Q1eUSrAU
         bmJoF+j1vbH5mci4/tcG+b2ZIkCFUVJwEzc6jWSSmoZzLZezzLdzfwzs5RCNuMp9lBUk
         lV7ECYvYJGT4g3nILS711DFDgTCTKkl7yzyprXlgnwnSbKC1h8R7/bShr9pZZ81K3xpU
         +G5oQ7XJuTu0hcPbta6kdGA5PCZU27uFWtR88ol+XoUbYhN0RT9wXY2ZP29hBy6EyBDA
         VDXP/j92bz+JwyACQ0AffJE4cJFJKPSJyyty2bwZmLYo1K4t0gjzP+3sU2wpcDRZ2ffn
         bHZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L9j8LD9n1/rnTvXeM15o45g67BHvuZ5Bz7byS7S6kVc=;
        b=C876mcfI0YY8hTxiKkG4HV4zRU2mIrbF7CwVOZrN62surwyYxP0/cA3vmVyyB1G2/z
         Rlu0OHxryuMLl5DxdneOBe7ygzB6Mj5s3sACmfex0CwAKX4xkclqr9mtF9yAndLkyWIX
         4Q1ObFVhi4KlMcf5vDa869VjUprR5+PQ323foM/7VozZ2ZGXgqIn4LdC6t49Z+bEsB9N
         EV6USUtyX7HGhUek5ARO9uc288pgfEcycrVVvuk7br492hN8Z85aO07kawNbPOzXXcmp
         M4eMEJOXVpdBI1y24ROUI0w5DtIDhtC1ws2rgHwNoBQFKBzlSDc+wUhYxAKwL3m08AN2
         DAlg==
X-Gm-Message-State: APjAAAVbxPzvU98dgjD+CVNSVD/xJWZrjI4FWtzqday8iVfQL78n7U/n
        uF9UjbX8PgoT8fwMhxKpBe6nyUQZnSVbz3ijz7LchA==
X-Google-Smtp-Source: APXvYqyNh+gLwIl1W9laIqP5ANou/nZUVmjlfSUUmVTGXPR2HMKTPYOw64WXP1acl6Q+S9RTPodCbv1xTNRFLaL1RLc=
X-Received: by 2002:a67:eb84:: with SMTP id e4mr4474520vso.165.1570096933748;
 Thu, 03 Oct 2019 03:02:13 -0700 (PDT)
MIME-Version: 1.0
References: <20191001180834.1158-1-geert+renesas@glider.be>
In-Reply-To: <20191001180834.1158-1-geert+renesas@glider.be>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 3 Oct 2019 12:01:37 +0200
Message-ID: <CAPDyKFo3_QmWHSwmKAXsvfr8F=UviP+vSGOuDMoJppYjv1_aNA@mail.gmail.com>
Subject: Re: [PATCH] mmc: sh_mmcif: Use platform_get_irq_optional() for
 optional interrupt
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jiri Slaby <jslaby@suse.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 1 Oct 2019 at 20:08, Geert Uytterhoeven <geert+renesas@glider.be> wrote:
>
> As platform_get_irq() now prints an error when the interrupt does not
> exist, a scary warning may be printed for an optional interrupt:
>
>     sh_mmcif ee200000.mmc: IRQ index 1 not found
>
> Fix this by calling platform_get_irq_optional() instead for the second
> interrupt, which is optional.
>
> Remove the now superfluous error printing for the first interrupt, which
> is mandatory.
>
> Fixes: 7723f4c5ecdb8d83 ("driver core: platform: Add an error message to platform_get_irq*()")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
> This is a fix for v5.4-rc1.
> ---
>  drivers/mmc/host/sh_mmcif.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mmc/host/sh_mmcif.c b/drivers/mmc/host/sh_mmcif.c
> index 81bd9afb0980525e..98c575de43c755ed 100644
> --- a/drivers/mmc/host/sh_mmcif.c
> +++ b/drivers/mmc/host/sh_mmcif.c
> @@ -1393,11 +1393,9 @@ static int sh_mmcif_probe(struct platform_device *pdev)
>         const char *name;
>
>         irq[0] = platform_get_irq(pdev, 0);
> -       irq[1] = platform_get_irq(pdev, 1);
> -       if (irq[0] < 0) {
> -               dev_err(dev, "Get irq error\n");
> +       irq[1] = platform_get_irq_optional(pdev, 1);
> +       if (irq[0] < 0)
>                 return -ENXIO;
> -       }
>
>         res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>         reg = devm_ioremap_resource(dev, res);
> --
> 2.17.1
>
