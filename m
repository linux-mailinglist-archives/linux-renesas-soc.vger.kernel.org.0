Return-Path: <linux-renesas-soc+bounces-32079-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOXHGi3m+Wn2EwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32079-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 14:44:29 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F34A4CDCD7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 14:44:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 88BAE30DCB32
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 May 2026 12:38:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9FBD47B42F;
	Tue,  5 May 2026 12:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oL2YWh/w"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054E243CECC
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 May 2026 12:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777984637; cv=none; b=HZ9hUKhhmIvw/D4U8xAKooXwGUJsvNqGGazNw7mu9pXEFr/2tcb4HXs4a0h6ZRgQBpfcEIZfNsCExyJQgkDBsb2dW9UejGyNsDbqYXyLZ9J56O0UkCBF0SpbvEzXsAKdoywykfvYzrEzIA+MZaWskjFLQRx+TEQFSUwEXgLsAfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777984637; c=relaxed/simple;
	bh=cqIhh+pJ/+gp0DCZ8vKGCHyY5v99YfadIPRRJLJXgiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yu2HN9ORjfVzsJ8vvW25IUROWWIvWzmaAAXFYdGDjp8p6yoH6WtgVCx5P0a/pgsQtE4BHe1aNCfwqA5NSJODoozkVLLNWYNt0BBMiYO1lW2hXjrlQ/Q7Q/SPi7i/t9Ni6sncenwFjFZ/OVnU5vGCN5ZxGyCk/qNxQhWvWh5cxb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oL2YWh/w; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48a7fe4f40bso55400215e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 May 2026 05:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777984634; x=1778589434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CVJwiB5RdL84fSkwUDhj3KruslwKN6j5oRJPekK7gZc=;
        b=oL2YWh/w390Q3P4L3qZtuZtsImblj7KxwOzXv6nbc2ZmSuixUWZuXsXwT0pVOlx0xt
         mX1Ua5Cc5rqh0zeR5CfJ0T16r5HaX9XRrzU9uKhOiy+CSd942olVwup5pfa2lPHD1CmH
         bxRy24y6Q4f7eNG7B/BNxuTdafaBf+glxmZU52yy5aoc62JGy2jhx00FPZ57mBFX0olW
         zIy+vN3PtXKe4E5KBp+O1ajt8zXQjJno0FlPJCrNq32lwgvgtnH90jtdoz2TObTv9O/x
         CXYwMeiAb3KHLQebqobxuF1ewBWF0pl2Rwt8K/R62yxpFnZz+pvGkF0wmbcpazcWda+h
         +v6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777984634; x=1778589434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CVJwiB5RdL84fSkwUDhj3KruslwKN6j5oRJPekK7gZc=;
        b=kakdH8maIG79Km12m6sg8Hj+X+Sf10hFDPW7xZJ8jFHy8EaO7R8ynT7w4+EUVYMuTc
         FE1/HePmnblmTuqB/Ow+YtO5rS9RtRAlJsD0h0BmzaGWBmSm3HHQ2o0u5wuZDGj62nO0
         E7CLwuP6CHgn43/E3C4wwp4cCzaa5g5DEYhsTpJXXsvw1xHl88CiUyo9Og+DnlvwZSGZ
         IbE+nzgKSL+6RBxAhvBX8903D5ZPIxbi9foSawmuULFc1879QN0svnFYsjnNYq7aXXyn
         nMviXpubOAE/XKvx6oK0zvnJzz+sgoeTFMIhg6NFHO4D/CT0jpGUBWevez6GgCRKJZ9H
         82pA==
X-Forwarded-Encrypted: i=1; AFNElJ9xZY09BLH8qdx2GDvCxgJhFIeJycNN8hsCbBxUvIqR0awWuGVNqnq55fQ9s47ECcb+WP+6RIsJ8QJr7yzO5RPdYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKDcWjWt2iz6k2R4r5DoWCr2RsWTcnhKpXIDQ9nm47Ujp9amKB
	BZ/kvvsfePIJQ7hVK86mhh0IR80NVYAnBKqqfj7V0WVfGsQwXk2FKIXo
X-Gm-Gg: AeBDies/d3lvz2utOGb00NXFdIz9ttL6+sNt7gWIrrThU/89ACqGd3r4QjlavtWsBGS
	/OyibEKPBqrukkb0vHx5tvqJq/sCeMbrfnt5lYJvJ5fVxcq/bYQJsc4Qs4/Di6HrvVTzE116Lc8
	nmTqiHBcjFQSaSlLBiR/2wh1kEva18jxkiJTDcNUOFJxluXgQC8n3+zQeaouOnR24FTg0Tl+HwV
	yb/QmfWiKcwD3/r+/oFslnC+HzeasSERDdAUeCjMYmE3pFHdC31q7fVFcO9pDPBJ/69/OEgSpqd
	W/mYVIh+QG6PBMInAC7Kk2vTjQzNcvo2dA8miYFmtSxDtGuRR/kNs9jZZus/2a9r1Zlko3zcg2h
	FgFZLKFJlUv/nF5in73num9ZkisGZgDEf1g7k4Z3FwxAUxLuGIPj2v3uKxDg//neoBepI2FxUAF
	z+3RQlTM0tp8CGf9FlV69Tsayw8Pm4eghbcz9PGFQPCItM8y4pa9yS+mqePgQ=
X-Received: by 2002:a05:600c:4ed2:b0:488:a639:b772 with SMTP id 5b1f17b1804b1-48a98639ca9mr241200945e9.7.1777984634366;
        Tue, 05 May 2026 05:37:14 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:1da3:f63c:84a5:197e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055960902sm4703780f8f.28.2026.05.05.05.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 05:37:14 -0700 (PDT)
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
Subject: [PATCH 3/5] arm64: dts: renesas: r9a08g046: Add audio clock nodes
Date: Tue,  5 May 2026 13:37:01 +0100
Message-ID: <20260505123708.134069-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260505123708.134069-1-biju.das.jz@bp.renesas.com>
References: <20260505123708.134069-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2F34A4CDCD7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32079-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

From: Biju Das <biju.das.jz@bp.renesas.com>

Add audio_clk1 and audio_clk2 fixed-clock nodes to the RZ/G3L (r9a08g046)
SoC DTSI. These clocks are external to the SoC and their frequencies are
board-dependent, so they are defined with clock-frequency = <0> as
placeholders that must be overridden in board-level DTS files.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index 03c0ac707d3a..55cbae6ca8d4 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -14,6 +14,20 @@ / {
 	#size-cells = <2>;
 	interrupt-parent = <&gic>;
 
+	audio_clk1: audio-clk1 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by boards that provide it. */
+		clock-frequency = <0>;
+	};
+
+	audio_clk2: audio-clk2 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by boards that provide it. */
+		clock-frequency = <0>;
+	};
+
 	cluster0_opp: opp-table-0 {
 		compatible = "operating-points-v2";
 
-- 
2.43.0


