Return-Path: <linux-renesas-soc+bounces-34678-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id a7l1Bhp5R2phYwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34678-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Jul 2026 10:55:54 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 203F7700557
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Jul 2026 10:55:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=MpmmgJRH;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34678-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34678-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8787F3084D57
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jul 2026 08:42:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77509379C2E;
	Fri,  3 Jul 2026 08:42:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C961378D6B
	for <linux-renesas-soc@vger.kernel.org>; Fri,  3 Jul 2026 08:42:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783068147; cv=none; b=ptOENu0DO2AFnatSTAeCDdkuzkcG7ZGkFhHskET/zhCru9VnILdcKPve9CwYYLKhDm1j/L1pEyBg8vIKMpaVphk05KZgsxjQysNB+PfEVtb5uzExiCj/GeDULVptTWrs+3EQOXFK3IshbKxURNJJVM0fLBIzcZ7g4SQb8+zP75o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783068147; c=relaxed/simple;
	bh=6NeXfTk2TuTHIcLkZnXM6fT9nU7cgAhHXMrsjr44GZQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dnTE9n7jepmpTllPk4nlmwJ/TLQWNQyejq88R53/ln50DDNkdbluKnoEyjgvBsTMlOWBMK/VyNj3x6ND6z0JQu28xmhQL5hZa9WbZlA9xUnoypft5Lai5LEcjQV6BI/BYqsYl82hkg5dbCI8cu7/J+4ysxJ5q83SgtNI5QDVrHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MpmmgJRH; arc=none smtp.client-ip=209.85.128.46
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49241dbf9c1so2410465e9.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 Jul 2026 01:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783068142; x=1783672942; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d5y/LlnctUnWczLr55nRli7oZ/AlDp7FE9PGkSlaB9s=;
        b=MpmmgJRHXRSs6annUZ+qrMFEsQMEEWEq3TYbAudDBNjanaZRSRlGS/u1Vevk5v0LVI
         z/L28PBGilT4oOtpm3V+s10zIPBIwFZJUAd4Nf5LohBB7Ud6aQ/pv+CU65p3QIGNbkth
         WAkiCXbrIpF2tRvPiENxlyA8CmfgwFvSpt0yXWbN5F03h6XWWg6BX9r8sdKdq3KlWa7g
         fQ3kZyHVCVDJS3HGtjRS/moYx+PZfR6WAwke6ktq59OABpYocfozYP/rCXbKLdI/tztY
         tKgU9JtthqLYHTPLipwB5SAsL8pgfhpMvHMQrleEpKOE/EOLIqd4who63BU59JiOZMgi
         7d8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783068142; x=1783672942;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d5y/LlnctUnWczLr55nRli7oZ/AlDp7FE9PGkSlaB9s=;
        b=Op24BuQhnOx2eoMSOwEPY4MXOVMyolJsvgQCbZRLUwbSjlgUKqTHPWAa6EkS4XS96w
         KySS8QT2yhETe5mTEYyDgUBpzY8lcsZafHZFokNHgA/MnRM+1Ed9IoEZBn00V2ju8AaW
         RxLXQQaY9JglDtULBdwwhPpcqenbTnOLiG63mUWGMIb18IssiA3Wns33x1Ubs8L/WS5N
         NJPnFca8S9FjaoBwUw1jbq1dOM9oLk0gZ5xgzVO7Okj5fRrIP0wEk90xlCqiiDwBZwcd
         MWCCfDrnmRf2mnAMvCKENL5BeCwSDw6NrhYS0Ue71D5v9Nt3CrQNYnvnfiAsXP8DIpfq
         OrgA==
X-Forwarded-Encrypted: i=1; AFNElJ/YILtK7GjA7Q8dtglZ3uqhiFzqzHmHC/DDOpyf8UEjV7SJURqW8zjlwGJDpWpnElbaX0Dhi+4tGrvysPG4KmRKFw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywlfr+74VFt5CDnUrKf8wAhhY6XEyz/lphSffemIvKf7ejTIVBL
	4UA7nwmAa4h4p8Spe6wjBO6PAyE6BXtJ4nhRQ+1+zFMZe26hJUwH5QKD9DZT4uofqf0=
X-Gm-Gg: AfdE7clx4ktcBgWgtKZwFQfbhXF/F7wrQWV/Ugie7Ws7QKHo/CLyaIhxktGzRTDaVi8
	Dp2vqhxxee7tPQpPqhk/qNOmKZs+GR/EjDyWixkdn2bzyTbbTMsoua8VOEzvlmXiW63jCiCxTUc
	HCfqPBCE3tELfaoBojo14vtMDCC8dEKBqjPN2Ohh1vndAZBM3L1g8ovv2+gypSIOyKxSPM7Wisc
	ApUEx2fsZwS/NYaF0/tD/QX7/pcyeCS65qPT5EmHspvQ5KtYdkx5b4b28eQXRnlG3WGKISEzb19
	vRN9pspGppBx6Z+UWsAWUTkaLYVPbzVtvTSSiDMQCtcdZienYMNnew3rSbFr6+rnIM6M7eUAjcq
	IaqIlg5vJK8AIHmg1rgBFn7jnjr1TgtBftCfH74ca9BpAtKe0fEi9DEMhg/vMusukd349L0tU6K
	p2FFdaY14GA57VidfwoclYq7X0xNlywuFMPw==
X-Received: by 2002:a05:600c:705:b0:493:b962:4abe with SMTP id 5b1f17b1804b1-493c3dfacf0mr84107845e9.36.1783068142021;
        Fri, 03 Jul 2026 01:42:22 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccdab27dsm30001575e9.4.2026.07.03.01.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:42:21 -0700 (PDT)
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
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Conor Dooley <conor.dooley@microchip.com>, KancyJoe <kancy2333@outlook.com>
In-Reply-To: <20260522-topic-sm8650-ayaneo-pocket-s2-r63419-v6-0-16edddda9951@linaro.org>
References: <20260522-topic-sm8650-ayaneo-pocket-s2-r63419-v6-0-16edddda9951@linaro.org>
Subject: Re: [PATCH v6 0/2] drm: panel: support the R63419 based dual-DSI
 video mode Display Panels
Message-Id: <178306814096.3165305.17752151699717315900.b4-ty@b4>
Date: Fri, 03 Jul 2026 10:42:20 +0200
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34678-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,glider.be,linaro.org];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:neil.armstrong@linaro.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:conor.dooley@microchip.com,m:kancy2333@outlook.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com,microchip.com,outlook.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[104.64.211.4:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linaro.org:from_mime,linaro.org:dkim,gitlab.freedesktop.org:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 203F7700557

Hi,

On Fri, 22 May 2026 14:51:23 +0200, Neil Armstrong wrote:
> Add support for the Renesas 63419 based dual-DSI video mode
> Display Panels found in the Ayaneo gaming handled devices.

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: panel: document the Renesas R63419 based dual-DSI video mode Display Panels
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/9c04ecc893f07d001e484e6c420af19a970f755c
[2/2] drm: panel: add support for the Renesas R63419 based dual-DSI video mode Display Panels
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/1190fc8d7b8a9cebea8dcbd2e544e43990ae81d0

-- 
Neil


