Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 118041582F0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2020 19:47:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727056AbgBJSre (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Feb 2020 13:47:34 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:44719 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726991AbgBJSre (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Feb 2020 13:47:34 -0500
Received: by mail-oi1-f195.google.com with SMTP id d62so10167626oia.11
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Feb 2020 10:47:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WFyNJmh0X6w2xm6wmKYCAmkcAkqSO0anUy0mA39XA4s=;
        b=XFTF/n7byOCz+NRyxA9MbjWWj1CEg+ezhUZyW953Zi7vknQgDQQqiEM3KjGxtGn9f8
         xCEzzQcxC0gBbW3g/+HKZPUQFCAo/BGKB1eK/w6WNFYYrlPxOIBir37NdaSX6Igby6wQ
         hMra8t1VN/5VA1+ieog81s3LLCCBiwMGQIe+Osx+K3kXZI+2YiR4vZjDMhcZp8QTRKFn
         fhTWAuMa4hJFFSJ28Y5K4LyQ2oH6atG9ppfyov4XeXLk7pPa1DdE/DGpSRTXLEX69Ck+
         2t+D6vbeXEiTBvE8KLCd4SeJp6CjFQebL4puE5u/R74LisyGYmcmRKvj6k9hw/rzSkeP
         eUNA==
X-Gm-Message-State: APjAAAVCWghWrwCdqGB0Ty4Bd9hDsRlZGjw+O4nwQVl1BSR3tq6MOe7X
        WyqdhosV31dgn2AYPnZJMyWe68zYBTguf4JvMkE=
X-Google-Smtp-Source: APXvYqyYyQdKu8BnDklaC0h6xAyjJNZ+ppjbadkFLB5gcqIQz2hytDDAg/4pXbLo5bAtN/fAUNY9oXWWgFlFHDj2/9k=
X-Received: by 2002:aca:48cd:: with SMTP id v196mr315748oia.102.1581360453282;
 Mon, 10 Feb 2020 10:47:33 -0800 (PST)
MIME-Version: 1.0
References: <202002110233.bPq1aJyL%lkp@intel.com>
In-Reply-To: <202002110233.bPq1aJyL%lkp@intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 10 Feb 2020 19:47:22 +0100
Message-ID: <CAMuHMdWPG7=vEBFWXQ6TJ4SEXbFAn-0JcpLq2EeseX+82nPuHw@mail.gmail.com>
Subject: Re: [renesas-drivers:sh-pfc-for-v5.7 13/13] drivers/pinctrl/sh-pfc/core.c:1037:1:
 error: expected identifier or '(' before '}' token
To:     kbuild test robot <lkp@intel.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        kbuild-all@lists.01.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Feb 10, 2020 at 7:27 PM kbuild test robot <lkp@intel.com> wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git sh-pfc-for-v5.7
> head:   143a21c22d849a243c899408c1cf8bd8bdcd72cd
> commit: 143a21c22d849a243c899408c1cf8bd8bdcd72cd [13/13] pinctrl: sh-pfc: checker: Add function GPIO checks
> config: i386-allyesconfig (attached as .config)
> compiler: gcc-7 (Debian 7.5.0-3) 7.5.0
> reproduce:
>         git checkout 143a21c22d849a243c899408c1cf8bd8bdcd72cd
>         # save the attached .config to linux build tree
>         make ARCH=i386
>
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
> >> drivers/pinctrl/sh-pfc/core.c:1037:1: error: expected identifier or '(' before '}' token
>     }
>     ^

Thanks, bad fixup. Fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
