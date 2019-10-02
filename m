Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF344C4989
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Oct 2019 10:32:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727477AbfJBIcS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Oct 2019 04:32:18 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:43344 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725917AbfJBIcR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Oct 2019 04:32:17 -0400
Received: by mail-oi1-f194.google.com with SMTP id t84so16910629oih.10;
        Wed, 02 Oct 2019 01:32:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1SZ7coY+93hLayy+UPZDVVEV5oNU1ClIbY06U8Y9F+8=;
        b=G6CXQeJICpH94kTTMNS94HfZYwoAsV+8yBLVwXEVbDDfaff4sXMWa39gkW6Gk+yK6j
         38Bs48nonVN4eqv35CrI6VqIEm/CwrKcx2XBZ5plg1PjZ1FAu0Lb9bhg9IwEOxOH7w7l
         ncH+AhVqc+d8u0Q/Va595gDBoEMgYeQT5odKXCZOLhF3GaeDbmYR4YjBetgZoYjCgNIw
         TbA1M6CHc528xNQsT8uRYJmila25yCoMMbCZvK1UlAtK3XSn2JmK6vR5xWjurp3RdB4r
         9lJIPpGlScHy/zClT0QqGp3OXFronghijxwZNdNcR20F5yKkx7JkrcxsD/dSCjXcF0ql
         JXEQ==
X-Gm-Message-State: APjAAAWzedDddDfQywleGVCm3JGcEPfvhr8LkTdA7oY6ykvk1dvXhzkp
        JPKqb9G1kuxeGyg4Qb5Tu/sW9Lnz4nJkbmtec0A=
X-Google-Smtp-Source: APXvYqxBYlABRaFbj+k7SkmjTKn5s54uvnIjC8yaNo55nqUAi/zSK3UjKGJb+eJgJ+SLksQby2F1iUlnXWTU3f2DkdU=
X-Received: by 2002:aca:dad4:: with SMTP id r203mr1964692oig.102.1570005136781;
 Wed, 02 Oct 2019 01:32:16 -0700 (PDT)
MIME-Version: 1.0
References: <20191001180834.1158-1-geert+renesas@glider.be>
 <20191002081553.GB1388@ninjato> <TYAPR01MB454472C76E03930717A2898BD89C0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
In-Reply-To: <TYAPR01MB454472C76E03930717A2898BD89C0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 2 Oct 2019 10:32:04 +0200
Message-ID: <CAMuHMdWBghL8Em0OoCKjJdU7OiY_pV3Lmc=SXhV2yY=sKJJ-aw@mail.gmail.com>
Subject: Re: [PATCH] mmc: sh_mmcif: Use platform_get_irq_optional() for
 optional interrupt
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jiri Slaby <jslaby@suse.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san, Wolfram,

On Wed, Oct 2, 2019 at 10:26 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Wolfram Sang, Sent: Wednesday, October 2, 2019 5:16 PM
> <snip>
> > Tested on a R-Car H2: it does make the error message go away and the
> > MMCIF device acts normal during boot. Can't enter userspace currently
> > with v5.4-rc1 but this is unrelated to this patch and MMCIF. Looks like a
> > configuration thing on my side, so I will still give:
>
> I also should have reported this though, my environment (R-Car H2 + NFS +
> buildroot on v5.4-rc1 with shmobile_defconfig) also has a similar issue
> like the following:
>
> [    3.573488] VFS: Mounted root (nfs filesystem) on device 0:16.
> [    3.579869] devtmpfs: mounted
> [    3.588014] Freeing unused kernel memory: 1024K
> [    3.651771] Run /sbin/init as init process
> Starting syslogd: OK
> Starting klogd: OK
> Initializing random number generator... [    4.073629] random: dd: uninitialized urandom read (512 bytes read)
> urandom start: failed.
> done.
> Starting network: ip: OVERRUN: Bad address
> ip: OVERRUN: Bad address
> ip: OVERRUN: Bad address

Please cherry-pick the top commit from renesas-devel:
6e47c841329eb9b0 ("ARM: fix __get_user_check() in case uaccess_* calls
are not inlined")

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
