Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2B33303441
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Jan 2021 06:21:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726094AbhAZFVT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Jan 2021 00:21:19 -0500
Received: from mail-oi1-f179.google.com ([209.85.167.179]:41445 "EHLO
        mail-oi1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726199AbhAYJRV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Jan 2021 04:17:21 -0500
Received: by mail-oi1-f179.google.com with SMTP id m13so6095032oig.8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Jan 2021 01:16:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N7dtwMfbKTVs8Rjwdnj2NuvpgoMbq7CgvLWueWzbN7U=;
        b=SgGComUP2Wi/cx9pOE8Zx6lSW/RPUSDBvRl4Dp6vVjnMhJaRXf2E4NV8LJ+CKo5Qsb
         F58fmqQmg8Qk75rh9g6hWK6wYa4tYdBdQRbm0/fDCi4opaSiDzB4fWkaRF8k48nUXn2m
         JK6OsDjnSWBT3PDnwUbbm1Hx9inYBcVYIyOu1vSX8sunv8er4OOa3Ot2z6IhbMKZd64r
         Fyc75psmYpV3cTS9ZXPl8T6IarFAj1DAVqRjRh+eouHO7rVy+XKL2xJix4pamAa2CT4B
         A1zL7J5TIK+4jzTgar7A8dpe5K0/HY7FGNlWOQ4bqkP7MVHYaalPw62UROpiIV02Uqfb
         23jw==
X-Gm-Message-State: AOAM532Rj8RFqy8hj5t1tDF09MYR+EwIfICf8HG/83+gH0jeL1vE4Ve7
        1vHgczqjquOoEl6hQ7ALQMpJKORUFjrfeWslIRjqTUH4
X-Google-Smtp-Source: ABdhPJy1Em3n93JAsDIczHZGgvf/IolUkpfQ5fipK59eeN121t+MI0jM0phDWMUYoLm+e+plASAX1hxctxwp3Wvj3nI=
X-Received: by 2002:aca:4d8d:: with SMTP id a135mr576864oib.153.1611564157033;
 Mon, 25 Jan 2021 00:42:37 -0800 (PST)
MIME-Version: 1.0
References: <20210125075845.3864-1-wsa+renesas@sang-engineering.com> <20210125075845.3864-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210125075845.3864-2-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 25 Jan 2021 09:42:25 +0100
Message-ID: <CAMuHMdXgFRR8qDfTOSrR7Zjkd5A7RVKNWrTo_qbeFnsHq0yFxA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: renesas: r8a779a0: Add MMC node
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jan 25, 2021 at 8:58 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> From: Takeshi Saito <takeshi.saito.xv@renesas.com>
>
> Add a device node for MMC.
>
> Signed-off-by: Takeshi Saito <takeshi.saito.xv@renesas.com>
> Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> [wsa: double checked & rebased]
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Changes since v2: added tags

Thx, will queue in renesas-devel for v5.12.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
