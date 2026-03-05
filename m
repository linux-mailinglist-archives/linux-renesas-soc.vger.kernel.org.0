Return-Path: <linux-renesas-soc+bounces-28873-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIknAOtqqWnH7AAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28873-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 12:37:15 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD1A210A9E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 12:37:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6ED963069DEC
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Mar 2026 11:36:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3023638E12A;
	Thu,  5 Mar 2026 11:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V6wH4MLk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B68366074
	for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Mar 2026 11:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772710575; cv=none; b=fc+HqSCLZ0NZ3+bZ1Y4IMHO1hzBpUlYMpzKZVPkSiMiFenL7Yx+Njk0ZTMJjN3stZHs4DoHg6FbLAiAGH9IE4LHhZDoQEX586Md4Dk1o4y/p5eMvYfHWLWLAhKen1wPX8hrzVil76JQyqELNyAgegggDDBGx5FQrLQ9Abhya+aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772710575; c=relaxed/simple;
	bh=XK0nFFbH4MiZSG9fcS0a36y+AVa1RacKkH9tV8iO6pk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HamZEpIAubDy3Su0PLkrno3QRyYaBF3rkUgFcTcFf6tbpcLVr+4bGca1myCEVQX8LFFUDpwKumbVqy1LdlZ89QflT8VWXWtV1I7RxawqIp6BQ3RDLjrbpLCxwxXAA24L7bYvVb9lo1P6QeKBP2Jj7Kw2/7UnzDs05XCwERqL6jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V6wH4MLk; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ae56e68216so30828845ad.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 Mar 2026 03:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772710573; x=1773315373; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DPpOKLGSNmmq39HFqiUGhDOWmdkSAdiRJ6UaDmbkiH0=;
        b=V6wH4MLkt4xWUBGWqX/1ieEIBgl0z8wwJLoP426+M4D/avg7VDd7u+C8mPzg9+2H09
         u0jo+GbDfSHSsXYRT7kL4nTrfUcNxXJavdBjR7d6fRLnyzkojlpzQBtzlNoGPGtzCkX9
         4HEaAJGLgtQJOZi3OYgn7MfLH33YTtqXFMic+vAKV7qvj7OQQXCpEvU0hjanRLArOFxd
         xpe9/QiT53ZaVJyxCjDxpQdJVB6i7a/zSgc69ben0qpWHhXUFVceWdmosUb4L0fnzOPB
         zlkBgnZ19iM8R/nLU5iX5LwTmtJKccnIYGfFvtyqa91x0kNn7g+aNYgTgYlOgMODAVZp
         IcnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772710573; x=1773315373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DPpOKLGSNmmq39HFqiUGhDOWmdkSAdiRJ6UaDmbkiH0=;
        b=WAeLrvH5pIVPtBbZlNU/U44f9NVODtZBWLxhzDFZq5EU5amZGNXbwWAVKi/Dw395cd
         bwKW62S4SYbR/2Wn6v3nn/9FDTmRmlzg2k6xMKB3QudtmnfF/1A4P5nBV9QPSPqLiYPb
         evmQ/OlB7csc41d87xBjWTepiGYSPAZadgDJxsrVHWuwGLJiKEBZzYTUIHvFcbOgJZE6
         u7IpIlfNEvdaNwDxaFQRyOrMQS3iHHImyTRVwf1KBUZFRewyOYwsZjJmki4Hmk7nNh3y
         k3MXeIdzSyt8IPfhhngDKjRERnPWj343/mArULtmWnawCVCMzIxGjhTl6GLd77aDUlJb
         cG2w==
X-Forwarded-Encrypted: i=1; AJvYcCWxiL67GZ5IbFq858Y866j+5C6iKye/Qltdnt9CT/0lvUwGrFPFsD4cOO7qhHEXOVfIY1oiowDGEw12trBRE/y9cg==@vger.kernel.org
X-Gm-Message-State: AOJu0YynGErjmkXMRAF2QzxmISgKyB39YQ/3xcADn7ThiHtvOa2l6mmr
	nzDFZdKNILa+lK0nXwLk0JH1uLcvoqPSTe7EUkOlvlA/MWDA8dLwe8IN
X-Gm-Gg: ATEYQzw3F33lzexjATl7jcZiYWI8o92ULbb3gVI2E7M98xlFMhoj9zzpqA61b+HbMLd
	yg29gtYV5h8UXlz2e9taI9IpjpfZoN9EjSW402aW42A1NAktiqplDT21wIfHWhIMebWEWyaHu7v
	YSHM0hSY6+LA1oJRqJ3I2a9b6AG1pW5W60QLOy/Wi5wFFwBG5sv/4zaeaktzHQoAWJCmvzHlsiW
	/z3SxxmHum2KYy50kHMcEKYpQULX0kO+5FrL6rIS6bgP82tbywBPWiIfTX4nHjI/YjU7Opz8T7n
	/Ejedvj6n65yeR5SbJmDbu/cdXdXK3JKUV1E7CLd2qbo4yXOoC84yFPXLNxJ+aGBgpJnEfx5u6v
	h1dh7tZ689LK2PSxOwj7i7ELIGH2vdwaKKmVCV7LviVYz8lb7PseUPu6/5JrHq+M5yjZdfd8OgN
	VnJ58MFYZ5mrbEelKxMSCadDq/sX95kvqAJ35cadRyRWnHtmAEA9uBRPHFcRRr12V6tMSl
X-Received: by 2002:a17:902:d583:b0:2a7:62d6:d049 with SMTP id d9443c01a7336-2ae6aa04ce1mr59119905ad.8.1772710573331;
        Thu, 05 Mar 2026 03:36:13 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae5e1699c9sm78796995ad.10.2026.03.05.03.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 03:36:12 -0800 (PST)
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
Subject: [PATCH 1/2] dt-bindings: input: touchscreen: sitronix,st1232: Add wakeup-source
Date: Thu,  5 Mar 2026 18:35:11 +0700
Message-ID: <20260305113512.227269-2-phucduc.bui@gmail.com>
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
X-Rspamd-Queue-Id: 6CD1A210A9E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[wolfvision.net,gmail.com,sang-engineering.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28873-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,glider.be];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

From: bui duc phuc <phucduc.bui@gmail.com>

Document the 'wakeup-source' property for Sitronix ST1232 touchscreen
controllers to allow the device to wake the system from suspend.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 .../bindings/input/touchscreen/sitronix,st1232.yaml          | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/sitronix,st1232.yaml b/Documentation/devicetree/bindings/input/touchscreen/sitronix,st1232.yaml
index 978afaa4fcef..672544e5a26e 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/sitronix,st1232.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/sitronix,st1232.yaml
@@ -32,6 +32,10 @@ properties:
     description: A phandle to the reset GPIO
     maxItems: 1
 
+  wakeup-source:
+    description: Device can be used as a wakeup source.
+    type: boolean
+
 required:
   - compatible
   - reg
@@ -51,6 +55,7 @@ examples:
                     reg = <0x55>;
                     interrupts = <2 0>;
                     gpios = <&gpio1 166 0>;
+                    wakeup-source;
 
                     touch-overlay {
                             segment-0 {
-- 
2.43.0


