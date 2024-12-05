Return-Path: <linux-renesas-soc+bounces-10977-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFDD9E5EEE
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2024 20:37:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4EFA416D71E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2024 19:37:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41FCC22D4EC;
	Thu,  5 Dec 2024 19:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KMTTDvZr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3BB22B8D3
	for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Dec 2024 19:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733427440; cv=none; b=BUc94RP5YRfl/lwHr9dTkZBx4eTZFsP4K+ftnXm5O0mZQLw4VZZqccC9qS0IndwmhV43Hvxu2XeyxLuKZNU8AZDf2kWwWW9Qntd1JUCWRbI6GTKlh1I78TUFwWsZwoQuW5ff/i//bUsdD9Hpb2yGYUSezebnzkK8p+1MmeLGqlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733427440; c=relaxed/simple;
	bh=/8mWs+LsHg5t40Hdzas9ylAMup4YyUOMJMRhO6YgBdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=moQjTSgJaoIVUj2/dehAhAT033OyRyCWNqetP2X2zwWGLPIW5i+UVRQrOvZB0oK45FVEKRR92L47iNeY6orBEqjWOANeXyysLYSyTkj4iqPAVqhvplASzmmpfXC+B+Qr69lKE6EAt5hjH3wzxSqKw/Y2QnpY+dZV9YNp1o2/ccA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KMTTDvZr; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53df119675dso1778562e87.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 Dec 2024 11:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733427437; x=1734032237; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FU/EUHsit16rikYcJKnQECWispe+WbkZdRTRsFjxo4M=;
        b=KMTTDvZrpFOooCDsMKtgClP9reBquFs7ZsGeBa5HmgrsW+fGz9NHdJ2bWHcwFwnhwy
         UEb9uuxETSzMOvv1sOUI+IUvFQLcCfdFJyD/TeaZsUV6+1xa5a+KIS56Aocdnf9rWn8q
         RVs7SrzdY7aHj2Ufm5a6REFtLd7xyBlKSS1broLRnzz301okYzYyYO8Aw5YZos4fMJJw
         ppNfzXN5GkOPpq4QkrRzn5OLclCh6zYy5mBoTlaIq9xQCwtrozK5gmbeOgRlEGTRVGeD
         FpiU5lu+zk4q5KmvQ5uEkOGTyshYaDLA1Cx0qZVdAYiN2lc1AZrdfqxHJJOuG4KaDmwP
         7yog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733427437; x=1734032237;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FU/EUHsit16rikYcJKnQECWispe+WbkZdRTRsFjxo4M=;
        b=mD+qmvJHorQp6a5iBQfok5ukuA/jvcLF0KHEofqTsUy9Km1foZ0v/T6p2trLcfl5Ag
         /GWWcrC9qCmKuo5tt1qF1s6zUCXcbb4xuMK0tMKsw72mpu9gpPpI+1nNT9LZCqXP5Kut
         1jyJfOzgr0MNhorDeZYJStb19mJ4dvJguybYZHDLhAzHsWg13yxxi8TC8450jzGeQ/eC
         TK5tM4ybyOis8AXtztVTZoJL+byniHc/Ot1Rm3lmQ6iUKZmuIdMPmZ20e+lxPA8jE6fc
         iQ3nOiXPyUc6O1C1G38DcPY8VnPp2bzRmt93UfH09N7otN2zmlZIcE8LwGdAS8At+oOa
         h6Dw==
X-Forwarded-Encrypted: i=1; AJvYcCXz0jaojA9EzQSqfcBnID5c7T2EcJbdjSnnn6bEOZhgD05tyeieWlE0XfPMfe2ZYdgQD2V/C2gsmrU1GoogU+5p8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwDhSH3iz2Ag6OjUFTBQYYdnbQJyQHfuzRmBtQ0cWE1GxbnY7R
	mU1u2EbuLviHXVEpOsZqd3vsZQChzeoAlQSm7LaLQ+yJPZM7/XonXGm4F4YWrEf77VqgIDH8aNT
	Y
X-Gm-Gg: ASbGncvr6VxMCaos0Ri4CkX0lBMTZlPc7//zztLjInKH6NFPHj3M0t6iXzLa/RBLRZ5
	v4o7WeQhlBG/NSCJG/nd6YZHbOA9gEIZdhaksbLCRy1gVUoM15rcHv/NCqFCdDsPaZAsLjXhEJo
	lac/picwoRZrjBXkNq6a1VyzjYUJ+Fvb5qpASqJHNbEGnr9eaKFzV/BAQ8TgUyOI9cz+4TA1hT3
	pnTB9hHMz9fV/yz95QTlRxZKexQJAZQscd7zQFMBEwlmsrYJ3S3CSkq/Q4vGsrQEt89s6Zp1kQ4
	PTyefA23ni3mpioHEDpT0X/vQNFyTQ==
X-Google-Smtp-Source: AGHT+IERXOKhrQS1SGs1D5VgGlJZNknfg8nNxxBg0Nz/3rd8qLiDCnCB7kUCHN8FpkTx1vIxjtpeoA==
X-Received: by 2002:a05:6512:3083:b0:53d:e324:11c9 with SMTP id 2adb3069b0e04-53e2c504b81mr84578e87.54.1733427436612;
        Thu, 05 Dec 2024 11:37:16 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e229ba760sm320223e87.155.2024.12.05.11.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 11:37:15 -0800 (PST)
Date: Thu, 5 Dec 2024 21:37:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, biju.das.jz@bp.renesas.com, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/bridge: ite-it6263: Support VESA-24 input format
Message-ID: <lpkbkayu5hlwhbzxhez47gob5zed27z7ced7vkadqfmxneh54w@6zwd3xvskooc>
References: <20241205080210.1285385-1-tommaso.merciai.xr@bp.renesas.com>
 <3bab95ae-ba66-4aed-9cce-13498f2f50e6@nxp.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3bab95ae-ba66-4aed-9cce-13498f2f50e6@nxp.com>

On Thu, Dec 05, 2024 at 04:54:09PM +0800, Liu Ying wrote:
> On 12/05/2024, tomm.merciai@gmail.com wrote:
> > From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > 
> > Introduce it6263_is_input_bus_fmt_valid() and refactor the
> > it6263_bridge_atomic_get_input_bus_fmts() function to support VESA-24
> > format by selecting the LVDS input format based on the LVDS data mapping
> > and thereby support both JEIDA-24 and VESA-24 input formats.
> > 
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > ---
> > Changes since v1:
> >  - Inline it6263_is_input_bus_fmt_valid() as suggested by LYing
> >  - Fixed it6263_is_input_bus_fmt_valid() param from u32 to int as suggested by LYing
> >  - Fixed commit msg as suggested by LYing
> >  - Fixed commit body as suggested by LYing
> >  - Collected DBaryshkov tag
> > 
> >  drivers/gpu/drm/bridge/ite-it6263.c | 25 ++++++++++++++++++++++---
> >  1 file changed, 22 insertions(+), 3 deletions(-)
> 
> Reviewed-by: Liu Ying <victor.liu@nxp.com>
> 
> Since I have no drm-misc push right, Neil, Robert, Laurent or
> Dmitry, can you help push this?  Ofc, no rush. It's fine to wait
> for a period of time for potential comments.

I'll wait for a few days and apply the patch if nobody else beats me on
it.

-- 
With best wishes
Dmitry

