Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14AF5283123
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Oct 2020 09:53:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725893AbgJEHxg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 5 Oct 2020 03:53:36 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:34282 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725870AbgJEHxg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Oct 2020 03:53:36 -0400
Received: by mail-ot1-f68.google.com with SMTP id d28so1487153ote.1;
        Mon, 05 Oct 2020 00:53:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ufois23g/mxCxfWP4cgLmm6PEOAY+7dY4/+DMcUR2+w=;
        b=FA7Ev8Pq4/JRrznF1mtUsa3V8Pi0KFA4yNTByRXII5M5DjZR37dnSHAgbHlbVswb6I
         NgdXlxer+f6QJDOcMwhMhjBgqZ46VZse4WUhjfrDbMWK8oBYihKwsIG2k6vGkR+Apmp0
         2lFWooYxYbtbS2k1oOP8RkJeLSVPBmow0CCxQ4NlVTaalv6xUnqdOfWvj+YUY24oZ5gz
         9eFCzj8R9hSv/yZ2r3uN5j9Q7cqMq4DxuhS8hnz8RBPFTi0ugxUlmjAwkL4MGpU0toU4
         AUvYPKy34kZY0LP7MIWuF/49xqzrjjGKA77jyx6JUcaYE0Jhb8yuDkolq4xrio4o0Ea2
         CauQ==
X-Gm-Message-State: AOAM531eXcLYuXyzYOpF1nSKUC+Hl25FHXZJGTT+foME1bx1er2N3QIe
        TL1bvxTF1zTH+hWLfyVQeHVLSxQ0ZfVu1Uj4mm/Ndbhm
X-Google-Smtp-Source: ABdhPJwUMXeRAmZD+uY78qToNvcWn90EF6i7ZUcRJ+D3EO5sQQQnaD1A+zraaFQREFNFC7RNbTYDhVfHoH8AhHh+DSw=
X-Received: by 2002:a9d:3b76:: with SMTP id z109mr11079631otb.250.1601884415195;
 Mon, 05 Oct 2020 00:53:35 -0700 (PDT)
MIME-Version: 1.0
References: <20201002163945.7885-1-krzk@kernel.org>
In-Reply-To: <20201002163945.7885-1-krzk@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 5 Oct 2020 09:53:24 +0200
Message-ID: <CAMuHMdX5dW_UJbDektyFPMeS-go0g+UmAA1ji=AK3-k+HX_dNw@mail.gmail.com>
Subject: Re: [RESEND PATCH v3] arm64: dts: renesas: align GPIO hog names with dtschema
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Oct 2, 2020 at 6:39 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> The convention for node names is to use hyphens, not underscores.
> dtschema for pca95xx expects GPIO hogs to end with 'hog' suffix.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  .../boot/dts/renesas/r8a77951-salvator-xs.dts      |  2 +-
>  .../boot/dts/renesas/r8a77965-salvator-xs.dts      |  2 +-
>  arch/arm64/boot/dts/renesas/ulcb-kf.dtsi           | 14 +++++++-------
>  3 files changed, 9 insertions(+), 9 deletions(-)
>
> The dt-schema changes were applied.

Thanks for notifying me!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.11.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
