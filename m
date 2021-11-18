Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55BE2455944
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Nov 2021 11:41:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245430AbhKRKoL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Nov 2021 05:44:11 -0500
Received: from mail-ua1-f47.google.com ([209.85.222.47]:42663 "EHLO
        mail-ua1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343499AbhKRKng (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Nov 2021 05:43:36 -0500
Received: by mail-ua1-f47.google.com with SMTP id t13so12544118uad.9
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Nov 2021 02:40:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uHey9bQ7M9zH+pDMXX6Jp2z+OJkWy1eouDZz8mlJWak=;
        b=BRjZ/1gHDsjnbHeqdds80Ut7AU8CuO0aJObiO2OEjol1vJdAC5t1xI09uD27WEue3W
         /OO0APE7CuA7snYwZDz7DKQGD2doYcuxSozPEbSm84svw/15XNrdy+dAkHrXZYUELkqG
         L6JnFYdvBXdakSN+wQZqZSCP7rJ2Mwr5TMsWGSKog/xmMSJP9uDAWnTZ/7T0Cq1XPcY/
         HVgdmQuwpsHWvPiswJquccfmgUZjhjtv9mzRnhH9eic2tnatRGhcOAzXyfqtBxjJARXC
         vzQDb9LLJZ2Vz6FS/H6XaRoyHaj3bjJyz9mIPQ52XV/wOuxsRMnOUj2PwLazeuEnJHLO
         yWWw==
X-Gm-Message-State: AOAM530RIsSOFtDsLAcC9sTJlbG3srRqx8S0AgTizWTZZZ9ceSUK8NWS
        hBlkSIbsUv1jRpWMvtE34OQ9fjnGZ8oYxA==
X-Google-Smtp-Source: ABdhPJyLQqGqjCmru1ugiJ9Z0754bws8IT5WrrkycyCS8XdB9THS64QHmCL6rFPwz36IkcagszVvig==
X-Received: by 2002:ab0:67d7:: with SMTP id w23mr34981808uar.3.1637232036156;
        Thu, 18 Nov 2021 02:40:36 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id j15sm1429004vsp.8.2021.11.18.02.40.35
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Nov 2021 02:40:35 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id p2so12512405uad.11
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Nov 2021 02:40:35 -0800 (PST)
X-Received: by 2002:a67:af0a:: with SMTP id v10mr79909005vsl.35.1637232035415;
 Thu, 18 Nov 2021 02:40:35 -0800 (PST)
MIME-Version: 1.0
References: <20211112184413.4391-1-biju.das.jz@bp.renesas.com> <20211112184413.4391-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211112184413.4391-5-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 18 Nov 2021 11:40:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVyzF77-xxv80BWuu6GewcYXdY4AtnaERz23TrfHp-2tQ@mail.gmail.com>
Message-ID: <CAMuHMdVyzF77-xxv80BWuu6GewcYXdY4AtnaERz23TrfHp-2tQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] clocksource/drivers/renesas,ostm: Make
 RENESAS_OSTM symbol visible
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Nov 12, 2021 at 7:44 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> As RZ/G2L uses the ARM Architected Timer as system timer, enabling
> the OSTM is not mandatory.
>
> Make RENESAS_OSTM symbol visible, so that user can enable it
> when needed.
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
