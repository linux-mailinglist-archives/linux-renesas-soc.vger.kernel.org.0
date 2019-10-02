Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63C58C4A4B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Oct 2019 11:14:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725852AbfJBJOO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Oct 2019 05:14:14 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:36963 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725765AbfJBJOO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Oct 2019 05:14:14 -0400
Received: by mail-oi1-f194.google.com with SMTP id i16so17020448oie.4;
        Wed, 02 Oct 2019 02:14:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YbSUQaaVHYU+GgUB7AUhY2SfEFnEp/dDb1f2xcRz088=;
        b=Yzj4fzf3v01CFSYQuvBT51oVcCXGqkoZWDTwycbun4v30Bh4i0bK1eAzDpC584qIvV
         YxjTrpif3Jlw7q5s4/d+hZpxGBM8msNKbB/hw0juVCymnrgQ05skgpfcSTori8UIog9h
         PAOgnUd8moPUCOiO8D5/aErb03nrsmrcDPEIchHvf19R9kZ1tlWyKZ/WgQEVHRXb8HHV
         bepOtXIsFBa3PYSd3WVhL+K9JVjh3fs1wpLg0B45+PWRAAFx5QIH8tdE4uS7Zpr7X0Rr
         7t+2iRXpTBYhNU7zLoAh3kgKdQMQAz3B7SQNJVJjF0VtlNPMtMz584IjN/HLMi1tvcDD
         KEbw==
X-Gm-Message-State: APjAAAWGGXrNLH/eG+1NRFaBV9Qstr7VNGI3qArPHPducqpZIDt08+XU
        hCwNdzyS4G22ZBQFbuoPpVa6nAfAmvYRCgzxgjU=
X-Google-Smtp-Source: APXvYqxhH0oDbm1ZZEiq8U+wLl4xx2krNMT4dTzVJ7F12oC2fUh2a8N8PtUQJ31gbVNRhAnkQb1h0ZxFpnx0jBa7kh0=
X-Received: by 2002:aca:dad4:: with SMTP id r203mr2092018oig.102.1570007653508;
 Wed, 02 Oct 2019 02:14:13 -0700 (PDT)
MIME-Version: 1.0
References: <20191001180834.1158-1-geert+renesas@glider.be>
 <20191002081553.GB1388@ninjato> <TYAPR01MB454472C76E03930717A2898BD89C0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
 <CAMuHMdWBghL8Em0OoCKjJdU7OiY_pV3Lmc=SXhV2yY=sKJJ-aw@mail.gmail.com> <20191002085805.GA10270@ninjato>
In-Reply-To: <20191002085805.GA10270@ninjato>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 2 Oct 2019 11:14:02 +0200
Message-ID: <CAMuHMdXo0knrst754b7rvBRGC8kBxO7PLJ2XR6E2-q6wumBSGQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: sh_mmcif: Use platform_get_irq_optional() for
 optional interrupt
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jiri Slaby <jslaby@suse.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Wed, Oct 2, 2019 at 10:58 AM Wolfram Sang <wsa@the-dreams.de> wrote:
> > Please cherry-pick the top commit from renesas-devel:
> > 6e47c841329eb9b0 ("ARM: fix __get_user_check() in case uaccess_* calls
> > are not inlined")
>
> Thanks a lot, Geert. I can confirm this patch fixes the issue I was
> seeing:
>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> Could you kindly forward this tag to Yamada-san or bounce me the patch
> so I can do it?

Please check your linux-renesas-soc folder.  I CCed the list when providing
my own Tested-by yesterday.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
