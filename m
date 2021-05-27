Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68124392C56
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 May 2021 13:07:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233750AbhE0LJB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 27 May 2021 07:09:01 -0400
Received: from mail-ua1-f45.google.com ([209.85.222.45]:40774 "EHLO
        mail-ua1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232891AbhE0LJA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 May 2021 07:09:00 -0400
Received: by mail-ua1-f45.google.com with SMTP id j2so1503568uak.7
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 May 2021 04:07:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EqJTcvULltmh2QV/umm6Z1oDvEGkZZ4Kgur6PpR3AzY=;
        b=VKcym3cSlpZcceLFR2W5RjGgSdu6aDRW5kE/mw9MQF2bP0BbyVA+VePNx89l/T2Mqj
         96PdOwHlCupG2e/wXrXR9BiFKBv5/brBza9Gmi5F9HaaO8zI3MSrxuIs+8/ECuNAWrSb
         TWEIChXIME+07CGCCgU7Q10nFbWSp1UEqRB46Ct/5zlZ0Woumo19nUTNbOGdb67qL4Ny
         SpC2JF/J75ln1q0roaLAhAjrvrly3JVbORKow1M2nOUMFks0R+gMurMgJn5vYvXfEisH
         BmALidHX5pJKalUkmgECHz42nu6IBd2eqYeLVPNuXSi74wCy5PfwmteUEN4+POFEjM/t
         F3bw==
X-Gm-Message-State: AOAM531eedq+tSMg9ZzgeDfV3NxI5aEu9T1VHEApwpMPwT03XHXTyZu1
        ggnRq8ksQilMmqwVtv+0MOB5z5tlNtwkr9bgtjYcjAqt
X-Google-Smtp-Source: ABdhPJy2G1VzYi9v9LOw9c6R9AtuMgLAk2XsrfUgN0L2yfnzZNM13lcERhZCiMgiok2Mtji8o4nyATSeppIjYnBZXfA=
X-Received: by 2002:a1f:d8c3:: with SMTP id p186mr1442435vkg.1.1622113646728;
 Thu, 27 May 2021 04:07:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210525091512.29119-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210525091512.29119-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 27 May 2021 13:07:15 +0200
Message-ID: <CAMuHMdUs+TggsgpOQsfO2B4ASyErSb-5aUKwLSb41v+d=whZSw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: alt: add SW2 as GPIO keys
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, May 25, 2021 at 11:20 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> SW2 on Alt is connected as on Lager board. So, use the same GPIO
> settings.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.14.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
