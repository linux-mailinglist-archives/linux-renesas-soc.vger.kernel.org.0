Return-Path: <linux-renesas-soc+bounces-14777-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EC8A6E014
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Mar 2025 17:44:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 27BCD7A3D7E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Mar 2025 16:43:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9BDC262D1D;
	Mon, 24 Mar 2025 16:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EESwV5EN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0718925F997
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Mar 2025 16:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742834656; cv=none; b=SfRYAS1mUnM1zk0lIuhFdXU1lwDOb//dBSXVQKDiflvQ7hQB97TTAehBibTSpPFT1zjeuUGLTW7aLox3dyLU7S389e2J/ztIKKEoekno4/mKQEK5KLaOPuFbLJwNnmTFrzY0B8+tzzOz/tBtdWNa7MQkbW0W46ZBFVDB0iM84Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742834656; c=relaxed/simple;
	bh=dtOgv5+vHOeOZCS8ZkD+UfaHxhqpt+9/qkQphuW5ApY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CSkOV9dRcoayHJwc9WE40tDxqoHvOOFdGklrSlS9+hmFexa6eYbRXkR3KEFYXU7+l/+ReXUeZFim9PuZApQuu67h2wny8AbLO/ORvfkq/X1lW33QebBQ8lGXs+/Ug4eZ1y4+AQfV54Yi1a4PENhE7ExcUK9g2OCn8XFDJoEsKkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EESwV5EN; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac2af2f15d1so614110766b.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Mar 2025 09:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1742834652; x=1743439452; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gRKqfgDsRXrCJD50JjVrfzsEqczQFA94Egvgh0Ek2Oo=;
        b=EESwV5ENpvkNljpuRhBTTx2fdpy42wacR1pK51ontOF+wdgloRTx/00q/qzWh4ub32
         KQ+h+jlt3L+liQ8W6uAsHrA0P8IcVzOLEn26MV7pW6kvHz2IuMWwptPBj1cfqRdAY3ZF
         Duxo4HQkkMFGUY/+noG8HpHpAsXJJ0bvsG3cQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742834652; x=1743439452;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gRKqfgDsRXrCJD50JjVrfzsEqczQFA94Egvgh0Ek2Oo=;
        b=NJHoA4BHU6IZ4+/blIeDzJ7dtiiIh6uF3CBhcYqPH2dxaeujdM7xY/DGd6ZyEZ/ul8
         1cNuLUpxRV4680Z65EypdrtQyiupovSlBlqubxzC5AxPE41p8K8UspASroZte/++zX+U
         fArhJnzN0tCIsg01F95eoPBLoQFXjurliChCsqviAJk6tpSZjy5h8SxqJynBJP+3PhER
         o41i1ntVWhYMgC7/ss4oquGQ4HDTegJysXwH98c1hYTkRRZ7Yp5QQZe41Xmm1AxvaM5m
         NfdacycZ4l3wvVhcCACZ9DwfJk6LFRuJXmndZn5yWCd749Mrcf6dWL07HiziiiO8XVhi
         pNmQ==
X-Gm-Message-State: AOJu0YwDPvfSl57DAlFT1aUwM7z6oOCzsG/u5GupeZ+rs5E0/i7KURIz
	OUaudxHTFyJi/qjB2wY0+g9o/JuRIjPMRlQ968M9hSA3FzzduEWXIS/hBYU+HSvKdIIeowwA7IN
	MzTQj
X-Gm-Gg: ASbGncuedKGeyTrIJtuxwoPxFGpH4xhQzMg3k/xThyT8GVyDC6903/aEnkNCqWAp+57
	aLd8FsuS/2z4uu3+YcwSpqrz36yXW4PMP3uwpfpYsyDrIkTJQeAGj2MoLfjaejLKtww+pFudUTt
	bNmJ41Ze5jsdYIYn3AscUgWJgDZsAVLxotQBx513blBlbIhoKxuesrLSaqrxmjQWtGemIRli56W
	eOYJBqA665uhicdtnHB2rr2ajWMUXrcxgLkydZcJkmXdNtFQ02MG1lfYbOdGTmrRFKk46MYeeZM
	NlH0UIJ2KNefYkDfPUTs3uWdHzrw1NTyZeyRNpVcRQzTLj8DpdprsyfFl4Dj21ThZbmSEMPS5jp
	nxd1NwuDb
X-Google-Smtp-Source: AGHT+IG1mFhwSrgV1vOfPIBgBC8+5sDIl1e9s96MzUszGjVTTmlDOEeb8Ox8p9Uhj6sBoYK7xqkQ/w==
X-Received: by 2002:a17:907:8692:b0:ac2:a1fd:551e with SMTP id a640c23a62f3a-ac3f2560055mr1144050366b.55.1742834652136;
        Mon, 24 Mar 2025 09:44:12 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3efb52c17sm708882966b.101.2025.03.24.09.44.11
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 09:44:11 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5e5b6f3025dso7120113a12.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Mar 2025 09:44:11 -0700 (PDT)
X-Received: by 2002:ac2:4e0a:0:b0:549:8d60:ca76 with SMTP id
 2adb3069b0e04-54ad64f08f2mr4073123e87.38.1742834245765; Mon, 24 Mar 2025
 09:37:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250318155549.19625-2-wsa+renesas@sang-engineering.com> <CAD=FV=UNHE=T0nOAcAskJy2L=ZUsRVvdKdcSi+3TEGqgSnjr_w@mail.gmail.com>
In-Reply-To: <CAD=FV=UNHE=T0nOAcAskJy2L=ZUsRVvdKdcSi+3TEGqgSnjr_w@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 24 Mar 2025 09:37:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UQDVbaa5rJUHCBmh0p3R++h8e4V_QYwroTQ88FeCW+OQ@mail.gmail.com>
X-Gm-Features: AQ5f1JoJDHVF_bUBKmfdPGcifzpI7iveAYPcSyjRJ3YSy2-xkWhgB0J_M-mQ6vw
Message-ID: <CAD=FV=UQDVbaa5rJUHCBmh0p3R++h8e4V_QYwroTQ88FeCW+OQ@mail.gmail.com>
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

On Tue, Mar 18, 2025 at 10:56=E2=80=AFAM Doug Anderson <dianders@chromium.o=
rg> wrote:
>
> Hi,
>
> On Tue, Mar 18, 2025 at 8:56=E2=80=AFAM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> >
> > Read out and check the ID registers, so we can bail out if I2C
> > communication does not work or if the device is unknown. Tested on a
> > Renesas GrayHawk board (R-Car V4M) by using a wrong I2C address and by
> > not enabling RuntimePM for the device.
> >
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > ---
> >
> > Changes since v2:
> > * switched to a new approach suggested by Doug (Thanks!). We add a
> >   dedicated read instead of using the first read. This prevents creatin=
g
> >   the aux devices. As a side-gain, we check now if the chip at the addr=
ess
> >   is really the one we want to support.
> >
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
>
> Looks good to me.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

[1/1] drm/bridge: ti-sn65dsi86: Check bridge connection failure
      commit: d69362f55fba92eb4cac10fe8da618de52b49bfc

