Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B19BD2C68C5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Nov 2020 16:36:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730366AbgK0PgA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 27 Nov 2020 10:36:00 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:34406 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728495AbgK0PgA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Nov 2020 10:36:00 -0500
Received: by mail-ot1-f66.google.com with SMTP id h19so5057526otr.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Nov 2020 07:35:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QD8MwycA2iHmBUbtGsA4IDCl5CFvRwO65p9IbeYmjW4=;
        b=RipaJAxqkJLjOXLJ7MsGbN4UZhzHZHlY5qdVDWz3PCKS2Nt9cFaKmKQymAPeo8Eb5P
         bZfaKlEWPINGb6W+OIiI6o0Qo9piCekKydfvXLQ4jVxf5gMp/CxIDOW9XUI/xUrpskKO
         bBa2I4g113DNvG5drooBUvmmFtvwvSwdRCK0sEc474WhLSIPoLbYUtNw9e+h86m+kQTg
         x+7JFg0cXU33J5N74ndri1Q/CANzglP8/n1o7tGwDH4zqxfilA/qGybzVG1gbNOsFioz
         759xEmyEVPLXikUkc43or3Wp47TUI5+toP3K5c6br5iN8fW18+i5+TMlE0XCUvbBtcp9
         Telg==
X-Gm-Message-State: AOAM531bG9fFHVsIQhIG0qO9o0g8uhXmAlU+Ao2fB1iZTyntDZyF/hjQ
        x0QvaiFoIBRaDEZZOF3ynPR5c+10tfi2QDPgCykwIPouzWA=
X-Google-Smtp-Source: ABdhPJzNoZS0Dq5/UvJrEFjypis9AKn5Wf4ayzxHU8O9cMG4rPMXm1i2dszw6j9/YF54gmmGa4A87ugJlg7ErvlmIss=
X-Received: by 2002:a05:6830:210a:: with SMTP id i10mr6250719otc.145.1606491359417;
 Fri, 27 Nov 2020 07:35:59 -0800 (PST)
MIME-Version: 1.0
References: <20201126172154.25625-1-uli+renesas@fpond.eu> <20201126172154.25625-3-uli+renesas@fpond.eu>
In-Reply-To: <20201126172154.25625-3-uli+renesas@fpond.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 27 Nov 2020 16:35:48 +0100
Message-ID: <CAMuHMdXeOpEEdens75Y=kPCOCGn5ROm-CR-wviBdxJU-0-wTQw@mail.gmail.com>
Subject: Re: [PATCH 02/11] pinctrl: renesas: r8a779a0: Add CANFD pins, groups
 and functions
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>, hoai.luu.ub@renesas.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Uli,

On Thu, Nov 26, 2020 at 6:22 PM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> This patch adds CANFD 0-7 and CANFD clock pinmux support for the
> R8A779A0 (V3U) SoC.
>
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pfc-r8a779a0.c
> +++ b/drivers/pinctrl/renesas/pfc-r8a779a0.c

> +/* - CANFD Clock ------------------------------------------------------------ */
> +static const unsigned int canfd_clk_pins[] = {
> +       /* CAN_CLK */
> +       RCAR_GP_PIN(3, 0),
> +};
> +static const unsigned int canfd_clk_mux[] = {
> +       CAN_CLK_MARK,
> +};

The User's Manual calls this "can_clk", so I'm wondering if we should do the
same, like on most R-Car SoCs,to avoid confusing with the internal CANFD
clock.

I know we call it "canfd_clk" on R-Car V3M (it is called that way in the manual)
and on R-Car V3H (either copied from V3M, or changed later in the manual),
the two other SoCs that don't have separate (non-FD) CAN controllers.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
