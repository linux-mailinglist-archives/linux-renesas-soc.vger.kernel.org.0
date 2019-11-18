Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93C67100259
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Nov 2019 11:27:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726518AbfKRK16 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 18 Nov 2019 05:27:58 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:35428 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726460AbfKRK15 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Nov 2019 05:27:57 -0500
Received: by mail-ot1-f66.google.com with SMTP id c14so7057476oth.2;
        Mon, 18 Nov 2019 02:27:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cps1AEdQSOSYe+4YbYRz6EwFm1Mh8AvkGzzfxXJlMXs=;
        b=i5nbIik/OgRNx69m+TwJWmBuzUovRySdJVNgeUv9pmThwg5YMB96NPu/cWmQdDEtvc
         QQrEF5kUIDjsayci+HIIBlb0a4ILf7i0MkDU1R1isf2yNDYH4b3a5u8UOlBEq82470Dy
         pUTkc2jM34cJzeHhoKJZTsfEU8GYjpSTk83DgrltrF4u0FP1ngGsIZXAOCEotM39zvvK
         keXvAjE/CNPWj4YNTDtRXRMHgTSEHVNGjPwiGGNgceGrrivgc9DG0p+ccX8A4MoRlLtm
         FAFuOnqTMu3Kf/jl+MeWXSJ3LSR5aqiBS+PZcq5zgpzhG2TdBTZzrMYEmz/aqLWZq2Wd
         sLeA==
X-Gm-Message-State: APjAAAXbESEbpOhFVHxEkFmKmV3srq0dhSkJ54D/N+kEo7nG91E8Wy7q
        YvNuPe6LYTQFRgNxYSVsVeyEyaTGbu189o2aQcU=
X-Google-Smtp-Source: APXvYqytQ+bWoP+XIOk4tfcw8HJiBm+bQBe7g+Qla5SOXeOMHSvzieKEPq7sl4Ud7zno8fMGkUR3H2wB8W0foYwrtT0=
X-Received: by 2002:a9d:17ca:: with SMTP id j68mr21318059otj.250.1574072876862;
 Mon, 18 Nov 2019 02:27:56 -0800 (PST)
MIME-Version: 1.0
References: <1572591791-11280-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1572591791-11280-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1572591791-11280-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 18 Nov 2019 11:27:45 +0100
Message-ID: <CAMuHMdXV0=Sb22cg0od28OTrwro0X+3m2Zd6D+7nx6m30_HX2g@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] clk: renesas: rcar-usb2-clock-sel: Add reset_control
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Nov 1, 2019 at 8:03 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> This hardware needs to deassert resets of both host and peripheral.
> So, this patch adds reset control.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Not yet queueing in clk-renesas-for-v5.6, as this depends on earlier
patches in the series.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
