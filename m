Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4AE62B7A45
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Nov 2020 10:23:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726020AbgKRJXM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 Nov 2020 04:23:12 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:32929 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725804AbgKRJXL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Nov 2020 04:23:11 -0500
Received: by mail-ot1-f66.google.com with SMTP id i18so1124497ots.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Nov 2020 01:23:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8kxS7s4is0R3FqkU/faX4elb5MyljxZ4bf3ee4DPd1M=;
        b=puqjqzoFvpGpUs5nfjY8ARDXypOLSGomAbIMlE+jB78k1QVOc3LYgW7N7z8kikxX2/
         3b5Pu0hHmjeB3ARKwHpSHixjO/RwcT5UkJBNWGfOV+Y5QZVEYPgzfRYaIJ4Uaq+DAjrI
         UiVRWZO8OwWZOAbXkp6fwgMFSlEUwiajZkWqbS5LOd7MF5DwS2+HhXKNwnTRTLT184ud
         LqepgHs7rPWjTr+EkdhJuuGWKIwdf5hq9rjMPJW+OOUioHCqfcqThj8V5wm7T+LDbClP
         trwpg6J89NDRe06fcZXMdT24d1M3EAE/jeri+vIFKgIOIMUO4yY6+e4xldAp7W9SfeoN
         59nQ==
X-Gm-Message-State: AOAM532VdWCXTokJJd9AkOZLwlRj4Er/wPf6od+t4nyhTHx978ws1dit
        4NIrwTmpoLbYhxGCpUkMi9gbuR11LPh3cWw1JTw=
X-Google-Smtp-Source: ABdhPJzN4W3cdQHcMc+MQ6wz2rUNcP1YzsB8b2X7E3R2rcMY+iXKOuodEuEAYV0yS8FOPMRboMajCk2a37lTw34qYWI=
X-Received: by 2002:a9d:5e14:: with SMTP id d20mr5604565oti.107.1605691390938;
 Wed, 18 Nov 2020 01:23:10 -0800 (PST)
MIME-Version: 1.0
References: <20201117103022.2136527-1-geert+renesas@glider.be>
 <20201117103022.2136527-6-geert+renesas@glider.be> <d46368c6-5528-e39f-663a-950e026b84e4@gmail.com>
 <CAMuHMdW7Auao=4YMxaY+19qUPciY+vCd+cJeOUHM0+4Bu3ZKDQ@mail.gmail.com> <d87571dc-cdba-2e47-c185-e5a9f8bdcbc7@gmail.com>
In-Reply-To: <d87571dc-cdba-2e47-c185-e5a9f8bdcbc7@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 18 Nov 2020 10:22:59 +0100
Message-ID: <CAMuHMdUQVg0HUYJ7DU_5SM72gweJzBia=5W1VV6FaxHj9y1ozA@mail.gmail.com>
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

On Wed, Nov 18, 2020 at 9:50 AM Sergei Shtylyov
<sergei.shtylyov@gmail.com> wrote:
> On 18.11.2020 11:44, Geert Uytterhoeven wrote:
>
> [...]
> >>> Replace using the legacy IOMEM() macro to map the L2C registers by
> >>
> >>      Mapping? Else it doesn't rhyme. ;-)
> >
> > Can you please elaborate?
>
>     Replace using ... to mapping ..., no? Or rather s/to/with/?
>
> >>> ioremap().

"to map" applies to "using".

"by" applies to "replace" (replace A by B).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
