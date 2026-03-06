Return-Path: <linux-renesas-soc+bounces-28932-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNrAJu+4qmlpVwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28932-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 12:22:23 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B96221F989
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 12:22:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 082B4305DA6E
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Mar 2026 11:19:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E7C937C11A;
	Fri,  6 Mar 2026 11:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ndFK8GrL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2C635B653
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Mar 2026 11:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772795987; cv=none; b=DebIH3pWQ8YCv2h+1GOGT/Q1W5pQ6JCuTxkZgw0+YQoa3O/c+foWi042c+lKI8IEBlSQtOtYzCLdJA+N61/hkUdRLmMo0Ght43pCs1LGWW42Y4+hPxJ2ztrtIyxRSjYjz2TebJ6pd2UyzcpcBQg2x64sWg/e0Hg+11HoaAHuRzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772795987; c=relaxed/simple;
	bh=h4gOd+UQkfsuU8dfRXEsm3/VN4Iz5YJm2OLlL8dMYmM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AleBdjgMnHGdyrtE1gO9VaVu6U+Tch8BKjSPXv2Ea56XCV8I0V5m1atNZewcybsPHUeLwbVwm457d/jZPft+lMrDmejyz4x4TTpQenoEKKvDgPsXTOTmzj63hJm3qp/QJlrXWpWm9IbPkjWn2lfXam5T4yV9oNZmVt0C9Td+E1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ndFK8GrL; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8299c75f730so559362b3a.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Mar 2026 03:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772795986; x=1773400786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eWAv+cXchBb/HIG329G/h7rJcEkvvlkIxA/O7EdGmJQ=;
        b=ndFK8GrL8/KeRMaoM5+AzuOtSylcP8MiccGVzhsZ45VSDt5/hyTPbWdyW/LbmJKYMK
         nuFIwh/6qyggqZX9RC/D61eav+7mbsMgBZx/aA+Gzrj2UBqAKnBoqzNYOXx0kTi/RFRb
         tv+OJmpKrfabUXti8Yo/BtfF8P+oy9NdQ8h+4f1dBck+X0O1kgLeJGuSVBDGKQglGW0j
         s6fYLYjFgc9vCU0exeW+jhA1H9iZPrLRGK7bgKep6Tqw+hgCQkWkM2eafznnOjH7ClOR
         qY1grf2NtsmvWqDCYUAq/VnWo075hk7j7LMg7cqx7wVgnfz9xyINQ4KAoMK575P7zJuA
         GgNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772795986; x=1773400786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eWAv+cXchBb/HIG329G/h7rJcEkvvlkIxA/O7EdGmJQ=;
        b=cDCA0oC9plI96b60O97AXVyGWtxNq6hMnuQOu7mkdMlEjeAquJ00sGIU08MLen7Bxp
         BfHyOa78J5eaONMtZHRMS7u7ATGoWembhqZvokSFxLuOVRN+/aPNzckcRsrWvKMyqvw2
         wYkR9xpj7UfT3aSqsQvFaujgxWBdULmrVyH7Rocn0vaQxtJUF8df46y611MgTYe448ny
         zDSiqKR5x1eJPc+z1Gz3vY3BJZROB8IVUPpURNNRwpwmxH/HVrwvFZlIp76Gvu+SDwXs
         IqFXc7BCr9ahcE7OrZ77yKtFGXJI+ZGynN50Nr73Q4SxVFSh4ovAUdlYKR/8OYgK8JaO
         B62w==
X-Forwarded-Encrypted: i=1; AJvYcCUUH5gvqLA23fkrpzhma0ETqIqM2OScVU/GDaDR2efyQqUMMFsEwb/HKgk1d8aUHAd1/XSpIIt/uYd/T5DWN/Fv4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKKXteMHbN4xLwcNDZ9GnYS1SI+bpQUIIEWtQsoETCDyO+cNsg
	XcFGr7HgEqFXs/ISEYvyubaho0NDIjVvi7TgN27ZADg90yhV3baY2DUh
X-Gm-Gg: ATEYQzw4f6BiAlJ7/pz/1WuZa/mQ3Lco8/06VO71VtjZ8N3ft3KcVi+DMJ4zGzbL7tG
	P+Bdxw7+IaTRGLGnFKxetHjjOlGQJ2tDfl0uwrQUKSc29WOzZM/RcplLPjpbxTZloFFuddrC85Y
	ID16uIFRM6H8nF17ugSWM0HU0oS0+jCrQTrzXt9jF6qoKTUl3CkR4qRDAhoKadXSH3VJBP1bn64
	1BODytFtqq0j0hd+yodS4h+CK5t9pd9TsEqC4tbzXBc/sKDU+yz3c4Z8wXIRmVE7XnyMDtIlRIS
	t+E1EjZYGgR/1m5Z5wgG6+V+TrKMe4XM2sL/gw26WlhnDrjyzhWSIp/R0RV6Fm/C9p5ct6SISkA
	XvInJjQijuqQ4lzUNSe2xU8HFIGAI7TrJCk3T6/kO9gTPLcGr5V2C8h/jU8GQE/0X14B0REpC57
	Pf4JspFHDY58m4iUapxov7qgRG0waV+jHnLi5KhmyjlAEf+UFQQyct1F7v3w==
X-Received: by 2002:a05:6a00:1c96:b0:824:b03f:2f65 with SMTP id d2e1a72fcca58-82985586d87mr4495740b3a.7.1772795985792;
        Fri, 06 Mar 2026 03:19:45 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a4636cfbsm1475973b3a.13.2026.03.06.03.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 03:19:45 -0800 (PST)
From: phucduc.bui@gmail.com
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jeff LaBundy <jeff@labundy.com>,
	Bastian Hecht <hechtb@gmail.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/3] dt-bindings: input: touchscreen: sitronix,st1232: Add wakeup-source
Date: Fri,  6 Mar 2026 18:19:10 +0700
Message-ID: <20260306111912.58388-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306111912.58388-1-phucduc.bui@gmail.com>
References: <20260306104025.43970-1-phucduc.bui@gmail.com>
 <20260306111912.58388-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0B96221F989
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28932-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,gmail.com,sang-engineering.com,labundy.com,wolfvision.net,vger.kernel.org,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

From: bui duc phuc <phucduc.bui@gmail.com>

Document the 'wakeup-source' property for Sitronix ST1232 touchscreen
controllers to allow the device to wake the system from suspend.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 .../bindings/input/touchscreen/sitronix,st1232.yaml           | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/sitronix,st1232.yaml b/Documentation/devicetree/bindings/input/touchscreen/sitronix,st1232.yaml
index 978afaa4fcef..fe1fa217d842 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/sitronix,st1232.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/sitronix,st1232.yaml
@@ -32,6 +32,9 @@ properties:
     description: A phandle to the reset GPIO
     maxItems: 1
 
+  wakeup-source:
+    type: boolean
+
 required:
   - compatible
   - reg
@@ -51,6 +54,7 @@ examples:
                     reg = <0x55>;
                     interrupts = <2 0>;
                     gpios = <&gpio1 166 0>;
+                    wakeup-source;
 
                     touch-overlay {
                             segment-0 {
-- 
2.43.0


