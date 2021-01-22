Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 141FF2FFFEC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Jan 2021 11:15:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727437AbhAVKOg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Jan 2021 05:14:36 -0500
Received: from mail-ot1-f49.google.com ([209.85.210.49]:46721 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727691AbhAVKLy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Jan 2021 05:11:54 -0500
Received: by mail-ot1-f49.google.com with SMTP id d1so4545464otl.13;
        Fri, 22 Jan 2021 02:11:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qO/k63hdlnhEnZax8qhRJ2aSsKNFiyUqnjEq6FXzBy0=;
        b=fedvoN4OLQYJSAqidDgVv2fA0DhtC3QM1uw5WVROg1/o5fpmhypfoar9IouNRiz/gK
         iPD6Exp/Es91WjAlrMOJKn/7toiBUe+yZTyl9qiLfVV5EXaod6xreevbxJrhjAFSnowz
         iSkTHZeTkK1ygz4TQl5++8Q5RXMEYhdJw/FyComfJ5TflFj1cmI8xWJqSehHJR2lnQUP
         7PGYrCx+wpOL9N8L4RHoLgWv1YUFxch+axjP81LcmdVgz6K4aegx/ZU63mBs89kiZgt5
         JPkhMlhJpgM1Lnf+kyAlXSairOc5OGpLOqZ/MF2Lq+h2NFk9sBsqIs2lUYG+HiF0yPcz
         wBxg==
X-Gm-Message-State: AOAM53046a1vFqPOLy5FQB2GzAXVZP1AqLr38ajBazkmrAQYnM1vsiyD
        /Hwa/RotYyIhA/5gFjxUsgtk4ijFJ6XF8Xs38fM=
X-Google-Smtp-Source: ABdhPJyN08c6Cj8bc52idh2ViP3eyZWobor79dvgcPtf9bxjZ9rGPUTH1CO67b+UjMRT8m9faT5bfc0U7tnJcSQedj0=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id u26mr2764880oth.250.1611310273810;
 Fri, 22 Jan 2021 02:11:13 -0800 (PST)
MIME-Version: 1.0
References: <20210121095420.5023-1-wsa+renesas@sang-engineering.com> <20210121095420.5023-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210121095420.5023-3-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 22 Jan 2021 11:11:02 +0100
Message-ID: <CAMuHMdU-QK2xLrOy-OsS=H7tN5da2wrc3TuVKiwZFy0N6ueDtg@mail.gmail.com>
Subject: Re: [PATCH V2 2/4] arm64: dts: renesas: Add I2C to R8A779A0
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jan 21, 2021 at 10:54 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
>
> Add I2C devicetree description to V3U
>
> Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> [wsa: rebased and double checked]
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Will queue in renesas-devel for v5.12 as
"arm64: dts: renesas: r8a779a0: Add I2c nodes".

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
