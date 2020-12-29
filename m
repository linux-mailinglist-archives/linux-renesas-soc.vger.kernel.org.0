Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E411A2E7342
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Dec 2020 20:45:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726178AbgL2TpT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 29 Dec 2020 14:45:19 -0500
Received: from mail-oi1-f182.google.com ([209.85.167.182]:40125 "EHLO
        mail-oi1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726168AbgL2TpT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Dec 2020 14:45:19 -0500
Received: by mail-oi1-f182.google.com with SMTP id p5so15695179oif.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Dec 2020 11:45:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qho2jtaCySHdSQn2/4AdG5e/+0uyXAngs3FHJZiuo4M=;
        b=Tg1tRHqQTEX0A8ma1ohekczdX2hkylaKSp73BdC6PNjTW375a+xHcMc+hbv6F6iP+2
         mw9/oO7+9DbDRrbbouY68U1S2qPjTjTm749t/2xSNNsXbmJPcRjunAvFGIeOXCJo1LkI
         PtrJxTYtdIQR8mwEXBM1BeP/RM5B41axeMFZ+6YDbHI/D1IGpIUWRhCFgTe63YwwsJDd
         KggNt3UqoKQn5Yu9Bf73hiVn8kVGtkkEN05AesqhkrMgTOn/Szq8w3mnHn5e1tn3xMUD
         /x69FnJ/UfexWkl37nPDbNMAPT4x/2BIEcMa+nSSmWBhDRj9WbltitBo9wf2+980L+jY
         jYMQ==
X-Gm-Message-State: AOAM532TnJydvcog2reBaEfOOUSyYSNId4OFyQdOpaEtEKZ/PLo7U50H
        jFAP4B3NsaNrBGc1eKjWrz7vGKMkZ+FNOgfxrCw=
X-Google-Smtp-Source: ABdhPJzwVeckWTOyxI8jvZCpA3n9YgvVks0xaXIvJB0ecaiFPnX23+GtTM3uHG8ia48PT+0POdRan4XCxbmZJufDvHg=
X-Received: by 2002:aca:3cc5:: with SMTP id j188mr3331539oia.54.1609271078456;
 Tue, 29 Dec 2020 11:44:38 -0800 (PST)
MIME-Version: 1.0
References: <20201223185304.GA75038@ninjato> <CAMuHMdU+MZO16TQcDN8zgJNXjWqhgcBLSYedkVoCSH4sOgi-Pg@mail.gmail.com>
In-Reply-To: <CAMuHMdU+MZO16TQcDN8zgJNXjWqhgcBLSYedkVoCSH4sOgi-Pg@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 29 Dec 2020 20:44:27 +0100
Message-ID: <CAMuHMdWA9MbVMZfOic-kdTx-mcgDeOgb4j_C2mQ3nmzVzLU9fg@mail.gmail.com>
Subject: Re: Reboot regression on Lager
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Tue, Dec 29, 2020 at 9:40 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Wed, Dec 23, 2020 at 7:55 PM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> > I just discovered that my Lager can't reboot anymore. 5.10 is good,
> > current Linus' tree [1] is bad. I don't have time to debug this on my
> > own right now, so this is a reminder and notification for now.
> >
> > [1] (614cb5894306 ("Merge tag 'acpi-5.11-rc1-2' of git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm")

> But I caught the following during s2ram once, which might be related:
>
>  Disabling non-boot CPUs ...
>  Enabling non-boot CPUs ...
> +------------[ cut here ]------------
> +WARNING: CPU: 0 PID: 21 at drivers/i2c/i2c-core.h:54 __i2c_transfer+0x464/0x4a0
> +i2c i2c-6: Transfer while suspended

Unrelated.
https://lore.kernel.org/linux-renesas-soc/CAMuHMdVB9XMAaMDnKrRzkqvhFugrDGmj=00Vh5sDQT-idnA7DA@mail.gmail.com/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
