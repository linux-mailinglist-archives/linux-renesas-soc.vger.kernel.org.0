Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B84B2DCD52
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Dec 2020 09:04:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726416AbgLQID7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Dec 2020 03:03:59 -0500
Received: from mail-ot1-f54.google.com ([209.85.210.54]:44998 "EHLO
        mail-ot1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726488AbgLQID7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Dec 2020 03:03:59 -0500
Received: by mail-ot1-f54.google.com with SMTP id f16so26411099otl.11
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Dec 2020 00:03:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NSD2wclYK59UiaUMg6aUSWKdSnGArdnajTQMeFkHmOQ=;
        b=jWdrMBAM5YPPUwhjnS3FUW96XVTayGkDOQS7H6oJMoS6jxiKeOaEFOEbExh8rEbPtp
         vMtr6c3Z5RtkiBMHujwb397n4NWhw6vQe9LkrFShQzt9TJuE1aAAaiRgvye/pceKxYkK
         vQ67uZWNvtK0mQiH53q1U8gWH6aFoGvxdOtyvzOtaeforUIkstTIs9eFaKuEyr8P6b4A
         +lyJlI6CXTq/ghcua5CSW23EwxAFyHmkE2vsqHfv/ANGq+BohX6dxSXOuhH6OuqHFk+e
         9ZCqzheBAjrLQWkk0vYEMR5Dphy5xdprlnYNLy37YD7XI0/P0OqQbFpQig9VnO/21rw+
         qIzA==
X-Gm-Message-State: AOAM533KVExw1roMpSpg3WZHw/XHTdKSdwtoyLO7phuPpuNPXxp3fWks
        UqZVZi4SRAu7QYJyly/b53jzPreOA47Kxh53nLM=
X-Google-Smtp-Source: ABdhPJyUmv8MBXZ3pYhMBC2xoc5NVrlM1tV/Ibx4/KOXseNwQqtQrFBEK6pFb7qhl/Qxa6ADgieRe+uz2JSOPIWTR90=
X-Received: by 2002:a9d:2203:: with SMTP id o3mr28594510ota.107.1608192198387;
 Thu, 17 Dec 2020 00:03:18 -0800 (PST)
MIME-Version: 1.0
References: <CAMuHMdWvB+p=2JqTsO7bR8uJqKqO5A2XgXFXsVAjHk3hcxgcTw@mail.gmail.com>
 <87v9d4gcqt.wl-kuninori.morimoto.gx@renesas.com> <CAMuHMdVMcjJempYDUA+AJiXWe=OgKAkGAyZDOS6R2Xp8_Xum2Q@mail.gmail.com>
 <87ft45gug9.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87ft45gug9.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 17 Dec 2020 09:03:07 +0100
Message-ID: <CAMuHMdUETVb2Dk4vmTu4T=QdnMkiBXJpfPKXuZuU2qs6_tBNjg@mail.gmail.com>
Subject: Re: [PATCH][RFC] ASoC: rsnd: don't call clk_disable_unprepare() if
 can't use
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mark Brown <broonie@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-ALSA <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

On Thu, Dec 17, 2020 at 1:20 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> > > Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> >
> > Feel free to use geert+renesas@glider.be instead ;-)
>
> OK, will do
>
> > The patch looks good to me, but I also cannot trigger the issue at will.
> > I went through my old boot logs, and found 2 other occurrences, also
> > on Ebisu.  In all cases, it happened while a lot of output was printed to
> > the serial console (either a WARN() splat, or DEBUG_PINCTRL output).
> > My guess is that console output or disabling interrupts too long is
> > triggering a race condition or other issue in the i2c driver (clk 1 is the
> > cs2000 clock generator, controlled through i2c).
>
> OK, Thanks, nice to know.
> It was rare case issue, difficult to find :)
>
> > >                 } else {
> > > -                       clk_disable_unprepare(clk);
> > > +                       if (adg->clk_rate[i])
> > > +                               clk_disable_unprepare(clk);
> >
> > As pointed out by Mark, you may want to clear adg->clk_rate[i] here?
>
> I thought we can re-get clock if we could get clock once.

Indeed. If a clock worked before, it should keep on working.
However, the failing clock was the cs2000 clock, which can fail to enable
if something goes wrong with i2c.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
