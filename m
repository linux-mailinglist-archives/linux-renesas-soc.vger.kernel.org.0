Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 498194A482
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jun 2019 16:54:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728903AbfFROyO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Jun 2019 10:54:14 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:52047 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727105AbfFROyO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jun 2019 10:54:14 -0400
Received: by mail-wm1-f65.google.com with SMTP id 207so3660140wma.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Jun 2019 07:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LM+2OKEQSKdylU8rGr5IJoj1Cy7TUwdWzh0ZWdYcGKo=;
        b=rhqjdnpKNX5J4PtYtHo1ps/LVLxrzC29aXDy1LkDa6vDmHXjycUamUzrAg/Kn2LTyo
         ncsR/OyeYIZirM4XnuE2mbtNq4GW9lHHfWejC+ftuEjTGhKC306bJIAz/urimxFtNQIO
         MuvymTdTZi8WJAJ4YN4B38YI9kY77Gf5bMCLM8xaC2PKlFlXLfE04vqoRoTS/nhxxxs/
         0GWA5xbQSH9W0FnjrAUFg20T/OEQuDC++f//G+XNzzwfoYa3i4XYaSrFDupgcWW7VxIN
         /6GdIF/P51I0kBQeAfriEP7nt23hn4toXWiSVmRvSe7K8hIlHqDn+RF0cvH4KZJGYKrz
         M2LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LM+2OKEQSKdylU8rGr5IJoj1Cy7TUwdWzh0ZWdYcGKo=;
        b=grN+jamdsyD89qCaBfN/g5wVDt8EwYNsZTBmYKVT/MS/l8Mxp18sunQ5x+lZ4f/STk
         CYm8IYIE31oR0JXmGf8tSvgtE/SzAs1lBjY5pQFWMHjxxf3t/+KgqGFqWsQfVDsTrVmU
         a7FnEfoHmgwOzl0+AvXxCjE/+YGb5T/rzGO7l9Ox7tBYntqcveJ9qjeT3to5uqa//OPu
         HGekahDoVUChyNB3Euww5XhBQuTLs8JLHyIbYATeNQk/VDQRg+jPomY7Uz3x1I5EYcth
         teKeRHMdeeXr1Dhl2zbH884LQfKlgWjrfrCpPBOLv6vZiAJqpjxyO5ofQ8wLDCT9PphI
         NvnA==
X-Gm-Message-State: APjAAAWE8Pa/0ln1+pAO6npPlVtiKl0bg4PKj0GBlQq5caHnIVND8Xz/
        QcHtemt8HcZfla6aWTjEljQ9yEyjrMpYnNSss45MDMY5
X-Google-Smtp-Source: APXvYqz6F77BJldkIK+YZvXH7iOgj5Z6EuOT8Q/GiQwuXA2SfBvIvuvvqXYR7+q4vCjzGZ5eKHCBsGSOtRfgk1xiHXQ=
X-Received: by 2002:a1c:c915:: with SMTP id f21mr3728615wmb.123.1560869652050;
 Tue, 18 Jun 2019 07:54:12 -0700 (PDT)
MIME-Version: 1.0
References: <156076560641.6960.5508309411424406087.sendpatchset@octo>
 <156076562362.6960.14055306539589207977.sendpatchset@octo> <CAMuHMdXtsmAt74ovptOQp42fqWwYe=k7Lp3LTO2Jg353jykSDg@mail.gmail.com>
In-Reply-To: <CAMuHMdXtsmAt74ovptOQp42fqWwYe=k7Lp3LTO2Jg353jykSDg@mail.gmail.com>
From:   Magnus Damm <magnus.damm@gmail.com>
Date:   Tue, 18 Jun 2019 23:54:00 +0900
Message-ID: <CANqRtoRGCRhNS9O12JTrqYV34iv_UQbTMUtNveJzRiNti6a+Dg@mail.gmail.com>
Subject: Re: [PATCH 2/3] clocksource/drivers/sh_cmt: Remove "cmt-48-gen2" support
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Tue, Jun 18, 2019 at 11:01 PM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Magnus,
>
> On Mon, Jun 17, 2019 at 11:59 AM Magnus Damm <magnus.damm@gmail.com> wrote:
> > From: Magnus Damm <damm+renesas@opensource.se>
> >
> > Since late 2017 the DT compat string "renesas,cmt-48-gen2" has not been in
> > use in the upstream kernel. SoC-specific strings and the fallback string
> > "rcar-gen2-cmt1" are now used in the DTSI instead.
>
> Not really: since v4.16, which was released on Apr 1, 2018, i.e. after v4.14,
> the base for the latest LTSI kernel.
>
> Note that the removal commits were backported to v4.14-ltsi, but not to
> v4.14.y.

You are right. I was looking at the commit date in git of:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=98b6b8b493a99d828e6665e6e67d6ca077c1aee0

Actually the first version of the series  "[PATCH 00/08] clocksource:
sh_cmt: DT binding rework" was posted in mid-2015, but I guess I lost
interest at some point. =)

Thanks for your help!

/ magnus

> > Remove "renesas,cmt-48-gen2" from the CMT driver.
> >
> > Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
