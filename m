Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A0BC46CFF6
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Dec 2021 10:21:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230465AbhLHJZI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Dec 2021 04:25:08 -0500
Received: from mail-ua1-f47.google.com ([209.85.222.47]:41475 "EHLO
        mail-ua1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229790AbhLHJZH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Dec 2021 04:25:07 -0500
Received: by mail-ua1-f47.google.com with SMTP id p37so3519998uae.8;
        Wed, 08 Dec 2021 01:21:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AJbmhj4eWMw1lZbO6dimA8qjCdGVkEzWBq+1xeChlaM=;
        b=L5dAJYXjTo4o2GBfTVMHmH6o3JiBjr0aJLi/WgP6rhq6ObB5VDrROxVOBFyLfTh8ms
         LCtbEiq8Ej8uuwqK2bZ1VJmSLNHYKXL6MZpJyfuPUBbIoZCKxOSFAjHHeKK+pvzw1+cT
         vPUSARh2t4m606upwJl79+vTfijTid3a7LFaimezABYoGMgv2yzkD3BKPjd/7Y9aoJMB
         AgsmyOaa/MA91qJLLQX5Ksyfg4XhewCYcALw5fo82PTJcQkJXQBfZDdSBLye/H8EvDq+
         GaWoFcnJs5SSsJNoHWHAZlGlffVmFT5eBKdju4mVKCFvTjD5uRAImza8+wBpVUX4FdUk
         n/PQ==
X-Gm-Message-State: AOAM5301CJnv6Jr19Utj5olvK7eNL25LN00FLm3mMyQVyhoj46Xo+DPM
        5puwSX1+hHZ9IWodI85X5BqxuEtXOUImLA==
X-Google-Smtp-Source: ABdhPJwoJa9cQ2YspMyjnCnqp0EDjkjy+DECmO5aRkuxahIkhH8J4HALrRcG/UeEjksx6HxNGH/luw==
X-Received: by 2002:a05:6102:736:: with SMTP id u22mr39643541vsg.21.1638955295499;
        Wed, 08 Dec 2021 01:21:35 -0800 (PST)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id y7sm1473060uac.3.2021.12.08.01.21.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Dec 2021 01:21:35 -0800 (PST)
Received: by mail-vk1-f180.google.com with SMTP id b192so1157895vkf.3;
        Wed, 08 Dec 2021 01:21:34 -0800 (PST)
X-Received: by 2002:a1f:9f04:: with SMTP id i4mr58636365vke.33.1638955294826;
 Wed, 08 Dec 2021 01:21:34 -0800 (PST)
MIME-Version: 1.0
References: <20211116074130.107554-1-yoshihiro.shimoda.uh@renesas.com>
 <20211116074130.107554-16-yoshihiro.shimoda.uh@renesas.com> <CAMuHMdVZrGdwKnN=VKTiGp_Vj6CXgE=G_1OfDf29wHGd22q=Tg@mail.gmail.com>
In-Reply-To: <CAMuHMdVZrGdwKnN=VKTiGp_Vj6CXgE=G_1OfDf29wHGd22q=Tg@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 8 Dec 2021 10:21:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUyRt4cXzJ-dC9Z5unCZq2CfDsDrUQNckWXP2gxcsDAcw@mail.gmail.com>
Message-ID: <CAMuHMdUyRt4cXzJ-dC9Z5unCZq2CfDsDrUQNckWXP2gxcsDAcw@mail.gmail.com>
Subject: Re: [PATCH 15/16] arm64: dts: renesas: Add Renesas Spider boards support
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Takehito Nakamura <takehito.nakamura.nx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Wed, Nov 24, 2021 at 3:06 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Tue, Nov 16, 2021 at 8:42 AM Yoshihiro Shimoda
> <yoshihiro.shimoda.uh@renesas.com> wrote:
> > Initial support for the Renesas Spider CPU and BreakOut boards
> > support.
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > Tested-by: Takehito Nakamura <takehito.nakamura.nx@renesas.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> (assuming memory size, extal clock frequency, and serial console port
>  are correct)

(with the schematics)
So the console is actually SCIF3 pinmuxed to the HSCIF0 pins on the
Debug Serial USB connector on the CPU board?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
