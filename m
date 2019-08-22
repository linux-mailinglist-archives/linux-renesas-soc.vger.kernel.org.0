Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A665B995DB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2019 16:06:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725876AbfHVOGs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 22 Aug 2019 10:06:48 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:41343 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732826AbfHVOGs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Aug 2019 10:06:48 -0400
Received: by mail-vs1-f66.google.com with SMTP id m62so3855116vsc.8
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Aug 2019 07:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ORoXk3ZRgS9jNvpYbPqyKBVgMLRQQ2XXmWQM0+FO+2s=;
        b=YjGutaIEKQQg7bK1PbmrU22QMjesLDtGq1M7YyipAYmjv0BysgkKcwRKWyE03reNms
         KVBv7Sa2TDaY0LQ4PREzb11q1oqe44oqc8rpqY6v5o/t6mbSu/FBNFJq2x4RcwDZnEYg
         D6m9wuYzlFMldCAtxCWyDvwQuTuR3ZLCtiX8uBLIubScwixfcCyOC81SC2jC8QiC5H2w
         plYH8TdhVyHWB1AmotFWqyaAutI8MKhbSU/cqcnpd7q7sTg75LSAcT6+sSWpOdgja0tj
         GeEb5Muu0jS9YyBvZXFCsMvAqVG/KE11RsWgT18ZQ887OaDmXCdgW1WgELzDHJbrhHsj
         VJrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ORoXk3ZRgS9jNvpYbPqyKBVgMLRQQ2XXmWQM0+FO+2s=;
        b=BRg3fK5j62i7oAb9f6ydhnZqm14rcASK7W3q3kohEX7k2syf8SajXD9ZgTBPJi/gyq
         BbWXVHR1IqeOan/zM4msRtvPU34zHLI2aoocfAUVT3VFeBdTEl6sEOEQOsAboX/qsLfm
         /0+rl1RXTo+WDCjbrN1kyJbb8N6bCEwvJGiWgLEcH57UCitSxg7A8X6nCLG7jVvGTUmk
         9jX2fuJdW33s3rkzQqgzSIormst6En6ivNZHOiy0zbZTuBg1IRKdC4z21bW7iPEOJzDx
         NEIP8eS7GQlulPpDswXFgYhvsBOqaEBdFwy397QMTqzZnv9QHIMPoiIjT7Oi5NzugErx
         uPGQ==
X-Gm-Message-State: APjAAAXnXqj8RcGqU1yrAg5JrTOYidoDYKPpCfpv7CLbLKxR59StRR5s
        K/atN6aS1U2rnchiOL3GJ054wabGc3na7m4H9OcpIw==
X-Google-Smtp-Source: APXvYqwd0MR/AjKq7X5DIo4hlw0s9CbrfREkUSY1oCN+DOSok5K61/0F/77Aw5POZ4JLfRKSpMjBam1wPm4MEBJzZEM=
X-Received: by 2002:a67:347:: with SMTP id 68mr19112864vsd.35.1566482806765;
 Thu, 22 Aug 2019 07:06:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190816125225.16061-1-geert+renesas@glider.be>
 <20190816125225.16061-2-geert+renesas@glider.be> <20190816180123.6299720665@mail.kernel.org>
 <CAMuHMdVvwsXU2YwFRA2Y2K9KKzF4L-hqDudarmc-OeHXRMCifQ@mail.gmail.com>
 <20190817034812.5435B21721@mail.kernel.org> <CAMuHMdWpUEt-wxEdAK7NsAOadS5TtHYdO=JTGT=CtSROHuR+Pw@mail.gmail.com>
In-Reply-To: <CAMuHMdWpUEt-wxEdAK7NsAOadS5TtHYdO=JTGT=CtSROHuR+Pw@mail.gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 22 Aug 2019 16:06:10 +0200
Message-ID: <CAPDyKFpr7fw_rCciXzZNk2is8KFkd7Tvdx-fzyka_vobCK0U=g@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: renesas: mstp: Set GENPD_FLAG_ALWAYS_ON for
 clock domain
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Kevin Hilman <khilman@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

[...]

> >
> > Well is it actually a problem to not specify the flag? I guess it's just
> > a potential problem if the genpd is ever powered off, but given that the
> > governor decides to leave it always enabled it doesn't actually matter?
> > So it's not really fixing anything besides silencing a harmless warning?
>
> The warning is indeed harmless.
>
> The "interesting" case is the case where no warning is printed, as no
> IRQ-safe device is present.  In that case, the absence of the
> GENPD_FLAG_ALWAYS_ON flag means that the core PM Domain code will
> consider the domain for power-off, and will loop over all devices part
> of it, which is suboptimal.  Setting the flag avoids that.
>
> Thanks for your continued questions, it made me realize I need to add more
> meat to the description to these "simple" patches!
>
> For the PM people: would it make sense to add a
> WARN(!genpd->power_off && !genpd_is_always_on(genpd), "...") check to
> pm_genpd_init()?
> Or set GENPD_FLAG_ALWAYS_ON automatically if !genpd->power_off?

Well, wouldn't it be possible that the power is provided through a
master domain, thus not having the ->power_off() callback assigned for
the subdomain is perfectly fine, even without having
GENPD_FLAG_ALWAYS_ON not set.

Kind regards
Uffe
