Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FB7E2DCFE6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Dec 2020 11:58:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727160AbgLQK6M (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Dec 2020 05:58:12 -0500
Received: from mail-oi1-f173.google.com ([209.85.167.173]:45346 "EHLO
        mail-oi1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726631AbgLQK6L (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Dec 2020 05:58:11 -0500
Received: by mail-oi1-f173.google.com with SMTP id f132so31702477oib.12;
        Thu, 17 Dec 2020 02:57:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eQkdrhIP2aiUl23qHVM2K9iKhvGt/fv8jJNeYO3M4qE=;
        b=aHSYoafmU/AOQagCXs+PDzr8toav6V0V+m8aswfgOcRoZfS/tetAoDIjPUe1Xg9DV3
         kzKQnn0PKszQRSW8lIUSuliArwetH2NiSznMCZQR90WqtGxGPVaOY3HzF8dVXjp+Ci8C
         lw9ch0zrP0j3zUKw9S/7czpcMn9GkQEQ+0ADBM108HenuqfCYXUynI3tHCyrOtHjiX+L
         OIqB7PYmumd5ZYR7fIQ2grnXbpXOg/qViei0WDdlIsNhfxsbSMkViA41Yrf55TAc34M/
         JeiR4CQRCKzkXXjLKm+bytitrvQqXQL++2ZvXy5SxMBYy27+kiCYP2TAA+p+mr/9DAa9
         silQ==
X-Gm-Message-State: AOAM533yWHMKSMnj2zCoR/UmGWWS9831/v4zjQzlUqF6p+CSVJ3gjmLo
        X80qDJzUiX628QORflExMSZnANxxWQfD3Ie9szIAtyBq
X-Google-Smtp-Source: ABdhPJzOMTnOTCRYICkLN7OS/o/ANuqEzeLRQJO8fpTyKNl56t9KCsHZSgQN8r1qicwnbLK1oEsfJstpjqQEWdpfZ9Y=
X-Received: by 2002:aca:4b16:: with SMTP id y22mr4417118oia.148.1608202650746;
 Thu, 17 Dec 2020 02:57:30 -0800 (PST)
MIME-Version: 1.0
References: <20201213183759.223246-1-aford173@gmail.com> <20201213183759.223246-6-aford173@gmail.com>
In-Reply-To: <20201213183759.223246-6-aford173@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 17 Dec 2020 11:57:19 +0100
Message-ID: <CAMuHMdUXQ5wAFiqkTVJ8Cm6AC53hLRFL4mbqNrQw20yXiSaPog@mail.gmail.com>
Subject: Re: [PATCH 05/18] arm64: dts: renesas: beacon: Fix audio-1.8V pin enable
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Adam Ford-BE <aford@beaconembedded.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, Dec 13, 2020 at 7:38 PM Adam Ford <aford173@gmail.com> wrote:
> The fact the audio worked at all was a coindicence because the wrong

coincidence.

> gpio enable was used.  Use the correct GPIO pin to ensure its operation.
>
> Fixes: a1d8a344f1ca ("arm64: dts: renesas: Introduce r8a774a1-beacon-rzg2m-kit")
> Signed-off-by: Adam Ford <aford173@gmail.com>

Thanks, I have to trust you on this one, i.e. will queue in
renesas-devel for v5.12
(with the above fixed).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
