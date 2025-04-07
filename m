Return-Path: <linux-renesas-soc+bounces-15426-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 86597A7D6E4
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 09:55:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4BBAE1883A73
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 07:55:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 893AC225A22;
	Mon,  7 Apr 2025 07:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="gY9vH3Rq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86E7226D16
	for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Apr 2025 07:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744012451; cv=none; b=UKa3gY6oMXVdq9HqJRUFU6RpKVBEBtPh7muYchjoulgKbQyRV0Q6/znTGSFOsh0aeeRg7STARK274mE2R2yB58DMrZCO+ZZjyYK152x/IbNV/p6e+R7IEenitfdcmX6N3Y0Pdnnws3Eo5p5QZZFLLHXuq0Vrs2kAXIYiU96GQwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744012451; c=relaxed/simple;
	bh=CIvTP/MtFKlZ44qkNUVxMOzv+BaCzXjhTrSxyHWhQJg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Dap48EjCkodjGwL5N3t7sfzdUHzOuF3qj2MfBQkdQKvEgcPWYTos8eWEqj4RzvchSpGBLDmoyffAUklA2+M+H9aVDKU5uKqZE7oL8/DbG+7HSKxztq2TdZZjfbH2LmjaZ2zhKds5HIqfB7ZXTtQFoumKmokvwUF7GNSfIw8ofn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=gY9vH3Rq; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39c30d9085aso2283733f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Apr 2025 00:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744012448; x=1744617248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hWxLTEfGg4dc1Gy9lnOUuyFlka68Uiuevn5CcOM/QrM=;
        b=gY9vH3RqdQR+gB31TeRw9A4NMKK4R3ko1BGYlzuJt71XNoeAmw+yVis7vxE7clYIX7
         K8FLRG621Tl9wxo4pULgNMDj5aS8hRxljj0KKnmvRqRpJVJzj9vPr+xXZFfRW+dbPsXc
         UPX/wIqJpVv9C1lF5idpaltVzoMLYRuhyLfStO6LLeg6sBuTNby27ccQ09a+uoY84OmT
         orCiCGIqRns6tTuP5ByttYjUZDMztsypTQCvFM8EUT0GINoq7WMglffZLpZPitzsLZCu
         ZTtlGuGVHqVdSK/KMmj/AFhfj03ge6bAXFgmO4N/5oQtePoVkJUA7UP0NC4SO8CKXJuL
         1FYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744012448; x=1744617248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hWxLTEfGg4dc1Gy9lnOUuyFlka68Uiuevn5CcOM/QrM=;
        b=qZfpDClVfAMLXJHvBPfqqWiSkpnjBrmF9IUk/AA4booKahDm7AodGUHeKuIfaX9341
         wSmkG+P+53vho86+KGDPVq/tC3zXZA1FfPjTdOO4MwsN9P5i9BISRFFKeCrwQld+wb+0
         YU7fytANi4C8q6h8oJuLDEv8pkX2L8G6oAS+hI9nDimJt/LRgjF92M8Na+3w8vJVMVzp
         WY9Nif8iBTVR7Ld+PxWWjgiZ8rHyJw4Ig3ATklgjyDvtXIIiMhT36FrZIigr+1c/fDJi
         zl0dYN6XcbPvlkaIfavIUDtsN5caAyztqbSCz+75bw8Oj5Q5j2OOfyrm6wUy8KSUdmoA
         TWeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKIjIul4oi+FZMJJ9e8kMCneR4i8dhagYar0bC3s7pL8VsuNNLGTyHpsW3et0lG1yx/5VMStWLNka8jPEgeBAZww==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLzvLzfGInKbXNCEIqTb6pypI8JV5aTgDe6t1yyqMFtSzb1Rwp
	V0q+etXDqwuts/JMqq03WXQEL1d7hMbK40UdiB9P75kdjTCMC0SKJJ2/bnr0cc0=
X-Gm-Gg: ASbGncuW61uaaJ1F+ec/RjlLU8+yXA0Zi7QN0ZTmarHd/fjFdpAvc4mC+r2YJfgZuI2
	+VaM7mTRxx5mVGBU9WwWEDDYsmZtwChf8K5LsVZgaONCvdVzB602orOEgjpwyXfaecAFxBCEbvP
	qEqJMKoAei39aQTwK4C9ohTsNxI7L0THtzZl/PG0PxddRHBD80o+14WkI3ek/mZEy2YdF4EjqkT
	nbv8nvGsKzcLDpqdcFuLfxdoX++a/dnHMfWLfJzlq0ivyssVBeE1o0nHNGFBjWTvhtbVNigKJCY
	IdLFWJH5X6SSjI4PpIV/jm+IhcY9y+Xt/o4QBB/UDaMe
X-Google-Smtp-Source: AGHT+IHuTVRTtHbtmx6FjkvlzIbJVnydF8KMECgaQSarUJ94LjdvsgdrKIpoRqGzKFTua17ynl8uDg==
X-Received: by 2002:a5d:5983:0:b0:399:6dc0:f15b with SMTP id ffacd0b85a97d-39cba93cd69mr8684049f8f.48.1744012448217;
        Mon, 07 Apr 2025 00:54:08 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a9bcfsm11494514f8f.33.2025.04.07.00.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:54:07 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Manikandan Muralidharan <manikandan.m@microchip.com>,
	Maxime Ripard <mripard@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Sander Vanheule <sander@svanheule.net>,
	Bert Vermeulen <bert@biot.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] dt-bindings: gpio: Correct indentation and style in DTS example
Date: Mon,  7 Apr 2025 09:54:05 +0200
Message-ID: <174401244312.28249.6012698269615129555.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250324125326.82270-1-krzysztof.kozlowski@linaro.org>
References: <20250324125326.82270-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 24 Mar 2025 13:53:26 +0100, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.  While re-indenting, drop
> unused labels.
> 
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: gpio: Correct indentation and style in DTS example
      commit: f4271a891dca46ecf6813273ed63e502862f45da

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

