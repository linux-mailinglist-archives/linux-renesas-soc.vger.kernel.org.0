Return-Path: <linux-renesas-soc+bounces-26440-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0062D04576
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 08 Jan 2026 17:26:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 92BD43034D57
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jan 2026 15:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98BF349659;
	Thu,  8 Jan 2026 15:48:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9502E757EA
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Jan 2026 15:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767887321; cv=none; b=QrxN7GRHAvq9qDRgZyzmiNgAd0tIRjGC68GITpzIadURIQdKl8oTfV+DaZy6ZTjOwRdiRGSnk2ltegW79TpJUNWTEx9FVnKt1C1OoSIGJys2fVA8EnXevo+nnZ5+PhERZPsEBm5qkxPeTTCEQLsCCJmVcgK9ehnNzW97llTIIUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767887321; c=relaxed/simple;
	bh=nOXI+klEGl26fnDx+EjZGGsuvBdNo6RtFb/zBiHZmGQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dr/hE//2jzv4CYrxNHG5AbJogEYhcoOcrWuvFc+owkb8ISJmtxukPIqQi65Z6hW6RyEt+ERsRBBWI0AFxjtFFWruF5oUUwneZdYtFF/qGYCtdOhKkRT63FsldPf7llUcO+ebOdtuYsA23wMVopVz+d4nG++MM6YQWJEItl0ICMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-890228ed342so35801016d6.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 07:48:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767887318; x=1768492118;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cDBqyQMP/mzqkMYSw6gEE+uyIajrqLvoQIBVBvwesYg=;
        b=ZP5m5rNlipODJ00eZDA+YbQjmWUL3ogl+bRcMr4vGFgYvOu/2G3+Umrj4uDISqS1NY
         cmIEKQrC6r9ED2YtrzWM5kMXHI21yZp97OwprpL8s/mNQDazbIhwrsBe9uR53l8wKDBF
         jrBBpTwqZjXebWRbOcZKccFyIa/M6vTfRlkIk7BHjRTHvJjsFauIM+Rkrrbi1Q5uxNbl
         l5b3CINHpDxq2RpGiPQZZDEc8N+pYaoJRAaAZv0rbiCU6mMbpzUNRA5MfV4CkDdlK9sB
         mwnNcG8UtFQ8vO63/nPepLC568Cuk/r6q74AMI+Ggbh10BOmKzRouY5Mw51LwlD96zNV
         os4A==
X-Forwarded-Encrypted: i=1; AJvYcCVcLrIdqxwszAlZYgI0KzjrFyHZMNIAVTNKyrcpRQiDqS5B4Z28/eaUmSClcW32/W1PJChSgsaaQPkpzIMs1RT0mQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQeg0Tk/xjOe1QlrxvyF/D88YiI0cKPLOjJUQzawcUzPUHLsI3
	uvKzTcc+8nG3NIXY1yZh6DOQq0BxMeez52u5l4Ory/oy7GvO+kdJB4XTOT48jI7Q
X-Gm-Gg: AY/fxX73SF84yvheNQJK1Rn9NnQHTI6iNq7vsRWUxvKXwOnuMZgqY8EiwqXWNYjf1/Z
	v1tbQA24kZEHgM4cGbCKpvnf5MuIr5caKUFyr5+/iOs7ZFI8h/qeT/WTcxSE86cmAG/G1B0P+QY
	vcHV/G7QZj0Q48cwD1Pq9C935KeH4fTR4T/mv/z5y0c2Hj6lwJMeW/coFPa43etj8U1MOn9jLhl
	jo08aBdMAB79l7wI4qiaOaFVc3fBg+8hlSlYHgBzMAUrRQcfikXES5Fc8BJHa16YyTuw8gmyAd/
	DwwMp1Wo0ZbdKzYEbHlJdZaW3IXCyg3gBvH/h0uk4Ptfn/HFCVDzf2AbVCaJ5w6vJ/s7S1MgzoW
	fyZctfKE8U2ghhyQ8FXNO+8luUNTmKmWl6Bvnhoyk0xtvvgJoYJ7SUz6rr+2J3cTuErAKvATPzi
	6uD2vYMgDj0SkPc2+S18szSg7fX9YPDeiJEHbP5VupfDBgC7FTW8LA
X-Google-Smtp-Source: AGHT+IE45tNMBlHg7beQauEq0k98rJ/Umdr5hgJxZdKC95GrhN39CLkcSvVQ81qF/0DWT1+dB6JG4Q==
X-Received: by 2002:a05:620a:198d:b0:8b2:e924:4db7 with SMTP id af79cd13be357-8c3893a9c5bmr891891185a.40.1767887317742;
        Thu, 08 Jan 2026 07:48:37 -0800 (PST)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com. [209.85.160.170])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f53113fsm642432585a.41.2026.01.08.07.48.37
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 07:48:37 -0800 (PST)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4f4a88e75a5so30996101cf.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 07:48:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXrKF3qxMoCeSEALch0micWaMRP0SWHIMoCAa/TNuiLuRYOjogXpWm4KFa6LT8cphEuKgzeqQnH0hxRO+wwLnA/Cg==@vger.kernel.org
X-Received: by 2002:a05:6102:3f09:b0:5db:f573:a2c with SMTP id
 ada2fe7eead31-5ecb6875d0fmr1951115137.13.1767886896018; Thu, 08 Jan 2026
 07:41:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251126130356.2768625-1-cosmin-gabriel.tanislav.xa@renesas.com> <20251126130356.2768625-7-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251126130356.2768625-7-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Jan 2026 16:41:25 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU+UOdNjUPWiXbJTv4MYjPwuxLtgXJ2AL0+XVHatJW=6g@mail.gmail.com>
X-Gm-Features: AQt7F2oXVcr96RqhW7ksn9tJ0uMEbuupTQNMcjQNZoyMUd0wuPKdl5AUIme_0eo
Message-ID: <CAMuHMdU+UOdNjUPWiXbJTv4MYjPwuxLtgXJ2AL0+XVHatJW=6g@mail.gmail.com>
Subject: Re: [PATCH v3 6/9] arm64: dts: renesas: r9a09g077: add OPP table
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: John Madieu <john.madieu.xa@bp.renesas.com>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Nov 2025 at 14:05, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> Add OPP table for RZ/T2H SoC.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

