Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC071586677
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Aug 2022 10:37:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229987AbiHAIhX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 1 Aug 2022 04:37:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230210AbiHAIhS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Aug 2022 04:37:18 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FC532E9F5
        for <linux-renesas-soc@vger.kernel.org>; Mon,  1 Aug 2022 01:37:17 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id t22so2138197pjy.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 01 Aug 2022 01:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc;
        bh=dbKMx+fhEBF78ERzvNxrqbrYcF1M+hMDZYIeFQNZ5FA=;
        b=34JexBYN3hPVFVLsF4cGZbx7Oo/nDUl/LCeNtO/XeyjheaCuEY32bLELjDsO6HYHN4
         xexcKVES35R8U+sxGgcJC/zCgHm3tMjOFKl59KDHot+LvhfPqrGNUjpLzzTeS91kVvJ+
         WF0s+crqYiWEu9URG87TD9V4wdaniLwquWWDZlRnZQyQ32yV3gaeUIqxm6WOlF4BcAOV
         pIVdd8d/55trgI6q4jv4Gp6epNNzxzeYgYL0ohwh+pklMTQeQTWApP3bnzeIE84tXrfm
         HHWUCWFZTAdHqrnVOGPvlPW7pTDvgeaiRE8VJWiExINkV9revsDxX8M/Hs7EOKY/+dQY
         6+uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc;
        bh=dbKMx+fhEBF78ERzvNxrqbrYcF1M+hMDZYIeFQNZ5FA=;
        b=XmO1noaH58vdtlHkcCPPym11FdyMuOzcnMTwiu/Ol70h9k7DuPDP8R6QPwvc68puPS
         TTosLbXDj4vwx62RvCjMCmRE93Ssg97tyhnOrhsIxZ5DOt34OQfS9//C3n1/xv6dQueU
         rHGWdOPViCI2eEOcISsVobCKuImITe6RS+L85tdBDhOAfLCsRgcfTMN0rM1QgwrRJypB
         jEL5MIFv+OVkanEtVoIFhgWNDCxdpiP40tkbwDikER0xf88+CJaEouIeSetxFKWzcBew
         GXvlq8QKx7Tn1VFUa8SlB1DMG2iAvf17h/0Len52CWwXZqvUUhAc4lzIqGg2+B+ak35L
         NCRQ==
X-Gm-Message-State: ACgBeo2ZiVH/Cr5DnKmoevsdcVLF+dg8SNlD2n+sqtErrj9qvr9ycJaL
        NEzRY2HwIG2GUrtclrGT7EOeBg==
X-Google-Smtp-Source: AA6agR4W758nPd78/13sINqD4UDsFz7YIWC+DGDXdJTIHZMJN4p3KPpjxhDC9vKOrWO58agHbshKDQ==
X-Received: by 2002:a17:902:ecc1:b0:16d:b43e:51f0 with SMTP id a1-20020a170902ecc100b0016db43e51f0mr15792749plh.167.1659343036679;
        Mon, 01 Aug 2022 01:37:16 -0700 (PDT)
Received: from smtpclient.apple ([240b:10:c080:a100:961:ad60:8d36:c3ca])
        by smtp.gmail.com with ESMTPSA id b10-20020a1709027e0a00b0016d295888e3sm8863372plm.241.2022.08.01.01.37.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Aug 2022 01:37:16 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.100.31\))
Subject: Re: [PATCH 2/3] media: vsp1: add blend mode support
From:   Takanari Hayama <taki@igel.co.jp>
In-Reply-To: <YuWyd2YGLx1J5vPW@pendragon.ideasonboard.com>
Date:   Mon, 1 Aug 2022 17:37:14 +0900
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        kieran.bingham+renesas@ideasonboard.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <25B2861E-7096-4D53-A13C-78A287D9ACE3@igel.co.jp>
References: <20220704025231.3911138-1-taki@igel.co.jp>
 <20220704025231.3911138-3-taki@igel.co.jp>
 <YuWyd2YGLx1J5vPW@pendragon.ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailer: Apple Mail (2.3696.100.31)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

Thank you for reviewing the patch.

> 2022/07/31 7:36=E3=80=81Laurent Pinchart =
<laurent.pinchart@ideasonboard.com>=E3=81=AE=E3=83=A1=E3=83=BC=E3=83=AB:
>=20
> Hi Hayama-san,
>=20
> Thank you for the patch.
>=20
> On Mon, Jul 04, 2022 at 11:52:30AM +0900, Takanari Hayama wrote:
>> To support DRM blend mode in R-Car DU driver, we must add blend mode
>> support in VSP1. Although VSP1 hardware is capable to support all =
blend
>> mode defined in DRM, the current R-Car DU driver implicitly supports
>> DRM_MODE_BLEND_COVERAGE only.
>>=20
>> We add a new property to vsp1_du_atomic_config, so that R-Car DU =
driver
>> can pass the desired blend mode.
>>=20
>> Signed-off-by: Takanari Hayama <taki@igel.co.jp>
>> ---
>> drivers/media/platform/renesas/vsp1/vsp1_drm.c | 11 +++++++++++
>> include/media/vsp1.h | 14 ++++++++++++++
>> 2 files changed, 25 insertions(+)
>>=20
>> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.c =
b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
>> index 9ec3ac835987..ed0cf552fce2 100644
>> --- a/drivers/media/platform/renesas/vsp1/vsp1_drm.c
>> +++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
>> @@ -861,6 +861,17 @@ int vsp1_du_atomic_update(struct device *dev, =
unsigned int pipe_index,
>> 	vsp1->drm->inputs[rpf_index].compose =3D cfg->dst;
>> 	vsp1->drm->inputs[rpf_index].zpos =3D cfg->zpos;
>>=20
>> +	switch (cfg->blend_mode) {
>> +	case VSP1_DU_BLEND_MODE_PREMULTI:
>> +		rpf->format.flags =3D V4L2_PIX_FMT_FLAG_PREMUL_ALPHA;
>> +		break;
>> +	case VSP1_DU_BLEND_MODE_PIXEL_NONE:
>> +		rpf->pixel_alpha =3D false;
>> +		fallthrough;
>> +	case VSP1_DU_BLEND_MODE_COVERAGE:
>> +		rpf->format.flags =3D 0;
>> +	}
>=20
> This should work, but wouldn't it be simpler to override the format
> passed in cfg->pixelformat in rcar_du_vsp_plane_setup() with the
> non-alpha variant when state->state.pixel_blend_mode is set to
> DRM_MODE_BLEND_PIXEL_NONE ? That way you could drop rpf->pixel_alpha,
> turn cfg->blend_mode into a premult bool flag, and drop the
> vsp1_du_blend_mode enum. There's only three formats with an alpha
> channel that the rcar-du driver supports (DRM_FORMAT_ARGB4444,
> DRM_FORMAT_ARGB1555 and DRM_FORMAT_ARGB8888), so the override could be
> as simple as a switch (state->format->fourcc) when the blend mode is
> NONE.

You=E2=80=99re right. I=E2=80=99ll make the suggested changes and submit =
V2.

>=20
>> +
>> 	drm_pipe->pipe.inputs[rpf_index] =3D rpf;
>>=20
>> 	return 0;
>> diff --git a/include/media/vsp1.h b/include/media/vsp1.h
>> index cc1b0d42ce95..1ba7459b7a06 100644
>> --- a/include/media/vsp1.h
>> +++ b/include/media/vsp1.h
>> @@ -42,6 +42,18 @@ struct vsp1_du_lif_config {
>> int vsp1_du_setup_lif(struct device *dev, unsigned int pipe_index,
>> 		 const struct vsp1_du_lif_config *cfg);
>>=20
>> +/**
>> + * enum vsp1_du_blend_mode - Pixel blend mode
>> + * @VSP1_DU_BLEND_MODE_PREMULTI: Pixel alpha is pre-mutiplied
>> + * @VSP1_DU_BLEND_MODE_COVERAGE: Pixel alpha is not pre-mutiplied
>> + * @VSP1_DU_BLEND_MODE_PIXEL_NONE: Ignores the pixel alpha
>> + */
>> +enum vsp1_du_blend_mode {
>> +	VSP1_DU_BLEND_MODE_PREMULTI,
>> +	VSP1_DU_BLEND_MODE_COVERAGE,
>> +	VSP1_DU_BLEND_MODE_PIXEL_NONE,
>> +};
>> +
>> /**
>> * struct vsp1_du_atomic_config - VSP atomic configuration parameters
>> * @pixelformat: plane pixel format (V4L2 4CC)
>> @@ -51,6 +63,7 @@ int vsp1_du_setup_lif(struct device *dev, unsigned =
int pipe_index,
>> * @dst: destination rectangle on the display (integer coordinates)
>> * @alpha: alpha value (0: fully transparent, 255: fully opaque)
>> * @zpos: Z position of the plane (from 0 to number of planes minus 1)
>> + * @blend_mode: Pixel blend mode of the plane
>> */
>> struct vsp1_du_atomic_config {
>> 	u32 pixelformat;
>> @@ -60,6 +73,7 @@ struct vsp1_du_atomic_config {
>> 	struct v4l2_rect dst;
>> 	unsigned int alpha;
>> 	unsigned int zpos;
>> +	enum vsp1_du_blend_mode blend_mode;
>> };
>>=20
>> /**
>=20
> --=20
> Regards,
>=20
> Laurent Pinchart

Cheers,
Takanari Hayama, Ph.D. <taki@igel.co.jp>
IGEL Co., Ltd.
https://www.igel.co.jp/
