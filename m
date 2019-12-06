Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E29E911520F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2019 15:10:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726298AbfLFOKx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 6 Dec 2019 09:10:53 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:33347 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726195AbfLFOKx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Dec 2019 09:10:53 -0500
Received: by mail-ot1-f65.google.com with SMTP id d17so5924490otc.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Dec 2019 06:10:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N/nZvsCMX/WYFA6MZSgUkg/gNV/quplnxevFiylxGMw=;
        b=KKLjEjSJ2X3pwndOHL4tAkEuu44ylIRasaUXU0V6crqIiNGMJTEo8cj09DxMygcdTp
         P46moy9efpjV40qfBFlm31tIE6IcYlJI4N11gf8BbfY1EZYQCSPWKKsJrkZT38wbtZLB
         UDg5kKMaob1GtEYiNBuwzhKmd7UFV/KUrNMim3rB4zy9irhDbO0H4DZFrcSow7z6AP3k
         LQ9UN/SgOsG1XcbNRPfuq21Bh3ayBWj1jU5MsjCDHFlCh17LMbzJqvEKtEca3awQzk3C
         CFvNdoSSmYUbmd5f8Kbo6LGe4oPi1fhjqsEHtdrY8uYrZXQoqS0/69kXnMH0k/2ae/UO
         k9Jw==
X-Gm-Message-State: APjAAAX8Ek0JvVWe/0Kslh9RS3YtxOzbcep9FO9Dk8luy76urPaRneQV
        GJGOYdYSzAbTHKhBYuiweJoa7L/SqABNEvT4yzY=
X-Google-Smtp-Source: APXvYqyh0xrVkM/pTRgQzNdKMCFqm5gCJbROnbv+a1XUThQicJ8yUECHkJR4RUnFR9ZtPY/39/XYygd6GVqFJyxgtCk=
X-Received: by 2002:a9d:7984:: with SMTP id h4mr6063129otm.297.1575641451867;
 Fri, 06 Dec 2019 06:10:51 -0800 (PST)
MIME-Version: 1.0
References: <20191116165034.39001-1-jacopo+renesas@jmondi.org> <20191206140520.10457-1-kieran.bingham@ideasonboard.com>
In-Reply-To: <20191206140520.10457-1-kieran.bingham@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 6 Dec 2019 15:10:30 +0100
Message-ID: <CAMuHMdVF6ecH3+9rBN3p3X3rKkP1-kM-4gui8EC3kEx_AWpNFg@mail.gmail.com>
Subject: Re: [PATCH 1/3] media: i2c: max9286: Remove redundant max9286_i2c_mux_state
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

On Fri, Dec 6, 2019 at 3:05 PM Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
> While simplifying the i2c-mux state, the states were stored in an enum
> (initially there were three).
>
> This has now simplified down to 2 states, open and closed - and can be
> represented easily in a bool.
>
> It 'could' also be represented within the mux_channel, but I don't want
> to pollute that further than the '-1' value which is already stored in
> there to represent no channel selected.
>
> Remove the max9286_i2c_mux_state and replace with a bool mux_open flag,
> and move the location within the private struct to be more appropriate.
>
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

Thanks for your patch!

> --- a/drivers/media/i2c/max9286.c
> +++ b/drivers/media/i2c/max9286.c
> @@ -144,10 +144,10 @@ struct max9286_priv {
>         struct media_pad pads[MAX9286_N_PADS];
>         struct regulator *regulator;
>         bool poc_enabled;
> -       int mux_state;
>
>         struct i2c_mux_core *mux;
>         unsigned int mux_channel;
> +       bool mux_open;

Please keep all booleans together, to fill up holes due to alignment
restrictions.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
