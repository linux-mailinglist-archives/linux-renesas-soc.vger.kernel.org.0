Return-Path: <linux-renesas-soc+bounces-22830-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA3CBC93C6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Oct 2025 15:18:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DDB043BA431
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Oct 2025 13:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96B062777FD;
	Thu,  9 Oct 2025 13:18:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067432356A4
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Oct 2025 13:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760015889; cv=none; b=VSU33rfVzBtLCNxhP0RHQN0/unnCTJarFn1OdCOpFhuj/AePe7rjVOZzOlXFlaCbkvS3MeTmEXYh+1nYYKW6cQkuAL0qWXDnmPLUyAdqx5ppU6QGxfkFN2DFn8QMNiW8Tjw4D7b/UsQHBiUSJjx6Sq1R86wm0s6WFBby8QWa+T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760015889; c=relaxed/simple;
	bh=INP3l40ADCP2qA0fbJj/+4957OkttXt9E+1u5k+nI6A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JoTjXSWYmaRHBJWhJSGCMvsSS7Cff4H75aL1p5IwqF9Oa/xZgLn+nPpIhDRGoDhOSYqmyPlmlGmpcB0i/bpsYjYESLvw7w36/Mw0NXW3hCrH1dr+t70zfHezYAydetzSa1np+KbUCL4jOnMH9IouhyQgs+kffVY11RVcx6XtTW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-54bc6356624so1433102e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Oct 2025 06:18:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760015887; x=1760620687;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=si5sH6w3BFJWD5m5kkucO94XpdquBxJbgVQpUyKDB4U=;
        b=eOMIbkmd5cJoc/cVRfhnkjQ+fEvdwTttYpATr+e/hspMUuw1qrnJAG9UwumzWD+LTD
         K6rLozc1AC7PENDuk5zBLe4U3jk9/57VN879BNVHpMmuxDp38bK8JErugJ5tCgCo+W8B
         MmKsPT27WleSnYxNEyTQNIXryD88n/yalOtq+gEwvDHwq3+s2kqmYFXSQbsSWT0QRZwM
         ISpl0gDRPYA8YSfE1J+Rl4xtY6nzRLN3mH2PnrgW79Qkk9yONwGQN/d7fymZ6jgPTKqt
         wxQ0gWqdRsm0JHj5NU8Gj4RkaHwTdkKsgyUDph9vIn5lpxG4MyuADEBiisNa2DrwQ7Ua
         CY+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWCg0wakzqGzzC0aRqUYZqbbcfv7KOERvgMk39noYgFYbgplKhjIo3QC+zstyTelieTwdiyaoqCGovuxk3zhKkA+A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9Etz+VrA5leznxv+mlpyiucV8h2NOXjdtPQabHwP6FQ1nw1q3
	L6PSvvn7Au84J5LafBUUMzkBPMS3CcMBkQ9gX49tehp71gz7BDAw7x6Itu0KMdJ5
X-Gm-Gg: ASbGnctCc7xtq1VyBqnjAu9smAV8GXswMwoFh07q0imPaOQmDrWdO4KufQ22x5P4Tvb
	QmzcGJGhPelQiZ2HwjieqozfF3a5CTvWJwxv2g3FQhx2yxG5AWCRXlYMPS2QDdU8AKeyP4NzHDo
	lw2Q63s/Ny6r3WwU8SF0UZtvBxiTesl2RR3XV8wP5aQd2TGyB3v0F0LHyxGZ1DpOkcIn1N8TJlk
	3w95K/jarH2SY5aa0lRkp1kzyUJLc/Zy3zajVxstDX6TglZWCRl4Um/ShPsTFBMm4tzQu2EZlLy
	CdKC+H753AMFtH/WP1MlSTbKujnsLUvs4Fhj0Uj1H3sAtf+Q0Q+qOLHtIbCvczlI1AhoWuNlYeG
	+at2UsB3z4eNei5srxBjLcbIHaPwoGjTorVi0bBPYpyONKFFGf8PbafGTjyoMOBifv0Q8SnZ6Rc
	899KWoaV/J0O5WyJ6+E9s=
X-Google-Smtp-Source: AGHT+IF1ECFh+WSYn4uEkF4PY8OU/uil1F73HU+xgpyhYGr3il21pWTg4k4eWvf5nIRFOVnWlBgDfg==
X-Received: by 2002:a05:6122:1e08:b0:553:6cf3:2be0 with SMTP id 71dfb90a1353d-554a8f27c38mr5529045e0c.5.1760015886609;
        Thu, 09 Oct 2025 06:18:06 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5523cf98b43sm5260411e0c.26.2025.10.09.06.18.01
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 06:18:02 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-923f46f6c59so1295583241.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Oct 2025 06:18:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX/lAcmHaq1qDG6/FRUa3HFBY+GfZl8a/sETi+JHZYwZ/oOkAQaEJ+C2I5vb35TU25d8RLkcY8KsHNkyAOwwR891Q==@vger.kernel.org
X-Received: by 2002:a05:6102:6211:20b0:5d4:1499:99a4 with SMTP id
 ada2fe7eead31-5d5d4dd9e42mr4653097137.13.1760015881596; Thu, 09 Oct 2025
 06:18:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251007121508.1595889-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251007121508.1595889-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251007121508.1595889-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 9 Oct 2025 15:17:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUrwNzSmqi1u_4PkN-JURxNa3X7fSXGzSBjLtA+wB_JKg@mail.gmail.com>
X-Gm-Features: AS18NWAki8Ee9WPqdnF2AgHvCLiMuvZq8C_MZHp2KGuv1ErmWlK28JGc1FB-3qw
Message-ID: <CAMuHMdUrwNzSmqi1u_4PkN-JURxNa3X7fSXGzSBjLtA+wB_JKg@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: renesas: r9a09g077: Add Cortex-A55 PMU node
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Oct 2025 at 14:15, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable the performance monitor unit for the Cortex-A55 cores on the
> RZ/T2H (R9A09G077) SoC.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

