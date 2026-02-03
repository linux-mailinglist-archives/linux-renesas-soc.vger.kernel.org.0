Return-Path: <linux-renesas-soc+bounces-27830-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OIVwBJH0gWljNAMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27830-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 14:13:53 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACA5D9C2C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 14:13:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2644E309ABD2
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Feb 2026 13:10:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A7F534F490;
	Tue,  3 Feb 2026 13:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jrQTZfqW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB2034F27C
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Feb 2026 13:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770124256; cv=none; b=demPVdCbmmkj6kyNFjcNw2QvUIJeQxS/z71M6XfsiY12AjRVw77koyMWsaaSv1aNjIPMiAqz7ElTcyZlb4NTcfJ/uKVUZ/iDpM6krtTg0CzLDYK/y6yPoL97+oycHVYmRyWlJ9rL2PzRxSPhTAboB+8pXkNva7eXvp8qyMQiyVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770124256; c=relaxed/simple;
	bh=MfO+O2YIqgFjV0xMOvjI6RbABmQ4PgBS+Zzi7LOgdkc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n/nrehJ9ygIfZQSET6KxC8DuIcbF0OXUB/d+mQL0niUsm6KYEp9zPqQMf/IyHfQ4aZg20xLt6nyP184sZs52rQ4erw3y/pygzTxzbAOTu0nB1WJTLadUvfiwMtXn9xThqlziIlwGH8yhEca6yR42nLA8xDI5wvixHN6qhBbEk0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jrQTZfqW; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-4801c2fae63so43195585e9.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Feb 2026 05:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770124253; x=1770729053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ghdEIhwuuFTCq/342nL9qPsHPejvBlYx6BjaZbJT+n4=;
        b=jrQTZfqWLuok6MK1jHkOVhBUPzDys3r2FvUurxxfNFufuPG/YkHNhPQdfsINFcBCzT
         m4GM8oUL0oS9SR4gtAkD2XYFdF8Gy3j3QPNzRcw3EpvrSizMVdUTPTKjLr8FSEnzCrw7
         DIy/uAoEX+j2ZAu2KbuHwaKNliQwDD8A7uhTLzLy1J9sPi+YdyZQnC6wq7I6+vQD5ETE
         NT4V6I+cly/6NRIQy8aIrG/0fj+NmBEzCZDEMFfWz0sKb+Q/rscmgpAgtFlY1Dzj1+cm
         88prTDyQZYGYYiRYBt3R8ZcW3tkbeSIRN25f3BouFSCLyzBB1YAvm7+gNVx2ZmSwTCqI
         0NsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770124253; x=1770729053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ghdEIhwuuFTCq/342nL9qPsHPejvBlYx6BjaZbJT+n4=;
        b=fhek+KVCI7X6f/22HHGQb0bplXvIaYkNVTgjeY5JCLsPzYcavJl5WSp/6qdnF8IyTT
         YkXCFkgBoiFiJJKm0eWdnmtSfSw+NA2H1K42vIMgztbMFJhmQ+H3LYI5YQXn0lhL6i4x
         mkHHRIBHh10bw6C1HOM0LpqOVEdGZMeUr4m9wqGudue1QBpgB9b/QrTI5wbgC/NRl5Rw
         TO6Nfu5IyRzmTG9Sh17XVIt8HsSBZqcMDlC2OmvDbign7rWi1EsT6qAcSwj9VaPqJ2bo
         XAZdhxyAaiiqRNMJ1hf1zzsNbFucQ+DIEqApyrIPb6dPH51FVXzt2fZwHm6NjbzYcISr
         g2IQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbd06fGWmgjIellg4dWSVqkSGTiQzWR3YEtKJP0CiNwUcRD6KmySkXiBqwAJdO15V/RdWsxFcGVHbViaw2IWUGww==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVsTtN1LkKifJ7YDEuIS/U3ViH7lmOBjQsG24I9Kxg70SQ36mu
	Tvp5hrYM+ecnCTEYwB/Wde4A7VW+6qAPotr/328tB1bn0dD0j05Ugicv
X-Gm-Gg: AZuq6aIiQ1HYGOCxqV7+6b2JbrL3ysBjfdhXtxZ2VK7acUVMBqQtdSS71l4fkPQ5v10
	VnKvV6UFNDiVBRQWwsjxxS21i8oB0e2liC/bnX0PtimAHMmV4JdPCC3THhVPeX7fJUplMD+9MA5
	Qpn9fuZMcn6kGj0sywDgXoh/Y4jywNQ6c3IOfs3zbKwJta2m2gleUq9i8Y8JAlmUfk1xMjTnIYJ
	civDCmIzCJ98sE/IUN1dQnd1z+LYtS99S602YYZ0GWFL5Im3TPrdRCIjb4p5DO6UlGiicMPw57Q
	H+v2vQSxRXrkk1tVRNQNAAaZ2Q5HqYYg0SS/gDGD+YKVZrzZFBLGgOasZnRE4R3VZM6TsEyNhqs
	Uah9hF6ZZpAFNZt3SgRu7S9PemxkrNYHDM5EF2/U6f+Tqyvq8xh3cbK0dzPc7lPCwQcd+PEPyxG
	yQjD1R3nOyiKzuQ/iHIA==
X-Received: by 2002:a05:600c:a087:b0:479:35e7:a0e3 with SMTP id 5b1f17b1804b1-482db48f2ccmr214592465e9.30.1770124252683;
        Tue, 03 Feb 2026 05:10:52 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:9cd9:f748:166d:55fc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830512ddd0sm63662185e9.9.2026.02.03.05.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 05:10:52 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 01/10] dt-bindings: pinctrl: renesas: Document reset-names
Date: Tue,  3 Feb 2026 13:10:24 +0000
Message-ID: <20260203131048.421708-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203131048.421708-1-biju.das.jz@bp.renesas.com>
References: <20260203131048.421708-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27830-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,kernel.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com,microchip.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:mid,microchip.com:email]
X-Rspamd-Queue-Id: 7ACA5D9C2C
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

All SoCs has multiple resets. Document reset-names property.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
v1-.v2:
 * Split DTSI patches from bindings
 * Fix typo maxItems->minItems
 * Collected tag
---
 .../bindings/pinctrl/renesas,rzg2l-pinctrl.yaml   | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
index 00c05243b9a4..1a94e396b1b0 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
@@ -78,6 +78,16 @@ properties:
           - description: PFC main reset
           - description: Reset for the control register related to WDTUDFCA and WDTUDFFCM pins
 
+  reset-names:
+    oneOf:
+      - items:
+          - const: rstn
+          - const: port
+          - const: spare
+      - items:
+          - const: main
+          - const: error
+
 additionalProperties:
   anyOf:
     - type: object
@@ -152,10 +162,14 @@ allOf:
       properties:
         resets:
           maxItems: 2
+        reset-names:
+          maxItems: 2
     else:
       properties:
         resets:
           minItems: 3
+        reset-names:
+          minItems: 3
 
 required:
   - compatible
@@ -187,6 +201,7 @@ examples:
             resets = <&cpg R9A07G044_GPIO_RSTN>,
                      <&cpg R9A07G044_GPIO_PORT_RESETN>,
                      <&cpg R9A07G044_GPIO_SPARE_RESETN>;
+            reset-names = "rstn", "port", "spare";
             power-domains = <&cpg>;
 
             scif0_pins: serial0 {
-- 
2.43.0


