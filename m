Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43A0930255F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Jan 2021 14:17:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728379AbhAYNO2 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Jan 2021 08:14:28 -0500
Received: from mail-ot1-f54.google.com ([209.85.210.54]:46292 "EHLO
        mail-ot1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728655AbhAYNNK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Jan 2021 08:13:10 -0500
Received: by mail-ot1-f54.google.com with SMTP id d1so12618004otl.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Jan 2021 05:12:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=IsT6ga5KS5x7tfYE6Idz9dAAqs/81AeLETCFt0mKlL8=;
        b=VNlHtmSv6QUJh59GkVs7nsAaTEhHMzL9J/wBRI2HANxekH5A0v5GlSzjsX8nIAk9Jc
         iah1aV+QoAR0rvBRVMd1CucuDzAeCIaMEd/s/LEgc/rHe0hp8bjYbeSZRUNIdlOtehgw
         DkpvPGh+iwj7tL6kVEICpJCibujklkpcOtAZkYESqFy1Pwl2MtXLweY/tAmWLRlkjuQO
         ZY8KPHbanklUqo39yvv8t1COvpg+naxCHtgfFOh0DLNbAfAgfqSrPfcAnpOj0/JktcSN
         3wC0ZQF/s2b8N10voElgDUZHtluwQY2t3VFQlBrsyjFA8HP6Sst7ORQX56bNUL2vIMZk
         rIGQ==
X-Gm-Message-State: AOAM530jvzwPkGe06e72sayOhqyrapA7jadQ//RSMWjKoKiiK4sKp7dg
        VAmCT3bQCPqQ+WUHibzzq55dGf1JojMX3gzQu7XoOn28
X-Google-Smtp-Source: ABdhPJyzBjZPlnyvBC3ru+HvtVTvM/i6VeLoe1f3MMxYqnvFNh1UhrimAsiMY7H2AUGs8aeOPP5oQgIdfTC9e7bnLy0=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id u26mr395773oth.250.1611580348656;
 Mon, 25 Jan 2021 05:12:28 -0800 (PST)
MIME-Version: 1.0
References: <20210122113637.2833489-1-geert+renesas@glider.be> <YAshsZKxlmjjKJTH@oden.dyn.berto.se>
In-Reply-To: <YAshsZKxlmjjKJTH@oden.dyn.berto.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 25 Jan 2021 14:12:17 +0100
Message-ID: <CAMuHMdXTC_=DfSGhpnq3NHcGHcgotWB4cpua5nKC9oH=Gbb8Rw@mail.gmail.com>
Subject: Re: [PATCH] soc: renesas: rcar-sysc: Use readl_poll_timeout_atomic()
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Niklas,

On Fri, Jan 22, 2021 at 8:04 PM Niklas Söderlund
<niklas.soderlund@ragnatech.se> wrote:
> On 2021-01-22 12:36:37 +0100, Geert Uytterhoeven wrote:
> > Replace the open-coded polling loops by calls to the
> > readl_poll_timeout_atomic() helper macro.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > --- a/drivers/soc/renesas/rcar-sysc.c
> > +++ b/drivers/soc/renesas/rcar-sysc.c

> > @@ -101,8 +100,7 @@ static int rcar_sysc_power(const struct rcar_sysc_ch *sysc_ch, bool on)
> >       unsigned int chan_mask = BIT(sysc_ch->chan_bit);
> >       unsigned int status;
> >       unsigned long flags;
> > -     int ret = 0;
> > -     int k;
> > +     int k, ret;
>
> nit: I would make k an unsigned as it's now only used in incremental
> loops starting at 0.

That was the case before, too, wasn't it? ;-)

> With or without this unrelated nit,
>
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Thanks, will make the change.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
