Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEBDF1D5006
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2020 16:08:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726191AbgEOOI6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 15 May 2020 10:08:58 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:38673 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726016AbgEOOI5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 May 2020 10:08:57 -0400
Received: by mail-ot1-f66.google.com with SMTP id w22so1979409otp.5;
        Fri, 15 May 2020 07:08:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gxw2p47MIv0tzcDATVe7ifY5rabCaxXmQDdlM5LWtnE=;
        b=lSBpDRB72VBud+mb3ZyNl3BG0B/vYVqSSpUXi65vp8b3B5gAParDzIzBkeRT+YOr5Q
         Oi5w+pf2yEi9FBAUG3WK540tZ/5urptkTbVNasMucSSLDVha1sx1mRtiQs1xE9CCXPb5
         ZlzOkFjenaWf/CSOR8YpLG/3RhzwkvA1Hhx8J3Z3vou4Q0NPQeSY6YeTRoK+TuVZbtZQ
         TuapBzEZhWZo43uTbiKglV13X4xHL3U4uOWsR3Hrgrx5AEvsF3tvVZ3MrF5UNl1ff6GY
         g/Ln6/dsRpt31wKPDntD8I5qOeeDh9MU86uCUO6mgg8Xsax3PKzdP4zkvt3fydhDAg+w
         eIlg==
X-Gm-Message-State: AOAM5334kNGWtUAoIOa7daP1cfyOxTBXceLIDr3GUsx8ndgGlvciWR4A
        ZEYNG3CQ3WqBDZD0GJHTUvTOlnZW6v6NUgJsxSY=
X-Google-Smtp-Source: ABdhPJxcSL5yluyP1OpVXt9IddS8Dsvy4Omx/84m7y6xkSuqxb5ktMLvQ3ow2cQnRrGdKqTZ29Hx5hTRwm83ujsw6oA=
X-Received: by 2002:a9d:63da:: with SMTP id e26mr2236889otl.107.1589551736602;
 Fri, 15 May 2020 07:08:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200513171206.6600-1-wsa@kernel.org>
In-Reply-To: <20200513171206.6600-1-wsa@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 15 May 2020 16:08:45 +0200
Message-ID: <CAMuHMdWmPNkdct7nk5YGRHSpq=cg6zeagUVHwfm4xzxi2YbBtA@mail.gmail.com>
Subject: Re: [RFC PATCH] mmc: tmio: properly balance RPM on remove
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Wed, May 13, 2020 at 7:12 PM Wolfram Sang <wsa@kernel.org> wrote:
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> Because we enabled the device with _noresume, we should disable it with
> _noidle to match the ref counting of the clocks during remove().
>
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> I think this is the proper fix to the problem Geert reported [1]. I am

Thanks, I can confirm this fixes the issue on unbind, so
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

> not sure about a proper Fixes-tag, though. The corresponding _noidle
> call in the probe()-error-path was added with:
>
> aa86f1a38875 ("mmc: tmio: Fixup runtime PM management during probe")

That one also added a pm_runtime_put() call to the normal probe path,
but a pm_runtime_put_noidle() call to the error path, causing another
possible imbalance, which is still there.
So I guess the former has to be replaced by a _noidle call, too?

Also, the conditional

        if (_host->native_hotplug)
                pm_runtime_get_noresume(&pdev->dev);

in probe() is not undone in the error path.

> However, from my understanding this is more fitting?
>
> 1b32999e205b ("mmc: tmio: Avoid boilerplate code in ->runtime_suspend()")
>
> But maybe my understanding of the situation is still not perfect and
> even the commit message is bogus? Ulf, since both mentioned commits are
> from you, could you have a look? Thanks in advance!
>
>    Wolfram
>
> [1] Message-ID: <alpine.DEB.2.21.2004291630090.4052@ramsan.of.borg>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
