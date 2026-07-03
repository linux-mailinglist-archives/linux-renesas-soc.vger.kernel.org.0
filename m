Return-Path: <linux-renesas-soc+bounces-34679-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6jdIJhB2R2pnYgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34679-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Jul 2026 10:42:56 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D07470036B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Jul 2026 10:42:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=trRlDV5X;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34679-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34679-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E2235301586D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jul 2026 08:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6794837A4BA;
	Fri,  3 Jul 2026 08:42:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA8F372685
	for <linux-renesas-soc@vger.kernel.org>; Fri,  3 Jul 2026 08:42:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783068151; cv=none; b=ktu8rM9f0ELkno1+J/AzmWAs1LGEOo4mlVJJrfPe/V3APwIvhFtxRnCTUgj+MHfntBmR6w9sx25N9SQpFw7znC5XrRxSKAe5zye6+JqzpnxnATA3yEo78tUPPKTgNLJ33tz6+uYhmQs1hFbdz25svPcb+cvm0uT93snYQ8UtDP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783068151; c=relaxed/simple;
	bh=+YCmrkr62ImlHnOn240RCni/4FJZ9LXyVf7QtvrN5Tg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SVIzobQLKo/RTJP7Fc0Lk8Aca09uPHivjVChuuAXdbDD92aZ9yifvCv9Yt+f82B8wimh8Xl74pzPfUwFX1WITgMm/VO2SnCbxyYbkg2Lp+kiK5D+6ODo7Epsw68asVjuctr5xaAIx4wggKNC9+OJrH+VdXmeVikXRUPGeWdWUb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=trRlDV5X; arc=none smtp.client-ip=209.85.128.54
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493bc8fda98so2892045e9.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 Jul 2026 01:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783068145; x=1783672945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E2BvWoVYKkcPj1zcFMdBoaWfsieqjtxdGGOhjIbmmoc=;
        b=trRlDV5Xy7d8q4OnPQeoc5aJAdbXaGFqZRQCQx3mja/pAHBFAJGdJppLsrOdxQyubD
         f4YiL5Kd5izSn6VvcwUrTMxUpCBjFkAdr2wKhyOE6bI3cHNP23fuXHqfkMMc26+PhMNg
         M+SdVRM1zHxMv9RQlsIGz88CPTB1omkyjXEI14Q56EP4k67fr9G/PkFjUF6+c+vVgfUU
         +TM8F1/k5uPEvzezZ4DLSkaBHI//q0JUkHYKvmhEBt5JWEpfRQl861B2NkgXZttfAA3Y
         tMIM4NsSd91O6NR3dNyp+PAI3NkZBwGVGoyjSdhGvRUgiaBKFjD7hBg/a/xDq9l4HWRP
         Eb6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783068145; x=1783672945;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E2BvWoVYKkcPj1zcFMdBoaWfsieqjtxdGGOhjIbmmoc=;
        b=GiC5W1x253RVFDSYFQYJatvYWiRAPgF2g8f1gS1ZXRBYxZO5a+uVw6FdywOERfzznm
         vEOSrfrD0pOUc0f8TbU5tfimGgxtaMC5oS5RP+MhBrsVLRh6EVv0UsHftaii8JjPEFgm
         ht/MNPrJTnpHse3xvCswZeyvXCmYToGV5212ftOR+2BWkoA2w1km+/BH8kat8W0nNDOw
         EJnl3+Afv2UJGL0l9661Pr5b1Nf6Ms0JPwi3JXcJ4I4qxN0ifpLudnLNpaLxiOYJKywt
         ONnSczizoUAoYhUVf/KZQFsFvs0+sZiGNvBIEUJSraAi4bJFtrVL8q1WfXT+sdvlncAI
         L4VQ==
X-Forwarded-Encrypted: i=1; AFNElJ+z1bcgzFNV+C+T1YSFTApEyZiCD7i1n/rk4HAUCGpcqn4degvgZbRkk9NgeSY9AL4aqFHD5N1jAhANapTW7u2wCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGKA2H/V7tbUbfy60pkGo2P0z+EVrT/0UjYTQTZ0RaVu0PXcbJ
	oWkyn7ouPwRIiVI/bLtUmj+wSS/qNf72oKz260niu1Q9hHZh+QgRl4v0aiewt7jQEpI=
X-Gm-Gg: AfdE7cki4Smdi9soyVx9w/i03mZr5c6WOhbZXdC+IbK/0sos81KonBHM946SYwku5OO
	wMINxPBiLeQR1O7fgH8UzK0EluxOExnf35L2Ojn7GYPAv/ID2XX+TLwuxWU+J+o1z355NySSdLw
	4TBc/IJN3ZAkx2Cnh0/LzjqpZ7E5ymoASqWjQH0aQHQpEI8KtdusFzlcx5NCSgJM+J6EBRN6CUi
	vsViCsurEFiyd8FGQ6N4Cqw5+lx8XxCdfRoX2j44wCT6ko9dE9bmXDBIuMQXvc8/MQJp7ii8t9F
	H1anbMtgO92+IN4eFttb9q81UrFu9NEEm/sqqDcmZ7LiqVuw82xyLgSyLeY1nWGbPnonU6fMSnL
	tpXWmELYmUiJR5+ySk0ScyxkYhwl1KfEYXyhuy7kD8NsYfQLhvv1ki7CD3NEZ8ux7EyYmK06rQ5
	zjXJt1C+5co8jBZHPrPPgunptpTjOg1VzpfQ==
X-Received: by 2002:a05:600c:64c6:b0:493:c337:db18 with SMTP id 5b1f17b1804b1-493c3e135a9mr113800625e9.16.1783068144642;
        Fri, 03 Jul 2026 01:42:24 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccdab27dsm30001575e9.4.2026.07.03.01.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:42:24 -0700 (PDT)
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
 Doug Anderson <dianders@chromium.org>, 
 Conor Dooley <conor.dooley@microchip.com>, KancyJoe <kancy2333@outlook.com>
In-Reply-To: <20260625-topic-sm8650-ayaneo-pocket-s2-r63419-v8-0-8570e692143e@linaro.org>
References: <20260625-topic-sm8650-ayaneo-pocket-s2-r63419-v8-0-8570e692143e@linaro.org>
Subject: Re: [PATCH v8 0/2] drm: panel: support the R63419 based dual-DSI
 video mode Display Panels
Message-Id: <178306814343.3165305.11547200028737735771.b4-ty@b4>
Date: Fri, 03 Jul 2026 10:42:23 +0200
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
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34679-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,glider.be,linaro.org];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:neil.armstrong@linaro.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:dianders@chromium.org,m:conor.dooley@microchip.com,m:kancy2333@outlook.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com,chromium.org,microchip.com,outlook.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,gitlab.freedesktop.org:url,linaro.org:from_mime,linaro.org:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7D07470036B

Hi,

On Thu, 25 Jun 2026 11:29:06 +0200, Neil Armstrong wrote:
> Add support for the Renesas 63419 based dual-DSI video mode
> Display Panels found in the Ayaneo gaming handled devices.

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: panel: document the Renesas R63419 based dual-DSI video mode Display Panels
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/9c04ecc893f07d001e484e6c420af19a970f755c
[2/2] drm: panel: add support for the Renesas R63419 based dual-DSI video mode Display Panels
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/1190fc8d7b8a9cebea8dcbd2e544e43990ae81d0

-- 
Neil


