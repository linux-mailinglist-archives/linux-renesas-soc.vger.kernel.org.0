Return-Path: <linux-renesas-soc+bounces-11873-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8B6A022F2
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jan 2025 11:30:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5FBD21634E6
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jan 2025 10:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C4171DB546;
	Mon,  6 Jan 2025 10:29:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9F01DB540
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Jan 2025 10:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736159398; cv=none; b=RbyHzv+i9p2faptNDJvooYa6QJ6+UC3GpVH6EyjaeAM+35jIuI0OFiCQvsO4MLG+gSk4y3280QrAt4q9UjEjBCLut9bCpKbO7DDTZEhO1KDSTPbm+olebcDIzNcNgH0l0aRAZAwxYOmbpYmvRjQWrEK+t6YUCCx4WTb2BNCbtxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736159398; c=relaxed/simple;
	bh=y4he3LKYxLHvl4TWGDaOVjxc4P5bM8eu6jjo+4CpqdI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GTKlKz8vu1hTQxpb61eTCWzA1XLF3TPB658uPLH3MM8YCRINAxtCI/Gaay4mCjyjpktL9JiY3D2QfjRUCZT4FABe3aP9CzlNfpC5tOCo+iWbZlm4d7GSHslC3iTSAvyMVOhN1e6n3NV6Xs3CaWCehHB2Zf6xLi9pJOy4kTNUA8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5187cd9b8e5so4414482e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Jan 2025 02:29:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736159395; x=1736764195;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=poNUo39TWW1i/QtwwQelcuxQHvD/iKNNcaTWR/hqQWU=;
        b=Q+UlcqB+u5yqDjh9XRfG5cICu1qjyHp+c/68Dco1J4fM7iL6HdnELKqVdpduRCofe9
         OICHqHaSl29QA+2RV9NcAmF+fyawZ0Qsz+NyUrqCadL+0+N07YOhh9wlwDOkNk7qQJrq
         XXm6sqsWWNNvrLV0qyW8bsafuqfl7MiR3T43kcPhup2VeI5mNUHYEYZ23JaWpInrm7ME
         QavJDi7zO9lbu11fSjTL98pIFjC7i6DjVoWXoeqrJ/gUXciWPF3OJzE6b8lQqzlnZCw5
         HyqVrKJJl32KAsnZp1HGfncNVQOF6mT3nZC9Isl0/scpJbv3sFKIpztze+v2or7UpkdD
         56cA==
X-Forwarded-Encrypted: i=1; AJvYcCVN/AqF9/2ntPLnIg7UEjgkEf2M8+cJ52PigF80vheCuMJSPRDG42BCfzpXduvhBwy5O+7NWPsqTc4d3J9l6nvXJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXNu6deG2xX2ZnOWhhJPgb/7caVgOyADCF42R0NUXQownqW8LQ
	vUm0TAtjVqyVMT02BnAAS/LSiiq7aV3YGiaGF1swVIc6AgBCOqdcmPjf5xs6
X-Gm-Gg: ASbGncuk2hIvWodcSJDaMcW9uxsDtfvlSDY79wfQqW8e5wrTSPsUSRYJlFhk83a5W44
	xdhKuxKLMFFnqM71hvNR1WArffLRcrRdtGZYtvBUIfOB4+GSz38I69k3huMZxvmFg6liPTDXAyd
	2yOaRKJNsDlxfrgyHVtLqtJL7IGGO5aHwcdiIgkekbovYuY3k5pFTxr3EAEIda0yL3ZgFnL6Vie
	+S0STvlMD2whDZrASTXRQu6t/mS6aw4OgWgTtAPgvSPytNb7gDs36u6BM/8KInxOfCMMaXd/Ba0
	CgGAnYzSFwY9W0WokPQ=
X-Google-Smtp-Source: AGHT+IErf/VmeeKGQpOzJZbbW16f6g1XmCarGTL+uJ8qI1nLex3BFHd3QmQFpxk4dTovpCx9dTo/FA==
X-Received: by 2002:a05:6102:6cf:b0:4b1:16f8:efc4 with SMTP id ada2fe7eead31-4b2cc36a2f3mr49579882137.12.1736159394888;
        Mon, 06 Jan 2025 02:29:54 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b2bf81560fsm7637822137.0.2025.01.06.02.29.54
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 02:29:54 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-85bafa89d73so2147960241.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Jan 2025 02:29:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU+d7OngbAXuYwzGiHyVc7d9x3FHPcKbhgnWSqJXsJqFHnCLXeJ+8knKPe9fb4SKlkOA6O2GbFZZu4rgdN2Xrl6nA==@vger.kernel.org
X-Received: by 2002:a05:6102:e0e:b0:4b2:9e8b:54c with SMTP id
 ada2fe7eead31-4b2cc488c39mr40681726137.24.1736159394384; Mon, 06 Jan 2025
 02:29:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250105111050.3859712-1-joe@pf.is.s.u-tokyo.ac.jp>
In-Reply-To: <20250105111050.3859712-1-joe@pf.is.s.u-tokyo.ac.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Jan 2025 11:29:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUT4F9_1Z-Se5c+knwYyVUD4q=AFoFKZuefNhzo=ks=ww@mail.gmail.com>
X-Gm-Features: AbW1kvblQtYr0jZaHeBfVfdG4xQmi_d-P6PHF6X9WHHbJOsEyBumaBQwOAnGO78
Message-ID: <CAMuHMdUT4F9_1Z-Se5c+knwYyVUD4q=AFoFKZuefNhzo=ks=ww@mail.gmail.com>
Subject: Re: [PATCH] media: rcar_drif: Fix an OF node leak in rcar_drif_bond_enabled()
To: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Cc: fabrizio.castro.jz@renesas.com, mchehab@kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 5, 2025 at 12:11=E2=80=AFPM Joe Hattori <joe@pf.is.s.u-tokyo.ac=
.jp> wrote:
> rcar_drif_bond_enabled() leaks an OF node reference when the
> of_parse_phandle() returns a node and of_device_is_available() is false.
> Add a of_node_put() call before returning NULL.
>
> This was found by an experimental verifier that I am developing. Due to
> the lack of the actual device, no runtime test was able to be performed.
>
> Fixes: 7625ee981af1 ("[media] media: platform: rcar_drif: Add DRIF suppor=
t")
> Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

