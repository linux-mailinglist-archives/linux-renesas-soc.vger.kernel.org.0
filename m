Return-Path: <linux-renesas-soc+bounces-30003-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mE8bL8ImvWmr6wIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30003-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 11:51:46 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 388B22D9195
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 11:51:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F19063061CD2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 10:50:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 167F939BFED;
	Fri, 20 Mar 2026 10:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c2mdK1gY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C177399024
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2026 10:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774003805; cv=none; b=WsgoFaC4YoBdSgGSZsfXlJTuxGlyLvOA0ND9rIUPeNIZwnyLnrgvwb2UJv1xo6p+adR0mRJZtYw18+JX5+vtVk/YaBVgtcpURN+2rz1Px504P33bjn8zQSWN5kt5qE6A/IQIf87xZpIhZMUr1h6fHPpUPMQ86tO5dmjEZIDCudo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774003805; c=relaxed/simple;
	bh=lUF2Jqf0gYMvUtENXHw89bSUP7GP4cOx7g5VFrg9m3I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VQ5Vt7YVQjhfGcrJRNd+ppQxspnCeavej8Al3YjzTzuBRVrT0baxAVbePgeciKisYQGtAxbYi4ejST9THhI+kz0LydRUM3d9/PR6SRfHKBfHHYgIxHmCXxO51JTDibqFq7JJUOPePRjy+XKrTWXPT/ADYm/Xebt7UiE+bNW90wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c2mdK1gY; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-439b2965d4bso344604f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2026 03:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774003798; x=1774608598; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LAC+GCqzsUO6cgBpnnDjaZ8vnx7qSKM8d1+qGYeOoSM=;
        b=c2mdK1gY9uHa3kMNdHopuLVC2I/gOiumSexNA0DU1ZK9Vzptk3DcXmiaLIfLjLnOJL
         O0AeTmaPMP1sr5pESr/Zb+ItTRMdabXNZ8j5qV2z08hsusBP/qqguY1/ZgCK3DTFge4Q
         RAcImIjmx9mQk62Hsn4bzCpKpqt3LID4WrKRJ/t1XSXv9c5fzkE0b9utco2rjW4UOXfi
         kbfwAby6qJ9cZronQ+zUxlM6MXZCaVvX7e8ZrqU/d1Cddt7i2LmLAT1pVksRp1bVyfaI
         zPTl6Ouaa8K2h0Lw9tdy5ASYySgV5yD7/nPwmUYJ7WpOyPTgejWU5ZZjKxrXVMN60d0D
         nv6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774003798; x=1774608598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LAC+GCqzsUO6cgBpnnDjaZ8vnx7qSKM8d1+qGYeOoSM=;
        b=GRSqYW9auaJ0i09ESYC8aVkNeRwEA1kFUQmg4XU9q03e/tvX0AmNx6skNaeXkseM/l
         xojtNcsSHGJ7evl/Xenc3zLw3kc4KJICoPoexMzVI19lTQtKjwxfjyHtKrkpR9HlOZq4
         x8xTNHSVURJmHuDmb7DmUh2A7Gadx/KDq/LkX5yWhDwFrlHnrcW6ITfFuUuMYHDGljwY
         7EOM96BoWq0799U8ACiHu4mqHEWwGytggUB0/AKrabEtBAq/krHitPDVFJnw3U5JJjjp
         soUor4uKa/WfA/HNTK1nxUimqTvzILfJeyyD0fVaBuk1B5YB5FQyj/wMCi5J5xXFsnOr
         Cd+g==
X-Forwarded-Encrypted: i=1; AJvYcCW0fEBh2K5c7lXSJGJHa1hXMUur1ED31d3f1++t+Lio7NyB4rrjOG1LfGaWS0inQFFjJ4Z+QdrAhNmpDANP3jOCbA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcEZ2AVQ+AfFJL+vYTqmAp4Go9rO2LHyuyr/EqLqPS68q6lb7M
	1GtZngJkl1c4MhsYjfHTim575V6E7kO2DQ+x5mxcqAyJdwljPoat+flW
X-Gm-Gg: ATEYQzxYw/MHsQ+gElUw+rHvIZ7h/J+DectC4/heb/sfh6rN3fSCHkkRUqxGE8Mqt6Z
	4HMWqDEUizflr4V9sATF0M17EVt4NRdEOselx+lNRg6+OOQTu7xStf6yPEurN3CTX63TtJc9dw4
	ZSTh4b4dXzCZ6LnmHkFvWH/jKfFM4BHEqDoQao+q/OTE+f6pLiWUM1Hj9HTW0oKpQBdlE/L10NP
	0CuEen1zR4F7Gf9TSC2r5WDEDbY9a3FFBvjDqrHBpu+xx49Z1MG1vQ1PYJ8fXHUI5wjf4F0UrGG
	ZcvVqsHc3kCtpgUx+YNNwBk73N31AEC3rN6dZmliSifw2hi8NjwI2j2Yom+QoggSFsu402TJV7j
	U+qw4k/WwcGm+K/pKClSnTFyePJ4nGLhZJjcxPJBvBOFnmI2/VfxTevhOTDl6QwagkChY79ZgA+
	rSg68kAnfcjIlrkEeZNrmzh7ygu32hk7E=
X-Received: by 2002:a05:6000:2c0e:b0:43b:410d:c4b2 with SMTP id ffacd0b85a97d-43b6427d238mr4522308f8f.29.1774003797984;
        Fri, 20 Mar 2026 03:49:57 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:5b93:d2b1:bc5c:9231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644ae619sm6203062f8f.5.2026.03.20.03.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 03:49:57 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v7 09/10] arm64: dts: renesas: renesas-smarc2: Move usb3 nodes to board DTS
Date: Fri, 20 Mar 2026 10:49:43 +0000
Message-ID: <20260320104950.42220-10-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260320104950.42220-1-biju.das.jz@bp.renesas.com>
References: <20260320104950.42220-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30003-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.961];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,glider.be:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 388B22D9195
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

The SMARC2 board DTSI is common to multiple SoCs. Move the USB3 nodes to
the board DTS, as some SoCs (e.g. RZ/G3{S,L}) do not support USB3.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v6->v7:
 * No change
v5->v6:
 * No change
v4->v5:
 * No change
v3->v4:
 * Updated commit description
 * Collected the tag
v2->v3:
 * No change
v1->v2:
 * No change
---
 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts | 6 ++++++
 arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi    | 8 --------
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
index 1ba50512f4ef..9e66f2179807 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
@@ -264,7 +264,13 @@ &sdhi1 {
 	vqmmc-supply = <&vqmmc_sd1_pvdd>;
 };
 
+&usb3_phy {
+	status = "okay";
+};
+
 &xhci {
 	pinctrl-0 = <&usb3_pins>;
 	pinctrl-names = "default";
+
+	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
index e2a34577a1a1..696a933af808 100644
--- a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
+++ b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
@@ -111,11 +111,3 @@ &sdhi1 {
 
 	status = "okay";
 };
-
-&usb3_phy {
-	status = "okay";
-};
-
-&xhci {
-	status = "okay";
-};
-- 
2.43.0


