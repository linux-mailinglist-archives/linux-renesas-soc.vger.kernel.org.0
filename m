Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 359ECD0E54
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Oct 2019 14:07:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730339AbfJIMHU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Oct 2019 08:07:20 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:41256 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729575AbfJIMHU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Oct 2019 08:07:20 -0400
Received: by mail-ot1-f68.google.com with SMTP id g13so1479660otp.8;
        Wed, 09 Oct 2019 05:07:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OROzd3qupWR3dfQh8iBSzhvyFai2MKSJrlA/kFt+Z2E=;
        b=shsF8tDnbex+WSvpuRbJnC3acITP5q8gGwsg8k3D/sMrvAT3Zx4eENf2mgQj5KlclD
         nOzbfM+VA1f4aOT39zMm/2g1t0lLWi0/j0wFNmziIBLglDuK53dsV1Az9+T7oMAy03/T
         yd06AQeFoW02FHvuH4StglqLU44S967LLHq6PVFAHU/TexSO3hIAj1Xb31NwFeQm8IyF
         s5lRulphVz/nwssH6cAEwytUXPG5788lAHGDStsATJWHRJeZ211uDxFytnlnh7xmbfom
         ZPIv5HigSYfpKTkqbal9jIt2/PvpVSitWDDEPfsnJC+F7qEk1sPb89mbKbW10C2Y4ufh
         9v4A==
X-Gm-Message-State: APjAAAX7U3cp0pnOw4ZXG26GHdTizquWrUflasxzU9Jq5Qdq9x4OfTXV
        JGRBlfEtPHpL+lH8R8cGgsR1xdjwknejM5lk694=
X-Google-Smtp-Source: APXvYqy5MHggkOl0tZDrOmqyT/SWrLzcwV7ZmfRmTEhz8LGpuGlhPjsiYYH1dmzCh0bvSasqxYd9ZOFYPHhtRBk+GbE=
X-Received: by 2002:a9d:7345:: with SMTP id l5mr2543972otk.39.1570622839328;
 Wed, 09 Oct 2019 05:07:19 -0700 (PDT)
MIME-Version: 1.0
References: <1569250648-33857-1-git-send-email-biju.das@bp.renesas.com> <1569250648-33857-3-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1569250648-33857-3-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 9 Oct 2019 14:07:08 +0200
Message-ID: <CAMuHMdUw5ghDk9K5UHEHm1BeNWuCZgA-w-bZ98g6fkJ8kPuahA@mail.gmail.com>
Subject: Re: [PATCH 2/4] arm64: dts: renesas: r8a774b1: Add RZ/G2N thermal support
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Sep 23, 2019 at 4:57 PM Biju Das <biju.das@bp.renesas.com> wrote:
> Add thermal support for R8A774B1 (RZ/G2N) SoC.
>
> Based on the work done for r8a77965 SoC.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
