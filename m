Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E70D4455F79
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Nov 2021 16:27:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231779AbhKRPaV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Nov 2021 10:30:21 -0500
Received: from mail-vk1-f171.google.com ([209.85.221.171]:37835 "EHLO
        mail-vk1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229701AbhKRPaU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Nov 2021 10:30:20 -0500
Received: by mail-vk1-f171.google.com with SMTP id e27so1073176vkd.4;
        Thu, 18 Nov 2021 07:27:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Uyt90OJtiiZ0GYh3gjUAR/DK6QbR+X1RsSVUjSDcsag=;
        b=ghD2HR6NgSMVBgi6dgpK4yciQpBNQuUOw9xPXDayxyMMaANlBBQQqmMd2N86aqY54a
         wa+TDJ6CyaRSh7wlOFfeyFXC1TNKE2FKQaCw9/ZEbhZcoEi+pfy7vBGiOL7Rn1jTtG9n
         Kuhu9EviseioDWBPHGMkv1Lxdwd/3F6VnCEOe5l7wTWOba+5Qc6SmyHzKkdqG7D04uqw
         GvbukQ3IeCfkyUAxpEkLpMSKYYrYs2CFq+JDKRKAd4EMgxm/0hy+QSUvu3rmtfDK/rgb
         S+N9w2OSYuWEJZgTjy6XISB0asxitcKGkiKRn7ElQWTjbdWv2Ivu6nhZvPC8ujAHLP3k
         8hdw==
X-Gm-Message-State: AOAM532agKDf9R2JyyKGHTp7hPi1JB9GCFrMSKr4yCja4h06WKqY6WTD
        Z+zMQ//vpvjl3K4Tvt7jt9erkbApn+62lg==
X-Google-Smtp-Source: ABdhPJxyg0V/i4Ukk+Q54cj3FRkTCz4Y5SDxHHCO3S4NnlfC77RwnnSx9gn1zyHwtMHlm3x8xTA7QQ==
X-Received: by 2002:a05:6122:8cf:: with SMTP id 15mr104907479vkg.16.1637249239823;
        Thu, 18 Nov 2021 07:27:19 -0800 (PST)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id s27sm57126vkl.24.2021.11.18.07.27.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Nov 2021 07:27:19 -0800 (PST)
Received: by mail-vk1-f178.google.com with SMTP id f7so4005508vkf.10;
        Thu, 18 Nov 2021 07:27:19 -0800 (PST)
X-Received: by 2002:a1f:f24f:: with SMTP id q76mr104877693vkh.11.1637249239099;
 Thu, 18 Nov 2021 07:27:19 -0800 (PST)
MIME-Version: 1.0
References: <20211117115101.28281-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211117115101.28281-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdUhT64AixfTunxcu0T8xmP8sKH-k=f_w9T6pQDRBSPP0A@mail.gmail.com>
In-Reply-To: <CAMuHMdUhT64AixfTunxcu0T8xmP8sKH-k=f_w9T6pQDRBSPP0A@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 18 Nov 2021 16:27:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW7_Jsos8-kCXqhB1yzjGCYMvrhv4Afuw9Q26=RsM-J2w@mail.gmail.com>
Message-ID: <CAMuHMdW7_Jsos8-kCXqhB1yzjGCYMvrhv4Afuw9Q26=RsM-J2w@mail.gmail.com>
Subject: Re: [PATCH 1/4] clk: renesas: rzg2l: Check return value of pm_genpd_init()
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jiri Kosina <trivial@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Nov 18, 2021 at 4:25 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Wed, Nov 17, 2021 at 12:51 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > Make sure we check the return value of pm_genpd_init() which might fail.
> > Also add a devres action to remove the power-domain in-case the probe
> > callback fails further down in the code flow.
> >
> > Fixes: ef3c613ccd68a ("clk: renesas: Add CPG core wrapper for RZ/G2L SoC")
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

i.e. will queue in renesas-clk-for-v5.17.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
