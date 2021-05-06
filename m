Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E050D3753F8
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 May 2021 14:43:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230315AbhEFMoh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 May 2021 08:44:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229640AbhEFMoh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 May 2021 08:44:37 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2EF7C061761
        for <linux-renesas-soc@vger.kernel.org>; Thu,  6 May 2021 05:43:38 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id u25so6858266ljg.7
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 May 2021 05:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fbHWIIjNsb9wei3xXx6Otqpzu53zaXTIXIFKBmpNOgo=;
        b=Bgqg7sh9bCd5nshaNaWvRHui08dl/ZbqDnFZ0IJ97hliP13z/2GcIBrux/SLdwV0/i
         Km45HFsHhgWctbcGuGF6Ai0HvMZqIj6POZRSs6/PpSRACJl2PlFmLQU4hlC1yDovIWBg
         aoQtkENq3gxHz6laQ2nmHkKeFF5HDzsMB1hneI4Ds46GeucQ1zmRGYA3wLsnyxnSTV+p
         Db5TgOzJNR01i8q8ZcC7fzaKnTvJPicRUV9tY8zTJ3Fn3kGnBEhC16d3shmCkOArTBkz
         lLFzcth3mqWw7rRMzs4kvzsjIlgL1hnv1j22fv57T54QODE0L88yQ2jCksh+4ITE6+wH
         5VGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fbHWIIjNsb9wei3xXx6Otqpzu53zaXTIXIFKBmpNOgo=;
        b=UFWLu0Ch1VAjY2nJdEHZSrne5ijP9t4v1GQL1VgazWGuAkM7HGJsNhpUYgu+KDVvm4
         lv33yr2T+CufArLJssCVzwKv09Qggxf4dbLHyrnNKBZkkumrPBmMqYjQucTt8xUA9kzb
         CKHyaL0Cw+khpksos4rgDleXzz9WXmuziUkOUJG+KFgSfJHRt/nmKx+32DZsbwhkEh5T
         ZexxAW59TlcIW//AwNogqXWI8JqT6Jo2XeBShfeiAsXJBgV8/T/dX/AbqwyJIQVzQhAY
         84pWer6wIGOIohLSieQ/w05Tubaaua6EHi94ZLRGHYmZDh2gAySQBOKwMzTvvZwpHNap
         KoTQ==
X-Gm-Message-State: AOAM533L4pUBOLXOKnrbucIqzuuAggH6Y3tgK/9m2SJqYlU853zDnAmC
        hBvnfbEMpyG+UmS91JxkKoCOI9xzkfj2M8mZIbGb7+zE/lA=
X-Google-Smtp-Source: ABdhPJz4optDOZiBZ3vSZcVI8Py60XPMQCZzXNInCGDBXfYIu467P3Ej4pt6DNl0kP7Ihy/ZCeYrBXG2yJQ/QYMK8Ng=
X-Received: by 2002:a05:651c:503:: with SMTP id o3mr3172636ljp.368.1620305017299;
 Thu, 06 May 2021 05:43:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210317113130.2554368-1-geert+renesas@glider.be>
In-Reply-To: <20210317113130.2554368-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 6 May 2021 14:43:26 +0200
Message-ID: <CACRpkdb47SZ1npdp+MNiAz4WZZvfVZOeHcV3Scv5pK1QurT06A@mail.gmail.com>
Subject: Re: [PATCH v3] ARM: Parse kdump DT properties
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Russell King <linux@armlinux.org.uk>,
        Ard Biesheuvel <ardb@kernel.org>,
        Nicolas Pitre <nico@fluxnic.net>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Arnd Bergmann <arnd@arndb.de>, Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Lukasz Stelmach <l.stelmach@samsung.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        kexec@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Mar 17, 2021 at 12:31 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Parse the following DT properties in the crash dump kernel, to provide a
> modern interface between kexec and the crash dump kernel:
>   - linux,elfcorehdr: ELF core header segment, similar to the
>     "elfcorehdr=" kernel parameter.
>   - linux,usable-memory-range: Usable memory reserved for the crash dump
>     kernel.
>     This makes the memory reservation explicit.  If present, Linux no
>     longer needs to mask the program counter, and rely on the "mem="
>     kernel parameter to obtain the start and size of usable memory.
>
> For backwards compatibility, the traditional method to derive the start
> of memory is still used if "linux,usable-memory-range" is absent, and
> the "elfcorehdr=" and "mem=" kernel parameters are still parsed.
>
> Loosely based on the ARM64 version by Akashi Takahiro.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

I like the approach overall.

I see Rob has some comments that need adressing.

The chosen.txt file needs an example of how to use this so people
can intuitively get it right if they want to play with it, it was at least
the first question in my head: how does that look in practice?

Yours,
Linus Walleij
