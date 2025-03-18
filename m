Return-Path: <linux-renesas-soc+bounces-14604-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 52591A67B72
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 18:56:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D7533BFF41
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Mar 2025 17:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1205C212F98;
	Tue, 18 Mar 2025 17:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jeBs+xmx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FBF21019E
	for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Mar 2025 17:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742320604; cv=none; b=o1zpBhK9cE5KbAxp25Ni/i36e/Ew9Y2BOFmzxFQ1n0q5+8Zavft+5tubi8AHcBeraXjBM2o4wPBYPYRUr4F5D7q4nwwhHEBfHz2fM8RIsOOD48xTE4fhq21t8Fj9QMrlwb7u7TelEL8V3KW6p7Zw6Wf2C5aQEXOF6lUMbB0DMhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742320604; c=relaxed/simple;
	bh=NLXl7cbouL6yGtBE+YySGWzp3SaYJ4IoNQECLsIUq/s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HuaNXy6nu0IFCmcOEqAXWGK2IwHUgstDb4W8z9Fk0myEM68Fubfv0ViRcD/XQOu5xwBJIAB0w4tCQ9Eb3hclkgqiTFK1z9Ooqd7QADLVqOIcfnFuc9flhdRxaFTPMqLaJh3w6610KUGwJ3LQazEc4TEFx6zWN+m8urQJmtSC8Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jeBs+xmx; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30bf3f3539dso59128621fa.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Mar 2025 10:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1742320595; x=1742925395; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ptw41iPQYR6728ZX8PJ0GiZO8H5LJxzZSU14XuXmLA=;
        b=jeBs+xmxIA0WNSx/8UQtprkAVZPFuRNmsBrLuiQ8d5h/taLs+O1fi3xcIgIKrUTVi9
         XjhqCuhfTgqmOT4UwbS378cegkpzVUnF3g7kVEMiLMJjZfyBlA3/KCvuNfgN9tw2g9po
         4lkZjpP+Q5oT1gXznlz+9w5mKwSzxk8WyEu0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742320595; x=1742925395;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ptw41iPQYR6728ZX8PJ0GiZO8H5LJxzZSU14XuXmLA=;
        b=lyThqfjqKRhbUn2IIBhuEK9CNdbiaEo/4wg9Yd6O2bUct0uRsAmA7oKyEwyGKnfsfG
         uaZ9IgPGWGsPjiP//VoXyowyvw2FXYuRFYQxjakhoYVZbGpAm/TIiAZ1SPvAwVlxJBlQ
         Kycrw0bQk96LKxindaKo0GPM6IwQjcvY6NUajX7Kt7D+Pk1kMcDhpfIDSTWwej6qcbry
         VO0hjBJmkbFSF2zexUOCMO8ulJHg9yuf6hd/5ODefgvTsXiyt4EDtzHeBBJ2rvjzTFhs
         o4GlgZij92dRnkC9yhO3wrpm029f6hFYtWHZ7Lw01esDBaGa6gELz8cgctCAmyGZq41n
         0GDw==
X-Gm-Message-State: AOJu0YwKdRzkFKYdAE0ioYvzoiacRkKV1nIojRVALF7S4kZWIdVpf6MB
	DK4Ux8bBWqesuh5FB9eyDsqH1+ax3Bo682/3BmjARzSrp8dKwP0iEC4anhX1ShY7HbFTXc5VMpS
	Prg==
X-Gm-Gg: ASbGncvhesfiVDvjWVvw/ldb59vOXG2FYU8cJ82R4h9f+CIkKHtQ4Vg0rNLlkrf7bXt
	F4oVCg1CvmXV/mUDOJNw1hgu0NdR34nP89FVQpa1aMTSLxjFTlSoPBa6xaYGNRiMB78V+kTCh5/
	UvULS7C1rnibb1EJMzYjtaeaIShOhW7JHgjATAn8Qwg8ofZL+SuMkTp0/GnAR6KmAIkcBmubYUn
	xYE/iuTzBEKp3nPlbPKfEf7+TE7qmMBzcoxlmA/ZGzTkkVLZMXNYQO8UNkqsmTwDG3uxxGaLSsV
	pkhH8gZVdZP/TGtlJSt2c/Nx+17fIYkZsUy6MQM9KW82iXKn9FYl2OLoBDveOQ+sWj8Yzs04GdW
	vGheNLgj0
X-Google-Smtp-Source: AGHT+IHJU8A6Bi4LqAKbCgACgDJM3YPsrwfT7Y44hSi9WFQO96Grhhm+Toys8FmtdpnalrRHe46qlw==
X-Received: by 2002:a2e:b982:0:b0:30c:433a:2886 with SMTP id 38308e7fff4ca-30cd95bcdfbmr26564311fa.8.1742320594936;
        Tue, 18 Mar 2025 10:56:34 -0700 (PDT)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f1da7eesm20829831fa.100.2025.03.18.10.56.33
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 10:56:34 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54957f0c657so6163347e87.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Mar 2025 10:56:33 -0700 (PDT)
X-Received: by 2002:a05:6512:10d6:b0:549:74a7:12ce with SMTP id
 2adb3069b0e04-54a30486a73mr2802359e87.14.1742320593086; Tue, 18 Mar 2025
 10:56:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250318155549.19625-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250318155549.19625-2-wsa+renesas@sang-engineering.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 18 Mar 2025 10:56:21 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UNHE=T0nOAcAskJy2L=ZUsRVvdKdcSi+3TEGqgSnjr_w@mail.gmail.com>
X-Gm-Features: AQ5f1JovMX3_JB9V8QSJq3W_8Y9VFCM5iRqj4YkpDH-gdoHjWKF2FDKzoiar_Ok
Message-ID: <CAD=FV=UNHE=T0nOAcAskJy2L=ZUsRVvdKdcSi+3TEGqgSnjr_w@mail.gmail.com>
Subject: Re: [PATCH v3] drm/bridge: ti-sn65dsi86: Check bridge connection failure
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Mar 18, 2025 at 8:56=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Read out and check the ID registers, so we can bail out if I2C
> communication does not work or if the device is unknown. Tested on a
> Renesas GrayHawk board (R-Car V4M) by using a wrong I2C address and by
> not enabling RuntimePM for the device.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Changes since v2:
> * switched to a new approach suggested by Doug (Thanks!). We add a
>   dedicated read instead of using the first read. This prevents creating
>   the aux devices. As a side-gain, we check now if the chip at the addres=
s
>   is really the one we want to support.
>
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Looks good to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

