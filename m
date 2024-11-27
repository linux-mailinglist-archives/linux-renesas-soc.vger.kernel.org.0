Return-Path: <linux-renesas-soc+bounces-10720-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AF59DA53D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Nov 2024 10:59:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8BD81656F5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Nov 2024 09:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60510194141;
	Wed, 27 Nov 2024 09:59:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802796A8D2
	for <linux-renesas-soc@vger.kernel.org>; Wed, 27 Nov 2024 09:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732701562; cv=none; b=YSmmhL/yURslF5Kdj5UuZBHtDi4lgXUXWEKlBILGarT5s6mn8wBxkfoCDeAyQkuUi3bYxB9BOvFROUoGiaVyISZSntxbRC/W8LrgHhWkfilAP7iVT2oZA1oCImW1wQ8tqMwjn4LaZh4zpvpqxL4pqVTTgHubi1gW+y+9sqWoh7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732701562; c=relaxed/simple;
	bh=CJBHFfqONtAx+0EDHxyyMWLICwKjfZVbVkiPG0oW1Pc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FglSNTsjSkeuHrLI24SjiFcrp1yzh0Bm8QsTO+uT6ZvL+HP+vIiyQtqFSnie0WxxjB8HilMvnxa7ECrx05VnKJyAeI9SZzavEMV/DRn8oG2btddpfAUrwlBbY+VmTdRxnXfRaRmWuxviduwUwC1+MKSAxyfOL6/4OAlgmRm++s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aa503cced42so797996266b.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 Nov 2024 01:59:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732701557; x=1733306357;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OOiMr84A3GB1hUmBWPgvlaH2hHjmbQ2GRHgnQtxORGY=;
        b=DVeyrR6pugTDOgl5QipYuDKfuj2c9e8UiqM87H4GV6s+en8E0P5zLK8lKpZWdEpeA6
         0pGHocz0ugd0sIUXv7A0kywPP2RNNNh/FFP6ES6LFVfbItvnieqK27t07RmsJA77OOJE
         3z2oofw4sAU8uofrdp818yohYzVlh8DtKTedV+eYUkJ6It5H5oQjapDoGhxa6PesKF7j
         rbB7RiMupVfAB8HBOKrdf2Ad8gBQzlfTOueFZHrvYgdZQoUcUEWa+I+OONTV/ne+24Qs
         19mWr37rxiRVuYYWamd4HDAQoJwf9a/Bq7kovuujLargn5fI9ECmdkFVrvvNevNHHKNL
         Dylg==
X-Forwarded-Encrypted: i=1; AJvYcCWCX64c8ENAVcbhAeRg2aNVSIWUE4MoS+m8oBqYoAY37/V2rLZPft84IfHb6bQZSCs9ZksG6ABR4KDEQ6SWuxL46Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOMfuF9q3yplbWepqd6hAawiANDFIfW8WP5nKbFL4Na0CkaPN4
	/WIYwypYQoBgQ5mSGosfbh+mP9Qc6IG5q1U0D95Z1W3RkabRxga6JYQUryMgNzw=
X-Gm-Gg: ASbGncuY0NmKTf0L5565D3sAN7d3m1tuIE/UQPUQut7z6Jq/uW5FMD15r8CFUDoUUgg
	PFNYjTuMxbX0KTSAiPbjHVSfHGdnfPoz8Dc+k6EteRBy8I/UmggvOhx/XXeKBEWh9QJpcsIzKv3
	FLpP3pgFYzIGzg7uFl1+Sv+WGY+NM0KDWFG4BDyHWmsVZH4WBXQuwWkaoeCd39GVnJehB4HvEhy
	ZaaGOQut/izjN8DDRYBWrZfoTgmkNR0vPbu8gaj1ohjGyp6wa+Z+NPoTIasNiZ/8XOV7EBZd8Kq
	iCbrUlXSYNrq
X-Google-Smtp-Source: AGHT+IEqNhlqLAlytZesjV5/YG7Yq7DtEwyhriYw6TeKRAhQlrbldXU4wUWwdDyPYgo3u4aSbg2UUQ==
X-Received: by 2002:a17:906:31d2:b0:aa5:47f8:b91c with SMTP id a640c23a62f3a-aa580f4e2a7mr167264766b.25.1732701556843;
        Wed, 27 Nov 2024 01:59:16 -0800 (PST)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa530e6f654sm562827566b.101.2024.11.27.01.59.16
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Nov 2024 01:59:16 -0800 (PST)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aa5302a0901so540133666b.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 Nov 2024 01:59:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW2Yp6h8G/kHHAUgZImhykcpljJWWCAtfZ0riYjVLwqzsMJFBJCXFuMGYIeLep43VmDiGnDYS+XB+r6ie3TgymoDQ==@vger.kernel.org
X-Received: by 2002:a17:906:2181:b0:a9a:bbcf:a3a2 with SMTP id
 a640c23a62f3a-aa580f57adcmr130255766b.34.1732701556314; Wed, 27 Nov 2024
 01:59:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1729240989.git.geert+renesas@glider.be> <30ccdcf0-1937-4351-b91f-d35d86aae6f3@ideasonboard.com>
In-Reply-To: <30ccdcf0-1937-4351-b91f-d35d86aae6f3@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 Nov 2024 10:59:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXd-S8iDJaWN4NJxGP8y7zDPW+0a4PhWo0JPF9AW1-Y-Q@mail.gmail.com>
Message-ID: <CAMuHMdXd-S8iDJaWN4NJxGP8y7zDPW+0a4PhWo0JPF9AW1-Y-Q@mail.gmail.com>
Subject: Re: [PATCH/RFC 0/1] arm64: dts: renesas: white-hawk: Add mini-DP
 output support
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tomi,

On Wed, Nov 27, 2024 at 10:28=E2=80=AFAM Tomi Valkeinen
<tomi.valkeinen+renesas@ideasonboard.com> wrote:
> On 18/10/2024 12:32, Geert Uytterhoeven wrote:
>
> > White Hawk CN15
> > ---------------
> >
> > Does not work:
> >    - Display resolution is detected correctly (1920x1080 or 2560x1440),
> >    - Black screen, displays say no signal detected,
> >    - "modetest -M rcar-du -s 88:1920x1080@XR24" triggers:
> >
> >       rcar-mipi-dsi fed90000.dsi-encoder: Failed to disable video trans=
mission
> >       vsp1 fea20000.vsp: Underrun occurred at WPF0 (total underruns 2)
> >
> >      Note that fea20000.vsp is vspd0, not vspd1. I do have a few simila=
r
> >      messages for fea28000.vsp in my logs, so this may be a red herring=
.
>
> I had a try with this. The first issue I hit was that ti-sn65dsi86
> driver doesn't work if there are two sn65dsi86 devices: Creating aux
> devices try to create sysfs files with the same names for both devices,
> thus failing. I take you didn't see this?

I did, cfr. my comment in [PATCH/RFC 1/1][2]:

    This has a hard dependency on "[PATCH] drm/bridge: ti-sn65dsi86: Fix
    multiple instances"[1]

> I brute forced my way through that by doing "aux->id =3D s_foo++;" in
> ti_sn65dsi86_add_aux_device().
>
> After that, I was in the same situation as you, black screen. The
> ti-sn65dsi86 does detect the monitor, though, and reads the edid just
> fine, so I think it unlikely that the issue is on ti-sn65dsi86 side. I'm
> not sure if the second DSI output has ever been tested, maybe the issue
> is around there.
>
> I did not see the errors you saw. Random underflows are know to happen,
> though, but it's odd if you see them for the display path that's
> (supposedly) not in use...
>
> The fps looks fine, so the pclk and timings are probably ok:

Thanks! So it probably is an issue with the routing in the DU or
DSI driver...

[1] https://lore.kernel.org/8c2df6a903f87d4932586b25f1d3bd548fe8e6d1.172918=
0470.git.geert+renesas@glider.be/
[2] https://lore.kernel.org/all/05e43f61321b4191d5f97dec2349facd4b56c899.17=
29240989.git.geert+renesas@glider.be/

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

