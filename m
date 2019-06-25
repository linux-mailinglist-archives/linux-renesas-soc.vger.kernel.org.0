Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B5B555028
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jun 2019 15:23:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727001AbfFYNXh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Jun 2019 09:23:37 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:40479 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726707AbfFYNXh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Jun 2019 09:23:37 -0400
Received: by mail-ot1-f67.google.com with SMTP id e8so17196404otl.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Jun 2019 06:23:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V/HoNCBy6oaaKzj/AJjkqXaJhdI4AhH9UXxBfsvy6QM=;
        b=FyCXxc519bjk4L0HlESKeY7Wbu9/gLrQvSWmXmYerpz+178hycsCmzPvJZJ60uWWnT
         2R+Pvt6LpBgSp463opx9+GHyDhPkRBQfLQ6kKNrHZiHHfocsoZQQQW4P4QdSKqNk5ZeB
         x3DdnY0jtdIWH2FACWQOXJHwmuQDfe2aMrr91YfrvwW7UXYxKoTzbcepmIlLOwO/FlCH
         PPBqsxqWI/GX0voKtnt/oUW7g2c9QAJdzQO7M6SVtB546G2hDPyHgLlv5Baxsl9+h40O
         7UNMQbJX5CaPdk7CyXxnuoylEwn7tviIvqW/OOv0YOIyHc51a/8kjYt0Khf6VODH63v1
         TqnQ==
X-Gm-Message-State: APjAAAXh+rk2cXTqzRF0iwi1BPzl9se+emv7gA0uq3B4ddTdzZ3Tgoq6
        Tc3EYQtUabvbsrublSdNjA0cwRQ3hFp8km8LCIr9KpVo
X-Google-Smtp-Source: APXvYqwCh+xqlirpWox1xCYMlxP741knDKudJm0tvoxCfTOQbqPl8UcUqa7otd/VmaNSbjNiooF5BU1EPzx+vu0mf10=
X-Received: by 2002:a9d:2f03:: with SMTP id h3mr91466602otb.107.1561469016656;
 Tue, 25 Jun 2019 06:23:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1561105093.git.horms+renesas@verge.net.au> <20190625124924.ubpi3pxwggbz5cbw@localhost>
In-Reply-To: <20190625124924.ubpi3pxwggbz5cbw@localhost>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 25 Jun 2019 15:23:24 +0200
Message-ID: <CAMuHMdVj5G6-m9iqQQM5nAQZbhC=GL0DtgUKXff7UBQ8uNwmBw@mail.gmail.com>
Subject: Re: [GIT PULL] Renesas ARM Based SoC Updates for v5.3
To:     Olof Johansson <olof@lixom.net>
Cc:     Simon Horman <horms+renesas@verge.net.au>,
        Arnd Bergmann <arnd@arndb.de>,
        Kevin Hilman <khilman@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        arm-soc <arm@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Olof,

On Tue, Jun 25, 2019 at 3:10 PM Olof Johansson <olof@lixom.net> wrote:
> On Fri, Jun 21, 2019 at 11:12:04AM +0200, Simon Horman wrote:
> > Oleksandr Tyshchenko (1):
> >       ARM: mach-shmobile: Don't init CNTVOFF/counter if PSCI is available
>
> Merged, thanks.

Thanks!

> Note that in this patch, code like this:
>
> +#ifdef CONFIG_ARM_PSCI_FW
> +       if (psci_ops.cpu_on)
> +               need_update = false;
> +#endif
> +
> +       if (need_update == false)
> +               goto skip_update;
>
>
> Can either be replaced with a goto under the ifdef, or at the very least, no

I believe a goto under the ifdef may cause a "label defined but not used"
warning if CONFIG_ARM_PSCI_FW is not defined.

> need to do a 'need_update == false' -- 'if (need_update)' is sufficient.

Yeah, "if (!need_update)" would work too.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
