Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57EC725FA26
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Sep 2020 14:08:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbgIGMHd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Sep 2020 08:07:33 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:33387 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729217AbgIGMFn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Sep 2020 08:05:43 -0400
Received: by mail-oi1-f196.google.com with SMTP id 3so13426327oih.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Sep 2020 05:05:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ogpylFzTn2kfN36oWQVhI7nhTMEW5QN+jj9Cn5tSGbs=;
        b=d5lMp4cZ20s7WhmMf+WVlhtdm9eF2ASb8rZ6Q1E8IfpYDAapWGjRnwhHf4TxiWKRZi
         adXgBwZzX9GYF7skmzAby/4wfgkh9Ph9TjztFMJrmk1ZA1tSAFeaboo//gUZYIrtE24c
         LXp6Ln1rDENOqy0bYtGJmEzQXBKk/k/4Od3NIxn8EDdf4iN+t9PYjE37qA5x7Aj9FXb8
         9gO3ActNjl+TWIGbXVMEA1mWyIDfLIgQ+rxrrRMWadTXgU+qM7sJBtcCSCnoI8Rkho4Y
         Gim5e9ZtzYtYlTwjfqvh7n2g8nlwM6eMyqQ8ZaWT2ybPCO+26u7uZIk8uoufAQcnc0Xs
         ehmQ==
X-Gm-Message-State: AOAM530RbBtn2KKXaAgjQfxP56dpmOqIztYVKvO/U5O8mJOgr0Sj9O2S
        f44lTtc/QBhVWMakquz6eOuY32BKxubVI/Nh/wE1SzI0PZw=
X-Google-Smtp-Source: ABdhPJwIO2xICSBjXiyD05PZHFgXop550bEezlO1OAnh9gvtCpzFAMJk4W2P4xHUA6MfbZ3Bta/OSdeCN03JvRL5gro=
X-Received: by 2002:aca:4441:: with SMTP id r62mr1181405oia.153.1599480342238;
 Mon, 07 Sep 2020 05:05:42 -0700 (PDT)
MIME-Version: 1.0
References: <CA+V-a8skJu_kqqWqvv=ar20tFv48EfQePV8XQ=7eBYJuJui9eg@mail.gmail.com>
In-Reply-To: <CA+V-a8skJu_kqqWqvv=ar20tFv48EfQePV8XQ=7eBYJuJui9eg@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 7 Sep 2020 14:05:31 +0200
Message-ID: <CAMuHMdUvBaNmtwHN=N055RcfOWt_uO=U6S7wy26s=U=i+DXS_g@mail.gmail.com>
Subject: Re: bonnie++ causing kernel panic
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Fri, Sep 4, 2020 at 11:04 AM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> I am seeing "Unable to handle kernel paging request at virtual address
> xxxxxxxxxx" panic while running bonnie++ (version 1.04). I have
> managed to replicate this issue on R-Car M3N, G2[HMN]. I have been
> using renesas_defconfig for all the platforms and I have tested on
> Linux 5.9.0-rc3 for all the 4 platforms.
>
> Initially I was testing bonnie++ on eMMC device and later discovered
> even running bonnie++ on NFS mount is causing this issue. I have
> attached the logs for M3N while running bonnie++ on NFS and logs for
> G2N while running on eMMC.
>
> I even traced back to 5.2 kernel where initial G2M support was added
> and still able to see this issue.

Thanks for your report!

While the crash symptoms seem to be the same in all crash logs, the
backtraces aren't.

Does disabling SMP (maxcpus=1) help?
Does switching from SLUB to SLAB, and enabling CONFIG_DEBUG_SLAB
reveal memory corruption?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
