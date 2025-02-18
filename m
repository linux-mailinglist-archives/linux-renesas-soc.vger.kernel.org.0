Return-Path: <linux-renesas-soc+bounces-13291-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7ABA39FEE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Feb 2025 15:33:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58B4A178606
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Feb 2025 14:29:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DCAB26A0F4;
	Tue, 18 Feb 2025 14:28:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49266269B11;
	Tue, 18 Feb 2025 14:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739888923; cv=none; b=KPYqoMqqNQ2/j2MLTYDqLAh9nZGZbfBgDZxR0bZqFXt+6iSegHKDCPsweS0am6ZWhA1RAv3JCNtHeNLwzgrsVEC9/7LPC/Q1ykz0HUTMnyTevZbyeQ9BbgulagHw+E2mpxnGUwgiIuBwBN30ziPs/+T2vvLSRqtlpe15HhtXJ10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739888923; c=relaxed/simple;
	bh=Z9rlFMQcTaXGXJtgSgn0wszw+r58kBJN6c8X9V6cb/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GrkwdimDsSdQT95q1uF0r75uxBPQvmW0nOfjRL4WeXcB9E/P31Y+g6Al0sXxJJNz+5N6JGt5FAs2LPDQMD78HfJd3Nur18w3+YinYM4b5pJLXkZKrnkwszEe+Mmip5WAcXgJmsnCZIbpg/9cdO6PXg5HaI0qz7C7TEgzScOoQ0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4be55c93be1so439814137.0;
        Tue, 18 Feb 2025 06:28:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739888919; x=1740493719;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WM9l/UfrQw+Mtu9b3G/axW371PcduIizjNc8jc9K35M=;
        b=OCBIvK2IURWajHd8Dhw1mqChZHK9Aj3dfz4BH+OnEbDl4a7e4er2fnfB+rmZt0imwv
         dxwt3GX8dT7GJwW1VBEhc1yA30FI1l1vzXk8+sldiz6RzFZK7JbkU6cZ9kB0hE4waScw
         rP+pWq3rn9C+A8NzxiqDThOlvpcvqcsMmARNa/Y9urUvnQWk6AHViuQ9Hz21gjfdBsg6
         +Ghw8Kyw+4Lp8Coy6K+kkCxvMvz04X6D4+ztBS+crDvewLmsfqHTO4IyflpRZkAUQvC6
         +x6Nsnz8+scFWxlsmVQTZ/E7tYT4scJy9N4X33EyvhWtNO+NTQ8uVf9Vth40zdL7Nifd
         Q3lg==
X-Forwarded-Encrypted: i=1; AJvYcCVcyHwZjY8vXgSnCQXAKPgC0n/GG9T0UDNo2FvX0ObERVW9gTmmJFCPzufkn9aDg54Mjdo92KwEewc=@vger.kernel.org, AJvYcCViWD/YlT0z97eezlKoyUIhmb18SRXOoxq8Xy0QdrCvuZ2NKAMoAjsaChE+N8sfqz8J3PxGM6SnooNKb/K7NhVd7Qc=@vger.kernel.org, AJvYcCXjqIlwy1Lxqd/LiAHNCPlrkBj/0ph8b0LT7rnnZUHoOC19/6Z8cxqF4KpyN9g72+fUhtJYfl4ZkKRwVlKb@vger.kernel.org
X-Gm-Message-State: AOJu0YyWOHoBbXwk/UQp+AWKaYrvbHd+UIFFNdIG0ljMNZXjIrWXgxy5
	C9aRs5iuDAY4BXSAIf3V0Qtlh+fL8AGY8nBAJR2IoSp33zsyX4Cwmv6qtTf7
X-Gm-Gg: ASbGncvAIDYVIZ1L+tcUiSQ/Fc3Kliw3T7JTV7FgtX7rBEblB4bSONUlkwCxPwilRoM
	XJy3Yia3ZNcMSpIiLy3CtGzl7kNpz1oFBQuvSyde+lT8li6yiiCq51P95dwZEqSrIEAorMmLy11
	cPJ9LXJrloYAFE8nYwG5HbUEQYa4doA31vrKQkCR+k7LlvOnEbi7u6W82vcL+cuAPNg+63T8Mba
	RJOJ26Jny8RTBwFHgoIGU8njXiasAtI7yLHopNi5CJIsnvwKO1puyHXuSfOZ+IC8BDQ6M9VCcat
	S2Uz5x4EhV1KODd0WgfJE+7cZNeaRSR1sUtFh7lzpVvKHC2q47qK6oLRyA==
X-Google-Smtp-Source: AGHT+IFom9kAQjltWdnqKeMQcEIOS8FlqBQ02cRRDUXOCckSGuhBu8QQ5tyByph0ietrOGyb0X485g==
X-Received: by 2002:a05:6102:4b0d:b0:4ba:eb24:fb02 with SMTP id ada2fe7eead31-4bd3fc818c2mr8746030137.3.1739888919229;
        Tue, 18 Feb 2025 06:28:39 -0800 (PST)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-868e86cbfa7sm2457763241.31.2025.02.18.06.28.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Feb 2025 06:28:38 -0800 (PST)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5209ca3e9a6so995232e0c.2;
        Tue, 18 Feb 2025 06:28:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWfugqgNPFcZeWn7UyJ69DachFm2Pdr8VHRF4zkj2EwUmyuln0SlYf6bQDtK7/sOwsnc9Dh4SnRj5uFu6O/fd0GTyQ=@vger.kernel.org, AJvYcCXLrsiIwxZnUWw+WLqizsCEvrRFx1/XVeiym2Y9Pa14MIraylxOF5z75iO3RulfmqUD+1ikfNIlj6Y=@vger.kernel.org, AJvYcCXi+cqKhWYacfepBRdbs5erSBjDj3DWJOe1sksx1K5rmjh2k9djsTwuQGagm/6Dg+HyMLzmFPa/wezFglaM@vger.kernel.org
X-Received: by 2002:a05:6122:488a:b0:519:fcf2:ef51 with SMTP id
 71dfb90a1353d-5209dbc02a2mr7024460e0c.5.1739888918607; Tue, 18 Feb 2025
 06:28:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250217105354.551788-1-thierry.bultel.yh@bp.renesas.com> <20250217105354.551788-6-thierry.bultel.yh@bp.renesas.com>
In-Reply-To: <20250217105354.551788-6-thierry.bultel.yh@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Feb 2025 15:28:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXAfrLOFFbt63tJvU_g08zCR_QBQQMzUz-Ceg=G5FQnOA@mail.gmail.com>
X-Gm-Features: AWEUYZmBgG79ffvBXB4gPQQg9HaeWPl4SFfOE4EOdmrMgWSoOWsSQYwJL7kGJYE
Message-ID: <CAMuHMdXAfrLOFFbt63tJvU_g08zCR_QBQQMzUz-Ceg=G5FQnOA@mail.gmail.com>
Subject: Re: [PATCH v2 05/13] clk: renesas: Pass sub struct of cpg_mssr_priv
 to cpg_clk_register
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: thierry.bultel@linatsea.fr, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Thierry,

On Mon, 17 Feb 2025 at 11:54, Thierry Bultel
<thierry.bultel.yh@bp.renesas.com> wrote:
> In a coming evolution, the registration callback will need more parameters
> from cpg_mssr_priv (like another base address with clock controllers
> with double register block).
> Instead of adding more parameters, mode the needed parameters to a public
> sub-struct.

No SoB?

>  drivers/clk/renesas/r7s9210-cpg-mssr.c  |  7 +-
>  drivers/clk/renesas/r8a77970-cpg-mssr.c | 11 +--
>  drivers/clk/renesas/rcar-gen3-cpg.c     |  8 +-
>  drivers/clk/renesas/rcar-gen3-cpg.h     |  6 +-
>  drivers/clk/renesas/rcar-gen4-cpg.c     |  9 ++-
>  drivers/clk/renesas/rcar-gen4-cpg.h     |  3 +-
>  drivers/clk/renesas/renesas-cpg-mssr.c  | 99 +++++++++++++------------
>  drivers/clk/renesas/renesas-cpg-mssr.h  | 21 +++++-
>  8 files changed, 93 insertions(+), 71 deletions(-)

As you forgot to update drivers/clk/renesas/rcar-gen2-cpg.[ch], this
breaks the build for R-Car Gen2 and RZ/G1 (e.g. shmobile_defconfig),

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

