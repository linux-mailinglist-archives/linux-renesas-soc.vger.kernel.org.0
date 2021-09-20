Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7D0D4113B9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Sep 2021 13:45:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237224AbhITLq7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Sep 2021 07:46:59 -0400
Received: from mail-ua1-f41.google.com ([209.85.222.41]:42758 "EHLO
        mail-ua1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237196AbhITLq6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Sep 2021 07:46:58 -0400
Received: by mail-ua1-f41.google.com with SMTP id c33so10948786uae.9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Sep 2021 04:45:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ydeagHrvxjiAIYOHS0B/rkDvJ1CzJ5SNqZOdo+yg6SU=;
        b=JO2+KryEmcTtZSjrkxyS9Z7svLYIwvGC4QB9UBnecdmC+DHzLGHCY4l5tYaKUrLmdS
         OXGRDJnxsCSJf7FVaiVxAb5ijxhRtWXNqX5QQ7Ae/TPF6KybZX6HrHkZur0X67bRGo6I
         6I7h+0LaOwWTNt6KOovh/MRbReUdSCO0ENR/joU6GnnHK5e0ik2iwGAg1mhZJbnHo5hs
         rsExfIiisDD/9NTcGxw0vTWeM/ilXMcv2UWUJHSI2KL6Ad4pqgShCxCKEv9OJlTltv2i
         gE80+VIYChMmbffgQEsifNiyBKT6QQnXD4yHQu7bxDiA4EVbQp1+0MQ74tq5VBQxa+Dr
         GlLQ==
X-Gm-Message-State: AOAM532LaQAdiHwgdW984pieb3cVoZwqNQYIeqJf+e48ONJ7plimxWWx
        Ihk7M3/8/tRacw3pv8t0pPgac2kRFNmAgXNudrc=
X-Google-Smtp-Source: ABdhPJyETAEA7/Y30qBepfbsOZY8MSV/Ou0QNG8tOfG8cCj1JRXeAMk7r2olHyrhW0Um8Rpx7tVnfyyFwSKBpch1rLk=
X-Received: by 2002:ab0:6dc7:: with SMTP id r7mr11241487uaf.14.1632138331668;
 Mon, 20 Sep 2021 04:45:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210920093905.10878-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210920093905.10878-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 20 Sep 2021 13:45:20 +0200
Message-ID: <CAMuHMdWpws8uknhX00PyaAN+GjD0_Uc-zaBaVdYKkpTnqTsarw@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: defconfig: Enable SND_SOC_WM8978
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Michael Walle <michael@walle.cc>, Nishanth Menon <nm@ti.com>,
        Douglas Anderson <dianders@chromium.org>,
        Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Mon, Sep 20, 2021 at 11:39 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> WM8978 audio CODEC is supported on RZ/G2L SMARC EVK.
> Enable it on arm64 defconfig as module.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

Looks good to me, but I would like to defer this until the RZ/G2L
SMARC EVK DTS contains a device node compatible with "wlf,wm8978".

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
