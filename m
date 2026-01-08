Return-Path: <linux-renesas-soc+bounces-26395-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AEED023DE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 08 Jan 2026 11:58:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3BB38303295A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jan 2026 10:46:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBF903D605A;
	Thu,  8 Jan 2026 10:09:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9AD3EFD27
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Jan 2026 10:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767866987; cv=none; b=aXjBS187zbxUbQFoHBr2yE5mrKlfdrUEWl9yACdzb92CdJLkPIGYlmNRnYWiCWZwJBgyMHKCGAW7lfYBPxSU0sgJ36OW2I38J913Q19XMNGbF45Cl4lExEO+CH7x2PpAR0fZUOW+nDwbU2q6lhZWHYAB4XuTtRHzgISf9SwNjfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767866987; c=relaxed/simple;
	bh=hkFV6sCHTP5qofsPaY/YbOdlIOAJzAyWAh6SnNrhtec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RFMpDS0R5jOj5OeblAPMF11tBjVzge5tuXoFYdXStW+BFr3Fp05v5OYCvLC3LKovHOU0106DBB7zyfQuce0mo5vAFJt9XrEeMaEoNDjsTDUSzzV27gT4gcjqTRGUzHexmClwq3cwKsc29VIBuFCZ9/RTWnD5Wu4tavwlRDldbuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-5eae7bb8018so1129615137.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 02:09:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767866981; x=1768471781;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gyrZyGcXAzKiCKUaV1wObD3EIrr2gqbfMM/IKLsGvno=;
        b=RaQpJub8B7VbSQ74HZY/8k3OTH/CABAGoRhkMhcX3O2XeBgGTIMWytlT5zzIfz8t2N
         557iy72PjufVA/KfLmEN7TtKJ74OESDLhlFblRRLKLKqkepgJmEXHKE9o5RSJgDS6psA
         ni05fRb40xLQjPh2Nj3th4dS6GWRZ0j9VHfvueJzg+x0mPCCXGTBr5l0mD0Cz9GTd08M
         OV8YVmjoHahIZs8h1EhFqtQmJCwbIEVM6UUQ5dU1JZbqoZ030yk0+ZWIWRq1+u219Y4r
         IeALpC/tnEfzC2OaGTdAm2e8G35vli9e6yf3l8xmoIqf8CcMTKVabZq5243/RLVNM0Q4
         VJMg==
X-Forwarded-Encrypted: i=1; AJvYcCUvHCYFEEEy/YEpB6ZvVL3N5fvXu2KIJkHhYkVqqej9LSKfyDuOvdtSjAQLIMVFoSW4X+wojHtgMFP1dZ/E7nZMZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+3aDIX3LPFwqGsNXF0xvplO6RCS2dy6BMk1ZZRTEEgCP/eLjZ
	OLA/bMNef3wQbEGefZQf8hSbd1iMjjPP56BdlBg1oXLwExzNKRwOCuo5PBdYbrNW
X-Gm-Gg: AY/fxX6qZ1AcXsTFKt3vIcMtWJNAI+WeM8tUpajY+NOCvjRMNDt9EulqTYS3tAofQMj
	bRywDyvyuXJVGAoP/BgU8ouwOH5ME4vvedbKFr3wBwdLtc6x3l9109I5xAsLNRJPdWX2trRHsqJ
	G6kLw9jllPVl+s3dZs4Mvh3e+uTyIdTY/OR2sQPmsvxdK4pYsn1/BF3WtUgs+5Rh9Ru9hiGdRKh
	8gACAKvGxaqbqyGUeYu1v/qkPHGwjZOh/5ejeFdnMoaSGxFzUCL9hzimAOvpUsZq7ktirHx93er
	uNqaRv8LcU2PwDbp8mnFJrlanQ7c1ooh01+hV4qzCjJAUH8yHXlw881jZe/Ltp5KK+medU94lL/
	cxx9xIBK8aQjWGBFP1hk5Cq5zqQT1Cln56hSNq0LGhvyVuAjwCihfxuualmYBtV6Bwm2bcWoeTd
	AS2zmTB37wWhq7EEDoeOsDDi8OwlxrdbpxKqvsA/ZX/3y/FnLl
X-Google-Smtp-Source: AGHT+IFQPZjCY33dv4+C1x1U7OsSgW+o3KCT9VJPOISSAF+lVqK0mkKt08Ak3xu/yJnsM6DvTgLMdw==
X-Received: by 2002:a05:6102:334f:b0:5db:cc69:739c with SMTP id ada2fe7eead31-5ecb688c1a6mr1774968137.17.1767866981520;
        Thu, 08 Jan 2026 02:09:41 -0800 (PST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-944122ad97esm5262667241.3.2026.01.08.02.09.41
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 02:09:41 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5dfd0101905so1047937137.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 02:09:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVdDi0YDj7wB/9YjNxW2kXyIEQWhqz6Mz/NTRmHCtIMvG48crfJ6k3BX2RfxvidzP+45gihU92uggy/d73IJ/D1qQ==@vger.kernel.org
X-Received: by 2002:a05:6102:334f:b0:5db:cc69:739c with SMTP id
 ada2fe7eead31-5ecb688c1a6mr1774956137.17.1767866981047; Thu, 08 Jan 2026
 02:09:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251224175204.3400062-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251224175204.3400062-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251224175204.3400062-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Jan 2026 11:09:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUYSOw3SvDqYfYTEjBbe=jA3fsWWa+yEpuFsVk0J_SuDg@mail.gmail.com>
X-Gm-Features: AQt7F2oOCBWKRpGjqkkzd6TZOmQAOeycJcWHvdzKUvJorqk3GvTHAiV3Se6S3gU
Message-ID: <CAMuHMdUYSOw3SvDqYfYTEjBbe=jA3fsWWa+yEpuFsVk0J_SuDg@mail.gmail.com>
Subject: Re: [PATCH 1/6] arm64: dts: renesas: r9a09g077: Add CANFD node
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
> Add support for the CANFD controller on the Renesas RZ/T2H Soc.
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

