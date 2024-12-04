Return-Path: <linux-renesas-soc+bounces-10905-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 170A19E3B5F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2024 14:37:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC1CA285ADE
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Dec 2024 13:37:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC5571E47CD;
	Wed,  4 Dec 2024 13:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IlHKdxK8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF60E1B983E;
	Wed,  4 Dec 2024 13:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733319414; cv=none; b=B7WNIyjb443cCrAJMQgYSwyPwVttR0XThqaRwoVjcpluFq1DZ6RsbMFN1JmjZITubpKytOaLS9nJts7bEM5b49rHHIIoUeKuhyMR63dfSA9doDXIEK1frjaV5PVKV59KBav88o/yToW94dnG6D6jUlMVtlgb5ClJ23/BqcxZWgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733319414; c=relaxed/simple;
	bh=bY4wTNpgrIodKEHThXb/JWuJnyT4kL7ZX6PteGpmmfA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sUb87k86TZHTKGz1D1ajfT4bdTgQruCrv0wX2n7Ya6Z46pMI6oXUDPuk3nfYnnhIFOEjvxuQoEO7FpXzkUIFb0wAAe7AFpuLLbTizMaKg9jIdOx3YHEppbQDhj++2MgOcs37I+Xj8WBfCfkIXu5Et6XlsRF7PQxxVnrQ94cpMcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IlHKdxK8; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-434a2f3bae4so63115695e9.3;
        Wed, 04 Dec 2024 05:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733319411; x=1733924211; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7960s/O5mUmVapkBN/GngD9f9VoYAFaaF9ndN6PJOGg=;
        b=IlHKdxK8vXXQeO++buozvj67IErsvpBJgWqdv50pdPfXGZ3PEPCIvFX+RzTDjJP9L+
         eIi1UmTEtr8VcO1BTAEQ2rJuDuuPrwVMvXleSTuUxgIZbH5U/OcikkxnB8r/HiCbKidW
         VW8Smc1JiGcsLQqgk8JQhYejjLRoN7THfWEuprY1i3RV8yuNzWWODvcFjWWqcCNOTsIY
         OxaJsBy6vJSUTDURQnIVsNgGwqBaVs/23dfc/evzVPsh/t+v8y34nt2QXoIyymDlLNh0
         84TxPp7h/NuKWbgE658Gj9lYgS1VD/EMdcvoGgoUQJiaIKESTCmJ6A7whOzjyTPz7dtt
         ww0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733319411; x=1733924211;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7960s/O5mUmVapkBN/GngD9f9VoYAFaaF9ndN6PJOGg=;
        b=uStJJUC+4Lvre/dbV392iUvm5VEV2gA7UohkXIodCM9/qk7jivkTe6pQByT9bvDked
         AVBrtXUGqfFTDME3Bij/O3uc8dxjBtZ12cnO78LNjFufwcR0KSEKNt5B9sfdEKBevvO1
         DUyXFinJ1mdjL+z7Im3uqtduv2u2iZLd31P1/Byw2hLmHSTBQva0ZpALLUTjzCKyuQ4y
         5fIzMNvcbhwEnnuxUmGUHlmJFuIKeotbCxaJXZ96808FkAjA3VSMTMwuSdFKmGb1dK6V
         Zini+D+fRpBHrt37qHZFvqmuAPskX5aK2eUHnO2cUz5KIMttRbvm/Z+mRS/KhDkJCSvB
         osDg==
X-Forwarded-Encrypted: i=1; AJvYcCUjRYR1szx4cQg7T72ns+8HKnSJOy8lW9Js9gj6ZWGXhzFmXjFM0gj17WTwO013sNU902uRcYQ1TwnbO4U=@vger.kernel.org, AJvYcCXQQGKbjCIo4hen6saJk7kkVVkYNoHEtdr1Cp4fIWFpjUEux63p9HAex7HaZMss1c/2YKspJEqa5SldjRQyv2IG80E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBqd0JlSZ3JaUY/STCrZzl2K1J+dFfs6E1Dt3ejxT2VUnLrMW7
	amsoqDo0frZmpDe1B2byusfCfvC7zBe58uKWtUkYrWsC82rWzM1X
X-Gm-Gg: ASbGncvg3WGAYlXnpW7NRyVejvuNuLZq3oEQj8ERMw5GgexjX7/gVoh9EtH7lM2NW5t
	xTGkRQqh/7PnzAxyGD6tkXp5UrYHDcoXX3d6PLOqbg3aHKPSnh6jb1aiWzhpxxHs6seW6xPxApB
	xJr0sopu9Sq9pcdyKXIQDTBR2NxVWYO0C2uPBMtc/O3MA4tfm4UU8DHjQZqq5qeBWCVQAqU6m1b
	QZGFc6uT8mv1+bTzC/duGEBm+xacBuvUdkTWcl9hLQEGcGeU3allDK0km0n3fg+apGb8sq91mk3
	8oS7W+BSGH7cexfKDVj4
X-Google-Smtp-Source: AGHT+IHuqzXYWftCkApzMu0AjTlQnxeVbzqOP4HoXbEwEWHCLRq8r1nDjTgJnSq2bW4NJEewZimJmg==
X-Received: by 2002:a05:600c:3550:b0:434:a781:f5d5 with SMTP id 5b1f17b1804b1-434d0a15047mr64205075e9.30.1733319411092;
        Wed, 04 Dec 2024 05:36:51 -0800 (PST)
Received: from tom-desktop (net-188-217-53-234.cust.vodafonedsl.it. [188.217.53.234])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d43b8557sm23177705e9.1.2024.12.04.05.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 05:36:50 -0800 (PST)
Date: Wed, 4 Dec 2024 14:36:48 +0100
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
Message-ID: <Z1Ba8CRrn9G7e6h4@tom-desktop>
References: <20241203172129.778123-1-tommaso.merciai.xr@bp.renesas.com>
 <834a2690-ca06-4a8b-9a81-c4981074f95c@nxp.com>
 <Z1Aw0WafGmYDrr8K@tom-desktop>
 <cnauwpk7myky6zbfcqg5335dqif4vmggzxlq554ye2bykb5iwh@ng4oxd2c5md3>
 <Z1BVADAhfENdcc3y@tom-desktop>
 <7bzqm2qbr5zwwlltvbj77ux4hu5iwuwz25u3hwvgnwak5xyl7k@54wzvunf7cze>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7bzqm2qbr5zwwlltvbj77ux4hu5iwuwz25u3hwvgnwak5xyl7k@54wzvunf7cze>

On Wed, Dec 04, 2024 at 03:33:09PM +0200, Dmitry Baryshkov wrote:
> On Wed, Dec 04, 2024 at 02:11:28PM +0100, Tommaso Merciai wrote:
> > Hi Dmitry,
> > 
> > On Wed, Dec 04, 2024 at 01:53:44PM +0200, Dmitry Baryshkov wrote:
> > > On Wed, Dec 04, 2024 at 11:37:05AM +0100, Tommaso Merciai wrote:
> > > > Hi Liu Ying,
> > > > Thanks for your review.
> > > > 
> > > > On Wed, Dec 04, 2024 at 11:34:23AM +0800, Liu Ying wrote:
> > > > > On 12/04/2024, tomm.merciai@gmail.com wrote:
> > > > > > From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > > > > > 
> > > > > > Introduce it6263_is_input_bus_fmt_valid() and refactor the
> > > > > > it6263_bridge_atomic_get_input_bus_fmts() function to support VESA
> > > > > > format by selecting the LVDS input format based on the LVDS data mapping
> > > > > > and thereby support both JEIDA and VESA input formats.
> > > > > 
> > > > > ite,it6263.yaml says IT6263 supports vesa-24 and vesa-30, while
> > > > > this patch actually only adds vesa-24 support.  So, to be more
> > > > > specific, the patch subject and commit message should reflect
> > > > > this rather than claim "Support VESA input format".
> > > > 
> > > > Fully agree, thanks.
> > > > I will fix that in v2 specifying vesa-24 like you suggest.
> > > > 
> > > > > 
> > > > > > 
> > > > > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > > > > 
> > > > > Can you please send this patch with your Renesas email address
> > > > > instead of Gmail email address?
> > > > > Otherwise, add a Signed-off-by tag with your Gmail email address.
> > > > 
> > > > Thanks, for the point.
> > > > What about adding Acked-by: from my renesas email address?
> > > 
> > > Acked-by has a different meaning. I'd say that generally it's okay to
> > > have this light mismatch, see [1] or any of the emails that B4 generates
> > > for web-based submission.
> > > 
> > > [1] https://lore.kernel.org/dri-devel/20241121164858.457921-1-robdclark@gmail.com/
> > 
> > Thanks for sharing this example and for the clarification.
> > This is similar to my case :)
> > 
> > Then v1 procedure is correct?
> > I can use the same formatting (From: Sob:) for sending v2?
> 
> I think so

Oks, thanks for the feedback.

Regards,
Tommaso

> 
> > 
> > Thanks & Regards,
> > Tommaso
> > > 
> > > > 
> > > 
> > > -- 
> > > With best wishes
> > > Dmitry
> 
> -- 
> With best wishes
> Dmitry

