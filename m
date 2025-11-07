Return-Path: <linux-renesas-soc+bounces-24303-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE4EC3F063
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 07 Nov 2025 09:48:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 40C0F4E79EE
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Nov 2025 08:48:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABB662BDC2B;
	Fri,  7 Nov 2025 08:48:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32017284B37
	for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Nov 2025 08:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762505303; cv=none; b=Dg0O1L2crssParAAB6/TRL86g+WGIJNY6rYT60ZbHLIE8lOa9MREeQT0C4DsTeOI5CJmEzaOveAcMcHRtcuSdSS9P0noTz78+L5a8qat2HWRfG4aO5jeKsHwt9jPRyXBWa2gjOaUKtLxgCpuctRZq1dDGSECVDZSpTfdWhJYn8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762505303; c=relaxed/simple;
	bh=/j6PN2I8EA2YAewaRE8oTrWR+5nixfJQRCdWXFVQdU0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p4t+0w1xJZloCRhexgR5IRytLEOmmeunANt182E5/N0OVBqElc6adSJwSABsKvlqM4HUi+QKKdbpyRtTbrGjNM5wjaAJ799DvEkijhB/HoSu/hSWb4jv54dUP/85NvU+nZTfeLXIje6drFTOyLyKwTiVSH8YMnWjQ1pGQ9hRAgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-932dfe14b2eso307979241.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Nov 2025 00:48:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762505299; x=1763110099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UZwIVFjGTkbkhy7kyec25PERQm26PyO71+gNhhmUlYE=;
        b=UvUH+XxMrXK47eX/PtGm0QHy5aLSf0rA9QB8UMpT4rq5sWTNfjSOSFeXoqRU2+NtED
         zZ16+tVcrZEYgcUoz4cLhDLo3Gdekv0hVySolz+KAxb5TCbeE88q60AbO8PspcDnNTe1
         CsvG3UyXBlPYzdfpwMPb1rWFF3gs6jXfLAoM+L0M3oJeqZGp/bRZ+WELpRwO62VbGXvS
         +vw/ZS75XpMkvf+htCkQ2EVCNYW5+njCvdARQeU1V5ZqGPe4lUfjO+jjkk7rSdg6jBFZ
         rzr/X9t168uzgSutVF3FmHI5mXuSEOHT/JlymKt/tFmF5hMDTAPY2UPiIx0sy5Mem4vz
         hwvA==
X-Forwarded-Encrypted: i=1; AJvYcCVhrzESuczOfBOz6d+e1Skngkle7K0oWu2gH4p+kbZOWvnLj4uNGZ6+pP7My/Ro335FldLVF1zPqfr0xl2eDU/U0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzuaT7jHzYVnJTd1X9urD8m8Ickwn+AohEkqgrP0CX80gLhN3ui
	ZkNGdSDHQBXB9zodR/49G9VOdi3jvgeAKHNq2CFHPcKU1X17HC7Vj/Scg0uVC7NZNII=
X-Gm-Gg: ASbGnctat7IXV9l0JGPSfxBvFPrL7yV4xn0t7NYXUBHVVQApmye4KWj56rUq9Rd50T1
	gaCpQ1p2zdJNT+OktgaCAy+A6Qw9nLjmvM0s1LBnAdYZ4706ZE2eTkeNiw3fkS2bNtGYbArylF7
	f2evmPkSm+zWJKrt1ZpFah2CTz1aOWYzq/E6MpvEq31g8ipsNgkGpUtr8xzFJUezEnEh+rTuaE+
	6oayXTaB3cQpmAnMA55VgPAkaVr7YkdbqVWjwEN/UETuU6iVfGacLXnPumZECLkVSXTgVZr4jGe
	+JFtVAq+lLmR+UvrqIZIKxFgGmis2K7ByScAgvzC4p5O2cgYWWvF3z7jT6EOUYXFI0TPVLzUGZD
	4OkjPeX2cb57DRPi9+xYktvqreBzEStN7R1ZcbPoPp/Nm+oUIUkthQkV/rkPcor8/jcy7lfqH8c
	Cv42oycRn9h0zi2op8TK95159gr/ze8Cyn4zo9iAemmdlaLK6744uIQmMH4Dc=
X-Google-Smtp-Source: AGHT+IEe1gsZhtLMcCpdXKvzROOSAwfZfMmiigtquMlCMKqiqhxmbmFWsjcFq7I4yJq86HDfUYSxqQ==
X-Received: by 2002:a05:6102:f12:b0:5dd:89ad:6937 with SMTP id ada2fe7eead31-5ddb2101118mr757600137.4.1762505299453;
        Fri, 07 Nov 2025 00:48:19 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5dda1d06bd1sm2100096137.3.2025.11.07.00.48.17
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 00:48:17 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5db308cddf0so339729137.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Nov 2025 00:48:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUPkC5X+S91E46S0Xz8s0M9MxXhet8XQLPF2zrVX9yqptnqbquTs1q1SOCgJL8NJ7y4DGuGcWNoszw3EAdr3TTw7w==@vger.kernel.org
X-Received: by 2002:a05:6102:f11:b0:5db:28ef:3dfb with SMTP id
 ada2fe7eead31-5ddb229b50dmr897200137.34.1762505297024; Fri, 07 Nov 2025
 00:48:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251106212342.2771579-1-niklas.soderlund+renesas@ragnatech.se> <20251106212342.2771579-3-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20251106212342.2771579-3-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 7 Nov 2025 09:48:06 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVGGw9VN3=zJ4FYzAeYSOrOGoSOzDUMTkNF5GF8C=XVAQ@mail.gmail.com>
X-Gm-Features: AWmQ_bnj_wKfSmmHTUuO5_DYWTiuoJbMwmZEgTT9nGkrPatgnEe5zw26ykSXS40
Message-ID: <CAMuHMdVGGw9VN3=zJ4FYzAeYSOrOGoSOzDUMTkNF5GF8C=XVAQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: renesas: r8a779a0: Add GE7800 GPU node
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, Frank Binns <frank.binns@imgtec.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Matt Coster <matt.coster@imgtec.com>, 
	Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 6 Nov 2025 at 22:24, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Describe Imagination Technologies PowerVR Rogue GE7800 BNVC 15.5.1.64
> present in Renesas R-Car R8A779A0 V3U SoC.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> * Changes since v1
> - Rename node gpu from gsx.
> - Fix sort order (by unit address) in DTS file.

Thanks, will queue in renesas-devel for v6.19.

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

