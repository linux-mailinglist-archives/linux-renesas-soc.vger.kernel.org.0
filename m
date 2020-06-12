Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 651BC1F7813
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2020 14:48:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726257AbgFLMsE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Jun 2020 08:48:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726089AbgFLMsE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Jun 2020 08:48:04 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24B79C03E96F
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2020 05:48:04 -0700 (PDT)
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 54F4E24F;
        Fri, 12 Jun 2020 14:48:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1591966082;
        bh=kwadW7obSZQzu7w4liiQ07r22kt62cBEbq5/wAhFP3Y=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=BAKpHw0kgkhgNEpXwjzy7vpQhqy70ltxQh/boO3y940CGTf4NP97b2bB/SvtowsyL
         v3TnjWJZ7G0tHgQUPVGkvikzy8i7FmYwKA06zZImfJa3/sFVu3HP2XN9i9ywJ+vey1
         xUIT7fD35WpK+LqOiciGwPGLO6V+3DtQW6QtW0ac=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v9.2 6/9] fixes! [max9286-dt]: Add GPIO controller support
To:     Kieran Bingham <kieran@ksquared.org.uk>,
        Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>
References: <20200610124623.51085-1-kieran@bingham.xyz>
 <20200610124623.51085-7-kieran@bingham.xyz>
 <20200610151645.mh75ago5z5bdsnwf@uno.localdomain>
 <f786b689-a9fa-ed08-d1ba-f912af2b90fb@bingham.xyz>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <784395db-f779-f34e-96cc-4284431d4d96@ideasonboard.com>
Date:   Fri, 12 Jun 2020 13:47:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <f786b689-a9fa-ed08-d1ba-f912af2b90fb@bingham.xyz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 12/06/2020 13:35, Kieran Bingham wrote:
> On 10/06/2020 16:16, Jacopo Mondi wrote:
>> Hi Kieran
>>
>> On Wed, Jun 10, 2020 at 01:46:20PM +0100, Kieran Bingham wrote:
>>> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>>
>>> The MAX9286 exposes a GPIO controller to control the two GPIO out pins
>>> of the chip.
>>>
>>> These can in some configurations be used to control the power of the
>>> cameras, and in the case of the V3M, it is used to enable power up
>>> of the GMSL PoC regulator.
>>>
>>> The regulator can not (currently) be moddelled as a regulator due to
>>> probe time issues, and instead are controlled through the use of a
>>> gpio-hog.
>>>
>>> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>
>> I have missed if this should be a required property or not..
> 
> Hrm... I'm not sure. It isn't 'required' ... but the device does expose
> gpio pins, which the driver provides access to (and is needed to be able
> to expose a gpio-hog).
> 
> If the device isn't marked as a gpio-controller, then the gpio-hog
> framework doesn't work.
> 
> But the gpio pins will ...
> 
> Do you think I should add gpio-controller to the required section as well?:
> 
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> @@ -220,6 +220,7 @@ required:
>    - reg
>    - ports
>    - i2c-mux
> +  - gpio-controller
> 
>  additionalProperties: false
> 
> 
> As it's only required for making gpio-hogs, I guess it's optional, and
> doesn't need to be listed...
> 
> But the *hardware* has gpios... which are controllable...

And of course adding to the requried properties, means the example needs
ot be updated too, so it's actually:

Which I'll also add to v10, if you don't object.



Author: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Date:   Fri Jun 12 13:36:28 2020 +0100

    make gpio-controller non-optional

    Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

diff --git
a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
index 8307c41f2cae..c632a10a753a 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
@@ -220,6 +220,7 @@ required:
   - reg
   - ports
   - i2c-mux
+  - gpio-controller

 additionalProperties: false

@@ -239,6 +240,9 @@ examples:
         poc-supply = <&camera_poc_12v>;
         enable-gpios = <&gpio 13 GPIO_ACTIVE_HIGH>;

+        gpio-controller;
+        #gpio-cells = <2>;
+
         ports {
           #address-cells = <1>;
           #size-cells = <0>;



> 
> --
> Kieran
> 
> 
>>
>>
>>> ---
>>>  .../devicetree/bindings/media/i2c/maxim,max9286.yaml         | 5 +++++
>>>  1 file changed, 5 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
>>> index f9d3e5712c59..7d75c3b63c0b 100644
>>> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
>>> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
>>> @@ -46,6 +46,11 @@ properties:
>>>      description: GPIO connected to the \#PWDN pin with inverted polarity
>>>      maxItems: 1
>>>
>>> +  gpio-controller: true
>>> +
>>> +  '#gpio-cells':
>>> +      const: 2
>>> +
>>>    ports:
>>>      type: object
>>>      description: |
>>> --
>>> 2.25.1
>>>
> 

