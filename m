Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F14202E0887
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Dec 2020 11:11:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726123AbgLVKLF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Dec 2020 05:11:05 -0500
Received: from mail-ot1-f53.google.com ([209.85.210.53]:39421 "EHLO
        mail-ot1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725807AbgLVKLE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Dec 2020 05:11:04 -0500
Received: by mail-ot1-f53.google.com with SMTP id d8so11451562otq.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Dec 2020 02:10:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dOtg3wXhUmmHlB+k4Tsa4Q/umjsI6utL1bk+yGBvTSY=;
        b=mTC4p1j4Et+G3/SKfb4ru6M1JfkH4ZlborUMw8d8hpdVCNVPyOsG2rA8GmCZcQbOQf
         0OKxPNmD8yaWPy/qKmKAmvyQSeoDbyz65q76CXZ4nfo9m0tCidkCTPVG350+iHMfOgrb
         trtJikPrEz4i6zfZW1I78IwpwS0S6LB3ZrVRV2gBZEkjFvJw938q5hWgkJ9pdyyB7YJQ
         ImHaVszQc8AlAZz1gDAwL5kPb0DLaFWJuo4ZDzbca8rNPUv9XJsjwGHoV68QF5LE6JYR
         tEdZvlLShRmTdalxWMWkMYP10ok2sq0cIWd8F0vtzLndh0AA09c2MUwHFOfRFvSOZiQP
         2tsA==
X-Gm-Message-State: AOAM532XhG5bHSoy36/qoHVzc6wGAcoCjhDvKzvnsugpZyQJb3xZyzUA
        sVxz94Y84WCCV/R6KSrf6w8zWDYngTSvdtwqn0PVrExVDdc=
X-Google-Smtp-Source: ABdhPJycipMC+3yFy/FfT4vOEOqzfEd2ztS2UQwwfakeCsVP1iPo5wIo2ANqKQM67KPVjay5IFsJlLXTtLTNXE8/Lbg=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id u26mr15163014oth.250.1608631824111;
 Tue, 22 Dec 2020 02:10:24 -0800 (PST)
MIME-Version: 1.0
References: <20201221165541.27679-1-uli+renesas@fpond.eu> <20201221165541.27679-3-uli+renesas@fpond.eu>
In-Reply-To: <20201221165541.27679-3-uli+renesas@fpond.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 22 Dec 2020 11:10:13 +0100
Message-ID: <CAMuHMdUXd96hb88R=+FvoNRrpcar+AyXn97Abf2MN9F2i1rfYQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/12] pinctrl: renesas: r8a779a0: Add EtherAVB pins,
 groups and functions
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>, hoai.luu.ub@renesas.com,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Uli,

On Mon, Dec 21, 2020 at 5:55 PM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> This patch adds groups and function for AVB PHY, LINK, MAGIC, MII and

s/MII/RGMII/

> PTP pins for the R8A779A0 (V3U) SoC.
>
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>

AVB0 and AVB1 also support MII.  Do you plan to add them later?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
