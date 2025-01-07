Return-Path: <linux-renesas-soc+bounces-11935-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D81AA0482D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jan 2025 18:27:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD9443A67F8
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jan 2025 17:27:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E6761F4E47;
	Tue,  7 Jan 2025 17:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PcfAq6i7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37241F37CF
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Jan 2025 17:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736270833; cv=none; b=m40wx9Xedlkuvun7IXas2lcs/3mhrPhgPmzZupI9pr0c5xyTjX3e14flYq9jvhZ23DXIu6nlaGHP9LjgFIdN5ZqRbAbW24lVpLENor3Q+TXuxt3FpGjrYr1InhzKPU8vRLJBkdNICp77UvDMYTIAANRAmhdsGNZXtQvgApv2LM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736270833; c=relaxed/simple;
	bh=c4T5lNNu2R8wdqYU619+cZBSgekeEsdh4POGVa9rVnA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KOQ1ddHXwe/fbJs4hinPZ/1Sv84tJAo6ZViqOmzBkwNV6HA1d93ZaHEWYTH2FnTMsLSvBac4wwMTr/Maw7bAzXt4xSaG+5G4F22tR3WM58KGO7SDcbYQ3u73s613FuJb3bpxW1n4u7XSOTp4zGcyRqQIOm2AWxZKjNWG2Ijdlos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PcfAq6i7; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54024aa9febso16877985e87.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Jan 2025 09:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736270828; x=1736875628; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5e6oybH8waw0F1euskY/nJ2JCR+I1f/uoiRiLQitoeM=;
        b=PcfAq6i7pjuNJrTr6V6xIe2xJ2lv9ErZAwz6SbsUpE9ut31IuKuX0O3ASRrHHbr/jZ
         Re5LHqKYClF1HDj6HGS/EtJO8p6rN3aKUn+x7knu2yfNRXOITgCSY6PWQi+06xr1TQfZ
         LF3tEuMzor7fup1Hl8d8M+ZQKBFUfqtfkngwQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736270828; x=1736875628;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5e6oybH8waw0F1euskY/nJ2JCR+I1f/uoiRiLQitoeM=;
        b=IPDSe477FC9vr92g8lb0zn5iWaNP9M4PCkA7iT4MmvhVk/z36brqSn8eD+FoXn8qf+
         cYa5at8HsX9u6dT9CAoQLHN6pejApFIDAQnTlerwW6Vx8fqzmMiLxfbkWupHnPSWG9MW
         bPhwb6MpHpEf6ky2EtrbZU2FXJWU9Ii5mljlHexHjRKUwA1VqTHWJK3wU3gFlE3/+KL1
         Iol2yyEmgNt/AhX4sD+p+H9tHFW6j0VwiJJvVJfrbqoIuLGSj2XyxVajqw1GeIK2jDXS
         Kyrs+E3/EQg/7vpM7G9yJhaIjROE566TpCsR4myETcUe2Qu7gr6ASgjKOaFbQFQKuDqd
         NhGw==
X-Forwarded-Encrypted: i=1; AJvYcCWgCMz7HY+O9zbtLuJjhxXbOJ0o0CpnSIvHYCMuK13plDsFMvWi05UJ+9yncIP8v9n1xbzcRYfxPjYgqePSqwDQ5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqVDdKUuFTejzMvmMbDHFKHUUbaF9B4C1dtvxLY+s4veghZAMj
	RYUNRiWIODs6yrg+6ussdCFI3Bz3KqMtckv1c1xkM1yeJWdR+0egbxk+dlyxDo420/5v1wUatlZ
	VUwl6
X-Gm-Gg: ASbGncsLeiw3Tt3DWloz+Kr1T8B+/5W2QVDjWPYLXlCKrzHh3+QEa6G2QBZCakEt/zR
	48aTn5p2FhhSPdvN1Ic693Chxrpmcy9nMS55Lr9de3na/2iW0SIaaX+7GRdN1gcfuNVd8VzTgIv
	YQev9qtVrc4Aw2/24EsxHOcIIQqUjzSd77X8HYByNURayvPsIrZ4KdPKZPc1w+s3y/V+SuzMtOX
	jLcqTU5mpx7tjOa6x4T/ROt/qdyfsfbZ8HQVXLumAntrML+iLxvy+ymeRTrPeYf3rkCgLU2amVF
	a/50sO6hyy+YPK8bpN1E
X-Google-Smtp-Source: AGHT+IGdbTsbP535J1DdXctjze55AFZoBQKTMD4dYFpksdYxOJom/s7RrmG24Ym5Z2GbA12lCTxeuw==
X-Received: by 2002:a05:6512:2803:b0:542:28a9:dcb7 with SMTP id 2adb3069b0e04-54229533ddcmr12933073e87.21.1736270827643;
        Tue, 07 Jan 2025 09:27:07 -0800 (PST)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f64c1sm5213448e87.51.2025.01.07.09.27.07
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 09:27:07 -0800 (PST)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53ffaaeeb76so16721651e87.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Jan 2025 09:27:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUqEIE4iju4FKeDW5R2MX3cRv/RtaQZD+cVUNjORR7uPqVB1A2ENcBDZMJ1CRc9W+hN2RA5QDkD5iflvJCtE9jjtA==@vger.kernel.org
X-Received: by 2002:a05:6512:2308:b0:540:357a:4aa3 with SMTP id
 2adb3069b0e04-542295404demr19430722e87.28.1736270507695; Tue, 07 Jan 2025
 09:21:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <7a68a0e3f927e26edca6040067fb653eb06efb79.1733840089.git.geert+renesas@glider.be>
 <CAD=FV=XpRt_ivSDz0Lzc=A+z3KFrXkVYTn716TD1kZMAyoGQ_A@mail.gmail.com> <CAMuHMdXhEcr-XDpD_RHHU4sxVNS7=iUWUNEwdEwS4pEGYzP39w@mail.gmail.com>
In-Reply-To: <CAMuHMdXhEcr-XDpD_RHHU4sxVNS7=iUWUNEwdEwS4pEGYzP39w@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 7 Jan 2025 09:21:36 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VONgQgohhtO07tQ4Paif_v1h+xrdAT8S8amkCc5rfgGw@mail.gmail.com>
X-Gm-Features: AbW1kvazHgvULSfHqt_0VX8ft9CTn7RJ3u6wjnfVyyyuGT7WJIlXCd5AaiKW4R8
Message-ID: <CAD=FV=VONgQgohhtO07tQ4Paif_v1h+xrdAT8S8amkCc5rfgGw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: ti-sn65dsi86: Fix multiple instances
To: Geert Uytterhoeven <geert@linux-m68k.org>
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

Hi

On Wed, Dec 11, 2024 at 12:27=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Doug,
>
> On Tue, Dec 10, 2024 at 6:09=E2=80=AFPM Doug Anderson <dianders@chromium.=
org> wrote:
> > On Tue, Dec 10, 2024 at 6:19=E2=80=AFAM Geert Uytterhoeven
> > <geert+renesas@glider.be> wrote:
> > > Each bridge instance creates up to four auxiliary devices with differ=
ent
> > > names.  However, their IDs are always zero, causing duplicate filenam=
e
> > > errors when a system has multiple bridges:
> > >
> > >     sysfs: cannot create duplicate filename '/bus/auxiliary/devices/t=
i_sn65dsi86.gpio.0'
> > >
> > > Fix this by using a unique instance ID per bridge instance.  The
> > > instance ID is derived from the I2C adapter number and the bridge's I=
2C
> > > address, to support multiple instances on the same bus.
> > >
> > > Fixes: bf73537f411b0d4f ("drm/bridge: ti-sn65dsi86: Break GPIO and MI=
PI-to-eDP bridge into sub-drivers")

When I applied the patch, the DRM tools ran checkpatch in strict mode
which pointed out that you have too many digits in your "Fixes" hash.
I've adjusted them to make checkpatch happy.


> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > > On the White Hawk development board:
> > >
> > >     /sys/bus/auxiliary/devices/
> > >     |-- ti_sn65dsi86.aux.1068
> > >     |-- ti_sn65dsi86.aux.4140
> > >     |-- ti_sn65dsi86.bridge.1068
> > >     |-- ti_sn65dsi86.bridge.4140
> > >     |-- ti_sn65dsi86.gpio.1068
> > >     |-- ti_sn65dsi86.gpio.4140
> > >     |-- ti_sn65dsi86.pwm.1068
> > >     `-- ti_sn65dsi86.pwm.4140
> > >
> > > Discussion after v1:
> > >   - https://lore.kernel.org/8c2df6a903f87d4932586b25f1d3bd548fe8e6d1.=
1729180470.git.geert+renesas@glider.be
> > >
> > > Notes:
> > >   - While the bridge supports only two possible I2C addresses, I2C
> > >     translators may be present, increasing the address space.  Hence =
the
> > >     instance ID calculation assumes 10-bit addressing.  Perhaps it ma=
kes
> > >     sense to introduce a global I2C helper function for this?
> > >
> > >   - I think this is the simplest solution.  If/when the auxiliary bus
> > >     receives support =C3=A0 la PLATFORM_DEVID_AUTO, the driver can be
> > >     updated.
> > >
> > > v2:
> > >   - Use I2C adapter/address instead of ida_alloc().
> > > ---
> > >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> >
> > While I agree with Laurent that having a more automatic solution would
> > be nice, this is small and fixes a real problem. I'd be of the opinion
> > that we should land it.
> >
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> Thanks!
>
> > If I personally end up being the person to land it, I'll likely wait
> > until January since I'll be on vacation soon for the holidays and I
> > don't want to check something that's slightly controversial in and
> > then disappear. If someone else feels it's ready to land before then I
> > have no objections.
>
> There is no need to hurry. The only board I have that needs this has
> another issue in its second display pipeline, which will require a
> new driver no one is working on yet.

As promised, I've landed this. In this case I've landed in
drm-misc-next. Even though it's a fix since it didn't sound urgent
enough to land in drm-misc-fixes. Since it changes sysfs paths
slightly, it feels like it would be good to give it extra bake time
and not rush it as a fix.

[1/1] drm/bridge: ti-sn65dsi86: Fix multiple instances
      commit: 574f5ee2c85a00a579549d50e9fc9c6c072ee4c4

-Doug

