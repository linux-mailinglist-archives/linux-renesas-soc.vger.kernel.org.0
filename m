Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76C6D45A0D9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Nov 2021 12:02:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234531AbhKWLFv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 Nov 2021 06:05:51 -0500
Received: from mail-vk1-f173.google.com ([209.85.221.173]:40858 "EHLO
        mail-vk1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234813AbhKWLFt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Nov 2021 06:05:49 -0500
Received: by mail-vk1-f173.google.com with SMTP id 70so3729365vkx.7;
        Tue, 23 Nov 2021 03:02:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3vpTNg4M2uZL1VyLDRhqbPlkPZMl8jY+kogUQeT7PgU=;
        b=zjV9ODhHo3Y4F2aslt1Q2qJj7opAjGVFQecuczgdYxzHvGXV2N/uoErnAgqhnxVHre
         9JhLB3QdwxmImsrLIIdMY76jTeQr8f8hYF47kBSpmh+Zhf8HwNNHfkDIcsXPkH4Fi07g
         NxjANoi3oA3jgv55mE9TFTrMWCya1BIfMszhrEc1uMy/lb8ycjW2th9sO1BvGeM7cCAB
         JOMMf6SoFd+CDqJuTzxRrrYKGkP4muCQT26U36NLv7J122p57LiBAaQXOLmlwSIK/0xC
         k+UP3SNWBpOA7Wq+KS7npw2wUv1WaZ3doMSvrZluNkgEshaDi3YcjScCMoMa6N6NZOxt
         pjBw==
X-Gm-Message-State: AOAM531phVI+ExKQ+gO63Agr84PxG1DIJcdInR/RTMJeaoMnAqyG2lv1
        yfp858fjYvKCdyjcNpZKc+mxPuC+cZh6pA==
X-Google-Smtp-Source: ABdhPJy1vuskKRcukoPoAA08HXDc+XZdYeizyUzEiU34uEeruYcSvP5Pi4dlsh4d0i5oMVEOpzhIqA==
X-Received: by 2002:a05:6122:889:: with SMTP id 9mr8263126vkf.21.1637665360958;
        Tue, 23 Nov 2021 03:02:40 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id i1sm5958199vkn.55.2021.11.23.03.02.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Nov 2021 03:02:40 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id x14so2289718uao.0;
        Tue, 23 Nov 2021 03:02:40 -0800 (PST)
X-Received: by 2002:a05:6102:e82:: with SMTP id l2mr7938046vst.37.1637665360432;
 Tue, 23 Nov 2021 03:02:40 -0800 (PST)
MIME-Version: 1.0
References: <20211122103032.517923-1-maz@kernel.org> <CAMuHMdX2ZRvDYA3idmw3nBcP6CO=2od6ZU-UeJo9vYsuB=fQNQ@mail.gmail.com>
 <8735no70tt.wl-maz@kernel.org> <CAMuHMdVS67BLP2XEdD6ZvVBVE2x11gKnQa1TqG659HXPM5scqQ@mail.gmail.com>
 <CAMuHMdWJhnXabKGpW7k944dzQHtwQtxw-yb2bRBsoaMw6N6nuA@mail.gmail.com> <87tug3clvc.wl-maz@kernel.org>
In-Reply-To: <87tug3clvc.wl-maz@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 23 Nov 2021 12:02:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU5UAYONbT26e2Ttd7FmoXR8SxCO86bfLLmX9VDeQ2UVg@mail.gmail.com>
Message-ID: <CAMuHMdU5UAYONbT26e2Ttd7FmoXR8SxCO86bfLLmX9VDeQ2UVg@mail.gmail.com>
Subject: Re: [PATCH] of/irq: Add a quirk for controllers with their own
 definition of interrupt-map
To:     Marc Zyngier <maz@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Android Kernel Team <kernel-team@android.com>,
        Rob Herring <robh@kernel.org>, John Crispin <john@phrozen.org>,
        Biwen Li <biwen.li@nxp.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Marc,

On Tue, Nov 23, 2021 at 9:33 AM Marc Zyngier <maz@kernel.org> wrote:
> On Tue, 23 Nov 2021 07:57:48 +0000,
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > Summarized:
> >   - Before the bad commit, and after your fix, irqc-rza1 is invoked,
> >     and the number of interrupts seen is correct, but input events
> >     are doubled.
> >   - After the bad commit, irqc-rza1 is not invoked, and there is an
> >     interrupt storm, but input events are OK.
>
> OK, that's reassuring, even if the "twice the events" stuff isn't what
> you'd expect. We at least know this is a separate issue, and that this
> patch on top of -rc1 brings you back to the 5.15 behaviour.

So the "twice the events" stuff did happen before, and is caused by
gpio-keys always fabricating timer-based auto-"up" events when using
"interrupts" instead of "gpios".

arch/arm/boot/dts/r7s72100-rskrza1.dts has IRQ_TYPE_EDGE_BOTH to
detect the real "up", which becomes a second set of "down"/"up" events.
Using IRQ_TYPE_EDGE_FALLING gets rid of the dupe by only detecting
the real "down" event.  Similar for IRQ_TYPE_LEVEL_LOW, but then
there's a temporary interrupt storm until the key is released.

Seems like gpio-keys needs to be fixed for IRQ_TYPE_EDGE_BOTH.
When using "gpios" instead of "interrupts", it does pass
IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING, and handles that case
correctly.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
