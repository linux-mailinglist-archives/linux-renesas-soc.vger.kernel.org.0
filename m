Return-Path: <linux-renesas-soc+bounces-33347-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6H69JsyPGWpTxggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33347-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 15:08:28 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A2492602A92
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 15:08:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4544F302930C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 13:07:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45FFE31E828;
	Fri, 29 May 2026 13:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QCk6/cP7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00BE3128B2
	for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 13:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780060032; cv=none; b=VRwF04J3LgA8ugny8dYff97ER8k4P+Y3S5cpPZ/vnCmblxi8QYF4PGfpG2HoAxQPyYcEdVb709GVaM1qXAyLyvP6j++t+RO6B0D470YxL3Begn7TcZeZJrkTNhZb3cNWB/Q9QDW0scxsw9SQeGg21PuKbcb7EueIbxFGL7DhPSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780060032; c=relaxed/simple;
	bh=N4UM/OP4SW9Bw2QWwFILNnN7vVM6l0aqfGaJsxdPtig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xf5vhnWL68PDW9KZHwXVet27fVCPlKAfONjzyieJ4Ugwqw46ICnORH56GaRKpg+Jj2hZqEBS9juOBHIp7eXUjNcMmVhXfWDr+zCoQbuygO6Y8UXlyMl0vNTO+pnWnWJRTZTZvvGVyCBc/1cLfpY80bTAB3btJNUQrWCoHqpZYZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QCk6/cP7; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4905529b933so55716395e9.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 06:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780060029; x=1780664829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kbf7TH0BryRvZ27AZVS4u+b2U56NalYuvxhYtLCqWIE=;
        b=QCk6/cP7szBOXHdOFYZRbHdyLG7FkQ5Az2sG2nVojixnoL19QnuVOFU0EzE8phy+sk
         2u7M5nj0adg9AKlgi2cGKQIt82emr7Z0VuTLQ6otBUG8yQ3oQQwjbh4CEGWmSmIbpYnO
         calbKKGrD/QWlbhJetkRSpFsa6MDOoxeHJZsceLlVDsN2EWvvbR7EI7GcaPjgFtnU2p5
         DCZAhj/xyBobdwRJszd2k4VPVUVTP9iEM5pbssT+ivtlIJHWeqfZk7SdC4Tdo5Y3LKZp
         UP5B3hNtUQM+zRN14iIrUe0zzBMOwNQl+TyMuR9Z80/BZ95O7TrUT8hVQpyY2g6+TzZI
         JkIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780060029; x=1780664829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Kbf7TH0BryRvZ27AZVS4u+b2U56NalYuvxhYtLCqWIE=;
        b=PbPHPiMGlkRT8pjurkwQQSsyi3APDA+IkPHTKy55C7OjaT3Hx5htpq68PjbQoCw2tW
         NC38xQX7EYQ17osJ2FJlCUaQV613dlIQ2GVDsukihE2THEpom4C/3eEUYNWFSEQR2JGA
         L4Ndj1RFvtX4yF7uc3tLkfS1iO8fYa6EAKfktn0hlK8Q13QMTHoKSYHFBO0ZybbYbd7E
         tZyd9KCYT34QYA5XamupHCk8a/pK64zK7YSZI4JmDMVD9E8vIpbJ4Owp7+uXY3LSzTLn
         /qGBFE5OmBXtuBJz0f3fQZU1W6ruZAQw5oFbDluHkWiZuQL6k6qUsbGu6eWV2HxC0sc1
         y0iw==
X-Forwarded-Encrypted: i=1; AFNElJ/WTVDc7pcsTHyG/aSas929hWwtNw/3CAfxADuKtZQlzeFZmc/CzH0PSNdefzgHPJdFH4Th0AwNxlIqcaC09WSD5w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVoTK+i27noJu4nMYimPlQnf8RarKs7UB8MS7u0Wy+H0mv4xcr
	keQkWblgSL2gKWzRiPl3FHTUuERGefXmVSfm0ZxcnQAbV/XcrQqFKOZx
X-Gm-Gg: Acq92OG89VFnbFeEi8eej015kikzXwdZACeHppI3zOksd3TNtfSwUR1bd+VC3aWLSDM
	Rt+BVZ7R3/Vbl0qk2HYwIP96+HclXewJQzh19ZkO4eYQ4pDHkk0kg3sGTkhNboGybuUYXUrpkL7
	a8XP5LP6u+iQLjs6Mk3h5bkWKghQgPmElLEojzgrUYtUYSf6TailjP/OtYKEIyb1w9j+hNfhojZ
	oJ0+qBPrDZ5Q8/V7NSTmCZ8Bha2PEp4YwWqph3iKi4bXtIoq7W9ST/bTen7wH+Ezj2sx2HOninB
	tmoY4QekZVbvmgZm3ghIN2qKia9tUGb0pU1FArGG5q89ITSk0zNEBDzrthh0k/4RuTns1RN+dqu
	j+LfXpSvDvJpEG5hLUhfZ1a8nZ/mKRoSDNONYcmSwmabM4fewql7BX6kjC8Il+v0EgHlHeXrYTO
	JtrjNpIKoxzX39eZvSY5tj5MypfhfR21JtXn8dD/Vf4S17u3dB7ygAEgVwuSc=
X-Received: by 2002:a05:600c:4815:b0:488:b187:3c with SMTP id 5b1f17b1804b1-4909c088fd9mr29652175e9.14.1780060028867;
        Fri, 29 May 2026 06:07:08 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:df4f:8f31:69aa:c094])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909dff2a80sm45247225e9.3.2026.05.29.06.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 06:07:08 -0700 (PDT)
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
Subject: [PATCH v2 2/2] arm64: dts: renesas: r9a08g046l48-smarc: Enable RSPI2
Date: Fri, 29 May 2026 14:07:01 +0100
Message-ID: <20260529130704.327505-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260529130704.327505-1-biju.das.jz@bp.renesas.com>
References: <20260529130704.327505-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33347-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: A2492602A92
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Enable RSPI2 on the RZ/G3L SMARC EVK board by adding pin control
configuration and activating the rspi2 node.

The RSPI2 pins are shared with the DPI display interface and the
two cannot be used simultaneously and it is controlled by a switch
SW_DPI_EN.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1->v2:
 * Collected tag.
---
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
index 3ce24b66cb8d..624fcaea350f 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
@@ -162,6 +162,14 @@ rsci3_pins: rsci3 {
 		power-source = <1800>;
 	};
 
+	rspi2_pins: rspi2 {
+		pinmux = <RZG3L_PORT_PINMUX(6, 0, 2)>, /* RSPI2_MISO */
+			 <RZG3L_PORT_PINMUX(6, 1, 2)>, /* RSPI2_MOSI */
+			 <RZG3L_PORT_PINMUX(6, 2, 2)>, /* RSPI2_SCK */
+			 <RZG3L_PORT_PINMUX(6, 3, 2)>; /* RSPI2_SSLA */
+			 power-source = <1800>;
+	};
+
 	scif0_pins: scif0 {
 		pins = "SCIF0_TXD", "SCIF0_RXD";
 		power-source = <1800>;
@@ -222,3 +230,14 @@ &ssi0 {
 	status = "okay";
 };
 #endif
+
+#if !SW_DPI_EN
+&rspi2 {
+	pinctrl-0 = <&rspi2_pins>;
+	pinctrl-names = "default";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+};
+#endif
-- 
2.43.0


