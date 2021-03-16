Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38F4933D4A6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Mar 2021 14:15:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229838AbhCPNOk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Mar 2021 09:14:40 -0400
Received: from mail-vk1-f172.google.com ([209.85.221.172]:33552 "EHLO
        mail-vk1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231810AbhCPNOh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Mar 2021 09:14:37 -0400
Received: by mail-vk1-f172.google.com with SMTP id b10so3573727vkl.0;
        Tue, 16 Mar 2021 06:14:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aB6izQ9VoAfFJgnqtwJtpY8H2FTj3dXh4XmCo31zbLE=;
        b=YoSYuwSTtKYzLl6aS4GaRGly/GD9ANmnwLqDI2mW9U430sSQ3O9l38dnrNzELLypMS
         Y0uns1+IPChnxCaiwuRhEdiyNpK3lhr7U5kbZcZIM1ohF4S/WVGTOuv7zqb55hP+GYQn
         +zh55USPfKLiWVRHvRsZYmXoMRb8qk9DOCJn5CleqhhJF9Io4ReOn5+ZQ1st01AvvM4y
         vLICh9wU+bdDHdur2Ui2WJ8rgf76WmuxSqLHtzcIbGdbyQ4CrI4p3cCbRjvw9Rkd8o3Q
         Pi/GhmWPcZbTL+QOIJCM3ilqFQ/MRvt+n6/spuuvoY+kZDIeRajhSVgI+39MyU1YuIRu
         FRrg==
X-Gm-Message-State: AOAM531LHXqzlSPo9DyjZv7rHNqvY6bIxjeFMOe5cP40w5yvwAbBDOqd
        NHrKGduKpInFJ60++Wm43eau8DqXTVx0Z8aj/eE=
X-Google-Smtp-Source: ABdhPJylrzNz53A3MURFCsPzD5vWk5700TPq/IfeHiMJN7Qhgt+akUN5ZrPKQ5O9PbrwkqMQDjOOz9uXUgLiwZCP3Zo=
X-Received: by 2002:a1f:e543:: with SMTP id c64mr7334943vkh.2.1615900472570;
 Tue, 16 Mar 2021 06:14:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210315145938.58565-1-wsa+renesas@sang-engineering.com>
 <20210315145938.58565-4-wsa+renesas@sang-engineering.com> <CAMuHMdUw8wWh3ybsFUopKGMw-Zbcqr9bJBEGHAerL-Y226A0=w@mail.gmail.com>
 <20210316125709.GE1031@ninjato>
In-Reply-To: <20210316125709.GE1031@ninjato>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 16 Mar 2021 14:14:21 +0100
Message-ID: <CAMuHMdUm=h4MRfJUdZwBwfr2PxvB1Zk5PioBdq+9b_JjcR6U_g@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] mmc: renesas_sdhi: do hard reset if possible
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Tue, Mar 16, 2021 at 1:57 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > > +       select RESET_CONTROLLER
> >
> > ... if ARCH_RENESAS?
> >
> > While RESET_CONTROLLER can be enabled on SuperH (and compiles),
> > there are no reset drivers for SuperH, so it won't be used anyway.
>
> Yeah, I also thought about it and decided against it. Because a new arch
> will then support resets out of the box while the overhead for old archs
> is negligible, I'd think.

Enabling RESET_CONTROLLER on SH increases kernel size by ca. 4 KiB.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
