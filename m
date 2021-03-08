Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5646331A14
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Mar 2021 23:17:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229740AbhCHWQs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Mar 2021 17:16:48 -0500
Received: from mail-io1-f54.google.com ([209.85.166.54]:39819 "EHLO
        mail-io1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231162AbhCHWQj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Mar 2021 17:16:39 -0500
Received: by mail-io1-f54.google.com with SMTP id o9so11736957iow.6;
        Mon, 08 Mar 2021 14:16:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yDfNeOgarcWbV0lCdZdEtL+ke4trUeHbwFUg9YgPn5w=;
        b=YXfY01fZPJw/ak92U450nFWXsOtQy20O2twS0R8c4ucSfoHcDEsGJHwpKeckLAsT0p
         PRqpPgC7C7V/iD5nfeAMoKNWF37SGC4OCeKYfd9MbkvkEA+KDTM+uASR7REnMznjg0n9
         7HckW+nBO4xR9yAVPKnIfDf9qk6f5bbNUl/305dPWA2Y7pMczef/S9vtprvAKOfqd31h
         dEhDsyIenlkO6MTyrTaPbZhqS/V/sDKVTOG7Ee9KxBvwTE3x/EmYfUud1As6CVNAJOdt
         sF9anylWiXmcn56MTD/gufEW4jyBm1zXXES4W5ZXmkvKT8BUvjJSiNNyP9StjARYOAiH
         A7bA==
X-Gm-Message-State: AOAM533mRA13Ge2jQOiOEQqxNCuU/Z2CVdySVKr81LIWB0iRIyrg1v3t
        Vnet7jUw4idbIi11/j5ekw==
X-Google-Smtp-Source: ABdhPJwfTqK4kd1U8YsJ4ZR+6IbYXSBdqRk+XkdbfryBA7PDTC7x1pOKaebcdXDsF98ups4gChUkAA==
X-Received: by 2002:a5e:a508:: with SMTP id 8mr20636497iog.135.1615241798761;
        Mon, 08 Mar 2021 14:16:38 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id w8sm6732072ilu.1.2021.03.08.14.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 14:16:38 -0800 (PST)
Received: (nullmailer pid 3050032 invoked by uid 1000);
        Mon, 08 Mar 2021 22:16:36 -0000
Date:   Mon, 8 Mar 2021 15:16:36 -0700
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RFC] dt-bindings: arm: renesas: Document Renesas Falcon
 sub-boards
Message-ID: <20210308221636.GA3031492@robh.at.kernel.org>
References: <20210305133703.42179-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210305133703.42179-1-geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Mar 05, 2021 at 02:37:03PM +0100, Geert Uytterhoeven wrote:
> Add device tree bindings documentation for the Renesas R-Car V3U Falcon
> CSI/DSI and Ethernet sub-boards.  These are plugged into the Falcon
> BreakOut board to form the full Falcon board stack.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Marked as RFC
> 
> The Falcon board stack consists of 4 boards:
>   1. CPU board, containing the R-Car V3U SoC, and core system parts like
>      RAM, console, eMMC,
>   2. BreakOut board, providing power, an Ethernet PHY, and a backplane
>      where boards 1, 3, and 4 are plugged in,
>   3. CSI/DSI sub-board, providing 2 GMSL displays and 12 GMSL cameras,
>   4. Ethernet sub-board, providing 6 Ethernet PHYs.
> 
> As the BreakOut board provides power, the CPU board cannot be used
> without the BreakOut board.  However, both the CSI/DSI and Ethernet
> sub-boards are optional.  So that means we have to support 4 stacks of
> board combinations (1+2, 1+2+3, 1+2+4, 1+2+3+4).
> 
> That sounds like a good target for fdtoverlay, right?
> 
> For now[1] the Falcon include hierarchy looks like this (supporting only
> the full stack 1+2+3+4):
> 
>     r8a779a0-falcon.dts
>     |-- r8a779a0-falcon-cpu.dtsi
>     |   `-- r8a779a0.dtsi
>     |-- r8a779a0-falcon-csi-dsi.dtsi
>     `-- r8a779a0-falcon-ethernet.dtsi
> 
> Traditionally, we augmented the "model" and "compatible" properties of
> the root node in each additional layer:
> 
>     r8a779a0.dtsi:
> 	compatible = "renesas,r8a779a0";
> 
>     r8a779a0-falcon-cpu.dtsi:
> 	model = "Renesas Falcon CPU board";
> 	compatible = "renesas,falcon-cpu", "renesas,r8a779a0";
> 
>     r8a779a0-falcon.dts:
> 	model = "Renesas Falcon CPU and Breakout boards based on r8a779a0";
> 	compatible = "renesas,falcon-breakout", "renesas,falcon-cpu", "renesas,r8a779a0";
> 
> (Note: I haven't done that yet for the CSI/DSI and Ethernet sub-boards)
> 
> With a stack of 4 boards, some optional, this becomes a bit cumbersome.
> But it is still doable when using .dts and .dtsi files, by just adding 3
> more r8a779a0-falcon*.dts files.
> 
> So we can add model/compatible properties to the sub-boards:
> 
>     r8a779a0-falcon-csi-dsi.dtsi
> 	model = "Renesas Falcon CSI/DSI sub-board";
> 	compatible = "renesas,falcon-csi-dsi";
> 
>     r8a779a0-falcon-ethernet.dtsi:
> 	model = "Renesas Falcon Ethernet sub-board";
> 	compatible = "renesas,falcon-ethernet";
> 
> and update r8a779a0-falcon*dts to augment the properties.
> 
> However, this is currently not possible when using overlays, as applying
> an overlay would override the properties in the underlying DTB, not
> augment them.
> 
> Questions:
>   a. Should we document all possible combinations in the bindings file?
>      After this patch, we only have 1, 1+2, and 1+2+3+4 documented.
> 
>   b. How to handle "model" and "compatible" properties for (sub)boards?
>      Perhaps fdtoverlay could combine the "model" and "compatible"
>      properties in the root nodes?  However, that is not always desired.

I think we just don't want to put sub-board compatibles in the root 
compatible at least if they are optional, peripheral components like 
this case seems to be. For something like a SoM plus baseboard I tend to 
feel differently.

Do you really need it? I'd assume you could just check for the 
components? Or we define connectors and under the connector we define a 
top level compatible for the sub-board. This sounds like an eval or 
validation board? Those tend to have every possible option and I'm not 
sure we want to solve that before solving the simple cases.

Rob
