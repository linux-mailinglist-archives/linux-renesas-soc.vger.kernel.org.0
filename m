Return-Path: <linux-renesas-soc+bounces-14776-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80613A6E010
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Mar 2025 17:43:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3C8E3ACE99
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Mar 2025 16:43:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B93B25DCE0;
	Mon, 24 Mar 2025 16:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="M62GS/bs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C362725F789
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Mar 2025 16:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742834592; cv=none; b=jVm8Bjl0YYd4+0Qgmhla8FVY3HfEFxrPW9XTN0a3XvC50BtcI5UOIWE2JCVH30TW13HSCDFepiAa9xn33BtOKDpUMlZiX8J48TJ9lXqLyYHsaGeNpMfMOUzNnmXMnAtpwluE5Gq9KZ9HHTuh+A2X1odotgxDfxag4rOVugu3uoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742834592; c=relaxed/simple;
	bh=akQbqk02ap9Synd647KMQGGiqIhhcms8F9khgmeMx8s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uPIg7cQYZ40HVNB0OFB+fTRheNVbUDvhjINZXFpKAlO3o9KcXtgWa+sjQHuUAy3HMfqmVvTpFQGp+9sPEZxSGWNPFpXHMmD52gdU1zS0jGeii42POyfQsifQpm4V3Fm+w9/u5uIKoaJchNuIZyk4rRk/ZykF1RHs26El63WdlB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=M62GS/bs; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac2ab99e16eso926939666b.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Mar 2025 09:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1742834588; x=1743439388; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MTgTcfPXsXBiP3n1jG7kGPoR3MDdecFN4YWGcxJKKgs=;
        b=M62GS/bswh8uj+XiPImAkhRtfn7XcLI0oCb9w6Ad/BpTqyjfq2vBbF6wqjSBjk01e8
         /l9t7vUqX7hi+wGvcx1skKjGpbI47VPm090y9lHeksXhVv8kTyHuH7v8LSUuIBOa7AAl
         fSBONzhAmDk38pxEZVne71dUy+y8PesB2mcYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742834588; x=1743439388;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MTgTcfPXsXBiP3n1jG7kGPoR3MDdecFN4YWGcxJKKgs=;
        b=mME0lZL9e2kSWZpqqPFCt5omTAhtX/XfKxfXPsY4KZF61HHqQd2y4IlhWVoBnmgQPv
         NpoScFEkVq/+5rHAicZNoXUFOjFAL0qFLk2LyMJsFgOLgxe/4toxvAILDihYHlY1Cy/+
         WYjnSEQCzBG7AxButMupAcL7cJfFQamshXpykMhxqI7yNfd4M4a4xnzoVlAPYXRgPMds
         TO2zCbmKi2gRZt2xfjYi41qXXor60UrhVxiCvoDb6/qUSKWkDEZwki6M3bWgkhov4zZD
         S2g971anVeg/LoH5cmXYgXQ3a9zpGh4OvibeymFIqI+roT8QqNCgedAb0Z72SH9jf86y
         F+xQ==
X-Gm-Message-State: AOJu0YyQNwT1iJSFYZjtj0hxqoMCTMPU8fe0RO55xb65/UAdFdGG3bDl
	u7Uu1N1lfyCvpIMcL1PRYamsWpOSHEQ+VjdBNatLGmvugF6sAkbLAXEolb0XILaNjqiYFHOWnoS
	SXg==
X-Gm-Gg: ASbGncuqMmC4RAB4pn2gbXzbCa6IDAgxABiuGAZMUcTORbftKAeX2zaFBlm+cHKRvIe
	c6yNhv8IzI05GarXQclgPVIU1ocSYci/O083mHTh7JyObCFZgOUqtt8/vjxvhPEMaxJITXnID3D
	6ctTbWRtkLxsGWuwM5Sjed7uv3OmNXNJHAd3CZEYuMZXPbMW8TP3oltesHQrxJ30xI7ftqphfyF
	yXQhmQWYNizAp/AuELkYokPY2qG8Qv9fPXVTH6s+aOTwddWee8cx3JHV9uaugrAt4ypMBoXTh4j
	1MOqoUoYBSUBCqhkErLTzen2keKYHAWyIwKgnkw//GZhXHgIrYn/Iqg6Ej9rEi2i7ZiAUXgDZsC
	5S0T5iwF5
X-Google-Smtp-Source: AGHT+IHrztuMNAY4ktSzHJCuVCqULW97v7NKj3XpL8vqYrCbf3//IatYbiUGmg/CXB6hfCYc08tniw==
X-Received: by 2002:a17:907:3ea2:b0:ac2:baab:681c with SMTP id a640c23a62f3a-ac3f22b2bddmr1339838266b.28.1742834587877;
        Mon, 24 Mar 2025 09:43:07 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef8d3d38sm699059266b.39.2025.03.24.09.43.07
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 09:43:07 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5e66407963fso8198543a12.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Mar 2025 09:43:07 -0700 (PDT)
X-Received: by 2002:ac2:4e0a:0:b0:545:243e:e2dc with SMTP id
 2adb3069b0e04-54ad64eeed8mr4943619e87.39.1742834261069; Mon, 24 Mar 2025
 09:37:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250315201651.7339-2-wsa+renesas@sang-engineering.com> <CAD=FV=W76iNvReU=itxjX2rW430uezJz386-1pbd_QeY-OnHPg@mail.gmail.com>
In-Reply-To: <CAD=FV=W76iNvReU=itxjX2rW430uezJz386-1pbd_QeY-OnHPg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 24 Mar 2025 09:37:29 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U-nSSo0xFkF+1gsL-JJ5b5S11EgscdY=YJ9wzLBJqcGw@mail.gmail.com>
X-Gm-Features: AQ5f1JrMZgU0HzknIWO7tDf14MHGQKkHS5__am7MPLh4QXDIGK5B8aacmkLqJpI
Message-ID: <CAD=FV=U-nSSo0xFkF+1gsL-JJ5b5S11EgscdY=YJ9wzLBJqcGw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: ti-sn65dsi86: make use of debugfs_init callback
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

On Mon, Mar 17, 2025 at 7:33=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Sat, Mar 15, 2025 at 1:17=E2=80=AFPM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> >
> > Do not create a custom directory in debugfs-root, but use the
> > debugfs_init callback to create a custom directory at the given place
> > for the bridge. The new directory layout looks like this on a Renesas
> > GrayHawk-Single with a R-Car V4M SoC:
> >
> >         /sys/kernel/debug/dri/feb00000.display/DP-1/1-002c
> >
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > ---
> >
> > Changes since v1:
> > * switch from 'client->debugfs' to DRM 'debugfs_init' callback
> > * remove RFT because tested on hardware
> >
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 40 +++++++--------------------
> >  1 file changed, 10 insertions(+), 30 deletions(-)
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> I'll plan to apply this next week assuming freedesktop is back up.

Pushed to drm-misc-next:

[1/1] drm/bridge: ti-sn65dsi86: make use of debugfs_init callback
      commit: 1d1f7b15cb9c11974cebfd39da51dc69b8cb31ff

