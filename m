Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1059F2401ED
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Aug 2020 08:17:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725808AbgHJGRE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Aug 2020 02:17:04 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:54130 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725763AbgHJGRE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Aug 2020 02:17:04 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07A6H0AC064299;
        Mon, 10 Aug 2020 01:17:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1597040220;
        bh=6TUyINATxzGCiIUfMktiSACeG4uRRgoJBPsSXgfQJu4=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=YoYIMNWc/pohOj90lO+/eFt4I0kBgKiaVv+xA+WjrOGKz4CFLzNdi5HedGNsB8wX6
         D5JNiaDldBxbNgTemYbNQINIgUiTJTx+JdqFJx2+OetVjYX17zo14BsuoM5QcnyY8i
         br8oKZFio2ixrWCx9F4kUit2JwxxYjrRKtnFYr/c=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07A6H0YC115928
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 10 Aug 2020 01:17:00 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 10
 Aug 2020 01:17:00 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 10 Aug 2020 01:17:00 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07A6Gxl9078952;
        Mon, 10 Aug 2020 01:17:00 -0500
Subject: Re: [PATCH 4/8] dumbfb: Fix pitch for tri-planar formats
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     <linux-renesas-soc@vger.kernel.org>
References: <20200806021807.21863-1-laurent.pinchart@ideasonboard.com>
 <20200806021807.21863-5-laurent.pinchart@ideasonboard.com>
 <8181b48a-ce19-4083-c96e-493d75a1691f@ti.com>
 <20200808221439.GA6186@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <2f9bd1a5-b1bb-5fb7-1255-2e55598e9e59@ti.com>
Date:   Mon, 10 Aug 2020 09:16:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200808221439.GA6186@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 09/08/2020 01:14, Laurent Pinchart wrote:
> Hi Tomi,
> 
> On Thu, Aug 06, 2020 at 12:21:39PM +0300, Tomi Valkeinen wrote:
>> On 06/08/2020 05:18, Laurent Pinchart wrote:
>>> The BO pitches are unconditionally set to the frame buffer pitch, for
>>> all planes. This is correct for semiplanar YUV formats, as they
>>> subsample chroma horizontally by two but combined U and V in a single
>>> plane, cancelling each other. For fully planar YUV formats, however, the
>>> horizontal subsampling need to be taken into account to compute the
>>> pitch. Fix it.
>>>
>>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>> ---
>>>  kms++/src/dumbframebuffer.cpp | 8 ++++++++
>>>  1 file changed, 8 insertions(+)
>>>
>>> diff --git a/kms++/src/dumbframebuffer.cpp b/kms++/src/dumbframebuffer.cpp
>>> index 18f3f152943d..4c3c03164a90 100644
>>> --- a/kms++/src/dumbframebuffer.cpp
>>> +++ b/kms++/src/dumbframebuffer.cpp
>>> @@ -42,6 +42,14 @@ DumbFramebuffer::DumbFramebuffer(Card& card, uint32_t width, uint32_t height, Pi
>>>  		struct drm_mode_create_dumb creq = drm_mode_create_dumb();
>>>  		creq.width = width;
>>>  		creq.height = height / pi.ysub;
>>> +		/*
>>> +		 * For fully planar YUV buffers, the chroma planes don't combine
>>> +		 * U and V components, their width must thus be divided by the
>>> +		 * horizontal subsampling factor.
>>> +		 */
>>> +		if (format_info.type == PixelColorType::YUV &&
>>> +		    format_info.num_planes == 3)
>>> +			creq.width /= pi.xsub;
>>
>> This feels a bit of a hack... I think we should somehow have the
>> relevant information in the PixelFormatInfo. Having the same plane
>> info, { 8, 2, 2 }, for both NV12 UV plane and YUV420 U and V planes
>> doesn't sound correct.
>>
>> Should NV12's UV plane be { 16, 2, 2 }? Subsampled formats are
>> confusing... =)
> 
> I'll give it a try. I however wonder if all drivers will expect 16bpp.
> The ones based on drm_gem_cma_dumb_create() will be fine, but other
> drivers may not expect this.

Oh, right, that number is passed to DRM_IOCTL_MODE_CREATE_DUMB. I was only thinking about how kms++
handles these internally.

To be honest, I don't even quite know how subsampled formats are supposed to be handled in DRM.
Above we pass width as it is, but divide height by ysub. And then we tune the bpp adjust to the fact
that we didn't divide the width.

For e.g. YUYV, the bpp tells the container size. But for NV12's second plane, bpp is not the
container size.

Well, I think at least omapdrm doesn't care, it just allocates the number of bytes according to
w*h*bpp. But maybe it would be good to have a clear rule how to represent these in kms++, and then
if DRM wants the values in some other way, adjust the values according to the format.

Or maybe we already have all the numbers according to a clear rule, I'm just not sure what the rule
is =).

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
