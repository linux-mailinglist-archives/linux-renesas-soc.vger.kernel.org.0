Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 837532F4C56
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Jan 2021 14:40:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726898AbhAMNim (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Jan 2021 08:38:42 -0500
Received: from mail-ot1-f47.google.com ([209.85.210.47]:33153 "EHLO
        mail-ot1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726893AbhAMNil (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Jan 2021 08:38:41 -0500
Received: by mail-ot1-f47.google.com with SMTP id b24so1915548otj.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Jan 2021 05:38:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2WyB/HndAuJoc3oTy/cDxqawPSXHrK0DoEj+JpCnl6s=;
        b=MRUGLWBt5Ei2Me8djgVFqW4vyt+PclQOOcLLxVy/cs8cLK4tvmT7FBbRzUfjLKmrKr
         TuQT9kc5OOxtbNUms6oSLAS/X1+aqdE64S0xEah+HvSl7sAu+RaXQy4z7mhjrTUvdgrF
         wlG1zHEZtoq+FAOOAcKzjv56QP/oq6bK5dy3ne3hh8B2nHoKrsaaOf7KlY/JE7iiT/5F
         bTUJ1im+jqiDLJcsruEWsFD2p3KfLNZBVWejViedztE5Mgtc+/q0LFBtM3VTDi2pXoCU
         OLZ7oSlaGIFPG8YTuN2Zgcj/EekPL/E/04U8g8ACCTYqMiaITgodkX2ugXBWGVza2jXH
         ALGA==
X-Gm-Message-State: AOAM530izLNrrCAgXAw5Fs5Z4M97k9zoNt6cZHySy1Qwz0qbLs7L757O
        Cy9nrrHizMb0+rkOVrulV6uJEUnMamLHkXHuNy0=
X-Google-Smtp-Source: ABdhPJwNLF+kXPBpTUBEgXUDWEKNl5XEo/QqeuYsGaYr9B4dCOMpCYKOPjWb0be12dK47Wro3fIMVkO3iEXOgxm48i4=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id u26mr1251343oth.250.1610545080869;
 Wed, 13 Jan 2021 05:38:00 -0800 (PST)
MIME-Version: 1.0
References: <20210112165912.30876-1-uli+renesas@fpond.eu> <20210112165912.30876-5-uli+renesas@fpond.eu>
In-Reply-To: <20210112165912.30876-5-uli+renesas@fpond.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 13 Jan 2021 14:37:49 +0100
Message-ID: <CAMuHMdWyR_rYFyEvLmag5=RRFHz_cP1uv8qE56a9dCaodCg4ww@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] pinctrl: renesas: Initial R8A779A0 (V3U) PFC support
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>, hoai.luu.ub@renesas.com,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jan 12, 2021 at 5:59 PM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> This patch adds initial pinctrl support for the R8A779A0 (V3U) SoC,
> including bias, drive strength and voltage control.
>
> Based on patch by LUU HOAI <hoai.luu.ub@renesas.com>.
>
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl-for-v5.12.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
