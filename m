Return-Path: <linux-renesas-soc+bounces-11197-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E10139EB804
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 18:18:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 865701889717
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 17:18:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2E2E23ED66;
	Tue, 10 Dec 2024 17:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IaOOglHM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D30086332
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Dec 2024 17:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733850995; cv=none; b=Rv615QqCNfRjuEy3VHl6RZuj5j9Kr5bRe56MqWW1BQ1pxM7hOnhQBxbdQxODyZvq2hc23RCk1hUlg3zkfpQw05tVqMzR4/jLTv2oMEGIJ/2O4DxJv3i+UuRfr6l8fO4jG0qN6D+SlqeE0MPaaCBmvL0zrtbVYLmWN94HmfygAt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733850995; c=relaxed/simple;
	bh=kmpw+MU85Klv2VgMx3ZqVirEPF5gOEEsCLRROZYzfzg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LjlenAanQv0GlmCqw1FLL1DowNwWjBmclXKa82w8yzwBiJmR0XazC72gws+kX2fXdDTj2+F10NIWeCZ7/tw2l93+p/zl/a5LJeEaBJ3Ko1fpekXUIHpU7mjzxz5YuU5xVr4xI+6QIjgeAt/fiin3Iq1+bIPCtx1fB2/OVYyGhsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IaOOglHM; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-aa5ec8d6f64so697286366b.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Dec 2024 09:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733850991; x=1734455791; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LuhRNegPQNd7+gF/yjuNpjthxXavGQO/1ZgSXezZky4=;
        b=IaOOglHMwSmrFfOnB4GcPSRqJjA0KVpEKpVQ3nkvBb74wG9gHCaSOmw1nzAdhV/ORF
         KIuBpDfhPNuIRJZMTWfAH95Bizk+lwLPZKKJs56rpRmn5WY/DqbmsF9efD8ja7kTwsN7
         +2eRtLkTJupUMb8SRQ3HCeTNneSrUOa1aSV9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733850991; x=1734455791;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LuhRNegPQNd7+gF/yjuNpjthxXavGQO/1ZgSXezZky4=;
        b=Nj96j+Upzv9F0uL4mtoKpeF3t+PVerpWVVHae808mYh8Bz2BYHidAmNoFkKp6FSHzL
         RwAiJJLaihdNgXaLcNhUMie0Dz8bs+qKsNeyUWwDyp9tbWZDgDMzlYboyvclBb08+R7A
         z15F3JIOisfZoM8WV9Kem32lB6gExW/NwIwNLepyWykN+53/fk4B2cE7ZTJeWmxBRyuT
         7Ay2eNHA40zSn+Nt/ZWb10XeMJ+B5QH61MVD3CmLAZ2VfABBB9flso+TB19f+fMxzGKX
         stp78/3ngQvOv00Rd9RAk6ZTJLYi+1WLzxpE890L1QsmDi4zi3UkZIj7QS1j6JJLnZvI
         epOA==
X-Forwarded-Encrypted: i=1; AJvYcCUYEkMPoG8/ADesn3ZvK+9WVrASKMbSRNRbNDTdGQWTLhmpPG85M12QH9Ya0ie8fmX+BpxwECKoZCIvtNUbz07XIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyACo7X0s072J+/UObp1YlBdlYUEulTBm2MsOgtX22P6Mf973wn
	H6ja38IbN5kJJhxcjFu0FsJ/PeBokFV+K4FtHllbmkKoX20OcuGpByFV3tp9VSy4k73Fuoer1oX
	Vxur8
X-Gm-Gg: ASbGncvcgDkA+SJSY5cBximq0rMrkerSLHpy/L+1s/7TCUaZbLePibGTYJrLgeLPBjj
	3dvHxqJHmbBth1LbE+witfaOhieHiNwAr50gw+H3WWJmJ6iJuRN09pCPFecWMPuczBG7ChLG/hC
	SpoZ29VOLLq8u0rJprPJ9mZh6oBAoAzmp1nMNpmeOjcxD0DkiygHZTjPP6/bwCWI0ysz79OU3Gf
	0dSJ7OiRIArso11T6IIyWGOdpiQgfQrFNkkdwf5S9KNUJqXhF+XvYoS7qnMdfI/7uLHill3zSCt
	JUDxhf+v1F2xZ1R7ng==
X-Google-Smtp-Source: AGHT+IFW9xJDZuBM+4jbvJqnL8IdMWV9GarDL92KWrlMd/RbEO5UhbWZKU2FUszJD7vYa6fRPMW7Qg==
X-Received: by 2002:a05:6402:3210:b0:5d0:bf5e:eb8 with SMTP id 4fb4d7f45d1cf-5d4185d651cmr12275598a12.23.1733850991405;
        Tue, 10 Dec 2024 09:16:31 -0800 (PST)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3cf972f6dsm6271575a12.61.2024.12.10.09.16.31
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 09:16:31 -0800 (PST)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5d3f28881d6so3334896a12.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Dec 2024 09:16:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW0PuHBoidX6Cb8K6uiv2BL9IUeOnCd11eMKt6VGUqi4z9U1kfur5bgqUSjap9tElieV0vJ+IzDQ3Ktpwrmha6StA==@vger.kernel.org
X-Received: by 2002:a05:6512:33d0:b0:53e:368c:ac43 with SMTP id
 2adb3069b0e04-540240aac8fmr2378233e87.5.1733850544359; Tue, 10 Dec 2024
 09:09:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <7a68a0e3f927e26edca6040067fb653eb06efb79.1733840089.git.geert+renesas@glider.be>
In-Reply-To: <7a68a0e3f927e26edca6040067fb653eb06efb79.1733840089.git.geert+renesas@glider.be>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 10 Dec 2024 09:08:52 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XpRt_ivSDz0Lzc=A+z3KFrXkVYTn716TD1kZMAyoGQ_A@mail.gmail.com>
X-Gm-Features: AZHOrDkvV4hXVBzL5LdGwv2-ywEkfcu0N74i9maLRg8R7KrBlypjtg_v-QyKEuk
Message-ID: <CAD=FV=XpRt_ivSDz0Lzc=A+z3KFrXkVYTn716TD1kZMAyoGQ_A@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: ti-sn65dsi86: Fix multiple instances
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Linus Walleij <linus.walleij@linaro.org>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Greg KH <gregkh@linuxfoundation.org>, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Dec 10, 2024 at 6:19=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Each bridge instance creates up to four auxiliary devices with different
> names.  However, their IDs are always zero, causing duplicate filename
> errors when a system has multiple bridges:
>
>     sysfs: cannot create duplicate filename '/bus/auxiliary/devices/ti_sn=
65dsi86.gpio.0'
>
> Fix this by using a unique instance ID per bridge instance.  The
> instance ID is derived from the I2C adapter number and the bridge's I2C
> address, to support multiple instances on the same bus.
>
> Fixes: bf73537f411b0d4f ("drm/bridge: ti-sn65dsi86: Break GPIO and MIPI-t=
o-eDP bridge into sub-drivers")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> On the White Hawk development board:
>
>     /sys/bus/auxiliary/devices/
>     |-- ti_sn65dsi86.aux.1068
>     |-- ti_sn65dsi86.aux.4140
>     |-- ti_sn65dsi86.bridge.1068
>     |-- ti_sn65dsi86.bridge.4140
>     |-- ti_sn65dsi86.gpio.1068
>     |-- ti_sn65dsi86.gpio.4140
>     |-- ti_sn65dsi86.pwm.1068
>     `-- ti_sn65dsi86.pwm.4140
>
> Discussion after v1:
>   - https://lore.kernel.org/8c2df6a903f87d4932586b25f1d3bd548fe8e6d1.1729=
180470.git.geert+renesas@glider.be
>
> Notes:
>   - While the bridge supports only two possible I2C addresses, I2C
>     translators may be present, increasing the address space.  Hence the
>     instance ID calculation assumes 10-bit addressing.  Perhaps it makes
>     sense to introduce a global I2C helper function for this?
>
>   - I think this is the simplest solution.  If/when the auxiliary bus
>     receives support =C3=A0 la PLATFORM_DEVID_AUTO, the driver can be
>     updated.
>
> v2:
>   - Use I2C adapter/address instead of ida_alloc().
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 2 ++
>  1 file changed, 2 insertions(+)

While I agree with Laurent that having a more automatic solution would
be nice, this is small and fixes a real problem. I'd be of the opinion
that we should land it.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

If I personally end up being the person to land it, I'll likely wait
until January since I'll be on vacation soon for the holidays and I
don't want to check something that's slightly controversial in and
then disappear. If someone else feels it's ready to land before then I
have no objections.

-Doug

