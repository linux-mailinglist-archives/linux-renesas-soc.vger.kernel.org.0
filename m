Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 901A23AE685
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Jun 2021 11:53:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229651AbhFUJ4F (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Jun 2021 05:56:05 -0400
Received: from mail-vs1-f46.google.com ([209.85.217.46]:39792 "EHLO
        mail-vs1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbhFUJ4F (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jun 2021 05:56:05 -0400
Received: by mail-vs1-f46.google.com with SMTP id 68so8861242vsu.6;
        Mon, 21 Jun 2021 02:53:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZHe4xFzIALrnvxtDmdmFfUh3g5qjG4EKWk4AHi+XtSQ=;
        b=FmVj1UtD5B+VDtQOuhXcpph3e5f9z1WWsRvVJReKM+eYRaWdHSF0LI/JUi/jghrjlZ
         zB9xc6YbcnTToSNjfGvoV5fq19zXnOV5zgG0yc9aKbBOwwAnN8UctInaQwfJROjeLyw/
         Pf21rQdUK34zIJId2Fxko7S6U2B3i8WvQR359ZpObjJTjCw5OYbKFweVTbNXOE+tu/Vb
         DMJ9vBBX9sG+t2HyurGWsdAMu4FR9gxwpJDkgUiuep0kwF+JNKkUXJqVDoyRxDz1DO6a
         +sMsz7+c3L7IaATSXolylWHnUVrbYA11Bom7V7yS9NG0N/rJhbzqxdI4r8sCWwZ8718U
         9SbQ==
X-Gm-Message-State: AOAM532hhvhTqnWGB52aU+NeCUv0AgtWindmIZWreLH6XgA8wDw5n0wX
        V8n99HfSiSZw6IoG/RyQv4K2xhLvnQD415SXiJ5/ZllulXZhqQ==
X-Google-Smtp-Source: ABdhPJy5YeJE8tz2Meqq0ycYVi26/vQ6cU7Hz98hg9Suf8cYN6eiTx7tDOEOrTGoeFdUlofKQ35ccA+BiR++SvZuPE0=
X-Received: by 2002:a67:3c2:: with SMTP id 185mr16101583vsd.42.1624269229840;
 Mon, 21 Jun 2021 02:53:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210621070009.13655-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210621070009.13655-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 21 Jun 2021 11:53:38 +0200
Message-ID: <CAMuHMdULBPfd97xqDaFOTmj-B2pBA=wSKz3iep6ujx47j1zyPg@mail.gmail.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: sys_dmac: abort DMA synced to avoid timeouts
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Mon, Jun 21, 2021 at 9:00 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> When aborting DMA, we terminate the transfer without waiting for it to
> succeed. This may lead to races which can e.g. lead to timeout problems
> when tuning. Remove the deprecated dmaengine_terminate_all() function
> and use the explicit dmaengine_terminate_sync().
>
> Fixes: e3de2be7368d ("mmc: tmio_mmc: fix card eject during IO with DMA")
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> Geert, this fixes the issue you have seen on your Koelsch board on my
> Lager board. Can you test again with this patch please?

Unfortunately it does not fix the issue with my SanDisk Extreme 32GB
A1 microSD card in the microSD adapter that came with the card
(Conrad 1553726):

[  201.590669] sh_mobile_sdhi ee100000.mmc: timeout waiting for
hardware interrupt (CMD19)
[  206.710441] sh_mobile_sdhi ee100000.mmc: timeout waiting for
hardware interrupt (CMD19)
[  211.830215] sh_mobile_sdhi ee100000.mmc: timeout waiting for
hardware interrupt (CMD19)
[  216.949986] sh_mobile_sdhi ee100000.mmc: timeout waiting for
hardware interrupt (CMD19)
[  222.069747] sh_mobile_sdhi ee100000.mmc: timeout waiting for
hardware interrupt (CMD19)
[  227.189509] sh_mobile_sdhi ee100000.mmc: timeout waiting for
hardware interrupt (CMD19)

(switching slot)

[  227.230383] mmc0: tuning execution failed: -5
[  227.234812] mmc0: error -5 whilst initialising SD card
[  238.628970] sh_mobile_sdhi ee140000.mmc: timeout waiting for
hardware interrupt (CMD52)
[  243.748755] sh_mobile_sdhi ee140000.mmc: timeout waiting for
hardware interrupt (CMD52)
[  248.868475] sh_mobile_sdhi ee140000.mmc: timeout waiting for
hardware interrupt (CMD0)
[  253.988234] sh_mobile_sdhi ee140000.mmc: timeout waiting for
hardware interrupt (CMD8)
[  259.107995] sh_mobile_sdhi ee140000.mmc: timeout waiting for
hardware interrupt (CMD5)
[  264.227746] sh_mobile_sdhi ee140000.mmc: timeout waiting for
hardware interrupt (CMD5)
[  269.347563] sh_mobile_sdhi ee140000.mmc: timeout waiting for
hardware interrupt (CMD5)
[  274.468165] sh_mobile_sdhi ee140000.mmc: timeout waiting for
hardware interrupt (CMD5)
[  278.558584] sh_mobile_sdhi ee160000.mmc: timeout waiting for
hardware interrupt (CMD52)
[  279.588686] sh_mobile_sdhi ee140000.mmc: timeout waiting for
hardware interrupt (CMD55)
[  283.679075] sh_mobile_sdhi ee160000.mmc: timeout waiting for
hardware interrupt (CMD52)
[  284.709164] sh_mobile_sdhi ee140000.mmc: timeout waiting for
hardware interrupt (CMD55)
[  288.789522] sh_mobile_sdhi ee160000.mmc: timeout waiting for
hardware interrupt (CMD0)
[  289.829596] sh_mobile_sdhi ee140000.mmc: timeout waiting for
hardware interrupt (CMD55)
[  293.909915] sh_mobile_sdhi ee160000.mmc: timeout waiting for
hardware interrupt (CMD8)
[  294.949984] sh_mobile_sdhi ee140000.mmc: timeout waiting for
hardware interrupt (CMD55)

The same card works before/after on Salvator-XS with R-Car H3ES2.0.

Tree is renesas-devel-2021-06-21-v5.13-rc7 without/with your patch.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
