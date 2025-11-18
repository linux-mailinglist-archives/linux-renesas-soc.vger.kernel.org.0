Return-Path: <linux-renesas-soc+bounces-24744-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id A8611C6B216
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 19:11:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 28D2935674A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 18:11:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1121B3563DC;
	Tue, 18 Nov 2025 18:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y+/sDbgu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47549349B0B
	for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Nov 2025 18:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763489472; cv=none; b=t5cEaZBPOLW4wMs/iRd3FoBKAlMM1wMr+QJYDrz3s4GfA1r2yZZWf0+zmSgQiCN4mhCM0eXSyDcBrzZDfNrnRhP4/JcMDH4DZ/UW5/CoumCUPcyK6FJWOk31oHQc2LNrJvIpd0BFHlKhdwkknveEYbk2VCcAGYKF75mBj57oj4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763489472; c=relaxed/simple;
	bh=jpvaXJfOVoTjgbXNgGWkL9BDcOnKOa3gc5k4E4NdjrU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vm+lkVknsQ4p10SIcWtoYSRJowamlLmzt6TER4aECyY8fN2AUg/7/2rOQN7ORtlUWuIUfcP/ErkkgcoVmEfyLyfAD56wtsvGrUQhrQnDQqfGrR2hQbr4GC6lbiMx7VS7nIYVVwH47pjwKrf57CY0t35C5woHNjTvPZFTKVHYFMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y+/sDbgu; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-78677ff31c2so50050507b3.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Nov 2025 10:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763489469; x=1764094269; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jpvaXJfOVoTjgbXNgGWkL9BDcOnKOa3gc5k4E4NdjrU=;
        b=Y+/sDbguKfH/oG9Dlw99vVlprfpuGwkWaJU2u9JJOAF7/JPTrE3WyKJ3kvCLxGaHkZ
         su5zSHyiHOS2i65AokcU5Ps1kRqKUjwqIWUwFNl1NCfNgiDwO1zOP6qHF6dzJ7JesJ8K
         IIU3kRx76Fr8FSmmocLMwFdo60hHbMwzLOWMaPdc8YlgEfMqbvlW0yMaPC+3VuobR4Vq
         sedF2VnTF3Vb4Mj1Q1XwrOcDE3ancF6fd+OCeT8NWu3H+mtBTU1bHJZMZEIKP9bE3ans
         lALjKjblt86aDkZxqZSilDEom/C4PjmqthR5rEpYQnVW7iuz3hMqTHfZU6JyghAHBoVt
         szcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763489469; x=1764094269;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jpvaXJfOVoTjgbXNgGWkL9BDcOnKOa3gc5k4E4NdjrU=;
        b=CoM+cbh18teogDGEaeu6yVoP8a5nqZzn+DIVruGtchKZgSayMVUBWYPtVFCpsMOuyV
         u3IIkRMNX1C/90ZtxuoIFsR9TLWq2VqJq1kfn5GpO9VtqonHSTkOcMdLg52uHfFiIWrW
         uL/ALMf44whQ/h++jaQmAVpKS8Qc0yyBrPFFoFALRBxTWzOQM3L3OIouwlgmOeC0wLmP
         +FJV6r6EOsDV63xySZ4+jH9INsvMTqzQT5wcgxBw1gFVtU0TXHV5onIhDp8Dk3W2EpmA
         TvDWjwCoWcg5XlRVjgJJiu05c+7/lJlg3dvJp+C3j1ij4Zv3DA9a5R0TyCLAzZt4xB/M
         NZ6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVWUb6kFIrS6Pj+9XZ55gr2Zx/tfykr+hh2/RF6VxxAtYP79HHyio4oXRy1b2vCRQkcQCJOKK3xKOyzt8vIYLzCWg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1DffRv48ukq0FsvLvtgRqnqwFgehkyuS7nDpemMj7adzuxQ7n
	y7OPS5SjxRgs+LF5CKmMhQP65jIPcsrTu1/X5jVbs55Y7qu56NN4be2g1sSjdjDgk/q/VirhMWj
	1byofrrAf2qVlrQSgK1h29UU9akRqgRn23tERZ8A50g==
X-Gm-Gg: ASbGncuAM7+JI5X7zRNJ4kYCw2LNz+zVtCTgkNLv3pvSCrLxlNVrWYmlzeCqwnJZn+T
	7oJ+WDB8RpVrlK0hHFX5B12C7OW0RylVFdh9ftgACVyM95/SrcT3ZjdS2u8ltKfzx0pJ+Bx/ggY
	/NizMvaYHeltWExwYG0FCjHyew1xyLIosph9fKGPjjz2Fl+E14/OyzwhJymPMmqam1IwwoT7MjP
	0nSlw+yXZG2t2llwf5256MTYRqDeeJU+nd1dmqtcXP6kfgI/6nRsHthK1EaKy/yl+961a4+Tnes
	sa0RJ2UApodH9UfA
X-Google-Smtp-Source: AGHT+IECflaUuFa+0ZacNkRiCjedWF8R8Br3a4cb0738VQ5sCUr6kbV00q5G5P2nif7qYRQAyYxT5GB5fvMprMy7PoM=
X-Received: by 2002:a05:690e:d41:b0:641:f5bc:696b with SMTP id
 956f58d0204a3-641f5bc73d4mr10515129d50.71.1763489469009; Tue, 18 Nov 2025
 10:11:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251118-mcde-drm-regression-v2-0-4fedf10b18f6@linaro.org>
 <20251118-mcde-drm-regression-v2-3-4fedf10b18f6@linaro.org>
 <20251118150128.GB23711@pendragon.ideasonboard.com> <cncl6nwbr6fu3nvhz2y34ou4geqzo7hjf3wpukmm4t6utvygor@t2v4smey5ful>
In-Reply-To: <cncl6nwbr6fu3nvhz2y34ou4geqzo7hjf3wpukmm4t6utvygor@t2v4smey5ful>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 18 Nov 2025 19:10:47 +0100
X-Gm-Features: AWmQ_bnyAy9o1iHkh7xeFmBbCHHVK-aDntEPafslHltaVQIymndnehiGpH_UPFU
Message-ID: <CACRpkdYh9nSBtqU_8w5gnkWOc+Dw7fW3tPinm6JjfXMbdEJOjg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/atomic-helper: Add special quirk tail function
To: Maxime Ripard <mripard@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Aradhya Bhatia <a-bhatia1@ti.com>, Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 4:44=E2=80=AFPM Maxime Ripard <mripard@kernel.org> =
wrote:
> On Tue, Nov 18, 2025 at 05:01:28PM +0200, Laurent Pinchart wrote:
> > On Tue, Nov 18, 2025 at 03:36:05PM +0100, Linus Walleij wrote:

> > > +/**
> > > + * drm_atomic_helper_commit_tail_crtc_early_late - commit atomic upd=
ate
> >
> > Based on the function name, it feels that the nem commit tail and
> > modeset enable/disable helpers reached a point where we may want to
> > reconsider the design instead of adding new functions with small
> > differences in behaviour that will end up confusing driver developers.
>
> Agreed, and I'd go even further than that: we don't want every odd order
> in the core. And if some driver has to break the order we document in
> some way it should be very obvious.

Is this just a comment on this patch 3/3?

Or do you mean that Mareks new callback
drm_atomic_helper_commit_modeset_enables_crtc_early()
from patch 1/2 should go straight into the R-Car driver as well
and that
drm_atomic_helper_commit_modeset_disables_crtc_late()
patch 2/2 should also go into my driver, even if this
is a comment on patch 3/3?

Both patches 1 & 2 have a lot to do with ordering, this is
why I ask.

We already have
drm_atomic_helper_commit_tail()
drm_atomic_helper_commit_tail_rpm()

Does one more or less really matter? Maybe, I'm not sure,
but if it's just this one patch that is the problem I can surely
do it that way since we're only calling public functions.

Pushing the first two patches would be more problematic,
because they call a lot of functions that are local to the
drm atomic helpers.

Yours,
Linus Walleij

