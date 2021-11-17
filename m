Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9528454922
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Nov 2021 15:48:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230395AbhKQOvq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 17 Nov 2021 09:51:46 -0500
Received: from mail-pj1-f46.google.com ([209.85.216.46]:34459 "EHLO
        mail-pj1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230232AbhKQOvp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Nov 2021 09:51:45 -0500
Received: by mail-pj1-f46.google.com with SMTP id j5-20020a17090a318500b001a6c749e697so4541401pjb.1;
        Wed, 17 Nov 2021 06:48:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BIs4ngtAPVKRQ9sbESSE2zP05AbWJL0O2hDmkB8xMw4=;
        b=1fI9GMjZ9HuZakEJzVrKy6o+kRwMqOBY8sEngE0Xt3m3Cf/FPEmwCKoFV+xqbfnTCa
         4/ujegVRgkZ9c/zlCJxYp6pKZhACSN6t5bS678DfDpThv/nXyvreRF4avaeFJvE9GXDs
         dYprLWBAUNXFX3v+jo7TRvE7N2zSMU7JVmIZuWfN+o+72Obp8xIcomCiH501THv1QcKB
         BEmuZOXT9Guq/a1wvPLUuq/7x+6auJSXbOCAWb7wIctHrgtj+616EYcK34yP/HamHNcQ
         Ax4KbsapciiBdTJL9Vp8TySJ9Gyp97ohD1VTQ7aFOh8gYearFVE6e/BZeGD4nK0ZUTDD
         afaQ==
X-Gm-Message-State: AOAM533guUln/ETzVTYtHZ4YLZXYVl03vTtT01LZlOz7Trgo/GeAz6dp
        Kw9anDoZ65LjhFGIITWHP5BT6Yo7mtvajQ==
X-Google-Smtp-Source: ABdhPJxslYtSkbbz5ZG5hfI6kXPdbFW8Dak+TM/tVXxKGVztHKvAG2EA4TYNsCckKdUWA1MDbZBD5g==
X-Received: by 2002:a17:902:c947:b0:141:e7f6:d688 with SMTP id i7-20020a170902c94700b00141e7f6d688mr55611129pla.56.1637160526530;
        Wed, 17 Nov 2021 06:48:46 -0800 (PST)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com. [209.85.210.170])
        by smtp.gmail.com with ESMTPSA id qe12sm6195659pjb.29.2021.11.17.06.48.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Nov 2021 06:48:46 -0800 (PST)
Received: by mail-pf1-f170.google.com with SMTP id n26so2897204pff.3;
        Wed, 17 Nov 2021 06:48:46 -0800 (PST)
X-Received: by 2002:a1f:f24f:: with SMTP id q76mr89444969vkh.11.1637160515483;
 Wed, 17 Nov 2021 06:48:35 -0800 (PST)
MIME-Version: 1.0
References: <20211117103850.28397-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20211117103850.28397-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 17 Nov 2021 15:48:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUiF0xy3yBKTzjhSq8wT7m44e6nsZMgVGpnSCRZWTbcQw@mail.gmail.com>
Message-ID: <CAMuHMdUiF0xy3yBKTzjhSq8wT7m44e6nsZMgVGpnSCRZWTbcQw@mail.gmail.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: simplify an expression
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Nov 17, 2021 at 1:21 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> We already have 'quirks', no need to go via 'priv'.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
