Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDCC42F2A23
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Jan 2021 09:40:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387585AbhALIk2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Jan 2021 03:40:28 -0500
Received: from mail-ot1-f47.google.com ([209.85.210.47]:46301 "EHLO
        mail-ot1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387684AbhALIkZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Jan 2021 03:40:25 -0500
Received: by mail-ot1-f47.google.com with SMTP id w3so1507867otp.13;
        Tue, 12 Jan 2021 00:40:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w29dUB5KL4eezIAef15433MX3r9r8DCwvj+zosW1uhM=;
        b=YnVzBiCQ/ELWkjtNODQeuy60HST78Rw9q2D1VVo6bt77fbkDCOGpr8DHJ2FfGU6Xny
         msAJtjq0w+I9FsrZZxug7Qtp9BfUMp59W1mAZ/eo0smn19zJgELjWFCu6IHVRLL4xtYv
         rsc+SpdYjwlTGivT5WbU4WcfZ43whd4ZBn5Bo8EDxryNvJsWwD7gfsxeYvCMJg7b00tc
         qbnNCzWhL5vnzc+T7Pdy6N0sEvWKdwz6Smq1dRMqoPJ/vzT5ryQ5EGdBy10QKIl4X4vn
         +i+cL5ofNjemKdz6R2BjT304gRqR3LW9NurZmBjfpNjBAMMdzN/KShPp6Ae5XXTzKyyS
         keqw==
X-Gm-Message-State: AOAM533W5/SN7mbMiHAwgYPk5yqtrqr4egsa/BKfuQeq95JoHxdfSFr0
        fVDlreZCNPi/lSk2toAahXwX16pLEhAUk+DZhAE=
X-Google-Smtp-Source: ABdhPJxvwE5oiPdBOmeUtO04110FP0REWTxbESwnAkckCmz20kMv1WE8CbpumhTKdbLVoijUlzfY35HVPOC325H0pIg=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id u26mr2143981oth.250.1610440783942;
 Tue, 12 Jan 2021 00:39:43 -0800 (PST)
MIME-Version: 1.0
References: <20201228202221.2327468-1-aford173@gmail.com> <20210111201430.GA2993479@robh.at.kernel.org>
In-Reply-To: <20210111201430.GA2993479@robh.at.kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 12 Jan 2021 09:39:32 +0100
Message-ID: <CAMuHMdWf-LchrFJRrQ2ByO_e4O8CV3j9EZ5o2TnqUeHhX_YF1g@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: clock: renesas: rcar-usb2-clock-sel: Add
 support for RZ/G2 M/N/H
To:     Rob Herring <robh@kernel.org>
Cc:     Adam Ford <aford173@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Adam Ford-BE <aford@beaconembedded.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jan 11, 2021 at 9:14 PM Rob Herring <robh@kernel.org> wrote:
> On Mon, 28 Dec 2020 14:22:20 -0600, Adam Ford wrote:
> > The datasheet for the RZ/G2 Series show the bit for choosing between a crystal
> > oscillator and an external oscillator is present.  Add the bindings for
> > r8a774a1 (RZ/G2M), r8a774b1 (RZ/G2N), and r8a774e1 (RZ/G2H)
> >
> > Signed-off-by: Adam Ford <aford173@gmail.com>
> >
>
> Acked-by: Rob Herring <robh@kernel.org>

Thanks, will queue in renesas-clk-for-v5.12.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
