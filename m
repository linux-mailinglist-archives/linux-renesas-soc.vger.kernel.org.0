Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30C1930009E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Jan 2021 11:49:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727151AbhAVKo7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Jan 2021 05:44:59 -0500
Received: from mail-oo1-f46.google.com ([209.85.161.46]:41290 "EHLO
        mail-oo1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726652AbhAVKmb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Jan 2021 05:42:31 -0500
Received: by mail-oo1-f46.google.com with SMTP id q6so1286296ooo.8
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 Jan 2021 02:42:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cCqDECWSPxLoJvJvjuT5TKAssuuUitlDG6tt7Evyysg=;
        b=or5z2SBVQYcpwQ9NaTvntAdIruZKzdYduRYst4JlYCbZcmJ2QKHjXBBMY6mGb1Kh/w
         DkhIB/X6t1IPaNgh9bxnmg/BAHovzCAEq+p8i1LDr09KKFNdV/xPNb9GN8zmqUgrUASX
         LzXt+O6+NxFucnTfChZaTxJlxb9n/CTvwAsj0lpq+wvG0C3oljPUlh2HPBoKW5nspGH4
         fjSxFDSBx+OKQFsJm/hKxOcRpr4FFbKpMmNTpQJ+9gcDvcvc262iCcajXWrJMKkv6/A2
         R/JmTN7YxYa3MsC/vQewsmBpb8xPNlSFH1JzE0QZJzreD9c52DMKMViEmVOMRrrq6px7
         u23Q==
X-Gm-Message-State: AOAM5331Q0DQcI2WP8aieeiEyLcKw6bUyzi6lJSBwBazuyKHYb2aWujX
        Wpn4cemiJjYp+vEiD9LbjJPMmDnyyEIU8TLtIJth6rMW
X-Google-Smtp-Source: ABdhPJweu93AQ9g4ho/56bur/rWZ5+4tuE3TZ5FdIofpNh/gEmy/syaLobEnJmCC6nwkSjyUsPrH5mY9V55l47bNU50=
X-Received: by 2002:a4a:8353:: with SMTP id q19mr3253272oog.40.1611312111113;
 Fri, 22 Jan 2021 02:41:51 -0800 (PST)
MIME-Version: 1.0
References: <20210121110008.15894-1-wsa+renesas@sang-engineering.com> <20210121110008.15894-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210121110008.15894-3-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 22 Jan 2021 11:41:40 +0100
Message-ID: <CAMuHMdVwpVNCkiogLmFeVP2L2-WH8N0mks_rjivC-_bOxVmspQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] arm64: dts: renesas: falcon: add SCIF0 nodes
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jan 21, 2021 at 12:05 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> SCIF0 has been enabled by the firmware, so it worked already. Still, add
> the proper nodes to make it work in any case.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> Changes since v1:
> * moved to Falcon CPU dtsi

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.12.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
