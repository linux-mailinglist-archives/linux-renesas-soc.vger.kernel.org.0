Return-Path: <linux-renesas-soc+bounces-16982-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A22AB39D3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 15:58:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A140C189FAFC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 13:57:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EA211DE3D9;
	Mon, 12 May 2025 13:57:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B08181720;
	Mon, 12 May 2025 13:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747058237; cv=none; b=Zc6emnNX6CDxPjVlciP/7PZGyKLj4dgO4/i9NtOFmaulXHBhJllaXMVsTtRo+FBBStAjC8gzdbAekJKOYEkMgvxQDwgpClPFGXrmbYtnpMjNr6fBfdunQD2Jo7y8dkZAQRNY9vVh2Jmb9yoiTaYIaWJDO9BkNm/bIO4RobfhIEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747058237; c=relaxed/simple;
	bh=95E/CVue/wnvQR6wyLlRe7BRcWn/8hmZomz62vWmJYk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CfYqUuiQ1vtiDhLcs/UVSImOEzKGBLL2viez1vSGtAhwYxQOBYcKzGujsQvv/svuCibfmPQzYnnQI03gYuP2ARY+oHvmNw1ZRaV9MRjxuoD3mhfTgl87izFs19NWUZHx+5fem9PMP++7xDbmU1XGRnuSleix4yD5E78ZN6lQT3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-85b3f92c8f8so509081239f.1;
        Mon, 12 May 2025 06:57:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747058233; x=1747663033;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PgMxKbZ7K9g85ek1e//i/rL6U+/AzknhLB8CNs42xFw=;
        b=wNgOgUMtHrTShdA+kk+EH8b2L+R2h9lw9jzTyIw96IulKAwxhDVxUfOZFNhCV68hht
         gw+BHI4hiavpn5kBlY+3pezSVZfOaCbq36ruPPTmb950RmxO70BDL7MpoMObMIM6L7Sz
         oNCRgSVOXG6iymn39LxM5vTX5fqd/XOjsRZVaLz+dBoCmn3wznhrTds8lX0n6ymN6DmO
         X69QtBAorpwsLiHLWUxb0DYLwHcTJ5/roXUPPJeSYPDCxMfJ9Dqfs5kJaOqbp+d2MIhK
         rz3oW5OYcwILE+prD1qTdBMPFU/Wa7x//IkPsH+CUp2TNLNDN35KKx238vNJTX73Ty/A
         AewQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6NenJ+0E2Gmm3cb0ULklY6dSPDkYRhniKm0W+jmRkq/x7Sea6IsvH0u5C4qdHDLkp70YPBDYxyZRMXyrF@vger.kernel.org, AJvYcCVExqSEF8Y7TG8G1JN6cE+F9Sb8KIjqaIbje1kX5bW96u3CQAoSQvTrjuuNtrTADVMRkFFBqhOpk1g2@vger.kernel.org
X-Gm-Message-State: AOJu0YxbwQI9O/WxasxlTM5Yr2L1r0rPr1KfSNq1X77Q9lZrwDv4kktu
	EDb4RiCTtKXgDycgnhGOhCtmMvZjeUJ3KF8kXVPX9FrJL6xVt8y6KtRj3Cjs
X-Gm-Gg: ASbGncvuGRwdkjNLipoQjLYXeWOhOzR4ZjWRd6VvUVGYxoIUHHfc22ZfxhRtHJOUuty
	dlchSVlFEYdJ2FxFd6rv0c1MKdGr4YSd9Ah2i4L8bAcD8Af8ap5SunEUsqrUQ/msrNO4EJ1tBdU
	2b9XdexdoVgKsW59pUQ3yY3yUIpwJZcAmOWGna2PmBofvPoANzfIqFy+q92jYPY+5b3R1cFKrTG
	URCsgFT4qvGYDe92gSGCmewhU2Oax2vCJnEi6DXQHzRAi/jpb02f06qC0FDXZUfmzdXkx9Le72Y
	y62KgpMD5ydZpP4fg2YTiNCKZnfAoMmZ4BTTNKFe82EuiY+Sf2SNvi92L63Qe0iomExEw6/249F
	BZetqMOaHNKgzMA==
X-Google-Smtp-Source: AGHT+IHHKXMBzWIsfg0NpAvduAh+Dl28F1SGQhwKRYXAOEdWLUO5pgmzvQJovXIJmFCTKw2UzHHrGg==
X-Received: by 2002:a05:6602:1611:b0:85c:c7f9:9a1c with SMTP id ca18e2360f4ac-8676367055bmr1295544339f.13.1747058233244;
        Mon, 12 May 2025 06:57:13 -0700 (PDT)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com. [209.85.166.44])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-867636e160asm177918139f.36.2025.05.12.06.57.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 06:57:12 -0700 (PDT)
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-85dac9729c3so453625939f.2;
        Mon, 12 May 2025 06:57:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVlIOS94CInVKAMxKuhZptyuFW/wf1m49OQJDABreSk2TRVObqxmKX93xmFkJz2Lo3ICpL+PVVmgPoe@vger.kernel.org, AJvYcCWqNZrGhs373uIXuQtHFJ3sh0I/8GSdzheBO/sVKeTp8D/RF4K6SXSj6vmFA/FQkUw4Afvz539uVVln9HCA@vger.kernel.org
X-Received: by 2002:a05:6102:3c9f:b0:4db:e01:f2db with SMTP id
 ada2fe7eead31-4deed223b1amr11915712137.0.1747058222503; Mon, 12 May 2025
 06:57:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250512-daily-saga-36a3a017dd42@spud> <20250512-sevenfold-yeah-d40078a9249e@spud>
In-Reply-To: <20250512-sevenfold-yeah-d40078a9249e@spud>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 May 2025 15:56:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUVH+wfdNpNBMdaG3D=z7WcTMmgW2sK_fAgiuJcvLaOig@mail.gmail.com>
X-Gm-Features: AX0GCFum_LUMr8r2c59zTXaq3hHr3KqFC29268O1TVZJ_KjAKwGQIm8MscJpbNI
Message-ID: <CAMuHMdUVH+wfdNpNBMdaG3D=z7WcTMmgW2sK_fAgiuJcvLaOig@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: cache: add specific RZ/Five
 compatible to ax45mp
To: Conor Dooley <conor@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, Ben Zong-You Xie <ben717@andestech.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 12 May 2025 at 15:48, Conor Dooley <conor@kernel.org> wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> When the binding was originally written, it was assumed that all
> ax45mp-caches had the same properties etc. This has turned out to be
> incorrect, as the QiLai SoC has a different number of cache-sets.
>
> Add a specific compatible for the RZ/Five for property enforcement and
> in case there turns out to be additional differences between these
> implementations of the cache controller.
>
> Acked-by: Ben Zong-You Xie <ben717@andestech.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

