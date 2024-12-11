Return-Path: <linux-renesas-soc+bounces-11210-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E56A9EC6D3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Dec 2024 09:16:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E13428210E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Dec 2024 08:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 855B51D63FF;
	Wed, 11 Dec 2024 08:16:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A9C1D5CFB;
	Wed, 11 Dec 2024 08:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733905001; cv=none; b=JIy8/QsOtcV9Rl+n2zW1afwUc87gR0Zs6ltoANnTDedyO9bkwC4xswVddtaNN4o1g9HSnsNB+8yLNzAMVkZIZqgzBe+XIqYcqb5wcpJyZcvwCy+yJBDoaqPHxtBznA6EkB03GYCLSrUyL/XjNkPAbkTjKQlLQewg02yQ6ayzSh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733905001; c=relaxed/simple;
	bh=biO91JnATLAGSRO58Hw1O7G20km0aNxHEm4JoTIOAKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u9SNmVNUrSV65D371MVsRDm8ADBCJgjloACcPYKCqvrA1yQX3yqqiSxh3IT+RagiFKehTOXzX0+nO2kmNTSYVpI5WWTQSIKo7bafOnIHTHQikHu5dI2V1fa2RGoD+qt+tTiWJqoWMiZAMRcWesy4k9PJPEcgOfkAVjvKPzpjenU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-51889930cb1so622147e0c.0;
        Wed, 11 Dec 2024 00:16:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733904996; x=1734509796;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5FY0XX7TvU9anI/w2FWrAwi4RB2/V1Am38o5HNJIjvQ=;
        b=DGZ0ypmFUK3MuGngPGmwSnZt6zBttBqkUM5FPeLEs9qDvnwE+ZWm3uKFKPVuoIzlhR
         stUOVlMS9G1MaVhqMihpdhB4T73Hx9zQ4J3mlHN3AgnqbzSbNavR9RMg3fWVJLAR7WpF
         sEUlSySY2t5wqBBTuQsqBgSbjLAKK6roHdYKbN1lH7/Jv2hJkrjMsAhX8xXpu1ErEHsF
         pp/PIxVdcbiFUNX848YP2xKBK9YPMxtlKg0uJWvfLjoYRD+b8AhwUd5A3mCydGen8evz
         PtIhaYBExiDs0Jks1zURzTLJIcnedwxfd5ATvGP6UoMqyVHdHTAW2tCS/CaO5toT1l+S
         sYSg==
X-Forwarded-Encrypted: i=1; AJvYcCUIz9QDK2fuQCZQW1tse8E3gNvxMcbw+8Qf11057nWhjGn1nwDoSgvtoXc1ycwoFtf+SHFqdIHHYbmH@vger.kernel.org, AJvYcCUlYaanKgJr6wqPVIMaD6GPQM2le6mTIkWXbEOrn7jvyHf5gIwXPlDd29w5GNw5Z5Prm+dU70gYl8u+@vger.kernel.org, AJvYcCUpXUF6AyLZ2WPknG9lGQKSCHQlkx1CuPOy9H9xsgMBJbhZXvbD7J5URyZmkg0cm2E9/vmOEVkHHEBv7Bl9Wvlq2pQ=@vger.kernel.org, AJvYcCXvfl9CFqUcTJcN1KFe9ZOTVjC3jB0tkPmn+On/OKFRYYxoVm8loz6KuynJ9ybhmQXZhP+pjY/Rf3g90zc+@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0UsyqEnHFuXS9LydWbipJyCoAFpZSvPiD1M1DXgNByHCh9G19
	XYUmerd9grUjwZlYmKOO3AoJgMXxBm1cVasL7Ge9/5mSr/YFQknBBgIqSJmG
X-Gm-Gg: ASbGncu3VYhWe9cs2s1tLY8f35Zi6wOG+Kj23f0Nsm5TNgpj+KYOvsgLdQ/jdCYSZi8
	/Sqd68TmZ/5R8tULQePYfH2MugY24qaGMVmly9ZXCP59W5+0sDWn5a0RZGtQeilyFtckGVEE7XB
	JBseAnoS+6nK1RbPDNCf9sIoiWb+iWqLHBItpovM//X/BFOY6f4x46vzTcDCrmVMacjqzFlisxJ
	CQnCDb4vek3aYPdPyAO/EP4fNJCcsIVL5F/LVaFInWyzcdNUObvO2mtCpkU/7KmPaBGuUn6EddP
	07xk15t3+p8iGeMW
X-Google-Smtp-Source: AGHT+IGyFRKJPR/XDq3+Fa87B0TS/OBCS3zjgdrPOSgETVivHf9G7+1buM4yxq0mWBmA3QhiNRZNYQ==
X-Received: by 2002:a05:6122:2a4e:b0:50a:c70b:9453 with SMTP id 71dfb90a1353d-518a3c21c53mr1847644e0c.10.1733904996551;
        Wed, 11 Dec 2024 00:16:36 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5174fbc9923sm482141e0c.11.2024.12.11.00.16.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 00:16:36 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-85bc5d0509bso1321341241.1;
        Wed, 11 Dec 2024 00:16:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVsDmfi63mbGMlpkth50wrJCwcj6FmfXtUmhwtAv+hNkHUw1qwXyI9rN97QVNYhV3+C4Ex9z+tC41TFGxCR4bYSzyM=@vger.kernel.org, AJvYcCWCj4WsyXKciNBDD8bO8wcQZLH8QavUoV6uQ9GNq2eMCgvXPW9Sf/UUoMs9c0J+iPZDo6x00zqwa7Cf@vger.kernel.org, AJvYcCXJEd7oB0PXrjcdUlhzAZyRT5c9LTMBCYgTknxO7cYxM3XJ74DirCnXGKz+a/B7L+XikD4pQlPrbO8O@vger.kernel.org, AJvYcCXlKQJ6Bv4wfNTV8IBNob9QTHL8PwLMMAe1ryGCRXjaoWZcT5YaoVofQmeWuLu3z/BKe6STfbjLXsx3ktr7@vger.kernel.org
X-Received: by 2002:a05:6102:5108:b0:4af:f275:e747 with SMTP id
 ada2fe7eead31-4b12912a99bmr1969256137.22.1733904995896; Wed, 11 Dec 2024
 00:16:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241206-rcar-gh-dsi-v3-0-d74c2166fa15@ideasonboard.com>
 <20241206-rcar-gh-dsi-v3-10-d74c2166fa15@ideasonboard.com>
 <CAMuHMdXMt74okJjqinLwrVmf5hZFm7YQkE5s3u2F9AOTWk+zXQ@mail.gmail.com> <da31d29e-6a2b-45fc-bb16-3ee78be41d66@ideasonboard.com>
In-Reply-To: <da31d29e-6a2b-45fc-bb16-3ee78be41d66@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Dec 2024 09:16:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXsmnPrXSWqh_JN04d+Gh=X=4SWKEWZyfUE6Mim97d06Q@mail.gmail.com>
Message-ID: <CAMuHMdXsmnPrXSWqh_JN04d+Gh=X=4SWKEWZyfUE6Mim97d06Q@mail.gmail.com>
Subject: Re: [PATCH v3 10/10] arm64: dts: renesas: gray-hawk-single: Add
 DisplayPort support
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	LUU HOAI <hoai.luu.ub@renesas.com>, Jagan Teki <jagan@amarulasolutions.com>, 
	Sam Ravnborg <sam@ravnborg.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, linux-clk@vger.kernel.org, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tomi,

On Tue, Dec 10, 2024 at 7:10=E2=80=AFPM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:

> On 10/12/2024 18:34, Geert Uytterhoeven wrote:
> > On Fri, Dec 6, 2024 at 10:33=E2=80=AFAM Tomi Valkeinen
> > <tomi.valkeinen@ideasonboard.com> wrote:
> >> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> >>
> >> Add support for the mini DP output on the Gray Hawk board.
> >>
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com=
>
> >> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.c=
om>
> >> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > Thanks for your patch!
> >
> >> --- a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
> >> +++ b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts

> >> +               compatible =3D "ti,sn65dsi86";
> >> +               reg =3D <0x2c>;
> >> +
> >> +               clocks =3D <&sn65dsi86_refclk>;
> >> +               clock-names =3D "refclk";
> >> +
> >> +               interrupt-parent =3D <&intc_ex>;
> >> +               interrupts =3D <0 IRQ_TYPE_LEVEL_HIGH>;
> >
> > interrupts-extended =3D ...
>
> Is that just to use the same style in the whole dts, or is there some
> specific need for the extended one here?

There is no real technical need to use the extended one, but it is
more concise. That's why we just converted all such cases in Renesas
DTS files in v6.13-rc1.

And of course it reduces the difference between
arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi and
arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts.

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

