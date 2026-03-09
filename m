Return-Path: <linux-renesas-soc+bounces-29043-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEsIMH8Ormnv/AEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29043-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Mar 2026 01:04:15 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B6109232D4C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Mar 2026 01:04:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8C06E30091C9
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Mar 2026 00:04:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3E5681732;
	Mon,  9 Mar 2026 00:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lbp9gB87"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C335622301
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Mar 2026 00:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773014640; cv=none; b=QT+KM/igAbTomJDNsz6rcep52I1LE/CPRkuga+EMVKiTVzyxdN34JZZKAxttbWy0leOKlnns7jyXcdU0q/VCeE5ZvL8/uiXAd1LWfTjNf7EJxR/JkRiXA9XtUMTMCtHUAxhFfbzDgc6NGjYyU7jv4s9xgoIGJtOOZw7G1oQP414=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773014640; c=relaxed/simple;
	bh=wPZiFdqCiDOOFye8FKOQoufL7cyIaxgiXa67+xHsn0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gzLfNjy5mAbrW8y+GEAJjC8WWqlPmT9RJmPeSYpTj2mLmYCOSHzmNEC78mZs8m/DGnmd6VpYVvyCL9zjgO1KLDkfW2S6GesUvHcSRu4zU1FLTJ1xWpLL9cyBHYg/Ew3eJ6WtTQc1JTpgii/EOzGvez+zXFhQkFAyrvYgrSxjgMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lbp9gB87; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3567e2b4159so6233485a91.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 08 Mar 2026 17:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773014639; x=1773619439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HkTY0vM9EzW6XUSGNuKIJpMIFfDu1qpzZf7r+qP4u6M=;
        b=lbp9gB87GRviLuybrdKpqdO+ljmRKZY5VVQHdEu+c3QBm5XVHX7wf/cMJ0SiNngIOT
         H9O7uQTIrHNMg056XFWtfEAhBUtN4/D7El/We2kp5b1gjiFBCF8p+MmBeIle3UlluQDK
         t6SVaMi+tXHpV8tUMNXFuqko6n00OOvCoq6jzT0Z0+wY4m0k8CjpdnhdDS/SmekAmwVT
         umpd6bE+4L5bB2xwL+eMr4K5ll3m9V5DQwP7U6VM/pt3E8gmXKzkixMU0cZVDIWbxNbA
         0FWdNZ6aXscakiStpIesvrUJUPa6eAnDRxIIW67zrlQrVftOup4ZhSw3O/y75p8EfhM9
         UdGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773014639; x=1773619439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HkTY0vM9EzW6XUSGNuKIJpMIFfDu1qpzZf7r+qP4u6M=;
        b=Zan5nuLc8rX7z4WwiLdPdbhSO3VIoefYsLye+VnZMTMJuT1QR5zrYHiNWjZ5AdYjMZ
         fTUzjkanWGWvi4YwxCLw2/eDIe7sdifWmytFgjipKPOCaOOZ6OTNS47Ee/ackzt9hXE9
         XP7bI7ft7jDmzLII35xC8Ett9UzTlYofn5rhZ9/AQahjx7pLMRS1d1wpwOltrsVwyBGq
         fjkHqVvg+4G4hZKP8IKKYJ4IuvYMyFmx/XP0FF3woUKxGhkiOBqvL01q7/L7RyGr9Mfh
         D0z4GAEQj30gB78rBJDJJK5goIkRQTcll2OitIQgXGzxG67lb3j5O92/jtgtDRd2aXwy
         eJlA==
X-Forwarded-Encrypted: i=1; AJvYcCV5oNM0/Jj0C042yPdc6TIhjmWzvgyK+6s3XxyZwRagsz3xkLuKXKGrig3ejikDHW+n8Lfborau4G+Ynd1t9Na9bQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJHFlyQ7r9hOiKDdfM9zHJbCX6eDj29Gq4lypXXyZILtZ6NXfN
	TGm4RTm/UWlySTWoGh8389Cr6dDNJOXYm6mcRjV9l7oxMLJeGWkpBJP/
X-Gm-Gg: ATEYQzykg5MQWA2cPHYQb+z6YfZ85ec63wTv8skP1LkD8j0KRxWP6fDiOjxa2zr4ScR
	21wDBgQkNZ3bUO7wU6qmfSKRXUl90D44Tj6I+bo9RDrQis9JxdyX1E8PJP8/2DBVnj7XcB/DDXH
	Xi+oHUYsWkdLTJHN67Z0ObFNMIiGgCSa0Q4S/CkCwZOVTz9vfPZOGGGOjoqEsxxC9oW0SmP0V/M
	wu2Ot/qxXr2kzYp8SqvW8HIG6zxN4Qpato+NAUf0MQ8eJLsMNVvr/xSyQeT6B/VYx5oK1zntB9G
	z1MrS8fW5NLPXOMv09ee0ficAUFpbf6vVV3h87mdR/L71wtU6rqE3p243Gaw90hgX4Vwa6SRl1d
	dQkc3PG9R69MZLNidrHsPvOIeoK/MYSo7C6sBdpwWhyW0XryKdUQNnaFv10G6T1wOWkdZMdG3Vq
	DG1ypcDvV8L+KvsAS4IP2acyVqL7etc3OHeqp/L1CSK9toY1EqkROcBWcQeCnvJQkgyNlC
X-Received: by 2002:a17:902:ce88:b0:2ae:4d23:334d with SMTP id d9443c01a7336-2ae82572cf9mr95162765ad.56.1773014639053;
        Sun, 08 Mar 2026 17:03:59 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e9b9c6sm104845405ad.29.2026.03.08.17.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 17:03:58 -0700 (PDT)
From: phucduc.bui@gmail.com
To: krzk+dt@kernel.org,
	geert+renesas@glider.be
Cc: krzk@kernel.org,
	krzysztof.kozlowski@oss.qualcomm.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	hechtb@gmail.com,
	javier.carrasco@wolfvision.net,
	jeff@labundy.com,
	phucduc.bui@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	magnus.damm@gmail.com,
	robh@kernel.org,
	wsa+renesas@sang-engineering.com
Subject: [PATCH v4 2/2] arm: dts: renesas: r8a7740-armadillo800eva: Add wakeup-source to st1232
Date: Mon,  9 Mar 2026 07:03:19 +0700
Message-ID: <20260309000319.74880-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309000319.74880-1-phucduc.bui@gmail.com>
References: <20260309000319.74880-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B6109232D4C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29043-lists,linux-renesas-soc=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,vger.kernel.org,gmail.com,wolfvision.net,labundy.com,sang-engineering.com];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	DBL_PROHIBIT(0.00)[0.0.0.55:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
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


