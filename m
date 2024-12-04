Return-Path: <linux-renesas-soc+bounces-10902-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3065B9E3AE4
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2024 14:11:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F39B0168753
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2024 13:11:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BC6E1C07E7;
	Wed,  4 Dec 2024 13:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KDG4Y9pg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7F01B87E7;
	Wed,  4 Dec 2024 13:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733317894; cv=none; b=bV/i1WXYJ6ueGT2GokFz2bwfxXJ1lzv9pvsE3JXnTwp7fHzLtnVpZsFVXxboihrgCJHm2lAjH/bZIUo22NG8D3z9HL98JMLATBUZ11mZE/NZuF14SBz3iAhrWN4riLDALX7lhT/wkIpyI5X9BIpvEspVvApygjxQca+3d9+0d9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733317894; c=relaxed/simple;
	bh=DhOAk1RWApp29+xw8u1pSCcsLRfMTBJYiJvGP3qfcoE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f4L0PROn3v9fRCRcngZQeETphFzZJsvmyJD2YZ6A//Vyomkt9ycww9fWFFY/6SDoDeACBwJxsVBOt7MngI+7qjt0CWcWrINln/PwCGWRyRObw/GNSV7iK3PwT0500wfab3NB/Th89ccR+Kl28opph7DRpXmZiiLHoQIPO2JfXpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KDG4Y9pg; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-434ab938e37so44240915e9.0;
        Wed, 04 Dec 2024 05:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733317891; x=1733922691; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N0SZ8kQHAsOIZwkil/k0ov1BrW4/jp+99A2CjCuwyeE=;
        b=KDG4Y9pgup96s16rX5OMvz8mey9vddQdoU9m1UsA0+JbE5RU+UV9cm8MsFihAvXjmM
         BPYZ1jNrNafHGjgEl1ypOYZt3s/QQUFPAHjlwyZqh95GsIESswBWkIcCH4L/Om7UO8By
         rNlgwqc+CItOldy9Y8D5fd8QhfY13hx919ONezD8pG712/ck38E0AptDXWecxEV/APDQ
         2Oar9Ouj/SyFqfS8n+dGieVNIe+KcVE4DNKM+n+9lt1+A8YsQppGpDMxD9MERRhLYLoG
         h3qIQbsKtc7ALTplngYyH1eO9CDenZ3Z18k22tiihW3iXEKkxPmvGM1hEe0T5Ns/eOkn
         l+pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733317891; x=1733922691;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N0SZ8kQHAsOIZwkil/k0ov1BrW4/jp+99A2CjCuwyeE=;
        b=WKoYM8aQ1K3+kY/MNf6qBUuRIAA1Bpqk34I0JNYYTPWi+lGTXqMBu3R2VgvPkqINn7
         VUE4Nwq5cYeknAp85Lte8F/cQvny1wDOhM5tmi7JHRw91V+eJbLWIMksqJB2rmck7vwK
         AFqJzXkeJfWxRJwKrZUgRpSPT/8WvTF+zwsbjcLR8rIjkrDjMk5FMD4ckxJDINjr4Roq
         uMYsEoSfmXtsno7mR7eLuOFPJrpbRoV8uc6yNsLLrukXaieL0aPfy3ucHF8vFqVMRPc0
         C1js2Lx7kNefjojtP5Ib5WC3kamlvzmZst5/AL7WJxQv4C5/8ol+2W5z3gIhDEmbCpfV
         nW5g==
X-Forwarded-Encrypted: i=1; AJvYcCVI2VsRlTjZx8ySuE68uONHl6WAoEGqdy+tw931wOIyeR3+Wop/HWi8K614YsWDwD/eufzmjr+/wUeLgnJxNBvMvLc=@vger.kernel.org, AJvYcCXtPQ0/jMj4DCJ8IghVv0bqEj4S1IPwjuT8+ldrx0DY18YhY8PYf2Brgc6b8GqzOkRYVJL4aJAD4ct/hFI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwGnb7H4K5TXKJFQf2/G8sfBzzWEHuvYanTsowj4yNlhHJsy+6
	xeWf/P6wDTDlHFeE5Ytobs21v9Er3hNxwOFKNCSWz3hXZqEAls0ClwesCw==
X-Gm-Gg: ASbGncsqLqJWmMqUKS/eJoExGaYkpUjMh2nvTgHhTWwiMjnsFcMmL8q3VLecrc41jnp
	eIo88ZJpyVnMfuYTrRMud6jERPHHQdLqBUV3HdyU4xDgg7eXjoHNU1CAJQ64iLOsi4NS/aBS3n6
	kcFHYzOMRApDR/rDcrCT/tqoFmp/T/2NYKr9o5rzwBPMfCRGKuvXoTwnuX6USlJlH18G6qFSRtZ
	7u+ziFpE1MF09v5rqcawrE+X5+4W4SFX7PwK66OU6omrCfGAFWPHYcQWqQYTg0l4zT1zHF3/xWh
	zl3sV7Xtud57YK0CbekN
X-Google-Smtp-Source: AGHT+IGuZnkOOfZUxBSm0+r4WvUzWEwuuklRNTCmho0DrzlTwe+kaD62v7h9w5mevqqGbuXembhvLg==
X-Received: by 2002:a05:6000:18a6:b0:385:f44a:a64 with SMTP id ffacd0b85a97d-38607ad0280mr3654189f8f.24.1733317891110;
        Wed, 04 Dec 2024 05:11:31 -0800 (PST)
Received: from tom-desktop (net-188-217-53-234.cust.vodafonedsl.it. [188.217.53.234])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385e30c54bfsm13145015f8f.110.2024.12.04.05.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 05:11:30 -0800 (PST)
Date: Wed, 4 Dec 2024 14:11:28 +0100
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Liu Ying <victor.liu@nxp.com>, linux-renesas-soc@vger.kernel.org,
	dri-devel@lists.freedesktop.org, biju.das.jz@bp.renesas.com,
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
Message-ID: <Z1BVADAhfENdcc3y@tom-desktop>
References: <20241203172129.778123-1-tommaso.merciai.xr@bp.renesas.com>
 <834a2690-ca06-4a8b-9a81-c4981074f95c@nxp.com>
 <Z1Aw0WafGmYDrr8K@tom-desktop>
 <cnauwpk7myky6zbfcqg5335dqif4vmggzxlq554ye2bykb5iwh@ng4oxd2c5md3>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cnauwpk7myky6zbfcqg5335dqif4vmggzxlq554ye2bykb5iwh@ng4oxd2c5md3>

Hi Dmitry,

On Wed, Dec 04, 2024 at 01:53:44PM +0200, Dmitry Baryshkov wrote:
> On Wed, Dec 04, 2024 at 11:37:05AM +0100, Tommaso Merciai wrote:
> > Hi Liu Ying,
> > Thanks for your review.
> > 
> > On Wed, Dec 04, 2024 at 11:34:23AM +0800, Liu Ying wrote:
> > > On 12/04/2024, tomm.merciai@gmail.com wrote:
> > > > From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > > > 
> > > > Introduce it6263_is_input_bus_fmt_valid() and refactor the
> > > > it6263_bridge_atomic_get_input_bus_fmts() function to support VESA
> > > > format by selecting the LVDS input format based on the LVDS data mapping
> > > > and thereby support both JEIDA and VESA input formats.
> > > 
> > > ite,it6263.yaml says IT6263 supports vesa-24 and vesa-30, while
> > > this patch actually only adds vesa-24 support.  So, to be more
> > > specific, the patch subject and commit message should reflect
> > > this rather than claim "Support VESA input format".
> > 
> > Fully agree, thanks.
> > I will fix that in v2 specifying vesa-24 like you suggest.
> > 
> > > 
> > > > 
> > > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > > 
> > > Can you please send this patch with your Renesas email address
> > > instead of Gmail email address?
> > > Otherwise, add a Signed-off-by tag with your Gmail email address.
> > 
> > Thanks, for the point.
> > What about adding Acked-by: from my renesas email address?
> 
> Acked-by has a different meaning. I'd say that generally it's okay to
> have this light mismatch, see [1] or any of the emails that B4 generates
> for web-based submission.
> 
> [1] https://lore.kernel.org/dri-devel/20241121164858.457921-1-robdclark@gmail.com/

Thanks for sharing this example and for the clarification.
This is similar to my case :)

Then v1 procedure is correct?
I can use the same formatting (From: Sob:) for sending v2?

Thanks & Regards,
Tommaso
> 
> > 
> 
> -- 
> With best wishes
> Dmitry

