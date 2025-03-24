Return-Path: <linux-renesas-soc+bounces-14778-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA50A6E0B4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Mar 2025 18:17:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D55EF1890378
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Mar 2025 17:17:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E422626157E;
	Mon, 24 Mar 2025 17:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="etUTaZMY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BDFB10F1
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Mar 2025 17:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742836645; cv=none; b=mLhSBMOPAghtiQkw+JXXTIfnw7u2BGAtLsyGzjkZSAlmpDS4PVqpuChjB1T5CiJZO1sGQXO35w/eSscXicTlD8MEBiP+3zYTecgd0Ax7q4ZcuoeD99R+oslFVUZyzlCKo13fM8aIds1lqqXYP80jIzIzl4ysAUBoMpDEFRIyYUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742836645; c=relaxed/simple;
	bh=FyxjEAPrVF48YiUEzfdDkCEOg/lxIrDdeyM/aokkYS8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N0+GXZbTbVXhX8B51jwDDJHblNKOWRl2oKeco9KSqNHWQ/VnrSkQkFl9V4bZyoXlDIReNcsbPA6k7rYOJkeQXfJukjUAW0iUcRDQUIm1EfoKkZkPJgXVL0z3VgvozMNyMCLzQQOtdL+MupAeQfConoO+n6AyOywsitFMYGgBsbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=etUTaZMY; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30bd21f887aso40990831fa.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Mar 2025 10:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1742836639; x=1743441439; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FyxjEAPrVF48YiUEzfdDkCEOg/lxIrDdeyM/aokkYS8=;
        b=etUTaZMYihqrjSLK4dOxOIHhoaKOAqdTOuF5kLXaQBgvfcCmLsaF8tR+bYAhG3G7si
         TsitOMZWevH1YzabISVt9ema4mqadh72Z/w8kTEFirnYIG6vazfh+LuFPFGnN/LVlGR+
         3GdOAyzgrWlBNRGfAr4/tmeSPsSNybOrWPbkI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742836639; x=1743441439;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FyxjEAPrVF48YiUEzfdDkCEOg/lxIrDdeyM/aokkYS8=;
        b=tee/vtfjGoRBY6QBc7xkqP0RUpHmPOM+lFzdkdodCd7ZMdh7aykw/U6JwXX/FLzgqQ
         WZ0EPCUlJfedViWaGev0Rses+Us8R9MMNmVQfMkkr32x7r2W3yQ3NeNwa6RJg4LqJyzf
         XRzeYpGYH2c27UR2tVTE0P8Ik9tqoTdPWe9OiSE+suAmGzWkw9jjcIGVi7dw0k143Vp0
         ZUOWGdEk9Bl0a/X+f43x28yTtARveSevtAnfaCRc6bCQjbbOcgKzFcXbhYSQLA76SqcK
         6Go2nZGSGhlvJfK+Oga5rdA7whuvlgEFeYxpajXll35FChlsVQA8OUMt1cpzvBpveGP7
         WRqA==
X-Forwarded-Encrypted: i=1; AJvYcCWnrTQweFogj4Rb30P+LmphwG5qC7ebloV6V2pnrjfmsjjkVtrBLplqSTULGlyo+8LzgfrKo/aiKUXzW2ZVG1m2Xw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzU4uJPkEfDxY2Deh12xmfhebIdm6OJyAlbbrIwXC/I2gr2wi4T
	inmTGwVroIRBoo4FSFqLFyXJpYuF0nYswbPz8MTsJg9De9T/s+uBm1EUH7/WW+IWo053HKiXLZS
	h9r1i
X-Gm-Gg: ASbGncuCT7RB/eMumCkxGkXQCmYPfQ52v8N/KQyWIOa4B4jNVH2fBel2wD8eb4FkC7l
	dwk9D2oDQ2MvuQ2B7raFXeiizS6sWcsfUcJEyZ/UjdaSF4M6ZkuWJOu1zJNtTSU7xXS8MVl8SNb
	S54ApZHZQ5TKTPHFEo6YCCVeBKdepeYGLNEmz/PbwFVwnT1T8J4NFwonGwAgBL5RSHNejcLKqQU
	0kMFvwQAS5SMJhff9khgAdw+TlCW8ZAQ7arIivhUWo21pwRk5K1dWgEzLWL4JKV5NkVKyh5LARO
	cUYMQJSurWDVowgJMU4m9p1YADMbHiQ5Qu3j4HvcSFwuQ8k4RlUdy84yYHXtXOU6m9NI5k93S46
	2+/vi8ux9
X-Google-Smtp-Source: AGHT+IG0EUeiGCe0YgnQD4wre1M2mYqy07Owd7iOYRLHFYhX8lThYnV0Y+WtBSbakGGRaE73WG5iyA==
X-Received: by 2002:a2e:be04:0:b0:30b:badf:75ee with SMTP id 38308e7fff4ca-30d7e202ed6mr52199801fa.7.1742836638792;
        Mon, 24 Mar 2025 10:17:18 -0700 (PDT)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30d7d7c1c88sm14657851fa.20.2025.03.24.10.17.17
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 10:17:18 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-549b12ad16eso4972226e87.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Mar 2025 10:17:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU/xugZpcian3Drnuyftt1XZtqIDr1HMPcad+xCEstWzNzj+xo58cBcBllGYM2m9JovH3M97DdkjwuXdMgmuJz+/A==@vger.kernel.org
X-Received: by 2002:a05:6512:3e1f:b0:545:519:2d9e with SMTP id
 2adb3069b0e04-54ad650d4b4mr4523674e87.47.1742836636811; Mon, 24 Mar 2025
 10:17:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250318155549.19625-2-wsa+renesas@sang-engineering.com>
 <20250318204133.GC22890@pendragon.ideasonboard.com> <Z9ne78KhxfKYgnh_@ninjato>
 <20250324164025.GK5113@pendragon.ideasonboard.com>
In-Reply-To: <20250324164025.GK5113@pendragon.ideasonboard.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 24 Mar 2025 10:17:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Umc0aAvDrQhoZoaaOHjn8B2u0BTtgqeS3oEcH+mtAgwA@mail.gmail.com>
X-Gm-Features: AQ5f1Jq2UlyKfisdyLjGNfMlfBrnWMqyIxTMqQHM0u2AMCUh84s80jlGo60a35s
Message-ID: <CAD=FV=Umc0aAvDrQhoZoaaOHjn8B2u0BTtgqeS3oEcH+mtAgwA@mail.gmail.com>
Subject: Re: [PATCH v3] drm/bridge: ti-sn65dsi86: Check bridge connection failure
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-renesas-soc@vger.kernel.org, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Mar 24, 2025 at 9:40=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Tue, Mar 18, 2025 at 10:00:31PM +0100, Wolfram Sang wrote:
> > Hi Laurent,
> >
> > > > Read out and check the ID registers, so we can bail out if I2C
> > > > communication does not work or if the device is unknown.
> > >
> > > What's the advantage of that, what are you trying to guard against ?
> >
> > That a random chip at address 0x2c will be used.
>
> Is that really a problem ? That would only occur with a broken DT, is it
> worth guarding against a development-time issue with a runtime check
> that will increase boot time for every user ?

FWIW, this can also happen simply due to broken / damaged hardware. If
a board gets stressed and causes a pin to become disconnected or if a
regulator ages and stops providing power then we can also end up in
this state. Getting a nice obvious error at probe when the device
isn't responding at all can make problems like this much easier to
debug. It's not uncommon for i2c devices to probe to make sure the
device is really there at bootup. Checking for the full 8-byte ID is
probably a bit overkill, but at the same time if we're going to probe
something the ID is not a terrible thing to probe and reading 8 bytes
won't really take much longer than reading 1.

-Doug

