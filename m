Return-Path: <linux-renesas-soc+bounces-22496-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A34BAF634
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Oct 2025 09:23:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59F8B1C74FD
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Oct 2025 07:23:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 639C726CE2F;
	Wed,  1 Oct 2025 07:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yChWmFql"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD17248F51
	for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Oct 2025 07:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759303410; cv=none; b=gjT+Sli+twrWM1y+kexpdyYvZN9tykRFiecpn28kOEyaQyAybFNLBkp/5kjbJZvJsCFhB8902Te/V3ui9z8sqk98MNveI67apOHb/yh1klOMzDek/pKhY1K+N+2DEiCwvFbB7XYdCx+5ZiIcbN5Pnr8D9BBaNSe+i5KOlb4SRHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759303410; c=relaxed/simple;
	bh=Aw0Imp+/fA3UG6KHW7xsOYg6eFlJqPcphKlJmGfSaGA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=aQlJuRaTuN6JSCSvObpVCA5Bb0tDT7ibykn0hQDIanZTnnekEmkyBY5xHMkcHOlX2OQ7qV0o4l1n368OvzQxieRwYZFRLOSSPAIy71kBSIhaisbxqL6MDphARXNiCw2Q50Y9ZBq7Hp2t84dd4q0DuHeiyk/W8XwzHq9Cdz2T9x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yChWmFql; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3f2cf786abeso4781562f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Oct 2025 00:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759303407; x=1759908207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VkTJvbE8D9pXlnX/SWWHYVNJ++dr8zamI8M2eVs9tNU=;
        b=yChWmFqlFd50BVSTb4pPYRp5simE011rY7Zxqz45kKh1hb846ebEg60+SrswlNFdOh
         z7OYSCDwSrwvFHj7xkwgFwY+EkZSXjYKNBmCOXsmC0S01WbsndS2+8eUIuElBvXw5ce2
         douPvDa3YFRBz3c2AB9RamdjvWqSJqoSLu52YhLWTKoTK1/MVdDTBp7bTm131HRYWg9+
         7q6vFXtNdDZH7WCote5Dl5NgP306QqlUNfdN++fs3aSBhCqascDSZbnk6vUDibthi+It
         KnLNPc7GrgkSE9EwZoBIdChGmZgV1kiRprol7u1YIzDuAHbG+hcZEBXIM6VGa4ocYY/L
         6D/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759303407; x=1759908207;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VkTJvbE8D9pXlnX/SWWHYVNJ++dr8zamI8M2eVs9tNU=;
        b=guNaKdOT7oVh30AnHYMqpQ4nDc92Qe+DeubwyJQ+4oxfAync/4MM8wq6y4x1MyNKFl
         dc5ro6OTYjUNqsP27M840wWFH/jMWLVvTTDXJLbO571A5shOBNurNsqhO/77YZ6k7nc3
         BcJVH+YpbFEqXfoDNYBIfE0D9YWxFlvQw9rJ+liFWhYmDYoUmjdZ1ME9359/iC3rJyme
         qRy6z5AXUktdvzFnRp/tBkc8zsfrrm+l+42Q2mEJsaW/kaTPqnmo6B0BIYuZtnWJm+ZG
         3Wx7tiOGcclrrW4JP3vqiHT/yRQz4NLIcrcX4soabSXJClGixXSbTpcYH4jwbj1ay1KE
         /xJg==
X-Forwarded-Encrypted: i=1; AJvYcCWN3rMFsvltrIINrzAxdOZlqIWhFasf/kMn5ECClNXpDYNE9ShSpOUR78ykgLiJLD1TMESVtXApDCluHB/QR/xMKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoiwxIH18HvwwjDVYkzZxye7/q4E4v6RO+vyoSyVKDJANTX8TC
	vyHedjM4Gcwg5T3SunSzOuCMprKGY3HV6IrejoZ9KEKSUsnrI2i/iOdoqdDRJiSRJ5ZRumLFwvT
	rT8Tb
X-Gm-Gg: ASbGncuJmYeZX2tPNems4Uy1DT9mJwzvtVqFISTZbk2I7+d6XRSpyk3QHwb6AsT7AY8
	L/MH3LKb+ypkS9GrnidCCaBEBRIxXEt25nP7EoURz7Vtjop3TzJpjFewMKPcmtOfUbVa5ygdK99
	s2HOHolky/5V5Bs2ZIyEeQQBrSti4Bu1ioHDy+c1Y5G/zaKzMbvN3933WDg+4QHOjioZeqAVAbX
	GaXbXDwcv/Rwb8LiwO9x81f0aL0IvYMRkAQgqZc10fHN/ktbfekUdRV0afzH0K+LrPDsaGjUup0
	wfkJ/owqnEwysT+HhXddmvWHDnpGh9Lg8QaT7h6NDGxjuzb15vCGQ/y4Pn3izdOgJ4Iyv8JngEP
	Dhy0weOnMnQ5fMbqs/RBMfcIrIdNSzg7EgdQHEUQBjKlqZ9LFdPdUVcn/I235omZXjuJy2Dsu62
	l3LA==
X-Google-Smtp-Source: AGHT+IEh/bWsHUjoOariR2V8TFO96fWfpxOZDaiVpLQZxlNjTTKvAPgNTUSjyaYhz6P4xg2rtuQ7wg==
X-Received: by 2002:a05:6000:2f82:b0:3ee:1368:a8e9 with SMTP id ffacd0b85a97d-42557807da2mr1446611f8f.17.1759303406666;
        Wed, 01 Oct 2025 00:23:26 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e619b8507sm25805335e9.3.2025.10.01.00.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 00:23:26 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 David Airlie <airlied@gmail.com>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, 
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
In-Reply-To: <20250904200130.168263-1-marek.vasut+renesas@mailbox.org>
References: <20250904200130.168263-1-marek.vasut+renesas@mailbox.org>
Subject: Re: [PATCH] dt-bindings: ili9881c: Allow port subnode
Message-Id: <175930340588.467410.15494942585777462922.b4-ty@linaro.org>
Date: Wed, 01 Oct 2025 09:23:25 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

Hi,

On Thu, 04 Sep 2025 22:01:08 +0200, Marek Vasut wrote:
> The ILI9881C is a DSI panel, which can be tied to a DSI controller
> using OF graph port/endpoint. Allow the port subnode in the binding.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] dt-bindings: ili9881c: Allow port subnode
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/3684218949703ea8779aec7c3ed598a05ccb2b23

-- 
Neil


