Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31F351F77FB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2020 14:35:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726085AbgFLMfr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Jun 2020 08:35:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726053AbgFLMfr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Jun 2020 08:35:47 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D932C03E96F
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2020 05:35:44 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id r9so7996391wmh.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2020 05:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bingham-xyz.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9MumUUgqLWytHwP9ehBXSm+MVIwaO9vWHoWnJUyIUJ0=;
        b=CtCxJvKCaC+simBXBxA7GnQl7aZf2bijrR8/k5sTCCRoTJ8Up++OCXhewdnegwfwAy
         6Gcor+67Yp2EUQTVnbn7t1vZWP04av1OM5t7OnACINzDL+LZ1gsD6sWne2sInKHC2ZWT
         5ZVhpIPI/4O4lwdpgYwQ02or4fvRidGsMus48lbVWx2JErCLQlr9ea2TdMNeKLlfePKL
         bYEzwzavfMN4xh1OMxov3RnQdadQBR9IY5yAB9nQppLovNWWZy6eZtM2oxN8PvQ2uQ+P
         pb1ghA6lf1wX1OuUMK2qmIAI9Igmm6geYer2szZIsihqQRWzMqByqawZ27F8EDvXCRJh
         OyKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=9MumUUgqLWytHwP9ehBXSm+MVIwaO9vWHoWnJUyIUJ0=;
        b=AbhGUZDetzGa/xJxzDQhwaAAXzPP7hfZrysIwg1+jWCJInDgZwMV1PvlvNKm4JFHSr
         qrXLs3JdFYdf/OYOSivsM0TetgMUsMzAbwc2sOhJZZgTOKB4lv822KFdHCq8KVuMUZVc
         3zsWkKcZ/0ZbEQxI07mE5oO0D9ABhR1D89+TSbpJ37trABr7Tn+WvEt5jTInBR+IWdXw
         XnqiHlKbN5uz/Vpzu0X8GNwusqdaGQBkVqvMsUZ4j435thcRufl6R6IrlNhwzqUVjPO6
         VH4XIeOpCYWVDiL7IKDQhEJbbOqTyXhg1WO+pdYMns4yDoErg8kyiqcGZfJfZZq40Lba
         mkkw==
X-Gm-Message-State: AOAM5325vf4qHaIqjlXI+tvGNCzCo0dHOHpzH4QKEccD1g20IcQuQZnB
        wMOtMu8D7BNgG2chIkjGy6lN4C4+X5w=
X-Google-Smtp-Source: ABdhPJz0I385pC4begIfuiU9pJmcnSbdr59nNNdJLu3IIrRs9YVAffeetsLWTL+QyC7vB34JLCd+KA==
X-Received: by 2002:a05:600c:21c2:: with SMTP id x2mr13347012wmj.33.1591965342288;
        Fri, 12 Jun 2020 05:35:42 -0700 (PDT)
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net. [86.31.129.233])
        by smtp.gmail.com with ESMTPSA id s18sm11492526wra.85.2020.06.12.05.35.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2020 05:35:41 -0700 (PDT)
Subject: Re: [PATCH v9.2 6/9] fixes! [max9286-dt]: Add GPIO controller support
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
References: <20200610124623.51085-1-kieran@bingham.xyz>
 <20200610124623.51085-7-kieran@bingham.xyz>
 <20200610151645.mh75ago5z5bdsnwf@uno.localdomain>
From:   Kieran Bingham <kieran@ksquared.org.uk>
Autocrypt: addr=kieran@bingham.xyz; keydata=
 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
 QglrIkyNWSZm4Hhw98VxYDwOwmYhoXmAFg==
Message-ID: <f786b689-a9fa-ed08-d1ba-f912af2b90fb@bingham.xyz>
Date:   Fri, 12 Jun 2020 13:35:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200610151645.mh75ago5z5bdsnwf@uno.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 10/06/2020 16:16, Jacopo Mondi wrote:
> Hi Kieran
> 
> On Wed, Jun 10, 2020 at 01:46:20PM +0100, Kieran Bingham wrote:
>> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>
>> The MAX9286 exposes a GPIO controller to control the two GPIO out pins
>> of the chip.
>>
>> These can in some configurations be used to control the power of the
>> cameras, and in the case of the V3M, it is used to enable power up
>> of the GMSL PoC regulator.
>>
>> The regulator can not (currently) be moddelled as a regulator due to
>> probe time issues, and instead are controlled through the use of a
>> gpio-hog.
>>
>> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> I have missed if this should be a required property or not..

Hrm... I'm not sure. It isn't 'required' ... but the device does expose
gpio pins, which the driver provides access to (and is needed to be able
to expose a gpio-hog).

If the device isn't marked as a gpio-controller, then the gpio-hog
framework doesn't work.

But the gpio pins will ...

Do you think I should add gpio-controller to the required section as well?:

--- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
@@ -220,6 +220,7 @@ required:
   - reg
   - ports
   - i2c-mux
+  - gpio-controller

 additionalProperties: false


As it's only required for making gpio-hogs, I guess it's optional, and
doesn't need to be listed...

But the *hardware* has gpios... which are controllable...

--
Kieran


> 
> 
>> ---
>>  .../devicetree/bindings/media/i2c/maxim,max9286.yaml         | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
>> index f9d3e5712c59..7d75c3b63c0b 100644
>> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
>> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
>> @@ -46,6 +46,11 @@ properties:
>>      description: GPIO connected to the \#PWDN pin with inverted polarity
>>      maxItems: 1
>>
>> +  gpio-controller: true
>> +
>> +  '#gpio-cells':
>> +      const: 2
>> +
>>    ports:
>>      type: object
>>      description: |
>> --
>> 2.25.1
>>

