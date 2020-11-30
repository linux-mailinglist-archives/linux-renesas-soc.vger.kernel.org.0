Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 651FA2C807D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Nov 2020 10:02:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725972AbgK3JBx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 30 Nov 2020 04:01:53 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:38555 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725965AbgK3JBw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Nov 2020 04:01:52 -0500
Received: by mail-ot1-f67.google.com with SMTP id h39so10582629otb.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Nov 2020 01:01:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g3+6k7Cwpo+ojJHoNfl00GdshPCqClEqpUCTHNJlQzw=;
        b=R0fT4/ogFQKgE1vEeJJU22JwCiyZg90PIobMa0V2jtmmEbUI2/HG8+6oQ8FaxDEQW5
         3hMCsnrJVjlenqD+VksXv9e8xsLbMIopjXljvwCtiDpMMh1NbE7SsCOcZHoz3cUoqKGv
         3/QhMtJuU482HNRu5ZzWD7fXa5qab/36M9C8AfSyB6wfkk9b6StIwIgocDAX7Bsey6bJ
         dkTRAKRy5Ht2w8jLvV8+11PiU9y3ApcdiD4/+xR1qZ0B7NIXpiDALi4XmJ4h4CFQyQHH
         jelXDP/38SbdeWzCo1YgLeurVAb74QilH1dHjztrcCgjXKVjolLWfCbRBRSCwN1/FVF0
         5PoQ==
X-Gm-Message-State: AOAM531+zjwfbjBNYDPbObwdOaAYBrJCLPYS469yk5h+q7e/febaPGrE
        OP1u+KjB746WzNO/yyaSa9fZeEX1wrz5PhUCzvCDcVft
X-Google-Smtp-Source: ABdhPJwfA6paPXnqmiCuwTvN665lm0o9KS37Q/F1sMRvp3BVxHoh+8s2k4zsksT2tRQt7as04AeGkS8zKKYBbwsOLYM=
X-Received: by 2002:a9d:686:: with SMTP id 6mr14837302otx.107.1606726872030;
 Mon, 30 Nov 2020 01:01:12 -0800 (PST)
MIME-Version: 1.0
References: <20201126172154.25625-1-uli+renesas@fpond.eu> <CAMuHMdWt+NBD4u4iCf=OdSyFBBW0HU3HwWYyOK3tX87cUOSMwg@mail.gmail.com>
 <5754923.305606.1606724660476@webmail.strato.com>
In-Reply-To: <5754923.305606.1606724660476@webmail.strato.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 30 Nov 2020 10:01:00 +0100
Message-ID: <CAMuHMdX_7C3ynD6fnDRDTuG4XCb1ZC7V=f_ujb32C5aomre8PA@mail.gmail.com>
Subject: Re: [PATCH 00/11] pinctrl: renesas: R8A779A0 (V3U) device support
To:     Ulrich Hecht <uli@fpond.eu>
Cc:     Ulrich Hecht <uli+renesas@fpond.eu>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>, hoai.luu.ub@renesas.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Uli,

On Mon, Nov 30, 2020 at 9:28 AM Ulrich Hecht <uli@fpond.eu> wrote:
> > On 11/27/2020 11:33 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Thu, Nov 26, 2020 at 6:22 PM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> > > This series adds V3U pin control support for EtherAVB, CANFD, DU, HSCIF,
> > > INTC-EX, MMC, MSIOF, PWM, QSPI, TMU and TPU.
> > >
> > > It has been ported from the BSP and has been compile-tested only. It
> > > depends on the "pinctrl: renesas: basic R8A779A0 (V3U) support" series
> > > posted earlier.
> >
> > Thanks for your series!
> >
> > > Ulrich Hecht (11):
> > >   pinctrl: renesas: r8a779a0: Add EtherAVB pins, groups and functions
> >
> > This patch depends on i2c support, which was not included in your series?
>
> Whoops, screwed up the format-patch there...
> I'll post the I2C patch separately for review and include it in v2 of this series.

Thank you! No need to send v2 yet (still reviewing).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
