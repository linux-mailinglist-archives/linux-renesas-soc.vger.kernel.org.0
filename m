Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0789832ECF3
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Mar 2021 15:19:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229723AbhCEOS1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 5 Mar 2021 09:18:27 -0500
Received: from mail-vs1-f50.google.com ([209.85.217.50]:36871 "EHLO
        mail-vs1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbhCEOSV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 Mar 2021 09:18:21 -0500
Received: by mail-vs1-f50.google.com with SMTP id l27so1033412vsj.4;
        Fri, 05 Mar 2021 06:18:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=gdzj0usTh1YKDxdOvrOExPzZx/6n5Vmrnz31+aNnCjk=;
        b=m1CrCD+ZEw3atpezmqHkKWKJ+z0boumXWEkq3WJn4Ufsg8J7uMWcq/K9jFdyxW7myV
         uedPfyUV6gPbGaiKyD8ymLZ1KaPYl9SXexcFweXQESp2ukzkoR0fylfg1y472yoQ/JWy
         hBxZhepqo+pWx9SLEkqysR+3poNj11fHTGEM9dQ69abMoVPmbSUYO7V1FFohARELkBM9
         8qgfmgtm7eOBJRWeDNHskme7jyDYd3mBY+DVYbosA30pgMZ+8HZYLvkejvYL8ZzbIknz
         0xBFckAaXOquhS/od9mDTQ4jON9jEC4bpNaPPKfSbGzU9ECNozFYhNdWlIxvPdugFmfV
         VXrg==
X-Gm-Message-State: AOAM530j/6SVfU+O3eeu47O4huml5Sxsku7zqbI21LClhFsll4CPb+zi
        Qx08mmByJd0T8TOHJgWZIOp5j+uWs30sdhQkoTw=
X-Google-Smtp-Source: ABdhPJzJHGGI7pUn8IokPaUkUMLBowoHd3YIBUXXqUcrZEeak/d/wkCSHjsYQNcjgbzknV2BoJCx6NVY3j4KIw5N26w=
X-Received: by 2002:a67:fe90:: with SMTP id b16mr6550509vsr.40.1614953900466;
 Fri, 05 Mar 2021 06:18:20 -0800 (PST)
MIME-Version: 1.0
References: <20210304153257.4059277-1-geert+renesas@glider.be> <20210305141543.GB1312@kunai>
In-Reply-To: <20210305141543.GB1312@kunai>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 5 Mar 2021 15:18:09 +0100
Message-ID: <CAMuHMdW8hqVPTcZcCFAHFUNOe63Ww_5wscLvRM3nms9Q4tS7Ww@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] arm64: dts: renesas: falcon: Add I2C EEPROMs and sub-boards
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Fri, Mar 5, 2021 at 3:15 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> On Thu, Mar 04, 2021 at 04:32:54PM +0100, Geert Uytterhoeven wrote:
> > This patch series adds the device nodes for all I2C EEPROMs in the
> > Falcon board stack.  As some EEPROMs are located on sub-boards,
> > it also introduces individual .dtsi files for these sub-boards.
> > Note that (for now) these sub-boards don't have compatible values or
> > model strings, as I think this needs more discussion.
> >
> > This has been tested on the Falcon boards in Magnus' and Kieran's farms.
> > The EEPROM on the CPU board in Magnus' farm contains some data.
> > All other EEPROMs are present, but in pristine state (all ones).
> >
> > Changes compared to v1:
> >   - Move EEPROMs in sub-boards to separate .dtsi files and patches.
> >
>
> Checked the datasheets and tested, too, so:
>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks!

> One minor question is: why do the labels in patches 2+3 have the "-id"
> suffix and patch 1 does not? Don't we want consistency here?

The EEPROMs on the sub-boards are labeled "Board ID" in the
schematics, the EEPROMs on the CPU and BreakOut board aren't.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
