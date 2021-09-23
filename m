Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5C79415B65
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Sep 2021 11:50:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240233AbhIWJvf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 23 Sep 2021 05:51:35 -0400
Received: from mail-vs1-f51.google.com ([209.85.217.51]:35682 "EHLO
        mail-vs1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240220AbhIWJve (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Sep 2021 05:51:34 -0400
Received: by mail-vs1-f51.google.com with SMTP id f18so5935996vsp.2;
        Thu, 23 Sep 2021 02:50:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nx4BEiyhea77H9mPMjM3vQX/tvU8/t/qrKRNMVmCHfw=;
        b=tqdNMiT295EVVy19PDWVnS+bBt4d7Jg/d/stVROca7WKWv4pKvtsDSh20+1DDPguwB
         m23UUb5NgmRxxV/AF5zF7VIuTVK+vDtZtC6/ySh0nFXY+TIRmU19hAk0jsdkGzvGvrRd
         Nrm3wxlb7iXijYdjK3m3O6sLkDGEhzlBHegY5O11fzLg17bYyk6GrG1kBz58FFn3KpCJ
         u6Z5Pklcqs+1xcOFDHOi5O+uergKh2zcRpFIGOSAdsO9V+OTAtFzwBx4vq5JtF7rfw/A
         cXdiF9jVMvnXSzxFYmiqnntmJSlSmn8Q8zCeuFTSdHdYZgTALMQ6B+4NyxCbKg0Oy+zP
         +2Iw==
X-Gm-Message-State: AOAM530p7H+LWpu6Z7l5omApF6Y3sHkPK7H2ZeVTB1JCcyb8AgXSGtVo
        U2kSH0EiNdHVsBp8PPCh3g72AelUHPrtLZMxvOw=
X-Google-Smtp-Source: ABdhPJwulXv7V2ZQB9Y3KmEQOubAutrTGeDwiglQnT4FHOuk9kx9i6dxiQjG5JE19HF07NYYZ1XHoaFcUbPmhnbuRbg=
X-Received: by 2002:a67:cb0a:: with SMTP id b10mr3248945vsl.9.1632390603128;
 Thu, 23 Sep 2021 02:50:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210922155145.28156-1-biju.das.jz@bp.renesas.com> <20210922155145.28156-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210922155145.28156-4-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 23 Sep 2021 11:49:51 +0200
Message-ID: <CAMuHMdXEsn3Yi+QsAp-QTzAaf_23YZ5gxeme0nrxKiZWZ_Mq2g@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] clk: renesas: rzg2l: Add support to handle coupled clocks
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Wed, Sep 22, 2021 at 6:04 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> The AXI and CHI clocks use the same register bit for controlling clock
> output. Add a new clock type for coupled clocks, which sets the
> CPG_CLKON_ETH.CLK[01]_ON bit when at least one clock is enabled, and
> clears the bit only when both clocks are disabled.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v3->v4:
>  * Added locking, in case both clocks are changed concurrently
>  * initialized mstp_clock.enabled to match the current hardware state.

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.16, together with the other patches
in this series.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
