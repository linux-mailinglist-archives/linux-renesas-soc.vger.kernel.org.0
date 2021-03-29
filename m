Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2738434CCCF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Mar 2021 11:16:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235102AbhC2JP4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Mar 2021 05:15:56 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:44274 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233574AbhC2JPW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Mar 2021 05:15:22 -0400
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 652B531A;
        Mon, 29 Mar 2021 11:15:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1617009320;
        bh=w+u8awEcUAIyaWz4n6/GWHf/biGVytR8CCbYVcJiWg4=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Ih4AtuQDpXPwrh27FOawTDhUDEXkafBZT3R/gNhXrQ7VURJnDmvLskosmTiAByRtN
         9zc0F/tgiYOX7w2aM8/wnaico8PEAJNOJf5N/lZah3UNL8LRZd71iaamFOifrhEHUy
         qfTP9vXEUMmrENPEXdYXjsMOZG70dOWPIRJf5v4I=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v2] arm64: dts: renesas: falcon-cpu: Add GP LEDs
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20210322172013.1152121-1-kieran.bingham+renesas@ideasonboard.com>
 <CAMuHMdVzW=pAbJzSmC3Wt3zH4F8kUfd-s0JkQeg5NdPsGJAVrw@mail.gmail.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <be500812-d3e3-4499-c6e0-504773520087@ideasonboard.com>
Date:   Mon, 29 Mar 2021 10:15:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVzW=pAbJzSmC3Wt3zH4F8kUfd-s0JkQeg5NdPsGJAVrw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On 29/03/2021 09:30, Geert Uytterhoeven wrote:
> Hi Kieran,
> 
> On Mon, Mar 22, 2021 at 6:20 PM Kieran Bingham
> <kieran.bingham+renesas@ideasonboard.com> wrote:
>> Three general purpose LEDs are provided on the Falcon CPU board.
>>
>> Connect GP_LED1, GP_LED2, and GP_LED3 to the gpio-leds frameworks as
>> indicator LEDs.
>>
>> These LEDs are arranged in a block of four LEDs on the board itself, but
>> the fourth LED is as yet unidentified.
>>
>> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> Thanks for your patch (which does not apply against renesas-devel)!

Oh, I'm sure I was based on renesas-devel/master when submitting that...
I guess I need to rebase my branch again.

> 
>> --
> 
> --- ;-)

Yup - sorry ;-)

> 
>> v2:
>>  - Move to r8a779a0-falcon-cpu.dtsi
>>  - Define the colour, and function.
> 
>> --- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
>> +++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
>> @@ -6,12 +6,37 @@
>>   */
>>
>>  #include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/leds/common.h>
>> +
>>  #include "r8a779a0.dtsi"
>>
>>  / {
>>         model = "Renesas Falcon CPU board";
>>         compatible = "renesas,falcon-cpu", "renesas,r8a779a0";
>>
>> +       leds {
>> +               compatible = "gpio-leds";
>> +
>> +               led1 {
> 
> led-1?
> 
> Documentation/devicetree/bindings/leds/leds-gpio.yaml says:
> 
>   # The first form is preferred, but fall back to just 'led' anywhere in the
>   # node name to at least catch some child nodes.
>   "(^led-[0-9a-f]$|led)":

Aha so picky ;-)


>> +                       gpios = <&gpio4 18 GPIO_ACTIVE_HIGH>;
>> +                       color = <LED_COLOR_ID_GREEN>;
>> +                       function = LED_FUNCTION_INDICATOR;
>> +                       function-enumerator = <1>;
>> +               };
>> +               led2 {
>> +                       gpios = <&gpio4 19 GPIO_ACTIVE_HIGH>;
>> +                       color = <LED_COLOR_ID_GREEN>;
>> +                       function = LED_FUNCTION_INDICATOR;
>> +                       function-enumerator = <2>;
>> +               };
>> +               led3 {
>> +                       gpios = <&gpio4 20 GPIO_ACTIVE_HIGH>;
>> +                       color = <LED_COLOR_ID_GREEN>;
>> +                       function = LED_FUNCTION_INDICATOR;
>> +                       function-enumerator = <3>;
>> +               };
>> +       };
>> +
>>         memory@48000000 {
>>                 device_type = "memory";
>>                 /* first 128MB is reserved for secure area. */
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v5.13, with the above fixed.

Thanks.

For reference only, As previously discussed there is a fourth led in
this block of LEDs arranged on the board.

I can only confirm that it is not controllable by either GPIO4{17,21}.

But I have not been able to locate what might be controlling it.

So for now, it remains ignored. It might not be the safest to go
flipping all of the GPIOs randomly on this board ;-)

--
Kieran


> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

