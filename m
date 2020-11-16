Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BB622B3F43
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Nov 2020 09:59:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728307AbgKPI6n convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Nov 2020 03:58:43 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:40920 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728064AbgKPI6n (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Nov 2020 03:58:43 -0500
Received: by mail-oi1-f195.google.com with SMTP id m143so18032046oig.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Nov 2020 00:58:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=kJVrLUMKZ2/8WMJ9fdeqPUjfid+F1iyly8tS5wBmT64=;
        b=M79mT02cg0M3Y0J1NTRwCYx7F+m6eg9YTijatpEFeuYguYGCk8RPuN3RA4YzAM7CVr
         V3Z51pjAc026Js1vGPFG6XfAAQVUJ+4aDEcawbu4343vwgWsYA2KiLj4/ot4C7851/yq
         2BZgC8+/v5AeUYjCzgtVONYbRLzyG/WbxOuJx1EnBCri0fjzBIgJn7wrnQ7IfTFjtWMW
         unjXZOl1f/ztJq1AIuZUG7qv59Q4roE1QxDboBj86qyJSmcoDUArX6hwKD01sPUn9S0l
         a/kdLhOybBL6degOyfolR/m51VALvAfdWlAH4czTapJK4oFbN5ftwYFwXb6zibJKp7N8
         2uGw==
X-Gm-Message-State: AOAM533nhvGhcxMZ4Y4kJEBiIvNQ8fY0PoA8Ed+SANj5o6h18c7uebds
        JcqQpIpSlET9zyISKww6BpESsrIGx4PNDFru2Jta3BqW7Gg=
X-Google-Smtp-Source: ABdhPJxpyPfZptgjKcLDp1J7iyTFe3swBxieYw3JGloJxt0evQzTlxOwbLloobMWGXxlTGdRvmIKjzMjud4qRY4L6qY=
X-Received: by 2002:aca:4bc3:: with SMTP id y186mr8609980oia.153.1605517122670;
 Mon, 16 Nov 2020 00:58:42 -0800 (PST)
MIME-Version: 1.0
References: <20201110234752.52846-1-niklas.soderlund+renesas@ragnatech.se>
 <20201110234752.52846-2-niklas.soderlund+renesas@ragnatech.se> <20201111115531.kgp6kabpdwygxpn2@uno.localdomain>
In-Reply-To: <20201111115531.kgp6kabpdwygxpn2@uno.localdomain>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 16 Nov 2020 09:58:31 +0100
Message-ID: <CAMuHMdXpyLVPi9AOrFTOavNvW7CiNbx+xQEmgASzY2-sNyHnug@mail.gmail.com>
Subject: Re: [PATCH 1/4] pinctrl: renesas: r8a77951: Add vin{4,5}_g8 pins
To:     Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo, Niklas,

On Wed, Nov 11, 2020 at 12:55 PM Jacopo Mondi <jacopo@jmondi.org> wrote:
> On Wed, Nov 11, 2020 at 12:47:49AM +0100, Niklas Söderlund wrote:
> > This patch adds VIN{4,5}_g8 support to the R8A77951 SoC.
>
> Now that I've asked offline why the 'g' in the group name I see
> the reason which otherwise let me search for a _g group that does not
> exists in the documentation.
>
> Can you mention in this and other patches that the groups are 8-pins
> groups on VIN4/5 [15:8] pins, named 'g' as when capturing RGB they are

g8

> dedicated to the green channel ?

However, that is only true for VIN4: VIN5 does not support 24-bit RGB,
as it is only a 16-bit interface. Hence we need a better name than "g8"
for VIN5.  What about "high8" or "msb8"?
Any other suggestions?

The rest looks good to me, but a rebase on renesas-pinctrl wouldn't hurt ;-)
Same comment for the other patches.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
