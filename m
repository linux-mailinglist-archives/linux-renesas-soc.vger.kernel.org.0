Return-Path: <linux-renesas-soc+bounces-29736-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJvvChJnumklWAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29736-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 09:49:22 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D06F2B867F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 09:49:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 726703138E5E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 08:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2BF339280A;
	Wed, 18 Mar 2026 08:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gU7FjXAw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8661838E5DC
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 08:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773823329; cv=none; b=ZoB6UfFv9rpaumLJ3DkWfmIwQPf8kDq/J+e7au0VV8FoiCnt6Ftbb+oltqtmFkXckRd0zPMoY8rbCABIdrHjNBt0vD8/cGfUTBBke6KZTOa7k66qL65v5pmdRfhA0+dmgWpUst3EmIZWfESEUTb33lrbGx9MXS6q9xHjP3XeQWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773823329; c=relaxed/simple;
	bh=v/4pXzfrMekCSee8LoPFnpQW1sLesFiLPSHuI/JEsUs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jtc0ulAPHRM5T0ghcjqOwor3ZDa07JfogzdCm35FQRJxVDQC45rd13Oiwq30qmWKas//Uu+nMAF2MNM8N3cQ914RwV9uexMqz66VOySsOME2uBhbMyROBpRChkStgZuG2IqyqUMWNODsOA6YKyAvwytIACrrqx786b7pTtDP1wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gU7FjXAw; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48540d21f7dso74356775e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 01:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773823322; x=1774428122; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QlHbm+I98Cyq3VfQV71dGE0kQOlAKXEz5oT7P42Vvs8=;
        b=gU7FjXAw1dIjjOKtDRjNR0sB+I0+uPEqjF+8Iv9z9AFLMhL9Co09pXdHMHJiFWrzgf
         B9UyLRqnsE9802eLA4zovts1pnVIPhrSmaV1nLpvL6TzFdWu2NPu37+CdlDA7Sv/Qp6s
         PEidWMmrbnl6kv+eIpnjgSL1okpn/DjjVM+yRrEuBfLXxmqlGch8938kM3Q0+gIJpVBY
         GE875znzKqWND7MntOg0rwXw+DBJCyWJV1Y0mf9LTVbupUPzxst9UyvaTb8r/yOuqoMa
         0UuWVuq5OGXa1vur/m8AJqDozxTH93orEJ/DLmOo+aFQk8WR+Bk4ssn1Jwu1RaGRPzif
         izZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773823322; x=1774428122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QlHbm+I98Cyq3VfQV71dGE0kQOlAKXEz5oT7P42Vvs8=;
        b=jt6sSBjnB4UjGHNKQ7RJxoDTRKgor63fQvNIKB2EqqSjsJ8hMBtzA/toUsu0kD29y5
         w/RtsDWkzi90i9KKXzT+a+G55suufyDHYNmKHSTujCjNqNb9u91qgONN/yclZhqder27
         PC6pGYrTAwc/JG2Ac31Mjj7YwLxSDh7cyw9Yz7r3dveR0roza+bAbRJgk5C0Y7Zghw07
         vONOlC3w4Y0uqQ5w61zRqJSQFmnaQmsv1FLjSL77lLRANw1KOXhkoz6VZeR0N+yCUH5Y
         xoNfOGJL2k88hfyz8/IG9wIbVc2mqlyK9lYdcdRqe0Ccp336DiNbQyjSe1fqZcidC06N
         V8Dw==
X-Forwarded-Encrypted: i=1; AJvYcCUN6PEugAm6L4utUFi6BE0BbtfFCJ2vIj0N+fDADcqJGDEfWOlHD/asiEW/rV+i7+cwaHyNYvcfMa9gFSx1DuO95A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMlPH1S0xL0wSIRy+WVQ/dGMk+gsfwVLTZo08lXR3gd7H2GCbj
	eVm2fGzrSRSjgP6jPXYYqIxIsxFYcOjDzFCc4N9V3ZG89TmaccaAFEkf
X-Gm-Gg: ATEYQzx+lbQAAa4sjz5Hakhbd/Hgwm80ZNfBsIOWNY+mwKxYBVgtFfxoBjBbj6w4/cQ
	Xv0oI+0AUbL8Kb8YloowPPtM62pWPiTRIn8MkXdOt8qSlTGJR/Wlezjj7toQj/NkS8zAoFuP2HB
	u4YvrXgmoc94XhfqjqhQmcghY1xj/B1hrofFZTmEY+ElrjL9qfXu/t6p1N6anOy46hoUG173DCn
	rlAXkG2/etVz0UwWnOVJ4nGcMbLKHsUmE7tUqwM4NBedJgMSP9/+GahxzexGpPG/AP4pVlIbC1b
	BTP/mzvFFftDM+v9qnjgAnH3fYjNzaXeEMuLqxG6F/25g5C/Q1JiNZNwZoBEavN+d+Z5VXgeLEL
	AtT8IKC8gt+fyDxWqqo7Lh6vpiRRJ83nKhe7IuhyBJhrGIX4JWS6aRPfJssub44ZySpG8W+LUAh
	wmflOPPc1iR2wBB2S4EwoZetcqYz5NDcf/HEVDdXfAe3s3qwG9dBbC17qy5/0=
X-Received: by 2002:a05:600c:1d0c:b0:485:2ce2:4c8a with SMTP id 5b1f17b1804b1-486f442df40mr41300785e9.1.1773823321468;
        Wed, 18 Mar 2026 01:42:01 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:d643:4385:f93a:2085])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b5184961csm6389350f8f.6.2026.03.18.01.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 01:42:00 -0700 (PDT)
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
Subject: [PATCH v5 7/9] arm64: dts: renesas: Add initial support for RZ/G3L SMARC SoM
Date: Wed, 18 Mar 2026 08:41:42 +0000
Message-ID: <20260318084151.122674-8-biju.das.jz@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-29736-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,2.220.108.0:email]
X-Rspamd-Queue-Id: 7D06F2B867F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Add initial support for the RZ/G3L SMARC SoM with 2GB memory and
extal clk.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * No change
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


