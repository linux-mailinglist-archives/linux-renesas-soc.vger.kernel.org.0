Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39DC82F4C33
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Jan 2021 14:27:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726118AbhAMN0f (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Jan 2021 08:26:35 -0500
Received: from mail-ot1-f46.google.com ([209.85.210.46]:44949 "EHLO
        mail-ot1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726003AbhAMN0f (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Jan 2021 08:26:35 -0500
Received: by mail-ot1-f46.google.com with SMTP id r9so1821727otk.11
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Jan 2021 05:26:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o0roQCCO/etbX4RjBdnrG+Olfz1Vs5jFO/h9JUfsdnw=;
        b=f4q/Ai9CCBjs0lHjPIYffICjQFq+kiDg3OrOIuAAZ/y0XceHcVGWpTrnmZwY6OcBWX
         Cy815rosFMgUmJQJdgpN37nQKNWjz/NtAo4F/HgU13Wfige2iJvjYHc/gvcGPWwvNI5e
         9l5EiI8GIwL1rMSndSMdmFCK2Jkec2Uj9CBR4UbXtCi2YDzAkW9+FE943TBfQQBN1hRk
         j6kXmw412k1fhrLXJPP9dg4uTmF8tDx8ejtVKmvJkEaxmO8Sw3ll70P+6zm1MqHAp8/U
         SHveWffFNEiCaGj89gyM8ahM76Kx5kjVsiaRfBYhyTY2fa0PLIPtiu9WyBwTkZgcXfhY
         X60w==
X-Gm-Message-State: AOAM531Mg4AKWM8y73Xp3nnvjywbpFOMb9q1TF1V4njgXFkBrdlneuJK
        YbZ1WTRgoEYyicArWFLVOzu/LjgsuUJp+tcUMfrD9qj8
X-Google-Smtp-Source: ABdhPJz45dOq/g/gRYmKbZ8JKS87Qr+0oFeWhXsrUVVa9KdhYoDYtwcI2+5rJPng94UVo5bwXIQIECDMiKX0D/gP66k=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id u26mr1212955oth.250.1610544354587;
 Wed, 13 Jan 2021 05:25:54 -0800 (PST)
MIME-Version: 1.0
References: <20210112165912.30876-1-uli+renesas@fpond.eu> <20210112165912.30876-2-uli+renesas@fpond.eu>
In-Reply-To: <20210112165912.30876-2-uli+renesas@fpond.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 13 Jan 2021 14:25:43 +0100
Message-ID: <CAMuHMdXfiAjy4ygShekvZsVgXOEsvVyDdfbm4NGe0FyR=bzfqg@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] pinctrl: renesas: implement unlock register masks
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>, hoai.luu.ub@renesas.com,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jan 12, 2021 at 5:59 PM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> The V3U SoC has several unlock registers, one per register group. They
> reside at offset zero in each 0x200 bytes-sized block.
>
> To avoid adding yet another table to the PFC implementation, this
> patch adds the option to specify an address mask instead of the fixed
> address in sh_pfc_soc_info::unlock_reg.
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
