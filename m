Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A27C2B6AAD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Nov 2020 17:49:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727362AbgKQQtV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Nov 2020 11:49:21 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:45648 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726392AbgKQQtV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Nov 2020 11:49:21 -0500
Received: by mail-ot1-f68.google.com with SMTP id k3so20022224otp.12
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Nov 2020 08:49:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bNQM+XlRSZY+7syVBd9iCgqMQr8WChLyW2GaEuXsTTs=;
        b=K5qpyQRfiOYfilY68Ay9ZoYavJkOpIWHXwD7jibSLSji2/wGMEUGg7xSvhghYB6+7k
         YoqNaok+k/r39VgqBVHdHWWGEZd4ts0iXTsME/Uadrr04mGdmbgTAnNZEWU9amtbw+4q
         /dZEqLrCWoC80Cy7/k5cZlH8YCJvgFJBCXLTIoGZR3BQJW0u844MPDy7cbakaTbrj8WT
         S1VpEiVWWn77RAtT2D3lUfDoe26vekDWKKTTLRhua79VJ8R1ZAt7g9GMMNqb9/A1rTWV
         FbVbun2/0V0BrseBMDmGTLid2W6H+wfhWr92cIhn6kFF6ckX+zzOOwQR9c06U0dGyOtb
         sCXA==
X-Gm-Message-State: AOAM532EnM7yzNMsdECX7eTECKc4yQLdaS7sfcmCyn8bx8fkJ7qqy4Mr
        pjgQldioEvxhwosOx1hTiK8rB2x44HLrJyH/oAM=
X-Google-Smtp-Source: ABdhPJxZuaz704cqPwDuaI1cDbYn1f+holXn2QSYrwPiIube5bAv8NIBzlSFxXnRWqfiuWYv5rrhR7R0gnhZIWwzaL8=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id u26mr3715809oth.250.1605631759343;
 Tue, 17 Nov 2020 08:49:19 -0800 (PST)
MIME-Version: 1.0
References: <20201117103022.2136527-1-geert+renesas@glider.be>
 <20201117103022.2136527-3-geert+renesas@glider.be> <CAK8P3a1CAmC3=QFA1EryDsx0aR-OF+=mf=Xj9cPrObe+qRoJKQ@mail.gmail.com>
 <CAMuHMdWTuzxg-a0f5MfPN=66EXcEqLfHCQMhiSAWH04p1BQ2ng@mail.gmail.com>
 <CAK8P3a363pGBYAyGgV1r+evpNk9Cpcu-vE++s7Ma4YB25AW+yg@mail.gmail.com>
 <CAMuHMdVFRXMcOgv5Qa6QgEAKsU31sKDBsTPs6ONdSqLAQZShow@mail.gmail.com>
 <CAK8P3a3QZJjV99Oo=GytUc3q3RkSrtccTC12Vgd=E=UByFX7ZA@mail.gmail.com>
 <CAMuHMdW6aw2M=SiV_pr6oQWaQRDcb9O2P8GRg_WRTjcpL5i4mA@mail.gmail.com> <CAK8P3a3bgbm29z8L66kYo25yKP2EKKLhVZSjS-mcYTO4J2m70A@mail.gmail.com>
In-Reply-To: <CAK8P3a3bgbm29z8L66kYo25yKP2EKKLhVZSjS-mcYTO4J2m70A@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 17 Nov 2020 17:49:08 +0100
Message-ID: <CAMuHMdVeRXbhzGit7y2OHJxbJpO5zOurF=We31KLnu+iMJOBng@mail.gmail.com>
Subject: Re: [PATCH 2/7] ARM: shmobile: r8a7779: Use ioremap() to map INTC2 registers
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Arnd,

On Tue, Nov 17, 2020 at 5:37 PM Arnd Bergmann <arnd@kernel.org> wrote:
> On Tue, Nov 17, 2020 at 4:52 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > Doh, and even Debian ports doesn't support armeb anymore, else it
> > would just be a debootstrap away...
>
> Debian actually dropped all big-endian platforms other than s390
> now, the last other one was mips32 (mips32el is still there for the
> moment).

I did mean "Debian Ports", which still supports a few more. But no
armeb.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
