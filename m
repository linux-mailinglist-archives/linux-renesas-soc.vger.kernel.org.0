Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 535EE34528C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Mar 2021 23:49:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230095AbhCVWtN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Mar 2021 18:49:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230151AbhCVWtI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Mar 2021 18:49:08 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79AF0C061574
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Mar 2021 15:49:08 -0700 (PDT)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A1271ED;
        Mon, 22 Mar 2021 23:49:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1616453344;
        bh=4RFJOVI/JUU0XaP7lRukOMPD5nO87FHU785YnsubArA=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=dmyTDmO3GXSf38hrBxOaNqIc04l8wmUCOsCLJsbtCfzGfIeVl5dCNBdnMUDjCkyTl
         ncMl6Ru8lnwLWxnXF9XivVeFO/PPdgBZbFgouCEiwrMOeCSnIHdmx0CuOVIBrnGBWo
         S778kZdU9+8fqOrcIyxCAkMO1T2LaVIs3cdRCq5c=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v2] media: vsp1: Add support for the V3U VSPD
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org
References: <20210322173949.1156393-1-kieran.bingham+renesas@ideasonboard.com>
 <YFjrR4Cs0UhlPirb@pendragon.ideasonboard.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <ff85fdc9-e2ee-cb00-6deb-b93bc41efe8c@ideasonboard.com>
Date:   Mon, 22 Mar 2021 22:49:01 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YFjrR4Cs0UhlPirb@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On 22/03/2021 19:08, Laurent Pinchart wrote:
> Hi Kieran,
> 
> Thank you for the patch.
> 
> On Mon, Mar 22, 2021 at 05:39:49PM +0000, Kieran Bingham wrote:
>> The V3U provides two VSPD instances, with a new update to the version
>> register to detect the new SoC.
>>
>> Add the new version and model detection, and detail the features
>> available in this module.
>>
>> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>> ---
>> This patch adds in the VSPd on the V3U, and successfully probes and can
>> read and write to registers.
>>
>> However, as yet I have not been able to successfully validate the VSPD
>> using the UAPI interface (by forcing .uapi = true)
> 
> Stupid question: while I have set .uapi to true to test VSPD instances
> in Gen3 SoCs, this isn't something we routinely do, so maybe you should
> first check on a Gen3 board if this hack still works ?

I did that already ;-)

Works on the H3 Salvator-XS.


>> The observed symptoms show that the hardware halts at the first display
>> list queued to the device.
>>
>> Notably, however the display list has been processed, and the registers
>> set by the display list are updated accordingly and can be read back,
>> inferring that the display list was processed and the frame commenced.
>>
>> Alas the frame never completes, and no interrupts are generated.
>>
>> Investigating this, I have seen that the CPG MSSR configures the FCPVD
>> and VSPD on the R8A779A0_CLK_S3D1 clock, which appears to be a 266666656
>> clock. This seems low, and I would expect the VSP to share the same
>> clocking as the VIN/VSPX, which is on R8A779A0_CLK_S1D1.
>>
>> However, changing those clocks has no effect on the operation of the
>> VSPD.
>>
>>  drivers/media/platform/vsp1/vsp1_drv.c  | 10 ++++++++++
>>  drivers/media/platform/vsp1/vsp1_regs.h |  3 +++
>>  2 files changed, 13 insertions(+)
>>
>> diff --git a/drivers/media/platform/vsp1/vsp1_drv.c b/drivers/media/platform/vsp1/vsp1_drv.c
>> index aa66e4f5f3f3..0a9812206b3f 100644
>> --- a/drivers/media/platform/vsp1/vsp1_drv.c
>> +++ b/drivers/media/platform/vsp1/vsp1_drv.c
>> @@ -785,6 +785,16 @@ static const struct vsp1_device_info vsp1_device_infos[] = {
>>  		.uif_count = 2,
>>  		.wpf_count = 2,
>>  		.num_bru_inputs = 5,
>> +	}, {
>> +		.version = VI6_IP_VERSION_MODEL_VSPD_V3U,
>> +		.model = "VSP2-D",
>> +		.gen = 3,
>> +		.features = VSP1_HAS_BRU | VSP1_HAS_CLU | VSP1_HAS_EXT_DL,
> 
> Unless I'm mistaken, the V3U VSPD has no CLU. It has a CLUT in RPF2, but
> that's a different feature.
> 
> The BSP code also sets VSP1_HAS_WPF_VFLIP here, but according to the
> documentation, that's not correct, so I'd skip it for now.

Yes, I saw the incorrect VFLIP in the BSP, but I had not realised CLU !=
CLUT ;-)

I thought that was shorthand for it... Ooops. I'll update.



> 
> With this,
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
>> +		.lif_count = 1,
>> +		.rpf_count = 5,
>> +		.uif_count = 2,
>> +		.wpf_count = 1,
>> +		.num_bru_inputs = 5,
>>  	},
>>  };
>>  
>> diff --git a/drivers/media/platform/vsp1/vsp1_regs.h b/drivers/media/platform/vsp1/vsp1_regs.h
>> index fe3130db1fa2..b378ea4451ce 100644
>> --- a/drivers/media/platform/vsp1/vsp1_regs.h
>> +++ b/drivers/media/platform/vsp1/vsp1_regs.h
>> @@ -766,6 +766,8 @@
>>  #define VI6_IP_VERSION_MODEL_VSPD_V3	(0x18 << 8)
>>  #define VI6_IP_VERSION_MODEL_VSPDL_GEN3	(0x19 << 8)
>>  #define VI6_IP_VERSION_MODEL_VSPBS_GEN3	(0x1a << 8)
>> +#define VI6_IP_VERSION_MODEL_VSPD_V3U	(0x1c << 8)
>> +
>>  #define VI6_IP_VERSION_SOC_MASK		(0xff << 0)
>>  #define VI6_IP_VERSION_SOC_H2		(0x01 << 0)
>>  #define VI6_IP_VERSION_SOC_V2H		(0x01 << 0)
>> @@ -777,6 +779,7 @@
>>  #define VI6_IP_VERSION_SOC_D3		(0x04 << 0)
>>  #define VI6_IP_VERSION_SOC_M3N		(0x04 << 0)
>>  #define VI6_IP_VERSION_SOC_E3		(0x04 << 0)
>> +#define VI6_IP_VERSION_SOC_V3U		(0x05 << 0)
>>  
>>  /* -----------------------------------------------------------------------------
>>   * RPF CLUT Registers
> 

