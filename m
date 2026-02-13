Return-Path: <linux-renesas-soc+bounces-28180-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id jzsjEo4kj2m6KAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28180-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Feb 2026 14:18:06 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF981136442
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Feb 2026 14:18:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 195283014A22
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Feb 2026 13:18:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AAA335FF43;
	Fri, 13 Feb 2026 13:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e10WJv+O"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC70C3590C3
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Feb 2026 13:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770988681; cv=none; b=DTDJPVYG+2bSXISFuuE2UFIegNxfL5xhYy6uAyACLXcnVM1JmX0egjgeMNbeJxldxGWY5hv+hDxLSGDMyvIbC88j+0ZWULfymU9dXhIyPRGpIy3JkqVVURrm6x1q/IQ6PF/L/hXAINT6FpRvVOQi0pVApfZ1PXojZLYNVXoy02A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770988681; c=relaxed/simple;
	bh=INAIXghp83/jNBX4SyNZtmAn35Of6e7qwMPedmTcMcM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m30qScXdWs79Nrp0k3gB7N/1SRT4+8fT/JN0bjifMYkphsD4uRvFXue4O9U1Y1hAdPSAZsx60IqWgd/jBbxgrDVljOiLQ6CZp4Ut8KU9Ar1mFdRNFYU7DrKLNnCz0xjU+DaqgP6n7fWqrdrMO7iNb9RfJ+ogNojx/tf2topbpBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e10WJv+O; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4836e3288cdso5696735e9.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Feb 2026 05:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770988678; x=1771593478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N81cStsvWs5JcIJrO+U/46Nh7gzxlPlPHY9kLBpRDpA=;
        b=e10WJv+Oga5ZdGl3hKce2/ZM/aWoGdkVhg2VNqUAHog90vsjAEYu6jql2dAmN8M00A
         jzOqKo09OyuideElG8+KcLMvD2E6n/kCw+az7H2udzdvNANdGyz5i2u22bxnx0LhN78S
         Zd3ga0lR5hBpfbPxPcJAnrp4G92STItmS7HXDqx4YmuNFh3N7foDP1t3FBXDCdpImhIT
         ONp9HsaxU1xDG1iZGX1Cy9XAJNfboEAxzJZkXzEhMrskvkvVvjtDGXmjVxdr6Dh0a9R5
         VvvNa//NYsi9V87cPl+nQH73m65EmLWWjjqk8ljSQnYoUihC/dhCEcTN3fK9C9NrdQSO
         igNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770988678; x=1771593478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N81cStsvWs5JcIJrO+U/46Nh7gzxlPlPHY9kLBpRDpA=;
        b=OEEmh4EntjxMAWbWrWG+dw6SXwW0L6kbJtG7aNZv8D0rPfdUu4bkNSpRKzbTfbDiI1
         dEf/7at67LIuNfN/bvGG9wGWLp+Ao30ZtipNqPktTM/2SVeg3uhFzXsLDrGQnqgjl1Dr
         /AshrKe4+2MmnNWVShciCFh7VcA6meLUqTPdo9yw2FR5zrlMHdggbYT5AiQGu4if40YO
         GsprSAl/Is4xzWVaOtZc8GuzMVewN2E4lLo9+2Up/Dq8+c2hceVzQa/hoJGLuV7r22VS
         QxxKDUVcgTR9fpxzp+BlaklkMnTt9+nNngKZ6tLisWcUQwrMB5jaoCOWC74PfB8sKzjn
         3AsA==
X-Forwarded-Encrypted: i=1; AJvYcCXqLtLKoaaomcOn3IwuW5bfKkw7O3K+470fMA5HkDImc7puzvVfKpqKmXXUw7xGPDtoo7nw0R2Vj47aZG/y0fcjFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzutVUNDd68/RgGJKlfzUJ6KkK3fOrAr+q+w+wQZQzlGha/RDYM
	QPBUqKDOJXzQYgMHSSM5+OGpffgYGz+4AgTG5StGsniXa9P2pduj3mO5
X-Gm-Gg: AZuq6aIek3qoqZe2yRtfZl3zUJVr86RJ0Lht/CnbX9FTt/XJMbuQjAsjF4ITkP7ID9T
	EDRvmDCuAB/2JhIL20ROfXyyxlhPaXfUqkCrCz/y/bKYVw7L+GCar/Sl02f8Jp4DOIDY0RZuUy8
	FLiBc6dUrC4F45dKJ+QNC4Rx2tlcms7kXYNU+KnSneVH9T800mcZJ5gwunNO/ADFFfccwOhxyWY
	hmN+mLwpEtMPQFx7/7BHez489PvKfBsBHyZ8UbJIgN3081Xq94AuycVvEDX7emD9iWqaKqvuKaI
	Xq9SH4qc4uPELwuTiM4WvOQSXb2TJEtcNC9l9cw7GskXOscwjHLr3UJ4JjWKDTp8pOFBpoqS1vR
	2p55lc9gEJuqR6uPvq5EmbkKjrLFmK4zoM43lvQob1nn1pbs4jcqi8061gIZSP4D3WBJ6QG3ktO
	flAQ+bmc7TIiU9yjxj6Tbz6uc0ogZHUtA0u4RYa4+cxAOclMKAwIq3u/eqdAOSlaVeVMQtJ/ZMh
	8PU0SwkhL1b1sBg/7gcMd5xExcRPT1adEQvyg==
X-Received: by 2002:a05:600c:5912:b0:480:63c1:3ac7 with SMTP id 5b1f17b1804b1-48378d4f647mr1257315e9.2.1770988678270;
        Fri, 13 Feb 2026 05:17:58 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:ed1d:fb0d:baf6:e4d9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4836ff00332sm60942925e9.2.2026.02.13.05.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 05:17:57 -0800 (PST)
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
Subject: [PATCH 1/2] arm64: dts: renesas: r9a09g077: Fix CPG register region sizes
Date: Fri, 13 Feb 2026 13:17:41 +0000
Message-ID: <20260213131742.3606334-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260213131742.3606334-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260213131742.3606334-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-28180-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_PROHIBIT(0.00)[4.200.249.192:email];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,801c1000:email]
X-Rspamd-Queue-Id: DF981136442
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The CPG register regions were incorrectly sized. Update them to match
the actual hardware specification:
- First region (0x80280000): 0x1000 -> 0x10000 (64KB)
- Second region (0x81280000): 0x9000 -> 0x10000 (64KB)

Fixes: d17b34744f5e4 ("arm64: dts: renesas: Add initial support for the Renesas RZ/T2H SoC")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
index 83f6e667358e..ee41610c2ac8 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
@@ -1089,8 +1089,8 @@ xspi1: spi@801c1000 {
 
 		cpg: clock-controller@80280000 {
 			compatible = "renesas,r9a09g077-cpg-mssr";
-			reg = <0 0x80280000 0 0x1000>,
-			      <0 0x81280000 0 0x9000>;
+			reg = <0 0x80280000 0 0x10000>,
+			      <0 0x81280000 0 0x10000>;
 			clocks = <&extal_clk>;
 			clock-names = "extal";
 			#clock-cells = <2>;
-- 
2.53.0


