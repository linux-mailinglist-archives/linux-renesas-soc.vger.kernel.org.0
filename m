Return-Path: <linux-renesas-soc+bounces-23950-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 54283C23DF2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Oct 2025 09:43:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED464402055
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Oct 2025 08:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DECA2EDD75;
	Fri, 31 Oct 2025 08:43:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D80B2236E9
	for <linux-renesas-soc@vger.kernel.org>; Fri, 31 Oct 2025 08:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761900195; cv=none; b=PSnIq8TzBgVUKpdg1q4tKkJYlxwPb22DCqrCcLzVAFnYDYjjPSwTusKnG80p2k3CGUVcd47FpexldpfS86yOlT1ayS9bY0UUo2aJ9/P9RoMxRKpskjfdHuVZo2B305+5DXvHsL4+etpbw+aZJqYIzEiI+dyenloYzAr67ap67UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761900195; c=relaxed/simple;
	bh=WJEG5aSHGx/vf+vzxryZjx84TMeZQxoBKx135ESeS9M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fbocrcnfw6cIMEgG8eczqoNCmVmzitkDQT+MVWBuZ80rAop4FeobW827kHZytfnlge/r5tMcXRhzargf27dQiIvhVqLcbpXCDpOIAtO9lPfsUkxSWtC1fJcEKSb7B/39h9l+7rCkHjHExblUsNPtwzEli/cc8mLwBA1Vue3japA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-932bc48197bso1037453241.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 31 Oct 2025 01:43:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761900192; x=1762504992;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=srKuvBcN8qwhEwMAzIP9jvMl8T/5K7+6w69VAb/dJjw=;
        b=aC3QJHHYq6yCb3TyqvfyrsYIT/X36uKQPqkDAVNs0V27iKlMAWdPA5yGiJZRHttYjs
         Top2l8ulrhNOcv+cLuJf8WSyejacIufgBWkcrrCKzgOzxmbz9Kv4ehV99N8e++LKHaF2
         26h+ADNUT3PHV2b4hLER9LEl3bSQqwthIPvlIWG4SIo7+HwcIj2jRpgopOYDsvFbv4Jg
         JT6CWD5WFWdZxWXplnspehSHmCLcpOB8s9XwQGMmbQ9aPMXhWxE5Y7tauz/e8rtc1tW2
         mRNMuTQjR+AfgZjqZijz8UPs0TrdoemeDQzUlOBr79Ap5t85W17vleqG3SV39sYfSAa2
         VmKA==
X-Forwarded-Encrypted: i=1; AJvYcCWQ0ecFsl2a9e9XiIz0hLrScSLfAkDNs2P6zxUyculemkXx4NPu6b25kgoXAcCbbxo1tDxsP1aXrsGJt4xQQz4uow==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPO4j9QYV/8QBVWj6X/ZhnSjtAnz0ML2f95X0QvJgq2zGznNuv
	xr66YM5fMUn9TxLSXR3tQET5Rvzu9NM+srcOaUEnW+3qniyMG+fIf1xCQ9Ziw7oC
X-Gm-Gg: ASbGncufB/sfAu1tfC2ecvUx/Tt0eGlYCK7pK5Np/SewXt8kfjvFPGFY6Vjmd/Z2TQ2
	idUSheQL58VTchkICLzu9idZkINRLqTyfGdSBt80hjWmWgdqJfW5bIYsJQBh9M/LKrTItstAmIK
	ycl9f3y2IIrcH2Cuc3bMbiYd8tPpGbsaY5pvUCy2Bia9SIfBhFjpaRUk6JsJ3JuBHr9kj2ED8FC
	VtvLSvzcZjBwAi0DCOUL+SNkEqdnpAg87sPKXzy/PMGMlY+K5SX9bR58THJFPfmLDeJuLrUiZc9
	rnPda2x5ViFHFSXErDZJsDzkG+NpBiY9l68LMojANrlXuKtRQE+w3OKM+cslAy8NbYjgt6+ZvsY
	QfTnLdJ2zmKLS0rEXUhKK2kh1Lw0RyaL1DS8THupfZ6ybGk4dAortcQ0Oq1Sq8UxxL69gFyeP+9
	tCUrUP4l1DO9fpG2kevfSegPT67V6E46WJVpsyzC4vTVw7vGnL
X-Google-Smtp-Source: AGHT+IHiSFw9RpU+FtCIb1SZnt5T9F0PYrJotYX2is8BjPFsJ2rdbHIISchnjtTe7Z/0NLGPay3NFA==
X-Received: by 2002:a05:6122:8c26:b0:557:c86a:6065 with SMTP id 71dfb90a1353d-5593e26d700mr856791e0c.1.1761900191426;
        Fri, 31 Oct 2025 01:43:11 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55944b26ebfsm419400e0c.15.2025.10.31.01.43.11
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Oct 2025 01:43:11 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5db1e29edbcso1340669137.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 31 Oct 2025 01:43:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWbfsuwbE3mK3p03kIRbyJURQ/8C3I4GwHaNuC/CNgoL6O5Y9szQjcD5yW1RhLR+bdjXK1Oc9X2kwYfogE6YBVRGw==@vger.kernel.org
X-Received: by 2002:a05:6102:26d2:b0:5d5:f544:a88e with SMTP id
 ada2fe7eead31-5dbb133e6acmr609871137.35.1761900191030; Fri, 31 Oct 2025
 01:43:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMuHMdWapT40hV3c+CSBqFOW05aWcV1a6v_NiJYgoYi0i9_PDQ@mail.gmail.com>
 <6854ea2b-b316-4711-b849-038d532f00c1@imgtec.com>
In-Reply-To: <6854ea2b-b316-4711-b849-038d532f00c1@imgtec.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 31 Oct 2025 09:43:00 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUdYidx7u2FOFUmiijp-YeYaQQw_Lrj_E-BoUubuxxR_A@mail.gmail.com>
X-Gm-Features: AWmQ_bl5-OwN-KWDVvu4tvr704LIaV03yTPqbwFu_WpQDxzklRlUNeQBSF_vnQU
Message-ID: <CAMuHMdUdYidx7u2FOFUmiijp-YeYaQQw_Lrj_E-BoUubuxxR_A@mail.gmail.com>
Subject: Re: drm/imagination: genpd_runtime_suspend() crash
To: Matt Coster <Matt.Coster@imgtec.com>
Cc: Frank Binns <Frank.Binns@imgtec.com>, Alessio Belle <Alessio.Belle@imgtec.com>, 
	Alexandru Dadu <Alexandru.Dadu@imgtec.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Matt,

On Thu, 30 Oct 2025 at 13:18, Matt Coster <Matt.Coster@imgtec.com> wrote:
> On 29/10/2025 14:08, Geert Uytterhoeven wrote:
> > While playing with the PowerVR driver on various R-Car SoCs, I ran into
> > a crash/race condition on Gray Hawk Single (R-Car V4M).  After adding
> > the GPU device node to DTS, the driver fails to probe due to lack of
> > suitable firmware, as expected:
>
> Thanks for the detailed report! I'll make time to look into this. Do you
> encounter a similar issue on other R-Car platforms, or is this exclusive
> to the V4M?

Yes, I managed to trigger it on Salvator-X with R-Car M3-W, too.
Reproduction steps at:
https://lore.kernel.org/linux-renesas-soc/CAMuHMdWyKeQq31GEK+-y4BoaZFcCxJNac63S7NoocMj1cYKniw@mail.gmail.com

renesas-drivers-2025-10-28 is available at
https://web.git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/tag/?h=renesas-drivers-2025-10-28-v6.18-rc3
My aarch64-linux-gnu-gcc is gcc version 13.3.0 (Ubuntu 13.3.0-6ubuntu2~24.04)

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

