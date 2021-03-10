Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BFAA333946
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Mar 2021 10:55:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231856AbhCJJyb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Mar 2021 04:54:31 -0500
Received: from mail-vs1-f47.google.com ([209.85.217.47]:34032 "EHLO
        mail-vs1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229657AbhCJJyV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Mar 2021 04:54:21 -0500
Received: by mail-vs1-f47.google.com with SMTP id m18so8429422vsa.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Mar 2021 01:54:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MQiESpIQKMZB+rkFiF1oHX3hPEqRndKVaNxWxvq1E48=;
        b=M+gmF9vmzkdpl29EeXifrYlREvrq8Bwm2x6Pewpaw9qnuHISw0P03boyt/4AcauScZ
         diaaRvmH6M+tWZb0x71gizrumdprx3bhr4eQHEgYWmeJZCA2236CAvyInQeRDgaGv3YD
         GhN4T1NqXPDLRELDJQiyS1/ADbe5rxe0eP0Vo88X+ROvwIKd5cU+2LaZ7qpISxUCvW8o
         7pJhZ/QFXwDKPeSIwWqust+HjsvqxvmnwWZaA6911o9aNJMnRIt0BcmFRpil61TUodNj
         RBJspwodbBUEBvY4JGDuG5DikTrVxuC1vYVsVPRaSsPGeLhmJreEv3TjTIpSdAWYxqWS
         uqwQ==
X-Gm-Message-State: AOAM530SleC+ShGr1VQ3ai3QAtW+Vr1oOJ96rLLxuy7KLlhIBq+JJG/x
        JGqUsFDnfJ0RUUyxGyWV+Anblfyf6W8M1YfeSxTvfJLZ
X-Google-Smtp-Source: ABdhPJzLky/SV5ew2qqshRrAitolWqfm6ic3glJy2nq80LEP42Zgi5ikz+KUvCkw87KphNTrLlcgiJCwvcLVQTlqeo8=
X-Received: by 2002:a67:fe90:: with SMTP id b16mr1156299vsr.40.1615370060866;
 Wed, 10 Mar 2021 01:54:20 -0800 (PST)
MIME-Version: 1.0
References: <20210305143259.12622-1-wsa+renesas@sang-engineering.com> <20210305143259.12622-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210305143259.12622-3-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 10 Mar 2021 10:54:09 +0100
Message-ID: <CAMuHMdUcfTC14RUTqQbD44B3Z3y1F28cJzYLhSTAD3x_KjERXw@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r8a779a0: Add TMU support
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Phong Hoang <phong.hoang.wz@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Mar 5, 2021 at 3:33 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> From: Phong Hoang <phong.hoang.wz@renesas.com>
>
> This patch adds TMU{0|1|2|3|4} device nodes for R-Car V3U (r8a779a0) SoC.
>
> Signed-off-by: Phong Hoang <phong.hoang.wz@renesas.com>
> [wsa: rebased, double checked values]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.13.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
