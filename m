Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0204432ECD7
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Mar 2021 15:13:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230514AbhCEONG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 5 Mar 2021 09:13:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230475AbhCEONF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 Mar 2021 09:13:05 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F023C061574;
        Fri,  5 Mar 2021 06:13:05 -0800 (PST)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 89F7ACC;
        Fri,  5 Mar 2021 15:13:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1614953582;
        bh=74H6ou4QSy7Iwva3VR4LPA27SWDjUCNqWGQzbDSr2cg=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=hLmbgyCMRm2Qn+D6g1DpEG8li4MenDCdZQW9pGzXMxtGPNWNPD8f3560cMuikjFix
         CvoqW6lj5zw0l9dsNkbLz7rwaUgPg7zDO8pcPVCpGt6G6vgaRICFplnuw7Hj9so5kl
         gv8dYryW2ESTk1dFuCPueaFx8JPN4A8+fBDHOJ1s=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH RFC] dt-bindings: arm: renesas: Document Renesas Falcon
 sub-boards
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
References: <20210305133703.42179-1-geert+renesas@glider.be>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <a7e20040-beed-03f4-e1ce-759934886736@ideasonboard.com>
Date:   Fri, 5 Mar 2021 14:12:58 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210305133703.42179-1-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On 05/03/2021 13:37, Geert Uytterhoeven wrote:
> Add device tree bindings documentation for the Renesas R-Car V3U Falcon
> CSI/DSI and Ethernet sub-boards.  These are plugged into the Falcon
> BreakOut board to form the full Falcon board stack.

Aha, so this answers my questions this week ;-)

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

Presumably however - of course 2 could itself also be optional, with
/another/ board being designed to fit in place. Which I assume is why 1
is separated at all.

But that only comes when someone adds the DTB for that 'alternative'
breakout.

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

Will '1' on it's own be of any use? Or will there always need to be a
'2'? (which might be undefined / other board / '5').




>   b. How to handle "model" and "compatible" properties for (sub)boards?
>      Perhaps fdtoverlay could combine the "model" and "compatible"
>      properties in the root nodes?  However, that is not always desired.
> 

Combining the models could get ... long and repetitive couldn't it ?
I guess this is one advantage of having a separate .dts file and setting
it explicitly...

I guess there's no way to easily pass that in as a parameter of sorts :-(



> Thanks for your comments!

I'm looking forward to seeing this in action, and develop further.

Especially for cleaning up some of the GMSL add on boards we have.

--
Kieran


> 
> [1] [PATCH v2 0/3] arm64: dts: renesas: falcon: Add I2C EEPROMs and sub-boards
>     https://lore.kernel.org/linux-renesas-soc/20210304153257.4059277-1-geert+renesas@glider.be
> ---
>  Documentation/devicetree/bindings/arm/renesas.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/renesas.yaml b/Documentation/devicetree/bindings/arm/renesas.yaml
> index 5fd0696a9f91f383..08ba12632f52c317 100644
> --- a/Documentation/devicetree/bindings/arm/renesas.yaml
> +++ b/Documentation/devicetree/bindings/arm/renesas.yaml
> @@ -296,6 +296,13 @@ properties:
>            - const: renesas,falcon-cpu
>            - const: renesas,r8a779a0
>  
> +      - items:
> +          - const: renesas,falcon-breakout # Falcon BreakOut board (RTP0RC779A0BOB0010S)
> +          - const: renesas,falcon-csi-dsi # Falcon CSI/DSI sub-board (RTP0RC779A0DCS0010S)
> +          - const: renesas,falcon-ethernet # Falcon Ethernet sub-board (RTP0RC779A0ETS0010S)
> +          - const: renesas,falcon-cpu
> +          - const: renesas,r8a779a0
> +
>        - description: RZ/N1D (R9A06G032)
>          items:
>            - enum:
> 

