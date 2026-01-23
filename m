Return-Path: <linux-renesas-soc+bounces-27371-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGQaJ9X9c2nu0wAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27371-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 24 Jan 2026 00:01:41 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A237B58C
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 24 Jan 2026 00:01:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 32C37304E337
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 23:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B447B2F12BB;
	Fri, 23 Jan 2026 23:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LdBwVXym"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF6323BD02
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Jan 2026 23:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769209230; cv=none; b=iWpYlqrpkncaj0b6KX4aGHW4OupRUJVylI6iRYDdu8abu6xjgjSZSwpd6oVCBT7wdSSZsOzpUAPwWbIIQOov9W1CnLL6PAd50jaoO7Lxv/embC0dg7gbWSmmvlmLepIEsyCSy0gGK4LQFXk0x1/J1MypKYV6i+P35YITbU0CEvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769209230; c=relaxed/simple;
	bh=O9KLqwSOljwtGXuidma55I4owWpuuMFmuCL5x92Ep74=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VZAzgtemkGmQj52SUpHfSEjAOF7m7SM5a4/BizEPT9KoMJ3OFKCjm+lfNh2gUrSxuRXc7/EWDxz2sax6F1ZgxTeLwoN83KaBl8EIRiP4aPDyug182IP+NzJ6c7Tye7psuhKoWt2JsLOb2SaVeGf980lPQNgLJgIM6a5xOVhevY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LdBwVXym; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47edd6111b4so31506265e9.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Jan 2026 15:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769209227; x=1769814027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/hjGAV1iNwufFZLawIF586/Xk4e/z7L8MkoVmcc2ys8=;
        b=LdBwVXymrbKqvrdsHx1s2AbtbV+1BoA/HTHAE/NAopd/Yn4HaweGu+h1NOt1a4ncS1
         iCXE7yj55+ULlolj1IlRwp2FHhA4MdbYfBk1Ru9CQElDeNZbqkSbYOASyZZAz5wk9YY1
         byj3EC0Abtt0ASBnoPwILx/CfXcbk12TuOcdx1wPmcrVTvsNmQRWxDvBbbl/ytxpklEn
         o6+mY16SW3GNpHWZn4m7M54gtfde/KJpvB8ltXugBkeQRLT9mvGiF/iFwWB6nRFxdtUp
         LgTaezOVAXJOSV19KUBIuODnwVyaiKF3EY6fQytzrTbjdlJRsuDaPIMFNBnEes+MHTJS
         JG5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769209227; x=1769814027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/hjGAV1iNwufFZLawIF586/Xk4e/z7L8MkoVmcc2ys8=;
        b=rUvEC4t23iXRKTXoTNl6FcWCT6jSWI1tINn5SDDGeH4+DVRhYfjU6+ecO2DQt8SHkf
         cru+kSGpsu3sOfYD9ULfYz0WWXmh28Se8/gnoQaZrAqbUhdEbqEhbeGpE6BziMjj3xg6
         /C9kJhdq4NyjxgaCUA8QBVfc+vA00rVcp9m02p5apiVfNxRd/9SW/TUs99CoDcrVKH1P
         yUAgoZsA9gjEle00hIiJR/VQNWKL1MRZJl3tHWsB54ervK2zTf+xES3zZOdblWwHUqmi
         cr+EWYa3ZKYcHD8jR87FNa2c8/6IioDp6E5rDuLJbxuGDP+LBYOyMWJOd74WVU0p5eg5
         qDSg==
X-Forwarded-Encrypted: i=1; AJvYcCUqDz+RENNVftLPJ+TTUCy4myMiCAisJwGd7HARmy9MBQmfsqh/dIJO8n2+X7vM3NqNKFfRLgF1RnzZ/Byo9AiCxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEJhZh8489fJdCc3gjK7WzK0qduXL2NXjppu6nvz0lJ0j0PmJI
	0Pd5V34mfgoB47xK0dWDM8ZKL/M1mSvfThe+dmizSUMMJzft2Dq+YR/A
X-Gm-Gg: AZuq6aJWbXJ2LHOVOsAYHfPhGG+WlznTjzRZ4jrt8EinPmyu+/60mnGuOKZLTFO8cj3
	OU88waOe71eKNxY+/ZhhnxwzpmjU0pxY8chDt4PMaT/FtKlRGgoTV9wWJNmmELFObd9eCFOXsHO
	cSupDkQNDoqH0eCT4xDT2iMloIFcgzhGZWA1RUr8uEo+pA9HSdLYr2Vi8Q+VREjFhg4yGGPLVyL
	EfEZwCyuIT1bfPAlTl0Qu9jSIRqbPIul0pUfZnxjRGQ1Em/SPr9YHJeNPPH0ElLbwV06C2yaEWl
	BZGPfNs3G0SKgj7etbj0nGASLDEBivr/AIewdvnZd34+O5PuAlOZgaMJqvDi6jxPS+nUduwK6ax
	rYLwA59SgB+Dsy7zACNPv+v08N+dk9ZOHLAWMDoWHpK9DJbvbPf3nJtqPF8VbuvMHIaWuo57Ic8
	/kR08NG4l9jFLTCJOlZHsKxDS1/+EejD6mmt9zFRHtZTBwS2YBEPPE0OgJ2WxrQSKn8Xs6LzfbX
	kafIkpRbG1g0D7ltTYRr3j9
X-Received: by 2002:a05:600c:198b:b0:480:3b76:6b92 with SMTP id 5b1f17b1804b1-4804c9cf019mr63915175e9.29.1769209227350;
        Fri, 23 Jan 2026 15:00:27 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:bccf:b3b1:e288:4e83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-480470cc278sm157142665e9.12.2026.01.23.15.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 15:00:26 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 4/4] arm64: dts: renesas: rzv2-evk-cn15-sd: Add ramp delay for SD0 regulator
Date: Fri, 23 Jan 2026 22:59:57 +0000
Message-ID: <20260123225957.1007089-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260123225957.1007089-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260123225957.1007089-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27371-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: E6A237B58C
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Set an appropriate ramp delay for the SD0 I/O voltage regulator in the
CN15 SD overlay to make UHS-I voltage switching reliable during card
initialization.

This issue was observed on the RZ/V2H EVK, while the same UHS-I cards
worked on the RZ/V2N EVK without problems. Adding the ramp delay makes
the behavior consistent and avoids SD init timeouts.

Before this change SD0 could fail with:
[    2.646242] mmc0: error -110 whilst initialising SD card

With the delay in place UHS-I cards enumerate correctly:
[    2.633493] mmc0: new UHS-I speed SDR104 SDXC card at address aaaa
[    2.641687] mmcblk0: mmc0:aaaa SR64G 59.5 GiB
[    2.651489]  mmcblk0: p1

Fixes: 3d6c2bc7629c8("arm64: dts: renesas: Add CN15 eMMC and SD overlays for RZ/V2H and RZ/V2N EVKs")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/rzv2-evk-cn15-sd.dtso | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/renesas/rzv2-evk-cn15-sd.dtso b/arch/arm64/boot/dts/renesas/rzv2-evk-cn15-sd.dtso
index 0af1e0a6c7f4..fc53c1aae3b5 100644
--- a/arch/arm64/boot/dts/renesas/rzv2-evk-cn15-sd.dtso
+++ b/arch/arm64/boot/dts/renesas/rzv2-evk-cn15-sd.dtso
@@ -25,6 +25,7 @@ vqmmc_sdhi0: regulator-vqmmc-sdhi0 {
 		regulator-max-microvolt = <3300000>;
 		gpios-states = <0>;
 		states = <3300000 0>, <1800000 1>;
+		regulator-ramp-delay = <60>;
 	};
 };
 
-- 
2.52.0


