Return-Path: <linux-renesas-soc+bounces-26400-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B50D7D02109
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 08 Jan 2026 11:15:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F2348300091E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jan 2026 10:15:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFA852E62A6;
	Thu,  8 Jan 2026 10:15:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652D83B9618
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Jan 2026 10:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767867319; cv=none; b=hZRt+iA1r3QxcFOJtYb7Q5p7od2g2QHbXsZjurlGWblz0EpRQGhv0idnx0Fm2WfWm8fAoggRvfgKXJKL5fOJniz2hDk4DYUczptFc7qsRhxIQvYQijRb1O93Vid+1vvDfZ80OWohuXcs0sKfHiln+bYWKkAAR4vkO39Jc4dSVcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767867319; c=relaxed/simple;
	bh=qUL212flFDahD/6ffUYSCcqiVwzBfficZRvhB/Cc01U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E3yLqU1Y1QISXxzF/7OKHUvxvf6ximUscg7cMnLV8lHCJXv3d6rdEY8cs305qTYtj5NiDOma+9LU5d/NMqmUgT7ZbZ82vmU79MO2VWODAkr3mHA7PdnCzBA4fu2TLMsbMgOwARuq/NGfVtubfo5erMGj0uwHwN3YvAcQ+JNCzHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-55e8c539b11so1973291e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 02:15:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767867314; x=1768472114;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Maou6BH7r6RH3ZaVPVn26zKFMmYODSOolHw6UhWYin8=;
        b=AoqAPhX599lzSrymV3qtb4lP07QfgcaXEhUG3wLeqdZmX1NJpE3B56g3gt65lrirD8
         KoNWwLXfQjQabA6+qnGPDfZSMQhu+iLP+RPCdRSTX1k8NWiujhnoqk08/n5b637qvsFP
         7ffim5jS6WREsO18UMpA6Z9ZSw3LjXgvN9ExmkoBCk15HlK3XN6qxS+4Dgb3PviHaWd1
         5S4tVygbdg5s5Oz1EvjtW6n7Bwc7DwRGSEmQYDyTw1ecM8X1gdofTgGHPvCteRTVNyPz
         VGMTfsW+n/LCTQW5ZK2buux3HbxJcW1+oqTJOY0ToAVU6n1eh4og9LcrwTSLvpYv4Ivv
         l0ug==
X-Forwarded-Encrypted: i=1; AJvYcCVsvqP2VOaaUU8cYZKAd8VtVLJ4Rv1/18sQ0OMzO7HbLi1Iwee7oMvBFjpjCpIcsX8ywt+Xp6fgbKd6mh9ulV3bWw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa9ECjFtMb66Z/n5I4qHaGyhov6TvZFhCKnqLLxA9r4L7pR67D
	soyrPrJLQnhev706r52GlEljVB1WRE6gaYS2AruNsmiRo6DzA8aqomeLUsB8ggQh
X-Gm-Gg: AY/fxX5h0e1c9viHgSqExBYfxmHZjF7jN226mxE/o6CmY6Tql9cUbltTPNIqUIwgFK4
	GWikUkx9KX6htNYhfaJsY56lwQ2HK/uDZD3XdL9+edoGhwH7fnjaSfe4P6atEI0VhoA/velFg+Z
	fuTj+GXHUuws/B5eKVGEkD8Exh+ZOeSiDCguORrkQp5R/YRbgEhnPt1mMaJARxVoM/mtVH/0Xkv
	mx8GbiLC8gITDWyiXulQejFJPTk18ZXoDFtJxUyJ2vgtiN15JatFweMhyb3Uobtsg1T5tkTm+F+
	3Kl/hBBgv2W384XRaRsJqVfaAR0ZSNjQWyvKsF6Yl0z3W7taxRNugP+9L+JM2Bw1yQrZY9CZYL6
	WDzEka9JrLXM8z7xMFNXHMepDbFfbI9qzdvMvq8DRmx+2nivR47I6STSr8fkHOMOMiDd6YT2NpC
	MWEkX1xZib/NUNU8q6MfPX1SQ57DZL7mqEXaf4aj6ga1IKnya4
X-Google-Smtp-Source: AGHT+IGfZUw5UF1uPcXtKLKEnxjkYHukVnnV3w89ql8k0BUINJ+TLp4BmDrBp1WxgE349KdKLUZEBA==
X-Received: by 2002:a05:6122:17aa:b0:557:cbc5:ce0f with SMTP id 71dfb90a1353d-56347e8ed8amr1772584e0c.8.1767867314244;
        Thu, 08 Jan 2026 02:15:14 -0800 (PST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5633a41f813sm5560738e0c.18.2026.01.08.02.15.13
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 02:15:13 -0800 (PST)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-5dbdb139b5bso2592837137.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 02:15:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXEDUUf6QeIIHfABVH8l69BTM3+/KusR4BE+P5qEi9v/VHt9z+ltT4mmbmO6P17s4BbZbSoXyK7qjpFNe5EC0Uwgg==@vger.kernel.org
X-Received: by 2002:a05:6102:510d:b0:5df:b7f3:5875 with SMTP id
 ada2fe7eead31-5ecb1e8db9dmr2052457137.3.1767867313695; Thu, 08 Jan 2026
 02:15:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251224175204.3400062-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251224175204.3400062-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251224175204.3400062-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Jan 2026 11:15:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVxAXM5uedfTEhz0e77d540pcPm7Jt1+Dp413EdbEcGyQ@mail.gmail.com>
X-Gm-Features: AQt7F2rKOKuH7gQUPtii3LQr-jq-bYfIj9QEIEOOmeiAbmQQSfGdkB_nOYjU61M
Message-ID: <CAMuHMdVxAXM5uedfTEhz0e77d540pcPm7Jt1+Dp413EdbEcGyQ@mail.gmail.com>
Subject: Re: [PATCH 5/6] arm64: dts: renesas: r9a09g056: Add CANFD node
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 24 Dec 2025 at 18:52, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add CANFD node to RZ/V2N ("R9A09G056") SoC DTSI.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

