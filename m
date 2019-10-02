Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C20E2C875A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Oct 2019 13:29:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725928AbfJBL3F (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Oct 2019 07:29:05 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:41451 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbfJBL3E (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Oct 2019 07:29:04 -0400
Received: by mail-oi1-f195.google.com with SMTP id w65so4490355oiw.8;
        Wed, 02 Oct 2019 04:29:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VOqaff5GeEyEytif6Y5wcF5pWtKQsDRF2Z5Wt6x2kVA=;
        b=V64IvvBD8gj4ndDqKVNGC47tt//yOJs0vw3i79uw3Rns6s7dk8xVAPgA+3T73945rf
         KhXqGLu79dMbd0LdpQo+6ftqFcX1BpKW44qEiH5N9p3w/uQf/Zb++v7I14ubwsr+hbnM
         E1G1BzaeANawbrNOQzPMMNC7RRXM53VSzYSLvd9oZj6WUuRMHxIS/GqmNHURmAeilSzu
         1QvbEvreMxCJZvEcsZMOQZeFivkNGYVoYvn5q0v+XjD9p7OR/F4x1D59pBOmZIeFXRkh
         c39c1JEYn0xdZhvs0tRbHyRQo6vCCHDM2smqEe3cw4dQL2BiCxco0pnQOafAjAXVbJVX
         vNyg==
X-Gm-Message-State: APjAAAUzsih/9lOz8XpLiaqX1y95+CyZcJipTLHjAUkky5PPLkqCLYKb
        y0lVaAWMgujBM8JBfXkUA6xHsQyA36zL+3pKwBE=
X-Google-Smtp-Source: APXvYqwBp3ilQomjLD8ZkfMcVQbUDlnkJyZhIFzYiVSft3rQ6dhwA8ZhYPipVW9TH7GEhjRXD/8UtxT0SNmyzkb9b90=
X-Received: by 2002:aca:f305:: with SMTP id r5mr2323471oih.131.1570015743746;
 Wed, 02 Oct 2019 04:29:03 -0700 (PDT)
MIME-Version: 1.0
References: <20191001180743.1041-1-geert+renesas@glider.be> <201910021701.JBV8khAI%lkp@intel.com>
In-Reply-To: <201910021701.JBV8khAI%lkp@intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 2 Oct 2019 13:28:51 +0200
Message-ID: <CAMuHMdWQhvWOMjEpJrXV0nuKUc=wT6Zi_ZLjKco0Lkgeis8NyQ@mail.gmail.com>
Subject: Re: [PATCH] serial: sh-sci: Use platform_get_irq_optional() for
 optional interrupts
To:     kbuild test robot <lkp@intel.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>, kbuild-all@01.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kbuild test robot,

On Wed, Oct 2, 2019 at 11:53 AM kbuild test robot <lkp@intel.com> wrote:
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on tty/tty-testing]
> [cannot apply to v5.4-rc1 next-20191001]

Strange, this patch applies to all of v5.4-rc1, tty/tty-testing, and
next-20191001?

> url:    https://github.com/0day-ci/linux/commits/Geert-Uytterhoeven/serial-sh-sci-Use-platform_get_irq_optional-for-optional-interrupts/20191002-171547

Oh, this is still the old tty/tty-testing before it was rebased to v5.4-rc1,
i.e. still based on v5.3-rc4.  That explains the build failure.

That does not explain why you couldn't apply this patch to v5.4-rc1 and
next-20191001, though.

> base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
> config: sparc64-allmodconfig (attached as .config)
> compiler: sparc64-linux-gcc (GCC) 7.4.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         GCC_VERSION=7.4.0 make.cross ARCH=sparc64
>
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    drivers/tty/serial/sh-sci.c: In function 'sci_init_single':
> >> drivers/tty/serial/sh-sci.c:2899:24: error: implicit declaration of function 'platform_get_irq_optional'; did you mean 'platform_get_irq_byname'? [-Werror=implicit-function-declaration]
>        sci_port->irqs[i] = platform_get_irq_optional(dev, i);
>                            ^~~~~~~~~~~~~~~~~~~~~~~~~
>                            platform_get_irq_byname
>    cc1: some warnings being treated as errors

FTR, not reproducible on sparc on v5.4-rc1, current tty/tty-testing, and
next-20191001.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
