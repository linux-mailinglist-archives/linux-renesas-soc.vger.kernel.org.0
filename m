Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 751CA2C679E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Nov 2020 15:15:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730393AbgK0ON2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 27 Nov 2020 09:13:28 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:39200 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730041AbgK0ON1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Nov 2020 09:13:27 -0500
Received: by mail-ot1-f66.google.com with SMTP id z24so4806664oto.6
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Nov 2020 06:13:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C22ycaIKmEvxsyP8+iSJ36KP/aQ8aMy2WhWEG15HfsQ=;
        b=NpKoxh/T3Zdcfiip/WwjkY2nhJeORroafb46LcOdfhmLM/08F1LJ8LiNX4zmIGI2Nw
         fEvmkXlDD02w54xod6Kza/G4g3fT6XzqEod9aUPyemgB6bVlFSEoK0DzJ15PN/aBJuqk
         uDDGOhPO2H2GgmL0hiM3iEWI0jXAY59KzEpRWsjU7ymnU71RowP/Ngu3PhsFldN9lzx9
         QWr27ykHCB7rP5E5OcfqqT4+vsa+L8DVLb1Tbj52o36zN1kwPoHW/PAIW6Su8F5UaKWP
         i1flbNutvV9RrQ9oKivEzrXRvW5ETSU/cln5iAeVXjrLSzCLbPey3LGaKfKODNQyqomI
         n+cw==
X-Gm-Message-State: AOAM532n48ZIXjV8LXagbGYxzUpxPAAb+RwZjLoL6fCIrBr0WLi3YCpR
        40plrdNlyt69AHzvsEJRoqDkd9cygqWhfS1x2xiHEsBDnX5KdQ==
X-Google-Smtp-Source: ABdhPJzehBcg7RQOMR1n1ya/ho/5mKc2lBic1nge11C9azZGomlNJtJlsycLXMi7/WegJJ+Miv4nt53qTz1WmclphOo=
X-Received: by 2002:a05:6830:210a:: with SMTP id i10mr5945721otc.145.1606486405346;
 Fri, 27 Nov 2020 06:13:25 -0800 (PST)
MIME-Version: 1.0
References: <20201126172058.25275-1-uli+renesas@fpond.eu> <20201126172058.25275-4-uli+renesas@fpond.eu>
In-Reply-To: <20201126172058.25275-4-uli+renesas@fpond.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 27 Nov 2020 15:13:14 +0100
Message-ID: <CAMuHMdUW7MNq6xrAKuqb5CMPDNPB_8fxjbpjz5cd8MzsR7JnHg@mail.gmail.com>
Subject: Re: [PATCH 3/3] pinctrl: renesas: r8a779a0: Add SCIF pins, groups and functions
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>, hoai.luu.ub@renesas.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Uli,

On Thu, Nov 26, 2020 at 6:21 PM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> This patch adds SCIF0, 1, 3 and 4 pins, groups and functions for the
> R8A779A0 (V3U) SoC.
>
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pfc-r8a779a0.c
> +++ b/drivers/pinctrl/renesas/pfc-r8a779a0.c

> +/* - SCIF1 ------------------------------------------------------------------ */
> +static const unsigned int scif1_data_pins[] = {
> +       /* RX1, TX1 */
> +       RCAR_GP_PIN(1, 21), RCAR_GP_PIN(1, 22),
> +};
> +static const unsigned int scif1_data_mux[] = {
> +       RX1_MARK, TX1_MARK,
> +};

According to the R-Car V3U Pin Multiplex Table, there are two sets.
Table 6.14 in the User's Manual agrees.
The above definition corresponds to set A.
Set B is available on pins GP3_02 and GP3_01.

> +static const unsigned int scif1_clk_pins[] = {
> +       /* SCK1 */
> +       RCAR_GP_PIN(1, 18),
> +};
> +static const unsigned int scif1_clk_mux[] = {
> +       SCK1_MARK,
> +};
> +static const unsigned int scif1_ctrl_pins[] = {
> +       /* RTS1#, CTS1# */
> +       RCAR_GP_PIN(1, 20), RCAR_GP_PIN(1, 19),
> +};
> +static const unsigned int scif1_ctrl_mux[] = {
> +       RTS1_N_MARK, CTS1_N_MARK,
> +};

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
