Return-Path: <linux-renesas-soc+bounces-34675-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ifSyGiZ3R2qpYgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34675-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Jul 2026 10:47:34 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C79D070040A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Jul 2026 10:47:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=rbapasu7;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34675-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34675-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E722D3014752
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jul 2026 08:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C0B13783D8;
	Fri,  3 Jul 2026 08:42:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4792C377561
	for <linux-renesas-soc@vger.kernel.org>; Fri,  3 Jul 2026 08:42:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783068142; cv=none; b=tfstmXi2TwStvqeVrpXfR1of24MZ/M9EarHmJatuEf9xaQmd1/pI6AP0m4VxAvr84MCDvOr6Vv31mgRyXrHe1Xpjr4yJjVbfl9Uta9mONYkR41WHMlhhyA3+LU1nRsZ8oFclXVjZKAV6Shszs2mOpyTmV/kkfBhVsizZklm6Pew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783068142; c=relaxed/simple;
	bh=CPQH7kRssQrcsM20UNrYb5b4f9/R0lm4FD17MeIgbQc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Vj90v/AEBU1RjUUCEUMqkkOQYu0TJ+oPNl9Zv62f8LPnUDOQwy5mE9AiW06UtBXGZ71hfm/yB0+zEbap3rsuyFKcQb9u7ofbI3bQx0F2sE46+6NmT/42HP8Tkwqvs2fxvhz9CV8QO41WhPn7gqY/AHu4fm4OKYMXZMcI5BtSfxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rbapasu7; arc=none smtp.client-ip=209.85.128.48
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493b6f1b14bso1256925e9.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 Jul 2026 01:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783068138; x=1783672938; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qzE4az3Z2WN02We+LgBV5AAaD12sTfY4548Cc+lL6Cg=;
        b=rbapasu7F5n/Wguwh4QvPdLNGQuCwKi1un6343sP6PEd3NfEL4ppzYQvR7xo3cXDLC
         +mdN/o7WoB6vUnt24xjY86w57aWoSTqLlwNV57qGwfPdkTyF/I0R/CdB0/inKRkeJYq0
         1SmWll3w8+ns6UkZREoxJ+bnA4+9V9etjhRrN41iLNfN7Cn8R2L6/lq7NhTc59wZyeBB
         uKXBJ+OTJjAucICOdZOvNQwbhaq43VlsCUq1Jyp0K7Xq9oUzqURLl+Nvqm50ZsHtxz47
         3mnO2zz2B0/kBbzyN62OCTc0hTipsbneRoxIA3WoYssFQgZDjBrowkh2iKzkV+mMoEM8
         7vOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783068138; x=1783672938;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qzE4az3Z2WN02We+LgBV5AAaD12sTfY4548Cc+lL6Cg=;
        b=oX6DCGSli4JTXdfUlg9CWeg4mWk2A858fYimWVRljnzfdSYo9r/kTfOXN/0l2Xdkkl
         tDZPdAmh1U6eOcEWGSCGMlWoeYXEWEIVpBZ4s+ZxR2Fj5gqhHfuBA/uhU8CfBKiacDRE
         vTtMfV0iDROH+/qVuwA+AMqTKSmjMfOF4TPsNtZZAmVs39mN8WKz++wvfjdo/+pSjPzd
         TKXbiRg9pkQD49N1JomiLANo3Wfg139hapMJPDWMmni/2UvPzMTIEx8pwPKWLKghyg+n
         k4HTk4UZ33jj993hijMfWHecBJHZvlroh/7QGhBfwQ7nY+aLhCcRkGqsFiaqRp6lmojP
         axhg==
X-Forwarded-Encrypted: i=1; AFNElJ/uFsiYpPhVFjs6hgwn2EJfHlANYQuDdv59CbxN0ZDSQx2j/Axnfmc7knpsBxSifPdK5Pjz3qj/jQowwclv0d0hSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcUaOBT7X1vs7iHR+/92YrwL/f5xHOvYuWhILNS9hwIeN1gfV4
	mMXpFBO5AAk0H+rIXvuHVja1GPyYKYgc/RdO8wi/p38HiXn0YVzySItJWiVezmCYB5w=
X-Gm-Gg: AfdE7cmsGwYN0qeONt2DttSk1fKS3OZlRzCReAfnrrPZeqFaYaGWI8KCnd9x1nRe2BN
	qKMWATLgb+49H42dPxmdGXiYViI9NnV8TOAftg4o1GMgzWA0IymIO/ZTv9RTMvXzIFwhIVy3MMJ
	SBUwYo9VXWetABVI+7l/rC9CaniavGHhjzHTYqgn5U/SxfUDRa3JKLGNdgjGhxSgt/tPhbTEPNx
	LvEnXdvI55iRuOx8TEoZUMRywOqWFqdIN3xysXWTakEFCULjqQSTWeYE3VpFPTs+8RVPEnuxHr2
	DUn+F9j5sH8GHZW9zVRNP27OxGe5SF2jxYE+/S/27qhWawsNybVOEKFnFcqFTC/S64nQbNg1cKr
	oVHIFAjWYjyCRgnmlSgQM5tJZTX/qwo8wd1o0MDe2W1xWFTpGTy+ibMQ0C+UWEqQkPH0vc9ds3c
	fwElWbwaDTjyyRzh58GEGGtbcdLbQ49N+MzJy1jiyhJnNV
X-Received: by 2002:a05:600c:574b:b0:493:bc4a:9547 with SMTP id 5b1f17b1804b1-493c2ba70e2mr88243805e9.39.1783068138062;
        Fri, 03 Jul 2026 01:42:18 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccdab27dsm30001575e9.4.2026.07.03.01.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:42:17 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 KancyJoe <kancy2333@outlook.com>
In-Reply-To: <20260430-topic-sm8650-ayaneo-pocket-s2-r63419-v2-0-91ac10453d0c@linaro.org>
References: <20260430-topic-sm8650-ayaneo-pocket-s2-r63419-v2-0-91ac10453d0c@linaro.org>
Subject: Re: [PATCH v2 0/2] drm: panel: support the R63419 based dual-DSI
 video mode Display Panels
Message-Id: <178306813662.3165305.810596884490699694.b4-ty@b4>
Date: Fri, 03 Jul 2026 10:42:16 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34675-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:neil.armstrong@linaro.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:kancy2333@outlook.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,glider.be,linaro.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,outlook.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C79D070040A

Hi,

On Thu, 30 Apr 2026 14:22:16 +0200, Neil Armstrong wrote:
> Add support for the Renesas 63419 based dual-DSI video mode
> Display Panels found in the Ayaneo gaming handled devices.

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: regulator: document the Renesas R63419 based dual-DSI video mode Display Panels
      (no commit info)
[2/2] drm: panel: add support for the Renesas R63419 based dual-DSI video mode Display Panels
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/1190fc8d7b8a9cebea8dcbd2e544e43990ae81d0

-- 
Neil


