Return-Path: <linux-renesas-soc+bounces-12605-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0266AA1FFA0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 22:23:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4586E3A2222
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 21:23:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B07B51A76BC;
	Mon, 27 Jan 2025 21:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CIPj4E48"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E651991DB
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Jan 2025 21:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738013035; cv=none; b=ZBojiLPuAQImvn0fTRSED3e/SjGkHAjLh3qWGQVIiSREE6tSop6u4UPWND7zBULsiCoKG6ZA6ti5gqpSimd112OUlSQ3d5AtLLahddlkGw5SYQKCNayEDkbJH6dXTUVpb+6hn32G22HnCPAKkaSO6JKwZvCwVPmRixWNUGjxMmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738013035; c=relaxed/simple;
	bh=IdtCVzn1JaQ315udQsFxF/3xLSUzII26ss9S4wxyp2Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fjg7UrsVmdjP3rPS+BSF5SgsLFqlsrP2CTPegaz9cab3kb+m714Ui6j7fJiRxfNrL8LP669eRZzs0DE5rLsIa8JUqjy/u5Xc2r8Z4Cyf6rcWvWs01USn4w/LFAtnLUN/oDjadlavyl2M8xyL5OuRHYYgaWp9iZyP43OHIDzZbpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CIPj4E48; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-540201cfedbso4808656e87.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Jan 2025 13:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738013029; x=1738617829; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K9z27C3d28PfQDN7/0L4qi1vnTUImbSxfX+feBp7f9s=;
        b=CIPj4E48DG8+8uvTwgaLWDGloPwj3Gu0kvFI/yc1IL3ROhPc1bru+YGvObC89xfx4g
         uB9nBCa3KhTxLFE2WEBeqvbwrDAKBvyg41l/9oAGi3Gehp5SGZJyRkElDLSsZw3OFOe6
         gm61Qnx70GVr14qEhihLqjRUZyhPKr7n6Tp1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738013029; x=1738617829;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K9z27C3d28PfQDN7/0L4qi1vnTUImbSxfX+feBp7f9s=;
        b=X1JN5Ag232BTU9BK8tKImZL/WfDS13LUuqmHnzeU2gEwSY9lHbnb4o9z/usr32xfnd
         19oSijfQXr9xX/znsW3UGK//tmK6OU0+CxOns29zDIwm8UZ1Rj61rjLGl3KOCjw/93gP
         DueGjtLQApqze9ms1jlQfYmYXrO65icL5ySlnFOuMPsGL154QmR9cVQAG8YS0csRHBIs
         ELOyoImeUHGIPmxrJAoKVjMNKyCvpmOvmlHr9JqfBFFyziwGF4nMWCfYSJgWZEGHUES7
         a6ZvW3opICh8G7FgCjeKxUVsaVXfFMfH8c9OlaTtFlKzNZTo7jk1mYEWpeCm9uCuwu8Y
         BrDw==
X-Forwarded-Encrypted: i=1; AJvYcCVnLBwOQ0pSUXGMXL0pzNqP2e7ut63/jxxntMJ/EMdT+uh7gC5mTjOLsB6KjUax3q4I1/qldZJnIhCoy4PN8BRgeA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa8QzqiUxLJFoFmEhDlzYpqtQIY6jiLXG9iGZ12HymMQCgZibx
	jUI9rYCxgqtX0fKQnCaKIP0/bj+9neGjzoRL/4enOUdHelMIxB/acV7pVus+9MidBuYZMSD1oJQ
	dI19W
X-Gm-Gg: ASbGncuFS8d6Sx/djMERx4ai4tz9rToAhUai/KWipLIF/wcJ2citW0KorMhTDeJ8xqA
	ULRpvb0wCNqNOaXmpGKqCS7h/aXZjmD4KexS/VmFQwu1w4t9D56P6UEmF1Ayy0eBhC8JXsy1AI1
	8z5iO6rb2c6V4qmjwIJyPZbKI6xz0hJcqBDL+uvQGMj8GzN0DhM+fPzIpCABiJhlu1yc98MlrzC
	4WQJ3yNmFz57yDETgM3/9Il62uqW6LID2rsMmcmf+K2iqdEVDK0rHJcoPj1Pp9b9OfgI/31m2Z+
	bIKQOFHWx9mdv8HRFQEGJROP5a09OExYF38vGxQZkeF7
X-Google-Smtp-Source: AGHT+IFkWM0l/Si7QeOa96hRvWRUYI+t9AiSXHamr+HhhxV84Xzt4yw+WI9JEeH5upzNZNf105hmGg==
X-Received: by 2002:a05:6512:e83:b0:542:2991:e984 with SMTP id 2adb3069b0e04-5439c21f2a4mr12857494e87.9.1738013028913;
        Mon, 27 Jan 2025 13:23:48 -0800 (PST)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c838166esm1421476e87.235.2025.01.27.13.23.47
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 13:23:48 -0800 (PST)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-540254357c8so4964882e87.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Jan 2025 13:23:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXiv30GjefEVZeOqTtkV0TsB2uMn21z9A/EVXPaQP2biXOrRGe6bJtIXSlzbelQvYv47sscTK4U7uAcH5S2mjNj6Q==@vger.kernel.org
X-Received: by 2002:ac2:4142:0:b0:543:9a61:a2e7 with SMTP id
 2adb3069b0e04-5439c285a52mr12377284e87.48.1738013027148; Mon, 27 Jan 2025
 13:23:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250125125320.37285-4-wsa+renesas@sang-engineering.com>
 <a3hrta4eiiknuf4sukk27xewhhirzf43u2eeefnpjny27m4x5s@aifvnevj7cb6>
 <Z5c7vk_oa8HGt7sS@ninjato> <hywmnv4jf6ix2ziabdftd5zcjqnkfq6pmqxqzw6spc76camrxz@jn5vr4mgj37v>
In-Reply-To: <hywmnv4jf6ix2ziabdftd5zcjqnkfq6pmqxqzw6spc76camrxz@jn5vr4mgj37v>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 27 Jan 2025 13:23:34 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V_cs1mc-6LJ21OYbTc8=_3RQYEOBACOSE1iX2woa7nXg@mail.gmail.com>
X-Gm-Features: AWEUYZnx38IXHrmZ6BFesBeUqpYTbDF-scbQFr7zXddXc-88xwqYhvygpTf_3Tc
Message-ID: <CAD=FV=V_cs1mc-6LJ21OYbTc8=_3RQYEOBACOSE1iX2woa7nXg@mail.gmail.com>
Subject: Re: [PATCH RFT 0/2] drm/bridge: Use per-client debugfs entry
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-renesas-soc@vger.kernel.org, 
	Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, 
	dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jan 27, 2025 at 7:34=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Mon, Jan 27, 2025 at 08:54:38AM +0100, Wolfram Sang wrote:
> > Hi Dmitry,
> >
> > thanks for the review!
> >
> > > > The I2C core now offers a debugfs-directory per client. Use it and
> > > > remove the custom handling in drm bridge drivers. I don't have the
> > > > hardware, so I hope I can find people willing to test here. Build b=
ots
> > > > are happy. And for it6505, it even fixes a problem. See the patch
> > > > description there.
> > >
> > > I'd say, it should be done in a slightly different way: bridges have =
the
> > > debugfs_init() callback, which is used by drm_bridge_connector (and c=
an
> > > be used by other bridge-created connetors) in order to create per-bri=
dge
> > > debugfs data. Please consider using it to create per-bridge debugfs d=
ata.
> >
> > ACK.
> >
> > > Note, that callbacks gets connector's dentry as an argument, so bridg=
es
> > > still should probably create a subdir for their own stuff.
> >
> > I wonder if this is necessary (I just looked at the code and have no
> > hardware to test this, sadly). It looks to me as:
> >
> > - DRM has already debugfs infrastructure, yet those drivers don't use i=
t

Yeah, I think ti-sn65dsi86's debugfs code is a bit older (2019) and
predates the debugfs infrastructure in drm_bridge (2022). I only added
the debugfs code to drm bridge in order to get it for panels because I
wanted it in panel-edp, but glad it's useful for other cases. ;-)


> > - but they should
> > - the new I2C client debugfs infrastructure is, thus, not needed here

I don't personally have a strong opinion between using the i2c client
infra vs. the drm_bridge infra. Both seem better than how we're doing
it right now on ti-sn65dsi86 and just putting the debugfs directory at
the top level. ;-) If Dmitry wants it to use the drm_bridge infra that
sounds good to me.


> > - DRM provides a dentry to the callbacks which drivers can "just use"
> > - all drivers I looked at just put files there and never clean up
> >   (because the subsystem does it)
> >
> > So, from that, I should switch to the debugfs_init() callback and just
> > use the dentry provided?
>
> Yes, please. Create a per-bridge subdir under that dentry, but I think
> that was the case anyway.

FWIW, when I look for the debugfs file created for panel-edp.c on my
system, I see:

/sys/kernel/debug/dri/ae01000.display-controller/eDP-1/panel/detected_panel

The "panel" directory gets created in
"drivers/gpu/drm/bridge/panel.c", so if a bridge created a file
straight in the dentry passed it would have gone straight to
"/sys/kernel/debug/dri/ae01000.display-controller/eDP-1". ...so you'd
want some type of directory under there. In ti-sn65dsi86's case you
could presumably keep the existing behavior where it creates a
directory under there called "1-002c".

-Doug

