Return-Path: <linux-renesas-soc+bounces-29649-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPddO5OvuWkkMQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29649-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 20:46:27 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BE22B1AE5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 20:46:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 173173077CE4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 19:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DE10366059;
	Tue, 17 Mar 2026 19:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HO4jRT/W"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B83E34889A
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 19:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773776697; cv=none; b=m19t3A4Mvng1RtbTc9CW6/ImEvaSNAMY1J3Xna8aZ7zAvu7OnrGVtS90A1umQV253DHfjHGpotoBowIm+pKN3JcJJrfDDHXtaQtb2ll2LzK6ti7X5XFlzCtEj8ODhC/K2Ue0B0hUBE1gLwXlzYscVY/+id5c4dxU7PaY2tILCQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773776697; c=relaxed/simple;
	bh=V35ZSROqFHPsxUn0UQZAdtyz2COVANXh3RKNF/nXfG0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rfmX/MHHHxMNz9qmWLOTr/dIonKVlv5FwB9FlvT2jwO/aN41JzPDKG3JGS17f9lNwH38Q3u9qNgrP2+DcusG/a0PfB7MntNVarz8YkLsYCeKoz00U/3ZXyO1p/TsVUaYS8TGfDZE3f6vKhhKGrWx/2TiysBkXX9a+yuQUaWhYno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HO4jRT/W; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43b4f48c47cso774159f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 12:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773776694; x=1774381494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JfVd05T86E2iD7eB+6k5IuN6fQ/IOoAsLYVMqJWoOpE=;
        b=HO4jRT/WGaigRl1QPZIqVI/q+I4gE476GFjh+Krb48B8FREjYv6J8LlXw0SifQZWu4
         /WMv6Li3H/tB+d55HaGCJdGmfmvV0bGZZ1vBAuGp19lasld+Juv+Xd4cAGc8W13SCyuG
         1/FZLcIBIJmloRV1IushJHCgsvC9RIIjPmnz1GomsMXh6BZBBtLXsjmR7w93osNpjV2l
         g1WL0TpVKx/lrohl85YSpXpwFiaGIf1hD8VFQ6+RT82GsdZt/GHlADsxkgz5E0PwBsRT
         I4WNKE+WKXfP2Xjbf69jmkfGzSjWcNs42jJq+ezQ+PlIyVxBsM9ulep8153LHm0T7DX5
         vyMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773776694; x=1774381494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JfVd05T86E2iD7eB+6k5IuN6fQ/IOoAsLYVMqJWoOpE=;
        b=Qp4BbzbqSnhmfn2kSjHgI4amYrGeopp/U0TlG+GziqNqOzVmJVGnfZyqYOVcvT8nzk
         aFR3QTqjcC9iXV7pf8rF34WbHZcisOgOGmAccrOu7vwky19BzZ/67EJ6NDFYfi6CQSRw
         tlASrSHP6FYbtmLDrclEq4UMqGqp3bKL3/WAn4NquDc9o1mCInl2kjIbSYuee5KdcWSW
         qg/CesVkVDC9M6Gl19CCL41ErIgV4cmlj7XbqmBwcTTGIAKm67RjJoBcZV6Fu6uoiSF4
         bRD3eaRe9crAVAcD/2GJrH7IscZc0UroOIlUShJxF3y0PNjGBespVHmzq5YgwACI54wj
         4SkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdXGKkK9Hdj+iVhtjQXY5k3SyfYjc+iKCq5akQK3zmFNJau5XXqFT9iBCkTq3Zag5/TTolp/ZRZW2C3s1+hDbN3g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl8O5Iy9Usnn38wtQbuHpsKP2VjKH2wQdimJYLDvq0SnKkJXGV
	mMKesyuoSkn+93WAY01hyds1+G3wgpSIW0StEgz9vOkZLZKr8i8j/IWe
X-Gm-Gg: ATEYQzyxuMR0IMm+FAEpExm1Bgo3RcSD/bnCO439kCuVZBsSbTr6z58PnlRqvPGJ1hL
	R9tnwW7B8QU16fjXkgMssOaT9DPjpTjF2T325eXOVFK4ZzXbHeFoIYOelN9WvR+JAjL+0/xieZ3
	9JVd/pE+umKj+g6VG4GLoS/mSzuTy7yWmtPjwWnPXN/gUFe0CfclBgNDNLdtifBgDWgsJGuLyMc
	H+Kd8r+y6k2B9NGgkAtQii1iUtaGC5LKWyzuBlqOp75cRH3tul8h/sM9ZFChGuXwGT820LN9UTY
	PYLtyHIoNl38gPsIvcvUPPSgTYuumyOfV8FC2btjQKyL7akKZ13nGpeGDAy0eAPD4LEPcuUtlCS
	drPudhLPtYH6SJEUuV5j6PZfqxci/XnsCNqj76LmtX75vBuZ1vQLIq8pn7zehg0OBShopxCd5Nc
	wtZnfoWp5X9OZ4JmYQK24d4z9ciQbUt3jNREvR+Lz1lEyjJSzm
X-Received: by 2002:a5d:5f43:0:b0:439:ca85:8848 with SMTP id ffacd0b85a97d-43b527aa344mr866732f8f.16.1773776693644;
        Tue, 17 Mar 2026 12:44:53 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:e16b:fc56:e220:9aa9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51892161sm1788235f8f.21.2026.03.17.12.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 12:44:53 -0700 (PDT)
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
Subject: [PATCH v4 7/9] arm64: dts: renesas: Add initial support for RZ/G3L SMARC SoM
Date: Tue, 17 Mar 2026 19:44:34 +0000
Message-ID: <20260317194442.468147-8-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317194442.468147-1-biju.das.jz@bp.renesas.com>
References: <20260317194442.468147-1-biju.das.jz@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-29649-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,2.220.108.0:email,glider.be:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 75BE22B1AE5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Add initial support for the RZ/G3L SMARC SoM with 2GB memory and
extal clk.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Collected the tag.
v2->v3:
 * No change.
v1->v2:
 * Dropped gpio.h header file.
---
 .../boot/dts/renesas/rzg3l-smarc-som.dtsi     | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi

diff --git a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
new file mode 100644
index 000000000000..7c21afaee9bc
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for R9A08G046L48 SMARC SoM board.
+ *
+ * Copyright (C) 2026 Renesas Electronics Corp.
+ */
+
+/ {
+	compatible = "renesas,rzg3l-smarcm", "renesas,r9a08g046l48", "renesas,r9a08g046";
+
+	memory@48000000 {
+		device_type = "memory";
+		/* First 128MB is reserved for secure area. */
+		reg = <0x0 0x48000000 0x0 0x78000000>;
+	};
+};
+
+&extal_clk {
+	clock-frequency = <24000000>;
+};
-- 
2.43.0


