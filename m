Return-Path: <linux-renesas-soc+bounces-32400-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGi0EjUlAmqEoQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32400-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 20:51:33 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D28C0514A26
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 20:51:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E0F6B30004D2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 18:51:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C5144C9570;
	Mon, 11 May 2026 18:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OPbrN+ed"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88CE4C954E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 18:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778525471; cv=none; b=MNU7tBeDtTRTUHIuAAzzdBMktbZGZAi8FfW72qWkvhopbZ8cwln91BJcODonKU1ll6fvRdcPyExmkvk74LkRVFHen4L7sBrNRQTt7Z4Fx5fJmrIr+34ymnSsdHEJvg4YTLv117LDntlMTLdQeI5fJmSDd9pMStBdH3ByzhsX1Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778525471; c=relaxed/simple;
	bh=JZCBeGLfMB8LJuneUZA+6+fLkw1BbiXPSFoC/zVqo5c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X8oVb8d1sKHEB0FSFOMbwuVjwRxFYpndT8WVTv+3B1Xm1z1qHDvo0nMtcRefaZkfdcJ9A0c3oY2z+CIgqxqDh+BIzG26+vK7lMeRe7sLC5Ce0WkKBF3uHVk5zO8fQ/Pw7RGZW2o5+lxRuugSs1emwmojz7NCRJaCBurGEPZ3Aqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OPbrN+ed; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso43414855e9.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 11:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778525468; x=1779130268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HKbDKt2WJzz1x2UtlmgWA9cf8CPcU+RwykUyEU48Pcs=;
        b=OPbrN+ed5o2+JLtioT9q4xmPZ9u5CgKNeytf2RwllnHQkZSJ0GxppGA/ll8iOymOxw
         EtPp/mOZkxDegFMY4WqpB920b0JqDNewRtAQxQ1nCohE/cqZgaBg/ususHEctMzA2ayX
         Vi/t2nAUlH3N/uCpnQRRsEXmjid+xgI2vtbK71HuITUTBDTW6+VQPNaI4DjTr4e4k9rI
         bv9KXeAzTEEzcpSoYNJ8seeIupjmCGov0nc80kaCCKjopQDEunZBMUS+uYIDyMP+LJFE
         w/lXxpwXcEkABHJBdvQNj3iB6l8UeER0pfILFKRXPOxXCTGZuJP6NJK0QPbxu1M/byUM
         RHpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778525468; x=1779130268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HKbDKt2WJzz1x2UtlmgWA9cf8CPcU+RwykUyEU48Pcs=;
        b=WRWvJkYtMOkO9QeL78QadyeyNrcW3VoO9Ay4ty15UV1Kt9b5aIUIakhlmiNx00STAV
         H90ZZONmt8YcgRV6djukJ+hXQ53bGy/aL6Ut+nv7eeewtDU5qSdQbyEmhSvSXPDklJDa
         7cs24NgPk4nQw0w8u1GoNT4WaT7qtyQ2cV2D+qhoQOUtyaFIGr2sI2793J1bU/COZqkE
         fOi73Kn5ivfLdgV2BEjYTQ4NwPqnOKNrA0PQzYOSMxVm9EwKjR6A/yij1sjBOcRjTywO
         xJyID8lqxR1M5v5ZKe6aKup+I9R3cYS6AO6gaSoKTSkz+B50S/6wMqyF5Pp1EJNvGiG6
         r9tg==
X-Gm-Message-State: AOJu0YzDhR8PVvJhLMnq1Sni1iE7qRWpjo4CNA2aBELA+e15dC5Uazq6
	bgiwzN3IUfl7p7f9PdiZDBaJ8OG9zeHvlxvC1UVz8jmir0s/a9kZZpUu
X-Gm-Gg: Acq92OHyLGR28fIdAcBmf1ljGeANJgLQtk2e3Zy5udXNuhA45BJ/d8D87wG4/hCJtsh
	17fPEYui2WqGRTGSvLvls8vf1SSVacoAWXNPCysgGQDcnpNY4opr3i3uy57p3JgqkyZHzIEFJTC
	ERVKcbhh+mdybCMnKQmoE7lqvcCccVjcZppIzPINpGpbWUCONMa6J43c1PIOCJ09WKFrgVNH4U0
	Ypi36fU0zDMmb4C4ltTwscw3UbanobTwUTzarifr4B0MaWmRl6mqIhly5IZYo7ZEalmR7GZmWsn
	k1LBQhzVs6IURysU09U2zg5kzdQeDLI9rgBw+kvAs1H5yIJkyfheCEEfDVwmKldTthSyiXDkq/1
	8HfZScSnPt+Jh7M/LWhsH4N4jhScV2tDy/0qX2Nv5Ot+nEL5j2BGpImmcmRHVZcbhotEcYvCpLM
	NpHGiIzJbZQz138Agjt/pi+qbHHx8saOV8u2Jx6tpT+l7NsvlkkVoTjOrLmLnb9ksLkXVYczNZd
	6b9FpOgEsGVJ727vvpr/vf6/jUjl//wT0b0xw==
X-Received: by 2002:a05:600c:5296:b0:487:219e:42d with SMTP id 5b1f17b1804b1-48e706932d5mr166018355e9.11.1778525467756;
        Mon, 11 May 2026 11:51:07 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e687:6094:b849:9886])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8f3cf0cdsm854775e9.2.2026.05.11.11.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 11:51:07 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH 3/9] arm64: dts: renesas: r9a09g077: Add system controller child nodes
Date: Mon, 11 May 2026 19:50:52 +0100
Message-ID: <20260511185058.1926869-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511185058.1926869-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260511185058.1926869-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D28C0514A26
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-32400-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[glider.be,baylibre.com,kernel.org,redhat.com,linux-watchdog.org,roeck-us.net,gmail.com,pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	DBL_PROHIBIT(0.00)[4.200.249.192:email,4.216.99.16:email,4.201.32.208:email];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-0.984];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The RZ/T2H SoC contains system controller (SYSC) blocks for low-power
management and access control within the CPG/MSSR address space.

Represent these SYSC blocks as child nodes of the CPG/MSSR controller.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
index 3761551c9647..59e5de743826 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
@@ -1015,6 +1015,20 @@ cpg: clock-controller@80280000 {
 			#clock-cells = <2>;
 			#reset-cells = <1>;
 			#power-domain-cells = <0>;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			sys0: system-controller@80290000 {
+				reg = <0 0x80290000 0 0x10000>;
+				renesas,sys-block = <0>;
+			};
+
+			sys1: system-controller@81290000 {
+				reg = <0 0x81290000 0 0x10000>;
+				renesas,sys-block = <1>;
+			};
 		};
 
 		icu: interrupt-controller@802a0000 {
-- 
2.54.0


