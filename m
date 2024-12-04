Return-Path: <linux-renesas-soc+bounces-10904-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4779E3BA8
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2024 14:49:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD4F9B27927
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2024 13:33:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DC301DE4F9;
	Wed,  4 Dec 2024 13:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PSzq/01A"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2261DB527
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Dec 2024 13:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733319197; cv=none; b=fFS4LwbGpT6SkLM4s5MGDA3CLJAIrNxDiiIAYe2OOxaDvg4BXzSbkcZDmjxrXV4o16qPtUfHKRx+sAKStcTW0KOewEXaIyS5q666WqZFlK2jHy0H65ez+UJFYpGO/0x8biI1Hf+mvxxPHbHYiPkswyfSTn+Fmn4bxTxf50lAo0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733319197; c=relaxed/simple;
	bh=nd1hyRugNG4e339vPL8cDhKI04ci+Kkup2hvZKJOEec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fPVtzDgD4GxhEm1q006/1LxISfKrJCFoTSNEvZV0yTcR4ZwMSPhpg0irnT2pxHemtNjwAVDGeh+Du+c7YWymlaWS2IlVwan1uzBf98lYGiYEhna5Gg0etKuEw0m8QtXZQ9znooxh2FECQu2JMJYSfQEIJJIYAYW0fhWXtn7GJQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PSzq/01A; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ffc357ea33so69637941fa.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Dec 2024 05:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733319192; x=1733923992; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RsB/NfCwM+1P1olfsdC/83TYUAkoJAqW1rAzLORxhG4=;
        b=PSzq/01A7a0xCh1HNo0mWTj2zJydpv85QZvvXW1zWTsPky+PH8s51FsRaq/fwJWDHe
         DNe+NQq4RvsuDQLcmYUtNGhG4T5iB4f7xq8qYn/23KQpHVq4PsITV4fzhwSsYX8+oO0y
         ndooMi3ApvOc0APOj750uIZzNk9ecVvL+3sN21xzxUzX9W/kJzGmgEhFlUhuyjdEqacX
         wlwAY6QxhS7BU2iQGwNFDBJb/E5JUDpwZhSCst9T71l4a76AeYZOu+qrNaKl0o/1fkxX
         fvFJm4haCGZgI4CPbLZMOKQg/fDtpMHzDDiWR3wS2RMElMI2/BGDQHiq8N9hv6tWCEjI
         JBYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733319192; x=1733923992;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RsB/NfCwM+1P1olfsdC/83TYUAkoJAqW1rAzLORxhG4=;
        b=njrotErw+N+tizpy/IkoAf7EFKIm8nRSr9M/mnfIqeDDvv2id8/Gc5raDfoq6gXY2k
         VBQDHyHxoeXA7zjV8jux60weh+ISYFpIze1rTSfDICvcxtIEHV/nwI9C//dIrPxzxeTK
         RrvQH5WemWtQpEqmH7rUaMfOCBhQeH+Df4hAudM0L4Iyndpxvxj5x7SEWRNxtMEv20M5
         K6yoi1Ifh9VjJ+a9sj6kCabiV4bxWBkOQs8gDnF5RlcCUnn5xilfTm2i8hZNLHtYkub8
         6gPs0RjHeMsmTrQ3bYkWlTDpBikqfeTfqNy1nBEx7I8gpRWrE4x5elLIcTtObA+VFZZF
         c0wA==
X-Forwarded-Encrypted: i=1; AJvYcCXYODAmilouRmCk0FXG7I1FrssQF/Wgh6GHLhCT5XCXr+vTJljpGntmorhFpaya+LFSfOMrplE4eW7M8F/PCd3rxg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUv8GKPfp3mHSLlIZo5T7p8YVe78bTgHK9kEPzSQm/nFVoGsoX
	NGMh64gyi8tqxWwz1n7mV7pED4AqbrDaOs2hodqhFEKsAjeoY5WfC0f6MVKtLp0=
X-Gm-Gg: ASbGncsAG7llqNZJesnDv2S4/p9nXsIjjk0lmhiC0b97LTqzC9NsENXBemVds7kGanW
	s9PXG4kl8ODk1P6/lP2gE3WpplaCK4DE1obE0pLmj05Ofy3jhOCD+AkJABFCGSau4cUnR6rVOqK
	rXT6w/13zusDaFoboRuG6tybO3uYKjP5/klb+4WNUDBMzkNNrfYrSwddItkJJ+cUY3dpaBcOfNv
	X8D8k61LbYgSZW1JqJJrHbD/s9qY+xsixwjz0lKNDJdXvBR1hErJp3FJObCnargFRnGH3K2csxb
	v3iMFR3FlU3nagF6/JaQj9JQcEbWGw==
X-Google-Smtp-Source: AGHT+IHljNFnGfVrhy26wQvMiA6JzxpZak1+n6ymrInfwTm7qaG3E2fx4pN19Sr0wCFYUH9zwMcJxA==
X-Received: by 2002:a2e:a5c9:0:b0:2ff:a415:5ac6 with SMTP id 38308e7fff4ca-30009caa509mr36018411fa.29.1733319192549;
        Wed, 04 Dec 2024 05:33:12 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffdfcd6f90sm19855931fa.126.2024.12.04.05.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 05:33:12 -0800 (PST)
Date: Wed, 4 Dec 2024 15:33:09 +0200
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
Message-ID: <7bzqm2qbr5zwwlltvbj77ux4hu5iwuwz25u3hwvgnwak5xyl7k@54wzvunf7cze>
References: <20241203172129.778123-1-tommaso.merciai.xr@bp.renesas.com>
 <834a2690-ca06-4a8b-9a81-c4981074f95c@nxp.com>
 <Z1Aw0WafGmYDrr8K@tom-desktop>
 <cnauwpk7myky6zbfcqg5335dqif4vmggzxlq554ye2bykb5iwh@ng4oxd2c5md3>
 <Z1BVADAhfENdcc3y@tom-desktop>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z1BVADAhfENdcc3y@tom-desktop>

On Wed, Dec 04, 2024 at 02:11:28PM +0100, Tommaso Merciai wrote:
> Hi Dmitry,
> 
> On Wed, Dec 04, 2024 at 01:53:44PM +0200, Dmitry Baryshkov wrote:
> > On Wed, Dec 04, 2024 at 11:37:05AM +0100, Tommaso Merciai wrote:
> > > Hi Liu Ying,
> > > Thanks for your review.
> > > 
> > > On Wed, Dec 04, 2024 at 11:34:23AM +0800, Liu Ying wrote:
> > > > On 12/04/2024, tomm.merciai@gmail.com wrote:
> > > > > From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > > > > 
> > > > > Introduce it6263_is_input_bus_fmt_valid() and refactor the
> > > > > it6263_bridge_atomic_get_input_bus_fmts() function to support VESA
> > > > > format by selecting the LVDS input format based on the LVDS data mapping
> > > > > and thereby support both JEIDA and VESA input formats.
> > > > 
> > > > ite,it6263.yaml says IT6263 supports vesa-24 and vesa-30, while
> > > > this patch actually only adds vesa-24 support.  So, to be more
> > > > specific, the patch subject and commit message should reflect
> > > > this rather than claim "Support VESA input format".
> > > 
> > > Fully agree, thanks.
> > > I will fix that in v2 specifying vesa-24 like you suggest.
> > > 
> > > > 
> > > > > 
> > > > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > > > 
> > > > Can you please send this patch with your Renesas email address
> > > > instead of Gmail email address?
> > > > Otherwise, add a Signed-off-by tag with your Gmail email address.
> > > 
> > > Thanks, for the point.
> > > What about adding Acked-by: from my renesas email address?
> > 
> > Acked-by has a different meaning. I'd say that generally it's okay to
> > have this light mismatch, see [1] or any of the emails that B4 generates
> > for web-based submission.
> > 
> > [1] https://lore.kernel.org/dri-devel/20241121164858.457921-1-robdclark@gmail.com/
> 
> Thanks for sharing this example and for the clarification.
> This is similar to my case :)
> 
> Then v1 procedure is correct?
> I can use the same formatting (From: Sob:) for sending v2?

I think so

> 
> Thanks & Regards,
> Tommaso
> > 
> > > 
> > 
> > -- 
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry

