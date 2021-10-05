Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C559E422C7D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Oct 2021 17:28:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234658AbhJEPa1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Oct 2021 11:30:27 -0400
Received: from mail-ua1-f41.google.com ([209.85.222.41]:45650 "EHLO
        mail-ua1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232866AbhJEPa1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Oct 2021 11:30:27 -0400
Received: by mail-ua1-f41.google.com with SMTP id 64so15147912uab.12;
        Tue, 05 Oct 2021 08:28:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FGxM0m6YGDsMlNbNdB6JoL6JeLNFkPlp2uYBIY2Dz8o=;
        b=35mspoO6Scpb5uQYZamxSjZZHZCBwhcg8k7hxBfc+Ngb8sFPZfDS52YLsk8i6Eofef
         kaviXy7E27RyTMSknC7HabhqyjwyFU5bayqPINsdHZsKb3va7+1o2n0imY9XLJ8zjo5o
         E4F6ch+I3tWBGY8Yc/7FPvPPKIpKltGBK7c5YCYLyuD7mNi2ou8H2gUUOIKbe6udOFBK
         VN9PTJDFAHA6NhmVMenny94QUNC4Xim5832JBdfCAr8egOdjJ28U6zErzYSZ32ZRgh6m
         DW7bkdxoxXOuzq0wSCM4Q6+dSDjNOAn4XkfXDHOqSi0qi8oXJ3TVQkPQJlp/sNUDWtTQ
         fXBQ==
X-Gm-Message-State: AOAM531d2R+B/8GbIh1HCu6CbacLom0x5tHfubOfrKBkbGRh7Ff9OFVd
        dY+wL68M47R/9uhr8794gqQIGj/wxWlH1bhoVuQ=
X-Google-Smtp-Source: ABdhPJwDFzQof3AJh8v2ske2pk5SFmjA4JGdgIX0iKUEF6Iewfyo1boBKExuu7fd03WYdasfyBDV2ZhNoirxJl0DQSY=
X-Received: by 2002:ab0:538a:: with SMTP id k10mr13154381uaa.14.1633447716455;
 Tue, 05 Oct 2021 08:28:36 -0700 (PDT)
MIME-Version: 1.0
References: <d4383bd1a97c0490c0bdc9dae5695f4230d4a420.1633447185.git.geert+renesas@glider.be>
In-Reply-To: <d4383bd1a97c0490c0bdc9dae5695f4230d4a420.1633447185.git.geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 5 Oct 2021 17:28:25 +0200
Message-ID: <CAMuHMdUk15wKCDb_N7Nqg=5G35Y+r7U5aymL4R2UoLXeM__ZGw@mail.gmail.com>
Subject: Re: [PATCH] memory: RENESAS_RPCIF should select RESET_CONTROLLER
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Sergey Shtylyov <s.shtylyov@omp.ru>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Oct 5, 2021 at 5:23 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> The Renesas RPC-IF driver calls devm_reset_control_get_exclusive(),
> which returns -ENOTSUPP if CONFIG_RESET_CONTROLLER is not enabled.
> Even if this error is ignored, later calls to reset_control_reset() will
> fail with a scary WARN_ON() backtrace.

Oops, the latter is not true.
reset_control_reset() returns 0 if CONFIG_RESET_CONTROLLER=n.

>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/memory/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/memory/Kconfig b/drivers/memory/Kconfig
> index 72c0df129d5c5065..547f956f6c29e9bd 100644
> --- a/drivers/memory/Kconfig
> +++ b/drivers/memory/Kconfig
> @@ -210,6 +210,7 @@ config RENESAS_RPCIF
>         tristate "Renesas RPC-IF driver"
>         depends on ARCH_RENESAS || COMPILE_TEST
>         select REGMAP_MMIO
> +       select RESET_CONTROLLER
>         help
>           This supports Renesas R-Car Gen3 or RZ/G2 RPC-IF which provides
>           either SPI host or HyperFlash. You'll have to select individual
> --
> 2.25.1
>


-- 
Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
