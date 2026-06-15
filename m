Return-Path: <linux-renesas-soc+bounces-34004-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tSlzK2PZL2qYHwUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34004-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 12:52:19 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E33D6857CF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 12:52:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=UKkErrht;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34004-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34004-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB753306DAB0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 10:48:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B439F3451BA;
	Mon, 15 Jun 2026 10:48:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FE1342C98
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jun 2026 10:48:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781520534; cv=none; b=tWuq9UR3YxnULbDYQNrvWrrjwOwSKh9gDqOSocyHFk0klDVU8Up5A2y6oNLSr76Pv5F7EVPmzSGZYW2qbos6qmB/NKVNAMThKl8yKDfT0l85U1T58rGHPLfc0BxqsqdNtJMyGzDJGaTlNJoAUoVhPf9/RyL/8v6aaGM0pbCLsCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781520534; c=relaxed/simple;
	bh=5auvEJum18T71XbAkYK85Pglurw/z4fjkQItDw3akdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fjQ57Xkll7g/sRcyIn2K1gZ9ZR77V2ZH4JQgGiQEvOErGkmzkJWApNum8vHMhvh2iS5v4q7wNWh5RV2Gwi+OXtS5gwY12/s8mD7KDHHkP6fanYVNKd5xs9vK2Urf0v6Rj4dqMu4yhJDAbmLXS9HaV7MBlm0Oe6y+pHGqO40ae5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UKkErrht; arc=none smtp.client-ip=209.85.221.54
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-45ef56d9b67so2692958f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jun 2026 03:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781520531; x=1782125331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dXFKNVRWxwW5KMFwm/zQYHz9ga+bWsg61qgYj0OuJsI=;
        b=UKkErrhttxoZNtHZ0YuOxCjq6DTqcVf5Rni3V0GiSahDFUNiF7w9Csn/j7DfjqGydH
         hMNITXTBUzoXrG6bdhl6vCAAtsEE2diX9JR6mnoE1tJsfLe0fE+T3SoewLRfRwxkxBK7
         f3ov5eorcUzllJ6KixsxlpLqrc3AWxQqoyICjewDrDcF7Y8NmnJzntk0U1IMSuPbkIDr
         qsvTUqDHpeBvMISUUFZt4zKQF1O24+apd/equxIcQ9va6Lq875Hu2pUXYCLYppJc66ZN
         BJlKgiiQ76THFP3dLXW3OH2zM7P6iXcDF8D5n3OxFvrMtRYmARV2ZtHlVlZOprnWVm2Y
         l2lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781520531; x=1782125331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dXFKNVRWxwW5KMFwm/zQYHz9ga+bWsg61qgYj0OuJsI=;
        b=mYD8sxqf6vRVXOcmg6ltqw7yWAUFke3b4kFNVUaYwZpJfgaXhBs1OOdxVr/4m6prdm
         owiboN6qsuCWxz8mJs026uS5/o9RldIM7yHFwlYt6MoREKpDY3k/nlfgxFmvI7SvsB6H
         DmdDrCldjaO94QX75BE4aiiTTQnfeOWJmnZtlufUgZT1yPwxyIobBzzzvtGUTXDqyo5l
         MP5rubp0t7bHOBUFfONLCFHeJOGPMkHXC1zGcXtNDivpbqBZNYL2sXpe/CQw0s0JmQBg
         ylCmWI/u1kVG4Wo3RCBau2SQBbvPBASqkyY6HTfyAZUUYk1VWiX1VlZ24wvXQd4wwL8i
         qZiA==
X-Forwarded-Encrypted: i=1; AFNElJ8bM1ZgUaWF1hmLT8WqVG0URjY6LOoqDUDLYiQpT9HOrLUI3VwR7qh6RZ0lEZXhV8+nR2vS+feee0h9HQ5JVZwUSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdqsYY0d1hY2zD8icnLxD8as3yJRBp+H7TN5g/SbxiRyiiaxh2
	e0vc/F+Iuo0fhPi+Kc2fypZR2PMt1GK9kVZiq9Mo+1p8VL1KjM/fXaDe
X-Gm-Gg: Acq92OHCK8eSDwYJrUMGt7yjpfq7pk0xujUf9lM8ie5bJou2F2ls2Jx1Mc2N921OW5F
	nnv8I+0oOtFv3ofwf5dIYDaBpdrIMDXP7k2oAKRfPsAimMHyb5u9xgUhuLfFSIhCw4zVxuite3i
	e0COTkPudobAFClBI4a7WCihfqhtHYYj1fYLwu/l8K6Wx+UoTdN2wCNrs8z5L+ErHzcVAASGWHH
	sfGDUqjZWZT4W/gGv+0Pdej1ohllFAgeE4KSfxb7rKegiGk4BmPRAinn7MitoRgIDJhoXs4bfq/
	ba0RHwe8R1C0Rh6CZtruyXcRzGLA05ItVs4oobG9APvyPYRz4nOMpB+DnIoa+31tj+sYuEREscA
	ClcrcmNI9C+2c1l0l0G1bxIa1mBIaPjUjdblIBOcs5RH0Ggb/fBnvmGqxtu70VsLMwwfcWACKFW
	ZW2zfcBvnIzHzc40P9c6XY1WX1/ruFke6l9qRZa+fIi/HH6pm1vgTUllPgdswX24yCxa0I3Ft7l
	NAkGsso0qVkM6oAYp3B7P/VPRGRb06FgKMU
X-Received: by 2002:a05:6000:2210:b0:45e:6518:21ad with SMTP id ffacd0b85a97d-46074a87c6dmr13828858f8f.3.1781520531159;
        Mon, 15 Jun 2026 03:48:51 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1e4:992f:3ad2:4f2b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26f1cdsm34812464f8f.11.2026.06.15.03.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 03:48:50 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 3/5] dt-bindings: clock: renesas,r9a09g077/87: Add LCDC_CLKD clock ID
Date: Mon, 15 Jun 2026 11:48:43 +0100
Message-ID: <20260615104845.4122868-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615104845.4122868-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260615104845.4122868-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34004-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:prabhakar.csengg@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:conor.dooley@microchip.com,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,baylibre.com,kernel.org,redhat.com,gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com,microchip.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,vger.kernel.org:from_smtp,bp.renesas.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0E33D6857CF

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add the LCDC clockd (LCDC_CLKD) definition for the Renesas RZ/T2H
(R9A09G077) and RZ/N2H (R9A09G087) SoCs. LCDC_CLKD is used as the
operating clock for LCDC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2->v3:
- No change

v1->v2:
- Added Acked-by and Reviewed-by tags.
---
 include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h | 1 +
 include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h b/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
index c4863e444458..f6cb8d649a46 100644
--- a/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
+++ b/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
@@ -34,5 +34,6 @@
 #define R9A09G077_XSPI_CLK0		22
 #define R9A09G077_XSPI_CLK1		23
 #define R9A09G077_PCLKCAN		24
+#define R9A09G077_LCDC_CLKD		25
 
 #endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G077_CPG_H__ */
diff --git a/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h b/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h
index 0d53f1e65077..312e563b322e 100644
--- a/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h
+++ b/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h
@@ -34,5 +34,6 @@
 #define R9A09G087_XSPI_CLK0		22
 #define R9A09G087_XSPI_CLK1		23
 #define R9A09G087_PCLKCAN		24
+#define R9A09G087_LCDC_CLKD		25
 
 #endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G087_CPG_H__ */
-- 
2.54.0


