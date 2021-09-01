Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDD523FE522
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Sep 2021 00:01:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232627AbhIAWCS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 1 Sep 2021 18:02:18 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:52914 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230182AbhIAWCR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Sep 2021 18:02:17 -0400
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 98A33340;
        Thu,  2 Sep 2021 00:01:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1630533675;
        bh=oBIuv/gN5NyegE3mK/LDP8EEP5EAxS3NGI0JIKQpmEE=;
        h=From:Subject:To:Cc:References:Date:In-Reply-To:From;
        b=dtVrH0E6SkIwLsiU8IcybDaJs94nn4MAXDUf9jRMZEG/veXfBlLVFUw+H3DpYQzy2
         R4984RKnHKvDnh+PbCMmupf/SBjYW6g7kYLZVrl9VWl1je5N9jsS1KJ1kP0PpT6HLs
         H0oGE3CmUghBiSYLHyBRiEfWdZT+Y2nrrX7pb8Ys=
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH] dt-bindings: display: renesas,du: Provide bindings for
 r8a779a0
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>,
        "open list:DRM DRIVERS FOR RENESAS" 
        <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20210622231146.3208404-1-kieran.bingham@ideasonboard.com>
 <CAMuHMdW8vYC3+gVCv5eG_vkX79vU8RQL-6fSJd9McetDzikzSA@mail.gmail.com>
Message-ID: <22bf664e-4a28-3ae2-0106-5913a8643625@ideasonboard.com>
Date:   Wed, 1 Sep 2021 23:01:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdW8vYC3+gVCv5eG_vkX79vU8RQL-6fSJd9McetDzikzSA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On 23/06/2021 13:53, Geert Uytterhoeven wrote:
> Hi Kieran,
> 
> On Wed, Jun 23, 2021 at 1:11 AM Kieran Bingham
> <kieran.bingham@ideasonboard.com> wrote:
>> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>
>> Extend the Renesas DU display bindings to support the r8a779a0 V3U.
>>
>> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> Thanks for your patch!
> 
>> --- a/Documentation/devicetree/bindings/display/renesas,du.yaml
>> +++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
>> @@ -39,6 +39,7 @@ properties:
>>        - renesas,du-r8a77980 # for R-Car V3H compatible DU
>>        - renesas,du-r8a77990 # for R-Car E3 compatible DU
>>        - renesas,du-r8a77995 # for R-Car D3 compatible DU
>> +      - renesas,du-r8a779a0 # for R-Car V3U compatible DU
>>
>>    reg:
>>      maxItems: 1
>> @@ -774,6 +775,57 @@ allOf:
>>          - reset-names
>>          - renesas,vsps
>>
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - renesas,du-r8a779a0
>> +    then:
>> +      properties:
>> +        clocks:
>> +          items:
>> +            - description: Functional clock for DU0
>> +            - description: Functional clock for DU1
>> +
>> +        clock-names:
>> +          items:
>> +            - const: du.0
>> +            - const: du.1
> 
> The hardware block has only a single function clock for both channels,
> like on R-Car H1.

Indeed, but I believe both channels still need to set them, if they can
be operated independently, the driver looks up the clock based on the
du.%d, and so for DU1, it is simply expressed as the same clock in DT.

Is this acceptable? or is there further issues there?

> 
> And what about DU_DOTCLKIN?

This thread has already discussed this with Laurent, and I concur -
There doesn't appear to be any relevant reference to DU_DOTCLKIN on the
DU side.


> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
