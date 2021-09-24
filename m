Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39D6D4176BE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Sep 2021 16:22:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346753AbhIXOX6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 24 Sep 2021 10:23:58 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:51184 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346674AbhIXOX5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Sep 2021 10:23:57 -0400
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B8A6345E;
        Fri, 24 Sep 2021 16:22:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1632493343;
        bh=sI5BIoPQxeK0bxKQ3T7u0K1yjT2539OIbJyBxYbh/M8=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=lpfJjiGRFynZNguskXoWItSJa9BRno9YpIRwryye/OxkFTFcVDPx2cchnPHXtngXI
         RTuf6whlVdN9j+T38Ghqiv4Au/Zl1ZPXtUDwINciggKiRG96zIbjtYv4famU50DfTZ
         wvKXqSusDshGyv3uTjmMVyot7ye3z28h9KPiN+cU=
Subject: Re: [PATCH v3 1/3] arm64: dts: renesas: r8a779a0: Add DU support
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20210923010402.3418555-1-kieran.bingham@ideasonboard.com>
 <20210923010402.3418555-2-kieran.bingham@ideasonboard.com>
 <CAMuHMdUTYYoZawgMhpTr56v88-mrKWPpgMwC-9KPeYhS6R2AzQ@mail.gmail.com>
 <40831759-6827-ea6d-399e-7f27f3669013@ideasonboard.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <9c7ffc24-660c-9041-2fd1-9899017007a9@ideasonboard.com>
Date:   Fri, 24 Sep 2021 15:22:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <40831759-6827-ea6d-399e-7f27f3669013@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 23/09/2021 13:05, Kieran Bingham wrote:
> Hi Geert,
> 
> On 23/09/2021 08:00, Geert Uytterhoeven wrote:
>> Hi Kieran,
>>
>> On Thu, Sep 23, 2021 at 3:04 AM Kieran Bingham
>> <kieran.bingham@ideasonboard.com> wrote:
>>> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>> Provide the device nodes for the DU on the V3U platforms.
>>>
>>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>> ---
>>> v2
>>>  - Use a single clock specification for the whole DU.
>>>
>>> v3:
>>>  - Use 'du.0' clock name instead of 'du'
>>
>> Thanks for the update!
>>
>>> --- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
>>> +++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
>>> @@ -1251,6 +1251,36 @@ vspd1: vsp@fea28000 {
>>>                         renesas,fcp = <&fcpvd1>;
>>>                 };
>>>
>>> +               du: display@feb00000 {
>>> +                       compatible = "renesas,du-r8a779a0";
>>> +                       reg = <0 0xfeb00000 0 0x40000>;
>>> +                       interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
>>> +                                    <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
>>> +                       clocks = <&cpg CPG_MOD 411>;
>>> +                       clock-names = "du.0";
>>> +                       power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
>>> +                       resets = <&cpg 411>;
>>
>> You missed reset-names.
> 
> Adding it in now.
> 
> Sorry I must get the dtchecks automated in my builds...
> 
> --
> Kieran
> 
> 
>>
>>> +                       vsps = <&vspd0 0>, <&vspd1 0>;


Also, clearly this should be 'renesas,vsps =' ;-)

--
Kieran


>>> +                       status = "disabled";
>>> +
>>> +                       ports {
>>> +                               #address-cells = <1>;
>>> +                               #size-cells = <0>;
>>> +
>>> +                               port@0 {
>>> +                                       reg = <0>;
>>> +                                       du_out_dsi0: endpoint {
>>> +                                       };
>>> +                               };
>>> +
>>> +                               port@1 {
>>> +                                       reg = <1>;
>>> +                                       du_out_dsi1: endpoint {
>>> +                                       };
>>> +                               };
>>> +                       };
>>> +               };
>>> +
>>>                 prr: chipid@fff00044 {
>>>                         compatible = "renesas,prr";
>>>                         reg = <0 0xfff00044 0 4>;
>>
>> Gr{oetje,eeting}s,
>>
>>                         Geert
>>


-- 
--
Kieran
