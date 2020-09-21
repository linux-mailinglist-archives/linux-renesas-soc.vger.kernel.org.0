Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE00B271C04
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Sep 2020 09:33:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726674AbgIUHd1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Sep 2020 03:33:27 -0400
Received: from mail-oo1-f68.google.com ([209.85.161.68]:44905 "EHLO
        mail-oo1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726460AbgIUHdX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Sep 2020 03:33:23 -0400
Received: by mail-oo1-f68.google.com with SMTP id 4so3001611ooh.11
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Sep 2020 00:33:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ij7nGsY2ppiYYOkdvuHCCyvl2KfNbwDSWE3IsKM139k=;
        b=rG7G6mRKVLJqGtRpzu4EKQ1u0BdyP0RcULxSzggYg6mb1TzV/zt0k3NUrq7KA/3JP3
         gn8wELuaO6ysm9ki1Wwycm0e5SmV3rus880+TkVFyy/yMNsGNUQBVhJyIp7WpeRaUcah
         deZQLd6Z+QNpqAYx8gzcSwmkM/EeqcQvSr4oCe/t12o28kOeY6M79lJtEJSkih9H6etS
         WjrVmIo54idXXA/ZGy7p7PexIEYBVURW30xOOW4L8pBJWak5OwjjiNSYf5+zBnChfd6Y
         fidDMYFJjjm6MWcoTQ5xILWzd7RIneFJOb47yvMOfvzBqw6U/dFlKVQZaNEup1dUhhME
         KeGg==
X-Gm-Message-State: AOAM531f7mvPkGiH+LrMuLOYajBLDfAmOyrOK+M4bo7egI4l8LX/qe1j
        juACKU3HubsSagvEmkPbv5LYNujd2s+eEiPDlaspo+XC
X-Google-Smtp-Source: ABdhPJxMbilZ/XjuTrzkVGjbfkHD4ovt9JlN3pTfYtcAdX6GA7sonLKGdnfzrNqCwp1WrXP8ghhMWiJa9Fd14tGVk0c=
X-Received: by 2002:a4a:da4e:: with SMTP id f14mr32117652oou.40.1600673602767;
 Mon, 21 Sep 2020 00:33:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200917132117.8515-1-geert+renesas@glider.be>
 <20200917132117.8515-3-geert+renesas@glider.be> <1517062461.1109038.1600508214011@webmail.strato.com>
In-Reply-To: <1517062461.1109038.1600508214011@webmail.strato.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 21 Sep 2020 09:33:11 +0200
Message-ID: <CAMuHMdXX7x6JxqeeHtCOw6N6WKBU7RH7_2LKndfKdq2PjxNOTA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a774c0: Fix MSIOF1 DMA channels
To:     Ulrich Hecht <uli@fpond.eu>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Uli,

On Sat, Sep 19, 2020 at 11:36 AM Ulrich Hecht <uli@fpond.eu> wrote:
> > On 09/17/2020 3:21 PM Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> > According to Technical Update TN-RCT-S0352A/E, MSIOF1 DMA can only be
> > used with SYS-DMAC0 on R-Car E3.
>
> This patch changes the file for RZ/G2E, though. And that's not mentioned in the cited document.

Thanks, that's correct.  We know the issue is present there, too, and
that the RZ/G2 documentation has not been updated yet.
IMHO no need to keep known bugs alive any longer.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
