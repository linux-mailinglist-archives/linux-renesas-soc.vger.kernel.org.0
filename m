Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6197F44E99C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Nov 2021 16:09:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231919AbhKLPM0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Nov 2021 10:12:26 -0500
Received: from mail-ua1-f45.google.com ([209.85.222.45]:40958 "EHLO
        mail-ua1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229509AbhKLPMX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Nov 2021 10:12:23 -0500
Received: by mail-ua1-f45.google.com with SMTP id y5so1504759ual.7
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Nov 2021 07:09:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qw8DgkZbZem6Ea8HZNgud/7sA7AYF/tTTZ98QhHrEck=;
        b=dYEg2ReMnwHs+5/NAxK56txhaPdWCXC5maSGtXkq2XfPurE7DGq4pgzQ/zxcEIQJMP
         nid6evF/+q+C6vc9MnhMNVRt/5vFjg4OU0SLBEDqzYKV/Z+oQV7kyarSnxqPVEOL/9nh
         SBziPjYou3+0DEQwzv/LdM0AxqgiFAlPjf933769C350aAesio6Qvjw5+VXWjZZsdsG1
         Ep8KNPF5JN6aD56v0yQ4i/IawieUFt7DRA++DJjKpo1w5roR6T0AleLrrsnqnDxplW8G
         5a2k1WeBQnj+sTFqTAwQMbyvufrYDaUv1OdklCah4AWyBKsT4ebqGSqDEDutv5QcR/kW
         Ebxg==
X-Gm-Message-State: AOAM532jOl8cntEgzP4ZlG5+aBP0iEVTlcZ45t/Go7o8UtOlVXRlsoMd
        QPAk5RFCACYuRlG1zZLKNZfQq4xDycMFTw==
X-Google-Smtp-Source: ABdhPJyAGz2g4/6Udbj2qDbHQaQiPtzue5zrVg8KLq1dh+Rgr2q8ZOq8MQR7IK1RSiJdpPn9T1TVTg==
X-Received: by 2002:a67:782:: with SMTP id 124mr10559171vsh.24.1636729772572;
        Fri, 12 Nov 2021 07:09:32 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id 15sm4143676vkj.49.2021.11.12.07.09.30
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 07:09:31 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id l24so15157002uak.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Nov 2021 07:09:30 -0800 (PST)
X-Received: by 2002:a9f:248b:: with SMTP id 11mr18909340uar.14.1636729770683;
 Fri, 12 Nov 2021 07:09:30 -0800 (PST)
MIME-Version: 1.0
References: <20211110153142.3451-1-biju.das.jz@bp.renesas.com> <20211110153142.3451-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211110153142.3451-4-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 12 Nov 2021 16:09:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX8XyqC6hDArDratj58kRUrJNwyKdT6cTcCVgvOO95O_A@mail.gmail.com>
Message-ID: <CAMuHMdX8XyqC6hDArDratj58kRUrJNwyKdT6cTcCVgvOO95O_A@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] clocksource/drivers/renesas-ostm: Add RZ/G2L OSTM support
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Wed, Nov 10, 2021 at 4:32 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> RZ/G2L SoC has Generic Timer Module(a.k.a OSTM) which needs to
> deassert the reset line before accessing any registers.
>
> This patch adds an entry point for RZ/G2L so that we can deassert
> the reset line in probe callback.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

FTR, no regressions detected when booting RSK+RZA1 and RZA2MEVB,
which rely on the OSTM as system timer.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
