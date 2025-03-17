Return-Path: <linux-renesas-soc+bounces-14508-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5C0A653A8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Mar 2025 15:33:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 357B63AFD9E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Mar 2025 14:33:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE33F23ED77;
	Mon, 17 Mar 2025 14:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QuR0oIxl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAF023958D
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Mar 2025 14:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742222008; cv=none; b=EQECFqQBG4YjP2wCqqZZbXDvP0O5WQpY+PMFRiSt9Dai642C/QhbkjZvWA/ZOOHgT0f9ysEbiF3iHanfmjIFQKfB6vNL7UN2FqSSXGYBacQriwh7s9/cbu1oLHXJGoQJxzc2v3mxtf5sIIi3M8xsDcAUpfwPWrltvsGFitAQLE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742222008; c=relaxed/simple;
	bh=JYPC9lHuQrU33xf9HFBMIvI/S8KQAZN6c+OkozQ9mnE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dyF154/uPjFjWB9glpAEs3sc+MFc8y+bbLDjSJB+2TozBevH80kxua+pu9hiSpuONjTibaZlqMbiM0aonI6DBSpl44gYatybV4zjdXnL86X9FFpt87RUWgVd/CCxyQcJPKhMzfPRNUzdDW/ogeCmPn9BV2uxebXbhXsY52FnlX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QuR0oIxl; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30bfed67e08so50279411fa.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Mar 2025 07:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1742222002; x=1742826802; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XDNe3093iFCHOB0BF0trzQBjwvxbWGfcsFI1fzTSQYc=;
        b=QuR0oIxlU51dMNHo1gQ4rdzvex9etafQjHImD5jYRJ22q9SGhh+v3raMJb8gDbZWRy
         c9RbDcXYQ7m/lIpqMWqSHYf9V82lrAeuoNxKr8mlexOHm0SGxthbr0HF4nh+RT7PmBBI
         37btUdkDYbrLVaX/JMkudH68zS+V67HncDj5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742222002; x=1742826802;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XDNe3093iFCHOB0BF0trzQBjwvxbWGfcsFI1fzTSQYc=;
        b=KWZSQl3gWRINdKq//yRz8jmibNwxe1qOko/eeBrUqHpdOnzPk/FqLedFfTX7wBzEYY
         ezhwwa8cZQGcfFc3TErNP1KdRUco6HPERJsfFD3mAQG0axjfaRTVsHnyfztZq/jhwzlo
         Giu3GU0TsvMTqLJKtDdJw++HQl5dm18J6rCyVK3rOt3bqPq9sTu4jwxnISIoG46s7Nty
         EPilKBm+B0fIUylsh5bolptX0NUBWQFpP9oymupWcePrYEzUHiwtWwwFqOJcXbXVblQx
         XGOBMerolqvlyTm3TlO3iz4UC9fKOHxhNRlUoq1/PGU3MDLHS58Nw5Ym62hmMJ+VC7oJ
         Ac3g==
X-Gm-Message-State: AOJu0YzUOp8HCH9xXYCaP6NX0D2/QjoLflhjVJ1FZoDMfZLeFKvJhAOV
	8GsBIfI4EKujqK14Or3YaNYjEzKpUz+BKz1ybLf2QrcuyQAzH77BUv6rd/4jPGaLyg2dwfL6YPk
	=
X-Gm-Gg: ASbGncuHVBhJFO1ik4dkDYPYdbnqF8GovWE2CaFvheAjRHWSB7Yo8cU/5t/ETQU4S8z
	/nvum07OJV+gdHnEdZmL1/1AKFU3RgAl3RE4X8WjEvsYt+Ydi/olwNgh7yka5dMG7ZzNYpEkMvC
	CAKI/3dPYzeQ7Qs9QzXVIzYDohrrkXbvC7T7XUvMUhoo/L9NlPKzssF4LDHZxYc/szfHN6vwkdc
	ol3IGLC81Qltbkhkac/mxZ1oPUnXMMhC2Tf53m6bqLk334HIzMBNE6HRR+1O77vaWVtzHcm2X/n
	0DnGVtDqa5ic9+ngNYNOZDQPZhRu3MC8YGfjdQh1AGPThVuq3cQ+LnLUJg3JDghgQVxpQUyIbtz
	8HOejfym1
X-Google-Smtp-Source: AGHT+IHgZduaU+tiE168t8f3mfIFet4P1aD0iKJZoxaE6nVSFKqfRcqAIzCi3jmoBfaWxHdIYYjHpQ==
X-Received: by 2002:a2e:a546:0:b0:30c:5c6:91e0 with SMTP id 38308e7fff4ca-30c4a74e129mr68598101fa.2.1742222002092;
        Mon, 17 Mar 2025 07:33:22 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f116a56sm16229091fa.54.2025.03.17.07.33.19
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 07:33:21 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-549946c5346so4633384e87.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Mar 2025 07:33:19 -0700 (PDT)
X-Received: by 2002:a05:6512:ba9:b0:549:5b54:2c77 with SMTP id
 2adb3069b0e04-549c3924ecfmr8094901e87.32.1742221999211; Mon, 17 Mar 2025
 07:33:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250315201651.7339-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250315201651.7339-2-wsa+renesas@sang-engineering.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 17 Mar 2025 07:33:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W76iNvReU=itxjX2rW430uezJz386-1pbd_QeY-OnHPg@mail.gmail.com>
X-Gm-Features: AQ5f1Jp6NWZTpFKw-xlMJCY9hQkuIldAdH8N1R9LoiSLuWY4HBRzAz-oTXvTRMw
Message-ID: <CAD=FV=W76iNvReU=itxjX2rW430uezJz386-1pbd_QeY-OnHPg@mail.gmail.com>
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

On Sat, Mar 15, 2025 at 1:17=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Do not create a custom directory in debugfs-root, but use the
> debugfs_init callback to create a custom directory at the given place
> for the bridge. The new directory layout looks like this on a Renesas
> GrayHawk-Single with a R-Car V4M SoC:
>
>         /sys/kernel/debug/dri/feb00000.display/DP-1/1-002c
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Changes since v1:
> * switch from 'client->debugfs' to DRM 'debugfs_init' callback
> * remove RFT because tested on hardware
>
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 40 +++++++--------------------
>  1 file changed, 10 insertions(+), 30 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I'll plan to apply this next week assuming freedesktop is back up.

-Doug

