Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 837FD27592A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Sep 2020 15:52:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726594AbgIWNwn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Sep 2020 09:52:43 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:46236 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726516AbgIWNwn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Sep 2020 09:52:43 -0400
Received: by mail-ot1-f65.google.com with SMTP id 95so11733089ota.13
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2020 06:52:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hP77MnXOSdJjZ5rkcpRVraddooyBWO8HTmP9cNLnf7M=;
        b=BPLUSPSgPFBuXOEnR0K9RD1GmHCaeFU/tCTt+CJc3IS7k0V+Xl5End+P2gkA1meB6x
         IgDqoaSlzha/MFbmE/6m05JoeKlIocuFatZ8irEopL9ytHzTDBOab2npY7p+gPU0DlDc
         m+2FK6cfEdUvlRBu+dk2seuDwXf/aoaeZm5RkAGTo4FmDUDiRYeIJ7LJt69nwKfJU0Pb
         LRbKKPRfjtBUVyWH+CGB9JqMM67W7AFXL5AvYJ+eqmUlEyV7KioKq9IIHSx1eCDAbaAH
         e5nSBbKToYnIIFY7tGQX5RZY/zSY0IB3lttOt9I8ZLS72gJn9gINIu8V3nu7D3r/WC3k
         bHOA==
X-Gm-Message-State: AOAM530mvg+sQhL0+uonBNYvPUPbUjWq8ecqG2CumO1uiQ8ZUmN30Sxr
        FeQ5n8hnT1LNGmkqWYBTLaCFiOauSSsilqRiTsC77n0Mf70=
X-Google-Smtp-Source: ABdhPJze1RlseuZ8GO8UEpA4yV6gdOk2MOeGY9KcIUujHXvWbkruvzAKmW4BT/A7tziabE4LiBlzQZfPSgbAXdFEmx4=
X-Received: by 2002:a9d:3b76:: with SMTP id z109mr6335094otb.250.1600869162597;
 Wed, 23 Sep 2020 06:52:42 -0700 (PDT)
MIME-Version: 1.0
References: <160056199852.9912.5581183514421117508.sendpatchset@octo>
In-Reply-To: <160056199852.9912.5581183514421117508.sendpatchset@octo>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 23 Sep 2020 15:52:31 +0200
Message-ID: <CAMuHMdWxi7HJHKLGZ0XysF+Hpg3uvsijcqSe7=r_EE6W-bF4Eg@mail.gmail.com>
Subject: Re: [PATCH 0/2] r8a77961 CMT test setup using UIO
To:     Magnus Damm <damm@opensource.se>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Magnus,

On Sun, Sep 20, 2020 at 3:04 AM Magnus Damm <damm@opensource.se> wrote:
> r8a77961 CMT test setup using UIO
>
> [PATCH 1/2] r8a77961 CMT0 device exposed via UIO
> [PATCH 2/2] UIO CMT test program
>
> These two patches contain kernel and user space modificatons to allow some
> basic testing from user space of the CMT0 device included on the r8a77961 SoC.
>
> For the kernel, simply apply the kernel patch (including a few debug printouts)
> and make sure to extend your kernel config with CONFIG_UIO_PDRV_GENIRQ=y.
>
> The following log shows how to execute the test program on the target:
>
> # ./uio-cmt-test
> found matching UIO device at /sys/class/uio/uio0/
> CLKE
> CMCSR
> CMCOR
> [   12.284451] irqhandler 20
> waiting 10s
> UIO write
> CLKE
> UIO read
> got CMT IRQ
> CLKE
> #

I guess you could test this device using the sh_cmt driver, and a generic
userspace timer test program (from tools/testing/selftests/?), too?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
