Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C177651CBB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Dec 2022 10:01:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233166AbiLTJBL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 20 Dec 2022 04:01:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233159AbiLTJBK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Dec 2022 04:01:10 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0352EAA;
        Tue, 20 Dec 2022 01:01:08 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 523A2612C5;
        Tue, 20 Dec 2022 09:01:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2606AC433D2;
        Tue, 20 Dec 2022 09:01:05 +0000 (UTC)
Message-ID: <2f252958-1bb1-006a-b450-1315be8a3c9f@xs4all.nl>
Date:   Tue, 20 Dec 2022 10:01:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 7/7] drm: rcar-du: Add new formats (2-10-10-10 ARGB,
 Y210)
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Sakari Ailus <sakari.ailus@iki.fi>
References: <20221219140139.294245-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20221219140139.294245-8-tomi.valkeinen+renesas@ideasonboard.com>
 <Y6Db2C+JehUPYSQp@pendragon.ideasonboard.com>
Content-Language: en-US
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <Y6Db2C+JehUPYSQp@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 19/12/2022 22:47, Laurent Pinchart wrote:
> Hi Tomi,
> 
> (CC'ing Sakari and Hans)
> 
> Thank you for the patch.
> 
> On Mon, Dec 19, 2022 at 04:01:39PM +0200, Tomi Valkeinen wrote:
>> Add new pixel formats: RGBX1010102, RGBA1010102, ARGB2101010 and Y210.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>> ---
>>  drivers/gpu/drm/rcar-du/rcar_du_kms.c | 24 +++++++++++++
>>  drivers/gpu/drm/rcar-du/rcar_du_vsp.c | 49 +++++++++++++++++++++++++--
>>  2 files changed, 71 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
>> index 8c2719efda2a..8ccabf5a30c4 100644
>> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
>> @@ -259,6 +259,24 @@ static const struct rcar_du_format_info rcar_du_format_infos[] = {
>>  		.bpp = 32,
>>  		.planes = 1,
>>  		.hsub = 1,
>> +	}, {
>> +		.fourcc = DRM_FORMAT_RGBX1010102,
> 
> Ah, here the format makes sense.
> 
>> +		.v4l2 = V4L2_PIX_FMT_XBGR2101010,
> 
> But this is horrible :-( Could we use the same names as DRM for new
> formats, when there is no conflict with existing V4L2 formats ?
> 
> Sakari, Hans, what do you think ? Please see patch 1/7 in the series for
> the format definitions.

V4L2 describes pixel formats based on how they appear in memory from the
lowest to highest memory address.

If I am not mistaken, DRM uses the CPU order. So that explains the difference
in naming. I don't think we should hide that difference. And V4L2 has been
quite consistent in following memory ordering in the naming (except possibly
for some of the really old pixelformats).

Departing from that would be more of a hindrance than a help, IMHO.

Regards,

	Hans

> 
>> +		.bpp = 32,
>> +		.planes = 1,
>> +		.hsub = 1,
>> +	}, {
>> +		.fourcc = DRM_FORMAT_RGBA1010102,
>> +		.v4l2 = V4L2_PIX_FMT_ABGR2101010,
>> +		.bpp = 32,
>> +		.planes = 1,
>> +		.hsub = 1,
>> +	}, {
>> +		.fourcc = DRM_FORMAT_ARGB2101010,
>> +		.v4l2 = V4L2_PIX_FMT_BGRA1010102,
>> +		.bpp = 32,
>> +		.planes = 1,
>> +		.hsub = 1,
>>  	}, {
>>  		.fourcc = DRM_FORMAT_YVYU,
>>  		.v4l2 = V4L2_PIX_FMT_YVYU,
>> @@ -307,6 +325,12 @@ static const struct rcar_du_format_info rcar_du_format_infos[] = {
>>  		.bpp = 24,
>>  		.planes = 3,
>>  		.hsub = 1,
>> +	}, {
>> +		.fourcc = DRM_FORMAT_Y210,
>> +		.v4l2 = V4L2_PIX_FMT_Y210,
>> +		.bpp = 32,
>> +		.planes = 1,
>> +		.hsub = 2,
>>  	},
> 
> Any reason why you'd not adding Y212 support already ?
> 
>>  };
>>  
>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
>> index e465aef41585..6f3e109a4f80 100644
>> --- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
>> @@ -139,6 +139,42 @@ static const u32 rcar_du_vsp_formats[] = {
>>  	DRM_FORMAT_YVU444,
>>  };
>>  
>> +/*
>> + * Gen4 supports the same formats as above, and additionally 2-10-10-10 RGB
>> + * formats and Y210 format.
>> + */
>> +static const u32 rcar_du_vsp_formats_gen4[] = {
>> +	DRM_FORMAT_RGB332,
>> +	DRM_FORMAT_ARGB4444,
>> +	DRM_FORMAT_XRGB4444,
>> +	DRM_FORMAT_ARGB1555,
>> +	DRM_FORMAT_XRGB1555,
>> +	DRM_FORMAT_RGB565,
>> +	DRM_FORMAT_BGR888,
>> +	DRM_FORMAT_RGB888,
>> +	DRM_FORMAT_BGRA8888,
>> +	DRM_FORMAT_BGRX8888,
>> +	DRM_FORMAT_ARGB8888,
>> +	DRM_FORMAT_XRGB8888,
>> +	DRM_FORMAT_RGBX1010102,
>> +	DRM_FORMAT_RGBA1010102,
>> +	DRM_FORMAT_ARGB2101010,
>> +	DRM_FORMAT_UYVY,
>> +	DRM_FORMAT_YUYV,
>> +	DRM_FORMAT_YVYU,
>> +	DRM_FORMAT_NV12,
>> +	DRM_FORMAT_NV21,
>> +	DRM_FORMAT_NV16,
>> +	DRM_FORMAT_NV61,
>> +	DRM_FORMAT_YUV420,
>> +	DRM_FORMAT_YVU420,
>> +	DRM_FORMAT_YUV422,
>> +	DRM_FORMAT_YVU422,
>> +	DRM_FORMAT_YUV444,
>> +	DRM_FORMAT_YVU444,
>> +	DRM_FORMAT_Y210,
>> +};
>> +
>>  static void rcar_du_vsp_plane_setup(struct rcar_du_vsp_plane *plane)
>>  {
>>  	struct rcar_du_vsp_plane_state *state =
>> @@ -436,14 +472,23 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
>>  					 ? DRM_PLANE_TYPE_PRIMARY
>>  					 : DRM_PLANE_TYPE_OVERLAY;
>>  		struct rcar_du_vsp_plane *plane = &vsp->planes[i];
>> +		unsigned int num_formats;
>> +		const u32 *formats;
>> +
>> +		if (rcdu->info->gen < 4) {
>> +			num_formats = ARRAY_SIZE(rcar_du_vsp_formats);
>> +			formats = rcar_du_vsp_formats;
>> +		} else {
>> +			num_formats = ARRAY_SIZE(rcar_du_vsp_formats_gen4);
>> +			formats = rcar_du_vsp_formats_gen4;
>> +		}
>>  
>>  		plane->vsp = vsp;
>>  		plane->index = i;
>>  
>>  		ret = drm_universal_plane_init(&rcdu->ddev, &plane->plane,
>>  					       crtcs, &rcar_du_vsp_plane_funcs,
>> -					       rcar_du_vsp_formats,
>> -					       ARRAY_SIZE(rcar_du_vsp_formats),
>> +					       formats, num_formats,
>>  					       NULL, type, NULL);
>>  		if (ret < 0)
>>  			return ret;
> 

