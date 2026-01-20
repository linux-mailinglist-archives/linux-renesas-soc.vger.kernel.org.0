Return-Path: <linux-renesas-soc+bounces-27113-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKMuMXE0cGkSXAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27113-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 03:05:37 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6384F7B0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 03:05:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A885C6A8990
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 12:57:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09827438FE3;
	Tue, 20 Jan 2026 12:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OROD/HBG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F08428493
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jan 2026 12:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768913566; cv=none; b=YpfxYA+a2tgBvmSOCeMNsALdFHwm/Bgd1C9cgPNsGhSjLqxTRxag0KL/M1eQsQ0zZNcpS0/V1s1hZg8f2qqQxiSf9RLRoMFUQas4NMHuAyVwKsPW92E2szibzDSj08dl+qaoEK++Z+X7oqj9rLyA2TTx84JkPeaI0saK8wTxIZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768913566; c=relaxed/simple;
	bh=izsX6CtnNHyR6i+t5+0Flk/d0jAFwDHEjNWCnwK2bs8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qAemppn4kKk5mrtCcL8jaiBDslcwcRlwu4VzZNs3OKmkQztEFWOj8F9U56QRlbZYu9wuilAxUy042X3TCUj3Htndqlsq7sHcIVgH2HKMLdJWzAa7dJWzbPH9oPyRCtxsTDagBqgqAsO40ixoG61EakL/+fB2I86PfUGIxG2K8/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OROD/HBG; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b876bf5277dso953850066b.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jan 2026 04:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768913561; x=1769518361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PH5B0uMIT9kq/8OwAAqfy6tuQNPg7xcJJFrKzLoPvsk=;
        b=OROD/HBGqQI8hG9+clpFFYdl4wAtDbMpH0eKAdnKGSiYVoV4q8d0mjMUndLdTeRYTA
         R191b5rMbjyjTMm5tS2suzO35C76xHQ4kudN3tPVbURTwPUxGNsqLuwJ5INnVKVrMm1L
         KTiLYx0fhchXZk1pr5TJvQ3U4BeginFepwi8TDxlje4WnhLEOKNao8JAc/2L7d6vjoDP
         0ga2oM6ZR5x2L9iZQ3Av1YWNAVh4S8K/k2Akj1xmfZwJKgnZ8yy9FzRZS3ImYU+Vdust
         WUVOVJTojXhuW2LaMunnCEF51GnY2faxsm8WQx/voANtvnDUgH9ovJy64bju1vqqC08o
         cqKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768913561; x=1769518361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PH5B0uMIT9kq/8OwAAqfy6tuQNPg7xcJJFrKzLoPvsk=;
        b=irw5RdKNSjOcz0p2HoCWMJlwyHOLRGAy2PH+R+Fpbi+PWtBxMBXdUDusGGaHkjkpQe
         lMTXcA4grunhVR5VunJ5hNiXsx1wn5m9kNDbMQulK9RXmQFqy6nV3URyqUuls//vrOYX
         Z1BHtQD6KEc7SU/6Y7lDG6+PGsaKN5brEQ9SRoYqRqtGCxWw6hW6ErDUNntIrH8x5nuO
         CC3+IGoF+Q89SvpqWuSWTfsxr1NicYtj0rdgnpVOQVMrRR+F+PyuJI/ZlO8sJfxBQ/F9
         vQJKejiFEaYz644dLOFrln7+t8cGGv5X34GwhBx4r4UTPnwkH9ixe+RyyJytE79izjzp
         4TyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQ0HpfSoc7hdTLbynVNqaScHrPUZY3hVN1x+u8sja0erNHjg0eD12Gad3KQSBt4XAcBsh30ibQv5ZRiMBJraSq5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6kNo5N8GQ4V1hxRX4CGzJKs1zm7tNbflmuC8AZ4Ipl+E78prx
	d3GXXKPtzz1PYGTgcaWyP02tRWHxPMl39AUntkvPUE9CNAYkRwsdrKVg
X-Gm-Gg: AZuq6aJu/1YUfxTjYmiG46qucwEuWzTTxguYCcSK4Ez9zSs75TAqS4F8R+J0W/vrH0k
	0g7DGiBVyVPdfQUHmwdZv/CsHhTuq1R8ObsooDK+O0sGC5McPoswUVF60otT6OnH7DdcamDuiN3
	qUgpgFCRAVncEQbwZtHr72vM5HkMGi7Cj/mpMk6Jvo5vuU16AnoD0XHHiIc8KvnzuZBQMgi8WQ6
	NBRtVW/4RsTtPtgxE8s3ZgrG5+SUxxMvHQIL0LekbH6fkbiSSolyAhswUPexPewEaj+mykk1unx
	K4aN47kpgL02BQrD12vyRo0mS8kFG6Koe2tfM7pBlINycr8GE3L3m+mVkjSlhVYPulw0oTtkUKR
	PgE7pmBIEnXv1PyxQFH2nlW2xysVjvslKetApsczcxiWXpaLtUfxpqwLx7VHhtCWRAWdF1oDOht
	r5mKjP9wcxFRBtCkbyDDOOSPe9w7vJdeFPz2rj/JN8fT2bKg==
X-Received: by 2002:a17:907:948d:b0:b3a:8070:e269 with SMTP id a640c23a62f3a-b879389056fmr1541252866b.14.1768913561315;
        Tue, 20 Jan 2026 04:52:41 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:c8c7:2ef6:8ac5:5556])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959ca32esm1420626066b.41.2026.01.20.04.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 04:52:41 -0800 (PST)
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
Subject: [PATCH 10/12] arm64: dts: renesas: Add initial support for RZ/G3L SMARC SoM
Date: Tue, 20 Jan 2026 12:52:21 +0000
Message-ID: <20260120125232.349708-11-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120125232.349708-1-biju.das.jz@bp.renesas.com>
References: <20260120125232.349708-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-27113-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,bp.renesas.com:mid,2.220.108.0:email,renesas.com:email]
X-Rspamd-Queue-Id: 6E6384F7B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Add initial support for the RZ/G3L SMARC SoM with 2GB memory and
extal clk.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../boot/dts/renesas/rzg3l-smarc-som.dtsi     | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi

diff --git a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
new file mode 100644
index 000000000000..7a3a2d4ab037
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for R9A08G046L48 SMARC SoM board.
+ *
+ * Copyright (C) 2026 Renesas Electronics Corp.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
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


