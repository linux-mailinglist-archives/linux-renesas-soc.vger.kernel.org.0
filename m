Return-Path: <linux-renesas-soc+bounces-12284-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1369AA17019
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Jan 2025 17:25:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E7D4165AD3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Jan 2025 16:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81A021E9B06;
	Mon, 20 Jan 2025 16:25:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7512919BA6;
	Mon, 20 Jan 2025 16:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737390300; cv=none; b=uEij6Ji+FjLeDqjqApPyNioZqTVgIpsHy2UPyJVsPFQdD/wpbvWZCOppz8WKQ5fTTz7IijyafuxAR7ISlmkvQL6D2FVCOfTWw0/0WJWDKTH2bTP0cFWd9UoUbD1PjQlsmkITw9b7EDbQXQs4sU9umJ4BRHasPzR+eL8mBZUMiqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737390300; c=relaxed/simple;
	bh=eY+xkuNCmPvNd/dJde5ASADNuDdFOktSYY73zESuUsU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VnfUf35a0Jgvs6G40R1VBhu2peLSnmNKbIW781hqx+UI4SEU7EO9R47V+x2G5TiYHZ2NJI04e0xeqK9r5+xqUvo9sBgABUKRuOfD3Rk7YleCSy/ulKd/GQVWKZ4I6RJpjhApmG7C2k994qVMPIS8bgvwYQKBaL31+XBsPN2ViFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-51878cf85a7so1268571e0c.0;
        Mon, 20 Jan 2025 08:24:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737390297; x=1737995097;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zBXC+AU72bMkReXL7LoiBN1u65Y7CLgRZT3sSQpNre4=;
        b=q5D0DiyZP5hukX4mlEdOwevx6vEEEDguEyekwD7i/rP82ASJqtF4qLL20WZK0vK/RH
         6N1G1WJz/EPmSAKxPRGusjQO5RuqxcR+tghBPCmUyjorACR4ttxFLR4wrVkKqtBvPQa3
         Cnz2VkoM8LsoxxFl7Xiz4NKowZEKzYCQoZ1PJf5Vuvy63Uoyj00zpgZQPbJ+aY3k34Ka
         guG4Y+1ADPltInMmKBT7DLwnSn1NQY7nBTFY8g0xuPvU3ER/iTWIJFQ/FGZ7uC4fNv4u
         NU4tArIRi28hsl2C4mMhV3b/nqMFfge3grSVtapGUgnGq+OPN+/BhLaRdt7Gcve1WKQt
         BiHg==
X-Forwarded-Encrypted: i=1; AJvYcCVN5VEaLtw+BVsLaXP4mhNWDEp89cymbgxIEkmZdOPSZGs/b2BltLR5EO/nT84dWCZc26osYWjvlEgYTQnquQaQHIg=@vger.kernel.org, AJvYcCVXQDCTUnHqZYnth4w3lSdJGaUBydLnPICxiElcFqC3QPjvJf7EbjPnR4oqhBZS8D6viq3B/a4Yb+UQOEfY@vger.kernel.org, AJvYcCXOp0q2YzFBMM+kazROlKvqmbvAVRYcTqa+1uuEeugFTUP3NdwvpkG7dn/ZLajt1GcvgzAXKDAnaPdX@vger.kernel.org
X-Gm-Message-State: AOJu0YzR7egAD42Me1fWh1BPfKxN3G7l1XxlZIYgascTj+qx35TFgSbu
	m5c2CGkC+D9DgwdUgCmgMPXYKBPitEo5nuiUi8hOmtH9u7LYPp16hypmf5iP
X-Gm-Gg: ASbGnct+vXGpx+jMEf4Zj3bct8qjcm28/frGDetExl1i4eREZ1dd9J2xQfOz8V46hmG
	ofxhL2Mge+DihhUASW3ZGlUMGlLIUaXhVw3tsd+6YYYClh5MpvYPr35cyjIFe4UHsfIjBs/VGBz
	WsO1Zbv9dQ+DZy3k+8ZtuzVGYhwTzr6XO5lsfkEGEz5d1RSer28a7C69T1W4ha8UrzTML/6VJcE
	CJJj83UvWPiTOX8192PUHV5B2O8YI/6hWh2TGbDx/FoAGnMG4SH4QU8V7BVqiRUv5khFRZjHM3m
	w0bcSr5L3xvOuwuuUMfZP5CACtNFXVlc
X-Google-Smtp-Source: AGHT+IGQkItLmfM9YMMXIEsiEjTi3KnZ4Gi3kvmTeW556xFAuvj8jZYWiJSLB1o02o2l8hO5LfyeFA==
X-Received: by 2002:a05:6122:1988:b0:518:859e:87c3 with SMTP id 71dfb90a1353d-51d5b2c3406mr10463611e0c.7.1737390296793;
        Mon, 20 Jan 2025 08:24:56 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51cf5708516sm1509394e0c.45.2025.01.20.08.24.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jan 2025 08:24:56 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-4aff5b3845eso1526542137.2;
        Mon, 20 Jan 2025 08:24:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUK9Bjid00x56zfHZ6RTP+KBQAg/cWaEKLbHMLMmbUgZU4opgYabLaLR/fHGLtjajk/3VNeBQJ8Ivl0F+Z1cUVfVWo=@vger.kernel.org, AJvYcCX+7h6VQzTG9nHYFv7UntgkzI2snVI8zqlPfJCQu871s0mRLfc3SuBQ/scVb9XaCzdzAFAoq2qdNZkbXx1s@vger.kernel.org, AJvYcCXgqEIgsxFPxpU+hbDkmzJemTseakBBMBGi1Bm1LAB1p4MRsVYs3NBeyLcsTJ8PfV9QvO9svvkKrn68@vger.kernel.org
X-Received: by 2002:a05:6102:c04:b0:4b6:5440:6cbb with SMTP id
 ada2fe7eead31-4b690ceb116mr10459789137.20.1737390296367; Mon, 20 Jan 2025
 08:24:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250115211755.194219-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250115211755.194219-1-krzysztof.kozlowski@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 20 Jan 2025 17:24:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXRZG2y3By8wd+QivsOLNa53LiLi8keC4wvdK2nXcmHtQ@mail.gmail.com>
X-Gm-Features: AbW1kvbLwwFgVmTDCtTbmxFX0AKDVfyXTZuGiU1z7dMgoyrsT8qq6wcdVU6xkxg
Message-ID: <CAMuHMdXRZG2y3By8wd+QivsOLNa53LiLi8keC4wvdK2nXcmHtQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77970: Align GPIO hog name with bindings
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Jan 2025 at 22:18, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> Bindings expect GPIO hog names to end with 'hog' suffix, so correct it
> to fix dtbs_check warning:
>
>   r8a77970-eagle-function-expansion.dtb: gpio@27: 'vin0_adv7612_en' does not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.15.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

