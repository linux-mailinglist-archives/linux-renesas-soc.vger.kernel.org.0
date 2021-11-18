Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39AAE45594E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Nov 2021 11:44:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244339AbhKRKrR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Nov 2021 05:47:17 -0500
Received: from mail-ua1-f42.google.com ([209.85.222.42]:43787 "EHLO
        mail-ua1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235730AbhKRKrQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Nov 2021 05:47:16 -0500
Received: by mail-ua1-f42.google.com with SMTP id j14so2815811uan.10
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Nov 2021 02:44:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4v2AD/7kPOPPNFxUrwvcAKdN8Awv89acKC5POSyWGVI=;
        b=S/HUz+WZAwdUD8piLotG0c4P/rH/sRUcDKuTG/177/o4x7T3/uW4szQBI93k6IgaB/
         UZWc49/NbTIM1RPNl91Sx7dIjpNEMb/I+YDkuMp6vrp5sCaWylCcH9ve49bqG4QR9ZvG
         Ua2+6VqC6ou+0kArLDklPSLVeYR3jkddyosK/Z3haWsh+K7PyRyJPjjR9lLUuY5PZRiU
         CJVo+xsp0DMCFaQZ8VEC7y3jYV84FWpVljr+LVkdugVfQzZp7MKXYn/PtyshxzyvlGnG
         3T+ruAKqHggmjpA0sa0FHzK7X+J8FUr4gBJvCpj+bdeClqo797VJpqpqBD/a+5/I3PdA
         v5aQ==
X-Gm-Message-State: AOAM532eC41Cfgai2vEJgLNGgS5n3plSSZ5IX8iMPXbmKfCXBp6R9rk2
        3u9NRXMfaFUr8Ry2IlUXWbPwL1OwAknMhQ==
X-Google-Smtp-Source: ABdhPJxIXx2xNY3uQ4gXyAlGoCpHbU0kVzwtN7t16azyOaGO4h3E7oxCREZWxtGrtv0PVV1VR0Tfxg==
X-Received: by 2002:a05:6102:3708:: with SMTP id s8mr79050691vst.45.1637232255612;
        Thu, 18 Nov 2021 02:44:15 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id 23sm1343788vkk.17.2021.11.18.02.44.14
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Nov 2021 02:44:14 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id i6so12615549uae.6
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Nov 2021 02:44:14 -0800 (PST)
X-Received: by 2002:ab0:15a1:: with SMTP id i30mr35081179uae.122.1637232254305;
 Thu, 18 Nov 2021 02:44:14 -0800 (PST)
MIME-Version: 1.0
References: <20211112184413.4391-1-biju.das.jz@bp.renesas.com> <20211112184413.4391-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211112184413.4391-4-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 18 Nov 2021 11:44:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW3LP6YkGPwiA0Cpmmmb5YkL5LcSgp0C9JKPDvHfV0KGg@mail.gmail.com>
Message-ID: <CAMuHMdW3LP6YkGPwiA0Cpmmmb5YkL5LcSgp0C9JKPDvHfV0KGg@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] clocksource/drivers/renesas-ostm: Add RZ/G2L OSTM support
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Nov 12, 2021 at 7:44 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> RZ/G2L SoC has Generic Timer Module(a.k.a OSTM) which needs to
> deassert the reset line before accessing any registers.
>
> This patch adds an entry point for RZ/G2L so that we can deassert
> the reset line in probe callback.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3:
>  * Added reset_control_put() on error path.
>  * enabled suppress_bind_attrs in ostm_device_driver structure

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
