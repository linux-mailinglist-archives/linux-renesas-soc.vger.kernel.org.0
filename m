Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F34644264F7
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Oct 2021 08:57:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231749AbhJHG7u (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 8 Oct 2021 02:59:50 -0400
Received: from mail-vs1-f46.google.com ([209.85.217.46]:45686 "EHLO
        mail-vs1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbhJHG7t (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Oct 2021 02:59:49 -0400
Received: by mail-vs1-f46.google.com with SMTP id v4so9407778vsg.12;
        Thu, 07 Oct 2021 23:57:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e3UH8K2mYfVBOaQwiO1bdnqvu7itzmuR1CatwA3yLKQ=;
        b=sxjiTSGONp7nyJ8UCiV8LQwIwL+E3rLvriFPhkYESMzk20OD2WeVXRjxsLoSPEtfIm
         3jl8MIfQOfaK42ihJi/h28S9XOALPrkDBedDUuFhuD+NPA4EpzD2Ot5WTObuZplbuRnO
         0jdvZ7SMPwt8fT8V5AoObpE+hY+qnYRjhDJEte5gvpo7+vwEpl76Bjy+YnlQviaXN9y5
         yCG8CJot7Fd1NnVgqICDxO7FEAOf38sXLl0Od47Q1g/AFHvIGKubs6D8ONaBhzNqkVst
         g16hqWVIejJ1eFDm9Ed4Z9lvunw+FwrUX9lizamoXfCdBWz8dxziKFsUJMq0kp+LAIdw
         67ww==
X-Gm-Message-State: AOAM532prsNTVqYmt/5ZTNHQnxmXI8aBahdFXNtCOwf32kFIe40Ys75f
        qDFRuyiVVdVZHCYGZSleqCMwnKpMqQLXgX4zXOc=
X-Google-Smtp-Source: ABdhPJwdPbcSoa5fWsxxXTHrjYFhPKXFzPY4EQumoVkiygOMbaWUf2oWeJsuBRZP7MXXd87P2HXCxo4sAw3AnHERDhw=
X-Received: by 2002:a67:ac04:: with SMTP id v4mr9065810vse.50.1633676274387;
 Thu, 07 Oct 2021 23:57:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210929213431.5275-1-nikita.yoush@cogentembedded.com>
 <CAMuHMdWBJSPWR+Tb87GcJiv_xkYjToOarTcHu8doAFsCECEd=w@mail.gmail.com> <173675cb-53e4-8d7e-eb6e-83824877da1b@cogentembedded.com>
In-Reply-To: <173675cb-53e4-8d7e-eb6e-83824877da1b@cogentembedded.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 8 Oct 2021 08:57:43 +0200
Message-ID: <CAMuHMdW7SQZmhRhWZpOzPMrX492c+9+rRPmAO23n=J2xc0JOTQ@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r8a779[56]x: add MLP clock
To:     Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrey Gusakov <andrey.gusakov@cogentembedded.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Nikita,

On Thu, Oct 7, 2021 at 10:09 PM Nikita Yushchenko
<nikita.yoush@cogentembedded.com> wrote:
> > These additions look fine to me.  I'm only wondering about the
> > actual parent clocks, which are not well-documented in the Hardware
> > User's Manual.
> > It does say that MLP uses the Audio main bus (AXI).
> > The related AUDIO-DMAC uses S1D2, which runs at 266 MHz, while S2D1
> > runs at 400 MHz?
>
> This patch was included in this form into Renesas BSP for years.
>
> Indeed, the information on the parent clock is missing in the manual, and can be inexact here. I've sent
> a question to our contact at Renesas but not sure they will reply.
>
> But, AFAIU, these parent clocks are not software-controlled, so having them wrong does not result in any
> issues other than inexact information exported via sysfs/debugfs.

True.  So in case we don't get feedback, I'll take this patch as-is.

> > BTW, do you plan to enable full support for MLP in the upstream kernel?
>
> Yes, we are upstreaming full KF board support now.

I'm happy to hear that, thanks a lot!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
