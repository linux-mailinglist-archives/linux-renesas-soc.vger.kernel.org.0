Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37760459E79
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Nov 2021 09:44:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231347AbhKWIrk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 Nov 2021 03:47:40 -0500
Received: from mail-ua1-f51.google.com ([209.85.222.51]:39828 "EHLO
        mail-ua1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229617AbhKWIrk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Nov 2021 03:47:40 -0500
Received: by mail-ua1-f51.google.com with SMTP id i6so42148527uae.6;
        Tue, 23 Nov 2021 00:44:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GB53z3B/gqFRSO4IG+bzDbuA9R2agDBafBoJtXz3z38=;
        b=M+/S+ON03qZqPXmDKZG6w2ShOC/OxJC0kHts1+lUHlhpW4PrBS/LEF60ns7XtFr+4p
         EMg+WUrfnECfY51MMmCeciQ3ActY+CwYL6kjrOsGWuEkfTgeYiAtrEs5+y8eh9UQ5RxT
         TgFxubiepyA0hN9fVXbbpPcogE4w94ujE6E94RoQwTvRXD29HxuPQQUCKqA3MoufnHFG
         g6w0Q0lllBWDjU2NMNupODllnxsGsL2F5v4W2EDq1z5lVRmzB91mHbpGMSwtyGkzxtF9
         1rLC+cnr0z9YU1QWWf/SotxhfUxBt1hNqhd+KclSYGhXk+jEOm2I+QsOuCqpKk6nqT6C
         q1fA==
X-Gm-Message-State: AOAM532Ft4My+mPtG2sELLYHZ3ab/ffIBMky9h1FvvDTz5dohsDUOW1n
        L4BeFt58L7fbWsL+/HrwCpPBBA8PgHhVYg==
X-Google-Smtp-Source: ABdhPJwZtjMZDbrfRR5yq/YRZg0/sBNm4oUuJiEJhPDkzuobl+M9KVSGqsB7UvX4FxmyDK8Vc8YP+A==
X-Received: by 2002:a05:6102:c4e:: with SMTP id y14mr6443954vss.61.1637657071840;
        Tue, 23 Nov 2021 00:44:31 -0800 (PST)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id l28sm5911241vkn.45.2021.11.23.00.44.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Nov 2021 00:44:31 -0800 (PST)
Received: by mail-vk1-f171.google.com with SMTP id s17so11947330vka.5;
        Tue, 23 Nov 2021 00:44:31 -0800 (PST)
X-Received: by 2002:a05:6122:7d4:: with SMTP id l20mr7126496vkr.26.1637657070961;
 Tue, 23 Nov 2021 00:44:30 -0800 (PST)
MIME-Version: 1.0
References: <20211122103032.517923-1-maz@kernel.org> <CAMuHMdX2ZRvDYA3idmw3nBcP6CO=2od6ZU-UeJo9vYsuB=fQNQ@mail.gmail.com>
 <8735no70tt.wl-maz@kernel.org> <CAMuHMdVS67BLP2XEdD6ZvVBVE2x11gKnQa1TqG659HXPM5scqQ@mail.gmail.com>
 <CAMuHMdWJhnXabKGpW7k944dzQHtwQtxw-yb2bRBsoaMw6N6nuA@mail.gmail.com> <87tug3clvc.wl-maz@kernel.org>
In-Reply-To: <87tug3clvc.wl-maz@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 23 Nov 2021 09:44:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWGb2xik+94RVwtq8E6+9eN=HfQLX3a4sTjKQXR96Udkw@mail.gmail.com>
Message-ID: <CAMuHMdWGb2xik+94RVwtq8E6+9eN=HfQLX3a4sTjKQXR96Udkw@mail.gmail.com>
Subject: Re: [PATCH] of/irq: Add a quirk for controllers with their own
 definition of interrupt-map
To:     Marc Zyngier <maz@kernel.org>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        kernel-team@android.com, Rob Herring <robh@kernel.org>,
        John Crispin <john@phrozen.org>, Biwen Li <biwen.li@nxp.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
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
>
> I'd expect it to be the case for the other platforms as well.

OK.

BTW, what would have been the correct way to do this for irqc-rza1?
I think we're about to make the same mistake with RZ/G2L IRQC
support[1]?

Thanks!

[1] "[RFC PATCH v3 0/7] Renesas RZ/G2L IRQC support"
https://lore.kernel.org/all/20211110225808.16388-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
