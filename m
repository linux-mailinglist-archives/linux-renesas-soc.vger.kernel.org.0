Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46F59B74BA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Sep 2019 10:08:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730958AbfISII0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 19 Sep 2019 04:08:26 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:52238 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725320AbfISII0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Sep 2019 04:08:26 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 80282325;
        Thu, 19 Sep 2019 10:08:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1568880502;
        bh=38ol2YTAkpGhHSgnR8PdDk46glvBAqIWmdxP0glkm6o=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=PrWRX992tvlwttYYUP3tMtAAb7oqiYUOU6JAcXOhTa+MtBERLcUe5Rh0y5nuj9YXc
         XYPbrbxvTBiyCjkmaNwb6/cpJ2kcXXzYa1Fh3YHMz14tc/i6oKoplKf73AX8z8HRj/
         gr7Q5pbNO2EB30cAyGwz76tLFNEnZkZWSjZbxjbc=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v4 6/9] drm: rcar-du: crtc: Enable and disable CMMs
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>, geert@linux-m68k.org,
        horms@verge.net.au, uli+renesas@fpond.eu,
        VenkataRajesh.Kalakodima@in.bosch.com, airlied@linux.ie,
        daniel@ffwll.ch, koji.matsuoka.xm@renesas.com, muroya@ksk.co.jp,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20190906135436.10622-1-jacopo+renesas@jmondi.org>
 <20190906135436.10622-7-jacopo+renesas@jmondi.org>
 <bc443263-5f20-f022-34c8-1e521243dec1@ideasonboard.com>
 <20190912080720.bn7bmu2o3gacrpf4@uno.localdomain>
 <a0f0554d-1bb0-fefa-a5d5-a252f7426c36@ideasonboard.com>
 <20190918232336.GB11474@pendragon.ideasonboard.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <96aded2c-f083-6e3d-c07d-f392f52a01b0@ideasonboard.com>
Date:   Thu, 19 Sep 2019 09:08:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190918232336.GB11474@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent, / Jacopo

On 19/09/2019 00:23, Laurent Pinchart wrote:
> Hello,
> 
> On Thu, Sep 12, 2019 at 10:19:30AM +0100, Kieran Bingham wrote:
>> On 12/09/2019 09:07, Jacopo Mondi wrote:
>>> On Wed, Sep 11, 2019 at 07:40:27PM +0100, Kieran Bingham wrote:
>>>> On 06/09/2019 14:54, Jacopo Mondi wrote:
>>>>> Enable/disable the CMM associated with a CRTC at CRTC start and stop
>>>>> time and enable the CMM unit through the Display Extensional Functions
>>>>> register at group setup time.
>>>>>
>>>>> Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
>>>>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>>>> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>>>>> ---
>>>>>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c  | 7 +++++++
>>>>>  drivers/gpu/drm/rcar-du/rcar_du_group.c | 8 ++++++++
>>>>>  drivers/gpu/drm/rcar-du/rcar_du_regs.h  | 5 +++++
>>>>>  3 files changed, 20 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
>>>>> index 23f1d6cc1719..3dac605c3a67 100644
>>>>> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
>>>>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
>>>>> @@ -21,6 +21,7 @@
>>>>>  #include <drm/drm_plane_helper.h>
>>>>>  #include <drm/drm_vblank.h>
>>>>>
>>>>> +#include "rcar_cmm.h"
>>>>>  #include "rcar_du_crtc.h"
>>>>>  #include "rcar_du_drv.h"
>>>>>  #include "rcar_du_encoder.h"
>>>>> @@ -619,6 +620,9 @@ static void rcar_du_crtc_stop(struct rcar_du_crtc *rcrtc)
>>>>>  	if (rcar_du_has(rcrtc->dev, RCAR_DU_FEATURE_VSP1_SOURCE))
>>>>>  		rcar_du_vsp_disable(rcrtc);
>>>>>
>>>>> +	if (rcrtc->cmm)
>>>>> +		rcar_cmm_disable(rcrtc->cmm);
>>>>> +
>>>>>  	/*
>>>>>  	 * Select switch sync mode. This stops display operation and configures
>>>>>  	 * the HSYNC and VSYNC signals as inputs.
>>>>> @@ -686,6 +690,9 @@ static void rcar_du_crtc_atomic_enable(struct drm_crtc *crtc,
>>>>>  	}
>>>>>
>>>>>  	rcar_du_crtc_start(rcrtc);
>>>>> +
>>>>> +	if (rcrtc->cmm)
>>>>> +		rcar_cmm_enable(rcrtc->cmm);
>>>>>  }
>>>>>
>>>>>  static void rcar_du_crtc_atomic_disable(struct drm_crtc *crtc,
>>>>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.c b/drivers/gpu/drm/rcar-du/rcar_du_group.c
>>>>> index 9eee47969e77..25d0fc125d7a 100644
>>>>> --- a/drivers/gpu/drm/rcar-du/rcar_du_group.c
>>>>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_group.c
>>>>> @@ -147,6 +147,14 @@ static void rcar_du_group_setup(struct rcar_du_group *rgrp)
>>>>>
>>>>>  	rcar_du_group_setup_pins(rgrp);
>>>>>
>>>>> +	if (rcar_du_has(rcdu, RCAR_DU_FEATURE_CMM)) {
>>>>> +		u32 defr7 = DEFR7_CODE
>>>>> +			  | (rgrp->cmms_mask & BIT(1) ? DEFR7_CMME1 : 0)
>>>>> +			  | (rgrp->cmms_mask & BIT(0) ? DEFR7_CMME0 : 0);
>>>>> +
>>>>> +		rcar_du_group_write(rgrp, DEFR7, defr7);
>>>>> +	}
>>>>> +
>>>>
>>>> What's the effect here on platforms with a CMM, but with
>>>> CONFIG_DRM_RCAR_CMM unset?
>>>>
>>>> Will this incorrectly configure the DU ?
>>>>
>>>> Will it stall the display if the DU tries to interact with another
>>>> module which is not enabled?
>>>
>>> I recall I tested that (that's why I had to add stubs for CMM
>>> functions, as I had linkage errors otherwise) and thing seems to be
>>> fine as the CMM configuration/enblement resolve to an empty function.
>>
>> Yes, I see the stubs to allow for linkage, but it's the hardware I'm
>> concerned about. If it passes the tests and doesn't break then that's
>> probably ok ... but I'm really weary that we're enabling a hardware
>> pipeline with a disabled component in the middle.
>>
>>> Would you prefer to have this guarded by an #if IS_ENABLED() ?
>>
>> I don't think we need a compile time conditional, but I'd say it
>> probably needs to be more about whether the CMM has actually probed or not
>>
>> Aha, and I see that in rcar_du_cmm_init() we already do a
>> call to rcar_cmm_init(), which if fails will leave rcdu->cmms[i] as
>> NULL. So that's catered for, which results in the rgrp->cmms_mask being
>> correctly representative of whether there is a CMM connected or not.
> 
> Doesn't this result in probe failure ?

I think I mis-spoke above, I didn't mean "if rcar_cmm_init() fails" I
meant "if rcar_du_cmm_init() determines there are no connected CMM's or
if they are disabled."


If rcar_cmm_init() returns a failure, then yes we will fail to probe.

But I think it's up to rcar_du_cmm_init() to determine if the CMM exists
or not (or is enabled) and if that's not a failure case then it should
not prevent the probing of the DU.


In fact, I've now seen that if CONFIG_DRM_RCAR_CMM is not enabled,
rcar_cmm_init() returns 0, and I think in fact it should return -ENODEV,
with an exception on that return value in rcar_du_cmm_init() so that the
DU continues with no CMM attached there.


> 
>>  ... so I think that means the ...
>>  "if (rcar_du_has(rcdu, RCAR_DU_FEATURE_CMM))" is somewhat redundant:
>>
>>
>> This could be:
>>
>>   if (rgrp->cmms_mask) {
>> 	u32 defr7 = DEFR7_CODE
>> 		  | (rgrp->cmms_mask & BIT(1) ? DEFR7_CMME1 : 0)
>> 		  | (rgrp->cmms_mask & BIT(0) ? DEFR7_CMME0 : 0);
>>
>>   rcar_du_group_write(rgrp, DEFR7, defr7);
>>
>> Or in fact, if we don't mind writing 0 to DEFR7 when there is no CMM
>> (which is safe by the looks of things as DEFR7 is available on all
>> platforms), then we can even remove the outer conditional, and leave
>> this all up to the ternary operators to write the correct value to the
>> defr7.
>>
>> Phew ... net result - your current code *is* safe with the
>> CONFIG_DRM_RCAR_CMM option disabled. I'll leave it up to you if you want
>> to simplify the code here and remove the RCAR_DU_FEATURE_CMM.
>>
>> As this RCAR_DU_FEATURE_CMM flag is only checked here, removing it would
>> however simplify all of the rcar_du_device_info structures.
>>
>> So - with or without the _FEATURE_CMM" simplification, this patch looks
>> functional and safe so:
>>
>>
>> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>
>>>>>  	if (rcdu->info->gen >= 2) {
>>>>>  		rcar_du_group_setup_defr8(rgrp);
>>>>>  		rcar_du_group_setup_didsr(rgrp);
>>>>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_regs.h b/drivers/gpu/drm/rcar-du/rcar_du_regs.h
>>>>> index bc87f080b170..fb9964949368 100644
>>>>> --- a/drivers/gpu/drm/rcar-du/rcar_du_regs.h
>>>>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_regs.h
>>>>> @@ -197,6 +197,11 @@
>>>>>  #define DEFR6_MLOS1		(1 << 2)
>>>>>  #define DEFR6_DEFAULT		(DEFR6_CODE | DEFR6_TCNE1)
>>>>>
>>>>> +#define DEFR7			0x000ec
>>>>> +#define DEFR7_CODE		(0x7779 << 16)
>>>>> +#define DEFR7_CMME1		BIT(6)
>>>>> +#define DEFR7_CMME0		BIT(4)
>>>>> +
>>>>>  /* -----------------------------------------------------------------------------
>>>>>   * R8A7790-only Control Registers
>>>>>   */
> 

