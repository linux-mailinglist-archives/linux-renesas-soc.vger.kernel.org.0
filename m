Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD0BF36D9AC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Apr 2021 16:37:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239805AbhD1OhO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 28 Apr 2021 10:37:14 -0400
Received: from mail-ua1-f46.google.com ([209.85.222.46]:46673 "EHLO
        mail-ua1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239209AbhD1OhO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Apr 2021 10:37:14 -0400
Received: by mail-ua1-f46.google.com with SMTP id v23so19788244uaq.13;
        Wed, 28 Apr 2021 07:36:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ebn3gqZWholSixRs2pG5TobMq2hnLDUwAQR5/Khu4nc=;
        b=eERugtZFOP202OCD0PCAyD9C1KtmD7aER2U+q92/oQJ2JXfDZuUy+y1OFVroMn6oK1
         /q1mlp2G/pYu/UW5W4y4QVN8edtDHgCzq1K2czuWC2rHen0EilVxqqI5kXL6QxJ72jnv
         C4OSMe/wJINpsTdRee9ASX2LW5tcB8n5+iwwfORrut8KFRxWxAyq4cofTs28l3kyLLi5
         fGQ2rfFBuKPrgfbsuO742anqpVeV+qkrH1ppc2zX100XgG91z5L0bl0pvG/lR0qDH5SO
         RzQDluk/oCzatRR0XBzpzj7NkVBJ6oMdR2bHDD5ajRwMYuhK2Jd2KzVkpwgDAYR5AIsr
         VLdA==
X-Gm-Message-State: AOAM532nXTDc3boUiqQDRz+qO/ZSNX08dMAqPjse9ocNAP2vo2Y6ET+R
        AnVtaj9AXfB+ov8Jv8BMZr97raJTInYPikT9tve95ysR5PU=
X-Google-Smtp-Source: ABdhPJwUatWDsVLWaKfcODXGfntt6k65wAc/HgmLKSVwqyayTIfPoUGtSH7CGqXabeNrvPeitGp/bA9yp0EYJcGcyD4=
X-Received: by 2002:a9f:262c:: with SMTP id 41mr24223522uag.4.1619620588733;
 Wed, 28 Apr 2021 07:36:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210317091622.31890-1-wsa+renesas@sang-engineering.com> <20210317091622.31890-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210317091622.31890-4-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 28 Apr 2021 16:36:17 +0200
Message-ID: <CAMuHMdU6=rTHjvcgK8GBzd3OL_9YFqV77=KsAEGJvAVapnhsOQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] mmc: renesas_sdhi: do hard reset if possible
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Wed, Mar 17, 2021 at 10:17 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> All recent SDHI instances can be reset via the reset controller. If one
> is found, use it instead of the open coded reset. This is to get a
> future-proof sane reset state.
>
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch, which is now commit b4d86f37eacb7246 ("mmc:
renesas_sdhi: do hard reset if possible") in mmc/next.

This breaks SDHI on koelsch (R-Car M2-W).
In v5.10, v5.11, and v512, it works fine:

    sh_mobile_sdhi ee100000.mmc: timeout waiting for hardware interrupt (CMD19)
    mmc0: new ultra high speed SDR104 SDHC card at address aaaa
    mmcblk0: mmc0:aaaa SM32G 29.7 GiB
      mmcblk0: p1

Note that I do see one timeout during identification.

After b4d86f37eacb7246 (bisected), it fails:

    sh_mobile_sdhi ee100000.mmc: timeout waiting for hardware interrupt (CMD19)
    sh_mobile_sdhi ee100000.mmc: timeout waiting for hardware interrupt (CMD19)
    [...]
    sh_mobile_sdhi ee100000.mmc: timeout waiting for hardware interrupt (CMD19)
    mmc0: tuning execution failed: -5
    mmc0: error -5 whilst initialising SD card
    sh_mobile_sdhi ee100000.mmc: timeout waiting for hardware interrupt (CMD19)
    sh_mobile_sdhi ee100000.mmc: timeout waiting for hardware interrupt (CMD19)
    [...]

Given the single timeout I see with older kernels, the issue may be that the
harder reset causes that timeout to repeat ad infinitum?

With renesas-drivers-2021-04-27-v5.12, I saw various different timeouts:

    sh_mobile_sdhi ee100000.mmc: timeout waiting for hardware interrupt (CMD19)
    sh_mobile_sdhi ee140000.mmc: timeout waiting for hardware interrupt (CMD0)
    sh_mobile_sdhi ee140000.mmc: timeout waiting for hardware interrupt (CMD5)
    sh_mobile_sdhi ee140000.mmc: timeout waiting for hardware interrupt (CMD52)
    sh_mobile_sdhi ee140000.mmc: timeout waiting for hardware interrupt (CMD55)
    sh_mobile_sdhi ee140000.mmc: timeout waiting for hardware interrupt (CMD8)

(ee100000 is the SD104 slot, ee140000 is the SDR50 slot).

The card is a brand new SanDisk Extreme 32GB A1 microSD card in the
microSD adapter that came with the card (Conrad 1553726).

On R-Car H3 ES2.0 (Salvator-XS), the card works fine, without any timeouts:

    mmc1: new ultra high speed SDR104 SDHC card at address aaaa
    mmcblk1: mmc1:aaaa SM32G 29.7 GiB
     mmcblk1: p1

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
