Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 487C6B0EA4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Sep 2019 14:11:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731283AbfILMLn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Sep 2019 08:11:43 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54608 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730454AbfILMLn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Sep 2019 08:11:43 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DD4AC33A;
        Thu, 12 Sep 2019 14:11:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1568290301;
        bh=NOv4MyRD/H4sN33iCT3cWaXxofQTNOSbcc5mu90xRJ4=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=V3K7kyI+B8VIXUeBNONAh5xlpsnF22g3XbXJ2RLNyU58NmUmY2KkyNiCIO4jHepad
         ObfbkW0mrY7QBlxGkxM5zLpivD5h3NECfvONQQOb2Xu1UbW4NAMguOSWw3eVJLpg9p
         3I4zFBb1Fgj9P5M7fOgO7BPFwOugJ9oOS9/LUom0=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH] drm: rcar-du: Add r8a77980 support
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20190911192502.16609-1-kieran.bingham+renesas@ideasonboard.com>
 <70b94265-69f3-d18f-1b67-b5b814723b1b@cogentembedded.com>
 <a9cc2193-0a18-0490-c273-c64bd70992f5@ideasonboard.com>
 <CAMuHMdVYqx_znkMbwCVyA6WH8-0uOotL3wXCTkvyXG1=i9W-ng@mail.gmail.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <b0b689e6-2f99-049f-23a7-213678d6a7a6@ideasonboard.com>
Date:   Thu, 12 Sep 2019 13:11:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVYqx_znkMbwCVyA6WH8-0uOotL3wXCTkvyXG1=i9W-ng@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 12/09/2019 13:03, Geert Uytterhoeven wrote:
> Hi Kieran,
> 
> On Thu, Sep 12, 2019 at 12:26 PM Kieran Bingham
> <kieran.bingham+renesas@ideasonboard.com> wrote:
>> (pulling in +Geert for his opinion on compatible string usages)
>>
>> On 12/09/2019 11:00, Sergei Shtylyov wrote:> Hello!
>>> On 11.09.2019 22:25, Kieran Bingham wrote:
>>>> Add direct support for the r8a77980 (V3H).
>>>>
>>>> The V3H shares a common, compatible configuration with the r8a77970
>>>> (V3M) so that device info structure is reused.
>>>
>>>    Do we really need to add yet another compatible in this case?
>>> I just added r8a77970 to the compatible prop in the r8a77980 DT. That's why
>>> a patch like this one didn't get posted by me.
>>
>> It's not just about the compatible string for me here,
>>
>> There is no indication in the driver that it supports the r8a77980, and
>> no comment in the driver to explain that the r8a77980 is shared by the
>> r8a77970.
>>
>> This patch makes that explicit at the driver.
>>
>> Also - I am considering sending a patch (that I've already created
>> anyway) to remove the r8a77970 reference from the
>>
>>   arch/arm64/boot/dts/renesas/r8a77980.dtsi file.
>>
>> This is the *only* non r8a77980 reference in this file, so it seems very
>> out of place.
> 
> Agreed.
> 
>> In fact more so than that - except for a seemingly glaring typo, that
>> I'll investigate and send a patch for next, this is the *only* cross-soc
>> compatible reference:
>>
>> #!/bin/sh
>>
>> files=r8a77*.dtsi
>>
>> for f in $files;
>> do
>>         soc=`basename $f .dtsi | sed 's/-.*//'`
>>         echo "F: $f soc: $soc";
>>
>>         # Find all references to all socs, then hide 'this' soc
>>         grep r8a77 $f | grep -v $soc
> 
> This hides the complete line.  So you better use e.g.
> 
>     sed -e "s/$soc/soc/ig" $f | grep -i r8a

Aha yes, excellent point! (I'm glad I posted my working)

> 
> instead.  No new offenders, though.

Phew, I still got the right answer :-D

--
Kieran
