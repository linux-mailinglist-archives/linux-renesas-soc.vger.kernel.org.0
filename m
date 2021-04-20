Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B36553652CF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Apr 2021 09:04:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230094AbhDTHFP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 20 Apr 2021 03:05:15 -0400
Received: from mail-vs1-f42.google.com ([209.85.217.42]:35610 "EHLO
        mail-vs1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230018AbhDTHFO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Apr 2021 03:05:14 -0400
Received: by mail-vs1-f42.google.com with SMTP id g20so18880948vst.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Apr 2021 00:04:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7HYgMozY5TPpisalV4DDLOPSuABu8EfxNwjbK5kSqRc=;
        b=eV5X2zCbkodc38iEtP5mG051GcBQH79tIWk7jHx9+BF9xMkOB/ZrP3lGgoMykmH9Qr
         m/CJbwvzwgHfm6A7SNlt7D7PLzyKP2QeLlu/knhYM3VqReoY9VX/Ln0IsvPX25YXIR9j
         EuwKgN8zvrFTqsf8SVVRxwzkLDLgrzQZb1PuOzzN+VwFiLO3i4vFy5u9EwUkWaPct+29
         +5FZLJpFs0yyBopijy4aErvlPRmuEv7ppUexjWibUYWde4LtGmvK0hGJZr1lnTQzn6sr
         4KSDUm8wUcazK32z0em2WLBNf32k7r43H3wLYqMd9j/a3e5bdvlb2Kb65vQP4Y19RzUe
         +hNQ==
X-Gm-Message-State: AOAM531oy2Tj0I5Lnv5wBHDxvvJV6X2na+gzZLReOAkRy3BDjYfTDjP0
        1z2Q6XVJWLsaX3g+DR5KrcJ8gtfD6JDmYs88jJ6hrIi/
X-Google-Smtp-Source: ABdhPJwvrvsapHDY2VYpt1OdAAbROuJtoTsgPMXdx28DEVj2oigojUlDCxsxVKCaT0G/wHMPbnUKKo6DQMLyZbnVojA=
X-Received: by 2002:a67:7c8c:: with SMTP id x134mr18029916vsc.40.1618902282002;
 Tue, 20 Apr 2021 00:04:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210419143858.39401-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210419143858.39401-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 20 Apr 2021 09:04:30 +0200
Message-ID: <CAMuHMdXd25JBitCXQaxXvtpT2GUm02BNk2y4s+wOOfNew2FEUA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: condor: switch eMMC bus to 1V8
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Apr 19, 2021 at 6:07 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> The eMMC card has two supplies, VCC and VCCQ. The VCC supplies the NAND
> array and the VCCQ supplies the bus. On Condor, the VCC is connected to
> 3.3V rail, while the VCCQ is connected to 1.8V rail. Adjust the pinmux
> to match the bus, which is always operating in 1.8V mode.
>
> While at it, deduplicate the pinmux entries, which are now the same for
> both default and UHS modes. We still need the two pinctrl entries to
> match the bindings though.
>
> Thanks to Marek Vasut for this commit description from 5f65328df3f5.

... from commit 5f65328df3f5cd25 ("arm64: dts: renesas: Switch eMMC
bus to 1V8 on Salvator-X and ULCB")

> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.14, with the above augmented.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
