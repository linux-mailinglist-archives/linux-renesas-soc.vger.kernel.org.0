Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5CCB401929
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Sep 2021 11:47:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241635AbhIFJrE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Sep 2021 05:47:04 -0400
Received: from mail-vs1-f48.google.com ([209.85.217.48]:42859 "EHLO
        mail-vs1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241617AbhIFJrD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Sep 2021 05:47:03 -0400
Received: by mail-vs1-f48.google.com with SMTP id s25so5059930vsa.9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Sep 2021 02:45:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rdqXyGHQinYKM9ZFz+aU7CuJIhiNgMB2xorOSp2OPWQ=;
        b=p2We7DR4AlYNGfjldCjklVE4GMpiTH99D3xNAVr/WEgXZTlTmWaok8b5WCRuRUB6Tz
         5XULWYgqxHnWc/gi7ltEgk88Zja3e/mownCqEEwVUO2MtuGeXceuMeX9MK08T3iEqCdO
         IY33OL2KzZqiuuTO9xeTHWx0DTLiX+v/b4CSpPssv8xKvp1sETWOs/56NqRLOidju1MX
         Opqsaj+1E67Ffx1aftSWiK8vVFkNIroa7X1Uiie01AI0Iuki6rFzUFDM/hmeVgtYUmsn
         Sp8HGHQdIrF2cbrzNk7Ookd6Cdff1QPi8sqmAiFncVNGr8OpA/8c4BAEIUArpV1yoPCT
         YjUg==
X-Gm-Message-State: AOAM5336e5ZUACwzPrPF4J3XloA35/31HP2eATJ279PswqEqjWO96ZXf
        kJjBIVgtQ5nGYU/Im9SsQ3mSQ+FyXYJv16CWGUI=
X-Google-Smtp-Source: ABdhPJxXPpMZ71jIdPyzk3SXZv2amQ6af9ca555I+o7GAOfC59GNV9CtNck6CUvT6gOIN2r6GtiSsJQel1BfbOehXCU=
X-Received: by 2002:a67:3289:: with SMTP id y131mr5393763vsy.37.1630921558767;
 Mon, 06 Sep 2021 02:45:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210901091725.35610-1-wsa+renesas@sang-engineering.com> <20210901091725.35610-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210901091725.35610-4-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 6 Sep 2021 11:45:47 +0200
Message-ID: <CAMuHMdV1XgDm1WFQEHST8Fnd0qrbPDBEVKOkr6cfg5a=NS-exg@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] arm64: dts: r8a779a0-falcon-cpu: Add TPU support
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Duc Nguyen <duc.nguyen.ub@renesas.com>,
        Wolfram Sang <wsa@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Wed, Sep 1, 2021 at 11:17 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> From: Duc Nguyen <duc.nguyen.ub@renesas.com>
>
> This patch enables TPU channel 1 for the Falcon board.
>
> Signed-off-by: Duc Nguyen <duc.nguyen.ub@renesas.com>
> Signed-off-by: Wolfram Sang <wsa@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> Do we want this activated upstream? I think it is nice to have.

I don't think so, as there is no actual user.

It could be enabled in a DT overlay describing a board connected to
CN4. Or just a simple overlay for testing TPU on CN4.  I'd be happy
to add the latter to
https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/log/?h=topic/renesas-overlays

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
