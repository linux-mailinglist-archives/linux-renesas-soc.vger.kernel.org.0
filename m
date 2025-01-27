Return-Path: <linux-renesas-soc+bounces-12598-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6D5A1D9A5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 16:35:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBF703A22F7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 15:35:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9EF0149DE8;
	Mon, 27 Jan 2025 15:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ksUZe169"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4641494DF
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Jan 2025 15:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737992080; cv=none; b=jXs1DW+IrQFd+RnoSJWXyy7IsqcPaPPuNU4GKQOGXPdRnvJ5SymlEoJePhreQ++i3W3K3mTJpULmnH4rWayLQbRT4Q4wdtK5leGr+T2K06nWD3zqILnyM/zc6IKgKda2N1Whd06djPU1sLAnsq40X6B6GAxhxWciTqz+J3zLd2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737992080; c=relaxed/simple;
	bh=x/s/r1CUioM9J9dCaYfOu1djbjFSNIbhyHIxWUxRzuI=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AnCIv3iwkbNnwHrnqOvi2/avoeqOsyCwxsb2LeS9PQSXhHmPquu2C9x2xpJbwOgcECtxd9Jx0YFgDdlPt/hI1eMsvw6JTwcdljhL/HpZgmkz/WJiJbbdAJToAAqNpFOAzkcHVf9dNahRmX3m4tgjoiJfH6fVdUXWOKAqlnDTP2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ksUZe169; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5439e331cceso5558968e87.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Jan 2025 07:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737992077; x=1738596877; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VuArV47OakPm5tI3u4UevLvvxevY1PGx5jGLqv+/LEY=;
        b=ksUZe1696pzSM+v8Yeyoxc2cBD27s8KqZKQ/khYiQXiS2a5XH+W9AD3O3EZrvwhe/R
         pBGp3srNB8GAG0il+fZjwBqYPaQF7MWyPGtE0R4ngM+MiBz+RQ7WkAd3qCnjCE+XEYMm
         0S4wBN1UppA11XaK4eOpHP8gM6rXpMarnyFEiB4/5nT+2FdlUYMjnDwJifmfC1PkngMM
         dJRhD4u9/pvlSMRRl2RBENNhHVy0Gads5XMOGUGrBzsNbDgc9AKSGDY/gXHf19ME+3mE
         SbBs5ogayjZ2tD9pFt6lmbv5iG433FwZHcEu2/qsAaJ02ld73ayVbzcrONHZ59pwkTJd
         cMqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737992077; x=1738596877;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VuArV47OakPm5tI3u4UevLvvxevY1PGx5jGLqv+/LEY=;
        b=gXIAPfThNbVt78GerWG6PhBsUkgyjTBX33//ffChjCvLgn3PhlwcWYufr9xQ/B+Ny3
         orI53mRkT3ngMbOLA9Gmg5yaAYgQZgPptgK4LcNdMAVEq0/FGQBFcD6oMRvavjCyZRpf
         kIRmxL6CgGhSHaA/bnJreBHlUrHxCh6WarsoeUU2UGVPhapbHKYGdpoqy9zJex1EfBU1
         4Az+F6LzhCjrlMa1E4KH5xk/kCBz37cGwSEya0xRiNBqpVP9gAoaoReDymZaYG/lXt9n
         YYqkHuAit58esQY5VF6sJPzVU9Mp5EAsZ1mszjMpRQpAmU6lmyvh7aKr7JISaHVar8nI
         5FLg==
X-Forwarded-Encrypted: i=1; AJvYcCWTFcFOvmLjam0XKfGkYNRR7qKQgJO7WQzqiM32zdy6U5TMGfbmDFJe659SEHjQG8EOLuf/08JE2u1HyAk6/48cwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlB0CyjtPGZ6VQQi/f9VGK70WYnPWkceKS9uvec1l9xkH1pFWQ
	7pllbO4fQq6VPd+QKaLQ4vpqIOyUMbBiMaAGUes9z3IvOyQgwO8htwRAKeRCzqk=
X-Gm-Gg: ASbGnctfR8Fp9EonkbZRpL+JNDKTH24ofitikhPfpPNRDq8FgPy8JglLFGTf5kmbhEx
	cdJ0IoBV9kxlG+d8+b8P+RN62US+8CkCnic5bJDODR2BEHgP0KFUYoZqM3Ep0J/js0U4RlsVF/C
	i9nL7sOfm/yIjhPL9T8bkcSRS0SH/1CQ2ZKYCTBigv9TyDdWDArGtS7wJk98s3LLyxkjnYaBe+g
	tqyxiwTk7eRx5bfjy10HeaZ7aaJLvrc4SL5dobyuVti7eJoGRwX+3dqw7rE4pqcG1+UGRkaNJsM
	wvStKZpA71pifN9DV488H02KKmNhIwtwhytlFxSKZ+aX9t58HnUI5f5PnKno
X-Google-Smtp-Source: AGHT+IFBViOX5IoiLaMV4O3CShQ434LyDf8prPm5SaqVCZbNaTgxql6FUxNa13zXchLB5Cm/PRrD+A==
X-Received: by 2002:ac2:43a2:0:b0:542:6105:bb72 with SMTP id 2adb3069b0e04-5439c224a57mr11688307e87.19.1737992076690;
        Mon, 27 Jan 2025 07:34:36 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c83798cbsm1346139e87.167.2025.01.27.07.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 07:34:36 -0800 (PST)
Date: Mon, 27 Jan 2025 17:34:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-renesas-soc@vger.kernel.org, Andrzej Hajda <andrzej.hajda@intel.com>, 
	David Airlie <airlied@gmail.com>, Douglas Anderson <dianders@chromium.org>, 
	dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH RFT 0/2] drm/bridge: Use per-client debugfs entry
Message-ID: <hywmnv4jf6ix2ziabdftd5zcjqnkfq6pmqxqzw6spc76camrxz@jn5vr4mgj37v>
References: <20250125125320.37285-4-wsa+renesas@sang-engineering.com>
 <a3hrta4eiiknuf4sukk27xewhhirzf43u2eeefnpjny27m4x5s@aifvnevj7cb6>
 <Z5c7vk_oa8HGt7sS@ninjato>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5c7vk_oa8HGt7sS@ninjato>

On Mon, Jan 27, 2025 at 08:54:38AM +0100, Wolfram Sang wrote:
> Hi Dmitry,
> 
> thanks for the review!
> 
> > > The I2C core now offers a debugfs-directory per client. Use it and
> > > remove the custom handling in drm bridge drivers. I don't have the
> > > hardware, so I hope I can find people willing to test here. Build bots
> > > are happy. And for it6505, it even fixes a problem. See the patch
> > > description there.
> >
> > I'd say, it should be done in a slightly different way: bridges have the
> > debugfs_init() callback, which is used by drm_bridge_connector (and can
> > be used by other bridge-created connetors) in order to create per-bridge
> > debugfs data. Please consider using it to create per-bridge debugfs data.
> 
> ACK.
> 
> > Note, that callbacks gets connector's dentry as an argument, so bridges
> > still should probably create a subdir for their own stuff.
> 
> I wonder if this is necessary (I just looked at the code and have no
> hardware to test this, sadly). It looks to me as:
> 
> - DRM has already debugfs infrastructure, yet those drivers don't use it
> - but they should
> - the new I2C client debugfs infrastructure is, thus, not needed here
> - DRM provides a dentry to the callbacks which drivers can "just use"
> - all drivers I looked at just put files there and never clean up
>   (because the subsystem does it)
> 
> So, from that, I should switch to the debugfs_init() callback and just
> use the dentry provided?

Yes, please. Create a per-bridge subdir under that dentry, but I think
that was the case anyway.

> Or am I missing something?
> 
> Happy hacking,
> 
>    Wolfram
> 



-- 
With best wishes
Dmitry

