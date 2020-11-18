Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0DE42B7902
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Nov 2020 09:45:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726158AbgKRIoa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 Nov 2020 03:44:30 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:41535 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726107AbgKRIoa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Nov 2020 03:44:30 -0500
Received: by mail-ot1-f67.google.com with SMTP id o3so996880ota.8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Nov 2020 00:44:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e6PDnLKKp1aKQm5bhqotcSOw3JYpOImhgeaen/hHwbw=;
        b=hLMQFf8f+S3sxoQMhMReJxGm+YL1tr4tSjFG/TW3t/Xh8rQP8QMy07OpaKnmlRLrFv
         OMt/osxBOaj5Y4bWzC2ju8xK/VBlK2qQq/PrB2Z+qUN5kKK7MuRefVxyGewWZKew9vD9
         77YeQWbV5m/2c+1Xi+V4VBE10oWqhwAwyLZ9etKWQCxbBENs1hG6wPIWloWGDVKOsujS
         M8TmIuPrhtReyxxgdZVYGq48ZjJ9fR2UKx+oLY1grR0ByiI3OWC6nQKE/eYcFdwsnd1M
         Pa7hhFkfqrlnGz5yzuCWhd6w0twyhnwYxdkoqo48LbxL51660lcDdNFHh/nPEnRrxaGV
         eVEQ==
X-Gm-Message-State: AOAM531qfw07SjPVeT8metz2YBrickqlN4DHpY7hI1lm+ot0rcBaIupC
        PoIAqNlCHH1QqRA/6YfSQwBt9je8zoZWKSr9ISA=
X-Google-Smtp-Source: ABdhPJz4WNFuTcFkuSfJvhGa1w+rbuzT1mbt7eFn2QkxA0a6opYhjksrO8IYBqkKBvBsh+QdJjFULdM4dZBCKfq3eVY=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id u26mr5978448oth.250.1605689070002;
 Wed, 18 Nov 2020 00:44:30 -0800 (PST)
MIME-Version: 1.0
References: <20201117103022.2136527-1-geert+renesas@glider.be>
 <20201117103022.2136527-6-geert+renesas@glider.be> <d46368c6-5528-e39f-663a-950e026b84e4@gmail.com>
In-Reply-To: <d46368c6-5528-e39f-663a-950e026b84e4@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 18 Nov 2020 09:44:18 +0100
Message-ID: <CAMuHMdW7Auao=4YMxaY+19qUPciY+vCd+cJeOUHM0+4Bu3ZKDQ@mail.gmail.com>
Subject: Re: [PATCH 5/7] ARM: shmobile: sh73a0: Use ioremap() to map L2C registers
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sergei,

On Wed, Nov 18, 2020 at 9:32 AM Sergei Shtylyov
<sergei.shtylyov@gmail.com> wrote:
> On 17.11.2020 13:30, Geert Uytterhoeven wrote:
>
> > Replace using the legacy IOMEM() macro to map the L2C registers by
>
>     Mapping? Else it doesn't rhyme. ;-)

Can you please elaborate?

> > ioremap().

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
