Return-Path: <linux-renesas-soc+bounces-28926-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UC4/C2uvqmluVQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28926-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 11:41:47 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A04EC21EFFD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 11:41:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 088E13037893
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Mar 2026 10:41:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A17053254B3;
	Fri,  6 Mar 2026 10:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iIt9u1A7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0AF330641
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Mar 2026 10:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772793668; cv=none; b=L2uYQjOGHaSHYcJbIsdRKdQYetgnzRWoMa4Eu+0j+IyUg0PE5T1ahs4m8bXHdxoAOqnOeIz17So4rLCJhCVmK8SHNLUrEoufl88hkQPSC3UsZ6QfeZsYcyg4jNye9oOUM7Q3dP9Dzg9E2axoY/2PtMV3xtgTX+k/gkFUg4SNGX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772793668; c=relaxed/simple;
	bh=TJITmyCLoFI4WevaGgqd7twsgtYri7xyyfq6zwNFpz0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jPYfwqrTBFtVXN1Y9rT7Yg6Rg+hWAjwinnjmPmOyd69bItdTPROxbw33Ntl96cQ3/y+RmJY4tus5RYbzvk0XVOKhTEse0FKb/soLml38mY019OyoGet68z7AlvDtTbE/npwfqzHHFMwABl9iqTzIjRiw+sJNXqZ14e+nWvgFsFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iIt9u1A7; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ad4d639db3so41403915ad.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Mar 2026 02:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772793667; x=1773398467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7rhUejIrQCco2TAE64/xhR9iZ0UV/0oq0FcF9FFdRas=;
        b=iIt9u1A7mNtUo+PCWlehO7WCzPmbWM5ogGqyJEITZdFxKPP+0qG2+2HFkQYG+dG/lG
         jlkWdM+HrgJkWMQyzB1G+dVb+Qzu8w8yd667VbkUQ2y93xKTrAsrG2+dfhEypcZ5SfQ6
         8Ee25rEnUAIMPI/Wb9WJCPLDT34BLTbfSSsoaThyd25RVAuWQ9ZDt2ZeOLI0Zc6hjIb2
         KM4y432WNRTTCBvTh8n59+R+El0iTdcKJ3VvpN9nTFwSULBMJ1J1WMWpa4xDXW32vDAQ
         Fzb8WB9pWDDcaGS/aXDhP+SYJcDLw5lmVt9aq5WQ3Ae5Iuxg5tohaikPUzIbHmlDrZkW
         cVrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772793667; x=1773398467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7rhUejIrQCco2TAE64/xhR9iZ0UV/0oq0FcF9FFdRas=;
        b=HS/bZW8uu2CBxORrhPKBr9r0qnDPI6HjMBf2lmsLr+E3RDG6FIHFWwEUAL+nb9Vwzc
         HyOXkFYUPJxi9c5yvQV8MJFLhAovb370FHnML/wv0qavCKi+jHPZcws5Kd7LHB2D0lA5
         Z6wKhYm0Z9XIN3TudfMTc1ykTGF7yLHvD0akmFzWzPaHfHgfawDh5aa8vAt6BKvEiKxp
         8DlAd6kBKDSYFWFnYkm2lAyvFpxYIp9mhQJ6yqMQ7yWwuUNJnKg1eNsNtzAPxQlRGKPX
         hNywNFcmpuMLqDVh6TUvwRwq9w/MxRaA3KF/j+uNI7SZ3WKHGhaJW7wtMWBUF7kkDibN
         4lXQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3NQd2p6oMYu4iSsqku2MShmPKD7SeD1K/u4M0geO+iaZa43eovXHHV710EAown9S2is2w3q8X2qUEbykRGIqlRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwazMweqsuslqsmMY5SxpIdV4qZn59CHqHrxOsN10miV+9n19yc
	TvKn4L71Zj9QVwitL23vs+HbsXvO4llAI6SOwD/0iQRcq7Q7KsJ3Qi88
X-Gm-Gg: ATEYQzxdFNmf8zOrS4dADUvsRliiMsV0P2adSlwphm1V3RgnR60HHeNTKSvaqmrLf9T
	GQiSfptQfzfDzUUGjfb+IPyAXWg8Ui2lV1cdBPsXW6OSaxQfEBdOU7eiwmRpMao1uzpurKrmo/h
	UbWEtQpC3L1y2dnlVv+TnX2XhY7VuibbpbfADpZdk4hN291ziAaPfG/hrkCWs2cr4h+AGWQOb2a
	04HQWrU73KThIzRf/riPPBTS4kJQwj2fNAD4fz7RrKW9DnW9c7FRdEbdIsP2luapNqub4N31cDI
	Or3/eNojDAwBjvaT5eETp7FDFaFJRJptqdsuYNrlTtHGU+V6kQP7I/AbFzIqtW4qFOSPNaqpiRd
	F4oyCF2y74piUBTtTOV+Qy0lKAUmyOuNKJDwSZL2oZnh3tNomKaKOw3WM7uYNZey6KFhwTfoVU4
	rNMcZ9XM0PnJsU4euhre0ZcZ8tC6TtcgcprjQHRP0ptqnueXE337XKKXrCEQ==
X-Received: by 2002:a17:902:ec87:b0:2ae:5a70:4786 with SMTP id d9443c01a7336-2ae823a958fmr20001125ad.25.1772793666799;
        Fri, 06 Mar 2026 02:41:06 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83fa2fa5sm16107775ad.70.2026.03.06.02.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 02:41:06 -0800 (PST)
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
Subject: [PATCH v2 1/3] dt-bindings: input: touchscreen: sitronix,st1232: Add wakeup-source
Date: Fri,  6 Mar 2026 17:40:23 +0700
Message-ID: <20260306104025.43970-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306104025.43970-1-phucduc.bui@gmail.com>
References: <20260305113512.227269-1-phucduc.bui@gmail.com>
 <20260306104025.43970-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A04EC21EFFD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28926-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,gmail.com,sang-engineering.com,labundy.com,wolfvision.net,vger.kernel.org,oss.qualcomm.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org]
X-Rspamd-Action: no action

From: bui duc phuc <phucduc.bui@gmail.com>

Document the 'wakeup-source' property for Sitronix ST1232 touchscreen
controllers to allow the device to wake the system from suspend.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Drop redundant description for wakeup-source property as requested 
   by Krzysztof Kozlowski.
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


