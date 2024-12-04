Return-Path: <linux-renesas-soc+bounces-10900-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F359E394B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2024 12:53:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2AAE3284FD5
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2024 11:53:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8630F1B3945;
	Wed,  4 Dec 2024 11:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EoNpC49i"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1131ABEDC
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Dec 2024 11:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733313231; cv=none; b=CjEVE33sn9jhFcrS35/UAj03qA1smgrUxEJVvD8LVCGWcsCaiM0lojdl2IQusb/c2snk5sLZdbl4XwOHXdXU5rFDgxhABVjmyPGjybDfuHEML1jMPbUnS7qMfK9BBf537qi7Z9kmae7GuLp7M5xMagv5w9VCbMNiCYj4XRL2vLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733313231; c=relaxed/simple;
	bh=luDqbcuOQVMj4DwFN6l1Fqfcu47I6KAT3+S2xLDmE7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZF0vffy8Oj26J1O11UjyWHBU2E1rxN3GphcBzj+B3GPy5Btb393KsW5EqMUMlzOmzIcCiT3CSx1ckhFui9VZxrzObbaM7e7msvTLfRfKwvjsyCPO3AL/XIHLHFGSZvbuZ3mMwSqrPcO9aIPDG4ErEijiikeunC+JJXEav0sZojg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EoNpC49i; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53df63230d0so8048699e87.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Dec 2024 03:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733313227; x=1733918027; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eZi0lek4MKOQiatQagp7Ze6cVrkfo3z9JDWmy9BvIl4=;
        b=EoNpC49iqnSXxy3g+/iJc5sXKcNUj8nRt65VVncMNqVOq6Z8LGi0UzVL4bMot0l4s1
         Gg1pehfMd0zBFaEbbHM9NlYAJ5pY4pumIzJ8OSwdxKrLJp9ONWbZzLq0i0cEsoChIenL
         LV/0Q884SC6XlLmoVXKnJhDrPtXbaiHnN8QpeJUZBkgGqCEdBOq/luxQhh7B4cy669N9
         jtXq+vKMW5to27Uunpsw5hW8Mor3A4D7d6FnPJxFYGbBnjJoRXoCYBi7+gnhf2eeTHc+
         7hDgTKNiTOgcj+jpcOYFW4p/hCkAFwGyQ9PZr92h/UHnSuQmep47WJ/IW5+0YfA7uzeT
         BhLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733313227; x=1733918027;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eZi0lek4MKOQiatQagp7Ze6cVrkfo3z9JDWmy9BvIl4=;
        b=VSkUZsLvwmD2mk7LhvZNp3PrXbo5FvwKNq5VLIxps3zes2BewgFCYQLlMccbgn0MZB
         QGVmGZngScpmhdhTNbwCBLF5lmlIXx2teiNYHXi2+C7PxJ3SEMHh3aHJWRkHA6UxLAl0
         wk/fsnRa77ZqtGNe/vUQPYBCvnVnIzsbelYWoqJIO+gGseQ5sYvwZlwImdZv+2na/UbE
         57iyM/9ovg9O1OnzIQ+GEFsmX8dAUJ2esKqcvAWXrg64tyjsGgomVTGKuQ0Dm/sNvnMJ
         ukqThcPzG3HSvUTPkaW9SBtd71Ml3wfiEo01xsb1yUaThhj6hjhsxmjJIa/gtJhJDljJ
         VtNA==
X-Forwarded-Encrypted: i=1; AJvYcCWiTau8ZFRewHnmuI9Ophb7P8VpWkZjHxVGp1BRGW4f+BW1QIT436lFQi0fj7Pz6k73TpWCTPCo+6Bg6NpuxiLkmw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGj9BhK1fAd91kt0D4kSci+xNvUuuS2bm8ZLDajplOjCOhVKrw
	4TM+dIpDmHIKUYkOtSlDT/2n5U3rAMNpa3wAaaUUV6u/gm3Qx8rKSUnmj4R6zSA=
X-Gm-Gg: ASbGncun/Zws/tkhfz6Pjd1CBVylnIQUvPuvqlRp82GiW7UztuvoF+2Gy0lVQ1+8NNV
	oKqb0vpyQpxA5Fv19SzoU4f6ilXgTk05ZYF4h0sQl44dda8yKzhP8+A4le2gEJJEHNKk6/0EQrG
	/b1TWNWFSKCifn2EZ810f7ZcaNlOGMoo3XqU/w2IWmVMi30fSExG/K77GwsThgrzskRjGkTJG18
	t33ZjCLBYWppvut1awQZb7TbHPARjGdjMTvSoOlpNMRvXBZeb0uTp/Ukf1BRBHA31QVhltJB279
	Cv0xatCaVoJlkAVkoKg9KoNOnM/rRw==
X-Google-Smtp-Source: AGHT+IFnxylvsEOR+9iXG9XQGFOsLGLuTUnH2Iuu/xJxK8JDRP9Lh4DwH23FiU4cCFdLCw17KMc73g==
X-Received: by 2002:a05:6512:b85:b0:53d:ee75:1581 with SMTP id 2adb3069b0e04-53e12a35260mr2697093e87.50.1733313227235;
        Wed, 04 Dec 2024 03:53:47 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e1356906esm554232e87.15.2024.12.04.03.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 03:53:46 -0800 (PST)
Date: Wed, 4 Dec 2024 13:53:44 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Tommaso Merciai <tomm.merciai@gmail.com>
Cc: Liu Ying <victor.liu@nxp.com>, linux-renesas-soc@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, biju.das.jz@bp.renesas.com, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: ite-it6263: Support VESA input format
Message-ID: <cnauwpk7myky6zbfcqg5335dqif4vmggzxlq554ye2bykb5iwh@ng4oxd2c5md3>
References: <20241203172129.778123-1-tommaso.merciai.xr@bp.renesas.com>
 <834a2690-ca06-4a8b-9a81-c4981074f95c@nxp.com>
 <Z1Aw0WafGmYDrr8K@tom-desktop>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z1Aw0WafGmYDrr8K@tom-desktop>

On Wed, Dec 04, 2024 at 11:37:05AM +0100, Tommaso Merciai wrote:
> Hi Liu Ying,
> Thanks for your review.
> 
> On Wed, Dec 04, 2024 at 11:34:23AM +0800, Liu Ying wrote:
> > On 12/04/2024, tomm.merciai@gmail.com wrote:
> > > From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > > 
> > > Introduce it6263_is_input_bus_fmt_valid() and refactor the
> > > it6263_bridge_atomic_get_input_bus_fmts() function to support VESA
> > > format by selecting the LVDS input format based on the LVDS data mapping
> > > and thereby support both JEIDA and VESA input formats.
> > 
> > ite,it6263.yaml says IT6263 supports vesa-24 and vesa-30, while
> > this patch actually only adds vesa-24 support.  So, to be more
> > specific, the patch subject and commit message should reflect
> > this rather than claim "Support VESA input format".
> 
> Fully agree, thanks.
> I will fix that in v2 specifying vesa-24 like you suggest.
> 
> > 
> > > 
> > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > 
> > Can you please send this patch with your Renesas email address
> > instead of Gmail email address?
> > Otherwise, add a Signed-off-by tag with your Gmail email address.
> 
> Thanks, for the point.
> What about adding Acked-by: from my renesas email address?

Acked-by has a different meaning. I'd say that generally it's okay to
have this light mismatch, see [1] or any of the emails that B4 generates
for web-based submission.

[1] https://lore.kernel.org/dri-devel/20241121164858.457921-1-robdclark@gmail.com/

> 

-- 
With best wishes
Dmitry

