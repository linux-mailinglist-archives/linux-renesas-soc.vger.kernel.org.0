Return-Path: <linux-renesas-soc+bounces-27595-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIhHM8Q0e2lJCQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27595-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 11:21:56 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F542AE927
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 11:21:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1CD17307F962
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 10:17:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CF7D36F43B;
	Thu, 29 Jan 2026 10:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E4OwQLz6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC65D22A7E4
	for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Jan 2026 10:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769681821; cv=none; b=tM2XJbc8R+zE+DuMPYvLMEbEH9VIONJb4l4nLY2dtqgBJaQPTh1Ss6QooLoPUS2SQAY3rom8jmNvFq6SN1zqhZ01hjsZ+0qZKILQhKLHsao4dL1fYQT2HC/NnZhJQ4cWUEq4EvVBVzGMzC7u5oQQDohxH/x6r0hmhWtGXvxFCR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769681821; c=relaxed/simple;
	bh=v6FdTaM3/9S+cgZOR/jP9oZ2cYA4WGpZsxblMxIWwD4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GKFv39lNV9Jh2FwD+Cdq7DxDzlpgoFtvy2KxFKMZw78ut7pnub00avNTd9uZyTm1Jrr/hHsFUQUe9hCaOCapOfstuAOb26N3Ap9fRsdQuZBPx1/ydgSSPlTtmZQhUouBpAf+9Vve3kymjALYAwimtDwT+1geUmJNaY/OzOqWk8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E4OwQLz6; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4801eb2c0a5so7394615e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Jan 2026 02:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769681815; x=1770286615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yxb+xzLrz5vUgOO6D/hBhQgk8cWp111oMhH2v5GHUEo=;
        b=E4OwQLz6pVC+lt8Km7jfqv4sY5gYqqp4NjT/S3YpYZSCa9irLmoW2q5UeZ/NEeQwGg
         mYryTs0i54Q4kBxSt/quLpMYQ5K0nOhIfZq1zPD/7ZFoR3peeSceT9OodiPNBHUE27Sc
         L967OHZG2ru3E/qzk2Hx1J3nwT8IR6rmSRhgzymxroRTSIOtbfQJ5KIc+gCUFpYehtP4
         0gUov2XvhgVgQuG2C5oyG1K+o+aIZ0SdiSfLaingRu49mu/SEjZzYkcAnkKVu1WUjzDp
         M0ez2/D9qRxJZEAg4YklR6wgSx8wGfoC8XQZV1TCUK6SkNzBzXj7iMGlcUx9oD17ekqe
         S5sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769681815; x=1770286615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yxb+xzLrz5vUgOO6D/hBhQgk8cWp111oMhH2v5GHUEo=;
        b=QCwWIs1RXEWOUK1x5P6T7KWJrTfKMBt4ROSsLiWj+VuI0KZzW4SgIqyBbNvQ8OjEZZ
         WbvtemoaE5gP5Ib3Sxx4j5b0XsioFVJ44L3xDokj3jSIpU5VXuwPzp/LKAUPtwEt2sK2
         dllPQUvKSgms1nEtWVfuUOusLDdpe99W4YLImjym2jDnYUVfhDVSpaDMNDtEk6mET75R
         mV7qV7SMmNelY2nimb9lsNhGp3Kk2VM9EzzG1IWSFKUekM31mzluBh15miTdOgTPHi7v
         a16TOZsboH0h2Oy+xAy7RHTpI8rXIJnG8/lObOqiA4x+RWEZpJyTMo0eM29Wpcfk1dOk
         vU3g==
X-Gm-Message-State: AOJu0YyVj9ABd4zQtW1WeJ+oRgORhEn0w5PHf46A4cwGxxHLTH8uOlVq
	+IAHae+Hr6qwF7tw+j1QCIx+6SomMpl/FcXG2BSLCiFIJFi4lDI80Gq2
X-Gm-Gg: AZuq6aLSF0D8CWVzP5vVbtAuODXzwJsARYVjW8Tt4bOcA1AqOHhiGKhjPTfFQDTmg8Y
	xzd0ulIRfj0SxASDiSn+9RcDm90pPzehxrR9iqBqzsMm+tvryFGKB2TB6I+vBcacGQmUiZxhNAk
	9FnmLA0zYbV2wX3RFW6Yeo53yQG2hxgBi+23/1FG5AuOtrEs1eWZy0HpGtlGEBuHYeqgnRkRxkM
	SyqVMqTmsF6DMZFw0nt7GqgXMH+oEzzwjsh70x/2JM2WFTeLfWWnzfOfYTdHkVs+ZpKEJtXxXPV
	4P+gBb/aSHTidLJ8c3xJS8ZQlNnAVHQLdLP1eYicQEbpFfyIy/+hvFbVX2ADMCXt3/4HEmBDuBP
	AwYmfIuOMQ/6pSvhEh1bhdLqil0v19t3DLHchvX9gp8Q3MFdCfHK2RbPUQkf8H6dwDXbdlBOztX
	e9/Y/1mBW0Buyc6q3J
X-Received: by 2002:a05:600c:8211:b0:480:4c45:aff5 with SMTP id 5b1f17b1804b1-48069c755e6mr91237235e9.34.1769681815107;
        Thu, 29 Jan 2026 02:16:55 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:5792:2065:403:a80b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066be77b5sm178642065e9.2.2026.01.29.02.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 02:16:54 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: biju.das.au@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH RESEND 7/9] arm64: dts: renesas: r9a08g046: Add pincontrol node
Date: Thu, 29 Jan 2026 10:16:42 +0000
Message-ID: <286fcc0754de31969e0d856a075b9de97b28ed86.1769681553.git.biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1769681553.git.biju.das.jz@bp.renesas.com>
References: <cover.1769681553.git.biju.das.jz@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-27595-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,glider.be,kernel.org,gmail.com,baylibre.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,0.168.77.240:email,0.168.38.224:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.180.91.224:email]
X-Rspamd-Queue-Id: 6F542AE927
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

Add pincontrol node to RZ/G3L ("R9A08G046") SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index 231b118ecc62..c6b042ac9c36 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -181,9 +181,19 @@ sysc: system-controller@11020000 {
 		};
 
 		pinctrl: pinctrl@11030000 {
+			compatible = "renesas,r9a08g046-pinctrl";
 			reg = <0 0x11030000 0 0x10000>;
 			gpio-controller;
 			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 0 232>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			clocks = <&cpg CPG_MOD R9A08G046_GPIO_HCLK>;
+			power-domains = <&cpg>;
+			resets = <&cpg R9A08G046_GPIO_RSTN>,
+				 <&cpg R9A08G046_GPIO_PORT_RESETN>,
+				 <&cpg R9A08G046_GPIO_SPARE_RESETN>;
+			reset-names = "rstn", "port", "spare";
 		};
 
 		dmac: dma-controller@11820000 {
-- 
2.43.0


