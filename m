Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D13DA1898A0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2020 10:55:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727611AbgCRJzd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 Mar 2020 05:55:33 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:35450 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726550AbgCRJzc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Mar 2020 05:55:32 -0400
Received: by mail-ot1-f66.google.com with SMTP id k26so24912041otr.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2020 02:55:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XJpTD+vvN7+5gG/V7nYWXN/sZKHSkwJB7TSrkjSO0CY=;
        b=kHZQjMGm4hTyqQ42B5reObylkGtoQD+oxq6O04WQNivA4WNYs92s9XGvgmcKh3qhtP
         2BPBE3wWNQ8UzrryxG2EhouLySodhiXErlA7yz9zHa2ZIgLeUDyTpkc6iD6Fl9Su+HHq
         q7F1j13E8pjJPZ2hGpa1qGE1J+YhFQJxG3pu4A+5GIlEvKWtcMXhCcjI9ZqFxsAGlFjq
         KbZHICz2F51NAcOnB5kDm31X9CdjGPTNxOxdyjiabyze8YfTemeKi1aEj1g6yi6zWkjb
         hJjksW05+6CkR24BSi7gYZFumN1p4iLcX1FR0EHnPG2IyXaKJXyXgIBlTErv3jc/+JSv
         /mAQ==
X-Gm-Message-State: ANhLgQ3WIiU+otukqETGzT9gXFFQPTTokuZ60zN5WSENynhTN589BvQU
        nbD/63lggHzGv+G4FC/yv+A1sy1uQLGmNxjK7FQ=
X-Google-Smtp-Source: ADFU+vvGy0+oxq8uO8Z4YMCKmDP/juSVykMTm/tgIXcFKGS5VE0uEGJkMoDEDQGLX3/vaXSaQJaKj+6FyJvPo+qILG0=
X-Received: by 2002:a9d:4d02:: with SMTP id n2mr2899790otf.107.1584525331920;
 Wed, 18 Mar 2020 02:55:31 -0700 (PDT)
MIME-Version: 1.0
References: <158452367157.23699.16109085564905174396.sendpatchset@octo>
In-Reply-To: <158452367157.23699.16109085564905174396.sendpatchset@octo>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 18 Mar 2020 10:55:20 +0100
Message-ID: <CAMuHMdXZNGMGE6h=dj_fFwDCumcowZt-vifyXBNb4gqOQWj+Ug@mail.gmail.com>
Subject: Re: [PATCH/RFC] arm64: dts: renesas: salvator-common: gpio-leds prototype
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Magnus,

On Wed, Mar 18, 2020 at 10:35 AM Magnus Damm <magnus.damm@gmail.com> wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>
> This patch adds support for a couple of LEDs on Salvator-X and XS boards.

Thanks for your patch!

> I've verified that LED4, LED5 and LED6 work by exporting GPIOs for GP6_11,
> GP6_12 and GP6_13 on the board on port 9011. This patch has not yet been
> tested though. Also to make matters slightly more complicated, even if LEDs
> might work with this patch as-is, the code in this patch is most likely not
> suitable for upstream consumption. This since SW20, SW21 and SW22 are also
> using the same GPIOs as the LEDs.

Indeed. I think we should add kernel support for sharing GPIOs this way,
before we can describe the LEDs in DT.  Else we'll introduce a regression,
depending on which driver is bound first.

> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>

As this matches with an old local patch of mine:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

However, I'm not gonna apply it, without a fix for the sharing issue.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
