Return-Path: <linux-renesas-soc+bounces-28742-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2N1bApXcp2lnkgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28742-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 08:17:41 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8239D1FB7CC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 08:17:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3D8623004D35
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Mar 2026 07:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A065D3101A0;
	Wed,  4 Mar 2026 07:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QLyvNLop"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DCA2C9D
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Mar 2026 07:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772608657; cv=none; b=ZvXEDHUSTySNKXlbcPIdZGpdM2MJrCRt0/da+dt7QmuC/oOF3MfYniLcsHMfYMslshEq/YaAjl40Xokyc872oYSkMonQBu2ngCg6AQzKN5FGGlAOOB4Yr5yeEjAWmrgg22tZbG2dNB4qNbU6w7oUHc1JeOnc5OGy8sm9Cj4z5HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772608657; c=relaxed/simple;
	bh=lg9Plg6ehWx2bwrEkj2iLaG3vmxT41ElnQvc2Ca4Vho=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=prwX5UEBKGTBKvpKzOl8KbmL7iCiQhnSjGE2XMCtkCM3Ph0ZuotP/8JJhp3T2ZqHlTLMPkWhT35c6ZtFJPWNhH0xrP1tbTyG2uHH8yeiQeIxq2irZ3lAa7wXurAilc4kU/V2SDDfjIK0H4AKfvHiP1ToINhnq79rOGyrgpFDFXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QLyvNLop; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4836e3288cdso44068855e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Mar 2026 23:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772608655; x=1773213455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qAL/6lymAWTA7sTs7WSo0rmin+wjAqXDkMd/c2OTImY=;
        b=QLyvNLopHdgZAfINRXWiePVGk1TPL8TlIFWDKlvirwHGVzJtc8Z/i8TSPO6799iB4E
         aTcLbAGglZkj12/FeWsjk4f5zZ4ZrNXpSry3FoyKzsdYx9xrgKUF1PjnRdHJCANxlOLB
         Z7jmnAEJkWlgJEmHrd4cmUu8EF7eAWwG3hZqTUPvq65Kgo55YG8M5XRsKpoduaw4sxkT
         YiBoBpZjF13CKG3zt7qJAMmytphGROPTKBsQCHkEedxxvnG8po87lRb2bYx80IxLrzQw
         S0yyweXePUKwViq3jR6cD1bvaa+SxEk+KvU+kxiSnVOs1lHvyqrZCFdf2rhTerlmKLXl
         IoQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772608655; x=1773213455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qAL/6lymAWTA7sTs7WSo0rmin+wjAqXDkMd/c2OTImY=;
        b=mFnlXLpgpcsJKymKGQTajmzAmFsuZRIITDk26eJ+faVNmOMReYtuU8r8v0N9A5+KDT
         EZFatBeA49EpHocQ8EqBO11XTOAIhKzgCnALXBKl6RSC4jCekogz/M2fqbAwMJjeTeX0
         2L9dbC5H8CNT3XuAe16wBAMJKL3p/UNpvgAtEk3pO58f6kZGBHzWZFnuk+Iw1iu35Ujk
         ywz/dg7ngR7uLs8N9cmmWmzy2t8wGpaD2pVFlMJ9zVb5QpbItqbvMXVx3lZf39Ab50uH
         vXNvMTedWsZfaZ6AS1uCiLnePzcj2Rd66vog/nEAZQiMZDees5V6AtkVF2PgGadh132r
         TP1w==
X-Forwarded-Encrypted: i=1; AJvYcCXIUK9gBvshg8nyPHx+D3Q4V0lL3arD9uVFHmFq8Ig/MFKOItNHUSuNqN2YNk7XBTwdXuOU/yy28MMAy0GCosaIhw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6vuXhCu7wg3yZ51C3OHSRQ898D6WtjVKCt28QfeZPLs3t979o
	HDwXfPpJX/GeZK80xmZ4wFhssYfq0BJLPxn924B4zPvqiRFMUVc0NY2D
X-Gm-Gg: ATEYQzy548TY8UCXOAipoxGFk7OYg9i9YcjoJ0etUUPC8YZmnnfFQUAHew+EjE1bMtu
	N1p55AkOWlQdml8iKdmJgX02f5r1OQXlPdAbo7YltbcSx9aKB3vDZcf3qkiFWro4VsZuh2xLl8Z
	er4E8dykmE2oJYNX0jUGL6pmHYn2oy7hlUP3niROORWMfG3JB2Igt3jTQhPylenr3o5N+b80t3O
	eQ8L4u8CoALbL+2Xb0zsD6p1EqTyxiN7iHidJ4HmgZ/oY0Cgf01RcNiifMBsLOcqF3ApZNBY3io
	EwjEnoJQFNbkzvHN/YvGlu4pJKYwXWZ0txMg6ciadVvOKsVNb6C5yOsAQFPsneQun94SSSIajfW
	+bXLLlv5ZjYZ8wS1LpTgeFo5m0VY8yRBcSGwoJtuK+b6oNWkkl5DJ7cnbSpNAPpOnDu1n9NLZsF
	5ix7v+uF2IT5DvgYYQ9d7af4OZM9t2M/Q=
X-Received: by 2002:a05:600c:529b:b0:47e:e59c:67c5 with SMTP id 5b1f17b1804b1-485198843e3mr13696315e9.8.1772608654601;
        Tue, 03 Mar 2026 23:17:34 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:de3f:f927:40ff:12a6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851a8aa589sm4931045e9.5.2026.03.03.23.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 23:17:34 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH] dt-bindings: i2c: renesas,riic: Document the R9A08G046 support
Date: Wed,  4 Mar 2026 07:17:28 +0000
Message-ID: <20260304071732.5864-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 8239D1FB7CC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28742-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[renesas.com,kernel.org,glider.be,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[bp.renesas.com,sang-engineering.com,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,renesas.com:email]
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

Document the Renesas RZ/G3L (R9A08G046) RIIC IP. This is compatible with
the version available on Renesas RZ/V2H (R9A09G057).

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 Documentation/devicetree/bindings/i2c/renesas,riic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
index 6876eade431b..ae1f71eadc66 100644
--- a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
+++ b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
@@ -25,6 +25,7 @@ properties:
       - items:
           - enum:
               - renesas,riic-r9a08g045   # RZ/G3S
+              - renesas,riic-r9a08g046   # RZ/G3L
               - renesas,riic-r9a09g047   # RZ/G3E
               - renesas,riic-r9a09g056   # RZ/V2N
           - const: renesas,riic-r9a09g057   # RZ/V2H(P)
-- 
2.43.0


