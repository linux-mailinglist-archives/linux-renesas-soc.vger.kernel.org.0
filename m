Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E06E20350A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2020 12:45:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727868AbgFVKpv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Jun 2020 06:45:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727094AbgFVKpv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Jun 2020 06:45:51 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E87D9C061794
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2020 03:45:50 -0700 (PDT)
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 56D1930D;
        Mon, 22 Jun 2020 12:45:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592822749;
        bh=+m0fg+AKm7xotCQ0LoY7GcVc5EhPb/HEsQ0ae84Ablg=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=pW5thTjZtB2zN1FOUDF3JBGC0UoBN4C+uqTdycofNWUz8z48Nq6aZ3Z1QS8UD6ZXl
         MrdR2rKHBB0OEpCWeT35wyPB7bp7IH0B1OSSJwkludbDpNhGpgBwhA3Lisx9IbI5vm
         vS/Yj+HJyCFxGNFvYfPopHjR/AdQNYq9J0J6iROQ=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH 1/3] scripts/boards.sh: Fix M3-W identifier
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
References: <20200615121935.108142-1-jacopo@jmondi.org>
 <20200615121935.108142-2-jacopo@jmondi.org>
 <21e37cce-f1f2-bb8f-111c-1592f73d01d6@ideasonboard.com>
 <20200622103441.GA3448812@oden.dyn.berto.se>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <2628f76b-b26f-c1e1-d3e3-1809d8113cae@ideasonboard.com>
Date:   Mon, 22 Jun 2020 11:45:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200622103441.GA3448812@oden.dyn.berto.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 22/06/2020 11:34, Niklas Söderlund wrote:
> Hi Kieran,
> 
> On 2020-06-22 10:53:12 +0100, Kieran Bingham wrote:
>> Hi Jacopo,
>>
>> On 15/06/2020 13:19, Jacopo Mondi wrote:
>>> The M3-W SoC has been renamed to r8a77960, adjust the board.sh script to
>>> identify it correctly.
>>>
>>
>> We probably don't need to keep backwards compatibility indeed ...
> 
> If the cost is low, as in this case I think backwards compatibility is 
> nice. More often then not do I bisect over large ranges and then it's 
> nice that things like this "just work" ;-)

Ah yes, bisecting indeed would be useful here.


> 
>>
>>> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
>>> ---
>>>  scripts/boards.sh | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/scripts/boards.sh b/scripts/boards.sh
>>> index 0ec2981..2069494 100644
>>> --- a/scripts/boards.sh
>>> +++ b/scripts/boards.sh
>>> @@ -13,7 +13,7 @@ case $info in
>>>          vins="0 1 2 3 4 5 6 7"
>>>          csis="20 40 41"
>>>          ;;
>>> -    "Renesas Salvator-X board based on r8a7796" | \

So perhaps this line should be re-added, or the fields updated for
wildcards some how, or a better form of matching the target.

Things like the H3 could be tricky though where the ES1 and ES2
revisions (I think from what I recall) might have subtle differences.

I guess in that case it's harder to make a catch-all match, but that's
just a per-target thing to consider.

--
Kieran


>>> +    "Renesas Salvator-X board based on r8a77960" | \
>>>          "Renesas Salvator-X 2nd version board based on r8a77965")
>>
>> But I wonder if this script should use more 'wildcard' matching.
>> It does seem awkward to match generically in some cases though, so
>> nothing wrong with keeping things explicit for now.
>>
>> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>
>> But now I've written that I see these patches are already integrated ...
>> never mind.
>> --
>> Kieran
>>
>>
>>>          gen="gen3"
>>>          vins="0 1 2 3 4 5 6 7"
>>>
>>
> 

