Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 066622DCF9F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Dec 2020 11:41:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726012AbgLQKl4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Dec 2020 05:41:56 -0500
Received: from mail-ot1-f50.google.com ([209.85.210.50]:34842 "EHLO
        mail-ot1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725950AbgLQKl4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Dec 2020 05:41:56 -0500
Received: by mail-ot1-f50.google.com with SMTP id i6so26822264otr.2;
        Thu, 17 Dec 2020 02:41:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jZq72uh5drDq+vH9HNncqoGluBOo86keamsd9/IIxuo=;
        b=IirwPUrWSaNiSV988M8pc9139G4DHCVjKu5Pw09zjFOygAQMzs7qA6v+976RLcPArk
         EhaFgD3zpTP4w00cemYngR27LJ9E5y3bqUdpmyV7SPlSNyfC0C9xjh+mAolpESogqaSk
         464OlTsyTnHTaEHvadq2lHlNtAL8ECUEkFcXio5/Yjm5JKKJtCHS27b1Mvr1ohLLjQb3
         6JpCchFp2Xn8jMPCJXQRJlvwuwBNZLPpaTKKUTEkaTbplNQvFP3yg7BH4D+DhWhOIC16
         K5vJ36xVe169ndlRmKeOa/v6HnOf8O72PV084Bazfuh5OMKVfL7lNKQJFrj9kJPTxZfF
         /rzw==
X-Gm-Message-State: AOAM531Qv1q11uGUJdXHl5n2hDEfGf1DKe/MHhsdJ7VavsIvy5CpqGje
        ovykpquLIteMlJu+5cTHr3xxi0sYEN+KIAboXYU=
X-Google-Smtp-Source: ABdhPJx9/mrnyQV28izVCd8+tQdBcbMYWFHxro0JPWzgWg1hB/ptH7C+XMsePpAGUbfAC0eKmh4O/gKTVvbOrpAEiog=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id u26mr28890907oth.250.1608201675171;
 Thu, 17 Dec 2020 02:41:15 -0800 (PST)
MIME-Version: 1.0
References: <20201213183759.223246-1-aford173@gmail.com> <20201213183759.223246-3-aford173@gmail.com>
In-Reply-To: <20201213183759.223246-3-aford173@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 17 Dec 2020 11:41:03 +0100
Message-ID: <CAMuHMdW8w-J445DRNH8Ykx7Sp2KGCCVibE5uvccmoD=iZSM-zQ@mail.gmail.com>
Subject: Re: [PATCH 02/18] arm64: dts: renesas: beacon kit: Fix choppy
 Bluetooth Audio
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Adam Ford-BE <aford@beaconembedded.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, Dec 13, 2020 at 7:38 PM Adam Ford <aford173@gmail.com> wrote:
> The Bluetooth chip is capable of operating at 4Mbps, but the
> max-speed setting was on the UART node instead of the Bluetooth
> node, so the chip didn't operate at the correct speed resulting
> in choppy audio.  Fix this by setting the max-speed in the proper
> node.
>
> Fixes: a1d8a344f1ca ("arm64: dts: renesas: Introduce r8a774a1-beacon-rzg2m-kit")
> Signed-off-by: Adam Ford <aford173@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.12.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
