Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6588D2D75D1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Dec 2020 13:42:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395333AbgLKMlL convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Dec 2020 07:41:11 -0500
Received: from mail-oo1-f68.google.com ([209.85.161.68]:41133 "EHLO
        mail-oo1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2395336AbgLKMks (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Dec 2020 07:40:48 -0500
Received: by mail-oo1-f68.google.com with SMTP id q6so1304101ooo.8;
        Fri, 11 Dec 2020 04:40:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=hrzi5Lcm1/mGVocuynVS4Fhqqkj7CbbUKtdtkY9BkLQ=;
        b=WS4328ZpCpHkqviMmDQKwhl5RUn7SCmd0MBE+IZWZx+ve1tUGc5sfspkdw2EeIPSGG
         RTxRP8GUxv+2wCBl2JJeFfRhii5jHm791ziH/sZvWHXexG47NKI4ejFU6lQdebIAqEkf
         B5ABAdjuSe9NKWWIffDwK/qk0fEOzHNSbrmACOnCAg+LSDANakquLEj+cJTV5IWJLEVM
         m8P4p/iuVII+2WDZfxnE+Co2Uyqxe/bMdyqhfQHlnSZNQXhC4rmJ2yM2n45nYpa6esT+
         XkOsKu8f2IDWmLAx6yODsxkfiXKiipAGjz5OkzozovLPtP2qZtM68hI/DGtqUaWJlY9m
         uooQ==
X-Gm-Message-State: AOAM53323LMZ6PBerHy010z3Rw4h4n/i9qQaWGf4TFd0wqVIRESrUwYH
        e/AsBFXDPv/4TUnYakxiLeKE4hKJKOn0XWkRqZEDrE0kvGM=
X-Google-Smtp-Source: ABdhPJyTq9Al2fiMcaSV4DAGmhXunf1e3m32EthA+2/rd1skdwZa0Fm6v+HJV1EW04FATIG6YhCBgoGY0l5cKZKUW3s=
X-Received: by 2002:a4a:dc1:: with SMTP id 184mr9862266oob.40.1607690407585;
 Fri, 11 Dec 2020 04:40:07 -0800 (PST)
MIME-Version: 1.0
References: <20201210152705.1535156-1-niklas.soderlund+renesas@ragnatech.se> <20201210152705.1535156-3-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20201210152705.1535156-3-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 11 Dec 2020 13:39:56 +0100
Message-ID: <CAMuHMdUkVAb=M_g+0tcEiRihQJx5B5NUyj2SCYusj0wXFmhdUQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] arm64: dts: renesas: r8a77960: Add TMU nodes
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 10, 2020 at 4:27 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Add device nodes for the Timer Unit (TMU) on the Renesas R-Car M3-W
> (r8a77960) SoC.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.12.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
