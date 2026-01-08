Return-Path: <linux-renesas-soc+bounces-26464-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6580BD058EA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 08 Jan 2026 19:32:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EA5A532920A0
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jan 2026 18:13:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DC8E2512FF;
	Thu,  8 Jan 2026 18:13:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C062F6921
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Jan 2026 18:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767895985; cv=none; b=R4BiaKJGNYpjI6r26FdzwJib31E76aEsUza0A6qnJkyPoN2+LPaS9MREknQmswoqx948XlAwLlij9qlWwcdeOLY++wDyTSs3xLzKMCRZQNbaLNsri61kylkH/qoP7WclenCejVq9o7x6u7ymcl0jQ9Tvo/eSQDXvuz+NOHU+b5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767895985; c=relaxed/simple;
	bh=ULWWtQEJoU/SfzM88dlQzOYLDArnaYKiaIZDg4MWB34=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mMstn9RPT0aT6EdTnOoB5CJ2XRtpHudeBrTQpZZQT8nd41DqPhASRk9W1hfg7NMpnTol7RRW362Z6/HqWICoCce3moFs4Utjv1lJy3cC4bhAMSVNSvB6QHRiksbYDYZ1RR2dv2eoVitUvKP1Fvld82u4+B76whS2UcJzqi0W7bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5eeaae02888so70703137.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 10:13:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767895982; x=1768500782;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/keVNMihgBoTxrPdM/pz+huNl0rtnHqsA4wFUiQj9DI=;
        b=gza5fI63dLwwUgks8tb3okaGmJ8GbE8Phq/92FqLuaEyCMF/HLUwVskNTgZlCarFsl
         92QyRlk+B1Su9lRimz27NST4Nugvnwk0FHanDdCS9bMsEq9r/vnp35A1rYBoZQbm4ZLX
         kSNgRiHK7TlBOlepBohtGn2B0xgB0+mu0mEfRh3PGJWCLUf9VYIQklCi3QxDT+oJIWhw
         3yt1iD5z+KY5rIWnRqSLutrdEgPpVhXl/EhrN/pCsvJfy/qHfsRV5ojDFJGNTqKnbbUZ
         5zZtw2vHTxO4ne0OtO5l9mfa4izl/m8VWfkKwWLtGyJdIf2r7pn5xFU09D1saHymhWo3
         2zDw==
X-Forwarded-Encrypted: i=1; AJvYcCV7v+mWj53vHoSlnE1lgs8cMUV93/HRwTtwBxtKS4EVvxwbFblJUT9XJcviPeZmrC/B72J+gwd4CJXD3dwL0Qi5MA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxbdu9bZYVG9G1P/PjCdwpEqndCPhL6zwT9J3AKiKrU3aIRAEdw
	kx1f2cotix3w6reOQJbKqJxXTt3ez0J1VoAK0BdxNSfuamxsGnm/QdkWaT2BbPCI
X-Gm-Gg: AY/fxX6L0Y4U0VBBX8JHPb04tXcFRp7NUXu5yyXFjC3jHdoMWOm8x6Bf8zhGWOP7ZIK
	wwfAnOcfU8YyY2jV5x336C9C0JrfPULNM5M7OhHhdy6lCNrjw+hMjbweRr6Lxm4yfsosQ5ncSAM
	HLDigxWw2qBovpgP0O1H0HSvEs3mRwmSWDVze2MI++Uyb2bH7SFt2K+POj7gssCsBGtKUa2NhRg
	v5pGK7FV5suGd+XPmumToomgmRBbi8zB3JfX0SwR5r88IqybgEuUVf/rMIN/LC/6FqPjlKyS57O
	PB7dWKcZYuSV3cvTHrGmJ4L+Km1QQc2Os0edCu4SCbGAQtd/tD13E77nqaCilIu3Kil4Z5sFckq
	WmBlnK9O7kDUw4XfOIP7F9QnyerYbFzKhY3Q39BFVJvJziEP//WCB46i2RIkseSSMGDIVK6x6AL
	fZh82KSHaXNFVyDpAIf3lUkhj6geSVmcLqoRlUW9Vp9BamOH6P
X-Google-Smtp-Source: AGHT+IGVd9eEWKrLoc9q/YDH4/Zk5Xp0KCPkXP7ntXhdiagXNjc44Lq7YXqQvA4mEkg86dgqB/RPzQ==
X-Received: by 2002:a67:e115:0:b0:5ee:9df0:a5f4 with SMTP id ada2fe7eead31-5ee9df0a818mr1024781137.31.1767895981131;
        Thu, 08 Jan 2026 10:13:01 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-944124a34acsm6626567241.10.2026.01.08.10.13.00
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 10:13:00 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-93f5905e698so1036940241.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 10:13:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXEsbNTGBe42mZKk1E9LLSxjVJpb+lCJ6HzCnbQADWju9nSzw59Yls5OD4wPgUKoLhQjvIL+VpslH/YNTh3QwmFug==@vger.kernel.org
X-Received: by 2002:a05:6102:4a84:b0:5db:2b4d:f1ee with SMTP id
 ada2fe7eead31-5ecb687a389mr2478442137.17.1767895980045; Thu, 08 Jan 2026
 10:13:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251205150234.2958140-1-cosmin-gabriel.tanislav.xa@renesas.com> <20251205150234.2958140-9-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251205150234.2958140-9-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Jan 2026 19:12:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVo6qs6p9=dKOowSgVGo3gc63uPXCam_GHU0R8v36FPkA@mail.gmail.com>
X-Gm-Features: AZwV_QjJ35ks5-paZd0vwYNtwFXY939ykUrcrtOSooQMZZrbttR_00xK2IU562c
Message-ID: <CAMuHMdVo6qs6p9=dKOowSgVGo3gc63uPXCam_GHU0R8v36FPkA@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] arm64: dts: renesas: r9a09g087m44-rzn2h-evk: add
 GPIO keys
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 5 Dec 2025 at 16:04, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> The Renesas RZ/N2H Evaluation Kit has three user buttons connected to
> GPIOs that can be used as input keys.
>
> Add support for them.
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

