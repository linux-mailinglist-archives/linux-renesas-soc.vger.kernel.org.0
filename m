Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BECF1423AD7
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Oct 2021 11:49:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237637AbhJFJut (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 6 Oct 2021 05:50:49 -0400
Received: from mail-ua1-f52.google.com ([209.85.222.52]:43986 "EHLO
        mail-ua1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229824AbhJFJur (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Oct 2021 05:50:47 -0400
Received: by mail-ua1-f52.google.com with SMTP id w2so1310670uau.10
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 Oct 2021 02:48:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1nBtBpm8ePKoFN3F2kx4Cc2edH3DD4Pttn4sm4Qepo8=;
        b=ermFDlxhazGL1ZuYnM0sPFCOmJiAeuBDPXiej8iaPqTSZz83RrkAjhMnqEuQTR66gy
         sdfKi0yUQoRHCyi+LLFcLJ933gYEDfRfwWWJwvMeCzudUSsnjLT/s2DEBN9SOjLm6rn6
         dsteGi5RRWXSasB9aOCA3LBkuvup734FKqPNMp50G3JMlYdKKTzdg99cO+vzaWnBGpmo
         wHfgsJpvqo9BqhdnGXNOUVG6c86P9vmxPUEh1gTntzNzHgieGf7rD5Uc9oS8/K/JF1ZU
         Uz/iUXlymPC5hqdFjgJZNZQUgFYFn7fCR37iFTgjJzi72ziC3sNb7+KzGrz7ztHai601
         d5hg==
X-Gm-Message-State: AOAM531/lo+t0Xr4Yj87QN+bgIrBtucyfQJMpPp7I5IO24PG8ROlx83a
        O7w9ci83MAaSEDCKesXB9AyDODtoHBT8NC45VHr2OFzA
X-Google-Smtp-Source: ABdhPJxTqeo59ZWHQES/oDpJUCMZ50wPnT6hHInCpszro/cLSw3LlxiSRKG6Vfe0cAC+hW7GePiU5KaiEu7v+VjMZ9E=
X-Received: by 2002:ab0:540d:: with SMTP id n13mr16879284uaa.78.1633513735226;
 Wed, 06 Oct 2021 02:48:55 -0700 (PDT)
MIME-Version: 1.0
References: <20211006085836.42155-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20211006085836.42155-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 6 Oct 2021 11:48:44 +0200
Message-ID: <CAMuHMdVWLtnvoyw_7q3e+C3cMsyWyqt=hznugtUVDn+wnUxchw@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] r8a779a0: add RPC support
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Wed, Oct 6, 2021 at 10:58 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Here is a series with clk and DTS updates to enable the RPC unit on the
> R-Car V3U SoC. Important: If you want to test it, please use this
> branch because it contains a patch which avoids data corruption!
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/v3u/rpc
>
> The patch fixing the corruption is now applied and in for-next, so this
> series dropped RFC status and can be applied, I think.
>
> Changes since v1, all in patch 4:
> * increased the boot partition size to contain the bootloader
>   environment as well
> * renamed "boot_partition" to "boot" (Thanks, Sergey!)
> * removed leading zeros in reg properties

Thanks for the update!

Will queue in renesas-clk/renesas-devel for v5.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
