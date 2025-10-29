Return-Path: <linux-renesas-soc+bounces-23838-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 79684C198C2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 11:01:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F7423AE863
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 09:57:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1462326D50;
	Wed, 29 Oct 2025 09:57:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D30D324B0C
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 09:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761731868; cv=none; b=u7OIjNHimAkivBhHXpfaX6qz0LrHbZk7fmsqVp06535zPiKCe/L/jZziIl6eMB7g9mux4wNvCUQSsd89Iy93jAQ8nHazcWVQSGLYaW+lJ03jnIi3tv6kjA83V2fpU0WEtrvpM6sIzHhks4CZfnzwizYX7MzbAp9bUtaK/EPPBWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761731868; c=relaxed/simple;
	bh=IweiXgCGSTcWk84hkztn3L1XxFL8azlSQtQNHVBagoI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eluUZieX5xPDONlyU4RAbeNH87oynnD0g5BQopiAQ91kIXEOEyu9KgWP4/Pxriaft7mDfM90Cu2cN52vFslgBPl0paftjaRPvvWWiQ82OaLpOSUQYcWybX0WaE4gTf3LSJYYKac24lHqMOiD+OUQsmUMjeUvKoal3R4Mq8u4rlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-932c3aa32f3so3534194241.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 02:57:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761731865; x=1762336665;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YD5oEw9KpWTCKMSH/QhCUmd4lqd59nHSldHu11wUAyg=;
        b=Wy3dLKzmuR+SyIC8h3P6/Dsd4ZzTtHF7tEsEWHXYFJX7LhwBzT8g+OcfnW8bb7dIwG
         wcdNlbeucIfIkSs7SXX20hdNGYWUhJBMhz8SKhZB1rJGKpiES6/p/IYKXhNUT9aKSwey
         7htfD1fPZUrzMH6NiXHvjFxP08Bmv7sDRjc1Gy8t3KtIx71iZGZPyOiQm8McJz9WTWC/
         2jtqrzxrz/vHfw6jUdR/qvM0jfuMnXHkRRVRSP0Syyi+5dtHyARPvIT5f/18FKDCroI2
         m625Bt/hB+A8fIFuogrD+oWsdrcRAZjCUkwH4Lyv4DH5HOWyvUWNukMea69M6bRuW9sB
         gkIw==
X-Forwarded-Encrypted: i=1; AJvYcCWQCGlZRMxDvxVAE4Z4kj/iwyyLmKDDbi7+Hf+9osHvl50O5XSjko9xQk6ws5ZdfSFAHPmnQF1V/4+d0KNx6zJikg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZclq03960vQ6nK2EoF0NlWeF5wlZrt9HD9s/XwmK/BFkw6w7G
	K7iovvgUFA8taWDJGPgAIMjezDfbXrRWivA5WX8NikfKvqFoy4d51sDbxroGhJOm
X-Gm-Gg: ASbGnctoWXOzGN/4GJsd8+kEEQCc7o8tSCSSzQTGGYgZibiOkWjgSve/Gu+hiDVqkWM
	y3jcREWSeT0c3I9wI/ZsKrjOL9a90B5XFCFKf3/F9t3GkCzQuZ6xTVKOt6u8r14u1VsRgHT/47C
	NShccaIv9KU3yKl3QEvO7ELFZOsTBSYJC1G9ZzUL71v5/BmLMfZcTVI1lOOfBQUiY+0B1ths2Pd
	cfUc2PKqIp6dk2fHMqYOESTSm1P0ePmZ3/eVvDDBdsGUldhKZtYq75In3gEpqgSMGzN3Wr9VB3J
	SeBvv+3v46U0ijYF4rSWM3xZmMii3m/zWQVvjy8NgN1h2zAD1PeZlNT50ExEZvqcO+xutAJEB4u
	qp71CV3ZLmM7Xbx7JuwsIeCjogE9H8uk1DOxADxWHo0hYCBEiXVkUx4+Tnhw//S19yvDsZyZ9NS
	ZgzgmqFsclMRH+R/jBAkYPriQNmLwRJHtYVK05obAsUJsk9tDp
X-Google-Smtp-Source: AGHT+IFF3bsgorSXnkUbSppazKvWpNZsL5VcX1UGqiozweyjhmfpTvMx20XEHsvTyAagUHAH7ybw9Q==
X-Received: by 2002:a05:6122:45a0:b0:54c:45bf:f46a with SMTP id 71dfb90a1353d-558140dba99mr569656e0c.5.1761731864756;
        Wed, 29 Oct 2025 02:57:44 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-557ddb9c3b8sm5178258e0c.20.2025.10.29.02.57.44
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 02:57:44 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-5db1e29edbcso3971830137.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 02:57:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU2BsMxDW6BK8k5A8tSZItA13TiOlDi3tpzsf6Kcz8rhJVc6wbqY25dVNjhWXxZzzhnkqoOBm3jtlXesjMIp8oV9A==@vger.kernel.org
X-Received: by 2002:a67:e709:0:b0:5db:25b5:9b52 with SMTP id
 ada2fe7eead31-5db90661025mr680222137.20.1761731864265; Wed, 29 Oct 2025
 02:57:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251005030355.202242-1-marek.vasut+renesas@mailbox.org>
 <20251005030355.202242-6-marek.vasut+renesas@mailbox.org> <2666bd0f-b2a3-49b4-9458-1b362d9d1b4e@ideasonboard.com>
In-Reply-To: <2666bd0f-b2a3-49b4-9458-1b362d9d1b4e@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Oct 2025 10:57:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX0gPyMNF1vwnkEcJRc99MbqXW_5SqSwrdy8BL0Nyugkg@mail.gmail.com>
X-Gm-Features: AWmQ_bmg6zSKB2wWHVpJyvexbPet5fvTCfuD320cPH6lsc_P7bdMywzhD0uB4Y8
Message-ID: <CAMuHMdX0gPyMNF1vwnkEcJRc99MbqXW_5SqSwrdy8BL0Nyugkg@mail.gmail.com>
Subject: Re: [PATCH v3 05/11] drm/rcar-du: dsi: Clean up VCLKSET register macros
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, dri-devel@lists.freedesktop.org, 
	David Airlie <airlied@gmail.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tomi,

On Tue, 28 Oct 2025 at 18:15, Tomi Valkeinen
<tomi.valkeinen+renesas@ideasonboard.com> wrote:
> On 05/10/2025 06:02, Marek Vasut wrote:
> > --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
> > +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
> > @@ -246,14 +246,14 @@
> >
> >  #define VCLKSET                              0x100c
> >  #define VCLKSET_CKEN                 (1 << 16)
> > -#define VCLKSET_COLOR_RGB            (0 << 8)
> > -#define VCLKSET_COLOR_YCC            (1 << 8)
> > +#define VCLKSET_COLOR_YCC            (1 << 8) /* 0:RGB 1:YCbCr */
> >  #define VCLKSET_DIV_V3U(x)           (((x) & 0x3) << 4)
> >  #define VCLKSET_DIV_V4H(x)           (((x) & 0x7) << 4)
> > -#define VCLKSET_BPP_16                       (0 << 2)
> > -#define VCLKSET_BPP_18                       (1 << 2)
> > -#define VCLKSET_BPP_18L                      (2 << 2)
> > -#define VCLKSET_BPP_24                       (3 << 2)
> > +#define VCLKSET_BPP_MASK             (3 << 2)
> > +#define VCLKSET_BPP_16                       FIELD_PREP(VCLKSET_BPP_MASK, 0)
> > +#define VCLKSET_BPP_18                       FIELD_PREP(VCLKSET_BPP_MASK, 1)
> > +#define VCLKSET_BPP_18L                      FIELD_PREP(VCLKSET_BPP_MASK, 2)
> > +#define VCLKSET_BPP_24                       FIELD_PREP(VCLKSET_BPP_MASK, 3)
> >  #define VCLKSET_LANE(x)                      (((x) & 0x3) << 0)
> It probably doesn't matter, but just wanted to mention: here FIELD_PREP
> is used with, e.g., (3 << 2). GENMASK returns an unsigned value, whereas
> (3 << 2) is signed.

Huh?

Either you use the unshifted value "(define for) 3" with FIELD_PREP(),
or you use the shifted value "(define for) (3 << 2)" without FIELD_PREP()?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

