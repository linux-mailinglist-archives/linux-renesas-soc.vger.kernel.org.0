Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADF363B4651
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Jun 2021 17:05:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231701AbhFYPIP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Jun 2021 11:08:15 -0400
Received: from mail-vs1-f47.google.com ([209.85.217.47]:46852 "EHLO
        mail-vs1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230235AbhFYPIP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Jun 2021 11:08:15 -0400
Received: by mail-vs1-f47.google.com with SMTP id g28so2976807vsr.13;
        Fri, 25 Jun 2021 08:05:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5UUFSTddbbwKSgSIxpRMMp12/X0S9a/fyPx4jC3Ni7E=;
        b=DYBfaRQadttfdCdpWCWcEldm9UpURFGz9A7UMVTjsmiapPnVtzCEoQFqOziQr5P7KL
         PsGA1D2O4tBuq8QwvormJ13DMk3ZpyWs2bxrouTgeyo2cjdzQEnFb3DF7TrohmPwT+ky
         r2L7mLTTLGllr5xrTyHX5Tr9PwJZ+EDv9Y/bkNc71ahCYEs6U52q7e7hlJQl4Cmn7cYu
         v4BBaEfjMf1y5fDo1eJGJ+l5q+CbzaAyHfYh+iP/F2r9ypyjs5a/soMJDhxePu4gdKbD
         od+AScDYMgVJEYTrtzV066kVUds5eC3QT0uPQUKV3YmQij9RAREUv4pQ83ViXz6xBMlh
         KHZA==
X-Gm-Message-State: AOAM533wSDZbpuS04Tngxjy528/QYWQlD3ZV9QaWBqkue/X2Z8zQdKep
        71q2s6yZzrahsCe0tqHjtrcoD2EerK94XlFRpcw=
X-Google-Smtp-Source: ABdhPJwvh5BY6QI29fw0lFFmGWGC8SJ1QzHFNZw/A0tHMxSuCOgXHuFzr4At/3i+J4njggThwoIOw00zai2zEtlOcXA=
X-Received: by 2002:a67:7787:: with SMTP id s129mr9545580vsc.40.1624633554180;
 Fri, 25 Jun 2021 08:05:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210624130240.17468-1-biju.das.jz@bp.renesas.com> <20210624130240.17468-9-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210624130240.17468-9-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 25 Jun 2021 17:05:43 +0200
Message-ID: <CAMuHMdVnvA1sKUBMO7bZxL4SJVMwUVKy6eG15ePxRHSjbW1yfA@mail.gmail.com>
Subject: Re: [PATCH v2 08/11] arm64: dts: renesas: r9a07g044: Update SCIF0 clock/reset
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jun 24, 2021 at 3:03 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Update SCIF0 clock and reset index in SoC DTSI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
