Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEA404A5917
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Feb 2022 10:19:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233625AbiBAJTz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Feb 2022 04:19:55 -0500
Received: from mail-vk1-f172.google.com ([209.85.221.172]:44845 "EHLO
        mail-vk1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235902AbiBAJTy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Feb 2022 04:19:54 -0500
Received: by mail-vk1-f172.google.com with SMTP id b77so9997364vka.11;
        Tue, 01 Feb 2022 01:19:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GERVVT6a+bpZP4TWd/kBQGP6Mj9KTV8mUYN6tkD5pYA=;
        b=ow9crcXliYHQm1lDw5FHustd0BREJp27YG90HqRRiPwFqCYtTd8ng+bKpxT0Athr05
         rbZuEH4HAo1Sh6u2fXyL9aF2O3LeKwtD6CIvsGNHhDs+N7+x6ALHzDEOn8YMoEuwCzBH
         S5puIkDsS3/wmVQ81Tm0XcFnkcONSxOb7Ey52yPZJIC95ai3glNU3B2e1ESH5GLtgycU
         19Lh63PeirCTRbydBSIWfdPLJlP9sS/Y5of+qnD5btZw/WQx2q29S0GJtBccBTO3VO9y
         bTye9sMNml4Jaygak5ysCKrKqajbVbQxOiiFIXLR2Un9h6cfiEWZQm/c98j+W70eoOXC
         UoHQ==
X-Gm-Message-State: AOAM531xvgYZc1fnM3rti5TR46gUUbb8AEqrxkAmMBJFkVHxDHAtpnMf
        cOHaWG9zPRXNs6l5eGIPMLg4MoCZVGbNww==
X-Google-Smtp-Source: ABdhPJw9c0w7qVzo0mcn168/rLNDH+Ud0DIZgLBisOl0J26HRPzfbQLGYQyAU69Wvp0HKaw5+k7/vw==
X-Received: by 2002:a05:6122:221b:: with SMTP id bb27mr9822345vkb.25.1643707194198;
        Tue, 01 Feb 2022 01:19:54 -0800 (PST)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id 4sm3908098vsv.22.2022.02.01.01.19.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Feb 2022 01:19:53 -0800 (PST)
Received: by mail-vs1-f44.google.com with SMTP id f6so15230350vsa.5;
        Tue, 01 Feb 2022 01:19:53 -0800 (PST)
X-Received: by 2002:a67:b00e:: with SMTP id z14mr9190013vse.57.1643707193384;
 Tue, 01 Feb 2022 01:19:53 -0800 (PST)
MIME-Version: 1.0
References: <20220112174612.10773-1-biju.das.jz@bp.renesas.com> <20220112174612.10773-8-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220112174612.10773-8-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 1 Feb 2022 10:19:41 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVq+b=woU7mQwffpeTKgE-v4p6VfrSxEti62KC_M9qo3g@mail.gmail.com>
Message-ID: <CAMuHMdVq+b=woU7mQwffpeTKgE-v4p6VfrSxEti62KC_M9qo3g@mail.gmail.com>
Subject: Re: [RFC 07/28] clk: renesas: r9a07g044: Add M4 Clock support
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jan 12, 2022 at 6:46 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add support for M4 clock which is sourced from pll2_533_div2.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
