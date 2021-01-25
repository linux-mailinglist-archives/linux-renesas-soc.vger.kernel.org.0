Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B51E303442
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Jan 2021 06:21:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726710AbhAZFVD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Jan 2021 00:21:03 -0500
Received: from mail-ua1-f52.google.com ([209.85.222.52]:40497 "EHLO
        mail-ua1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726094AbhAYJQg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Jan 2021 04:16:36 -0500
Received: by mail-ua1-f52.google.com with SMTP id t43so4215326uad.7;
        Mon, 25 Jan 2021 01:15:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OGkZAUg3iH9IYza5zJbjuo/RDsxxCiTyQgGN6eBtR1Q=;
        b=pLKXhGeY3TeU9wPCpefNLIT3xishBz3Pq+6yWvPs0J/CbPmxkboJy05FDqLhsgUvUV
         OrYEWDVhO+QQ3Z7+6HybgEo5en9GT2hT60e6FpBW4aUr0mVOKSCI46ckz+FzZ8kJUjDZ
         LlM4ezdj5wRBeB30TXKLf1pWv/J0r7ih6oNT5whr60KM13DOXKUk2I+UYcsJjJ9JhIMQ
         Hux7ZQzZocEWDaMLStZ7B3VVSEiy6KGxB9Cmu9EBO00EFWRHyaIKV9e1qw1K4NGDxgkb
         NKa2RXSNXxSrlPbTE88XRE/AeHFbAqdteOS+LnaXdf2H79QpYFOBlpvUML88ZEYQxfs4
         1DHQ==
X-Gm-Message-State: AOAM5322RlMtiU116IYncqs9ozn3stU9EDaRSTLHBJ5v1Yp9UmjLPH8n
        /P9DEPh7TrWZHxN2Z0BbxKCjWQJwSBjzDDR5LHck+Cl5U5g=
X-Google-Smtp-Source: ABdhPJxE0V4U1AtCVDBgSlqmD/qcahsGGxzJ6rIjakkFSuo/ECAxKcrQLWJbs3QWRCMrXka8I6gsPRWsfj2qgMEO9QE=
X-Received: by 2002:a05:6830:15cc:: with SMTP id j12mr184otr.145.1611564197475;
 Mon, 25 Jan 2021 00:43:17 -0800 (PST)
MIME-Version: 1.0
References: <20210125075845.3864-1-wsa+renesas@sang-engineering.com> <20210125075845.3864-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210125075845.3864-3-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 25 Jan 2021 09:43:06 +0100
Message-ID: <CAMuHMdWDo5NGOi-r=N9iULmxR1NOOBjTFbHxzD99WL5HuUjRMA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: renesas: falcon: Enable MMC
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jan 25, 2021 at 8:58 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> From: Takeshi Saito <takeshi.saito.xv@renesas.com>
>
> Enable MMC on the Falcon board.
>
> Signed-off-by: Takeshi Saito <takeshi.saito.xv@renesas.com>
> Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> [wsa: double checked, rebased, slightly improved, moved to falcon-cpu]
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Changes since v2: added tags

Thx, will queue in renesas-devel for v5.12.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
