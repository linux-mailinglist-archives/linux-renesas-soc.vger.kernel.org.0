Return-Path: <linux-renesas-soc+bounces-22495-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B961CBAF5DD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Oct 2025 09:14:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A33D3C77E3
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Oct 2025 07:14:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CCD026A1CF;
	Wed,  1 Oct 2025 07:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e5vJaUba"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A13926B75C
	for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Oct 2025 07:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759302876; cv=none; b=pe8XRBH5DeDysRSpRc2LWBEOpIUF9C5copE0idLl8nZcxIs4pEH6nSp6TFr4JjH2tWngCxaaV8QxiVr87ZfGzLVepQKK8Fwpo46rnkBeKYDCvcZ9t6yEhZmpnxX+1smZR/TXn3rP15/FIHcreWfSBvxmE5rwYRDCLtFj5fRGKYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759302876; c=relaxed/simple;
	bh=SOSNthDQ8EtFJ9H2g60zSiqKEmfmR4BHtXlNS/cnOZk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Hn90HsCeSf3hMFLBDE4Sa/I0Cblq+f8n70/vged83VlA3jNKB1Kb0QaE8PmIRNC0C5ybv4dMaHokZS2VdKREDy9MgOomDTpy9PxwK1Oh3aBjVps54tMlxZZbsxtqoTQLc05HdPk1QHzRRWiNI1qn85tN+o5orjmdtWZnHGq6x/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e5vJaUba; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-46e542196c7so3468065e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Oct 2025 00:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759302874; x=1759907674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CnrCm82N9RDCdUhU0ThMIOx/wxR6eW+Zxx59nq/+ZhU=;
        b=e5vJaUbaPgta33RBv8FZVGL/kr6mZ1E5raUchujAHoD+UNXYZOnaJgUqVzwYRNQZGm
         OoBzegBxW+qFCNpw+PmEtNdFzHxO/H3AkL7VvWfU4e5dT2zbEBncQlt3i6JjgcE4P23f
         UYn0JrMgex4YNCFVWugjX5uXEtNK61Jmdu5WCj9B0Cnt3RE0//aud13gxudVhj8yYheA
         6CKua/ExpbBbINEH48NhHrUgz4oBykPUXxcPW6z3w1Y+8RUlPZxOWw3D8dawVxfLGKaf
         LZpeIa0zbml/s7q14vplPf6tp6jwxhujFs8bCyalZZgC9P9WE9GfRSaf+o7lD1vNLKm7
         ykfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759302874; x=1759907674;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CnrCm82N9RDCdUhU0ThMIOx/wxR6eW+Zxx59nq/+ZhU=;
        b=KQp+Np4NNea+rwKO4sLfiA7T1imIUcV9bQwX0wwHWL8A9JtrX7GQgBTnHc9c7y0zyC
         f6+xVUp/92RDQgvBjLsfnr9Ub3ewHwBW37TyGu4d6Z87V1t1SMQX5RrRfgjxPk3pWeFM
         8GeUjass1EjRdBKQdzneYS3CnjkNZgkDkIA+CemNCtMV/ZOzOQuXnNf0MhKCUD9rEjK9
         vmND6lYmMtNAcnUKFh3z2ihTAhxzFI4qwlFRb8xEIXf2ApOgSVE4WwXBA4S04WFLDQrW
         9mOy4B9sbfLNEBgPuY1HQr6gYo2U/vehw6BMNVfP18dOyNUTjsdw+cBB5KgLGAO45z0j
         HLlQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9N2iT+prwG9Oy7VBBWNQV9+PgvmOC1dl4ECBvQYSn3hd4QyBOROvTgIqFeUQxmNLF6pxWt253bjQvLlAlQw2YPw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXFCT9NPce8lo4YgNXrovU3L+wxqbPNTJ7ciAttgL7zZWOAWJS
	vxwu25yuRVwnSWjKM2wmJRFiz4WCUvcASj6siKn/MJCNk3p8tXbh1L4upGOl6tm3enk=
X-Gm-Gg: ASbGnculohl9zelf01kE284ks83DxhcphGinQXYYm2jmL0ifp6VNVF5dIk9jUJHnzMZ
	u2+5NmfmX1kWj3XYI7yBFQ52sCavNbukR9j/JXYRGw9iHLOmTPj75G8oETmN1bLqjntsXjUTk7Y
	V8OQv6LjG53Rl0q6kCCc8tV9N6BCiVs4ZD7lP61mP7YvePayBVMPOk3vDopHL2IquDY4LnUJNDK
	eXETKoQEka3ZxIqwyjIlSETvjoRuXVmt+Rw7zIQRViDKQV3UOimW8Ur05XhXIAhe93qzsTj3BEJ
	lKU+BuAvMJpo6TZpFBo9PMK6jcsLrJMQ/srY6Pn2uTBvJS2UoGM29rLBLXZ8Dx3GUWFaChhZ8Te
	ZthofvTovb+sfq1i3JFnbRZagvbo/0EtdoTTCn2IbCU/cmTW1DrOq6++HUjprRLifnjI=
X-Google-Smtp-Source: AGHT+IEPMG4C8VjwA3pQsA24NLtsLy61u5i8hAOBeHwnCJP8qh3051WTzyVCw5X1oRCuGh22oxkRXA==
X-Received: by 2002:a05:600c:c117:b0:46e:6339:79c5 with SMTP id 5b1f17b1804b1-46e63397a8bmr7307155e9.5.1759302873435;
        Wed, 01 Oct 2025 00:14:33 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e619b7e37sm25185825e9.1.2025.10.01.00.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 00:14:33 -0700 (PDT)
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
In-Reply-To: <20250904205743.186177-1-marek.vasut+renesas@mailbox.org>
References: <20250904205743.186177-1-marek.vasut+renesas@mailbox.org>
Subject: Re: (subset) [PATCH v2 1/2] dt-bindings: ili9881c: Document 5"
 Raspberry Pi 720x1280
Message-Id: <175930287261.425863.7680841770624369049.b4-ty@linaro.org>
Date: Wed, 01 Oct 2025 09:14:32 +0200
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

On Thu, 04 Sep 2025 22:56:56 +0200, Marek Vasut wrote:
> Document the 5" Raspberry Pi 720x1280 DSI panel based on ili9881.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: ili9881c: Document 5" Raspberry Pi 720x1280
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/86769c7df4ce2f58ebe67c08aae3f52090727f7c
[2/2] drm/panel: ilitek-ili9881c: Add configuration for 5" Raspberry Pi 720x1280
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/97f0d2ed0c6849e24c43a1836ab5ac122f80fe9d

-- 
Neil


