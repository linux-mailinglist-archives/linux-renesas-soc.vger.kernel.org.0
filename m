Return-Path: <linux-renesas-soc+bounces-31413-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLuKF98t5mliswEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31413-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 15:45:03 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE3842C380
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 15:45:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2A69630B1DD9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 13:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D55623AEF5C;
	Mon, 20 Apr 2026 13:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OZ6xHivM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75ECB38B7D4
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Apr 2026 13:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776691364; cv=none; b=b3sKD0r9Gae5qK6Uzj1ZNWxI55i4RqODkubyrBbzyA7iDFjGnZKKabjYcStztmw21YzUofbJDpAxMwoKEAyADnG+ACSCV+uAvg4fAXXxm1Mrk91ccIdi+p88mZORSiTA3hlsC6cKuBYOXbd8PdwRLFMIj9NakOMzMy0TOWKXbc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776691364; c=relaxed/simple;
	bh=0CNF4S8Q+dlcJKS4ltoyHAUJrLjYZPUjMR4pqXA8TvU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AIU0BqRIml+ycsqe/aVVJ0ojZDxyPPGFYqldVIlMPbdDZHI/cNhBcc+sh+LitQZsF1qfqazG9yNEuIjGdy6DGTiEmYPpk2sp6E14+iCIpDbq5/La3Gqb4eGPDvv3M9Z8DDT+or7fbtIkwwyo//rGIQpyaUv1aRGEDJ6PpjZCuPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OZ6xHivM; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43d7605ec91so2786536f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Apr 2026 06:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776691362; x=1777296162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wU7KfU1h9bpFsbZofDzyf3qe1yX0F0cyyFkzQzmr9a4=;
        b=OZ6xHivM9WI9RtEuMfLNtk+ZnxCo7n90MVGz7F5ubHohsAxaXA0gWjhMQdRaolYFrG
         nQNYS7KK4fBQRDiNu73g6Ov7/aYwkz9yp2322bDZMOm/hx442MV7P4OJpNxQvNreoavC
         ILGu2QjZ/36K65nVlbF2eqsmRG8eRqMefFo3S37rbXYWD55uIA8QLEvNyT4rk/vQPtbU
         Sge1VoL+cbmuNqw7OklPpuzxDq2iDOj/r/WVDb2icjsL8GsQmFsB7po/IezZFWBSx+GB
         0FCqzNXkto5mwEbu8PaO/OJOiDQLSGC8gmY/tqs8j2fgKP5Ux8QJ3FTglGAk/T5nVzmC
         zayg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776691362; x=1777296162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wU7KfU1h9bpFsbZofDzyf3qe1yX0F0cyyFkzQzmr9a4=;
        b=louZKfCylwHxb+HjTyShv2PoFMZtppasKbGrVZaNfTkUGxwmteVakHcgCxcZ+RBRko
         PXU23t8mTbgd4obuI6fBjf/JtxS//oO4XJsdc3TDArtsdivD/LHg64nuuiUvqiK9FyMA
         xI9ENmlCXgQMk2x0NLNLWj7v5/eYuONva0LB4xKfm9Zszf29gbmRsN0Cm0UmCAIdgk2V
         2dnrkW+5EEkiACtPZyulp6UAoSal0noZcsFgquM/aZgCW70Z2Xjz9N7dOgzr0mlVlHt+
         4p3PjBruf9gT6imFZGSYd3hAQt404qEIoZbZJbZtBaS6KsJwsHgnOauccsTYDey+68sm
         0o2Q==
X-Gm-Message-State: AOJu0YzTOyDkch9G9aceHmeWhc6yNLE49vyyXpGHdpcjbPMDetVnfpI1
	lyfHupJ+4+fM0m0KxBAvMFfy28E4mqMmmcC+lkNLzy92lClvPM+zI7tlR3iV/DK6
X-Gm-Gg: AeBDiesiqQe8XekM92xT0w+SxK53IzyJj6uBLb5qmtYavmlQDWi7JHnVwXc6HIjsPf7
	QEcnRZaBsSj7dtMhb4VETk7dVg/CTJDcKwkijJKxwc3JyXY0rSxoeT5jRnzTmqKZPLtWhU+WVGq
	DvnKYyVjdDUzFvL7tN8Cs/U7zUKFk1e1FNgFQVOtGnBsCS9HuwvCkyRzQnkL6YMMok+db3aMlMr
	3IIg+i2iUlVceyE4/FjKvuOBvTYLPNSnMcuLQaIdAK8zJOvwsD3BV1QIGCkcuqyrEsPoHnV7LBC
	3Q1GitkDi93N1V2OirT69m5CAI2fdGHA5P8/v9KolxWx8o8bYlCrNewWNjqDbleLOU7KdL+JszE
	9EJycjLjqn8vcsxyj5P7irTO0bNQUdREdOEodLJcd2pDrjjIInOLlKpa9goddG1f8OD6BM35Tv9
	tfLWFTSVR94gy9JNnV32gCA6akpDZhQX0h6+0qkkVNC2DJjSytwmWMgOXarDj++TTvp4Pvwiuq3
	fz0t/jZbCRqtauTOTA1ePoxsFZ3lj0L+HNTEbnL5JgmhVWV
X-Received: by 2002:a05:6000:26cf:b0:43d:77e1:6a69 with SMTP id ffacd0b85a97d-43fe3e14384mr21547096f8f.38.1776691361611;
        Mon, 20 Apr 2026 06:22:41 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:4dc1:ae2c:7f06:f671])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cb13a0sm29331630f8f.8.2026.04.20.06.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 06:22:41 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] arm64: dts: renesas: rz-smarc-du-adv7513: Simplify DU port configuration
Date: Mon, 20 Apr 2026 14:22:11 +0100
Message-ID: <20260420132211.1350656-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [3.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-31413-lists,linux-renesas-soc=lfdr.de];
	R_DKIM_ALLOW(0.00)[gmail.com:s=20251104];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-0.865];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c04:e001:36c::/64:c];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,0.0.0.0:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: CCE3842C380
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The SoC dtsi already defines the du node with its ports hierarchy,
including the du_out_rgb endpoint node under port@0. There is no need
to redefine the entire ports/port@0 structure in the board-level dtsi.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../boot/dts/renesas/rz-smarc-du-adv7513.dtsi     | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/rz-smarc-du-adv7513.dtsi b/arch/arm64/boot/dts/renesas/rz-smarc-du-adv7513.dtsi
index f5412578ee65..dbe16908b260 100644
--- a/arch/arm64/boot/dts/renesas/rz-smarc-du-adv7513.dtsi
+++ b/arch/arm64/boot/dts/renesas/rz-smarc-du-adv7513.dtsi
@@ -24,19 +24,10 @@ &du {
 	pinctrl-names = "default";
 
 	status = "okay";
+};
 
-	ports {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		port@0 {
-			reg = <0>;
-
-			du_out_rgb: endpoint {
-				remote-endpoint = <&adv7513_in>;
-			};
-		};
-	};
+&du_out_rgb {
+	remote-endpoint = <&adv7513_in>;
 };
 
 &ADV7513_PARENT_I2C {
-- 
2.53.0


