Return-Path: <linux-renesas-soc+bounces-10898-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC7F9E3806
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2024 11:57:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 15D5FB2BAF3
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2024 10:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 952AB1885A0;
	Wed,  4 Dec 2024 10:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nWuwf61Z"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E711AA7A5;
	Wed,  4 Dec 2024 10:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733308632; cv=none; b=tjJS87dm5aQ5FLtV1pp+lpnCYTpWltcmhnG6KSBH70vzlgYBmtQm7OliVJ3ozNmoQ9cEqtI6bsZaP94fgbJ36X9S++NVrqzY0a1GM76bQys0JyUzRwcipbscohBUkWFUIquPp7uZiIm3ZwXT6J7F4tHwK705E10t1fdvn3xLGsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733308632; c=relaxed/simple;
	bh=oi4VCCSmHU55JcMhGyEuFOKOlzmvtbjpX1oEEtafnPI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FfVMv/CnALIIRuQ3Z84RKUcwSo/fCHPW/jf59Hdc+8zx+y7X2N8T7Q/sv4LiX5fWSOy/Vq6Y8eknz7SWFBrVvaeRYGCjjxxkovSKOMJCpldqi2oVF9onklv3T2rNfnMrGSx0F33uT4u94VjkVuxONzCr+NNBl9eOohmaXwnzQCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nWuwf61Z; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-434acf1f9abso60670345e9.2;
        Wed, 04 Dec 2024 02:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733308629; x=1733913429; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L3ttYxp6rhOt03opBOFaCp7oUwpLFGdn3JPE802PBas=;
        b=nWuwf61Z2uxMNS23bCIHvgTLmg1q5ZHzPqkkB/pIJxRG6aOrn5PzjrSPba75DRlJzx
         KCjfDAJUtswjnvyGTY8LYmftQU+44TWh0LJlCHhv+27ksKBlmM6Yz/KJdw4mlNyy41Br
         qjgzq/ZSSZzpM/iqj1nCW7bjyWBdxQ0JsyftJkS92V+8OwaUGPgBFLXQlL4DQw4JWDF9
         NvKQBQSzVX1ECzBQfCLHbAbuqmHtyfiu/+YGAwa3fKKtzgjmbqIhoY2q7R2YXwnoljQJ
         /l/pqhxGh2yD3FeBiwHPFNfxNPLOroc9BT4TddAZzliYgR2tQtG7AbDwHJXnyoAaSqD/
         HgEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733308629; x=1733913429;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L3ttYxp6rhOt03opBOFaCp7oUwpLFGdn3JPE802PBas=;
        b=WKr3huUF/I4GI+Qle96tgb+AH0RvaVHUpuVshwb1Q6XoG90yleilguDXxrgCYrlcaE
         12zdeNX90cHU/6HRYjzC5PwUiPUOwPv6HgHMyaPnty0o42cPLBKg1ZiwYRUKiVaL3t0D
         ZWDUdc6HE8jjZcXDXrJ4RVsOdfHocK5yIyn2nJFvPZ8lQEJP4nth+S9IDA/orbsOkOxY
         Iss1YK1SA0pmDA0McqH252hEis6Z//dQsRre7VXu4jEFbpi2GtWLgctwNMTWBpGd7IKH
         jzzxwBByCD90QqcJVd7ydqJPKDwsA3bky/i6jH2t/+P1WHk8DvcKohvUNz200NWl5qZ6
         jd3w==
X-Forwarded-Encrypted: i=1; AJvYcCXxk0HXzxxHz52Xp4o1OqPEJZZqvtuEj+8DpjtdFKnOC5LLyxG1KT1svsAUWAeH2i23lQer9Q70wGb+Gqk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJarJO1zLlVXDDTSGf5Hjxd60UE9sCSXpmDkZbVhxp5/FSkk6P
	rRYHFyu0r/kDNP/vaDPIYhkRURe+1DY+hVc/hXwxrA8b5CvX/svZ
X-Gm-Gg: ASbGncufilm/WdUnhOhCR/eYDT4nh3JbzgCdYmSSJoxANOImNkB7XJ3gGIYKAXONTsR
	zFFcprx69kuHHWCFcaevCdDLDMwj/PhgTCHjobapMJyYetebP3fptBRPRX/+NQcxrFM1NXkxC3Q
	hp7/e1KzCD9tGhukYx+cjccQiVAR/aI7L9nk9sGJeyrBQ28HtIGibBJFEf8mT2v+jzHQ/FC/lx9
	8+fxPEhMo5E3qYicQoAbppnCv4z5shN04AZdkKhNT1/k/UMVktLLj79ezmMKkiTdxJ/+2ScFthV
	JabwJlOA9eIzEUT6sAS5
X-Google-Smtp-Source: AGHT+IFk6yd+S1MM72aq43fUVFUVQJ8IJuecR2VdiHKgNuoOL+p3FwaA3bVzIhygdzDfT4fCU6sesg==
X-Received: by 2002:a05:600c:1d19:b0:434:a1d3:a306 with SMTP id 5b1f17b1804b1-434d09b2401mr51927465e9.5.1733308628639;
        Wed, 04 Dec 2024 02:37:08 -0800 (PST)
Received: from tom-desktop (net-188-217-53-234.cust.vodafonedsl.it. [188.217.53.234])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d527e287sm19861935e9.12.2024.12.04.02.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 02:37:08 -0800 (PST)
Date: Wed, 4 Dec 2024 11:37:05 +0100
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: Liu Ying <victor.liu@nxp.com>
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: ite-it6263: Support VESA input format
Message-ID: <Z1Aw0WafGmYDrr8K@tom-desktop>
References: <20241203172129.778123-1-tommaso.merciai.xr@bp.renesas.com>
 <834a2690-ca06-4a8b-9a81-c4981074f95c@nxp.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <834a2690-ca06-4a8b-9a81-c4981074f95c@nxp.com>

Hi Liu Ying,
Thanks for your review.

On Wed, Dec 04, 2024 at 11:34:23AM +0800, Liu Ying wrote:
> On 12/04/2024, tomm.merciai@gmail.com wrote:
> > From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > 
> > Introduce it6263_is_input_bus_fmt_valid() and refactor the
> > it6263_bridge_atomic_get_input_bus_fmts() function to support VESA
> > format by selecting the LVDS input format based on the LVDS data mapping
> > and thereby support both JEIDA and VESA input formats.
> 
> ite,it6263.yaml says IT6263 supports vesa-24 and vesa-30, while
> this patch actually only adds vesa-24 support.  So, to be more
> specific, the patch subject and commit message should reflect
> this rather than claim "Support VESA input format".

Fully agree, thanks.
I will fix that in v2 specifying vesa-24 like you suggest.

> 
> > 
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> 
> Can you please send this patch with your Renesas email address
> instead of Gmail email address?
> Otherwise, add a Signed-off-by tag with your Gmail email address.

Thanks, for the point.
What about adding Acked-by: from my renesas email address?

> 
> > ---
> >  drivers/gpu/drm/bridge/ite-it6263.c | 25 ++++++++++++++++++++++---
> >  1 file changed, 22 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
> > index cbabd4e20d3e..83d1db29157a 100644
> > --- a/drivers/gpu/drm/bridge/ite-it6263.c
> > +++ b/drivers/gpu/drm/bridge/ite-it6263.c
> > @@ -48,6 +48,7 @@
> >  #define  REG_COL_DEP			GENMASK(1, 0)
> >  #define  BIT8				FIELD_PREP(REG_COL_DEP, 1)
> >  #define  OUT_MAP			BIT(4)
> > +#define  VESA				BIT(4)
> >  #define  JEIDA				0
> >  #define  REG_DESSC_ENB			BIT(6)
> >  #define  DMODE				BIT(7)
> > @@ -428,12 +429,30 @@ static inline void it6263_lvds_reset(struct it6263 *it)
> >  	fsleep(10000);
> >  }
> >  
> > +static bool it6263_is_input_bus_fmt_valid(u32 input_fmt)
> 
> 1) Inline this small function.
> 2) Change the argument input_fmt type from u32 to int to
>    match the type of it->lvds_data_mapping.

Will fix that in v2, thanks :)

> 
> static inline bool it6263_is_input_bus_fmt_valid(int input_fmt)
> 
> > +{
> > +	switch (input_fmt) {
> > +	case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
> > +	case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
> > +		return true;
> > +	}
> > +	return false;
> > +}
> > +
> >  static inline void it6263_lvds_set_interface(struct it6263 *it)
> >  {
> > +	u8 fmt;
> > +
> >  	/* color depth */
> >  	regmap_write_bits(it->lvds_regmap, LVDS_REG_2C, REG_COL_DEP, BIT8);
> > +
> > +	if (it->lvds_data_mapping == MEDIA_BUS_FMT_RGB888_1X7X4_SPWG)
> > +		fmt = VESA;
> > +	else
> > +		fmt = JEIDA;
> > +
> >  	/* output mapping */
> > -	regmap_write_bits(it->lvds_regmap, LVDS_REG_2C, OUT_MAP, JEIDA);
> > +	regmap_write_bits(it->lvds_regmap, LVDS_REG_2C, OUT_MAP, fmt);
> >  
> >  	if (it->lvds_dual_link) {
> >  		regmap_write_bits(it->lvds_regmap, LVDS_REG_2C, DMODE, DISO);
> > @@ -714,14 +733,14 @@ it6263_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> >  
> >  	*num_input_fmts = 0;
> >  
> > -	if (it->lvds_data_mapping != MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA)
> > +	if (!it6263_is_input_bus_fmt_valid(it->lvds_data_mapping))
> >  		return NULL;
> >  
> >  	input_fmts = kmalloc(sizeof(*input_fmts), GFP_KERNEL);
> >  	if (!input_fmts)
> >  		return NULL;
> >  
> > -	input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA;
> > +	input_fmts[0] = it->lvds_data_mapping;
> >  	*num_input_fmts = 1;
> >  
> >  	return input_fmts;
> 
> -- 
> Regards,
> Liu Ying

Thanks & Regards,
Tommaso


> 

