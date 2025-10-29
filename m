Return-Path: <linux-renesas-soc+bounces-23888-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEFCC1D5CE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 22:07:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CCCBB4E3706
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 21:06:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72B90319859;
	Wed, 29 Oct 2025 21:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M9s/o95e"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF863176EE
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 21:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761771943; cv=none; b=Ki/wzbwFuFP5kgLDWsIJBBd1V7ZTs7KOOtpm9wOYH3EoYu0BNc9cW193Dtx8hp2gGZXlLM3xhRWVhEcb99a59jxtSWT+FElClbODQx1El15+B9nr0j2lVZGrzkNczHUijoKZ7nU2sXRMbKWq1u9iDNW5qYNSL28Qxw0eiGZxh4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761771943; c=relaxed/simple;
	bh=8iIOGkEFW1qaDegyO15xpvKqYCrTt/4At+UcpwC4JVs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RKB05mUuf7l126Q6Bx8FDwVrSU/laY3mwqw31UQUpYJ8YWeSzXzfvbU2AG48vfpdQDWb+nCuuwjhiiCpdEzUlcf1Vr9axXipHOSMzjYsMNZ8Hz+MYBlj79CN7ykbraIxVvKIJIAskPRuP6sjha5l00CjfNhLUJ7HHvw8b1xVFaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M9s/o95e; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4298a028de6so1003476f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 14:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761771940; x=1762376740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dp/uSNyKeZVNzX/sxeqr4hGjK3rcULOo3zDuh2qi5pU=;
        b=M9s/o95el01lV3G8wcs053nsZitf3QxBL0EzOWf99SZcJFLPco5wV/LVaWrdbvKGv/
         WN5HeFZIOFli+wpnkGKXO0d8r+R57Jtp3k0Z4ec/zOwqCLhsr3ye7LB+bPvPfXNZ7Aqk
         /S55vXjt7PsZxzS2wpWHz0bH0mLTe49jfLUMSU8OoZXUVAeb/8LEPzY/VtWkjmgQ1lVo
         W428Ku9mt1dQzdMr1coSKX4VVkkyjHk320PL89hTGxqffkRK3Zt1jBKp95/1vgkZCxUp
         ftbthQXEy0NJkD3TD80WXc32uy9pdowuTzpRrXGIvXboso6ApnywF7L35StKTVgrkPrg
         kDEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761771940; x=1762376740;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dp/uSNyKeZVNzX/sxeqr4hGjK3rcULOo3zDuh2qi5pU=;
        b=BxFB9aJ8rjL/OUNNR8C1n+7M4m4rkESHXAN2hy+w3M8Dv5aO41TB3PQwwmNnAH6Y04
         RlzIYojlaX7JSvnBOPvNVPCkUA1zeD4r/OUueAbyIe22d1OJJXM2GYk8o84FFURZsBXC
         ypK8csg6iR+IZoWH7S+e4ZK+NoDjeQ46Lf4wQVafkTmxsbj9tnnVWCQYekwAUvGJ3+M2
         CFjmfXp5i3AlephVunTRkeUMA+xK23wG++wePTSFTFF4pJw8Ww3i0VNO5N6skyCey9l5
         NT5D940FujPy2Zdh8dKbAbHOVyo+BbzhUNCDjOTDuRcxPiq/QKic5reeTRgpNJj0bz7W
         DTMA==
X-Forwarded-Encrypted: i=1; AJvYcCWgMJESxFnkl0OywmZsSrofB056ZYCWxhx0nyGXwAlCoYcZu3Z0u5+ZanihOSTr3JqOvwC82pg73nduPuRmwE4Ojg==@vger.kernel.org
X-Gm-Message-State: AOJu0YysZHzjgn2O2Zmfh57hh0zcHLWHd6HnoCQen4eFiJD5qlZfbl/M
	y8/zHPMatgOHHgEDWXira9K+LH++KlsZo/WEO5rmrQI6jMnEFXuNBaWGQiVQS25a6Z0=
X-Gm-Gg: ASbGncvDNmrs3M2NgNm/pkf6I2rbksvqVZBllYRtk1i+xQTGh0ZEjTx3yFkNO/T2KU6
	1idEuY8/mEwbUMSbYD250lAEjh4SZotbDrGwfTz5zmAOe1SGxHnnljg1yQpsdv9hThlxA6qRCli
	AcZV0pGrlF3c598h15CEjjxFBbsQ7yorLrxWHWjE0ddNCI007ivXwbCbkdo2k9V3Giw1DhMorAt
	HGwbxJfr0vaxRlZYOKLuPG/Hf3LCFov6dfJwoATyr6ANoEK70uVCPysH56DrdPxN19We+oUdMKv
	JOGo+p9jfQwZco1MFOBLUzRTGnz5yTcsuOPrudeu5WqViBb6bpEK8T52PuhqJl6A81CHy0Kn08D
	6PTZ7nxE2Gd+P4njEiBxDFz7xL9LokcybH4rCrRlqxOncbd4jsoC9aiUNdmpMgO5ZSK+WxbteRj
	0QhN3QJPAeXn8nZYhTUnnI
X-Google-Smtp-Source: AGHT+IHHUJuep9vUZ0J1lsKWcApbeF6pJYJ0OqFJ1EzP3xpMcStMDlbBzS8uE2XDGHUoQdaeRIr5og==
X-Received: by 2002:a05:6000:402b:b0:3d3:b30:4cf2 with SMTP id ffacd0b85a97d-429b4c4bf46mr877008f8f.19.1761771939864;
        Wed, 29 Oct 2025 14:05:39 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952de971sm27815109f8f.39.2025.10.29.14.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 14:05:39 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: devicetree@vger.kernel.org, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>, 
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org
In-Reply-To: <20251029200519.214548-1-marek.vasut+renesas@mailbox.org>
References: <20251029200519.214548-1-marek.vasut+renesas@mailbox.org>
Subject: Re: [PATCH] dt-bindings: display: bridge: renesas,dsi-csi2-tx:
 Align panel example with ili9881c binding
Message-Id: <176177193908.2073083.2063773161714746895.b4-ty@linaro.org>
Date: Wed, 29 Oct 2025 22:05:39 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3

Hi,

On Wed, 29 Oct 2025 21:04:48 +0100, Marek Vasut wrote:
> Update the panel example in this DT schema to match requirements in binding
> display/panel/ilitek,ili9881c.yaml . This fixes the following schema check
> warnings:
> 
> "
> /tmp/dtx/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.example.dtb: panel@0 (raspberrypi,dsi-7inch): compatible: ['raspberrypi,dsi-7inch'] is too short
>         from schema $id: http://devicetree.org/schemas/display/panel/ilitek,ili9881c.yaml
> /tmp/dtx/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.example.dtb: panel@0 (raspberrypi,dsi-7inch): 'power-supply' is a required property
>         from schema $id: http://devicetree.org/schemas/display/panel/ilitek,ili9881c.yaml
> "
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] dt-bindings: display: bridge: renesas,dsi-csi2-tx: Align panel example with ili9881c binding
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/cf4ec6212f3ab705b05de0519ae7acb55061fb31

-- 
Neil


