Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D2C985347
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Aug 2019 20:56:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389361AbfHGS4g (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 7 Aug 2019 14:56:36 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:37532 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389329AbfHGS4g (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Aug 2019 14:56:36 -0400
Received: by mail-ot1-f68.google.com with SMTP id s20so42993445otp.4;
        Wed, 07 Aug 2019 11:56:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZXupRDzgpFO1W45CVIYMgKHhIpXoLsIBFZrG7vpgwSA=;
        b=NBwGQC9dPiPWAfKMh4MwiU9bMTvw1iUhl7Gn44oZUr9fEC6E3ttwCqaT+XZ+5jQRRo
         4iPjMLmHtw7dEiOfPlpxiNrsJbhw8rpqx42MscvageK9f/HHA4iwYRfmbGQ1OSXU1MvY
         21INFuWMBhZ4udrW6B90MbIlobetJ0sgwy+1iabRad+gx202ODDNSNSnvbwpO+kmV6ow
         b5XuaOlk++s80BjpHucVoYyNtB+gnnOKEyjFctL33TCVeGIFU2RlhI/ReFmTuJeTSlYN
         2QEo23WAoxlMH7bQVWrXeM/FqZshDWYYFU3+gQE4KBJXCBrSYSl54w/5M27bCFtpK5bO
         +4xg==
X-Gm-Message-State: APjAAAWG/6eUw5ZmA8/7GcqiXUVJRaBAiX01e+jtbeiPrjFMCGWPgSOH
        a/iBMxd5GK7ANluO/WVawS1BwByRmcuoQBNAThs=
X-Google-Smtp-Source: APXvYqw1QHuSkF1qfbT4edWXR35qtnd6E/tcQTZZnDqO+2Y7iJU9IxNwVHe+njo7BrojHicCJK4/fqQ27q1aNYnfogo=
X-Received: by 2002:a9d:5c11:: with SMTP id o17mr8576876otk.107.1565204195150;
 Wed, 07 Aug 2019 11:56:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190807084635.24173-1-geert+renesas@glider.be>
 <20190807084635.24173-3-geert+renesas@glider.be> <db9961d5-e075-5dca-3417-023b7b8ba4c1@linaro.org>
In-Reply-To: <db9961d5-e075-5dca-3417-023b7b8ba4c1@linaro.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 7 Aug 2019 20:56:15 +0200
Message-ID: <CAMuHMdWtvHYvzqJwxgQs3TVqo8K1KL-SDOQ6_QfTcVa3PjoFuA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] clocksource/drivers/renesas-ostm: Fix probe error path
To:     Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Chris Brandt <Chris.Brandt@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Daniel,

On Wed, Aug 7, 2019 at 8:13 PM Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
> On 07/08/2019 10:46, Geert Uytterhoeven wrote:
> > Fix various issues in the error path of ostm_init():
> >   1. Drop error message printing on of_iomap() failure, as the memory
> >      allocation core already takes of that,
> >   2. Handle irq_of_parse_and_map() failures correctly: it returns
> >      unsigned int, hence make irq unsigned int, and zero is an error,
> >   3. Propagate/return appropriate error codes instead of -EFAULT.
> >   4. Add a missing clk_put(),
> >   5. Split the single cleanup block in separate phases, to avoid
> >      clk_put() calling WARN() when passed an error pointer.
>
> Does it make sense to convert to timer-of API?

I don't know. Will have a look...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
