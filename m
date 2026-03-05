Return-Path: <linux-renesas-soc+bounces-28874-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QMRdIO9qqWnH7AAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28874-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 12:37:19 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A0A210AAD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 12:37:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6461830452F8
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Mar 2026 11:36:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E72639098C;
	Thu,  5 Mar 2026 11:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O2rjwZ3M"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9388F386C0F
	for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Mar 2026 11:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772710584; cv=none; b=X2kzBxw43G5Big45uH5PSnwzt79f3x6r54riGAZu49FRVyTbz24YNrVVlp7W0MzjSwIpWdBalIFpCNkmbmKRFP9flcDoEMlfEfMrf0iABPKu6urRsQyEJUsp1uyufe8P4m68M6CXL/RaovQTnEeW03X2qY85tobCv+6oAIHdN18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772710584; c=relaxed/simple;
	bh=wPZiFdqCiDOOFye8FKOQoufL7cyIaxgiXa67+xHsn0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L1it8iFZzbCPPOXNu2BxwaC0tm3ESa8vyJEPGCQVSr0kS2MXXWCHAjuu5cFlvfhB/vB/pq+wcLB3CwrNWXZvSbOKMLLXNKkPAFovRBtd79lcjIuJMzQuRbW0v+IVIJAd39Dn04QGfenARqIWwk8WF2JYHcnCS8lEYw6wN30ZQLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O2rjwZ3M; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ae46b9c70dso18860065ad.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 Mar 2026 03:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772710582; x=1773315382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HkTY0vM9EzW6XUSGNuKIJpMIFfDu1qpzZf7r+qP4u6M=;
        b=O2rjwZ3MGs8fPGfezZHnivOTuUKLLHmMEUwvSw4LgnsEKa6vcyN404kuUz8Ni2HkIx
         oNkI9VpBBDeI0DdS8NjNhBrr5O7m11D1EFuy/AI7kgvehsqVpK0tR0r2kHAeIJD2TdFL
         ODrmw128TOWi2AV5sE9W3jfGCTgw8gKBPMMm6Nr/o/SwPQ+fW8Si4ROWRUU+VOBCYB0q
         jGgkZVUJ4XFTCQjiiFgV5DvnbdUUeD5RvsyY+aF8vsAZp42onYbBroHphAcyPFZmQInw
         M5XLxHmJs01EtD4SmUPHyPZEwwmqP7xONtxhcDyPqjHt5tREVdwR8IDry9aSTKhVWVCc
         +CSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772710582; x=1773315382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HkTY0vM9EzW6XUSGNuKIJpMIFfDu1qpzZf7r+qP4u6M=;
        b=CzMZMo3NqpDfeh/LKLSe00cA6B4N8J/vLgX4HU+RMXcJAtDlqt580ZwqNbkSa40/qn
         nih9YLHbqxC0U8A4r9OUEoeWnkVeCFJ5SZYHh1MXZqZiImMc/DoRItztzt8iA4y29eO0
         BcPR21oGa/Ib4cfmhcSXt310XDuDCA/V3ktRPUjIJgrvqCNz9P+boQfda1iBLphDrSH9
         VkbB630yMZhDDPmKY1g4quiIhWxMa5RViiDSYqixaBDVjvQMAZs8WVgMZAtln04EAh0B
         oWYZwLpbWiGqPCV87/J/ezXL/adGnjj/8wrDrcDm493LjmzdzVS3NNzdIEryoTxAH3X0
         x4Xg==
X-Forwarded-Encrypted: i=1; AJvYcCVK8AJHsczbWu1tEtC3hoOBJMxfej8c+mUhK69KU316FZ6iZje2ZBbN/oI16frl/F0MMOkUbyu7lI1TpIVDE0KpNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUamgUue3c4wxzxQN4HdWOlRWBkrOWwWyotwz+AMSMZH3CbdJo
	6H4KYQowwxaz3L9EO+WadER2xXHjJuMZCVDZe6EB/qvC1yL7KNrMlgzp
X-Gm-Gg: ATEYQzzF+kD00utWETP282WsKolQhafuGQuVii821z42xAbmENUiYGuWve0GTVROHCY
	FIkoffrmMGR39XKUmMK41kITEcLtnpLheajlIiXX91YXDWQIMTUcxnb1ISIXgxJ+Q4WOSJKvQS3
	cPn/ameU8GRS0nOgb79mKxjI4fxmB6WmbSPvbyKDRnzp6laydXIX6iUOS1uxocuIODhUKTChpls
	sDsEmN+TkYQqJ0ckCOP/UYS6Kw147mFjUq2Zc03lP9fCsGeyudaljvDpQdZxqxQFT24Q4EQkW2P
	PgB40ZSWOW/+OYMmxHzrB25IcNDm1lX33E7MiIRYtBZHrgycVd1pcNfhPFvO+rA0gadXB2hKGgH
	DwhBj2A7FwvOoMuFcdVK6LJqfRqqUnvwa+4ZikFBLD4YeDpz8RDqKpHKTA51KbtY1/2Y/DfrMYw
	bpXnpGfvOlH9uRfyY4YRVYLPKDn+w+Cuuj5n2zE81aZngs20t/J9te5oTitw==
X-Received: by 2002:a17:903:2f8d:b0:2ae:640a:9f2e with SMTP id d9443c01a7336-2ae75bb5d87mr20089695ad.19.1772710581875;
        Thu, 05 Mar 2026 03:36:21 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae5e1699c9sm78796995ad.10.2026.03.05.03.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 03:36:21 -0800 (PST)
From: phucduc.bui@gmail.com
To: dmitry.torokhov@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: javier.carrasco@wolfvision.net,
	hechtb@gmail.com,
	wsa+renesas@sang-engineering.com,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phucduc.bui@gmail.com
Subject: [PATCH 2/2] arm: dts: renesas: r8a7740-armadillo800eva: Add wakeup-source to st1232
Date: Thu,  5 Mar 2026 18:35:12 +0700
Message-ID: <20260305113512.227269-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260305113512.227269-1-phucduc.bui@gmail.com>
References: <20260305113512.227269-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 80A0A210AAD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[wolfvision.net,gmail.com,sang-engineering.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28874-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,glider.be];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_NO_DN(0.00)[];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.55:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

From: bui duc phuc <phucduc.bui@gmail.com>

Add the wakeup-source property to the ST1232 touchscreen node
in the device tree so that the touchscreen interrupt can wake
the system from suspend when the panel is touched.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts b/arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts
index 04d24b6d8056..d47a6cc3e756 100644
--- a/arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts
+++ b/arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts
@@ -228,6 +228,7 @@ touchscreen@55 {
 		pinctrl-0 = <&st1232_pins>;
 		pinctrl-names = "default";
 		gpios = <&pfc 166 GPIO_ACTIVE_LOW>;
+		wakeup-source;
 	};
 };
 
-- 
2.43.0


