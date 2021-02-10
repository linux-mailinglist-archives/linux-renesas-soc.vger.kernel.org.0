Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 658FE3162CC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Feb 2021 10:54:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229812AbhBJJxy convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Feb 2021 04:53:54 -0500
Received: from mail-ot1-f45.google.com ([209.85.210.45]:47010 "EHLO
        mail-ot1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229731AbhBJJvw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Feb 2021 04:51:52 -0500
Received: by mail-ot1-f45.google.com with SMTP id r21so1215424otk.13
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Feb 2021 01:51:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=p15BTcj2npK9C4gDTBa+7ZQz8RWNNtxRRUe/4eo6M5E=;
        b=OXNDWm9K5kbdkDtsVFLx1FGwcG1JQMoO38VfPetzZV5NxnCzj5G9+DW3ihzSXfrPef
         70EK+3RzjMcxtWzmLe1eWfYYMcP2QY/8rtmb4PykmnEQjHDVM0vL9jGxu0nx6N1DxAWg
         C6XUNxApo/+eayZAXhMy8imnugfIYUWpwCe4o50J+P/VMKy004MTQyEvMX1+tzzt/HhM
         vjIFSRuKltv1ac/diT9vXcR+ZHeLBzy4GefszlWvbI4u2hQK536+efpLf6YdhPACTszo
         oPgh2zYEirsaDAmwdZZUyP4kL5XgZPueEi7JtyHNvA2AIkrJ6q6Jvkjr8rxatMqpx0aP
         3usw==
X-Gm-Message-State: AOAM530r5ISyf7BqUYkAU5MCOrkfvxROr0kpNJxzonJbyP/cwcEJF0u6
        GHZxPEs9ILXj+WvCp/cV7iTS36LPH1FBU97gsJM=
X-Google-Smtp-Source: ABdhPJxlv1lzDawcbZ7Yhn83KZKO74k4JChmIKdB3lgHGVdh3kq67KCCfjd/UPAPPqJ0b5+mzggidsCf4L8/PidAWEY=
X-Received: by 2002:a9d:77d6:: with SMTP id w22mr1518841otl.145.1612950671367;
 Wed, 10 Feb 2021 01:51:11 -0800 (PST)
MIME-Version: 1.0
References: <20210204135409.1652604-1-geert+renesas@glider.be> <1749889389.830679.1612948308452@webmail.strato.com>
In-Reply-To: <1749889389.830679.1612948308452@webmail.strato.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 10 Feb 2021 10:51:00 +0100
Message-ID: <CAMuHMdXKwHMU4JDf=k+3=+WF_mzVK8hWsfkUM8H8-b-CQgWq5Q@mail.gmail.com>
Subject: Re: [PATCH/RFC 0/6] ARM: r8a73a4: Add SMP support
To:     Ulrich Hecht <uli@fpond.eu>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Uli,

On Wed, Feb 10, 2021 at 10:17 AM Ulrich Hecht <uli@fpond.eu> wrote:
> > On 02/04/2021 2:54 PM Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> > Questions:
> >   - Do we want to bring up the Cortex-A7 cores, too? We don't on R-Car
> >     H2 neither.
>
> What still needs to be done for that?

Revert ee490bcc4f2d456c ("ARM: shmobile: Extend APMU code to allow
single cluster only")?  Looks like Magnus only wanted to enable the boot
cluster, due to lack of big.LITTLE scheduling support?

> [I recall having issues bringing up the A7 cores on my old APE6 board (that has since failed and been returned to Renesas). The kernel failed to bring up the A7 cores if enabled at boot, but I was able to enable up to three (any three) of them one-by-one via sysfs. I'm not sure if that was specific to that board, though.]

Disabling the check makes the A7 cores start on my APE6-EVM.
Userland (Debian nfsroot) boot fails in the middle though, when systemd
fails to send messages to one of its brethren.

With a ramdisk, everything seems fine.  I can even offline/online CPU
cores from sysfs at will, which failed before!
Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
