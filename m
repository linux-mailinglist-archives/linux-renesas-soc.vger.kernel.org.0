Return-Path: <linux-renesas-soc+bounces-29737-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4G9zLRRnumnnWAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29737-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 09:49:24 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C202B86A6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 09:49:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0DD453157493
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 08:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1DB638F24D;
	Wed, 18 Mar 2026 08:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KKxqo56/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6551838F223
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 08:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773823330; cv=none; b=FiLP+j7OZ0j8APvuX76/a5YlKHXgrMXIVhoc77b/pmD3CyM5JkHXDJuh93ogFXfOdAGfsBq2dedU14QotAHq0ef/jZKLX0tDMkM1BzadAd0xBuvdj6fL0XsLV0S5yTkWq4Zy0xW4ZCLzEb+nqgMw1b9rni0SEkdg/QwavtgvCb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773823330; c=relaxed/simple;
	bh=wbA039UCsYa08sITTRO9QFA+3yS8Mc/n5hbUqkI0bd0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uk6ryw7rqvc1HJof/nQa+JdygEmBmTYOtOK69KuODNqEj/iuN5bx1RW41p5JgM1wEYj0rns0DN4T65Wth522arMpA0h9yTqs1v4M5N7W+CxCpEA1FSAbJFTNELWBnesAMDzpu0muDxn6ydeP3Ho+8Evkorg0x28cZGGYtDt1iO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KKxqo56/; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso56332065e9.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 01:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773823323; x=1774428123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0KopvcsoMbI+TYFAx+ful2vEATKS7wTJcITfhebXYt4=;
        b=KKxqo56/q9Fdp9bpzBZIocVR/aZN6g4VxiF5kpNBSwoP4sV4O+tH0+Te6x7dzKFN2f
         2W79uOL8JpRxUUfK96jD/EKTZoKLe60awX3KkqXyxPvvXUbgaxbJ6vOSKB+f3xNsLmld
         fPFiSDBhGe2VrhEPDupAD0IMHo7l+yeObgXsdOmksDgvo9BJrZhTBBHA1uDgkscQ4eiq
         y1NyTJpc5E2j++lAVVC1q03YC4A5DvG4tqDQj6GKGDRcjOg7/PG7/ZE9Bzu2JDMH51s3
         /mqKQO6QRCj0HeIID93IzMoYlS6V7CB0ZCDrgyZrniCxHUR72D8S+1uZRyw/LoUW9zOi
         ArsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773823323; x=1774428123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0KopvcsoMbI+TYFAx+ful2vEATKS7wTJcITfhebXYt4=;
        b=lPS1+zexcfSmY309Emni8s7+sXP1BAum8alG8DaoYcvunXGvw08IQQUI+sDTdVLdk2
         vC46ZvEwgp8S53uI0f7HfCgz5u6nJG5BO9e5rWce3JjeCDIseobG121eylZm9HviGOM4
         b1VFu4lR5zA0HuUmB3phgJ6yJIMswkzAMBr7+IfCgAPgkmQwuPbfdCYQ83pmIhv7tCuf
         TWr7p07/pihkuHF2ks/uKaWpg3yzdCJXW0ggdMGW0wtykJBZYdI1HRRqfc1/CQ3iyOXG
         vYAt7JUojaYc9OLQW0kOcj6BaxF9RGrkenbQ1SYTH67FqXj/uyarvt5bVuNJgthTEiZb
         xYLA==
X-Forwarded-Encrypted: i=1; AJvYcCXc9qIS9390mtIl4BxOjaZKuTEeN2LGZQnBVqyDnRCokmEECEOK1mhyOGe53Enek2pVAyCVhO1+pDByABPEvpsSEA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwG2vtXcYBBDOG35O6/6FrOXgaZfkSruuTIwZfDn36G3P8zH0NA
	ljGx8R5wm9JH4BpQULjMlyDUv79zkqGgVUd2SgapAOss+aTCUGk+auge
X-Gm-Gg: ATEYQzywfSnOewOaVNnaePU9ABa10mEjrWkS6/GuQzLWuDUoBviab9KaPontfbot/5U
	061P+H48G+K9QbVez28t07QEQPfkJKF6rlvVRqfVb8/cMXFfI7g6kSqXT64LJHHPY9f9e+r2eg9
	Z07APMew5jXlhyHTUFcmhpBPchbvM325UeeAG774sTlWUawq7eJ93AGPa7qj15gqEScTYMTkRX6
	XUpaUs3kC5KLwgcIsVJ7IfZWWUyzr+1hazmVUfc1VZmJuzY0oZu64HnMtIYe7JOvD9+Lg+0UMUv
	o/RJhJWnTF4TSm5dxgR9MFHV3qsGWUcOc1sBoNcGzEh8aD1S8HAZC/RTfY8ZJ8L+5rV37lMJUuu
	W/aiO+P8EzTKkgKdPc4gipQGB3wBjwZnmqaSrUHXxUowB2n73yaHOaV4d75IVi7GfM3lc4Vcn1s
	T2xJnGdOKBXE/zq43r9RzTRkJTJIeYFUHLx+6FMQ7VHRJTiI3F
X-Received: by 2002:a05:600c:630a:b0:485:5574:8ccc with SMTP id 5b1f17b1804b1-486f445122amr39667205e9.13.1773823322358;
        Wed, 18 Mar 2026 01:42:02 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:d643:4385:f93a:2085])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b5184961csm6389350f8f.6.2026.03.18.01.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 01:42:02 -0700 (PDT)
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
Subject: [PATCH v5 8/9] arm64: dts: renesas: renesas-smarc2: Move usb3 nodes to board DTS
Date: Wed, 18 Mar 2026 08:41:43 +0000
Message-ID: <20260318084151.122674-9-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260318084151.122674-1-biju.das.jz@bp.renesas.com>
References: <20260318084151.122674-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29737-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 64C202B86A6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

The SMARC2 board DTSI is common to multiple SoCs. Move the USB3 nodes to
the board DTS, as some SoCs (e.g. RZ/G3{S,L}) do not support USB3.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
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


