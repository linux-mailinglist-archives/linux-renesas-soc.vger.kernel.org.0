Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33AC92B673F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Nov 2020 15:22:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728441AbgKQOTl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Nov 2020 09:19:41 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:40668 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725355AbgKQOTl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Nov 2020 09:19:41 -0500
Received: by mail-ot1-f65.google.com with SMTP id 79so19492099otc.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Nov 2020 06:19:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8aX8cJWUQlGtPRXLBAScF8/8UyyxOEmT2BQYCmtkiII=;
        b=V4sRcXJW9QJ2rMIagiKd8t0wsiRhmPtignDfqv9IS2Z+fKa26ajllgmi8Kob2kXPW6
         X6VStyvQJ35/Xfq2L4sezY1+qH16cmDIYmt9stGaEVKyviLCB/6JVhC4oG7oIjP6ZoU+
         7aOB5EpBtmyR7CnoT0U2TqKMiCrD26C4XTWGUxebyz8AEoRtYPKqSnpTfalOmsSLrpzP
         W0VEgd/sOF/bfVEUtZYs6f0R2yWw+Kre/zWzFSfE0bic7btA6Ak716qXljyqKCIpSNPy
         ImaVDJ+HshUM7HcUJgC2/Dq1aWZI30Od9w0EBpwbztur2p7t6yu2fuV4barfyFHj8YAV
         CodA==
X-Gm-Message-State: AOAM531F19LzMRCKHKsD59Ns6jjjlOunAMqoKgToC/muNRBbHGpEQMHU
        XBuAOYUNTlIC2HzRbsYnk0awGBRVGeTpSx0YGBk=
X-Google-Smtp-Source: ABdhPJxbAAYaQvH/F9UV63z5hDF7kwGgz1Kc11sUXMLt9iAtGJp+VzlIn8VzbQAN409SvYVmccla/Zb5iyC5orsVZIk=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id u26mr3236555oth.250.1605622778879;
 Tue, 17 Nov 2020 06:19:38 -0800 (PST)
MIME-Version: 1.0
References: <20201117103022.2136527-1-geert+renesas@glider.be>
 <20201117103022.2136527-3-geert+renesas@glider.be> <CAK8P3a1CAmC3=QFA1EryDsx0aR-OF+=mf=Xj9cPrObe+qRoJKQ@mail.gmail.com>
In-Reply-To: <CAK8P3a1CAmC3=QFA1EryDsx0aR-OF+=mf=Xj9cPrObe+qRoJKQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 17 Nov 2020 15:19:27 +0100
Message-ID: <CAMuHMdWTuzxg-a0f5MfPN=66EXcEqLfHCQMhiSAWH04p1BQ2ng@mail.gmail.com>
Subject: Re: [PATCH 2/7] ARM: shmobile: r8a7779: Use ioremap() to map INTC2 registers
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Arnd,

On Tue, Nov 17, 2020 at 1:25 PM Arnd Bergmann <arnd@kernel.org> wrote:
> On Tue, Nov 17, 2020 at 11:30 AM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> > Replace using the legacy IOMEM() macro to map various registers related
> > to INTC2 configuration by ioremap().
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> The patch looks good, but since you are already touching these __raw_writel(),
> could you turn them into normal writel() to have a chance that this works
> on big-endian? It could be either a follow-up or merged into the same patch.

(Do you want us to support big-endian on these old platforms? ;-)

At your service. Seems to work well.

Note that there are a few more (arch/arm/mach-shmobile/platsmp-scu.c
and arch/arm/mach-shmobile/setup-r8a7778.c).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
