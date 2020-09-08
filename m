Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BA9926208A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Sep 2020 22:13:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730116AbgIHUNE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Sep 2020 16:13:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729941AbgIHPLR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Sep 2020 11:11:17 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72C25C09B04F;
        Tue,  8 Sep 2020 07:48:55 -0700 (PDT)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B154F47;
        Tue,  8 Sep 2020 16:48:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1599576522;
        bh=lvuH3mHmFR9FWeXOZYD3vPI3zMXgRaK78p8ySrX6YIs=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=mU7jGnXsS6A3cBz+uMMka46IWBFtttpP68LYhszJ2OVdvY4JbfMcwnzD3cY8a0dp/
         AXR5fUeGyRT4QrhaNXkB6BZ0/4eRjlnZuEuZweVPTBgOmz0lmp6JHABR0zNgHTYgZu
         kN5TcnDtVLPGUgDd1WOoP6B+H5uO32Fvjg1EnSNs=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v2 02/10] dt-bindings: display: renesas: dw-hdmi: tidyup
 example compatible.
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-DT <devicetree@vger.kernel.org>,
        "(Renesas) shimoda" <yoshihiro.shimoda.uh@renesas.com>,
        dri-devel@lists.freedesktop.org
References: <87o8mhrtxo.wl-kuninori.morimoto.gx@renesas.com>
 <87lfhlrtwp.wl-kuninori.morimoto.gx@renesas.com>
 <6e1eedf0-d05f-81cd-e437-33fc4c7337f3@ideasonboard.com>
 <20200908144317.GA11405@pendragon.ideasonboard.com>
 <20200908144623.GB11405@pendragon.ideasonboard.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <e6c388c1-d48d-cc0f-a4ed-fe9b8892fe68@ideasonboard.com>
Date:   Tue, 8 Sep 2020 15:48:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200908144623.GB11405@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On 08/09/2020 15:46, Laurent Pinchart wrote:
> On Tue, Sep 08, 2020 at 05:43:25PM +0300, Laurent Pinchart wrote:
>> Hi Kieran,
>>
>> On Tue, Sep 08, 2020 at 03:18:20PM +0100, Kieran Bingham wrote:
>>> On 08/09/2020 01:34, Kuninori Morimoto wrote:
>>>> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>>>>
>>>> required is "renesas,r8a7795-hdmi", instead of "renesas,r8a7795-dw-hdmi"
>>>
>>> Hrm, technically the driver will currently only match on :
>>>   "renesas,rcar-gen3-hdmi"
>>>
>>> But I see how the '-dw-' has probably snuck in from other devices, and
>>> is inappropriate.
>>>
>>> Perhaps this should be more clear that it matches on the generic compatible:
>>> 	renesas,rcar-gen3-hdmi
>>>
>>> (or a combination of both?)
>>>
>>>> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>>>
>>> But if the generic isn't required, then this patch alone does fix what I
>>> would call an error, so ...
>>
>> You're right, the generic compatible string should be required. I'll
>> update this patch accordingly, and will address the bindings as part of
>> the conversion to YAML.
> 
> Proposed new commit:
> 
> commit cc487cbb06d841ca76efade63201a41bd04f6015
> Author: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Date:   Tue Sep 8 09:34:11 2020 +0900
> 
>     dt-bindings: display: renesas: dw-hdmi: Tidyup example compatible
> 
>     The DT example erronously uses the "renesas,r8a7795-dw-hdmi", when the
>     correct value is "renesas,r8a7795-hdmi". It is furthermore missing the
>     generic "renesas,rcar-gen3-hdmi" compatible string. Fix it.
> 
>     Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>     Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>     Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>     [Add "renesas,rcar-gen3-hdmi" and rework commit message]
>     Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
> index f275997ab947..9c56c5169a88 100644
> --- a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
> @@ -43,7 +43,7 @@ Optional properties:
>  Example:
> 
>  	hdmi0: hdmi@fead0000 {
> -		compatible = "renesas,r8a7795-dw-hdmi";
> +		compatible = "renesas,r8a7795-hdmi", "renesas,rcar-gen3-hdmi";
>  		reg = <0 0xfead0000 0 0x10000>;
>  		interrupts = <0 389 IRQ_TYPE_LEVEL_HIGH>;
>  		clocks = <&cpg CPG_CORE R8A7795_CLK_S0D4>, <&cpg CPG_MOD 729>;
> 


Perfect, looks good to me.
--
Kieran


>>> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>>
>>> We could always make this more clear when converting to YAML.
>>>
>>>> ---
>>>>  .../devicetree/bindings/display/bridge/renesas,dw-hdmi.txt      | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
>>>> index 819f3e31013c..e6526ab485d0 100644
>>>> --- a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
>>>> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
>>>> @@ -42,7 +42,7 @@ Optional properties:
>>>>  Example:
>>>>  
>>>>  	hdmi0: hdmi@fead0000 {
>>>> -		compatible = "renesas,r8a7795-dw-hdmi";
>>>> +		compatible = "renesas,r8a7795-hdmi";
>>>>  		reg = <0 0xfead0000 0 0x10000>;
>>>>  		interrupts = <0 389 IRQ_TYPE_LEVEL_HIGH>;
>>>>  		clocks = <&cpg CPG_CORE R8A7795_CLK_S0D4>, <&cpg CPG_MOD 729>;
> 

