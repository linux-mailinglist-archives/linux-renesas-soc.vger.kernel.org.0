Return-Path: <linux-renesas-soc+bounces-16799-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 62356AAF6B6
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 11:25:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70D6E16C3C0
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 09:25:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E843198845;
	Thu,  8 May 2025 09:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CTCe0rHe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1774A33
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 May 2025 09:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746696320; cv=none; b=mr/C8U0hUZu2FM5B/sEpzon2MCp8nszqqbtg2HMi1EZzHXzhjFUr1KCSq7CH8kh+vOoq5IdCprxJ2JXzb561yflCltRHDB5nJweiMQKbc8iujmk0DflP3LPHYtaBQnZIAxJwPHUewNrCRhoxu5s+YExGKH2tzxdunefIxrgD7mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746696320; c=relaxed/simple;
	bh=kYYfhwdH8JmB/Th6nErKavrIfexRZrStY3Tr3bkl0tg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=IiC/gUHkXi/qmwYEbsSzGlpixTmZUI8S0ofe4J+yej7UaS4YCVaip1TW118lOG9i47zK0wqngig1c+M5t0nlDLyWjyp2UZpRTf4msdEx2da43A/Y6BopclfrPWHXY2megFnE+aBrAlcslBjW86n4vVJpClqDHsfrxl63C+inwag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CTCe0rHe; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a0bb8f974aso23034f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 May 2025 02:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746696317; x=1747301117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y85G8JkzC6F/bDYkpnPt6UUAW45LBWvh5eiZBzSD+hY=;
        b=CTCe0rHeZgvA02eCz7OqHymDkECjpuV/0lMDRg4D89l/dfEkzFZtTp2/6l6ZN7/TT/
         ZaJO+SbhGu2pUJ1ArfgoBZTlyGqwrSScon7tpan+WikZ30hUoBKA5VQp0oLQIaMpKlSk
         /fvBzms1ORWuv0s/e8X3+4acvBS0GSdsUDyMH3GPJ+6aBkX1/MQbFu8kq3U+SIKTPEZy
         AcqZc4TSE+oduNcF2QNti1Rc8lcyJk8Uii0CmeWFX/rViM29JG9MCpL60hAJZGMj7sXP
         IFfL2n0qgA6/em5L8inC6KhacFU9c+I2dL+1+lSmV4kE/ErK6DnZ99Rlw5r5+wJPtcFg
         1blg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746696317; x=1747301117;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y85G8JkzC6F/bDYkpnPt6UUAW45LBWvh5eiZBzSD+hY=;
        b=mbvTs19KuivVTJrcqIK0CxKQzAe1Tz+dXcQ/78E+UBnwSxStpffBHm+ggMsbfKkWKS
         r/KOGfI+mjU9Frt7vlSFACaqBIdJqqbGp8/hSzZPwDo9Y1rt8sYmORv1UfyATtSW5cXD
         t7SFNe8ge9hbXrRzwbVMRsMRm0X4fAMfMbkpnYEOCOXows0HvX12VDIQ8NVEFJ/990sc
         oyKhdrsQWZlcNVtV1FY/YeVHHTgrekrwZUvcnsHTiFAmrqDovA2wfJUfL3+G/fEhm8qm
         k68djXG03qTp12fpOUpG3XmCFiqdF9/nFrI3mBjJBXreE3l5kx6LJNGab53/TT9+qhqG
         6IKg==
X-Forwarded-Encrypted: i=1; AJvYcCVptKcYyFg3V+G3o7Jn0Qd8zwe36bCzK0azv7Z7oEh0RbjzVfD74MIauOgHdG5Y0hccvo0lHQsm6FShfSoMbF5bYw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yybj/l7ZvLDD4wXxIi8gbtJZ7MGVYLkzb/Jg7CSX3kxSx1Q5Spb
	pEsMw5+179yXW9uOysVAguXV7itilFk+n8GuDMh+f5+JF1EwbGF2jiRDWP4pedQ=
X-Gm-Gg: ASbGncs/WiIz2t1vE8T1CEfONNtd56W6tutf4LUOMO4ZCE2lIJXBXhhllmWTtCRzhhT
	Gpa9emsQLVWRdAJ+0K4kQTTGAN70ykdN8xCxgqId53RLU2IngTSczmEp3PJmG6I73+EAahLQxdh
	j/erTJu3Q6DfT4H9vWvsMQk8b6EjfXP1L8qB69E7X4G/fqvRT4mZpGBE7kvag9yRA5lN6y3L4BG
	jzWIAa8KDFnktBOe6nhvZ5knCFrD6TLHBDz2eqL2YwBxZOjuMQDdG8Peaww4mmLS3m85oJUbAgp
	y9Kn7CshupyOHsGgnYpXElgS3DdshbHPE+Bx7KDh/WKkJHhym0JixNCOiOlOMrebJI3O+w==
X-Google-Smtp-Source: AGHT+IEToWuPh8etizRcQbf+nBemfSKebM4DJ73PjYTKCtXP3NVqQjwV17olf9XpSjWk88smhlhbdg==
X-Received: by 2002:a5d:588b:0:b0:39e:e588:6727 with SMTP id ffacd0b85a97d-3a0b4a02996mr2108592f8f.2.1746696316712;
        Thu, 08 May 2025 02:25:16 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a0bb7c29e8sm1632078f8f.7.2025.05.08.02.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 02:25:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org, 
 kernel test robot <lkp@intel.com>
In-Reply-To: <20250507162146.140494-1-biju.das.jz@bp.renesas.com>
References: <20250507162146.140494-1-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH] memory: renesas-rpc-if: Add missing static keyword
Message-Id: <174669631572.53887.3420826477735921863.b4-ty@linaro.org>
Date: Thu, 08 May 2025 11:25:15 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Wed, 07 May 2025 17:21:44 +0100, Biju Das wrote:
> Fix the below sparse warnings:
>  symbol 'rpcif_impl' was not declared. Should it be static?
>  symbol 'xspi_impl' was not declared. Should it be static?
> 
> 

Applied, thanks!

[1/1] memory: renesas-rpc-if: Add missing static keyword
      https://git.kernel.org/krzk/linux-mem-ctrl/c/798dc3f19c9e3855c18c3afb610bc5d27195ef44

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


