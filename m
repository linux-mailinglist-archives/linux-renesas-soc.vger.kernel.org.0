Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45598116D3C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Dec 2019 13:41:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727200AbfLIMlO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Dec 2019 07:41:14 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:60308 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727427AbfLIMlO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Dec 2019 07:41:14 -0500
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AC9A999A;
        Mon,  9 Dec 2019 13:41:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1575895272;
        bh=SAO/vEIF0AkAocfwMFfJweTH8L4Mt/spRBvCuhoZkcw=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=fC8xVlvLbCZxuee1qs5HEhUvtOZqwMZClk9VfGR9d9fnEQc8c0dj99DbJ/ldauPFz
         mSmxLr8APOk9hIamWgqTbF0WRGodNuPmKGtRpYHKHe1BzkLQKhxsbEHPCMNXsQhaeF
         k320u2eXvnAWkMOzrLIqW9kly1S8TnzgheelBVgo=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH] drm: rcar-du: Add r8a77980 support
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Simon Horman <horms@verge.net.au>
Cc:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-renesas-soc@vger.kernel.org, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20190911192502.16609-1-kieran.bingham+renesas@ideasonboard.com>
 <70b94265-69f3-d18f-1b67-b5b814723b1b@cogentembedded.com>
 <20190913082129.lvusbp6pbcayqh5r@verge.net.au>
 <20190913090359.GC29992@pendragon.ideasonboard.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <2eeacacc-f190-4ba8-32bc-b4103b41db46@ideasonboard.com>
Date:   Mon, 9 Dec 2019 12:41:07 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190913090359.GC29992@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On 13/09/2019 10:03, Laurent Pinchart wrote:
> Hello,
> 
> On Fri, Sep 13, 2019 at 10:21:29AM +0200, Simon Horman wrote:
>> On Thu, Sep 12, 2019 at 01:00:41PM +0300, Sergei Shtylyov wrote:
>>> On 11.09.2019 22:25, Kieran Bingham wrote:
>>>
>>>> Add direct support for the r8a77980 (V3H).
>>>>
>>>> The V3H shares a common, compatible configuration with the r8a77970
>>>> (V3M) so that device info structure is reused.
>>>
>>>    Do we really need to add yet another compatible in this case?
>>> I just added r8a77970 to the compatible prop in the r8a77980 DT. That's why
>>> a patch like this one didn't get posted by me.
>>
>> The reason for having per-SoC compat strings is that the IP blocks
>> are not versioned and while we can observe that there are similarities
>> between, f.e. the DU on the r8a77970 and r8a77980, we can't be certain that
>> differences may not emerge at some point. By having per-SoC compat strings
>> we have the flexibility for the driver to address any such differences as
>> the need arises.
>>
>> My recollection is that this scheme has been adopted for non-versioned
>> Renesas IP blocks since June 2015 and uses of this scheme well before that.
> 
> Sure, but we could use
> 
> 	compatible = "renesas,du-r8a77980", "renesas,du-r8a77970";
> 
> in DT without updating the driver. If the r8a77980 turns out to be
> different, we'll then update the driver without a need to modify DT. I'm
> fine either way, so
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>


Thanks,

This patch has an RB tag from you, and Simon, but alas I don't believe
it has been picked up in your drm/du/next branch.

Is this patch acceptable? Or do I need to repost?

--
Kieran


> 
>>>> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>
>> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> 

