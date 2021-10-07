Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12F63424E0F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Oct 2021 09:24:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240311AbhJGH0n (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 Oct 2021 03:26:43 -0400
Received: from mail-vk1-f179.google.com ([209.85.221.179]:39852 "EHLO
        mail-vk1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232512AbhJGH0m (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Oct 2021 03:26:42 -0400
Received: by mail-vk1-f179.google.com with SMTP id m199so2314357vka.6
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 Oct 2021 00:24:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yMk1GJn4H2P2vcb2sbwmjIF8o6M1H7OQ16lJ3Dv902w=;
        b=2BRWNHxGj2rNk/pevDwZdcIN93brlOsP+VBJrJ1OYudcvL+ScMPLDhDnbvmRdo1OB0
         vBtiPfIbkYmlSe0RLApioyxm2PLcE6nzTKruJ8NL44fs9agy42arLWTOZhwQqNBblMhB
         6I/JliPE/LjtMjD0OYzpAWK0BqXKoHp6gFwUPO79fl+0jQZEYaadrcCRci8PwNdjiqaZ
         sxVoj7yUd5tCoPp8giO1Uo7qvYgbV7z6b7YjlyqoDqrJsIbnJWHTRQi+mBy5s+Vqiq4K
         kp+hnVwK6BpYkkB441gyriuha4HHqMFp6WFlQOiyTSEPT/okda6zA7qoMOIIZdAwbczC
         aKVA==
X-Gm-Message-State: AOAM530iiw4gW6zApnhn9THl15WFnhB8Ru3SzWt4EMj5xhZ6iTclAljR
        x6M75Ymwm/qLIR9SSXTfL+f0DtfCQLdnaKHyTK4av4uvVmI=
X-Google-Smtp-Source: ABdhPJwoM52IJMt75q5Vcnk+u049g9TGYZw+W0qmA51J7R1UYpnAqcwUzNe/4xiZI8iE3ztzlpBai5OY4e82d0kePY0=
X-Received: by 2002:a1f:1841:: with SMTP id 62mr2110495vky.26.1633591489180;
 Thu, 07 Oct 2021 00:24:49 -0700 (PDT)
MIME-Version: 1.0
References: <87ilya4zv8.wl-kuninori.morimoto.gx@renesas.com>
 <YV5vB4c8J0xu2mOd@pendragon.ideasonboard.com> <87v929moad.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87v929moad.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 7 Oct 2021 09:24:37 +0200
Message-ID: <CAMuHMdUxXP86Z-2Tb8t4bK6aBfRT1Toj0jpruEEd8YbeDL+h=A@mail.gmail.com>
Subject: Re: HDMI isn't probed on v5.15-rc1 on ULCB+KF
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

On Thu, Oct 7, 2021 at 6:55 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> I'm not sure what is related, but I noticed something.
>
> This is OK case.
> DRM failed ? rcar-dw-hdmi was probed
>         ...
>         [    0.499485] gpio_rcar e6055800.gpio: driving 4 GPIOs
>         [    0.511240] SuperH (H)SCI(F) driver initialized
>         [    0.512316] e6e88000.serial: ttySC0 at MMIO 0xe6e88000 (irq = 123, base_baud = 0) is a scif
>         [    1.465894] printk: console [ttySC0] enabled
> =>      [    1.476935] rcar-du feb00000.display: failed to initialize DRM/KMS (-6)
> =>      [    1.485684] rcar-dw-hdmi fead0000.hdmi: Detected HDMI TX controller v2.01a with HDCP (DWC HDMI 2.0 TX PHY)
> =>      [    1.496248] rcar-dw-hdmi fead0000.hdmi: registered DesignWare HDMI I2C bus driver
>         [    1.535173] loop: module loaded
>         ...
>
> This is NG case.
> DAM failed. rcar-dw-hdmi is not probed.
>
>         ...
>         [    0.490286] gpio_rcar e6055800.gpio: driving 4 GPIOs
>         [    0.501956] SuperH (H)SCI(F) driver initialized
>         [    0.503027] e6e88000.serial: ttySC0 at MMIO 0xe6e88000 (irq = 123, base_baud = 0) is a scif
>         [    1.432046] printk: console [ttySC0] enabled
> =>      [    1.443177] rcar-du feb00000.display: failed to initialize DRM/KMS (-6)
>         [    1.481426] loop: module loaded
>         ...

Note that in both cases feb00000.display failed to probe first
Is this an fw_devlink issue, due to HDMI linking to DU in DT?
Does it work with fw_devlink=permissive of fw_devlink=off?

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
