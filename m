Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DCE91AD7FB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2020 09:50:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729051AbgDQHu1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Apr 2020 03:50:27 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:40223 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729042AbgDQHu1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Apr 2020 03:50:27 -0400
Received: by mail-ot1-f68.google.com with SMTP id i27so723373ota.7
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Apr 2020 00:50:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ffNqVOSKxiRXb0dsJexnpAXHB4RNDE8PjqCBYegll4s=;
        b=rHmeriCrBf4qzCrnT2IYNNK0c/ZgGQjJ4SMosN05v38FzTakQhWLkK57GKXljL5Ekh
         ZlYOtilTL4Y9CdcQ+bNfdqYE/Xaftj7LyPNmQ3lOKrIBgnVVXIZzFQtn9smCwDE7NXvQ
         1iQ7gwvYAZRQzYYi0SlrfRv3mJyZ4ygWLphri704XRGRzXmXqjoKFQBie+fq4vlkTVW9
         AoCiMRvaSqY7uBJX9B4b2JimAwVb4z/tYAhM0tQ+wxr3F54bq5N2MMd5S0R33L0V6to5
         7rBlpK4vh89VJpMKYLnzZVK2CMF0kQ5q0hmhYyXoZpjl4bd1mylB9bh7FHcJ/wZi8AFE
         88jw==
X-Gm-Message-State: AGi0PuaQLPtD6OXtwdQ5MGd1/Qhyc1eN6zilLKo9DfYqVn9U1GlV9dlq
        j7spEwDXzbIzydhgeSI1wNBypwOqwN4JRRm1mcE0FQ==
X-Google-Smtp-Source: APiQypKqJlnu1h1WMMU4JoPyTb6iYptfq5WZmLEfz8jt9iWcaGMHmbFXWmQAmCqwtaOnVySqT4X08Ms8qQJ29mrzsX8=
X-Received: by 2002:a9d:6299:: with SMTP id x25mr1491456otk.107.1587109826174;
 Fri, 17 Apr 2020 00:50:26 -0700 (PDT)
MIME-Version: 1.0
References: <1587108543-23786-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1587108543-23786-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 17 Apr 2020 09:50:15 +0200
Message-ID: <CAMuHMdXbBczm-7pMS2bFZQ5GeYbFk0gHF+8H8aV0puP2x07ikw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77980: Fix IPMMU VIP[01] nodes
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Fri, Apr 17, 2020 at 9:29 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Missing the renesas,ipmmu-main property on ipmmu_vip[01] nodes.
>
> Fixes: 55697cbb44e4 ("arm64: dts: renesas: r8a779{65,80,90}: Add IPMMU devices nodes)
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for finding this!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-fixes for v5.7.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
