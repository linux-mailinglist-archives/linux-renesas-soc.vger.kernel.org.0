Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AD93455F6A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Nov 2021 16:25:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232088AbhKRP2z (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Nov 2021 10:28:55 -0500
Received: from mail-vk1-f180.google.com ([209.85.221.180]:45579 "EHLO
        mail-vk1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230376AbhKRP2z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Nov 2021 10:28:55 -0500
Received: by mail-vk1-f180.google.com with SMTP id m19so3999009vko.12;
        Thu, 18 Nov 2021 07:25:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l75YBvaIKIqMqRd0fPmOyxtiZBsumc8q9gz1NkIt1Os=;
        b=zmBlb8RiIvXVZs0/HRSajIyAL9eQ0lqYKFPYwoGLjOaVp/X9QAI99bQHP9rkW8Nonw
         fcl1xcvT5M0a7sn8sVtLaQ05g9q2FF8b05yl0xGIKtVfFngdDeQdL9GdPG4mIGq+M4+m
         6XREFcqV91Tz+Okxfw5krRP1zVYOSCzdjfiD9xcJZoFtkKfRfe2YvtqUCgfpc5sriAGI
         RdUhk962sQ9SSXKHg/krx6M7X59aFY6mCfITQJVazdiyG+J408vLT+TP6TI0Pt/FeMFC
         ML9RAJnkoOXZqP/cMrgdCW36cfNCHuKTNx9SUQ75BxZ956ioFxFKqPwvwl+IGs9kvfh1
         3vcQ==
X-Gm-Message-State: AOAM532VfHTHyGUGM2++e8JhB6VRJDY8WvAnN4NAfKjEZtgFNS8nsYmQ
        OjgPhAL4Edrb+VnRqW4PZBIwUJaippNzJQ==
X-Google-Smtp-Source: ABdhPJwPINizTvpshG6X52QT8E8P79GrAmIz20sbfN05UjqYivYKBpMiDkqYDdfLytK3SGlvQ6nanA==
X-Received: by 2002:a1f:f24f:: with SMTP id q76mr104864791vkh.11.1637249153981;
        Thu, 18 Nov 2021 07:25:53 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id f21sm45253vke.39.2021.11.18.07.25.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Nov 2021 07:25:53 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id y5so14436512ual.7;
        Thu, 18 Nov 2021 07:25:53 -0800 (PST)
X-Received: by 2002:a67:af0a:: with SMTP id v10mr82716792vsl.35.1637249153248;
 Thu, 18 Nov 2021 07:25:53 -0800 (PST)
MIME-Version: 1.0
References: <20211117115101.28281-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20211117115101.28281-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20211117115101.28281-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 18 Nov 2021 16:25:41 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUhT64AixfTunxcu0T8xmP8sKH-k=f_w9T6pQDRBSPP0A@mail.gmail.com>
Message-ID: <CAMuHMdUhT64AixfTunxcu0T8xmP8sKH-k=f_w9T6pQDRBSPP0A@mail.gmail.com>
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

On Wed, Nov 17, 2021 at 12:51 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Make sure we check the return value of pm_genpd_init() which might fail.
> Also add a devres action to remove the power-domain in-case the probe
> callback fails further down in the code flow.
>
> Fixes: ef3c613ccd68a ("clk: renesas: Add CPG core wrapper for RZ/G2L SoC")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
