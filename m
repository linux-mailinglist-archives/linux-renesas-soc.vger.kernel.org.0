Return-Path: <linux-renesas-soc+bounces-32156-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Fe6DTBl+2kuaQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32156-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 17:58:40 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E8F4DDBC6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 17:58:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 191533008248
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 May 2026 15:58:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3E2D13DDA4;
	Wed,  6 May 2026 15:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OB3k4Y1S"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7BC477E41
	for <linux-renesas-soc@vger.kernel.org>; Wed,  6 May 2026 15:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778083110; cv=none; b=Cvh3vz5geBMvkgbu7CccQQb9Xll4WkgxNX6mriu3IdjxubBGhP3rApYWRX/3oarxdsMcbZpBxhNy/2KtpF76jX5QP4L5jQCh21N0rTW6CKYLfP6bAicKI9Ele4PJDD4HREvq/TCDZQOSfjo+4IB1NkJW10pnrykQKcY5QkGBS0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778083110; c=relaxed/simple;
	bh=wyMxM6YQD+S8i1bLWoADdlaRZYIbQTZSquyAK63yc3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j/T48Rlxx5g+7/o3Tcl+D/WflwNFM7RWtt/MfWS9fXxWkIrk1gabYdDzKgkZMM8jJTyCGMjo0EuJEViAiy57YmATE7XXk7y0DlMcWVbdYPEk9ECTgLEBA9uKRqqTsdBSn01rp/PFm0YKlyRMqsVH4cSEe2Ir+Hj3zHoPCajW+48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OB3k4Y1S; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488af9fdaa7so35252535e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 May 2026 08:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778083104; x=1778687904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SLxt3NAzP2ZNWQv4kMfhbYlGVoizEwbznGwwg4XaRZ4=;
        b=OB3k4Y1SXtVJPqjW7sco4WOXMAPVO5G0OrNZ7g5lfYRmPAeTQuNPQtqMwH/2qqluLR
         tAac7KtQ0zMhbXlpC/bv6RJICAGPsVQrucIPBgvKvvnxELq0T4skI+pgReaIKIwhd0dC
         sttYPKEfy8hU0TnzU237KqfY0ttXFeMx8NZLsJfMjp2NUImUr+W38tV7vpGLRwLssVT0
         V9FShe0XexK/J51mTtca+OF3ZU663Z2ENZJKNn26C8VrDUtPUEY4rfNRl/ZHKM3ToEen
         10vRQHOTT5n/6YBcsIUDQ9k7gzU08Vi+gBHhTfnEjFVQJjLAZfux7yL1KlI6Isd2YiaN
         Ab5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778083104; x=1778687904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SLxt3NAzP2ZNWQv4kMfhbYlGVoizEwbznGwwg4XaRZ4=;
        b=eNDr+tp1FzzFTifCKgHsqjZ2Xnw+iQ/n5beMNV1c3PwuuzSpIqObctBzwK1cZrUhi2
         ZDudiRI5r35lOYCv5WrduYYTepX8is2/pj7HQpqLtwjeqtPy8Pq7D096In3YP3ZJgiXf
         /G5GdUoHErhjgqCEFdFH5CjbgcGfUhKoRYGuv0EURql4wqIVKBt4POQ2AXxb8UmI8PzK
         uu1jNVFwHvZva9QNt7jNeMALuqEfFMDiq2OL7lOIZ//00KTaWpmTjnjD+m44B7fP3Z9J
         aZDwaf6GL+hkH+I5vk24NmYb9T5F6wF5lacyCCCi7lGBx14Gk/jmO8m1q0rKm6G73eM0
         yAPA==
X-Gm-Message-State: AOJu0Yw8jvVSRtVY2xR+VFQrKYDxA2nByRyGxC0xPwWdJ33Z175h3tzB
	IeGAKFFsKoCx8gdgwaoy/4ySLMmiPe70RHv5SN5GtYu2oMyZweWSIjqf
X-Gm-Gg: AeBDietRhSdjJ0tcrzxaA5H2QPjkTPFF0PUS6R6PVUqCpdR0FapuUz0L1ZdoceMHQ3j
	aKjKAIt+ADNZjJCAceCMQOfs0c/GGklUoRhF9fj+83pGWEYR6ZFTxyeE6Eyz1Xl0xFy7PtAP1wu
	+mLs1H7ahgOrV7293GjGvlcrUmd/C9NgXAyU1lM5exkdcPeCrStm5yFGjzOazKQzZVl6UxZddsY
	zzg0ND15UGPyk/6xPZ0vBvv1jlJXl0kXlf1HEx43ulnjox64v5aQFTfHQqxOIv/t+QNwFCqnl5P
	pGPvsUS5EI1nzjfhHv5qqAChsVR2UajApSeFWSR7dZkpoDHrD0HQR6INteUHqnhXxb4/G3dg5zt
	+Ff83kjwzJyjp9kvaSGiaz8qgXqI/5g5o1TRhAlbe8VN2onUylcFtEx4jgrv3/vwWk1oHXy9+6S
	K3jl8fZDFev99zCZJga1juSM7PODBS8g3B6tjGdgNm74bMCQA9b3g9Bchk520c1RbpMeUx0liVc
	W/YUkAmB8wvi3zY2/iiPEtQ/gwG13/tqbEtBlLCpYipXjEnIHrsssLaSA==
X-Received: by 2002:a05:600c:6dcc:b0:48a:5301:bb5c with SMTP id 5b1f17b1804b1-48e51f2f786mr40594565e9.16.1778083104255;
        Wed, 06 May 2026 08:58:24 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3dcb:40a8:a5b9:2327])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e530b2039sm21345205e9.5.2026.05.06.08.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 08:58:23 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/2] arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Add alias for on-SoC RTC
Date: Wed,  6 May 2026 16:58:04 +0100
Message-ID: <20260506155804.3984418-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260506155804.3984418-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260506155804.3984418-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C5E8F4DDBC6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32156-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bp.renesas.com:mid]

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The RZ/V2N SoC provides an internal RTC, which is enabled in the DT.
The RZ/V2N EVK board also includes an external RTC in the RAA215300
PMIC.

Add an "rtc0" alias pointing to the on-SoC RTC node to ensure a stable
device numbering.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
index 00e5455ea5ab..65c93e5e3f98 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
@@ -26,6 +26,7 @@ aliases {
 		i2c7 = &i2c7;
 		i2c8 = &i2c8;
 		mmc1 = &sdhi1;
+		rtc0 = &rtc;
 		serial0 = &scif;
 	};
 
-- 
2.54.0


