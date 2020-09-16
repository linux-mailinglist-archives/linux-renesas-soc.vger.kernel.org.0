Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F95F26BD95
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Sep 2020 09:00:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726128AbgIPHAs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Sep 2020 03:00:48 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:43083 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726205AbgIPHAq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Sep 2020 03:00:46 -0400
Received: by mail-ot1-f67.google.com with SMTP id n61so5684129ota.10;
        Wed, 16 Sep 2020 00:00:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X4Ki+O9YCLNi2tIpHzoDERiOnawEW0CfTBjDYxntgNU=;
        b=frwLOOIkuRTUfdwfkk0LQ6SHkSdyWzh2TiEX9QDKQmHS+Dj36Uv8XbGESMuoJDEiWB
         4Ho6vO9MO0f7gcV5W4Nqz2sZ0e9TA8utubrbvdAo11p4/keWslG5j3i9/Nj0n54COCwi
         yJWV7PKJL26D6zjR5IEFsgOO0zPuq1FLrf3OAWKVHZ/3yZtRm0fv6HrP9BxEFRxJNq7B
         y6XJl5ycittay4Va2JqBsLMZnqlghqOnQJ/s5BOyzobQ/zfSY1eTZKRfNCVzXYDWDLi6
         9LcgsLDzopxujDidIR5awZQ92MxGNpo3ku135P2iPazpdMe1JmFOwuKzZDDI8JzUoe+f
         XjSQ==
X-Gm-Message-State: AOAM531tdmn9Va5JuU2nXRuEpcHcM3FWTRtfqFz2h7wbov0bKY4RFMQu
        /4+4WaqZ0g/DUDJ+g4a65l2KNL9Cpzk2q0AXEEk=
X-Google-Smtp-Source: ABdhPJwCRXtltOGXBmibKXKrahv7XDx6jUbbWt+hShyBO7hzavLhmGgu8taRMUiimD8MWkTAQAB5E7J1s1nPgUt4GtE=
X-Received: by 2002:a9d:3b76:: with SMTP id z109mr15856887otb.250.1600239607350;
 Wed, 16 Sep 2020 00:00:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200915140110.11268-1-yuehaibing@huawei.com> <CAMuHMdXnuHnML3Gop4o3k_K9nYBRsc7w1cUgGcMrAso5oOKc5Q@mail.gmail.com>
 <9b20d554-eb3d-918e-54ec-b1f374b24a20@huawei.com>
In-Reply-To: <9b20d554-eb3d-918e-54ec-b1f374b24a20@huawei.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 16 Sep 2020 08:59:56 +0200
Message-ID: <CAMuHMdV_WzfO+RLoDd0xP1WL8vatQ=s09K7EBrRa5xjHuakwHg@mail.gmail.com>
Subject: Re: [PATCH -next] soc: renesas: r8a779a0-sysc: Make
 r8a779a0_sysc_info static
To:     Yuehaibing <yuehaibing@huawei.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Yue,

On Wed, Sep 16, 2020 at 3:26 AM Yuehaibing <yuehaibing@huawei.com> wrote:
> On 2020/9/15 23:22, Geert Uytterhoeven wrote:
> > On Tue, Sep 15, 2020 at 4:58 PM YueHaibing <yuehaibing@huawei.com> wrote:
> >> Fix sparse warning:
> >>
> >> drivers/soc/renesas/r8a779a0-sysc.c:99:33: warning: symbol 'r8a779a0_sysc_info' was not declared. Should it be static?
> >>
> >> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> >
> > Thanks for your patch!
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > As commit 7f29315cf4211316 ("soc: renesas: r8a779a0-sysc: Add r8a779a0
> > support") hasn't been merged into arm-soc yet, is it OK for you if I
> > just fold your fix into the original commit?
>
> Sure, it's ok for me.

Thank you, I've updated the commit in my
rrenesas-devel/renesas-drivers-for-v5.10
branch.  The renesas-devel/next branch will be updated later.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
