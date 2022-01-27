Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE76349DFA0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jan 2022 11:44:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229625AbiA0Ko1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 27 Jan 2022 05:44:27 -0500
Received: from mail-ua1-f49.google.com ([209.85.222.49]:33387 "EHLO
        mail-ua1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbiA0Ko1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Jan 2022 05:44:27 -0500
Received: by mail-ua1-f49.google.com with SMTP id u6so4033763uaq.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Jan 2022 02:44:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M8qmKWptj0oaA+RqnZOXkmpNx+ctYpSGf4ZuXN7Ttm8=;
        b=CiMpc3UHYeXZPCHL4nfmL0r/yZ2vLpvmUr3oWK9sLgCjcWTINlLrvGAiHyDKuALhjB
         LBb4rz/cjp5WbVo4WSF+Fcr2MPDUTcszHhlJYjXZkPOmzVmDdQlJ7BJ7FCZ99tDS0GSM
         SbP4qj0yqVMndVLv86FIYwau0xwUYBsK3DOULGDbbw8UMd3C7i363GpZQMMz8u+8aSzo
         Y6Yfsm0Ao2pujW5uKvdK0EHiCMa+ViwuFzs9tFZt8vxJUoDWxYO85++xd2MpbbpMEE0v
         GTikq1WdKQZKsbomL13K1iI63PKS1v7FuYmJILT/KGd19W9S80SnvPROJ+O+wNbSuC1i
         kFuw==
X-Gm-Message-State: AOAM531yQJDVOTV4tkbjeNsA1HXqeWjPWdUaeLIBRqLQ1GiuC9HJzuO5
        EHT3bi7iExeAYGLl62KkG8zK2aN6dUQMSQ==
X-Google-Smtp-Source: ABdhPJwRe7RODhOXbviNqd37xYSdaHhmrI2ZrI0iDQFbCLea+kVMKUj0UaAsygrQMKBdQ6mWKWVndQ==
X-Received: by 2002:a67:bd13:: with SMTP id y19mr1295528vsq.85.1643280266337;
        Thu, 27 Jan 2022 02:44:26 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id w188sm502320vsb.32.2022.01.27.02.44.25
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jan 2022 02:44:26 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id y4so3966749uad.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Jan 2022 02:44:25 -0800 (PST)
X-Received: by 2002:a67:a401:: with SMTP id n1mr1251125vse.38.1643280265742;
 Thu, 27 Jan 2022 02:44:25 -0800 (PST)
MIME-Version: 1.0
References: <20220124021142.224592-1-kuninori.morimoto.gx@renesas.com> <20220124021142.224592-3-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <20220124021142.224592-3-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 27 Jan 2022 11:44:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWm-7V1Ae+=zxkPkrrEefBeaQptSidXvvaKM45cU0ayHA@mail.gmail.com>
Message-ID: <CAMuHMdWm-7V1Ae+=zxkPkrrEefBeaQptSidXvvaKM45cU0ayHA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] arm64: defconfig: Enable Audio Graph Card2 driver
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jan 24, 2022 at 3:12 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> commit 6e5f68fe3f2d35 ("ASoC: add Audio Graph Card2 driver")
> added new Audio Graph Card2 driver which can handle
> sound card more flexibly.
> This patch enables it on defconfig.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.18.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
