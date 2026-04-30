Return-Path: <linux-renesas-soc+bounces-31826-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sH8TIT5R82khzgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31826-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 14:55:26 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 003CA4A2FBC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 14:55:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2EF25302FEB9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 12:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8862E41323C;
	Thu, 30 Apr 2026 12:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U7EzO455"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16ABF40B6D9
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Apr 2026 12:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777553635; cv=none; b=s5xF8xqD5T5ry9UHrI5/IOoK3EIpPm6xw+tgvhz0D4K9W0cXG4B362trry7SpLglvZeRM6V6U3yo14uUKd2uz7goZiohtL4lsAVXaT9EU6S0lZnG3erZHd1ogjSPQ80+QUvwcDYtjsLN1ETg3VJGzgkImWfo/1h1FsSiTiQdgdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777553635; c=relaxed/simple;
	bh=INKQTjnc4gXfGLcAFwX/mVmmHq3ablouYeEAF7QF/bE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oZ6SEhW0e961rgccWl4pHtO2wqP6zTEVWxeSN0gvej5JNX6ZCTcqiW3CDDUTMNkheWbsyoKTDAxFz67TKO0xDx4HfjoIENXSptEnQUVO3XmnmiiuVCWyeMKH1QfhiT6s5EIk5HCUVJT17PfUG+bpO6gIYz7CFaDj/j2fJF1qepM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U7EzO455; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48909558b3aso9830155e9.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Apr 2026 05:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777553630; x=1778158430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ta/S7lNS0mA62qqrUFlhRV3CLDAhS4Lgnzi4/r8QKpc=;
        b=U7EzO455iDhgqDQRvEvLm2MtdnRjTsrx+CwSkFjraEzaULyBNtkkgBoEBmpgTIKksF
         cmqweK+92BnTqUhBAFai8RCuKjq3zk9dQrbKznizLA646+03If5m+Y88WXRHxrHbUrXV
         56CwX/HgKvCw1YvnOb09aOhdu/sIxZQ5w+MEZb+SHknNwjRnnYDDpnSsMsCfifq4FM2l
         sFYeTOb94I+6giRr3J4YFzMP0TVJzE7+ZlA0dG3bbUw5qDBqgpkALbGoRGveB+tU+1ek
         qrBCQKNFZebARfFz55u6WndDr/hrvze55ZdH8qZvlRS+I8eEuhH7IB2OxsKQlLVccQo3
         lDGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777553630; x=1778158430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ta/S7lNS0mA62qqrUFlhRV3CLDAhS4Lgnzi4/r8QKpc=;
        b=lweaDGsltMYn9JyBUnOtJxw+4dlU74V7Wv3L3dR89EIxuZMKlRCseHuk8vSXvh4n4V
         LboFeqxV9OOufBSo8mdgXJxV+Sw8P2uzXXZ7HRF+H5ttAZF2hIm8PzcamOTkKSn782ye
         YElwOt7aj0KJVQNodFw+uaFE0+J8Q8hJItS1g0rURI4j51tQp8k7EsJw1xv79SHtSOCA
         wXivOBVyCR24Jt4/us9LXLuqyWstSBeP8kOUx4PHlrqJceAx3bKNlM1S6JdBgGKSasg4
         hEJPFK3jUPzyEMYwuoSZigS88BrwK060tfQTec1smhf/3/GoEeOPd+4mPFORYlevRcPt
         MUUA==
X-Forwarded-Encrypted: i=1; AFNElJ8U72AX6vtdJijx8i811/yjxiyrFLxanQzNGiA6W2Adfa8pXZ9Tgdth+5Ou4N0DVpcADXdj6CjbA5Xytm5RU7jmCA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFSYQCL7bgYRjuJHOSC3riWiA/FITry++o3HFoeCU0xhttRwOr
	cd3SFXuITNsyEoY5h/FIt+paxmXXkn7gXqAdKhYqoxTz719KcumTaAuc
X-Gm-Gg: AeBDievnpk2G/koUjrj03qFJUayaLatBF2G2P2jP2KVd/N7Tl1FRKwY31QmoEbvkZv1
	KQrJNO9ISgxXwvVyDykl6u/iK43R8Vcoat/xjTEz5x300DsEvTmFyZx6B4WcCM0aHKTGfiQUhGF
	5FtPoalbCTUfARwhsvDt8ouheeuR9gtTJa12rhy6SFykzk0J5l8JKwHpvpwUga/hupizfsui5iU
	6XXWTUmZ3u/y0Fe5wWbMAzCoOwpY86lIym98asB+VI0hitQ1MunA1Gkua+jTVW1734ZPZInXrKn
	xOLKsY7dwd54auaeWmTXfZvRLSMqDYXpOKBZP4sa+lcVLqs/rhodexUYYXaT9Vgiecq42QBr9Zn
	Y9wSQh4YU/YuIY+NJ8b9X2ksWMxFBalYrcNX/zZ500sUQCt4xNyYQ9yjhPtP9I/gSgwq+dRNzQy
	8g+mzlvk6kmLobn84S/aGYfc80PIKoQsoanCE13bHwXq7Mx981Rg==
X-Received: by 2002:a05:600c:6d2:b0:48a:7b7b:c2b9 with SMTP id 5b1f17b1804b1-48a8425667emr27776485e9.4.1777553630392;
        Thu, 30 Apr 2026 05:53:50 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:342:901:e785:f7d2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c3057ecsm40995825e9.20.2026.04.30.05.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 05:53:50 -0700 (PDT)
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
Subject: [PATCH v3 3/6] arm64: dts: renesas: r9a08g046: Add pincontrol node
Date: Thu, 30 Apr 2026 13:53:07 +0100
Message-ID: <20260430125342.439755-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430125342.439755-1-biju.das.jz@bp.renesas.com>
References: <20260430125342.439755-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 003CA4A2FBC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31826-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[0.168.38.224:email];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.168.77.240:email,0.168.156.16:email,bp.renesas.com:mid]

From: Biju Das <biju.das.jz@bp.renesas.com>

Add pincontrol node to RZ/G3L ("R9A08G046") SoC DTSI and set the icu as
the interrupt-parent of the pin controller to route GPIO interrupts
through the IA55 interrupt controller.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Added icu as interrupt-parent.
 * Updated the commit description.
v1->v2:
 * No change
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index 232a0e299df7..0cedf5a38291 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -204,10 +204,21 @@ sysc: system-controller@11020000 {
 		};
 
 		pinctrl: pinctrl@11030000 {
+			compatible = "renesas,r9a08g046-pinctrl";
 			reg = <0 0x11030000 0 0x10000>;
 			gpio-controller;
 			#gpio-cells = <2>;
-			/* placeholder */
+			gpio-ranges = <&pinctrl 0 0 232>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupt-parent = <&icu>;
+			clocks = <&cpg CPG_MOD R9A08G046_GPIO_HCLK>;
+			power-domains = <&cpg>;
+			resets = <&cpg R9A08G046_GPIO_RSTN>,
+				 <&cpg R9A08G046_GPIO_PORT_RESETN>,
+				 <&cpg R9A08G046_GPIO_SPARE_RESETN>;
+			reset-names = "rstn", "port", "spare";
+			renesas,clonech = <&sysc 0xe2c>;
 		};
 
 		icu: interrupt-controller@11050000 {
-- 
2.43.0


