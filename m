Return-Path: <linux-renesas-soc+bounces-26074-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EED2CD99D4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 15:25:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0AD6C300889E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 14:24:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71F91322B92;
	Tue, 23 Dec 2025 14:24:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91D425FA0E
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 14:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766499893; cv=none; b=NQFanSnOH9l7A+A1S8EOkYIuPyTkZbJwinCpB3xq20jFvf7nZhJAk8JdCoJjEnc4TZw8bWBwTlnsPu7FUnbGFFWWwcqEuOntOpSrEzfdPiQ8IkCmd1aPfqHh7uZIr7nB2t9lg6S8r2xcECJWwk2yp1loRC7tI839yM7l9SnJKAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766499893; c=relaxed/simple;
	bh=ogzBvS29Ue/2IXvBzeRNG78it29lv+6MNhav5HFyVj4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jPYvl4q9H/mpp3bCNZKjwSde5QJbsF5ctbB8AWY/aSqIcQg+cAlUTX8teKGlpy/AKZPTnD7NstD4g0Qc7eDtWJBdqOVR/MFN47UdNfMejotXFukVRtO6vhfQLlVu42+J7djQTURylTpMAtbh8ZEJJkfkmLi7wRnd+gdVhK/eAGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5dfd2148bf3so1692001137.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 06:24:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766499891; x=1767104691;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fqy4upQ5W7t+jp1G+g2SJ1qrfxpgarALeWZ6iD6XhOI=;
        b=b+1WFe13QeCfVaF4Epq5824D5Ve+KUWsjn0+i42ahn8B+x69g4ilHX4holbaIuADHJ
         gBXBfV9ye1/TRwtUit9kt0WB+GqaNaFvpE7gatEMy6VXSX4koHccV0Ny3qlusr4APvr1
         iaWc8jJyafcCr49EZddbzIl111jlZkoUJ7scwtXp9gaHep0ONm5tUytv625uw0Tu3kMm
         zDvu1SOyi9PImfg6vMESRpGUP42p++8lM4pnAN2B0d1ynD6tpHFRmoHYrjRRfEXe4yUZ
         YgWyPlTdfb8tYHaaBDuMR+4mL93LwtdTYAR/PPeU/YHX4z8U/DjPimjr/0FwKmgjnDxY
         6yVg==
X-Forwarded-Encrypted: i=1; AJvYcCVmZGu82ti25uLcnhUMa2x5MdM12WkDnaHbWMugt7X3/qUGfPtrBRrhjm0XuZmRrN0Nmfa2FU1OQ1cD+Ff1Gh9EKA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa0mf4kBvAFr8dgTNyQ4q10sv5+75E6YbKmXs9Ytsw10DgvDkm
	RO7bpst7BUiMEdAO9CVq0rkPAfuZqeoNfb5ud6yuNGukF0OcoQKaO86uTT6UxcM3gaA=
X-Gm-Gg: AY/fxX5NY2oM0EByRy/yAxb3nI1/1Z54nJJLDywogyxSlwzj9XgabkNOqOCDY30Dl1Q
	adCEcRTU0wmBT4XMjhrO4+hR5Zdh4L70mw0Czmk3cP+SVljbdhig/HJaG7CMjK4/JNaT4tA3rG+
	qHq2MzgfbLgEgwoDVuWo7kN+qhKs5fh4DWtMjuAS9nR1FTo+XrKub4n6OSeGDWWc0/FTb/J3ze7
	PeRIioMkvMqS0fJqLIJjojsAvf2t+m0Ty4/gVHIcLMtbKu8vgXl6mSMu8DFdAkfGBwvA1/7W/6K
	dGb/EYvyuD203C69rDzGDxDl2Od8O/xzM+hmz1C40Ihncx0l8qxN0/Yrr8ooNsl+syG+k/WFIdq
	Csk7HFfpHYbhA/vhU4Y/3PlCYQQlLXh/ERFTLSoq4U2RCaszu9VP8KLUG91jKXcDt+h4p749vaE
	vxV55ZLwhWsY6KJfAObDQEii4LBtMBnC/gm8zhCOmDBdpWuLcU
X-Google-Smtp-Source: AGHT+IFvYc4TRfXGu2T/+N9MTXmEBCm1nT+QZyJjcVqOU24OJq2AesjM2zJWrBFCxB/ayQn9wKO/yA==
X-Received: by 2002:a05:6102:3f51:b0:5df:b085:835a with SMTP id ada2fe7eead31-5eb1a810179mr4630812137.30.1766499890631;
        Tue, 23 Dec 2025 06:24:50 -0800 (PST)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5eb1ac94ed0sm4343044137.14.2025.12.23.06.24.49
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 06:24:50 -0800 (PST)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5dd6fbe50c0so1688399137.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 06:24:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUNODWCj39zfHP6YBephOF7vYTPt1wu7nxob6QBmWQz8rNBH5UOSr7IuCKFfaPt9dl1ied8Xmi5Eg3fSsl/bDVOEw==@vger.kernel.org
X-Received: by 2002:a05:6102:5e81:b0:5dd:8819:e68a with SMTP id
 ada2fe7eead31-5eb1a8122f2mr4383697137.36.1766499888811; Tue, 23 Dec 2025
 06:24:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251201134229.600817-1-cosmin-gabriel.tanislav.xa@renesas.com> <20251201134229.600817-13-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251201134229.600817-13-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 Dec 2025 15:24:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWUPM=q7J_S_x7=CZoYxKm-v=7GGGkq9Nv0T14b8MBtpA@mail.gmail.com>
X-Gm-Features: AQt7F2rOMWs-9fKqfhdAbKXqn60pJqEJhnj5TNYUFWGKrGSfLOShXq2lSJzOfRE
Message-ID: <CAMuHMdWUPM=q7J_S_x7=CZoYxKm-v=7GGGkq9Nv0T14b8MBtpA@mail.gmail.com>
Subject: Re: [PATCH 12/13] arm64: dts: renesas: r9a09g077: wire up DMA support
 for SPI
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-spi@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Cosmin,

On Mon, 1 Dec 2025 at 14:44, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> RZ/T2H (R9A09G077) has three DMA controllers that can be used by
> peripherals like SPI to offload data transfers from the CPU.
>
> Wire up the DMA channels for the SPI peripherals.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
> @@ -200,6 +200,8 @@ rspi0: spi@80007000 {
>                         clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKM>,
>                                  <&cpg CPG_MOD 104>;
>                         clock-names = "pclk", "pclkspi";
> +                       dmas = <&dmac0 0x267a>, <&dmac0 0x267b>;
> +                       dma-names = "rx", "tx";

RZ/T2H does not seem to have restrictions about which DMA controllers
can be used by which SPI instance.  Hence shouldn't these point to
all three DMA controllers?

    dmas = <&dmac0 0x267a>, <&dmac0 0x267b>,
           <&dmac1 0x267a>, <&dmac1 0x267b>,
           <&dmac2 0x267a>, <&dmac2 0x267b>;
    dma-names = "rx", "tx", "rx", "tx", "rx", "tx";

Note that this requires updating the DT bindings, as they currently
restrict dma to two entries.

The rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

