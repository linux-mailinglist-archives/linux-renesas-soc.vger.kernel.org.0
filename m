Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A00B4A30E2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Aug 2019 09:22:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727736AbfH3HV6 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 30 Aug 2019 03:21:58 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:40756 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725780AbfH3HV6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Aug 2019 03:21:58 -0400
Received: by mail-ot1-f65.google.com with SMTP id c34so6019784otb.7;
        Fri, 30 Aug 2019 00:21:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=F9kLJ3BZ5QkD9+EtZF2mlsKCvekaahe0KCRfMZNMwmo=;
        b=sG5dqECvwb9ukFVFEpwHSVoyrUwTT/rirQH5CPPSLv78MWa1CqB0pB05ow+S4Jruj9
         Qrf3U1hiDBTYlA+yFLSPN+txRoN4rTvQ3tD3/tZNt0YilPrnjIhuTTHpA+xadBl++bmI
         LLpKz0v8+2F/K9izX2DqNTKGiHS/zSK3SvcCNtuhrR103YBn5/QYsOezS2r4q9BNDiti
         06CmDvGLzOHLIyn14kY2Lukyp+1ZIdymXTXbc+lc5M3A3nDqalYC51OyMDBvfCqHQC8T
         /g/5vY2VJVH9iToaqK87E4wrLonzdwh4mVyEHhp7oALb20wEIU2zzbKySw8yJ9sVDFmZ
         onaw==
X-Gm-Message-State: APjAAAXfR2nq4PLaVWn92W7yaCX0F2yzKUl6APcWVLpAVefAhSB0lQyL
        2GkI0mZM+yeIQtOmJZ9QtVCvgnUp4iq5a5yBRFY=
X-Google-Smtp-Source: APXvYqy/RC14KohSI8aaNfC8W69ti0COcczX0pr/6LRBlAsQ86y25mBPxnCCrjxp0EM2dnTcDzAdTgyu2dDDY4Eu//Q=
X-Received: by 2002:a9d:3e50:: with SMTP id h16mr10571919otg.107.1567149717383;
 Fri, 30 Aug 2019 00:21:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190829183634.3376-1-tszucs@protonmail.ch>
In-Reply-To: <20190829183634.3376-1-tszucs@protonmail.ch>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 30 Aug 2019 09:21:45 +0200
Message-ID: <CAMuHMdVe_d6N8hhG0VNZMKAGwXm7kiOQVnqNkL9+6DbkBsKAZw@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: sdhi: fill in actual_clock
To:     =?UTF-8?B?VGFtw6FzIFN6xbFjcw==?= <tszucs@protonmail.ch>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Tamás,

On Thu, Aug 29, 2019 at 8:37 PM Tamás Szűcs <tszucs@protonmail.ch> wrote:
> Save set clock in mmc_host actual_clock enabling exporting it via debugfs.
> This will indicate the precise SD clock in I/O settings rather than only the
> sometimes misleading requested clock.
>
> Signed-off-by: Tamás Szűcs <tszucs@protonmail.ch>

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

However, one question below.

> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -166,10 +166,13 @@ static void renesas_sdhi_set_clock(struct tmio_mmc_host *host,
>         sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, ~CLK_CTL_SCLKEN &
>                 sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));
>
> -       if (new_clock == 0)
> +       if (new_clock == 0) {
> +               host->mmc->actual_clock = 0;

The actual clock is present in the debugfs output only when non-zero.
Hence userspace cannot distinguish between an old kernel where the
Renesas SDHI driver didn't fill in actual_clock, and a new kernel when
the SDHI controller is powered down.
Could that be an issue? Should the old value be retained?
Probably it's OK, as this is debugfs, not an official ABI.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
