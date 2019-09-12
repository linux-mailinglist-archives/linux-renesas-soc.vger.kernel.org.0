Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 179BDB0B5C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Sep 2019 11:28:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730434AbfILJ2B (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Sep 2019 05:28:01 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:53486 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730218AbfILJ2B (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Sep 2019 05:28:01 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7B47C33A;
        Thu, 12 Sep 2019 11:27:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1568280478;
        bh=FgX5shnvhvvsoMnj0Tz1lstVsVd+UPt97RfcttdFqtY=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=p6WRaHvpSsjpXIhZlIoRBGSPkosld2cPqGztYfu2fELLFxrwckNYbscqpv80weVS+
         qiA3DVAMgHz3CEFRH3tb7HuFChutStKWCsSo0av+uigAM8h7O/eGWKUPMrOVpRHa9K
         NaorDvf/+TAz39TX71OPrKtEPz2Mjggvjgju9tJQ=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v4 5/9] drm: rcar-du: kms: Initialize CMM instances
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart@ideasonboard.com, geert@linux-m68k.org,
        horms@verge.net.au, uli+renesas@fpond.eu,
        VenkataRajesh.Kalakodima@in.bosch.com
Cc:     airlied@linux.ie, daniel@ffwll.ch, koji.matsuoka.xm@renesas.com,
        muroya@ksk.co.jp, Harsha.ManjulaMallikarjun@in.bosch.com,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20190906135436.10622-1-jacopo+renesas@jmondi.org>
 <20190906135436.10622-6-jacopo+renesas@jmondi.org>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <331b5f7c-49fe-1578-8698-0e69c456e995@ideasonboard.com>
Date:   Thu, 12 Sep 2019 10:27:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190906135436.10622-6-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

On 06/09/2019 14:54, Jacopo Mondi wrote:
> Implement device tree parsing to collect the available CMM instances
> described by the 'renesas,cmms' property. Associate CMMs with CRTCs and
> store a mask of active CMMs in the DU group for later enablement.
> 
> Enforce the probe and suspend/resume ordering of DU and CMM by creating
> a stateless device link between the two.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c  |  6 +++
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.h  |  2 +
>  drivers/gpu/drm/rcar-du/rcar_du_drv.h   |  2 +
>  drivers/gpu/drm/rcar-du/rcar_du_group.h |  2 +
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c   | 68 +++++++++++++++++++++++++
>  5 files changed, 80 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> index 2da46e3dc4ae..23f1d6cc1719 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> @@ -1194,6 +1194,12 @@ int rcar_du_crtc_create(struct rcar_du_group *rgrp, unsigned int swindex,
>  	if (ret < 0)
>  		return ret;
>  
> +	/* CMM might be disabled for this CRTC. */
> +	if (rcdu->cmms[swindex]) {
> +		rcrtc->cmm = rcdu->cmms[swindex];
> +		rgrp->cmms_mask |= BIT(hwindex % 2);
> +	}
> +

Good - this checks out :-D


>  	drm_crtc_helper_add(crtc, &crtc_helper_funcs);
>  
>  	/* Start with vertical blanking interrupt reporting disabled. */
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
> index 3b7fc668996f..5f2940c42225 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
> @@ -39,6 +39,7 @@ struct rcar_du_vsp;
>   * @vblank_wait: wait queue used to signal vertical blanking
>   * @vblank_count: number of vertical blanking interrupts to wait for
>   * @group: CRTC group this CRTC belongs to
> + * @cmm: CMM associated with this CRTC
>   * @vsp: VSP feeding video to this CRTC
>   * @vsp_pipe: index of the VSP pipeline feeding video to this CRTC
>   * @writeback: the writeback connector
> @@ -64,6 +65,7 @@ struct rcar_du_crtc {
>  	unsigned int vblank_count;
>  
>  	struct rcar_du_group *group;
> +	struct platform_device *cmm;
>  	struct rcar_du_vsp *vsp;
>  	unsigned int vsp_pipe;
>  
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> index a00dccc447aa..6316a1c5236c 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> @@ -13,6 +13,7 @@
>  #include <linux/kernel.h>
>  #include <linux/wait.h>
>  
> +#include "rcar_cmm.h"
>  #include "rcar_du_crtc.h"
>  #include "rcar_du_group.h"
>  #include "rcar_du_vsp.h"
> @@ -86,6 +87,7 @@ struct rcar_du_device {
>  	struct rcar_du_encoder *encoders[RCAR_DU_OUTPUT_MAX];
>  
>  	struct rcar_du_group groups[RCAR_DU_MAX_GROUPS];
> +	struct platform_device *cmms[RCAR_DU_MAX_CRTCS];
>  	struct rcar_du_vsp vsps[RCAR_DU_MAX_VSPS];
>  
>  	struct {
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.h b/drivers/gpu/drm/rcar-du/rcar_du_group.h
> index 87950c1f6a52..e9906609c635 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_group.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_group.h
> @@ -22,6 +22,7 @@ struct rcar_du_device;
>   * @mmio_offset: registers offset in the device memory map
>   * @index: group index
>   * @channels_mask: bitmask of populated DU channels in this group
> + * @cmms_mask: bitmask of available CMMs in this group
>   * @num_crtcs: number of CRTCs in this group (1 or 2)
>   * @use_count: number of users of the group (rcar_du_group_(get|put))
>   * @used_crtcs: number of CRTCs currently in use
> @@ -37,6 +38,7 @@ struct rcar_du_group {
>  	unsigned int index;
>  
>  	unsigned int channels_mask;
> +	unsigned int cmms_mask;
>  	unsigned int num_crtcs;
>  	unsigned int use_count;
>  	unsigned int used_crtcs;
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> index 2dc9caee8767..294630e56992 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> @@ -17,7 +17,9 @@
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_vblank.h>
>  
> +#include <linux/device.h>
>  #include <linux/of_graph.h>
> +#include <linux/of_platform.h>
>  #include <linux/wait.h>
>  
>  #include "rcar_du_crtc.h"
> @@ -614,6 +616,67 @@ static int rcar_du_vsps_init(struct rcar_du_device *rcdu)
>  	return ret;
>  }
>  
> +static int rcar_du_cmm_init(struct rcar_du_device *rcdu)
> +{
> +	const struct device_node *np = rcdu->dev->of_node;
> +	unsigned int i;
> +	int cells;
> +
> +	cells = of_property_count_u32_elems(np, "renesas,cmms");
> +	if (cells == -EINVAL)
> +		return 0;
> +
> +	if (cells > rcdu->num_crtcs) {
> +		dev_err(rcdu->dev,
> +			"Invalid number of entries in 'renesas,cmms'\n");
> +		return -EINVAL;
> +	}
> +
> +	for (i = 0; i < cells; ++i) {
> +		struct platform_device *pdev;
> +		struct device_link *link;
> +		struct device_node *cmm;
> +		int ret;
> +
> +		cmm = of_parse_phandle(np, "renesas,cmms", i);
> +		if (IS_ERR(cmm)) {
> +			dev_err(rcdu->dev,
> +				"Failed to parse 'renesas,cmms' property\n");
> +			return PTR_ERR(cmm);

Should we have a -ENOENT exception here somewhere?

Otherwise I think platforms without a CMM will fail, and new kernels
with old DTBs would also fail ?

(based on my interpretation in __of_parse_phandle_with_args() that not
finding a requested phandle returns -ENOENT).


Scratch that - I've just seen above with the
  cells = of_property_count_u32_elems(np, "renesas,cmms");

which will return 0 if this device doesn't have a CMM.

So - this all looks good to me.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>




> +		}
> +
> +		if (!of_device_is_available(cmm)) {
> +			/* It's fine to have a phandle to a non-enabled CMM. */
> +			of_node_put(cmm);
> +			continue;
> +		}
> +
> +		pdev = of_find_device_by_node(cmm);
> +		if (IS_ERR(pdev)) {
> +			dev_err(rcdu->dev, "No device found for CMM%u\n", i);
> +			of_node_put(cmm);
> +			return PTR_ERR(pdev);
> +		}
> +
> +		of_node_put(cmm);
> +
> +		ret = rcar_cmm_init(pdev);
> +		if (ret)
> +			return ret;
> +
> +		link = device_link_add(rcdu->dev, &pdev->dev, DL_FLAG_STATELESS);
> +		if (!link) {
> +			dev_err(rcdu->dev,
> +				"Failed to create device link to CMM%u\n", i);
> +			return -EINVAL;
> +		}
> +
> +		rcdu->cmms[i] = pdev;
> +	}
> +
> +	return 0;
> +}
> +
>  int rcar_du_modeset_init(struct rcar_du_device *rcdu)
>  {
>  	static const unsigned int mmio_offsets[] = {
> @@ -704,6 +767,11 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
>  			return ret;
>  	}
>  
> +	/* Initialize the Color Management Modules. */
> +	ret = rcar_du_cmm_init(rcdu);
> +	if (ret)
> +		return ret;> +
>  	/* Create the CRTCs. */
>  	for (swindex = 0, hwindex = 0; swindex < rcdu->num_crtcs; ++hwindex) {
>  		struct rcar_du_group *rgrp;
> 

