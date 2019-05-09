Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25267187AD
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 May 2019 11:25:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726179AbfEIJZX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 May 2019 05:25:23 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:35572 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725821AbfEIJZX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 May 2019 05:25:23 -0400
Received: by mail-pf1-f196.google.com with SMTP id t87so1016501pfa.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 May 2019 02:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=igel-co-jp.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=d//KnyID3EwoRVcibbLbccsXdV0JWIN4S+Umvt4+G9A=;
        b=YVPvmE5WSavpmaOZSn3mvs0UUeqFYzB0l2q7X95zzmPHROYz23Xu69kyYwEYPO7VIx
         lYWqV7AbKY0Ur5WaiuqG7bQ0EtXPG70pwtVUkVk5TcdDixy/biFPo86psAXtqcT4QqpQ
         5DLBR7pHbLMZdgBQQRtvfbXzJ1BqeMl433jkrokvNGl7XrH2DuYR3zwEfn3VjXXtjxwN
         29+1A+VcG3NwbNy13G6fJ4OtbZMJubYRbOBd5yQxyo4GM7HlfKzeXb0+V/d9CguwQPdn
         gmbG4JOY/cJPNkeK/+2rXJEZFnMyvtPDc94GogSAHXqajpvfaRGHEw5aywAVM8tg5SUK
         bbwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=d//KnyID3EwoRVcibbLbccsXdV0JWIN4S+Umvt4+G9A=;
        b=hjau/Ym15AARlms8oxsxMk3km8OoGANkCErsyb+/lfCDj92/RIDFtRGP5U6Nb+BhS+
         XmsW+V5XRDvWaLFXxNsUZrmZYn6BcMMWFvADCdGbwdPbFjqM+/DoRx6GRq7oI3Kg1Uwu
         pemNV6dc+hP2M19f+jCQqLO+cVF2jdAQl+q1b/RJPwRN4ZjSuYuSkHSe56JMt42gs26X
         EH4c0ZWtd4yA/wL73QU4Usx7DWsGl4G5eO/hrcRegpfZh+diA65Bgj4YoK5rD499ojXc
         oOq8OuQPjuVSjzMDRNhsCmdmws2WJXT8VYUCs7iOTbolOEizGKz77AL18AsiacuuUfyM
         kjiA==
X-Gm-Message-State: APjAAAU/tqUqfmrFNF9WDYFzNzETE3FKmxHPpS6KpyDl62M25SBzn5bq
        CRp+4iXjcvgZJ520Mini3v2PsII0YRk=
X-Google-Smtp-Source: APXvYqypStVcK59lpLH+z0KnUBGinIPCyA1CDcHqxqac/WLsCIFpg2CT30cQ5Edx/fdMvMYUERHYAA==
X-Received: by 2002:a63:cf01:: with SMTP id j1mr3769527pgg.97.1557393922071;
        Thu, 09 May 2019 02:25:22 -0700 (PDT)
Received: from [10.16.129.49] (napt.igel.co.jp. [219.106.231.132])
        by smtp.gmail.com with ESMTPSA id a6sm4479163pgd.67.2019.05.09.02.25.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 May 2019 02:25:21 -0700 (PDT)
Subject: Re: [PATCH] drm: rcar-du: add modifiers support
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org
References: <20190509054518.10781-1-etom@igel.co.jp>
 <20190509071429.GA4773@pendragon.ideasonboard.com>
From:   Esaki Tomohito <etom@igel.co.jp>
Openpgp: preference=signencrypt
Autocrypt: addr=etom@igel.co.jp; prefer-encrypt=mutual; keydata=
 mQENBE2egxoBCADFOCDMNmjOeu61nHemxUBgA17/tWPH28AqcA+uxby9dAcA8q0+7zWjfTPn
 Q89kF05szFTcUtv+6CDIzzbqTVApJnXlbY9rlT5ECMrYGwELQBuVMvkq18RqQ/lKLZJ4RVMz
 rsE8kuBfDoRqKIwXv13iavXIt9HqeHiqhDivKLMPLBZbyjjFpvsTdN15H2qIvba2K4FP00o/
 7HOc0/0pUohp3yGHptZ6kI5iZPQ61+ANavhrNC1/lJMZzAupDG19Ft0abRCwF3HP/sernC1z
 U6xoUSnZgpHXm9uLnZLgc8VI5rbzKGOUK+FIAWIPxV3Cv9W1xSUlwGGbk8nqfkslXFFBABEB
 AAG0IEVzYWtpIFRvbW9oaXRvIDxldG9tQGlnZWwuY28uanA+iQE+BBMBAgAoBQJNnoMaAhsj
 BQkJZgGABgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRB6VPTiXWc4oUldCACeEakXrpeA
 o8ncbW6e4V5AA0as+QBYLupQIbp1GpiKT8ChgoIPI+Ik88m5f6x4LEPoNe3JebF/g8pha/Og
 gjVCXTKd1N7cPOKP4zYiJ7SpipcOTHS/z+c0IPfUwi8H3p6j1Ybrmlu3Xj1AIMFrutrMSOHG
 c3mIguY8F4fJZR5fDkiJ7cBZ3HoBb6d3URud3ofhYwsy7ZnWNv2tfLBB/OPFslRVbR3Cgfqr
 1SZeF4MsshPfMhHY94TOdJ9ZetJs53yQheqwMO6VX3tFHL6g1RsZRuBmTD5tzLX26u2SRrh+
 XJcdfAorP2f4q84Whcjn//3QSuKptp/COM2HQCGBycFt
Message-ID: <20217791-f912-0864-48a9-dfacadfb3650@igel.co.jp>
Date:   Thu, 9 May 2019 18:25:19 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190509071429.GA4773@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent-san

> What's the purpose of this, as it adds no new functionality to the
> driver ? Why is this change needed ?

Weston compositor (v5.0.0 or later) uses the DRM API to get the
supported modifiers and determines if the sprite plane can be used by
comparing the modifiers with the client specified modifier.
In currently driver, since the weston doesn't know supported modifiers,
that cannot determine if the received dmabuf can be passed through to
sprite plane.
Since there are R-Car GPU which support linear modifier, the sprite
plane cannot be used in a compositor similar to the weston if client
specify linear modifier.

Thanks.


On 2019/05/09 16:14, Laurent Pinchart wrote:
> Hi Tomohito-san,
> 
> On Thu, May 09, 2019 at 02:45:18PM +0900, Tomohito Esaki wrote:
>> Add support for the linear modifier. Since the rcar-du device supports
>> only linear modifier, this driver doesn't support other modifiers.
> 
> What's the purpose of this, as it adds no new functionality to the
> driver ? Why is this change needed ?
> 
>> Signed-off-by: Tomohito Esaki <etom@igel.co.jp>
>> ---
>>  drivers/gpu/drm/rcar-du/rcar_du_kms.c   | 11 +++++++++++
>>  drivers/gpu/drm/rcar-du/rcar_du_plane.c | 15 ++++++++++++++-
>>  drivers/gpu/drm/rcar-du/rcar_du_vsp.c   | 15 ++++++++++++++-
>>  3 files changed, 39 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
>> index 3b7d50a8fb9b..9c5e15a5ab1c 100644
>> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
>> @@ -214,6 +214,16 @@ rcar_du_fb_create(struct drm_device *dev, struct drm_file *file_priv,
>>  		return ERR_PTR(-EINVAL);
>>  	}
>>  
>> +	/*
>> +	 * Support only LINEAR modifier.
>> +	 */
>> +	if ((mode_cmd->flags & DRM_MODE_FB_MODIFIERS) &&
>> +	    mode_cmd->modifier[0] != DRM_FORMAT_MOD_LINEAR) {
>> +		dev_dbg(dev->dev, "unsupported fb modifier 0x%llx\n",
>> +			mode_cmd->modifier[0]);
>> +		return ERR_PTR(-EINVAL);
>> +	}
>> +
>>  	if (rcdu->info->gen < 3) {
>>  		/*
>>  		 * On Gen2 the DU limits the pitch to 4095 pixels and requires
>> @@ -529,6 +539,7 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
>>  	dev->mode_config.min_width = 0;
>>  	dev->mode_config.min_height = 0;
>>  	dev->mode_config.normalize_zpos = true;
>> +	dev->mode_config.allow_fb_modifiers = true;
>>  	dev->mode_config.funcs = &rcar_du_mode_config_funcs;
>>  	dev->mode_config.helper_private = &rcar_du_mode_config_helper;
>>  
>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
>> index c6430027169f..32135ad387fa 100644
>> --- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
>> @@ -726,6 +726,13 @@ static int rcar_du_plane_atomic_get_property(struct drm_plane *plane,
>>  	return 0;
>>  }
>>  
>> +static bool rcar_du_plane_format_mod_supported(struct drm_plane *plane,
>> +					       uint32_t format,
>> +					       uint64_t modifier)
>> +{
>> +	return modifier == DRM_FORMAT_MOD_LINEAR;
>> +}
>> +
>>  static const struct drm_plane_funcs rcar_du_plane_funcs = {
>>  	.update_plane = drm_atomic_helper_update_plane,
>>  	.disable_plane = drm_atomic_helper_disable_plane,
>> @@ -735,6 +742,7 @@ static const struct drm_plane_funcs rcar_du_plane_funcs = {
>>  	.atomic_destroy_state = rcar_du_plane_atomic_destroy_state,
>>  	.atomic_set_property = rcar_du_plane_atomic_set_property,
>>  	.atomic_get_property = rcar_du_plane_atomic_get_property,
>> +	.format_mod_supported = rcar_du_plane_format_mod_supported,
>>  };
>>  
>>  static const uint32_t formats[] = {
>> @@ -750,6 +758,11 @@ static const uint32_t formats[] = {
>>  	DRM_FORMAT_NV16,
>>  };
>>  
>> +static const uint64_t modifiers[] = {
>> +	DRM_FORMAT_MOD_LINEAR,
>> +	DRM_FORMAT_MOD_INVALID,
>> +};
>> +
>>  int rcar_du_planes_init(struct rcar_du_group *rgrp)
>>  {
>>  	struct rcar_du_device *rcdu = rgrp->dev;
>> @@ -776,7 +789,7 @@ int rcar_du_planes_init(struct rcar_du_group *rgrp)
>>  		ret = drm_universal_plane_init(rcdu->ddev, &plane->plane, crtcs,
>>  					       &rcar_du_plane_funcs, formats,
>>  					       ARRAY_SIZE(formats),
>> -					       NULL, type, NULL);
>> +					       modifiers, type, NULL);
>>  		if (ret < 0)
>>  			return ret;
>>  
>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
>> index 0878accbd134..9d1382b02717 100644
>> --- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
>> @@ -139,6 +139,11 @@ static const u32 formats_kms[] = {
>>  	DRM_FORMAT_YVU444,
>>  };
>>  
>> +static const uint64_t modifiers_kms[] = {
>> +	DRM_FORMAT_MOD_LINEAR,
>> +	DRM_FORMAT_MOD_INVALID,
>> +};
>> +
>>  static const u32 formats_v4l2[] = {
>>  	V4L2_PIX_FMT_RGB332,
>>  	V4L2_PIX_FMT_ARGB444,
>> @@ -344,6 +349,13 @@ static void rcar_du_vsp_plane_reset(struct drm_plane *plane)
>>  	state->state.zpos = plane->type == DRM_PLANE_TYPE_PRIMARY ? 0 : 1;
>>  }
>>  
>> +static bool rcar_du_vsp_plane_format_mod_supported(struct drm_plane *plane,
>> +						   uint32_t format,
>> +						   uint64_t modifier)
>> +{
>> +	return modifier == DRM_FORMAT_MOD_LINEAR;
>> +}
>> +
>>  static const struct drm_plane_funcs rcar_du_vsp_plane_funcs = {
>>  	.update_plane = drm_atomic_helper_update_plane,
>>  	.disable_plane = drm_atomic_helper_disable_plane,
>> @@ -351,6 +363,7 @@ static const struct drm_plane_funcs rcar_du_vsp_plane_funcs = {
>>  	.destroy = drm_plane_cleanup,
>>  	.atomic_duplicate_state = rcar_du_vsp_plane_atomic_duplicate_state,
>>  	.atomic_destroy_state = rcar_du_vsp_plane_atomic_destroy_state,
>> +	.format_mod_supported = rcar_du_vsp_plane_format_mod_supported,
>>  };
>>  
>>  int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
>> @@ -397,7 +410,7 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
>>  					       &rcar_du_vsp_plane_funcs,
>>  					       formats_kms,
>>  					       ARRAY_SIZE(formats_kms),
>> -					       NULL, type, NULL);
>> +					       modifiers_kms, type, NULL);
>>  		if (ret < 0)
>>  			return ret;
>>  
>> -- 
>> 2.17.1
>>
> 

-- 
--------------------------
IGEL Co., Ltd.
Tomohito Esaki
etom@igel.co.jp
