Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73E542CEB42
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Dec 2020 10:45:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387707AbgLDJom (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Dec 2020 04:44:42 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:35634 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387558AbgLDJom (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Dec 2020 04:44:42 -0500
Received: by mail-oi1-f194.google.com with SMTP id t9so5534879oic.2;
        Fri, 04 Dec 2020 01:44:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=teJBkIOdcEyHQREoug8GtgL+HlHmdfdZG73N4EBOAuw=;
        b=uaMAU9szN5MupmNGuOjN0XvlLjlx1rwswu/IMiIiW4CWLRdp2oJbxHnb+5+zrLXO08
         OqB84bDrysQR5uYC7mL/KBn0tUtN+VYfkH+R8RJHkiLdq8+VAMqfgRLdyxcNjXrEwxQF
         MJqv47tvI00WkJjsZ/4mpuIPRoBIYjERY8KleUPGz6XWHo7a1gOHdUlmlKXO2Lv+I0vw
         ZvRbBrOl5OqlkHQ9xHCmUy5nJDGZFvB8eDP5X50zWpRGKAgoW3GO+XjS+H7DU+jQ0MIy
         55W6ucvz/LgX62Hx3zf87fR0I75QRaBawAZ2GIxH6HqsXyCqateAS6i7SzriJJpqA0oL
         DPOg==
X-Gm-Message-State: AOAM530hYGVweSnHvzAlG7p1OWp/pSn6T80ISAZcCGNZo5PKkbDkZych
        wPSauecSTz3GnQpwfT89LiVjPMvTTBumRQY4rYA=
X-Google-Smtp-Source: ABdhPJzALZqx5c2/Y7FZLK+7tDRjLX0yzFC7Zhfa+CuKjbZ3PDK4yEEUZ+ml5aSiB2o2Y7i8njdtw6KNOXXDrLnW0LE=
X-Received: by 2002:aca:5c08:: with SMTP id q8mr862703oib.54.1607075035352;
 Fri, 04 Dec 2020 01:43:55 -0800 (PST)
MIME-Version: 1.0
References: <20201203121916.2870975-1-geert+renesas@glider.be>
 <20201203121916.2870975-3-geert+renesas@glider.be> <n5sr2s9o-3n53-91q0-noo6-o576n6o36253@syhkavp.arg>
In-Reply-To: <n5sr2s9o-3n53-91q0-noo6-o576n6o36253@syhkavp.arg>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 4 Dec 2020 10:43:44 +0100
Message-ID: <CAMuHMdW8pASio9=1KMg1Z_MP4LkzM0fM3Fr4Ox0spe52brm2Pg@mail.gmail.com>
Subject: Re: [PATCH v10 2/3] ARM: uncompress: Add OF_DT_MAGIC macro
To:     Nicolas Pitre <nico@fluxnic.net>
Cc:     Russell King <linux@armlinux.org.uk>,
        Ard Biesheuvel <ardb@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Eric Miao <eric.miao@nvidia.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Lukasz Stelmach <l.stelmach@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 3, 2020 at 5:27 PM Nicolas Pitre <nico@fluxnic.net> wrote:
> On Thu, 3 Dec 2020, Geert Uytterhoeven wrote:
> > The DTB magic marker is stored as a 32-bit big-endian value, and thus
> > depends on the CPU's endianness.  Add a macro to define this value in
> > native endianness, to reduce #ifdef clutter and (future) duplication.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Reviewed-by: Nicolas Pitre <nico@fluxnic.net>

Thanks, submitted to rmk's patch tracker.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
