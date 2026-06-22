Return-Path: <linux-renesas-soc+bounces-34340-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 13h5IURsOWrwsQcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34340-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 19:09:24 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D077A6B1638
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 19:09:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="sfyJ0as/";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34340-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34340-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 97A21300951A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 17:07:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25A8F33F5A4;
	Mon, 22 Jun 2026 17:07:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A555E33F59E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 17:07:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782148077; cv=none; b=q9dwOsZpgze4yIG80ifZuUx3cGPCQ5ct0MG+qUcsyxPK7pa9P9tzrDw5jULHKxYGqTnd5U9rusqeRM4TJbbf6pyVwyHOoKdmmLPqcGrf0ThRpX6H5NKibjvdF9uhBoA/YshCOwypgvQedL/rN8o3JPMLilb7AGEnRG/uIDXqsGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782148077; c=relaxed/simple;
	bh=AgOtniyYm6rKfk7GnNxevEu64wIeIM8nzc0g2iDgTo4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CyNa4vAFr4yhmmXTVqWBCcpxdx75Gxr8eJqBXjPZzwTB42KuFvadBbwOnf4Yk/GL/V/IumbfyvXja1X2ORUag0CTBIvSwmFS1KJAVg00JfmCSG56E6/sVVxYftH41xW2yUVhPGFyRMYXAO9qGLX3LSqtYCl9lnmbQlEzXtiL1t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sfyJ0as/; arc=none smtp.client-ip=209.85.221.47
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-460662fcb4eso3136576f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jun 2026 10:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782148074; x=1782752874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=//bGganLCk4cosv6dFtOCUjlotV2gqLidDZkUi+6CSc=;
        b=sfyJ0as/iT9MT6mqgXYFAu6rTQYvimiy4EoTlkSMyAKiTrnd9ow3hc1UQsxRT9wvqj
         SVtujnex8qxPz6iVX2ozP5sjLR2PP6U2oM69dPlCeyFDD0r0lFra/n6V89/VwQ5zjSkd
         /5UScyyUcSUXQ+WuM6Xc1/7ljlzTdb0l5FL+Npee53c9UCNMq12t6gLfM0EtCoETAPa7
         rCErzU/yP8EXtQdsihf5CUyw5k6/kYdeteaWjmVVZQTGAUqu7x41id02i+mPOwPsZ5/x
         ztC5JOub2zxYRbiOsn6HttsB66YbUyF1BJGVqUus5uh0Y2c8YUOm+TKpmgmHoxp9k80z
         i7Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782148074; x=1782752874;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=//bGganLCk4cosv6dFtOCUjlotV2gqLidDZkUi+6CSc=;
        b=a5LjLtckUehJDoBeAnERIA01Le0sM+L+PyEKt5kcYst6e+Tbcl+RQmAxVOD8MEoVob
         4GP/38DgkrHRcSx+DsBHm+pk135438rUnDGjpKbjCwKeTAg5iPC7QvWss2obHfCw+iYf
         WEi0p8r/AHjng1wC+uV0VwxxOd1nDGLGKdPqMO/6jbU4nyw3wbgW59o9q/rlQ1gaOc5Y
         JE/b/FIgwo07m++LgvSKOaLSFslWKLnQlaGwqkmO0R8ivfATDSYTqZ6kxTYCOvX7Nu54
         FSFu0RNKpK7V80Y/cn0f/A7DWhyC67A3UjuhygBWqCzqX05q9cnWhErZJfEvLqg6tR+X
         eR4w==
X-Gm-Message-State: AOJu0Yy1y39Na91X7uigDPVvRqAtJOMjPuLaFOO9Ny9+/Rysa8p+ZiLG
	F5Fjiiap9nRhdGY3O9BLtM0tA9nOFFGBobtt5P/s9uji0qL9Om+qOWC2
X-Gm-Gg: AfdE7cnij5/EIYThrUK2uRIxRVAkK8SD4Jew1bHC+jIN8fz/ul0mDtYG8XxIGmwmndE
	luV2h/u7kjCr7wW1FT5T3uV8UK0MjTCRoqHzYM3oBB7tBkCey/mxp1xrApTaxrf9BG44JW3dCbW
	g0G4nDljeT4u4ZrWmBBZXS8H5NARZ8E4Dsy91yQIQ8s4ce+hriurm1CRWM587wWoTiWAR4VnRdd
	aLEI48b+bcEgDFCGyg5tOxR9nd/cVX04STE0A+30ctbrT2ps87wypT5FGTsiZRvZkVovsB0dWfx
	+rHV6FSk/TmnfzoXTgoDUodN0FQvndhDamvqNSMBPzWej3V9opRS1ssCEuEPuHqs/jxw/08GCrn
	XrsBef9cSjMisB4CaDkCnUojdck3UAp2T9OMKLRvIbyGy8rjy5OUx9keDbMeIlBt9oPbvgRFgkP
	sPJreBBhm6eUocXlA9jGGmxXQgLFyD8f2i78QOlgSt48ptNJPBCUIvHdzlkzCjqs9RgL9Tllaey
	5S2Ge/xBO+WwF3BeqHyzr3hwgI=
X-Received: by 2002:a05:600d:6402:20b0:492:1e36:1fe9 with SMTP id 5b1f17b1804b1-49240eb56b9mr184933215e9.37.1782148074052;
        Mon, 22 Jun 2026 10:07:54 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1af4:aa58:7920:f0ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923ff821aasm329903055e9.12.2026.06.22.10.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 10:07:53 -0700 (PDT)
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
Subject: [PATCH] arm64: dts: renesas: rzt2h-n2h-evk-common: Add memory nodes
Date: Mon, 22 Jun 2026 18:07:33 +0100
Message-ID: <20260622170733.1703585-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34340-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.csengg@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,bp.renesas.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D077A6B1638

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add memory nodes for the RZ/T2H and RZ/N2H EVK boards.

These boards populate 8GB of DDR memory, which is exposed through two
address ranges.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
index 1f575ea23db4..a0e1e4b1f23d 100644
--- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
@@ -30,6 +30,17 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	memory@c8000000 {
+		device_type = "memory";
+		/* first 128MB is reserved for secure area. */
+		reg = <0x0 0xc8000000 0x0 0x38000000>;
+	};
+
+	memory@240000000 {
+		device_type = "memory";
+		reg = <0x2 0x40000000 0x1 0xc0000000>;
+	};
+
 	reg_1p8v: regulator-1p8v {
 		compatible = "regulator-fixed";
 		regulator-name = "fixed-1.8V";
-- 
2.54.0


