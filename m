Return-Path: <linux-renesas-soc+bounces-29662-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKFOMrezuWnJMQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29662-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 21:04:07 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5512B1F79
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 21:04:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 154DC31B9B83
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 19:58:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 737463803E1;
	Tue, 17 Mar 2026 19:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IKQUnedf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1D027FD51
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 19:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773777425; cv=none; b=QOXsCQFGwuvAL2pa8NelTUhFfAeo1a1I0NrEhuHCh2FVv8FaawyShsBzuvmUdq7aKspC5kzR20CCDvpxzKORwBVGqsYsCBiYWyyo1V/OFzUb2teictVzfT92rADRwCmizn2SGVvp1psSNsYXaSKdlMOafuyfRP2tWpY69Q+CJ94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773777425; c=relaxed/simple;
	bh=dn5dYtHgaaeDgKGCPYx083eAJbV1dxvbfBoMMROgS3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i8nI/T+fZaqVgKScdu1+ioaeGYPhtfmeFhPJTi4452XQePBPwlM6R5NfgqyTskZgh0D5qCQdpIKMdH+2b8UWC0/n0j0TkK5kFfnTSsBN5Vf78ajonTx3qawcO6z5XW4wejxbfSrXQWrz721EvU56WIJ7K+jjA6kSeaY1Dn3k4t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IKQUnedf; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43b47b95a77so1726810f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 12:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773777422; x=1774382222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+wF52lbRB7DTjuwvGcCQ6Kt/mFwxZK5Ryn/ExuWo2fw=;
        b=IKQUnedfbjrC7oOOAzxQJan/sAjvshJXl8Q3LCQNOfNlVn/ai6dEf4wdU4utipFV3T
         JOOTIr9EZXFTVbFoNj68JSV6pMsjifNA5BbxHIJqrNAw5YGoABIHh55xrR3Lmrnzyiyh
         3g87oI4/3DeiJL3uwt4VoxrZMkpHUIL4IpjwqSj+jhYqcKJC6fEkPhpiv81jHjJfegS1
         3uNYgI6+NnP2mXLBckCf+aBzJMCzS8jAq4ItJEc5gyz0DgNwQgfciXmUaL20Kmvpai2Y
         AXiGplIHxl7Mzo3vvDgnNze15RbxvlGya7PqCqgcIXtT1Z6PDavV6ueqBCqANMx4R6ZF
         ATww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773777422; x=1774382222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+wF52lbRB7DTjuwvGcCQ6Kt/mFwxZK5Ryn/ExuWo2fw=;
        b=X5PUfSu5HsZ2HKPoZeJJoguvXRNx2N8+83d22NMWBrFzXDlXy83QombPBhsvWYPpMl
         vKFdlN1lnj8Phg2o/oxO4uOqldUAfWMUvbJCq6uOTqDC2hfwGe9ZO6vCj2UNU3qTzsy8
         Uo9xHYdv6Z2jXyFPxg02aALUzVYqOvnDcZsNXidFN8BGvIVZ4rUY4UBBwrqmobN4IM1f
         IDmXhUrYlAHS+Vkoe1/wwcvSV5LjnNPYDM+GK7CvwVwtDJlW5q8tL110mtye3PXD/goB
         41wdxLy0Mah5fMKILPJCef2F6m2Q9i/uGQGpeFsH/6GTM3gbnJq9Jk/+qFDkAKkjLAcr
         Fz8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWNx+A9GnbMa8djaswDRq5koLL36ZNbf17nTKnyJcbh0U0j9J/BhCsffP2bZvaMj21oD7l6ec4qR33eQt9X36g47g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwId6l/f/6h4t0lK6N5sn8jP+jtCr3f0yGuF1NmbcEGwZUmeu4+
	HXLHt7dCe9677ng/zh8OMdFBMIoH56LuuOx22XrZpNDPg7NABCom2ul+
X-Gm-Gg: ATEYQzw4Bvu4DLVafYHwUS8wwAIYrfhLBBysts+JtZ4A+duWqC4vAj//ed0tg8vHA/Z
	0Hu0DF+onKsBdqgshzBKhZF2jKdOGlKO3Wdj90SMDu3i+I9DDR1pbh2WzT28svN3rfhy1x97d9X
	GQ4B4YDx4sOlpDkHuN1b+AkqMJdLxavLOO4ETl5nU/hP3LZlE5eQDfgmsVekRhuriZdd4ZUQ2Yi
	dRJHZdafr2VJ9SpIn/SueISlP+QwInRmkj2pIe58f0RPStEhP6bOjaEG6IqN2G0yDDEmSoUWiqr
	zJbA0Ke6GmND1wfaeYfx2+xGPVev7DeswzRBS0cBYHnmYY+aqkwlkZuUNE9mWJYFC5pcb1WA4o2
	igRTO4Nh/kQS1KyQ3Bdiq6/ylcQDCGlI3Y1eOF2GkJUSUIw94IdpyPYAR7yZnDRP0xiT2LFlyP3
	n4H4eT8YszK2mXrJbWF9GEUx8c0JaDUm97X4notu9awbqEPORC
X-Received: by 2002:a5d:5d03:0:b0:439:f5ba:8c2e with SMTP id ffacd0b85a97d-43b527a97d0mr1015007f8f.18.1773777421910;
        Tue, 17 Mar 2026 12:57:01 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:e16b:fc56:e220:9aa9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b5189221dsm1339217f8f.23.2026.03.17.12.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 12:57:01 -0700 (PDT)
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
Subject: [PATCH v4 8/9] arm64: dts: renesas: renesas-smarc2: Move usb3 nodes to board DTS
Date: Tue, 17 Mar 2026 19:56:37 +0000
Message-ID: <20260317195650.468330-9-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317195650.468330-1-biju.das.jz@bp.renesas.com>
References: <20260317195650.468330-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29662-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,glider.be:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2E5512B1F79
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

The SMARC2 board DTSI is common to multiple SoCs. Move the USB3 nodes to
the board DTS, as some SoCs (e.g. RZ/G3{S,L}) do not support USB3.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Updated commit description
 * Collected the tag
v2->v3:
 * No change
v1->v2:
 * No change
---
 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts | 6 ++++++
 arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi    | 8 --------
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
index 1ba50512f4ef..9e66f2179807 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
@@ -264,7 +264,13 @@ &sdhi1 {
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
index e2a34577a1a1..696a933af808 100644
--- a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
+++ b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
@@ -111,11 +111,3 @@ &sdhi1 {
 
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


