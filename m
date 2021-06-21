Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BF5E3AE7F3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Jun 2021 13:13:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229890AbhFULP0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Jun 2021 07:15:26 -0400
Received: from mail-ua1-f41.google.com ([209.85.222.41]:40659 "EHLO
        mail-ua1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229888AbhFULPY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jun 2021 07:15:24 -0400
Received: by mail-ua1-f41.google.com with SMTP id r9so4863173ual.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Jun 2021 04:13:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8Qg3Rq3jGtcFwhqzvnnI4l8wK43k9vYqIkfBwUCAhXU=;
        b=TkcYbt1r3HtDUDtjHI/5L4sz7Nz62RDVmOB3FYBOTW5NiyI5KUhlo7+jqKVxUxKhL9
         uRPGjKH2p4tzQoUkX803jM4937AVJHKmElWI5dgmsco46Rx9s2L+D4CsJT+NK3l2d5RT
         5LItlHbxRs9Q4sADdN84wUNJCuIkusa+MWzP4r31PSKwjK5MWQ8+cqrCvySylfMTHO/W
         8v4RCSCSJdSH3Gdyd1YPTOMBr+rHMmfZHLGKVrixEWoTMsjLM5PdStpw2xynYMW/G9KU
         zfGdj8WaanUAZhvFInsT0UGIvD61CLWv0lf8XKRsFN+P5z9NyoSduKmWHG224rVUNtpN
         trng==
X-Gm-Message-State: AOAM531sNDuy9TKsIvvyip6+t2WoJViUvGDOwLX9XnhXrxPPBUCcN/ja
        AvRmC1Sk9sYYyiiwCT5QxeB36VucqifEh+d8xDY=
X-Google-Smtp-Source: ABdhPJxe033AAdl+PltyhEmmr0cv97GeTf2t0Z5m8DXtjo8cSRtZjPpk5WRe23I/L5Gpx0XkfdwhtLL8fQoF/Hnq3mY=
X-Received: by 2002:ab0:70b3:: with SMTP id q19mr21172675ual.2.1624273989226;
 Mon, 21 Jun 2021 04:13:09 -0700 (PDT)
MIME-Version: 1.0
References: <162416647337.11444.4467438519249633023.sendpatchset@octo>
In-Reply-To: <162416647337.11444.4467438519249633023.sendpatchset@octo>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 21 Jun 2021 13:12:58 +0200
Message-ID: <CAMuHMdU6sPBXb1SgGhgp9eY+Raa-EvqgXK3S=RscWmB+2bT9Eg@mail.gmail.com>
Subject: Re: [PATCH 0/3] SoftSW DIP switch support for Draak, Eagle and Ebisu
To:     Magnus Damm <damm@opensource.se>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Magnus,

On Sun, Jun 20, 2021 at 8:01 AM Magnus Damm <damm@opensource.se> wrote:
> SoftSW DIP switch support for Draak, Eagle and Ebisu
>
> [PATCH 1/3] arm64: dts: renesas: r8a77995: draak: Add SW56 support
> [PATCH 2/3] arm64: dts: renesas: r8a77970: eagle: Add SW2 support
> [PATCH 3/3] arm64: dts: renesas: r8a77990: ebisu: Add SW4 support
>
> These patches add support for on-board SoftSW DIP switches to the
> Draak, Eagle and Ebisu boards via board specific DTS changes.

Thanks for your series!

> The GPIOs connecting the DIP switches to the SoC are board specific. There
> are no on-board pull-ups mounted so internal resistors need to be enabled as
> pull-ups for these boards. As expected 2k resistors are used to tie the
> signals to ground for the case the DIP switch is set to ON.
>
> All keys have been tested by toggling each DIP switch and making sure the
> interrupt count in /proc/interrupts is changing as expected. The voltage level
> of each signal has not been measured at this point so there is a small risk
> that the internal pull-up isn't enabled and the signal is floating.

Fortunately the reset state of the PUEN/PUD registers has all pull-ups
enabled for all GPIO lines connected to these DIP switches.
To make sure Linux enforces this configuration, you need to apply
"[PATCH 00/12] pinctrl: renesas: Add more bias pinconf support"
https://lore.kernel.org/linux-gpio/cover.1619785375.git.geert+renesas@glider.be/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
