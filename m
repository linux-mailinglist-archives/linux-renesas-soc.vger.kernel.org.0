Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85E4429FF0A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Oct 2020 08:48:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725823AbgJ3HsN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 30 Oct 2020 03:48:13 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:35572 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725784AbgJ3HsN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Oct 2020 03:48:13 -0400
Received: by mail-oi1-f193.google.com with SMTP id w191so5856835oif.2;
        Fri, 30 Oct 2020 00:48:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aUqZb88Q/0ufWYeJ+IWRUs61LFgtSnTkf63Dv6bu7V8=;
        b=lHCwP4GwwBnJ5+s5JZiF+dKCbpSaOJYzEjyh2FpIp7dwbs1fhyhkIJqokA+airao0/
         yLLeHMfBsXl7Qo7+/NMC/df/fWiUDvKDoCvjAAGKgSYYvn4m3ubYBdFRbTuz4qyU+rG4
         PTO9h1UvJ65EBQTTWApKS4WC85sOwf1fnXqsUrtCFZn+L2dXAhA1upk3mElLpRcnI23H
         l3V8o6SQ8lZdbcIb/M0SKXlWSmrkTmYAe6VNmogAQX7HwGdq19TutcRNgbKwhvf9tEUN
         hY7OrhbQpnt1Cn/3zn4FPEfMyQP/eT4Ryn0AUh4k+ZpcAhEF//6JXTk449mBPMT0Fryq
         oGuA==
X-Gm-Message-State: AOAM5304GdtbpRsL11muXoKM6UjQzOVu81gWn1kNUh2rScKBvufAesSQ
        o/AV8f3CMSqGkKWzc7oyKl8oFP9B9/fu4j7T601R3kdrk0O2VQ==
X-Google-Smtp-Source: ABdhPJyM4/0ApYw24j7hJhvVORFY3r9UAsjCRQf9AbmQ++DpOBDdsns9JiBEZ14reWsk+RiL97ai+YaxCmHoLPd7gYc=
X-Received: by 2002:aca:f203:: with SMTP id q3mr694400oih.148.1604043704014;
 Fri, 30 Oct 2020 00:41:44 -0700 (PDT)
MIME-Version: 1.0
References: <20201030002850.6495-1-linus.walleij@linaro.org>
In-Reply-To: <20201030002850.6495-1-linus.walleij@linaro.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 30 Oct 2020 08:41:32 +0100
Message-ID: <CAMuHMdUS_xZS8nvWiVG9BPit26kvgeYeB2tL3NbLZ6ru5ujD4A@mail.gmail.com>
Subject: Re: [PATCH] fbdev/sh_mobile: Drop unused include
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Oct 30, 2020 at 1:30 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> The driver includes <linux/gpio.h> but doesn't use any symbols
> from this file.
>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: linux-renesas-soc@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
on r8a77440/armadillo, where this is the last piece of non-DT support.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
