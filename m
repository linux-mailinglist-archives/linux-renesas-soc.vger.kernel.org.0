Return-Path: <linux-renesas-soc+bounces-17346-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 163A5AC07A6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 10:49:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B5461883FF1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 08:49:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 621B0231A3B;
	Thu, 22 May 2025 08:49:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6302F41;
	Thu, 22 May 2025 08:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747903773; cv=none; b=Bdh0+l4zvGta6ABLLnLycej2qCEOaC/e2yC3194LPxvOyts4tzyncNtgLizXaradHBi0q7+PNNIDcaXlF40sYe3lK9ZjdKj2Gj4f94dXeBxAmSOrMAgb9FJ3pJaaw9DT/RylTDBEDlWlGtyaHPqXvqqlfvD+7HfRsiH9XDmZvVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747903773; c=relaxed/simple;
	bh=diUV6FuBWHRO+dnpY7lyQig+N/SKBhyPm4ElqrmP/Zw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SeRVyQNGtAflK+A+afzq+Jyf3oAFGeJdaQIheGjtVJCykbgj1lwo/zohXOBEpncd5OSorhcns9VHT6mAzzPzPJsAvSI2ab/bQmM0taBhQenq56vSc0f0oMpHbVeBD7yn02T5U5Eqyqblz3uxa9uPnpDnnFO5TwXlp6m9Do9hiMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4e11ee95b2cso4382924137.3;
        Thu, 22 May 2025 01:49:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747903769; x=1748508569;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XMDzjpi14pIXgTYzmUCQxmZst0UOGB8YnOU6dxCduls=;
        b=vzgvuGKcb9AfR1vjyofzAUQPmXibNizj06aKbig4IdsoNfw5czpTTZ+YbWtgocGmQX
         +3jDml2gml9ImlwBAT+wfWA8n5eNYhmKhWB++YAfj3DH2t+aF4Uyty22s42vtQGT2FF5
         36pfHH/2Cg+fjPCJB+ZO8CFs5SBV7oNy1RZdaIlRobNExAlNNewCZFq69WkV0sjYS5KF
         6+h8ItcinrBY7DI2/38ROzSOupsLQ9BC+mFokFOkS86wW9HWHd0TUTMls0lDRYaWMbzN
         GE0qteSNy/+0fYWzes8FQJT28GAUiMUxy3fr955dT8JWRQeVfR+bZQcEqHAv+UjvcABg
         kohw==
X-Forwarded-Encrypted: i=1; AJvYcCUJ1OztL7cmzmwGCKJCI/Jk5VwE5O4o/+tKKRSTLEvEsSrBbd6Cb5Zf4pY71g5p7ovQIWBpbaxd432oR4ZiG9JYY1s=@vger.kernel.org, AJvYcCURLVELknWG0TFBd5JxBx+IKbksO9UptybZ+FEmBuFPFSlX10FO1hREMRyV+/QUz9Y/thztWeJqHqaAxWni@vger.kernel.org, AJvYcCXv1/sxBILzQ3SBBmWTn+3xsOybCjK5XNvvWG4x1c6fsjNStkQrXI9EGHKOZp0/nzVsGprfq7+V+qA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcI0QN5rhHAQrOZWbEG3B81v5IOGh+B2FGrW5ijt7ESyqUpZrN
	EyzEE3hHfWWbhaBEbbxSRlLfPB0QaSUGcZ6iZP7M6YMuGP9dW23pzGZrwhU31hao
X-Gm-Gg: ASbGnctK+Ez6ndwmBWqxHVBb7q81mQi1Cb2niPMS5E1b4EGklTV7GqhZcgHU7Cclbc5
	cFBD4KArWf937UlZVhqNxROXxmeDORydarztvwQKGaohXsQcmlvjWjCLSyRdWwjgh2nWjegoU6+
	S+sjN+4+eQ8KnX+8qDj2AqQ0Vlirq4s5Sxy3sBBUDMgIfiU78q/QrCzeeN6Z+Ia/+tdzV/Lgptu
	be1NBAStaSwz/Bj1jItuUc0XVgy59SDsqENZOkwi0CAOdVu/jovbg3Sbh0NVwlNSe5vgmXP0QY2
	wpXM3KkCqIrpJmyVVmrgYcbIK9owfEsubpneiF32wCztUE8w0KMmiCTHNguiHYNgSK+NDQvVMg2
	3qp8YRvUMpMAE7g==
X-Google-Smtp-Source: AGHT+IGzA8ZG+kN6SYF80J6wHaaKAVwRaVIuLOrRDy29+4FtqtxKvW9YHtr1EEcpEzAQWyAxUFf0Fg==
X-Received: by 2002:a05:6102:5614:b0:4bb:e5bf:9c79 with SMTP id ada2fe7eead31-4dfa6c93459mr21740677137.22.1747903769363;
        Thu, 22 May 2025 01:49:29 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4e19508b101sm7532922137.29.2025.05.22.01.49.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 01:49:28 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-87bf5c80f56so3364865241.2;
        Thu, 22 May 2025 01:49:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU1UH9ZYY+BZA7xCaTVOW5hJG5eXIQQmnIMKkA6JWW0WWp9JS3+ZA2iQ0ZSmJ+Zdk7vPTLG+BHB5eM=@vger.kernel.org, AJvYcCUgS2m4oUO32zyJQgFUdrlIP4G29gpbPrMQAypHeX2GUnFz0lAgYDfRSbAqGJgyAsVK6Xntxp0AJA+zZTq4@vger.kernel.org, AJvYcCUwRLb72Afr2xIg6YkiHYULLbj9Gk/8Nq22aAFdnq0s1ZDccBFgJpsBKd17Eya5koQArg4GZx036mvRRRPzF5Tguh0=@vger.kernel.org
X-Received: by 2002:a05:6102:5e84:b0:4c5:4591:ffda with SMTP id
 ada2fe7eead31-4dfa6c7ee47mr23251283137.21.1747903768579; Thu, 22 May 2025
 01:49:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513154635.273664-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250513154635.273664-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250513154635.273664-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 May 2025 10:49:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVt-HXFUGdrrWAd68YZwvbN-8vgs2zBA017DRhT-EPcgQ@mail.gmail.com>
X-Gm-Features: AX0GCFulA58ZD_SpQdVdjIOmEW6zJV3lto6HR055lKSnnYF7rVshAMhSN79fN_Y
Message-ID: <CAMuHMdVt-HXFUGdrrWAd68YZwvbN-8vgs2zBA017DRhT-EPcgQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] clk: renesas: r9a09g056-cpg: Add clock and reset
 entries for GBETH0/1
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Tue, 13 May 2025 at 17:46, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add clock and reset entries for GBETH instances. Include core clocks for
> PTP, sourced from PLLETH, and add PLLs, dividers, and static mux clocks
> used as clock sources for the GBETH IP.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

I couldn't review all details due to lack of the Additional Document,
but I assume it is the same as on RZ/V2H(P), so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.17.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

