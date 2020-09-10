Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79821264436
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Sep 2020 12:35:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730150AbgIJKfB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Sep 2020 06:35:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728350AbgIJKeh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Sep 2020 06:34:37 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F1BCC061573;
        Thu, 10 Sep 2020 03:34:36 -0700 (PDT)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3FC7A3B;
        Thu, 10 Sep 2020 12:34:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1599734067;
        bh=Dmmg95bt89l1Tptk+BHOHpTSANQEVcyWBQUkB+1pjXU=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=AFIIPzX85Ce46c9OhFYJ8Gdg6nu+Y5MEudB42iCuWZdmGiO3FblSOmxW+BHNWUigp
         JcyLvXUU5nr5SHghkPl71lsHigBYrB183hQKWkyYK+fUd3hr/hY5hMrZlGCAHchK8z
         Teh6wSTfMy6ugzBMwYyWkEdq0k+iS0iCBH48vaow=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH 5/9] arm64: dts: renesas: r8a77961: Add VSP device nodes
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Laurent <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-DT <devicetree@vger.kernel.org>,
        "(Renesas) shimoda" <yoshihiro.shimoda.uh@renesas.com>,
        DRI Development <dri-devel@lists.freedesktop.org>
References: <87sgbu70tq.wl-kuninori.morimoto.gx@renesas.com>
 <87lfhm70s6.wl-kuninori.morimoto.gx@renesas.com>
 <31ec6196-7613-8eb3-e092-07d0c874632a@ideasonboard.com>
 <CAMuHMdVHGQ0FFcLjQfXhke5PKJKnNfZ3NOF-p08v3QrQ-87npA@mail.gmail.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <f1ed4b08-59eb-986e-4036-820887993f00@ideasonboard.com>
Date:   Thu, 10 Sep 2020 11:34:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVHGQ0FFcLjQfXhke5PKJKnNfZ3NOF-p08v3QrQ-87npA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On 10/09/2020 10:44, Geert Uytterhoeven wrote:
> Hi Kieran,
> 
> On Mon, Sep 7, 2020 at 5:55 PM Kieran Bingham
> <kieran.bingham+renesas@ideasonboard.com> wrote:
>> On 07/09/2020 03:59, Kuninori Morimoto wrote:
>>> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>>>
>>> This patch adds VSP device nodes for R-Car M3-W+ (r8a77961) SoC.
>>> This patch is test on R-Car M3-W+ Salvator-XS board.
>>>
>>> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>>> ---
>>>  arch/arm64/boot/dts/renesas/r8a77961.dtsi | 55 +++++++++++++++++++++++
>>>  1 file changed, 55 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
>>> index fe0db11b9cb9..c2a6918ed5e6 100644
>>> --- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
>>> +++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
>>> @@ -2056,6 +2056,61 @@ fcpvd2: fcp@fea37000 {
>>>                       iommus = <&ipmmu_vi0 10>;
>>>               };
>>
>> The FCP's added are:
>>
>>                 fcpf0: fcp@fe950000 {
>>                 fcpf1: fcp@fe951000 {
>>                 fcpvb0: fcp@fe96f000 {
>>                 fcpvb1: fcp@fe92f000 {
>>                 fcpvi0: fcp@fe9af000 {
>>                 fcpvi1: fcp@fe9bf000 {
>>                 fcpvd0: fcp@fea27000 {
>>                 fcpvd1: fcp@fea2f000 {
>>                 fcpvd2: fcp@fea37000 {
>>
>> So indeed, the first fcpf0 comes before fe960000.
>>
>> Do we keep the items grouped by the first occurrence? or sort the nodes
>> based on address?
>>
>> for some reason I thought we were ordering based on address, but I see
>> other situations where we group too - so I'm confused (and wishing there
>> was an automatic tool to get the sorting correct without fuss).
>>
>> Is there a set policy?
> 
> For nodes with a unit-address, we usually[*] sort by unit-address, but we keep
> similar nodes grouped.  Hence I prefer this v1 over v2.

I assume then the groups are sorted by the first entry,

I.e. hypothetically:

fdp@0
fcp@1
vsp@2
fdp@3
fcp@4
vsp@5
cmm@6
cmm@7

would become

fdp@0
fdp@3
fcp@1
fcp@4
vsp@2
vsp@5
cmm@6
cmm@7

Has anyone already created any scripting/validation to automate the
sorting requirements?

> 
> [*] Seems like FCP/VSP are interleaved in r8a77990.dsi, doh.
> 

Personally I prefer that - but my opinion doesn't matter here - so as
long as the rules are defined (or even better, automatically
enforceable) that's fine.


>>> +             vspb: vsp@fe960000 {
>>> +                     compatible = "renesas,vsp2";
>>> +                     reg = <0 0xfe960000 0 0x8000>;
>>> +                     interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
>>> +                     clocks = <&cpg CPG_MOD 626>;
>>> +                     power-domains = <&sysc R8A77961_PD_A3VC>;
>>> +                     resets = <&cpg 626>;
>>> +
>>> +                     renesas,fcp = <&fcpvb0>;
>>> +             };
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

