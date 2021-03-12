Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6CB2338E4C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Mar 2021 14:07:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229995AbhCLNHV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Mar 2021 08:07:21 -0500
Received: from mail-vk1-f171.google.com ([209.85.221.171]:39608 "EHLO
        mail-vk1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230389AbhCLNHS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Mar 2021 08:07:18 -0500
Received: by mail-vk1-f171.google.com with SMTP id 11so1228276vkx.6;
        Fri, 12 Mar 2021 05:07:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gNBow7Uhd+IhwEG41bBIve3XPAEIKGyofkhSFHhyVgI=;
        b=UmN5iY4rO+9XdumWXXp/j3oQ5rzYqwIExGM8yaEpYJTl/X3cmLwpnrKDP7Y3kGpT1t
         rkIbvrgf3G9KEoOQLpYF1lo2hYXYKTlFXeS5vecvXU5GdzHMnk+rdSZYHSQFuKijl1Ay
         6CQ/VvJbP1Mm0dc8r8BbLgJJpHrs8Gf+AtmGYgg91RmHKlR8pOGRn34/fjoJPbUwqTTX
         QFFLctdZ1gNzqz8ZHlHlXex5JHQliLiIefR+6ZOR9uKDj1qLk0DMq6jBg8hKhbSNeC9f
         OylAIJxUEnfR+eo5BQrgJrXd2jDCAeLNPj+sJbKV/zbo6MNU2xQ0NZWKzCYEfxyZHr9V
         hI5w==
X-Gm-Message-State: AOAM533cWYtWgwIOzUuNlXjpCS92U+xohFKpnN5gifiySYVOyE28mVcZ
        Y/4kA1PojaJfrwA64oNSK7Vlc8VOJZAM0Byt6PY3yUXu
X-Google-Smtp-Source: ABdhPJzFuwLORff0VLBfXmhEQ35kcGlyIlIrl3V63gkfh26IgDh6eKnqZXkXAxA9II/egxbPJYTV8XIGatOpDpgNHh8=
X-Received: by 2002:a1f:2502:: with SMTP id l2mr7783352vkl.5.1615554437317;
 Fri, 12 Mar 2021 05:07:17 -0800 (PST)
MIME-Version: 1.0
References: <20210312130242.3390038-1-geert+renesas@glider.be>
In-Reply-To: <20210312130242.3390038-1-geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 12 Mar 2021 14:07:06 +0100
Message-ID: <CAMuHMdWNQHANaN=KU4R_dXM6dx0FoWmamuOamx=wazf-TFaMCw@mail.gmail.com>
Subject: Re: [PATCH 0/3] regulator: bd9571mwv: Miscellaneous fixes and improvements
To:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Marek, Liam, Mark,

On Fri, Mar 12, 2021 at 2:02 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> *** BLURB HERE ***

Woops, that was a bit too early, sorry for that.
But there was not much to say anyway, just a few miscellaneous fixes
and improvements.

Thanks for your comments!

> Geert Uytterhoeven (3):
>   regulator: bd9571mwv: Fix AVS and DVFS voltage range
>   regulator: bd9571mwv: Fix regulator name printed on registration
>     failure
>   regulator: bd9571mwv: Convert device attribute to sysfs_emit()
>
>  drivers/regulator/bd9571mwv-regulator.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
