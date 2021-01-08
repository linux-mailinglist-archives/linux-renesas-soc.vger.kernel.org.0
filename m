Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A2BD2EF40B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Jan 2021 15:40:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726545AbhAHOjW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 8 Jan 2021 09:39:22 -0500
Received: from mail-oi1-f182.google.com ([209.85.167.182]:36189 "EHLO
        mail-oi1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726477AbhAHOjW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Jan 2021 09:39:22 -0500
Received: by mail-oi1-f182.google.com with SMTP id 9so11537617oiq.3;
        Fri, 08 Jan 2021 06:39:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Bpz/5v07gepyVfANz4PHoldK3BSK7NdMRxF7EjVhv08=;
        b=dOLXIqWzD+ge304B6Md9quqLZL1zJaYKZ3UDtfFJV8cOvK7uqVH5Ey9cZkMbR3o7Wu
         upC+Tt10HklHwK7bP9prGtz4jkJy6CLJj8PbwJaOMHyfXop1rTt0CzmT++1n0JUlHqe8
         hXz5oMMReWzVCzGu/H59VoakOLFyGyDkoZO1PKLmwizpITx1gLNiIkxppYK+d5v9HbZe
         KGO3DtihEmlDQMECCIzweJK95r0o7il09e3g4+EKXMjz1W7fxCeY4Pdy9zlLGD4/w6N8
         NAeeHOIb0gSuW1ePTPmZzYvCS157ujNM1Gz5nuCD1tbuaxAcfDueVyGQYnDEoVTP/4Cm
         JaAw==
X-Gm-Message-State: AOAM532AxXE1VbjMAl1LOXvK/v5Zg/93REc+BP58sCh3DdtBkQTHufoe
        dm95eIYzoJVPmmDhaRF9t9cMdrpf/dk/YlbbgZuiX9P9
X-Google-Smtp-Source: ABdhPJxjMf+9C+EF8dUxgu7Tavnto7pQJVJ461iqrdIAtKk6OChC+mvsNbbEaY4kbEm6ylgPsl45SND4WORr5TJWvd0=
X-Received: by 2002:aca:3cc5:: with SMTP id j188mr2542466oia.54.1610116721500;
 Fri, 08 Jan 2021 06:38:41 -0800 (PST)
MIME-Version: 1.0
References: <20210101113927.3252309-1-aford173@gmail.com> <20210101113927.3252309-2-aford173@gmail.com>
In-Reply-To: <20210101113927.3252309-2-aford173@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 8 Jan 2021 15:38:30 +0100
Message-ID: <CAMuHMdW5v3URiike=RDsAC8heRRUzYtt_Cjru_2H20ERDJ7Ymw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: rzg2: Add RPC-IF Support
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Adam Ford-BE <aford@beaconembedded.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jan 1, 2021 at 12:39 PM Adam Ford <aford173@gmail.com> wrote:
> The RZ/G2 series contain the SPI Multi I/O Bus Controller (RPC-IF).
> Add the nodes, but make them disabled by default.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.12.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
