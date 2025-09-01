Return-Path: <linux-renesas-soc+bounces-21109-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C21D8B3DEF7
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Sep 2025 11:46:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26D26189D420
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Sep 2025 09:47:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 618A02FF16F;
	Mon,  1 Sep 2025 09:46:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DED25A2A4;
	Mon,  1 Sep 2025 09:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756720009; cv=none; b=I27D9KUUgRCBB1q9t+109Cvvq6D4vWA22bmIhvqXkOaXvC6j5eG37Q2WkxeKuxzpc5/h1slmECuxUY8U50jiCq3TzqHReCnax3is4QGQ8HVOtDOWKmjDXEwL/JtUovhG2Gtgdmsh/NcBfj/KYLF2d3N9sCyg6AMAe4EYkClwOVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756720009; c=relaxed/simple;
	bh=WhbgLgAfQTMGPDcA6stiNJasQDKU/EBukH2kJsAsKe8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LsPnIgFvdxeBQJEra00liAMbxFD8uyL+S1wd25pNXxVmSwsSI0io561nOtUEe+iCV2ZOWOgYGiKYk31nbJgDCJXJK359NzXgHzlYF9/38AbuXgm4N1Gwpq4RSHjCJWt0Ie4a+4RPtMlnjSaoZbN3AZvLpuqr9zeqKaLCZD2jQuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5449432a854so1269278e0c.3;
        Mon, 01 Sep 2025 02:46:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756720006; x=1757324806;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bPKwAyL9UdPz2i3tqzNIzvOjss5rG+rqIGyHJh5GmGE=;
        b=tLgI+xm8gv6S6sPQbtbAphG6FhE0M4NIYr+oEwofq1mgt/C4QFpdytBns6aA02iEf6
         oL4E17emRS9FZohS3rEcK064XFLSXxkSk68FPPY070CrUCo83VNQPDmTULSe0u9lp+Hh
         YTwf922qf+Ph/s+NHZjQIArC/deIijX/L9ky3IchKi54kf2w/GtJmjmmF3f6mnPxB2K9
         cXCS/QqQsMxlC6yFPwG6rSQQl8mmNyYcoTAsLvdbMVN7cVVBebFP4Gc79D6nPAK5hURq
         2iJKERmugaLrF8fvVsbo5CS1BvBxhd0p0bZ47ewdvNRu5hZ4rS9HpjQkQQXkIyFLv7v5
         UnzA==
X-Forwarded-Encrypted: i=1; AJvYcCUQducaANzHE2B6+iGFRjVLHikp6kZJU5PpWpTp9vfXFvFOLwKUU8hGr/AkE0JRHBKDrr/1A0TOwXk=@vger.kernel.org, AJvYcCVkK9zXSRYYA8pEfhMDK0ZCRZpGlIOXBjbGwUCBbqFmOb5HqtPOFCUujLNj2Mo9a7MMc6jFYZE9vhSg9jAlzRoEOrw=@vger.kernel.org, AJvYcCVx+dKtkNlw8886NZAJn0qkb4L35SAmv+XBeUZe9jfMGv/FCz+PLmv/j+KU/YtU4t/e8zPb3Bq1EvrJrUt9@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr9Z2L9tNmag5Ug3MYlNwvJ0j00VJi392imZ8kMuwVDbiGueQI
	7OMGlohko1e6QkfCxaPP0QWauuSiPGrJhPWtCsIF87AI4uh9ruVFk0vHUoDQXsiX
X-Gm-Gg: ASbGnctxPPxrJiT5rmxkW9uEYWTeJIkTywcsmmNAqfWjUMwTKHs5X7UrIQVl/GchREs
	B7raRClGq5WX6cwlEyBPKd+Dhq41LgfxZLeL6K4f77d1gDZC6HI2L/cWHC+g6X9s3GXr2IehCl4
	ADM1cTjtw2Jk3xJi41nMfdqAeFYSghZp/Ni464Qg4utDZKva/D9I0qKFE3k4L76BvISnsjZpSVX
	RruNwXItELC0Uazcksfe2gX/vr49mi/TulJ3tkoLuKcjOvazQwvxPiUoRiNLJ29u2jjyj56/ONZ
	oImyZAIjb1F3u+oFqVyggxGfHVUEPRkieBrHW5C5BXUbpA0xQoNcsbScE3Rb8hvAeSoUofzddR9
	xuZV/U2d2PxFPckeETIgKLIAW4CakAgFkF7V/swSWpMQHpTkEv18rLtGN4zYeHAN9
X-Google-Smtp-Source: AGHT+IFnwm59SobkBkr62kCz4jSM/DyjEiIMexUaKM7PaozJx3i98J7pntaQGXNuXj75D98fgYiiIA==
X-Received: by 2002:a05:6122:4687:b0:544:7d55:78d6 with SMTP id 71dfb90a1353d-544a017154cmr1745053e0c.2.1756720006269;
        Mon, 01 Sep 2025 02:46:46 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-544914c10c7sm4170074e0c.30.2025.09.01.02.46.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 02:46:46 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5432dfa5e8eso3148669e0c.0;
        Mon, 01 Sep 2025 02:46:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVlf/RE8aRKlGYDl4lJOuddEBMSZuHSvo/GmBW9GIeHdWT+XpIyiLhfnNxPM0u7FvkRsdFMSXWwcZ4=@vger.kernel.org, AJvYcCWSOb7kuYNqjlQpsNd4zaxuZjFit0+3sfckuNUJxpZozl3/dzH4XLjO1lYJIUDjPwP9/6J6MJ5vh0sLkFqo@vger.kernel.org, AJvYcCX+Z8uo+umv7xTw1XYMp7y2/xQJe1tFQ+cIsJqVpc7gwPXIJaSSY6Zn2E/f5ozhZDNqY2xKMYsGitbU7ITvS/aqTDM=@vger.kernel.org
X-Received: by 2002:a05:6122:2219:b0:531:2906:7525 with SMTP id
 71dfb90a1353d-544a01c856bmr1903553e0c.6.1756720005789; Mon, 01 Sep 2025
 02:46:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250821080333.27049-1-claudiu.beznea.uj@bp.renesas.com>
 <aKyX4YJswZLuqA6Y@x1> <0d71269f-1c78-4732-8235-5640bf340d00@tuxon.dev> <aK2gE0CysSWisFwB@x1>
In-Reply-To: <aK2gE0CysSWisFwB@x1>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 1 Sep 2025 11:46:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXNnGg0rEcM1hvvjBUJXFFAx4oiX=qVb3nKfmd4YBxhGw@mail.gmail.com>
X-Gm-Features: Ac12FXySlzljzJBVQIh8T5D4LvHlbiTfXVHCTZ-xPjSYu4UAWotdvWAobnJMb5k
Message-ID: <CAMuHMdXNnGg0rEcM1hvvjBUJXFFAx4oiX=qVb3nKfmd4YBxhGw@mail.gmail.com>
Subject: Re: [PATCH 0/2] clk: renesas: rzg2l: Disable unused clocks after resume
To: Brian Masney <bmasney@redhat.com>
Cc: claudiu beznea <claudiu.beznea@tuxon.dev>, mturquette@baylibre.com, sboyd@kernel.org, 
	geert+renesas@glider.be, linux@armlinux.org.uk, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Brian,

On Tue, 26 Aug 2025 at 13:52, Brian Masney <bmasney@redhat.com> wrote:
> On Tue, Aug 26, 2025 at 02:01:56PM +0300, claudiu beznea wrote:
> > On 8/25/25 20:05, Brian Masney wrote:
> > > On Thu, Aug 21, 2025 at 11:03:30AM +0300, Claudiu wrote:
> > > > From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > > > This series disables clocks that remain unused after resume.
> > > > This is necessary when the resume process is done with the help of the
> > > > bootloader, as the bootloader enables various clocks when returning from
> > > > resume.
> > > >
> > > > On the RZ/G3S SoC (where this series was tested), the bootloader enables
> > > > the SDHI clocks (for all SDHI modules, of which 2 are used by Linux and
> > > > 1 is unused) and the clocks for a serial IP (unused by Linux).
> > > >
> > > > Testing was done on the RZ/G3S SMARC Carrier II board.
> > >
> > > Do you think that other boards would also benefit from this change? If
> > > so, what do you think about putting the call to register_pm_notifier()
> > > inside an __init block in clk.c so that this same change doesn't have to
> > > be implemented across various clk drivers?
> >
> > Yes, that was my other approach I was thinking about. I wanted to see how
> > other people consider this version.
> >
> > > Alternatively, if this is board specific, could this be fixed in the
> > > boot loader so that the clock that's not used by Linus is properly shut
> > > down on resume?
> >
> > As a result of your request I did some more investigations on my side, I can
> > say that, yes, in theory that could be also handled by bootloader.
> >
> > I can drop this and try to do it in bootloader, if any. Please let me know
> > if you still consider this (or the variant that implements it in a generic
> > way) necessary.
>
> Personally I would go the route of fixing this in the bootloader for
> this particular platform.
>
> If this issue affects other platforms, particularly across multiple
> SoC vendors, then I think it would be worthwhile to have a discussion
> about adding this functionality to the clk core.

How would the bootloader know which clocks are not used by Linux?
And why to offload this to the bootloader for resume, but not for boot?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

