Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C9BB3474E0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Mar 2021 10:43:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232578AbhCXJmp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Mar 2021 05:42:45 -0400
Received: from mail-vk1-f182.google.com ([209.85.221.182]:34707 "EHLO
        mail-vk1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232724AbhCXJmh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Mar 2021 05:42:37 -0400
Received: by mail-vk1-f182.google.com with SMTP id j15so5304968vkc.1;
        Wed, 24 Mar 2021 02:42:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uTa3qcH8xY0ymAKQ1SS82CdjrmkKpFgPyzAvTe69dMk=;
        b=PDKYNv5+NdZraUQgH1WAXJcEZKEWYYqI2UTSReK8c2xewYHlVtU5m0emx8As0qlmQ4
         MW5n/mHzASSy7JzBr+OHE54u63A+WNrR7ojslK7L4Aiip6NY+ZgrjGVPpeL9VpGa15w6
         i9VAlG1SqdnGsrKEjIY1DoK22ip5E1519zuJ26LT06gzpze2yIBnjLNyhijdZVYDr3vX
         PPs5jjKOACu5KM3wO9HCH0WY5muYR+cGBpndDxGqG9R34o+RKjBgzczOeXsDzTMmyD/h
         i8J3fALumQQY+tAQohM01DLUMI3Nrxy7srR1L3gdfPbDZulGAu5t8mJpi1Ih2Xs4lF4/
         EDqQ==
X-Gm-Message-State: AOAM530AvnioWkTBuWNTj6jPtJGmEDh2Toekaiyy90pWVUdbL66EITyS
        j3pmpK1Hk3GBXKmw3kq94sAldr0qLg55d0dbCqo=
X-Google-Smtp-Source: ABdhPJwO5caj4lj5o4nn5BtbfCAhNkQAu8ZO6C/WVbL+w1h9d5mLBYViz0c6DBWXQUCtZr8rGzQzc+54RrH+gkoykGQ=
X-Received: by 2002:ac5:ce04:: with SMTP id j4mr884148vki.1.1616578956471;
 Wed, 24 Mar 2021 02:42:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210321075813.9471-1-unixbhaskar@gmail.com>
In-Reply-To: <20210321075813.9471-1-unixbhaskar@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 24 Mar 2021 10:42:25 +0100
Message-ID: <CAMuHMdXxvq2uUJWuYJQFDqPzMU1hCWWtemjSS73VsJON4npBkQ@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: Couple of spelling fixes
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc:     renesas@glider.be, Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, Mar 21, 2021 at 9:03 AM Bhaskar Chowdhury <unixbhaskar@gmail.com> wrote:
> s/suposed/supposed/
> s/concurent/concurrent/
>
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.13.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
