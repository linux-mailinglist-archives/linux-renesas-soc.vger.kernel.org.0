Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F9CB2AB475
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Nov 2020 11:08:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727826AbgKIKI4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Nov 2020 05:08:56 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:37923 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726176AbgKIKI4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Nov 2020 05:08:56 -0500
Received: by mail-ot1-f66.google.com with SMTP id a15so6661850otf.5;
        Mon, 09 Nov 2020 02:08:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jXKuIIWasU3HaBG6n9SW1nKjWRD731AUct6xM+IUy6Q=;
        b=iGMR1jt8DSD0xVV1TTKrlsmPleVU3Yo6UOjNog8Ul+sIrcMG8IP6xekpMOGEp47E3i
         6mQEVhap9jU9p5ZaaZN47qfGidy2o9dTHZppB5w6nFP1ZMXo5ZLcy7V2YtGF3i0+rSbf
         j++lTN91O2ZJgHMuxDSuPNSCItoOePxkI+g8fEQOUkizcxOppq/xv3iyHlRzENBLa3Qu
         ILAZg/6oxHpEItNqU59HPsqiO/xxxNcH8sTgshb0DtAXYkhQW7v5QwoYjPfYvx7FA1Wr
         NlZrCCCGHkmGN9q/O905LZQvYEYC5J//4HOUCIaJuKr9MjV2pRaDc8w1eYBc7tEpKFhm
         c6TA==
X-Gm-Message-State: AOAM532UbS3c3OH7/V/zZhIGRxF+ZhShxvs5N4KIIZp+p1SJhH17dOhG
        ZzdoJe6O7P/LKjZnXOXd1YcGstC2h37kZKsVyT4=
X-Google-Smtp-Source: ABdhPJz05Mt9e3VeOHKhjeQ4MHRKDSWYZRWnn9pIqSWes/f9wZU+RTKFrTenW0Mq/gOPBCapkUZx2GQDIswgMgJvuDw=
X-Received: by 2002:a05:6830:2058:: with SMTP id f24mr495626otp.250.1604916535070;
 Mon, 09 Nov 2020 02:08:55 -0800 (PST)
MIME-Version: 1.0
References: <20201105121127.11830-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20201105121127.11830-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 9 Nov 2020 11:08:44 +0100
Message-ID: <CAMuHMdUhUGBiPf6nvTtVC05eEk6oH=cwEO9ZdH9QftA3BZG=_g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: hihope-rev4: Add a comment
 explaining switch SW2404 required for audio_clk_b
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Nov 5, 2020 at 1:11 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Switch SW2404 should be at poistion 1 so that clock output from CS2000

position (will fix while applying).

> is connected to AUDIO_CLKB_A.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.11.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
