Return-Path: <linux-renesas-soc+bounces-29132-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELpPDlknsGnOggIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29132-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 15:14:49 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F3E25194F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 15:14:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2710B31BA587
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 13:35:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54C543A7586;
	Tue, 10 Mar 2026 13:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WvDkeIrD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D694A3A3E79
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Mar 2026 13:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773149341; cv=none; b=CZ/p8Ps0mVZ0vfgni9iA56TDEMuAdLANjZmGbmSnJx/WQQgBI0Js2z4r7YG3ZG/a5oE6N56tENLQsIJRRGteVGtW9sOLZ7hYIAS/m7NcE7R0uExK748SyQE+vkGU7BWVPKJH0/G+eOAhua6x/4Q7nD1AuY5c0SfQr+cN/OX5WOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773149341; c=relaxed/simple;
	bh=6Tb5t5+6NDpxdiEu98m8sY56pjpprXnrLEy0xaqkhK8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=c+TdxpILPtG1V8Eb5boVZQBuxjNrB04dL53+aKyoFKOlBp+opg5qZ9o4dj2o2++wJgRwzmp81EihKEdk4+KPCW8J8KdRN6UedxvZWXaa/1nQvzx3optRugXnuExE8050gM7yTbUjU++LNhH21+TSeUNf5Ye117ZkZvmkuaITHPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WvDkeIrD; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-485409ab264so10636085e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Mar 2026 06:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773149338; x=1773754138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZdclR5/dW9BcnEJOWDWjbzumi2dZWqG25qJztzjz6xg=;
        b=WvDkeIrDPYXlgVwfeCZT8N55ciisjCsusFcgpCvgm0vA7V/WBhQhvgern4mzH7ugQs
         YVwVeZ8PVMMwjG99yzkWnXHdCWD5rTC0Rb+TiCTT06imEpJAELGhaqbHnTdrC4xgiFzd
         ArBReNgcUzpORAJ2MgP7mRCskjrSh/DMnrdi/5y74oJBZocQcUml1DZo6vel+/gz3Lq3
         3kjrqI8YMW2VJho0ggpoRCIesKtkuU6jBQ/1YYUCxdEEqffpZAZMedUtrGvTzfOQkHtG
         5vR5KEwfCmg9ZYPQpf/RVnewbSoyXqZ0czhvVyIMlxmPFgIy+aC3KuhuL4F+wfS4OYdE
         x04w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773149338; x=1773754138;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZdclR5/dW9BcnEJOWDWjbzumi2dZWqG25qJztzjz6xg=;
        b=c0ocduz93SF1Y12vMVax4MvrI5HoUsi46b3h9P7nsvSBU9QEPr3llgLwZQsyNHDj2z
         PTRWuwIstZqj7n3T022+qVJB5BD1OFByM47+Nubn8ZOmEQeghlCTKWYn8HxA4NpFAWx4
         qqbE88GFn/P/20EC6dw6rIK6Uniw69eI0UolS98ci3OLBgsZRgJN785siQc8ai6WTjG7
         V1T8EREq3RO3tVzAoI+O9hoGX3rlN54o5atH6g5gIwj9Zz+I7R5f09H1IrIW7UyuPwzq
         NGhJtXSd3iPU4cYx36rGzvMYW1K1Ja+p2+DoYKGmU2fFwld3K89fLtqi85E5VI1e/dTT
         AyhQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4Z5UnVM4EZA5CcQD3oIfUCSeIFjr93mVB/Alf02BgN8YDeSrbHl6GS5XWdYwKGwGFIKwqQfsS8oKrJT9lWG14CA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzqY3vx9ZZEyBp3FMifNvL42f/PfUQBsmSPlUMXpDj9W4ixqSf
	OAgCOaODnxEJ7m+KiaMEVqezFNspPhoCarb3kvpOSVdun8RnC6atG2DDzHxGWIfipRc=
X-Gm-Gg: ATEYQzyvz93c6WMRJelWvBa61fmqVCSjP7cs57YjQgfPtF/q6SleLF4NDsJmLL0LHoz
	CmLQ8rT94CY9LU54ShIJ07GCofONvlLkkC64B2pTmeDgo657pfB8ZUkbAUD9mZNWRf5ft3U+B+L
	NA/NGC5Ejkp3qNv5BSJvNG3tc9/ijsw5Bd5ggAVXLsZml+oLMCjSvv1CpdJtrokWlMtjZzo6OCz
	gbJN2+fgSxeSlSLXYBkiMws0/stCgViK61oEFFJbLmH3wTVgOkYzPw8hQFL9yyPB+1A38LdLhck
	7Vv9RSTGtRhkopiEyPtB1tnhhvXRNfoTaotTy2wUGku4tQpPoqdztfIAH8Em1zmtuT0EZUn036q
	DQdR1gXz8COSifP3NwLhoToALDqXjnLpZ9PlkyArDOf18tO48px6UcmZirHCC8OSiXaW6OQZkC7
	vZmc196YrMdczFwI3wHwxRzKnh7bmoC4glOdcsU8pJQfff
X-Received: by 2002:a05:600c:628b:b0:485:3cef:d6ea with SMTP id 5b1f17b1804b1-48541a0d032mr50216185e9.13.1773149338097;
        Tue, 10 Mar 2026 06:28:58 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b6f6e6sm132464235e9.10.2026.03.10.06.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 06:28:57 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
 Rob Herring <robh@kernel.org>, Sam Ravnborg <sam@ravnborg.org>, 
 Simona Vetter <simona@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
In-Reply-To: <20260117005028.126361-1-marek.vasut+renesas@mailbox.org>
References: <20260117005028.126361-1-marek.vasut+renesas@mailbox.org>
Subject: Re: [PATCH v3 1/2] drm/panel: simple: Add Waveshare 13.3" panel
 support
Message-Id: <177314933738.2052605.13727235590702845592.b4-ty@linaro.org>
Date: Tue, 10 Mar 2026 14:28:57 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: A0F3E25194F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,glider.be,linux.intel.com,ravnborg.org,ffwll.ch,suse.de,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-29132-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linaro.org:dkim,linaro.org:mid,gitlab.freedesktop.org:url]
X-Rspamd-Action: no action

Hi,

On Sat, 17 Jan 2026 01:49:48 +0100, Marek Vasut wrote:
> Add WaveShare 13.3inch 1920x1080 DSI Capacitive Touch Display support.
> 
> While the panel is described as DPI panel, it is part of a larger unit
> in non-removable metal casing, so the actual internal configuration is
> not known. The panel is attached to "waveshare,dsi2dpi" bridge via DT.
> It is likely that internally, this panel is an LVDS panel, connected to
> ICN6211 DSI-to-DPI bridge and then another unknown DPI-to-LVDS bridge.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] drm/panel: simple: Add Waveshare 13.3" panel support
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/46be11b678e0a9a5deaf132cb21afd1259e32d6e
[2/2] arm64: dts: renesas: sparrow-hawk: Add overlay for WaveShare Display 13.3"
      (no commit info)

-- 
Neil


