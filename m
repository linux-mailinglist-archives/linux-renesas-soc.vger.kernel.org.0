Return-Path: <linux-renesas-soc+bounces-16573-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C4502AA5D36
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 May 2025 12:25:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8CD437B45C5
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 May 2025 10:24:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BE9621B9CD;
	Thu,  1 May 2025 10:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yVXvf5YC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6A81E5B62
	for <linux-renesas-soc@vger.kernel.org>; Thu,  1 May 2025 10:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746095111; cv=none; b=rDcA5k1gfSr34BOKoNplf/6gEcbSOBtxz6yekaxCpiMef0/U2/dj+t3akVlAnO9bAqG8kYIEM0tt2Bh0IuCbUX7tON9iRXv0J2vHwSZzrinrWTTmT5Eyo5X1iR7d4NHhq3INCR7Z9Aapvn1ysk1XvbQE0M7TT6uH9bBPZungNNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746095111; c=relaxed/simple;
	bh=sYes/QSL7lYh2EANjjmItsk2xfCrXaDR1yHfMt8t1Ck=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GKslaiLCLf2irtVgsSNzrod5OqwHxlQffOp1UQL5DrhQf86JUiaCh8RYVjvM+cAF6kD+uAwcEedj4/rpRRtpznt3Aym+hPpOBMZyfWI7Kac4c+eLARAf99YOZCNzE9m4NrvnKSfBOgp82r+UB2oUQqc+ic3cth4NnAUVJ7tiOWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yVXvf5YC; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43d72b749dcso984645e9.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 May 2025 03:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746095108; x=1746699908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xzo5UaerzU/z6WcZpkAAyAJyUoP1AcvGQ9+CcI18aMQ=;
        b=yVXvf5YCMsKtcYCgt4RJUeeGE3L6SnuhQYWtW9NU/FXd6EBQgjqPM5c08FMuUUxfsX
         nuEBINhc/NrOU87QRNYDyNrkVv4dJsm2XRuKk5RcNP2Cn0C3BXu3xdCyXtDg7e6Z357p
         dF/MH2z2yt5HYmLr7xpwOJ5+VRMOJzg/Fvf0cMjUUgLsduSKHCgoczD9TVd/EreheqiH
         drLaAzHNbB9A9toKaGIgEbOeM6YSU1MwxeYyd5yOc1tBZ5MBBrP7IDTN/UIc2rZZEWXo
         KdAzKeF0sLvjH/70a2LQ5JgnIc0pTOMOwnARlUZE+/kWqe61JZZWXPw9rmUMDO77DC6s
         3+kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746095108; x=1746699908;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xzo5UaerzU/z6WcZpkAAyAJyUoP1AcvGQ9+CcI18aMQ=;
        b=j1N6nEn0Oc4TjEFaxCGk89boLGEbqzTaJ4GqBaJ5vb/XSAo1NrCWqLinz/Ht7XwEO9
         exTjS7PZm0j/ZHfM/EjfbG9M7uwPL2+siopk6mpo4tGfkT0xw5LxgGIOe9O811Log3GR
         vbgz36g17IUX7ZjVJckCfBcl2OBOUzU3uGV9dSegiF9l1qwXpVkb+I6JpAmYGSuFCaR2
         JLc9S2R3fhtXnUkhbh1MpnQ/fV3rvJjDbrV6mb6L/SybFbFJEO1gSkDOoNGJ+73TvAWq
         apRpa9E7pNDlFMu0iNayuhI7ab9LhnrQKj7BGqd1ZXWxFqeNQv9zgiJ4suWP6XUGbf46
         kPCw==
X-Forwarded-Encrypted: i=1; AJvYcCVu/j7NbM/7vo23ZdSqojp9uSedR9fJF5fHV2kYYnXM8B0eDCZyr/40I/t4RI7XGyvbDqDdTc3vETYc1WT0KCPrfg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlnUX7QS3gzbxtAoY+JwpwdNsA1EM5KQlZiG6C9rhNVphOIZZE
	RJOOsJ7SYoNZmCzaTIoJBkLahXuxMPQzGAgIZSxc/tEBHUTWDtYjSWuSRb+GB0A=
X-Gm-Gg: ASbGncsHeBFXImkaU2eNEH38MAIsRIDZTW/6L+uTbbt2sXaICFb1y/kEJGGvbRP7Pp8
	CcMQ9VLGlDf6QIdynld9OcQAh8bbjaYbvFtRcR1lWLqLZxFFDwI9Xe7b2HK0aiTZM55xIry0Sjk
	nsvM2pxNnAwMRReYoIWbGDtHX6JiJbd359TahKeD292HwG3BOg1CDTuLWNXQrqiOqxBOH+d4ZCT
	IQ3/GD4Kdmge1m+fANJ6LqcWZY3D9oUOlFZIjygMhcRwQDYK7R4iKZqGlSyaliD8zClzdavMhbR
	4lMz2RZqGEadeo8+EGOhQtoEuodFaXCO2CGl3NrsproQN20AUATjUsLYNkhV9S/+vMw5tA==
X-Google-Smtp-Source: AGHT+IGr19eywqEBW0CfdHUwiDhptB3g2qfmLLn88nWpUIJsB1YXHpIZb+tHLNcCcC/qipv0MN5G6Q==
X-Received: by 2002:a5d:5989:0:b0:38f:2ad4:6b1b with SMTP id ffacd0b85a97d-3a09417c3a3mr530145f8f.13.1746095108168;
        Thu, 01 May 2025 03:25:08 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a095a8f7e8sm460820f8f.100.2025.05.01.03.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 03:25:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Mark Brown <broonie@kernel.org>, 
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
In-Reply-To: <20250424090000.136804-5-biju.das.jz@bp.renesas.com>
References: <20250424090000.136804-1-biju.das.jz@bp.renesas.com>
 <20250424090000.136804-5-biju.das.jz@bp.renesas.com>
Subject: Re: (subset) [PATCH v5 4/7] memory: renesas-rpc-if: Add regmap to
 struct rpcif_info
Message-Id: <174609510703.12307.3952374173180482008.b4-ty@linaro.org>
Date: Thu, 01 May 2025 12:25:07 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 24 Apr 2025 09:59:52 +0100, Biju Das wrote:
> The RZ/G3E XSPI has different regmap compared to RPC-IF. Add regmap to
> struct rpcif_info in order to support RZ/G3E XSPI.
> 
> 

Applied, thanks!

[4/7] memory: renesas-rpc-if: Add regmap to struct rpcif_info
      https://git.kernel.org/krzk/linux-mem-ctrl/c/198158a8f64cf150325f68044274e21ab0aa69c8

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


