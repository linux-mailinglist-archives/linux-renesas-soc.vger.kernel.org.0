Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7C8E44E75E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Nov 2021 14:32:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232299AbhKLNex (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Nov 2021 08:34:53 -0500
Received: from mail-ua1-f44.google.com ([209.85.222.44]:47059 "EHLO
        mail-ua1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231553AbhKLNew (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Nov 2021 08:34:52 -0500
Received: by mail-ua1-f44.google.com with SMTP id az37so18743864uab.13;
        Fri, 12 Nov 2021 05:32:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z9iJ184pTnCaa6ehbVjWTeQI8DGobiB3mmOI1dCbKMU=;
        b=v0uk5NzFmZ7DarP6nytOQsBualYjA303HW+f08k/Y4Xu4fBvxjwE6563R7xsqCR5Wh
         x8QN3AmjBaRGmQP0596KWPMf20u7TLJMO0gKVQfGS2DdH/tyrokmMcX/x0ucuvSZ9ylg
         PhhGLBZfeV0f3XttdH5pkjSTigDbgF1OhV1LTcHbZ2uKCb+rYYMdDf78SOhAwEUDbqMX
         W6q2eGBS1ho/t1u1f3EZp0DQvoNOkkHLOi7cbggrKWH5kOAmMVrb1FXzliQvsA+Wy/9v
         mlXI3tPKCh3LA3NCAeBZokLrCYthop3sAlG5N/tX5yUgEVwQGsuDXjO9AgZJnArdWP7J
         iaOQ==
X-Gm-Message-State: AOAM53237HLKGYxOrcH0nABzs17gDDqfSx2DQf8MsltjrZkAYO1MKrGK
        OTaXnJIC5H5tqhuJTvGIYYlFbPkBFxv88g==
X-Google-Smtp-Source: ABdhPJwdpA3KA/VatzV0YVmzKG3RI5cAmXDu8LPaCkFfkcbUY9M4Qn7WPOCXDMDu8UkeUoBJ3VDuUQ==
X-Received: by 2002:a67:d893:: with SMTP id f19mr9887778vsj.39.1636723921413;
        Fri, 12 Nov 2021 05:32:01 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id v1sm4282811uac.18.2021.11.12.05.32.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 05:32:01 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id v3so18715425uam.10;
        Fri, 12 Nov 2021 05:32:01 -0800 (PST)
X-Received: by 2002:a9f:2c98:: with SMTP id w24mr22400546uaj.89.1636723920843;
 Fri, 12 Nov 2021 05:32:00 -0800 (PST)
MIME-Version: 1.0
References: <20211110191610.5664-1-wsa+renesas@sang-engineering.com> <20211110191610.5664-19-wsa+renesas@sang-engineering.com>
In-Reply-To: <20211110191610.5664-19-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 12 Nov 2021 14:31:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV=ZA6rnu=cECVPAEbAeWhe+BGGa=5GqyEakM6rZ62urg@mail.gmail.com>
Message-ID: <CAMuHMdV=ZA6rnu=cECVPAEbAeWhe+BGGa=5GqyEakM6rZ62urg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 18/21] arm64: dts: reneas: r8a77995: add SDnH clocks
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Nov 10, 2021 at 8:16 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.17.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
