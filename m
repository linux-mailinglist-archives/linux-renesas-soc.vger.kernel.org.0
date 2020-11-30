Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2960D2C85D1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Nov 2020 14:46:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726410AbgK3Nqr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 30 Nov 2020 08:46:47 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:36107 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725859AbgK3Nqr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Nov 2020 08:46:47 -0500
Received: by mail-ot1-f65.google.com with SMTP id y24so11299291otk.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Nov 2020 05:46:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vnh3XeBWKKeUCEU0sHjAI52TBFvi8+FC4hGWZzy+wOk=;
        b=Sq4lNluJqv8jhiwv4hz1ekvsetBpVXWBc+9j7olGXnyS98Idd3c4fJ9V1R50iMTc49
         o1qoYgLw9YF4Yn2c15vktPMDepgIUpV9FYLOoY1Iz9CgoBLFbktIwKSyj+Oxlx8bbm++
         E3BGFQtT30o7FP34p2HgIPZPl2I8z/vA3+pyva/K7JHBn7X97JZCKIEuePYyxcZ7E4mk
         vJE0JprK1Jl3Rz8Rcs7VNHM/4wUZtsYUOfh6EPGtARj7IXCEilKQoUZr0cmht+yWrtZ5
         kaVIx+RdPIln0RKoa0Q4YvTSrvcfX13mqYzEw3XecJgt2/vamxq9W+NB4cyMVe1SeDtr
         h1bQ==
X-Gm-Message-State: AOAM5318hMoGDNjA37xgttMJG0rZJkX58SkV4tOUJ8e+0QxjWXOQVkn/
        YlsEKZyyrMinZmKPMqt3UXRk8lZubO9t//xhYKVzuk25
X-Google-Smtp-Source: ABdhPJzMDYLfLonFq+78sz2k9SI5/GDPULwb+ai7Rwcv1DEm67e2xAGE1XjOlHhuIwTIYyrLkhWLCEFf/Ab6Sv3hlPc=
X-Received: by 2002:a9d:686:: with SMTP id 6mr15708101otx.107.1606743957691;
 Mon, 30 Nov 2020 05:45:57 -0800 (PST)
MIME-Version: 1.0
References: <20201126172154.25625-1-uli+renesas@fpond.eu> <20201126172154.25625-9-uli+renesas@fpond.eu>
In-Reply-To: <20201126172154.25625-9-uli+renesas@fpond.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 30 Nov 2020 14:45:46 +0100
Message-ID: <CAMuHMdWLcuDES3RXhM1urorE3_xHxQb5QnVVWqjN+sZQcdnX0A@mail.gmail.com>
Subject: Re: [PATCH 08/11] pinctrl: renesas: r8a779a0: Add PWM pins, groups
 and functions
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>, hoai.luu.ub@renesas.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Nov 26, 2020 at 6:22 PM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> This patch adds PWM0-4 pins, groups and functions to the R8A779A0 (V3U)
> SoC.
>
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
