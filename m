Return-Path: <linux-renesas-soc+bounces-30157-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PSyN7l6wmnqdAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30157-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 12:51:21 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 834DB307A3E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 12:51:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9C5FD305375F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 11:45:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 132973F65FF;
	Tue, 24 Mar 2026 11:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nYsOMKGP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50ECE3F0777
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Mar 2026 11:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774352630; cv=none; b=Dhv76ZWDqXWnQDCI1SKgwTcBm4OOMJvHAJBUnhZtsPJkkrSNXYgtqEBWNlCH992PHH5UIUoAD4yG/5+LWkLIviMr0hGu5wt6BCpr4Yv5AoVMtyrUQvAMSPrWlsHO0nrlCtMi1iUjGP3O+1RS+nFMSzKwQbwiOrIuurQsRiPczFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774352630; c=relaxed/simple;
	bh=zTHSvgauhk1fL2rH+ZBSq/RVMv1G8G+YQUAc1AEK3Sc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o4ZfZxITM/QBzDj+9v55xYDVBI/5j/p+itjrL7sIPfikO+oznIP68888cIRb7wW6tahjv1eAIlPtwAcufEzHEyWaya0f1AD7XE16WFCkK+fkD7w1OerBB88BhtLZ+iLbeh0UAOTvnThqWCza+OvGVBrd9lb3+RXAriFUKKpDpy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nYsOMKGP; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4853e1ce427so40749825e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Mar 2026 04:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774352622; x=1774957422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QInh7f+kJYLhky42CpiKQ2Xvp48u5QVAak/vIZ1XsNA=;
        b=nYsOMKGPq2hh/RqEhR/un45pNIVYcjayw38CnagGfapsAi2WNtCrgxMlMmjIf2oMDq
         yTJRvG7UJ0/02OZ4E8TDBKnmcO72mjsK/mIMmlFp3nK941ynnVncEHg4wUSUJacD8bRH
         AbtFOvEh6zbTW+6Fo9JtISTA0nXO16BmpIy817WyFuMnQkTyMXziRGjtqLSeGSqC6JFg
         d1UMZ76/31aUem0Xyp/HnSRS4bF4iCkOeICmsCle1TtTVJ12SbR2sn8NhQaCQi5w5CFV
         YhNQgzClJwjQyf70iZXGA/eM4lVQHs9CoV+LbRxf95Fx2eHB7t0+XCXBWfFS7E4VVrGw
         Y+FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774352622; x=1774957422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QInh7f+kJYLhky42CpiKQ2Xvp48u5QVAak/vIZ1XsNA=;
        b=r8XLLFwGUi4wJrCrG6IayUEpEFE3jNNEIj6KyE7j5lPQUh5JYjzOrTcEf2mOQ3k9Sv
         uHSTgtNrM5XLV1ldiKd6DReJsul8xLzdj8VSWfLoBBwTyiNjqgEZvzqdfDku1YPoMQo+
         bjVvioZCEY3BcyeNUiiEk2zKYevAZhN5UC45CiNih/1h0JZZudOuwCKG9hQ1/XyO4B9T
         IWG2oA9Axecdav/fiP5bHNtfnHTIKnzarYx0H2Otv1ce1mruC4Nm7rjNvIv1Z+Mr4sEr
         UG/rWlXJxhLHZ8XGsuQssNCV3TtlbcaERFgAbjzdA9VJSoNVXfu0bx2rSFJxQooQsBZT
         WLSw==
X-Forwarded-Encrypted: i=1; AJvYcCXeoQTZ7c7Z5dMyBiErqN1UY9S7llK5nOYoZeNuLyTMIDkprIevvaFLMFOd6zyHZXTV6DvS290ykpuOaqNDe1EM/w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5zAgoM9aI2agzJ3U/EL29SPzMtKQRRnJtykegrQfpD8A2VQ4w
	osQJryHQ+ZtzNE2gWKvURnUp2SG/C4k+MWKCipDiIRxX8Q9M84B3Rds+
X-Gm-Gg: ATEYQzzCRjf7SoczxBFVhcc/Z/AMBvGo1xbFqOmt1hjemuznGKjGx/qsRmDEvX9csQd
	PXZJrBlNL1qUGmTekKAn0cxOeaY3ZjQ6lRh7WJpRjM7gvjO8+7GPIJI8zONZs9SV6CCir0YgjkR
	EL6JKigjWRMslBBxTMI+3nUrvSqIi5FeJNzYd1GIi1VolvTWinoIXzHQYNUx2YcsqPIgaww+KVV
	nuXXg4sZkrOy223PjnO55SD4+NYBflecraM+CbDYXmaIoPFb6nqDPTg92LcBGc64hkdsSOMVQBp
	W2mrf7Jl1HuiO3Hu/trxxujCaGkhLoJogS+76rs5F7wzexlRlDyV+CmVjTk4WCPmV0sRAR52Qta
	sz/YBV18104UkwbptSC5v2uM1W2JnCFP55sFbSN8rSSyiXwuP9RbuYq9z8QLcjkAZW3Bo38CvaJ
	xFA8W+cPsZOV4uFGnqq71F9y1cQ0xRGo/5P5ICRTAlQ9AVdhvQ
X-Received: by 2002:a05:600c:5291:b0:485:4278:24fb with SMTP id 5b1f17b1804b1-486ff04d6afmr219757615e9.32.1774352622090;
        Tue, 24 Mar 2026 04:43:42 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:a4a6:e61e:cd81:c756])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4870f7f5682sm25416465e9.3.2026.03.24.04.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 04:43:41 -0700 (PDT)
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
Subject: [PATCH v8 09/11] arm64: dts: renesas: Add initial support for RZ/G3L SMARC SoM
Date: Tue, 24 Mar 2026 11:43:14 +0000
Message-ID: <20260324114329.268249-10-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260324114329.268249-1-biju.das.jz@bp.renesas.com>
References: <20260324114329.268249-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30157-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bp.renesas.com:mid,glider.be:email,renesas.com:email,2.220.108.0:email]
X-Rspamd-Queue-Id: 834DB307A3E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Add initial support for the RZ/G3L SMARC SoM with 2GB memory and
extal clk.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v7->v8:
 * No change
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


