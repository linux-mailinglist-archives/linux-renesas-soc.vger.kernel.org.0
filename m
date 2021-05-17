Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C227382985
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 May 2021 12:09:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236264AbhEQKK6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 May 2021 06:10:58 -0400
Received: from mail-vs1-f52.google.com ([209.85.217.52]:36538 "EHLO
        mail-vs1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236224AbhEQKK4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 May 2021 06:10:56 -0400
Received: by mail-vs1-f52.google.com with SMTP id d13so2828305vso.3;
        Mon, 17 May 2021 03:09:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e6iGJcGcTtYBC7B9R84xOrj6qAa4tF3fGN/GCOKLHbU=;
        b=fOWOOhoq8mfwtjP5wmBdIDt1ZarUE5PM1dMp53jiPk4AgJKxaYgVfD5fOhQB5vsm3J
         hByT34pEe4zI5pQ9d5R3ZAkO8YfWfbPhiYP+xDFNQjSyPbB+XtV7ahJAAIbV7cnz68Ia
         hGrPTnZBoU/hSXZcdLlRJDWd4elSNmVVdGMj6YGOKvlu9Hstgtt3ACjluhyZK/wg/HEy
         RhxP+FffdpNj9RqGqjmvxqUldUjCT+NjArhUXDJ/AcxHzlPT1kvGdKQF04HXNGnhyana
         n0cclH9xa4b2UAGrP8Obl4IuzoHebd8682eeiLDnyVEyLV7cPp/LwzRqBDen1JLOB3Pb
         JjNw==
X-Gm-Message-State: AOAM533CnWACYL7wGDTZ4He5y55UWJ4afDe3KGB1zIHUbdCM2L52HzNr
        gWTs4o+Jicor/T4VaT+fKvXRn4rYFDWFn5QqS4Q=
X-Google-Smtp-Source: ABdhPJx4hV6xEa6RglTPK6Qyvqqt6ANlmCYxeq/e5G5A1AUa4NWnqYRm++zrYEcRGiB4xDeEHITlHLT3VYwOoeQ539U=
X-Received: by 2002:a67:f84f:: with SMTP id b15mr9555646vsp.40.1621246167982;
 Mon, 17 May 2021 03:09:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210513114617.30191-1-aford173@gmail.com> <20210513114617.30191-3-aford173@gmail.com>
In-Reply-To: <20210513114617.30191-3-aford173@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 17 May 2021 12:09:16 +0200
Message-ID: <CAMuHMdXB=R_CZ-tdzbdcVsGtgUoYU7LTmaSeErcLzHuAUm+-Lw@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: defconfig: Enable usb2_clksel for rcar3 and RZ/G2
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Adam Ford-BE <aford@beaconembedded.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, May 13, 2021 at 1:46 PM Adam Ford <aford173@gmail.com> wrote:
> There is a clock driver that's needed when using an external
> USB reference clock called usb2_clksel.
> Enable it in the defconfig.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.14.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
