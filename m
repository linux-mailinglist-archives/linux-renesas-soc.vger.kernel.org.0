Return-Path: <linux-renesas-soc+bounces-32409-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAA1I5stAmq/ogEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32409-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 21:27:23 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7825151C9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 21:27:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D84193074BEF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 19:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF7F64D8D87;
	Mon, 11 May 2026 19:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YXG32A/X"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007FC4D2EDC
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 19:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778527157; cv=none; b=FJguZb2eU7eaAtZENFrAMwFDBFCwSpidvGLm6CMBSjVI4/ELlyLuxY09YNEOU9LmZbE7zhhP6wNFyxxkF9m04Z4A43MIFW4MlPiNseBOhiRPjNDmHx0nwSVwPBG2QMF+L9t1UL9MXOEjRvLVqpnpiFOdMhe3VbRRkrbfh0v8D6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778527157; c=relaxed/simple;
	bh=bRtHKL8Ghq1igkZvpCdDlmBm9XyVW19EMHHP+BJzPeE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CC2mtUQ1Ml5H+p7vgf9NZg3Bsq8LavwMHYs8f381ocDRLYmYqe2cQmMNothrncdzYLcxcntp0TMQZyCyZAVv7SRe5GKGcuCvb5foVUCC49/ALoF2gEnpmfYgeP4socKGhzZeV5f4vX4iiYkDMEndpwzScjowt/95XlWMVbKEVx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YXG32A/X; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488ba840146so41893935e9.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 12:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778527154; x=1779131954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=POtlnulhl/F66NG/qN2X+H18Iihe7TwpdtVefEviDCE=;
        b=YXG32A/XZZ+8zSJWbfvSNysUE+YaEWVKjg4+GAc9udh5cmrHpZxFqesh2VXJ0bDvu1
         28LBjfkkZWhmsadbLmy5o48MglU2iHL6dnIYKkHZE8msCv3xuGSqj2fF4lyLCjCniAuw
         flvGlo/wuNsuzT6o0Z489bgskYG3ii/j49LV6R/cXgB3UT8wSAH30L+Wn4VKOTEmFT3L
         gYC7cgk9Fm8b/PHO+7dHLMghVhdKSP4W8PwOSKUWFiUpUBLzeh8SFuqG2BBQ2XWpF/tF
         lt3XLWPr1jQoYdaCsNRuxDc83nwKbc9vhMJxu06epaDQ9XV0WmV67nZsr1bHLF/WFmt3
         wznA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778527154; x=1779131954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=POtlnulhl/F66NG/qN2X+H18Iihe7TwpdtVefEviDCE=;
        b=e52qU75g1OV+rdbtmsyjkZTPO0ekX+6PIWuV7INW1tCxlJXGFd0raSRh/Y89SJ9Eqo
         PjMD6N0tjde810txGBJqLuvI9DEnGChCb4u+NxGdatZUApV1fQ0pd6mILFH0ZWYOLx5N
         FR49nBZ+jQfDa6HWR6HKB8SCFMhHVVufvPLI7dpkntyNri5qP54Ke/Z7lEnN92X8WjGx
         6QVtzZSqYzE/g6+/v5qOH3TJ9BPhMHHYbB7GzrCiYGSXf/HtkHhvzVfFLvFB8ChWyxNW
         GJXLR/COJGr2wzPitrhp7nqGHTTB5ZeDaGi0pZ86tWgbsSqAOlt+3cuEGIueMNL60S51
         6P8Q==
X-Gm-Message-State: AOJu0YzALCOjtqJIcCSXNFc1KAAo1E+Gnob0daQB8Jfa7CyCqCOfkazF
	ulhA5hIWYeimTOGtiW5jSvHTaQWbSIsqiVryYw292wuz+uR4I8YL6ikv
X-Gm-Gg: Acq92OEelVadGEe3o3yR1A933CEXL49YnVPeb3d20y11chURMfVV8WR1wXXLcqpIpsl
	ec8e4EbpLkE51Q/ENhz8YISwMYdEEyILG2D6iv0OdtftJkFbLy7vxrxq64Dh2UjgLSx4LCnw7m3
	yUGmBmBuFaxBIBctOL1r5hgA7BsBFKEAalr+D5g/f9F4ZEpcUe4maLmovylKJhCm4B9gKDqGI+7
	nq2fieRz+NvDya1K8OYGERB8Ik8lpzarFfBkYl57Bq36Tr7fkO1t7PopXyZ7fdm4hOxxuB3fDHn
	D/3D86ih8THfakMv+2G3Oz4/eY7/ruCQq5yyxP4zyxfP5Q15NFt3IIkneyPJ2rEKoA3qVxSm1QK
	tv9xX6LnmiCj2t6+Y8A6h4gOXJS4mCA2tVaWwqcjvW9tLGCsoco4FesKaq80B+NA89Vg1aOKPiw
	OZkoS5WcUPIlSR/g2FGTLgYWhA0aRWpplTqjiRUky1Jcyf/MyKf1mUQVwKm1cM91TvILCIQg50x
	9Fy76eJ+FvktiQ/mkH4UPy7DKn1BuBssYUnng==
X-Received: by 2002:a05:600c:1797:b0:48d:366:b962 with SMTP id 5b1f17b1804b1-48e51e0a8a8mr217354635e9.6.1778527154318;
        Mon, 11 May 2026 12:19:14 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e687:6094:b849:9886])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e7e45ff89sm150350725e9.8.2026.05.11.12.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 12:19:14 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 3/4] dt-bindings: clock: renesas,r9a09g077/87: Add LCDC_CLKD clock ID
Date: Mon, 11 May 2026 20:19:09 +0100
Message-ID: <20260511191910.1945705-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511191910.1945705-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260511191910.1945705-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2E7825151C9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32409-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FREEMAIL_TO(0.00)[glider.be,baylibre.com,kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-0.987];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:mid]
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add the LCDC clockd (LCDC_CLKD) definition for the Renesas RZ/T2H
(R9A09G077) and RZ/N2H (R9A09G087) SoCs. LCDC_CLKD is used as the
operating clock for LCDC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
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


