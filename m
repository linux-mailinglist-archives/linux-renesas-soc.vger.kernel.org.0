Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49F3D23E884
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Aug 2020 10:05:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726935AbgHGIF6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 7 Aug 2020 04:05:58 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:42094 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726883AbgHGIF6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Aug 2020 04:05:58 -0400
Received: by mail-ot1-f68.google.com with SMTP id v21so951663otj.9
        for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Aug 2020 01:05:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9UqOkBePeXl2do0EQfJwqC0nc4d1dhIMMZ652eS9wVg=;
        b=oeTSBNH57B5k0BG6pJG3nXTxEXPdb2EUNVehTRNqS4geqF6l5yPJb24rFCGRvdM82q
         AVf3qAx1TmjIIRe8PLimLGAcptGvXhkQqIj/QWNd379iE88KFpQi6eqKWt5KQQqLDrPs
         Ow0oJ/V8bZxZCKEvaVg8ZOx5TgC/e8zNfWH8favKQyPJ9ENCrMQk4OT1jd9x642aD3sF
         Ie9I6xLlvyjDdFYm8pHWHo5ovQiU55WSiE6reIk1n8I3sXDymYh9rbicYO8T5AZUoBtG
         vI+NAMCYdAwbYq3qktZad8YR6VtHkhX3QuNgzvdxUKJMz6iRHjXA6cslTPKIjKCekr4m
         ycDg==
X-Gm-Message-State: AOAM533EHEOWCwJH67WbsPt2PTtRISJTVUmn1TsrThdErGJSn55G+h84
        Y3OKOc46Hv8WJLdoamwevFp4aamuHQ1i8wMbOGo=
X-Google-Smtp-Source: ABdhPJwSnA4TRgtr6oiVOXAOpDSUd59xIOF4GM9zCrN/IjRaql6sxUwCfQcGMlgBo7aDqn6oVfLa/szyysBdrmNsNzQ=
X-Received: by 2002:a9d:1b62:: with SMTP id l89mr69282otl.145.1596787557447;
 Fri, 07 Aug 2020 01:05:57 -0700 (PDT)
MIME-Version: 1.0
References: <CA+V-a8vFU24w0XYxsksZMJF5iLbT8UU_q3UieCRyWDH9BwVpzQ@mail.gmail.com>
In-Reply-To: <CA+V-a8vFU24w0XYxsksZMJF5iLbT8UU_q3UieCRyWDH9BwVpzQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 7 Aug 2020 10:05:46 +0200
Message-ID: <CAMuHMdW9CrG6__-L89ZPvN0H_SJyNmf3RcojHJaAx8M5FJOm_A@mail.gmail.com>
Subject: Re: EXT4 issues on block devices
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Thu, Aug 6, 2020 at 7:01 PM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> During adding support for SATA on RZ/G2H, I was trying some stress

RZ/G2N, according to the logs?

> testing on the stock 5.8.0 kernel.
>
> $ dd if=/dev/urandom of="${TMP_DIR}/random-data" bs=1M count=1000 # Works OK
> $ time bonnie++ -d "${MNT_DIR}" -u root # Worked OK, as Biju pointed
> out earlier he had seen an issue with this and disabling
> CONFIG_PROVE_LOCKING fixes it.
> $ for i in {1..50}; do echo $i;cp random-data random-data-$i;sync;
> done # This is where I saw random kernel panics/EXT4 errors
>
> To prove it out it's not the SATA I switched to USB3 and kept on
> seeing similar issues. To make sure if the device is OK I tested the
> devices on VLP1.0.4 release and saw no such behaviour.
>
>  I have been using renesas_defconfig + enabled modules + added USB3
> firmware file
> * Tried disabling cma (cma=0 in bootargs)
> * Before mounting the device made sure I run e2fsck
> * Also ran badblocks tool on the device and saw no issues
> * Disabled CONFIG_HUGETLBFS/CONFIG_ZONE_DMA32
>
> I also tested on R-car M3N with renesas_defconfig and saw no issues
> with USB ext4.

I assume you can run the same kernel on R-Car M3-N and RZ/G2N, if you
enable support for both SoCs.  Does that show the problem on both?

> Any thoughts on what could be causing this issue. (I will start
> comparing the VLP kernel)

What's the VLP kernel?

If you have two kernels, one that works, and one that doesn't, you can
bisect the issue.  Might be not so simple, if the two versions have
diverged, but you can always try rebasing the newest tree on top of the
oldest one, and run git bisect on that.

Your log for M3-N doesn't show the firmware boot log, but your RZ/G2N
board has "Lossy Decomp areas".  My R-Car M3-N Salvator-XS doesn't
have those.  Also, there may be a difference in the QoS settings.

Good luck finding the cause!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
