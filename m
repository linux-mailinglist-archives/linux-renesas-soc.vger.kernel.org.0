Return-Path: <linux-renesas-soc+bounces-29042-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CEZlLoUOrmnh/AEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29042-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Mar 2026 01:04:21 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F06232D54
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Mar 2026 01:04:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3E91A3023E22
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Mar 2026 00:03:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D67D155326;
	Mon,  9 Mar 2026 00:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YsmNw0g5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012E54CB5B
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Mar 2026 00:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773014636; cv=none; b=fAJOzGpuk3hVVC3T/nE6FuCgGgJG7x9eIhd/7scXPn6w7ZYi2SOypXr5J/OrVz1ZYYs2ES7i3hJz4vNHw1EzXL19KkhBVz89NNU8c1OnAVHVnqvMJAMPvZSLClJEYDfvhpNStEeMTCtWVbjqQTgCsLndPBmedN0bb90lvxeBceg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773014636; c=relaxed/simple;
	bh=h4gOd+UQkfsuU8dfRXEsm3/VN4Iz5YJm2OLlL8dMYmM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XLCSVxYyNm7J86MXt/Iu8VcUOxajyhNCIsc73v4USsImJFfPln6ZNR27Hhx2vcgYUXjk1e3k5QRj308wGzGyA85yL6CWFsj2B17KnZHVQeajSorUw71hZ1fik3KjhjK0ni1/HM6CpFZH8XiYZGXWJ7fR2Z0o45Axo6bETeusiwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YsmNw0g5; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-356337f058aso6000659a91.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 08 Mar 2026 17:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773014633; x=1773619433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eWAv+cXchBb/HIG329G/h7rJcEkvvlkIxA/O7EdGmJQ=;
        b=YsmNw0g5ICHBXp1wi5KxzxBt95g/1+5cEyynOYoRw5Tf8fx8kdcmLlOL61ir1AuT8B
         RKI50BPJsI2zY2m4YTEIqhn0B9ahZE0s0xavyGlpGQHgexB9Tr6FwsN8oBI2YyURp8X2
         RRTKHe6MewKGrGDtHBzujx26nM2oXWXktHp7sRj+nXwKbF5qPMKVzvPAOqmxqgPwlVSB
         YECHRjfQxyvywrpomw8B4dt4RuDN0omld2wx9Bd7oHbhyjz4Mqfdk/HmtaWbrPW7YRim
         tVgIV+hmhNSPyb9zQ2C/UIwXyBI3g+sGi8EQ/GEKA5VXi5IzlKTWM7esW1s/Q70H861Y
         o5Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773014633; x=1773619433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eWAv+cXchBb/HIG329G/h7rJcEkvvlkIxA/O7EdGmJQ=;
        b=A3CEEE1Awonh4IMefxpqeqlO1zjFymb+5FrLyFN5ciP776Z5R6olfMY9iTnhq+4LJt
         B2/VtwmuugAfoYp/AX9cHgueIiC/B7dgn4L0kN/Kqvm0KBx5RcTbkoqYwSt2KmpaZQYq
         nSoPLS2srNQfmFFKU7B0xknvfTi4fzl5QPUKJUcmSYNhOW5/IJ69e+d9OG24Oi3jl0Xf
         vwG6/NWpYtLmFjll0kXlbz4FzSrB32f+U6bWeTrSXs5T/xswTXm6CkE8QCG4WGhjj1MI
         mQvJgEUnhV9uNEZX9TDKu/dnqPMsjKkJ/uTndgKPCNW1yVGva494S5r5KFrnHRehe3FU
         QFRg==
X-Forwarded-Encrypted: i=1; AJvYcCVzsLEG3Cqzd+gN0S9sMGUcBuZFeZa4+m2GNr0S9Qp5szAiadwFkv2X0j5ClazUSmDU/cqxEQMk/OU3YWczkcwziw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz2EDiqRksBhrqeZcSHLErsfo8ELlESGr+dDf0yTPYsXx0kup9
	hBmrtsCSjsPAZqS8LPzwJ54IAxgX062HGHIu9wrngShV9Hda3FUH5UgX
X-Gm-Gg: ATEYQzx/U5eMKlWRZsaGyXWrte40Qb4w1vHGiO/k2akNudy6gp3OwH/tcVvoxnFLqMB
	eN+GXMTjQ+XjhRyjLVMd+fC/bMRATlRqtF4LT896YOcuJA9ZNU9B80nVc8oX34mreKrLunC0EyZ
	4+KBbXAXeOJDnxRzxX5/QTMfdvO8VbRxkZvopYo3vbU3djKaUAXMy9BBsU1IuEMTsc/fHMKbUQJ
	8Cekx5w2dy9Bp2PknrlZHqSur6pGBHXY8CxPdNDbwP8V0QxaG3RAnF02l5keXi6Ljzhb4e2lwb+
	gHyWJK4s4D7TZ6LE9BnATdbuyOBZ309W4YTWSERCstlM2kIppQ62GEgYQWj3f7j8m1ejPZn3Nt+
	6/G/dyOFwVgaLxkTHVPyVyPKkbj3FUKZd12FR2U4Z3VOXGp+G92WMTkEaFyKSWgBGc4jH91Ar9V
	R+oQLExLZbIXBVn53Uxz0oVyWLaN+6OV6SXY8T1ydGxGF1ubvbyuIOddTq7IEqZc7PAOeA
X-Received: by 2002:a17:903:ac4:b0:2ad:c66d:ad06 with SMTP id d9443c01a7336-2ae8249420dmr91012115ad.47.1773014633289;
        Sun, 08 Mar 2026 17:03:53 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e9b9c6sm104845405ad.29.2026.03.08.17.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 17:03:52 -0700 (PDT)
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
Subject: [PATCH v4 1/2] dt-bindings: input: touchscreen: sitronix,st1232: Add wakeup-source
Date: Mon,  9 Mar 2026 07:03:18 +0700
Message-ID: <20260309000319.74880-2-phucduc.bui@gmail.com>
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
X-Rspamd-Queue-Id: 55F06232D54
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,vger.kernel.org,gmail.com,wolfvision.net,labundy.com,sang-engineering.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-29042-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_NO_DN(0.00)[];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email]
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


