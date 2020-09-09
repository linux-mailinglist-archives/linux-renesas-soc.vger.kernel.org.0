Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4445E2630D9
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Sep 2020 17:46:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730502AbgIIPqe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Sep 2020 11:46:34 -0400
Received: from mail-yb1-f193.google.com ([209.85.219.193]:44457 "EHLO
        mail-yb1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730336AbgIIPqS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Sep 2020 11:46:18 -0400
Received: by mail-yb1-f193.google.com with SMTP id h206so2046510ybc.11
        for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Sep 2020 08:46:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xD6xS97WU89t1ZacS4KrzPmlARKO2FBLfD8KB6IS9Ek=;
        b=Wt0z0C0nfeAsImBhoP77r8YAFmEjN3frMcbYIlajngYfslyztF5ANHJmN6fmpbkOMY
         +NGlteUnHK3C/Ly93vE+uYDj5EBDk+eH2M/+GTNuJjNY2UVLj1UNl6YhM31FK+//hzc4
         lebw/cGEIWp8TTLF/Kmo3hhXCruQYjb1ZfTjtKjNiX4GPqGWQ+V7QIppKFeW8cqOr4Hk
         C9gAYALLztmpph0S1ELFInE66cBAOmvbiOX6zPtP4Ogxf1hRKjzBA31HZKxdJxlvRW65
         cmYO/xBOoUKKUGI0vxMyWjqhxbOi3AxcvxXdNhAJUwxWFNWPOGbG1NnMEfXUX+OBG+99
         jxcg==
X-Gm-Message-State: AOAM531Tn3BdnZaXErJNh0PwHP9e8YVQGqI7bSIrmeOCLFzFR7o0I8T/
        7uwGY3Y3uD4iAHzPCAC4I/YuyrqFVOuN779PiAHSG5eukGc=
X-Google-Smtp-Source: ABdhPJwTvEdu3iU8Bhac5y6aIWVaDHWGY/RJwN6Rhbpwew7vHzGCNb8zQ46PviXlL79ZuzvzBTRlXogBVGhNThgDXhQ=
X-Received: by 2002:a9d:1b62:: with SMTP id l89mr735532otl.145.1599659094684;
 Wed, 09 Sep 2020 06:44:54 -0700 (PDT)
MIME-Version: 1.0
References: <87d02yv55g.wl-kuninori.morimoto.gx@renesas.com> <87a6y2v54o.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87a6y2v54o.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 9 Sep 2020 15:44:43 +0200
Message-ID: <CAMuHMdXjRssM3eO+1WXZ02=7YDT8EOQW78my3KjeqMkF9v8VHQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] soc: renesas: sort driver description title
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

On Mon, Sep 7, 2020 at 1:51 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> This patch sorts each driver by description title alphabetical order.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  drivers/soc/renesas/Kconfig | 213 ++++++++++++++++++------------------
>  1 file changed, 106 insertions(+), 107 deletions(-)
>
> diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
> index 04d3b2ab1e22..518ae9378a32 100644
> --- a/drivers/soc/renesas/Kconfig
> +++ b/drivers/soc/renesas/Kconfig
> @@ -69,19 +69,17 @@ config ARCH_R7S9210
>         select RENESAS_OSTM
>         select RENESAS_RZA1_IRQC
>
> -config ARCH_R8A73A4
> -       bool "ARM32 Platform support for R-Mobile APE6"
> -       select ARCH_RMOBILE
> -       select ARM_ERRATA_798181 if SMP
> +config ARCH_R8A77470
> +       bool "ARM32 Platform support for RZ/G1C"

According to my copy of "sort", "RZ" comes after "R-Car"...

> @@ -194,19 +208,19 @@ config ARCH_R8A774B1
>         help
>           This enables support for the Renesas RZ/G2N SoC.
>
> -config ARCH_R8A774C0
> -       bool "ARM64 Platform support for RZ/G2E"
> +config ARCH_R8A77990
> +       bool "ARM64 Platform support for R-Car E3"
>         select ARCH_RCAR_GEN3
> -       select SYSC_R8A774C0
> +       select SYSC_R8A77990
>         help
> -         This enables support for the Renesas RZ/G2E SoC.
> +         This enables support for the Renesas R-Car E3 SoC.
>
> -config ARCH_R8A774E1
> -       bool "ARM64 Platform support for RZ/G2H"
> +config ARCH_R8A77995
> +       bool "ARM64 Platform support for R-Car D3"

and "D3" comes before "E3".

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.10, with the above fixed.

No need to resend, I have to merge this with the V3U work anyway ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
