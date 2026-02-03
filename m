Return-Path: <linux-renesas-soc+bounces-27803-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDl8DVPQgWl1JwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27803-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 11:39:15 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DC0D7D3C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 11:39:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 61E79315101C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Feb 2026 10:32:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8594D3246EB;
	Tue,  3 Feb 2026 10:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MAyeeDMe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDFC33A031
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Feb 2026 10:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770114643; cv=none; b=m4wbybQsdXV6bwgnGG6bCGeKjx4pLO15YG6hXzZgdle9UH7gXzurJk0QseILu+f9APIzjWf6pS6OhkzzIONcgAySOUHL51YYFJysCxvtOh6SDvnRVTZ7l2IcZACjS7AyEivLop0jtg2t98ABn5388WATylOfpzI2+V9RrMLK0Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770114643; c=relaxed/simple;
	bh=ex1mvqe2mbVjkMNCdMAY4qBzAeJ5mwBkW6yCSYOlsQI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NwBz6YUTOQ1TyJTCEWNl+ZHGN4IB4lahXLgvrvLyD5IgLw4bSfLxRzgH81y8s+mIlkhz47pGar5qJRICX2cHiwknNcNExclnJUz/qmeeyP+/gsplultXb3wn3OI7HtWbKCI01+ojYijhuGH600ds1DVGhN61K2aDYgCsShd9zmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MAyeeDMe; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso46229495e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Feb 2026 02:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770114639; x=1770719439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SfqVTSyxwRg8Ma/ogFcamAET2PFGRVKefL6mWxk01zY=;
        b=MAyeeDMe5/DKO3oT97qPMkdcBjNat+Pl188xvbojOez1SXuHUmBcS7jQRyGB52iBC4
         lUP+rEbXFDuvLER+dWbckGH+WVY75JYi3oRDEkflje0VtDChnoKSVz9iUJa44U/SCyoe
         ozIEq5oabo6xsnGqP2RXWuRrT9sHjaG/zV9txxG235f5/73b/XkAerSdLbBHFCoTYjIS
         ZGh6El0/hr+xy08vJdPIkEYEPlOB+ixOQM8VK7/iea+8OfPNY3ttpY7lcuZn48DhoGjv
         xsTgnuEaaEuQ8G+iyni0sky3xilSAz+EOVTyACxFo+xpR+TmSuJyJa6+KHACam2RoLBN
         PIfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770114639; x=1770719439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SfqVTSyxwRg8Ma/ogFcamAET2PFGRVKefL6mWxk01zY=;
        b=gzoxBcpqlc8oXwk9ODoeiYOjbKbcz8BK+G/7JU1AmkE3Kn/0JpevfqoZ+l+QuQ1DC+
         YKWL6o6ajEnQhgFpfhQEyG7JKFUvKkwSBGtb60IpBzjZ0VGKGXiBdO6dBbdsJMC1sQWe
         W3Rr3q1EUz3YxqqIK3keyG0wWQf8yIqNjnwDcYMFj2P66Huq8yZ4fhGIfU0QjZtiuNCX
         UH5tge9R784OfrwNsSV4XmjhcmshNRkvv2kT4pT6duK8aRnRbD8I5rQ8ac5SQHw6O0v5
         UYNzz+MxOZVlUR7/M3MHYp8PemUD6JJsP3fe7cEt/DP0FH1dbsLfJbG9878hp0b4H0zv
         /beQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7o5+x5Anv+qo50kcXuIYsy2WhG02gn/cZCUSyOYveZEmPNJsVr3pjW8iijpqaHO7G9l+cpzPFY5A+jNzHwPDZlQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyeAcinlLv4fqyzTZeu6GUFT5PF6zho6DtPMgdA8OqftENn4+Of
	1saPnRQLYofhoBIDinAYROLHDS30p36Drgziv9lAlPnJbvfygeoANwcn
X-Gm-Gg: AZuq6aJ7G35d/zcCwOldTKg/N9aU3/PoySVKTAQgf8h3fF3IjtpdGrojo1sxUy2z77/
	kGfpNb0mRNXOn6XPFBAjOQfa6+WcurgkAH1bi6X9PzQyjMoDbIIZHJg13FiT0SMLELlZ70YWNYE
	Y1cecqQyO14huizslD442Rbc3QJIk3EStrjKHFURvIrlEb7Csi166hK4cpsYouSZ/c2NM2axhIj
	Yp6kVYpmeq6o25XnfRycwYJYjdcmuwJEafTtqQW2s+jvJ8lMF1J7GJanTS/DLJe1Wygnj7I9AAE
	LTqT4HsgVOFQzdR3BWdal66vjtIAYYatAh8Ki9sWrZFfObetEA5eS5EGtTpV/pBsZm9Gzckkwa3
	V31Qa8YPsut4IYw019K1H4MhVSJYqwAeq1YocTxVMuH5Zth5OyPbLo39vBJhP6fZ4ZCa3HYeGK8
	KSkKLaA13w6E4+Hu86tA==
X-Received: by 2002:a05:600c:474f:b0:480:6ab1:ed0d with SMTP id 5b1f17b1804b1-482db452587mr187008255e9.9.1770114638974;
        Tue, 03 Feb 2026 02:30:38 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:9cd9:f748:166d:55fc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e1323034sm53160961f8f.35.2026.02.03.02.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 02:30:38 -0800 (PST)
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
Subject: [PATCH v3 09/10] arm64: dts: renesas: renesas-smarc2: Move usb3 nodes to board DTS
Date: Tue,  3 Feb 2026 10:30:17 +0000
Message-ID: <20260203103031.247435-10-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203103031.247435-1-biju.das.jz@bp.renesas.com>
References: <20260203103031.247435-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27803-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A8DC0D7D3C
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

SMARC2 board dtsi is common for multiple SoCs. So move usb3 nodes
to board DTS as some SOCs (eg: RZ/G3{S,L}) does not support USB3.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change
v1->v2:
 * No change
---
 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts | 6 ++++++
 arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi    | 8 --------
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
index 696903dc7a63..cc75f6fdf7f5 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
@@ -248,7 +248,13 @@ &sdhi1 {
 	vqmmc-supply = <&vqmmc_sd1_pvdd>;
 };
 
+&usb3_phy {
+	status = "okay";
+};
+
 &xhci {
 	pinctrl-0 = <&usb3_pins>;
 	pinctrl-names = "default";
+
+	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
index b607b5d6c259..69c0101ff7f5 100644
--- a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
+++ b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
@@ -107,11 +107,3 @@ &sdhi1 {
 
 	status = "okay";
 };
-
-&usb3_phy {
-	status = "okay";
-};
-
-&xhci {
-	status = "okay";
-};
-- 
2.43.0


