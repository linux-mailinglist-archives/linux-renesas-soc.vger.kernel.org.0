Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0136FB5D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Apr 2019 16:25:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726415AbfD3OZN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Apr 2019 10:25:13 -0400
Received: from mail-vk1-f196.google.com ([209.85.221.196]:36775 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726073AbfD3OZN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Apr 2019 10:25:13 -0400
Received: by mail-vk1-f196.google.com with SMTP id d74so1242331vka.3;
        Tue, 30 Apr 2019 07:25:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pD0SzOCD5UKeJ/gyeaaEUDHqqrnYDGLs77rMeRlJDBM=;
        b=OvtX0gxhpIQWWmXLJCh2IqqCG2/o6iBUrc7jWXfX5Qri6yWSG6Ahs+o6bkDqVsIUBs
         nJgXe4UKq7d3cmGPlWP0udu/flryTWcdDcJHImea7ZznWSkYNpOZVaixyvQkRKRGuC0v
         ikNLgmHyX1MKKUDy+B4lmzVsqgVQFyr+E65L4JTJXExrAeN1MB69t8IYt+k67fnRGoOx
         3FFDRvDpoVsNVHa72CLFW3rzF1bdBlhk1iQkpduDu3HRLrmrJiBni0fec43rLqw6gRZK
         TEcgqK+1d78QUY3mUmBj/BkYff9af5ufBxEtzEHIx1Jh5nBgTch5QATtycq1cPvvM60J
         uPFQ==
X-Gm-Message-State: APjAAAV2nK/Y52R4Lgg9Z3w+L/B7JzeTGd3JDzTBKwmglz8PjsKzGca9
        dI0O3C05Ku5wqxJi85bHufMRvY6dHHzbWXiuY/U=
X-Google-Smtp-Source: APXvYqzpgg3XmEC+loSGVoy1Y3dtIN/fc1rZLJWZWRDumzOQQCjtcfiTS3YmvVei1f1YKrpsxpuWzs+jyyowD/nY6fI=
X-Received: by 2002:a1f:b297:: with SMTP id b145mr36080131vkf.74.1556634311819;
 Tue, 30 Apr 2019 07:25:11 -0700 (PDT)
MIME-Version: 1.0
References: <1554443049-25127-1-git-send-email-cv-dong@jinso.co.jp> <1554443049-25127-2-git-send-email-cv-dong@jinso.co.jp>
In-Reply-To: <1554443049-25127-2-git-send-email-cv-dong@jinso.co.jp>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 30 Apr 2019 16:24:59 +0200
Message-ID: <CAMuHMdW9bf10Z5jZbLCSjE+XF6o8JgW1eRdU7jyjnLE1iBDVHA@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: renesas: r8a7795: Add CMT device nodes
To:     Cao Van Dong <cv-dong@jinso.co.jp>
Cc:     Mark Brown <broonie@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        =?UTF-8?B?56iy5ZCJ?= <h-inayoshi@jinso.co.jp>,
        =?UTF-8?B?RHVuZ++8muS6uuOCvQ==?= <nv-dung@jinso.co.jp>,
        Hoan Nguyen An <na-hoan@jinso.co.jp>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Apr 5, 2019 at 7:44 AM Cao Van Dong <cv-dong@jinso.co.jp> wrote:
> This patch adds CMT{0|1|2|3} device nodes for r8a7795 SoC.
>
> Tested-by: Cao Van Dong <cv-dong@jinso.co.jp>
> Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
