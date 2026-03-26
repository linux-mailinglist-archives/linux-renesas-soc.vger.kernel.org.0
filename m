Return-Path: <linux-renesas-soc+bounces-30315-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFNyKIX4xGmC5QQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30315-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 10:12:37 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B148332020
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 10:12:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A69E830F830D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 09:03:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D37B3BD259;
	Thu, 26 Mar 2026 09:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b6jLtqur"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6BC3BB9F9
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 09:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774515761; cv=none; b=drokLXcu8zEAMUaP6Vkuqh+NrEdOcSk4m4g5caVaR2Hf9oy7F6HpJ0KjX79fiP+9ojIjeMgBrwCwjSx0JTcsuudH9y7DJwnFMT1qh08MaFIVqhuLqmo62j5CDJPwsw1ztD1NiTXcTwxHCmbMass6XgQPoaXGPy/4cL7VU+Bd0Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774515761; c=relaxed/simple;
	bh=807Ne1Y9uBnLW+q48+Lb85aSjXQzwhaHaQlGx3XMnWE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Zii+pfNPKsKywXwWQApRBtjVsqnkVRJzqTphT7Qf/uzgJy3lPpl4Zt+xsZZ/J4qNtu3TO3n0+1PEGNIL/P0pGuSuDJxzAHw0iGODBCgXaqbBb5kfsUUqnAJnXRGxwaAv2L8pEDJUifzQO3gF8yqJMhHw4BiSmwOri7YldwX2Ul0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b6jLtqur; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-487035181a7so4290805e9.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 02:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774515758; x=1775120558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hREPPe0C3+Lmwx2tkDyEQDqCZUnz8ZDMuws56ODjtSM=;
        b=b6jLtqursYuQabYuJHgWSYfbIUGun8CzrEHYUuZF6tiVqlZ/H3irOSd4Pzao3cUx0y
         68b8wWUZfup2f9fJsF067fYoVm1OXdpq4ygHHI0EWNh4OMRZFEV/oKVy/UdYlWl5ISF9
         FqEQGwV38heYaRJ0gK30a7W4C6OJKYig/IgiCGErG7/YAl77yHDbs8fHIBDFjgo9QZ8+
         y6P8qk0qAFRfihFwKibpjC7GEA0jSB1fBPnTulB8t2JPNxEZqkcU4QSH4EUxGUYYBLp4
         SYmEJPU3RkPapnB6fiz1h7UCdThZyKg7MVvYZhjGQxB0Q2rL8JVRIYHAW1TQ2pYTBzqY
         2w4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774515758; x=1775120558;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hREPPe0C3+Lmwx2tkDyEQDqCZUnz8ZDMuws56ODjtSM=;
        b=C5WOvCLIpRIWZZTmgRuzz9g4ScnSDmF5nDrMN78GQa9i/ZOc+OoGEltxjlleiUTCqC
         kQNp+WL1kXoJxrCXdFQwvMvNKfpC1jshLZDhDWVXMcOllhwZ2UXLm3aQ7s3s3ocZwd9D
         IJS05BlOgZcwbUNax+TuVQE8agI/Zjtc7cgx0kSFwO4nahz/gfd0g3cHGR9Cq/OGMBHh
         3kl2lg0siSpV98fi9c3qU6DisRXbMMBg6FWe6wB1yQ4eCi1K20xgqcjj5qKKOJwKquAo
         B62Ug0icMhFIxiP44ZH7OLrH3hYXDKt6cKEITgTcMfXq2VokvA/KD7+AHdALxMdAf5v3
         oRzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSrTGc4QQ/XPejARierrM8pYCsa8kgqm9lxffHNTmNlpLVv5twZqmplcZxTJ7wBkuZgY3s/u94wJzK6WNCB3DwVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyL/pbOqYOdqztftFciaOTvYgIcd4M8f0sFU1zLO4NDqImuuEFV
	fq4/5IazXuQrRHdWJ/GITcDl9KkgttzWafb4I1wmIAla5OQ51DG+Vri5xqxNlz9tVR4=
X-Gm-Gg: ATEYQzxFb/K+wYd3ZAVYED/1/q1E0sgHlR/BZhYrdyIeH6A4Y0qKUe1dsUZM0+iDvd7
	+9e619BqbEE1o051dyfSaul2wr7QGODzvb5v9YsyVhWO/bA6ohe3tcJxqkG0jO/wEHxZn8X8lez
	ep9SciWNK6C7gfCaElf2yGuwySQCx+vzxEdvL7FLSFv/SqHQ3Ln0VHY1SwjnRu6XWxY6YyH0Vhi
	AdszfoDJ/mYOkAnEoBaM8aKfDC0rvLG9co8suhwA07YijT0rt2TJyBQKIM2CGjFlyRz+cdu3iwe
	GWTUnRFZXryiT3ueINvioaK679n+WzaP3cctl1QDvudwRhJsLnPGmjUmnAIAu2iH+mVcr8QZW82
	Pfaz/ARjIoCHQ/Oxj1+0QVbKXuR/eDmc3Na7yrWnyRJPZOR1oJ28jRK+yRO/rqOcKbrrqR31HiG
	ufcV39LLscL4SFuOb6EpdLkdZ+1u53TMb9eVLzAkypbW9k
X-Received: by 2002:a05:600c:630d:b0:485:3586:1e28 with SMTP id 5b1f17b1804b1-48716034eb4mr98838765e9.18.1774515758363;
        Thu, 26 Mar 2026 02:02:38 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf069sm6213436f8f.22.2026.03.26.02.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 02:02:38 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Artur Weber <aweber.kernel@gmail.com>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dzmitry Sankouski <dsankouski@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ti.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
In-Reply-To: <20260313-dt-bindings-display-panel-clean-v2-1-d49615218f92@oss.qualcomm.com>
References: <20260313-dt-bindings-display-panel-clean-v2-1-d49615218f92@oss.qualcomm.com>
Subject: Re: [PATCH v2] dt-bindings: display: panel: Align style of "true"
 properties
Message-Id: <177451575750.103892.1923752988731034667.b4-ty@linaro.org>
Date: Thu, 26 Mar 2026 10:02:37 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30315-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,ti.com,ideasonboard.com,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Queue-Id: 2B148332020
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Fri, 13 Mar 2026 09:20:54 +0100, Krzysztof Kozlowski wrote:
> For code readability, several bindings which list allowed properties
> with ": true" syntax group them in one place, without line breaks
> between each.  Align a few bindings to match this style.  No functional
> impact.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] dt-bindings: display: panel: Align style of "true" properties
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/a00e773b4a5ce23dd831044283e134466e3f337a

-- 
Neil


