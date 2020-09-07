Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C00AC25FD95
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Sep 2020 17:52:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730201AbgIGPvd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Sep 2020 11:51:33 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:41482 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730152AbgIGPbW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Sep 2020 11:31:22 -0400
Received: by mail-ot1-f68.google.com with SMTP id a65so12527451otc.8;
        Mon, 07 Sep 2020 08:31:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bUcsfQOAo+ulI8N6sQJ5DSyXLs3OgmbFHyWfg6ytgJY=;
        b=B727fH74HKnHNPeswteMep6ebNBY9qUSUUAvfVXNyQgx3BpbQ8N78GUjy0XgQBjNa5
         QKIHoRxVv2wrTTt4nzvSz0TCfNI1qmT3t5tFoyaDW7r+4bKGkj43c+Z8ggdW0PUYOtyS
         3bbMr1isMciVqiK0FXbtcbFzjFXN/JfXZxytrq+Bi6qcCfW+fLBRHm1iGYvBLW0UOBzK
         qtboKOFw1ljVtb+j3kU8G0yy5syRckDLp9+MhCNYGJCuepcGFhkotNA7syHH/2j5m3uY
         OTYGeJxIvBbJmNqXKbxgoT58M/UWiq/OahH9Re4OdfOYp2RqOT0QFP5KsBWx3SQo464N
         /iHA==
X-Gm-Message-State: AOAM530xnyKRGrcXAmiHSRWlY6knj3LuKkOc4rfwWhAM3rEFIjnAKlxZ
        GR1l3Q2l6aw6LDoOqLUbJ4mSJSh0K/LtZGequ0c=
X-Google-Smtp-Source: ABdhPJwx41RjYhxw7IAAm/QynytRpltpx/8vMIqhtjL/0QA4rA1pb9nsQKNZE0io406i9e+i987aep2inBQ2yOiTliM=
X-Received: by 2002:a9d:1b62:: with SMTP id l89mr14587437otl.145.1599492679753;
 Mon, 07 Sep 2020 08:31:19 -0700 (PDT)
MIME-Version: 1.0
References: <1599470390-29719-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1599470390-29719-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1599470390-29719-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 7 Sep 2020 17:31:08 +0200
Message-ID: <CAMuHMdX_be=+3soDGQBxPGvjF5Ty40wDEPaki3Z=SwbDToPA3g@mail.gmail.com>
Subject: Re: [PATCH 02/14] dt-bindings: arm: renesas: Document Renesas Falcon boards
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Mon, Sep 7, 2020 at 11:20 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add device tree bindings documentation for Renesas R-Car V3U
> Falcon CPU and BreakOut boards.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/arm/renesas.yaml
> +++ b/Documentation/devicetree/bindings/arm/renesas.yaml
> @@ -283,6 +283,9 @@ properties:
>
>        - description: R-Car V3U (R8A779A0)
>          items:
> +          - enum:
> +              - renesas,falcon-cpu # Falcon CPU board (RTP0RC779A0CPB0010S)
> +              - renesas,falcon-breakout # Falcon BreakOut board (RTP0RC779A0BOB0010S)
>            - const: renesas,r8a779a0

How is this intended to be used?

The above means its users should declare either

    compatible = "renesas,falcon-cpu", "renesas,r8a779a0";

or

    compatible = "renesas,falcon-breakout", "renesas,r8a779a0";

However, falcon-cpu.dtsi has just

    compatible = "renesas,falcon-cpu";

Who will use "renesas,falcon-breakout"?

>
>        - description: RZ/N1D (R9A06G032)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
