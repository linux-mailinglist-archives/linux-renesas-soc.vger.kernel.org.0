Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D976D2A62A4
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Nov 2020 11:54:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729526AbgKDKyG convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Nov 2020 05:54:06 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:38309 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729400AbgKDKyC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Nov 2020 05:54:02 -0500
Received: by mail-ot1-f68.google.com with SMTP id b2so18911562ots.5;
        Wed, 04 Nov 2020 02:54:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bZFiMdw9AfqczhhnOLw0PdAOZHm8uCoTpsDyjy95y2E=;
        b=PnmXdWwIy28xkBlun+jgMrCoMHcwgx7gtWd0vZowd88ho8ZMlN6kk0KhOJPShUjhmR
         68ebQuFcynEWqKEXd1cdQ33NJKX88u66I1n/1lPiqQftyX3Dcs2zB5dO8qgNuoT0xFES
         eEn8qnS+BIItu67eDa1vAoGX2xRA1SExRAJ/OpvmnE4EsB3uiRZ/7+zhd9viu5Metx8n
         MKK4viTP0I9+QFuoovVYjPUxzPjHHOMEwwHKQZ641KVpNEVw3+KTOyZJ+0bNk4QrtQ5X
         vv209H2PRRLmvLTg+aBzZWJSwR4DwTNxIN2CxadTzyF7WhN9YPXsdMtbWXgiFc3NJLEr
         y83w==
X-Gm-Message-State: AOAM532BuRxuTN/NsgP96Mp3NycjlecPpCy+3YI1EohXGAaebaknB/Ji
        5MN0y+4w7zQV/9ZQrxcB0TD9oxnerjTZdN4DNAM=
X-Google-Smtp-Source: ABdhPJxaanoeAw7n0wE9LQbm8ZIt9sxPb+Ju/MIYOPk3JellEUYqDZJQbswViFLjObmKhp6PbZKlxVIncGF/D5wwYFk=
X-Received: by 2002:a9d:3b76:: with SMTP id z109mr18639764otb.250.1604487241619;
 Wed, 04 Nov 2020 02:54:01 -0800 (PST)
MIME-Version: 1.0
References: <20201103162435.13689-1-krzk@kernel.org> <20201103162435.13689-6-krzk@kernel.org>
In-Reply-To: <20201103162435.13689-6-krzk@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 4 Nov 2020 11:53:50 +0100
Message-ID: <CAMuHMdUQwk_oWBEv-ZweF0Z5MLATs4+1zdXdaf1ftit0rvav6Q@mail.gmail.com>
Subject: Re: [PATCH 6/8] clk: renesas: r8a779a0-cpg-mssr: add static to local function
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Peng Fan <peng.fan@nxp.com>, Abel Vesa <abel.vesa@nxp.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Krzysztof,

On Tue, Nov 3, 2020 at 5:25 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> The function rcar_r8a779a0_cpg_clk_register() is not used outside of the
> unit so it can be made static to fix compilation warning:
>
>     drivers/clk/renesas/r8a779a0-cpg-mssr.c:156:21: warning:
>         no previous prototype for ‘rcar_r8a779a0_cpg_clk_register’ [-Wmissing-prototypes]
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Thanks for your patch!
A fix for this is already queued in renesas-clk-for-v5.11:
https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/commit/?h=renesas-clk-for-v5.11&id=c3f207f6d23d01c0fa817fcd6118bbbc509abe39

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
