Return-Path: <linux-renesas-soc+bounces-8585-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E7628966F73
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 31 Aug 2024 07:43:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F5F41F22A1A
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 31 Aug 2024 05:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C9EA20DC4;
	Sat, 31 Aug 2024 05:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vhuAMHMb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A51E137930
	for <linux-renesas-soc@vger.kernel.org>; Sat, 31 Aug 2024 05:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725083035; cv=none; b=TCzvFouzmleX0zvKPEaebXKnHLZTCHAr+Nbu+vEikynOtmL1xhQmTttv1PHxZ1UlIS1EGaMy0XM5MlqPy0FOye4LeokoRB6i5EAaPUx/jFRQjsELmPOGYDGtfqTbfyxLN43DAQSkh4ey2wjnedEHrX9/YJT5kFoQDxcksKCHBdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725083035; c=relaxed/simple;
	bh=oJF51jR/aFWiZRZQDqab6Xg0xtBWy4tPOhJ3xsZJNDU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lsIF2PvuOyQc3FyFSW1lzVZJGO+0cRD5vafS6zXnWYicep7sMbhj1G2HnB70duFk/EW6QTeKrMfHLF4xTrJggkw/hcZfSBd6XNuosPe2+Z8PCsOI2OytDWQ6+vks1tkt2JgLVd2Z+woOGUVhvqD28FH42nKAX7O8V0toZSsU8lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vhuAMHMb; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4290075c7e1so3406715e9.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Aug 2024 22:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725083031; x=1725687831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KGJgxJ9x448Bf4sf4RgckauRjDt1KRpph5kwxIaQ+GI=;
        b=vhuAMHMbr2O0stAeGKfBaUGUW8rJIQRYdYN8wkzjiv0bqEFeit6GPSoFynRo4VyGQZ
         9OA1i471+bbxfZUusW4Ao8fX/O/gtOvfZLmY+QYjabhmypWTlKZfRAb+9QKVA7vXrj4f
         YnHf8AhsdnoB5NV9MSjAADxf+FGctxenAECw50slJx1S6dKzGAFZ0ZxVRmmai5B10AwD
         Rw6xsTSt0180XmatWB8QGc2JB/Jtex+ZTwdBSjbYk86mfx9pZwEMsKhrN1KpyqX1KUt3
         4tMdOQZ43zwVi1WnZb8B2u7wrgFKfiPnTk9ZT4rvHqQ9+8DBOJxIvSkaQ6EoC/vuwk/R
         60mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725083031; x=1725687831;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KGJgxJ9x448Bf4sf4RgckauRjDt1KRpph5kwxIaQ+GI=;
        b=PwYuHaMBUv4w7qyp2st3e3p8NZQSPYaEriFZTM3Kt1y1IolOp6GxtKHN6fjsLWjJxf
         rhxSMXgBZZV5FNrsuJ4BD54zKwQHavVmiLuIwdIl9evmxzz+NDqYZX3SY/k9eIw/Qj/n
         dHBl8WnQEro1tBiTxqWk8XMa9nxlkqs7JWiipB572GmavxdoTt/3szVfcoNzri0qgOvP
         8ei9ojoYzSlxEBAjn+X+bosqtpXd6zSihIG9jJY43MQ1tb9PA91smyWYPglJwr02IvK/
         22zy/Yp+YfMv1h9Px2zgYqCz45UoMQea0szp9N7JJDjH0uMc2tSjiN00qkE9yAkgJL/T
         gIlA==
X-Forwarded-Encrypted: i=1; AJvYcCUQaC7/mQhXHrntrkuzP4Sdp47tnUyX/cIcwn5agBJjbEVtjj2IRsxNGT5jFfwLFFxCsmcV6WMvW9C0u6NaPeiDxA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5jEPNaDE0rLUvNIcU09KlL2UUNfai02D/OvueTkU1UxLNHUUX
	pCFTRaVd863owmQCRIMV52It0rWkiS8amURn8MBQjo8CPRCsdWF/9SgVAkGzwB7JiOAGZhAQVYZ
	s
X-Google-Smtp-Source: AGHT+IGZ96SHqs+1Ptp5AgciP+z24YFgZw4hgXiUNWIHVOLJp93OOktvRTD0rUE9ivSIskif4C+NSg==
X-Received: by 2002:a05:600c:1914:b0:427:9f71:16bb with SMTP id 5b1f17b1804b1-42bbb483e16mr17152915e9.6.1725083030798;
        Fri, 30 Aug 2024 22:43:50 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba63abebdsm99576745e9.27.2024.08.30.22.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 22:43:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
In-Reply-To: <20240830203014.199326-2-biju.das.jz@bp.renesas.com>
References: <20240830203014.199326-1-biju.das.jz@bp.renesas.com>
 <20240830203014.199326-2-biju.das.jz@bp.renesas.com>
Subject: Re: (subset) [PATCH v2 RESEND 1/3] memory: renesas-rpc-if: Use
 Hi-Z state as the default setting for IOVF pins
Message-Id: <172508302934.6469.16691159452527170404.b4-ty@linaro.org>
Date: Sat, 31 Aug 2024 07:43:49 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1


On Fri, 30 Aug 2024 21:30:03 +0100, Biju Das wrote:
> The RZ/{G2L,G2LC,V2L} SMARC EVK uses Micron MT25QU412A flash and RZ/G2UL
> SMARC EVK uses Renesas AT25QL128A flash. With current pin setting for
> IOVF pin, 4-bit flash write fails for AT25QL128A flash. Use Hi-Z state
> as the default for IOVF pin, so that spi controller driver in linux will
> be independent of flash type.
> 
> To support this, during board production, the bit 4 of the NV config
> register must be cleared by the bootloader for Micron flash.
> 
> [...]

Applied, thanks!

[1/3] memory: renesas-rpc-if: Use Hi-Z state as the default setting for IOVF pins
      https://git.kernel.org/krzk/linux-mem-ctrl/c/84d1078af52f6a099267fccfb1dda602ac8b66d0

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


