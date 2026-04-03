Return-Path: <linux-renesas-soc+bounces-30844-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBLZHFWkz2mZyQYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30844-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 13:28:21 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0CD393AC2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 13:28:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AD2AC304B4D9
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 11:27:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16D413B7778;
	Fri,  3 Apr 2026 11:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c3RjsWIJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84073B27E0
	for <linux-renesas-soc@vger.kernel.org>; Fri,  3 Apr 2026 11:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775215659; cv=none; b=Rvm0orwIRQ9wmibKrNyFMve7ua9okeWmY+bENikTUoxyq50hFqU3dwz+OOX9TCvUb9YLAKPVV1PxpFTym2mgKc5WvQ8cIxltAX4GNmg+64A8AAC+0EScsUUBa8gUisqdrl0KOaECSl5YDlNjIp//Vn75ix4e3KIQd+05fvjlIwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775215659; c=relaxed/simple;
	bh=8kcJtqi0VHJvhXuEuRP4SR2nVD2GvzsAbGsi4Dox6/w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BbDIlgXTPYxtr0TyvNsDw1VdESveSI85SknkIiFbfxk0FAP8/+H5Ff561WgrkdnV52ZF5gD1uCMKza7d+PjZCZo9kPrsE/GAs7RANAIIWxxy0LdR6DUpGfXVwugGqKDBunVoaQrKjE7Q8OukY3Ga4qDtr2u12t8TYkBzyx11VGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c3RjsWIJ; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-82cebbdbdccso918663b3a.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 Apr 2026 04:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775215649; x=1775820449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cOr8dkqvyqFf6OUz7iSfGmZZS207nEioRgpDY/txeeg=;
        b=c3RjsWIJjIKLlkkMQDp+b/VbjgKVNxeaM/uUYoeFVL+auTorzu+sD2RjOPJjuLTuW/
         kSneu1kWshF6tMve4iGVeT5dUNovxowb5H7zQkbktz9fDfMgXQd46Iv8awVz87rQxIeA
         RtZpqb+yoEURwmTJgWm1Rdc0n8Fmd9ihvsGGoabcK/grQPW6fwzNcCJhnWrfUlPkTvKc
         HKoKUoUKbpvCoBwEGLv4ZodFAbfpuBfMv20JQZzn2f2tg196cEIP4o+OI5YYRijaRaaw
         xLvTS+JrLC+ie+cYbTK5eNS/Nouw5fVo7rEuQOJo+fbEfz77pkEh7SgDCJnLuOkBdRjQ
         wkrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775215649; x=1775820449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cOr8dkqvyqFf6OUz7iSfGmZZS207nEioRgpDY/txeeg=;
        b=ow9rdx7fbVAHAxWtVkMaiK2ct1y/qWwDrn/zR2Jf/xdbwi7VQqhweN5KUEA48Gerb8
         PN2DUojUqOVCV02y+HJEkCkSXBP0dXqnlDavpPLKtzMqBkF7sKV+lbYjGxo4utyMQrLS
         Mq9jz/ys9WJwZm9MWswxFzsyYLFp80o0c+es1vimpdxoQUzxXhXEzrJxnV7QNxsNpIzY
         R+J+BHuvKw7gH/RBI8mcS7yNesYkt9bIaxDIKEk0mIotFkiXCXTyQbkUcZb1smGGNV6S
         N1rfbh0iw+eHS6FrtNG6ZRYAmghxUlui2XT/vYV1xHL7bTBlEohbdsWlLediQerN3NWB
         IUcA==
X-Forwarded-Encrypted: i=1; AJvYcCWxj8mUD/dWGdDAaLdnhb5tbvv2jvHbpV+YSfCpkrAzdHQiK1+fYPvuidoJHM4zSwj/zawPMLqjcXpKXer36zhhAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKLjF5SmHDlAW9pDYfhVOttvnWnZv9Fykn+e8fil75ZCCwlL77
	ycybYC4Xrt9VCQ7EgVH9cTPMqjEk27GiLIF8tZfomy33skQQy3auwH+C
X-Gm-Gg: AeBDievNMTqp1DgqNmmoI7v1o3SC4h6ydVN+y55yKDKIpZtNGsGxSalZINGFJ3Por1N
	yYNG8MSJeGutq0TTUqVrrOY2zMkbiAeudeOCgGuPEj2KqTH0vRulQO6VTZAAj/QYESOJ+kh8IOs
	PY9TtFoI1RgbhSLY/UWpPUkqbtwGBuafvoPg6PX/zdFJO2yy0gVJZunsaiKJutNDiCWxsPsxhYQ
	ze4vVfuUDLDBvrpfZP7OoKrnqDj6kInT6n1eDYSMHYbmE4cidGeG3oSSicaN+C95QSEFuTDmlhe
	D0ekov27eDsKYQteRzyQgGO2ZOKwBGK90fggsLUU4HNWnA50yw2omtMUiEd+Nh1jMaGVoX4gluQ
	gIYZ/vZEFRNHOHJ7GPbqU7I6TGMjkVhHqJozKPDrvor5vYmUH4iq5OHgZh4feGj+NRNJY4Yy7v6
	pQjjpq4yxvzqKRCYocD5WDoSJlHBWDrPiB5O449G52DeGstPu0IEpo8ttiAA1hz2zJ6ic7
X-Received: by 2002:a05:6a00:189e:b0:82a:76ab:3279 with SMTP id d2e1a72fcca58-82d001e92e3mr5481537b3a.4.1775215649367;
        Fri, 03 Apr 2026 04:27:29 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b6113dsm5202251b3a.23.2026.04.03.04.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 04:27:28 -0700 (PDT)
From: phucduc.bui@gmail.com
To: kuninori.morimoto.gx@renesas.com,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/3] dt-bindings: sound: renesas,fsi: Add support for multiple clocks
Date: Fri,  3 Apr 2026 18:26:53 +0700
Message-ID: <20260403112655.167593-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260403112655.167593-1-phucduc.bui@gmail.com>
References: <20260403112655.167593-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,glider.be,perex.cz,suse.com,vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-30844-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0E0CD393AC2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: bui duc phuc <phucduc.bui@gmail.com>

The FSI on r8a7740 requires the SPU clock to be enabled
before accessing its registers.
Without this clock, register access may lead to a system
hang.
Add support for the "spu" clock so it can be managed by
the driver.
The binding is also extended to allow additional clocks,
as FSIB may require more clock inputs, while FSIA
typically uses fewer.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 .../devicetree/bindings/sound/renesas,fsi.yaml       | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/renesas,fsi.yaml b/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
index df91991699a7..225cd8d369bb 100644
--- a/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,fsi.yaml
@@ -38,7 +38,11 @@ properties:
     maxItems: 1
 
   clocks:
-    maxItems: 1
+    minItems: 1
+    maxItems: 8
+
+  clock-names:
+    description: List of necessary clock names.
 
   power-domains:
     maxItems: 1
@@ -77,7 +81,11 @@ examples:
             compatible = "renesas,fsi2-r8a7740", "renesas,sh_fsi2";
             reg = <0xfe1f0000 0x400>;
             interrupts = <GIC_SPI 9 0x4>;
-            clocks = <&mstp3_clks R8A7740_CLK_FSI>;
+            clocks = <&mstp3_clks R8A7740_CLK_FSI>, <&spu_clk>,
+                     <&fsia_clk>, <&fsib_clk>, <&fsidiva_clk>,
+                     <&fsidivb_clk>,<&fsiack_clk>,<&fsibck_clk>;
+            clock-names = "fsi", "spu", "icka", "ickb",
+                          "diva", "divb", "xcka", "xckb";
             power-domains = <&pd_a4mp>;
 
             #sound-dai-cells = <1>;
-- 
2.43.0


