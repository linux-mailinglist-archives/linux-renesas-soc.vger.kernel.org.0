Return-Path: <linux-renesas-soc+bounces-30000-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBxUJHAmvWmr6wIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30000-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 11:50:24 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B582D908A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 11:50:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3612B301A2FD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 10:50:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFB703876B9;
	Fri, 20 Mar 2026 10:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BohSV/yW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE143988FF
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2026 10:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774003803; cv=none; b=Q+IxgoE2GFYVsoKIWTKLoLpl/SR1YLI9qGBpNRWi1Zd+aGdgi4lOBsyUCp25VJ7GC4QTJGPnQNrwUsH44RwnLpOPP2YFgZoIt9yNJ56cEkvRHbqjveCkulPvgoHbCd648pB2p+dnOeR3C+84ivufwAPuU2Dbjp6OG0gnC6HptjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774003803; c=relaxed/simple;
	bh=D2LAZiaCzjAqA8MVAC20lKcg9/hhLVdc6VrVZlNb/J0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ps0uniigQK6aj4CzaMRFEQn0un1gpl9ZkQj4Nu3sD8Q2lxo1VyHb3p0r5Zc92AtuPL2JkecnWM6BxN5DizCGPJ9gRenCZOxV66WBKq7bS5XX+0MQYULBeemDr2NgBkQD1c1qhW4/yZFlb+9yGe5XQfd+FP6bYK0mOiVxuyO+kgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BohSV/yW; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43b44c0bcdbso1639535f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2026 03:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774003797; x=1774608597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GpksDKQgAp4PIeZFTolWKLEW3lYUJh5RtT8AQ7UhmHM=;
        b=BohSV/yW2s8GOehPDwFU3xB05RVFPA6jsO0VRCdEKtMxF2+RfEfNNWTLiFuLagKTHt
         zPQlvPN+GZiC9LbaYWB1xwmKZW411bAVjKIcJciOR6f4yToYyaxTVvPE9R4WtEFJDuLf
         LlC+Dsmo/tC6HelhJ+Q/hLbnOm3DljWHMj9O2hthYPmzsXVTGsu/KHvzyFHlijebrkPv
         HhwyzGvmNAmhi0khK+sW5Mh4UbbMW9+E/qul0UeS96KM1555xN+X7UkkILCWougkrLgo
         VvvBy/i5nJu5RVk8xPpmzzv+MsEYf5VYm5OzY2j1nFnpgJafjTxLjnh7vXUZa9SDYg2J
         +asw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774003797; x=1774608597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GpksDKQgAp4PIeZFTolWKLEW3lYUJh5RtT8AQ7UhmHM=;
        b=Sab4snCxjd5BtaBCQMvOMENl9QSbM8lbnnoAv+/MTlhb+0+rYwXmpSo3rqEFb9cCX2
         e4G4xe+Mc6pSt/yBug5C2JJfq2EpkSonk5KpCnBbHNy+L7XmhOzLjnnYR9nj/SJDw/ju
         0h2xgljVKqExv9h71szATlu3hSG4lztHIElZAZBHuYntq0iaX34UCDIp4LCpmg2Nz3C+
         4mCLxNctCf6Rciz4Mh91AVZjWv3nXtn36i8IyAgXUmib75KBx7EiFeBigtZVYJ40An1b
         rOl74i5Cm2cWHfXcSh9+IjLhx626U4JJryOBcEJvuPc3jwdUN3mr4oUlUaC/JJpmA6h9
         sA8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVEm9uiI8HDC3J+s13fs3HcfcJHEFr3aFk2uQ1rNv5vXlJkLFzD+Wnw9vGlSUUbc265NRvO+7yIwgxVH3Ouonp87w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWoF38aT8daBj8lHOmwWXZtGR2KD6CKj37BLf96ahjiKCvcHPa
	X1s7hTm1K190E/lPVGdx5Vwvk+hKWQWOr4uy3a7nRl6mtgYiYbi76e27
X-Gm-Gg: ATEYQzwsGXyuQ97NgH60GP+JjwesmF2wRcqLCy4bYg7GRduz8VapExIwNQJhevaEk0F
	T3fxob4IUm+qxoI5s57d581axDzdPQJ1FzzbYFKq1/dStf22FtJML1+cLqBHO2X390X6uxAznCO
	yYCie+oeUVs6aHepM98F1MuhiWcb5ruJjHjONv2RX2TZB56XmasSO3A7dbrLWzWCkhhuv8vbF81
	Kecm8j7gaQt7npcwtAXvVlZaLSV9IhMOEmgpEdz3M/35sHeLkwGT4WcqzGR/BEXueeF/mEFcSSp
	UHf2FN81RVrOaYyFeVvI5zKkRtadMmv0TY5oV0icyefQusg/YgmPMlzL/SQ3ddtc44t0wHOoCqM
	MSrVdiyoqhc58ftSopG5hfB7/NVDbG5AwWvHVm2HhW9o10wE/zrGZRJByJTIH5fwsgwkFy8ry+t
	MjEgTFYWQocSOm084FWHMpgomJqYRo7fA=
X-Received: by 2002:a05:6000:2484:b0:439:b59e:5e65 with SMTP id ffacd0b85a97d-43b64232888mr4507486f8f.6.1774003797052;
        Fri, 20 Mar 2026 03:49:57 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:5b93:d2b1:bc5c:9231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644ae619sm6203062f8f.5.2026.03.20.03.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 03:49:56 -0700 (PDT)
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
Subject: [PATCH v7 08/10] arm64: dts: renesas: Add initial support for RZ/G3L SMARC SoM
Date: Fri, 20 Mar 2026 10:49:42 +0000
Message-ID: <20260320104950.42220-9-biju.das.jz@bp.renesas.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30000-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-0.959];
	DBL_PROHIBIT(0.00)[2.220.108.0:email];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 35B582D908A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Add initial support for the RZ/G3L SMARC SoM with 2GB memory and
extal clk.

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


