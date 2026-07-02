Return-Path: <linux-renesas-soc+bounces-34646-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id w4lAADJaRmrPRQsAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34646-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Jul 2026 14:31:46 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7036F7A07
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Jul 2026 14:31:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ice2rAme;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34646-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34646-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 87ED630089B1
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jul 2026 12:31:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38E3548124A;
	Thu,  2 Jul 2026 12:31:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD1C480DE6
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Jul 2026 12:31:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782995494; cv=none; b=qMHmp+/RKNQMZluLNFI+OrYGOBmWqlgLwbreavqdijLCesSM1MxwLa7gBPGTKCdx1bLak0v9PeBqsVsi1y5d6Mce8sU8R8LHfuJY9ieFsAUilcEwHBKZq5NiOTLW8THhsb4SbB6IcbOqFENB3pzGrQ9j/MgE3EmwLHUG3xlDlZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782995494; c=relaxed/simple;
	bh=KlT+vAqF3fImgRh+vi1G/HlEXKdYDmQI0eT/ODYlQg0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PM3imRwQGRQHAHRuOXmv75/9PBbJffJGLZw4+/Xtk4tmSJPY4AZNVnCpYrn2CPwDkuNg2vk96F2nwU6T9u1Y5pBSpmeul6vz1THW5gu9xuK4NsB9Rq1NShJjiUzrYRux6H8klIzNdKGFtZMNUGi6biGvJSL/zcU7Y5Kh2dhqEbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ice2rAme; arc=none smtp.client-ip=209.85.221.46
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4629051c9d1so1156063f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 02 Jul 2026 05:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782995488; x=1783600288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mht4rxb3FmKDNCITNNMglstOGe9jBi788HmIfrM2viw=;
        b=ice2rAmewA/0cKlxCDUKDKvdKv1h1+21KuCop0o38Q0McCyZhPPs4Tao41bKvUlh1Q
         RV2vfQNep18XHuZ5Uk3kOjZhK+K6tG9YroLfv7DJYHNaWiTICOe9hLP7EgheH9FoGEFN
         /+bUiETQTDwHKwookLXP63o9/mz0mvVJ/gWzoGmSIxuH/D6XqJFQfgyQhnMGDQ2R4xbf
         +N/ZTLVZt+bCR4dP+vwhcnk3avtSiWqdYN8dwMsYbPv7Q2zB9zVfiWRTG4KwQP0FiVeI
         fuOMNw98y2myMypsIufofeJR1bLCfKlejSQuss48UvQOR85OZCeiX+c+HQKkPnpoAqiy
         WVhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782995488; x=1783600288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mht4rxb3FmKDNCITNNMglstOGe9jBi788HmIfrM2viw=;
        b=AWPMyORbn40iy6lZSrR7ZXTZ7Vzfuv/2LcWIAulYP2o5pY1JzD5nKt5KFZYqr8sP64
         HYzbFqtPJIrC5zh1RzZ4bwbrw/5nXPYCS/qAP/8PntFI8MZgmm7izaOAqzrkf/QhdqHI
         pijcmRp84/r5EbEzrK74Hwf/irNMP6Qs7BGUBPofEs//gJFFR0oY1h2i8lpTN+e4wSBl
         7Z32hq6juLTS8K5GGDhbpy21bUuek/HMq2GHCbh1/DIsBWclZIwqswnolwsYRRty+Uxs
         sdzNWE3KhG/n75qQKcAiskQ82I2UMM8e6haaF62beQDteLw/t+CL0oX0gD/l24qApUl+
         rlQQ==
X-Gm-Message-State: AOJu0Yw/yEx1fTvexr6Nby2J+B7myceYQfIOW4S3zsG0EULqipDDsuCR
	4xJb56JUmWDZLIo+AAtkh7umirmfZI+YkDFGY1aX7eXKJCIomBKUuJaG
X-Gm-Gg: AfdE7clYm7Knh8gH+Ep//yV/Y+DhqWNvW5vCjBRF9IjHRoGHH7QEkm4rzqMzOg/ElIo
	+Nbz+r393ADWS6W/QIq1zjS17YvJvUijr0OqMhEkJDCzpXvdbxg73b8uVefAb6NWWOAXZ8tU+HS
	EJfJnqqDtAZ2+w9VFhSc7orFnV0CUhwm3y5/B8zO5a5ocgACOxD6/DSLlm1d27DoxSB9F7Bs8U8
	HLS59/VcHhoATCz7BnU1CKxgaTzsdnKkoCSrB6ZWpbv7tkaGQVGq8hcXvzBYAhcx69noSA7P3k+
	4AkwG/NrJguu5XSQuP8mZkLbEXiXj2q1dcwW3akHK5Cf0475lnnVkGKLWd2d7QnZ9i/9hoFxvg5
	TjeE6+VN1UOApQcyuNpO7IfIm/zpLfRTV6Qb9Ql7YCwmSXjKRTietODwXIXM0TUXWJlZR0qFH10
	58i/kWGlBoy+6V5mvQAek51DA0E4tL3/YeoHDtsGUBVQg6xXzS73n3w9CXSIXJ/iC4R4Wj2sFAe
	YvgGxDaTPnTBz2mlJynzLmbR8k=
X-Received: by 2002:adf:ec49:0:b0:475:f0f0:9ecb with SMTP id ffacd0b85a97d-477b5d37949mr5581503f8f.54.1782995487566;
        Thu, 02 Jul 2026 05:31:27 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:7a4b:58b4:175e:8c2d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477ddf0f433sm9772923f8f.32.2026.07.02.05.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 05:31:27 -0700 (PDT)
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
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH RFC v2 3/9] arm64: dts: renesas: r9a09g077: Add system controller child nodes
Date: Thu,  2 Jul 2026 13:31:06 +0100
Message-ID: <20260702123112.161160-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34646-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:wim@linux-watchdog.org,m:linux@roeck-us.net,m:magnus.damm@gmail.com,m:p.zabel@pengutronix.de,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-watchdog@vger.kernel.org,m:prabhakar.csengg+renesas@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[glider.be,baylibre.com,kernel.org,redhat.com,linux-watchdog.org,roeck-us.net,gmail.com,pengutronix.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BC7036F7A07

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The RZ/T2H SoC contains system controller (SYSC) blocks for low-power
management and access control within the CPG/MSSR address space.

Represent these SYSC blocks as child nodes of the CPG/MSSR controller.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- No change.
---
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
index bc109035fbac..6f4c1086afcd 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
@@ -1055,6 +1055,20 @@ cpg: clock-controller@80280000 {
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


