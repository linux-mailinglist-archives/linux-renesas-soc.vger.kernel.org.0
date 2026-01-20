Return-Path: <linux-renesas-soc+bounces-27094-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 7153ED3C43E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 10:56:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A99A04EA162
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 09:39:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88C3C3D666A;
	Tue, 20 Jan 2026 09:33:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D837C2E972B
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jan 2026 09:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768901609; cv=none; b=Q/YYgQuKoeTQmXuBKyyneRTjF16aP6oOyxcpCAKSNS9b3PBRjmbhSXBXoGQIexVeJcvUlVM6eEW8/dEVsgNe7CwrQimbyx0OtOfea2qbrih/mzO+uSVwN03vzXjDik4De5NsEu0msMdZUu5W98W94tQxcWgBrycrjgFRwW00wdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768901609; c=relaxed/simple;
	bh=3GuOD8KR2tgB8oV7M2YqRRsg9wFPNn/e89AtmbDj2XU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pWI0303a2XWypjR+a/uIe4jmO8NOkZc8hMo7Sc6u+t5nD+f/+CVpuueJZnb7hsV8khwK/FVFkyr8GxZjKREreW4Phw7EucusBXQC68cQ8qe9X6folLoY6yk7oVJG5VV44WddJvHMdKRsgEC+jdsfV/DmyWCRCzDXY18pjTPVOVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-559a4d6b511so538032e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jan 2026 01:33:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768901607; x=1769506407;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7d344nbbjcVllE1LooRYmu0N/T5hZ1c4qAtbT77fyso=;
        b=BrJt65qlLzy7rgk40OryaURQ2yx6NaFZPbMQ0sty0zwtRaWUPn/Gw91C0Kx6/9ijcP
         3B3oVJ0rJVr8M+EzBygalQRp8ik4hUtxaWxhpsMXm/5aLumfc4y45laj9T5NL+4MEFSi
         w3SishpkruDqw/Zo98NIg+rmCAuJZp1z3kAUsgU5Eu+55mGsdL7J6p5dUbBwuW0M+U6L
         cy0cbU60/rgFpzk6THfpmoxBE6m8UbLOdyhtB3E8tv+0NvgD1F9Nw9+xWYRn6eUDPuiD
         oNXMLKGP1B87zwle0ypV48cAmMz0Y9dDK1EDC7Joh6Ft3GZw/3aktyQOtxLyA8pAvR01
         pw2w==
X-Forwarded-Encrypted: i=1; AJvYcCWYATCg8OQy4m6Nm9HkK3VOtnVHtnbdO75Xx46p/zlu7jaSBaedTsWweJu4LypKMR8bhKz52hwrwhnmej5JZ232UQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrxscDKA5L9YmLqKC0T0jPpiojSEn7HtmtT2y48nKYNQTEdsCj
	/QRK1glvjGejTVfaIcP/FGDgg9NBXjjyPtJoK87tirNwR5oRy7/+3iy6lHz5FyS9
X-Gm-Gg: AZuq6aI8mn0nbapDLrcswPpndeG6tyDS2Bom8YAndoqmD9bqrqoWKTXvwuipGdRJouX
	SP2QjECDvzirtdErZQbzWWe1MTYXyrRp6uH0PKvLxz1Fni1yXP+8ni90th0rLea8QOlQ7CZkJhb
	BuTNKfCdKxaB8oEoJEsFafhJsB1jNdha+1eeYVlPJTC0pUsgL/BQiZBbnCFrFmuAV9iO2k3KEnP
	Ph6dxfV6foBMFTj6y7uQpsiePsjm1eI0ALyz+Ba7bs348HdSa2VPQ7/A3P6ZYc9ZC9tHMHf+uma
	RDwC730Wc5+SvvMdou5u2kPkwnxz3NdL/tuc/dldWUAZxJGn0tQzqXAL4kQWtCqKRCYcv7dcVE6
	C2x1S3U73GHcybqy+U+l7+513/QOCRkJxoJulH4cNBPRFnn6snTr8YySyo/RmUJ0Vj9KU08sEaB
	6R5SdC2Ywk64qibHy3sRp05lRSOcFjdtzcE7Pf15s0MxSsp9ax
X-Received: by 2002:a05:6122:1d0a:b0:559:85d5:bfbd with SMTP id 71dfb90a1353d-563b5bc9060mr4504958e0c.9.1768901606622;
        Tue, 20 Jan 2026 01:33:26 -0800 (PST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-563b6ffeebdsm3436036e0c.8.2026.01.20.01.33.25
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 01:33:26 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-5eea2b345fbso1612948137.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jan 2026 01:33:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXag+iufP4zjLf3SpUr0V4ZHWTo2EH5N3tqDqGxcVVf69gilNopX8NSdt1gELb88mwd3oItN6g58XdyN2V96kYarQ==@vger.kernel.org
X-Received: by 2002:a05:6102:950:b0:5f1:6f24:8554 with SMTP id
 ada2fe7eead31-5f1a55b22b0mr3577104137.37.1768901605464; Tue, 20 Jan 2026
 01:33:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260117005028.126361-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdXHKJYcP78WLUfGrN8v+PmChj7jEsjhnVXYnSOzZ7mkpw@mail.gmail.com> <926a0b23-5159-4f4e-b278-b545ae281410@mailbox.org>
In-Reply-To: <926a0b23-5159-4f4e-b278-b545ae281410@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Jan 2026 10:33:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXa=NSu788E5G-aY4CA3hrM8s8fO9ABpEN_wy+5A=JHNg@mail.gmail.com>
X-Gm-Features: AZwV_Qg8oZhrOf1YB9AYEwTae8IfInWKLstAC0xoyl8s8vNgo8HaAia8hPuamek
Message-ID: <CAMuHMdXa=NSu788E5G-aY4CA3hrM8s8fO9ABpEN_wy+5A=JHNg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drm/panel: simple: Add Waveshare 13.3" panel support
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Sam Ravnborg <sam@ravnborg.org>, Simona Vetter <simona@ffwll.ch>, 
	Thierry Reding <thierry.reding@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Mon, 19 Jan 2026 at 20:08, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 1/19/26 4:56 PM, Geert Uytterhoeven wrote:
> >> --- a/drivers/gpu/drm/panel/panel-simple.c
> >> +++ b/drivers/gpu/drm/panel/panel-simple.c
> >> @@ -4998,6 +4998,33 @@ static const struct panel_desc vl050_8048nt_c01 = {
> >>          .bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE,
> >>   };
> >>
> >> +static const struct drm_display_mode waveshare_133inch_mode = {
> >> +       .clock = 148500,
> >> +       .hdisplay = 1920,
> >> +       .hsync_start = 1920 + 88,
> >> +       .hsync_end = 1920 + 88 + 44,
> >> +       .htotal = 1920 + 88 + 44 + 148,
> >> +       .vdisplay = 1080,
> >> +       .vsync_start = 1080 + 4,
> >> +       .vsync_end = 1080 + 4 + 5,
> >> +       .vtotal = 1080 + 4 + 5 + 36,
> >> +       .flags = DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PHSYNC,
> >> +};
> >
> > That looks like the plain standard 60Hz Full HD mode.
> > Is there really no other copy of that structure available in the kernel?
> >
> > auo_t215hvn01_mode is almost the same, except for .clock and .flags.
> > drivers/video/fbdev/core/modedb.c has the same mode, but in a different
> > structure.
>
> The panel-simple.c is full of similar-ish panel timings . The timings
> above are adapted from the waveshare DTO for this panel. What else would
> you suggest I do/use for this device ?

I am just wondering if there is a better way for panels that use
standard timings.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

