Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6049667760F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Jan 2023 09:08:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230218AbjAWIID (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Jan 2023 03:08:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231625AbjAWIIC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Jan 2023 03:08:02 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E1361B0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Jan 2023 00:07:59 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BEC182B3;
        Mon, 23 Jan 2023 09:07:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674461278;
        bh=e8cwzISEXsDJcOkejZ9N7cge+1w3KKs0OXh7m8XfyLE=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=QDMSxIwahXbXDdJjrmtEQ734x3dpVbp4fvqDybqb6/WWueQCY1Eohvm+koX8mtTmQ
         cNr3WxG4H4mq2t3QfAUrKZ6adLkAKzx6IocEIZof7PDjZle2E+uY0IGXwQtIkUK9sD
         +V0xd1DDXaH3Y8YVFGHXMev5mBvCZKzcFWjH8fS0=
Message-ID: <15c5010b-130e-c1f6-089d-a0850e2b2a3a@ideasonboard.com>
Date:   Mon, 23 Jan 2023 10:07:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 3/7] drm: rcar-du: lvsd: Add reset control
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
References: <20230120085009.604797-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20230120085009.604797-4-tomi.valkeinen+renesas@ideasonboard.com>
 <Y8q+vUks4HzLZA1U@pendragon.ideasonboard.com>
 <Y8rJ32P/T4JFcz4O@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <Y8rJ32P/T4JFcz4O@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 20/01/2023 19:05, Laurent Pinchart wrote:
> On Fri, Jan 20, 2023 at 06:18:07PM +0200, Laurent Pinchart wrote:
>> Hi Tomi,
>>
>> Thank you for the patch.
> 
> Another small comment: in the commit message, s/lvsd/lvds/

Yep.

>> On Fri, Jan 20, 2023 at 10:50:05AM +0200, Tomi Valkeinen wrote:
>>> Reset LVDS using the reset control as CPG reset/release is required in
>>> the hardware manual sequence.
>>>
>>> Based on a BSP patch from Koji Matsuoka <koji.matsuoka.xm@renesas.com>.
>>>
>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>>> ---
>>>   drivers/gpu/drm/rcar-du/Kconfig     |  1 +
>>>   drivers/gpu/drm/rcar-du/rcar_lvds.c | 19 ++++++++++++++++++-
>>>   2 files changed, 19 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
>>> index a8f862c68b4f..151e400b996d 100644
>>> --- a/drivers/gpu/drm/rcar-du/Kconfig
>>> +++ b/drivers/gpu/drm/rcar-du/Kconfig
>>> @@ -43,6 +43,7 @@ config DRM_RCAR_LVDS
>>>   	select DRM_PANEL
>>>   	select OF_FLATTREE
>>>   	select OF_OVERLAY
>>> +	select RESET_CONTROLLER
>>>   
>>>   config DRM_RCAR_USE_MIPI_DSI
>>>   	bool "R-Car DU MIPI DSI Encoder Support"
>>> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
>>> index 8e1be51fbee6..668604616bfd 100644
>>> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
>>> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
>>> @@ -17,6 +17,7 @@
>>>   #include <linux/of_graph.h>
>>>   #include <linux/platform_device.h>
>>>   #include <linux/pm_runtime.h>
>>> +#include <linux/reset.h>
>>>   #include <linux/slab.h>
>>>   #include <linux/sys_soc.h>
>>>   
>>> @@ -61,6 +62,7 @@ struct rcar_lvds_device_info {
>>>   struct rcar_lvds {
>>>   	struct device *dev;
>>>   	const struct rcar_lvds_device_info *info;
>>> +	struct reset_control *rstc;
>>>   
>>>   	struct drm_bridge bridge;
>>>   
>>> @@ -845,6 +847,10 @@ static int rcar_lvds_probe(struct platform_device *pdev)
>>>   	if (ret < 0)
>>>   		return ret;
>>>   
>>> +	lvds->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
>>> +	if (IS_ERR(lvds->rstc))
>>> +		return dev_err_probe(&pdev->dev, PTR_ERR(lvds->rstc),
>>> +				     "failed to get cpg reset\n");
>>
>> Missing blank line.
>>
>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks!

  Tomi

