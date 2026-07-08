Return-Path: <linux-renesas-soc+bounces-34910-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kMY4D5GJTmq8OwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34910-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 19:32:01 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DF03F7293E9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 19:32:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=mIL1vxxO;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34910-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34910-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8CC49301828B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jul 2026 17:29:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9FF04BC003;
	Wed,  8 Jul 2026 17:29:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439AD42DA56
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Jul 2026 17:29:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783531747; cv=none; b=aZTYKdV1laBPYjWCi6kn5z2mN/7W+BC/fKcJHoF5pclqM/eGWn157FTtQ2I0wVPechuVMuAgr9g/7pszrqAGjyX/3QKRCipqHFY9LlNMy5nuLFIyWrNkaUdUraH04NJ3aLH6qFNpFxWCuiz/EsNps8OJ2/oIsbv/3PuYCgf8YR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783531747; c=relaxed/simple;
	bh=ioCtDb6Hpyegnn4dLa/LBc0pEMO402CSdMCwg9kodwM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NwJxk0aB3uuzuCPkh7r3PVe/p7tBKPYTXn6zW1+jOZslxoBcjjhfAB1s6O53yxKOWGtR239RldxbjxQiRZE9VHHdwqIQR8H2eRf9Jv6K+1e8yzIR53/mJailTBHiMZeT4CRxeQza4VK3f4jBi/pxTXfvrxMyFnktjBTOQ2kgZlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mIL1vxxO; arc=none smtp.client-ip=209.85.221.50
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4759b4f0897so600422f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Jul 2026 10:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783531745; x=1784136545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rKuTPeLP5x2TPSDUEcA4a1QbA/RpwWIA3uH8yYjcuQs=;
        b=mIL1vxxOWlPYE6Py0olswa6dnjNeZvzNpb+ZKO1DGGXlvpc8IqA3v0zzv8p6KGMJvS
         +LNLkZ/YmjqDYBTqX2cwxYAtErr6ZXuKJjn/NR7EJS38/sswjrtTl3yrVhLU44ZEG5YM
         t+rMvv/NLAze5ZWKVN74xIbqszJh6brlMlbSCAaL6+nrdn/WHOu2tO2D2UR1drwiI64K
         dAFy/LriVbAqyVjkmg43EmD60QovzhudLVSWPUAzFu5NXKKuPe+1FwE4em+03NuNmL+M
         zu509PcOmMr36sz4q12Uwv3wkxNmUxhF0miWjZis5Zlrh+8DNHHpwZlwI/4jvPybSzU3
         f46w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783531745; x=1784136545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rKuTPeLP5x2TPSDUEcA4a1QbA/RpwWIA3uH8yYjcuQs=;
        b=L936AKgDINP3WutknsN8Yhqw+36vYW1RFHcVnO4pz/vUDhhM4svO1XkOzoAy9+Ftl8
         57xpovepOUz7DNCN8E5MDdX9LUTi2iaBSUmyL6Z2QT9F1bI+2Q+P/ZoRZVH2pinS0Ih5
         d2eRi0Uq150b1qWz8EcONMyM8tzUxJbVca0/2kwhZt1qYl4eLjwvNp2+ovREg6BM0gac
         YxKcARjPED07hi8UfYkGruQN+csGYsP4zaWlG6jLDQU/5bT2FnHR3AAO9uUh/5wMJhcX
         tF6NCec/kOOYCkMTywtPG87luhF0aR4GSIZsKdGVPcvcrrtD3sp82kaGNuSV3Am8gVjd
         pNEQ==
X-Gm-Message-State: AOJu0YwbaK+76JaqkmhYz6jTAH/9YWWhvSMEFKCXROd+oHgcIgfO0YRN
	KyrEPIlxZft1OqA+RzA8hi99YaPQoECjyAd4DJRPZZQpo9gxrsrmb46w
X-Gm-Gg: AfdE7clIxTeOkOfbGpJ9Fm0/ath3bTCK/qFpNnQamkVjlRuJCvKrJnNVrpuCUkshfqz
	aaXe9avsArx4vlBFiqhyStm4ghnICoDXU60Dlr1uiq97iTV7OuFyXMOhAijPe7UatqM9SfX3fq7
	bu+odwt0P5MHTotV8MdNrtNy0aunGp3NcaVQ92tc2+ilPpVmjOxah2mJO6CeghcIbpGtu/M7rKq
	lkeENSL7Z0MeJhC/D/T9eU1Zd6YxWOz8NKX1hJlIa2bTiW07Hf5WqIQ6eHcam3SOV+2wghD7+zW
	tikm23e41H+oeI1BEQ4vjyjJAoEbQZLjpBtKBa3Mqh0qVi9fdQ3VBrJFglpLtSpr2MN9nDMhYTc
	cI+3cn3TklhI8ZLhLQC7VOFsTSvgyibHbHVdIitokpRZ17sLlPuY6ZQJLPPAhQc1EWQS8h00RU1
	AwP5a+M3o6AQC2sasj2xmP9P2kcgh6yiCNcRmcJrQoZz7FL3vxM80s99mDndT4/bGTasuYnrSW+
	XKVkdt1/qPGr2Zdc4nCSGevbdQ=
X-Received: by 2002:a05:6000:400a:b0:473:823:1924 with SMTP id ffacd0b85a97d-47df07f7654mr3574332f8f.39.1783531744610;
        Wed, 08 Jul 2026 10:29:04 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:ca98:2759:6fb2:4aa7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d905sm46588469f8f.2.2026.07.08.10.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 10:29:04 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/2] arm64: dts: renesas: r9a09g047: Fix PCIe dma-ranges memory space code
Date: Wed,  8 Jul 2026 18:28:49 +0100
Message-ID: <20260708172849.227915-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260708172849.227915-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260708172849.227915-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34910-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.csengg+renesas@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,vger.kernel.org:from_smtp,bp.renesas.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DF03F7293E9

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The RZ/G3E SoC supports up to 8 GiB of memory. Update the PCIe dma-ranges
property to use the 64-bit prefetchable memory space code.

Fixes: 1ac57c9830cb ("arm64: dts: renesas: r9a09g047: Add PCIe node")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index 310f988a63c4..73757e8e2197 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -1447,7 +1447,7 @@ pcie: pcie@13400000 {
 			reg = <0 0x13400000 0 0x10000>;
 			ranges = <0x02000000 0 0x30000000 0 0x30000000 0 0x08000000>,
 				 <0x43000000 4 0x40000000 4 0x40000000 6 0x00000000>;
-			dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 2 0x00000000>;
+			dma-ranges = <0x43000000 0 0x40000000 0 0x40000000 2 0x00000000>;
 			bus-range = <0x0 0xff>;
 			interrupts = <GIC_SPI 800 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 801 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.54.0


