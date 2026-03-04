Return-Path: <linux-renesas-soc+bounces-28745-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJbHDQbkp2nqlQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28745-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 08:49:26 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE991FBD64
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 08:49:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2E8A5304004F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Mar 2026 07:49:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ED0E3890EE;
	Wed,  4 Mar 2026 07:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DfihW+zb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5608C38758F
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Mar 2026 07:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772610555; cv=none; b=RVuTnXNomr2XGv9sWa0L8iOURpBBeEPM+WyrdeSDufPJk0SIZjZCTQrrXxR0NL/anjyRG2W7Ft+J3HzdUJl/1i7GojXbs3/WjU9l8tM38gDkgHUGL2xaT2NzD/CVZBApejrwWsdv5GJgN+g+b2BbrER8XX9fHHa/h5Fur0/O40k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772610555; c=relaxed/simple;
	bh=W/gkJJRsBNmmDGEZrfvnRL/7vtpQ92mBjqKdv38MaT4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n41ypCJYFgwjbLum7yz7zjr5k47CqOEFafm267vbYQIC+V0oG/u27J+DE+mBH3TudHV+XeV4CgwdbJRr0UgwFugskrKD4TSxR06HZPBuhzi6nBnq3eMojbMdBLidVFqa3j34Y26G9+WEaLIJIu82SOBXdlOiwPRNWoUoUn6ntyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DfihW+zb; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-439b97a8a8cso2892704f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Mar 2026 23:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772610549; x=1773215349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6k/AXbMZKCU8LZhAaykl/fQ4j352Dp/B/wMW93JEDnY=;
        b=DfihW+zbG4T8ZR9+nHidpJaXkDZszekspwv3Il8QeymShqAt29F1A7PAxfuMcBYsl6
         jy2NSZ0EaR+85mRS7Q3J+mOxuezYIdRahCmtF966bO1pK30NBAPqaP9W6QjShNNkq2v9
         QUk74LgSsK2NoWYziCBz8ntLAdN/S0LHLzTHt1Lzzs7VFgkGzOF/6ZQdd+zxfubtajAr
         nQdObtYGHhyZk7QRZS6YpvO0oxhZCqYj9UqVU7bVAKSBd1VDvDsHINYPqYJXP8WqyL97
         uWI7dF1unYDQWlEIjy+wbceIgKxrf+aWcoBkJhqvzeteZk9+zuNhV4qXGy80ZCRn01Zo
         69AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772610549; x=1773215349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6k/AXbMZKCU8LZhAaykl/fQ4j352Dp/B/wMW93JEDnY=;
        b=T1dbnPJnJVDOtdr/hKCW2+JGUT7QRvb4CN6FEVuG0YQ9eSS1vQKMPXGnYQwObGKtAW
         Rg/xqd9T5nJZCj8EHncDfphAioI7UDsOF0yge22jqMj4lZqPyzv6dSk9i/KI5AJBJAe7
         0C7dpgrLDZr3FqKH3QQzOnyhaWLjH5avezoQt4ejQk1YPxchn7lWlnpL2gB1t5b3mJQX
         w2mQJYSAbwRoiABd06YN1bDkSH7kBq7vCb4bSpvYWZjAVhqiMSXOuxN9q0Wcfw1MJJio
         ZxFuwGEJ9bdJ5PrqXkoYmRVAUuqvFHwjToS0shlSRSeBvj8vvLjlZ879sOnx6KhQEYlx
         tWTQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7vlVLtvNtluLElCK/u6zsSi+wYJlTIDuGE1fEZIK6nHY8A/bfpWW15E42igA5rIAkJz8F+hQ63bAhIhQZgI0odQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhLsisn9Ok1Tpvd3xUaF/hJYnBuxW4jbGW/wxuWVJkbop4m07s
	tvUnaqnyr9A/xbmpDA1lis9ouLjuo5STtiWRqBJNhqnh25QflvdR26qF
X-Gm-Gg: ATEYQzyS7RsNN9Av/sfI+zSfpGYa+jaMkHV6A8CZmuqtVGByZ53bUVc3whjZ51ly2zN
	rPbSOhIIR9Lj535ZhG9aw045VLkEPGY+8aZ35CCyTvjSLbswf9b/TP0ZYqbHgv+IwMlb64OzncE
	EAxFAdk9SyuCFZes9wLSDC5XHrvMuiLpl/kiXOM0ZM69TI2zQBl2kg6SK1XlJ9tGekMgiy8wGId
	r9te/7nAx3lhr6fXx32JbimtZR6cYiKtzHkQmgIlvdI83UzNBLO+iOe1ZZVEg5+Wznvs063STz0
	snrXUosLtmlPoXoVAd/KeBdlBGsKw0w/K5/A1KsHdq5EwsIIEK3X1UaWs1OAZiEpF3zT3h8b/Ox
	3mp1K1j6cm6WXj0QJGrIxWzdtKOVhZWtXOb84ch73q4AXpA9xFhGRaSTN/F1FpNpOlFqDovY2pP
	IIKDIScC+gn36eywd3FVgJbAZlzE8og1WSrhsaHIcXvg==
X-Received: by 2002:a05:6000:420f:b0:439:b715:6f4b with SMTP id ffacd0b85a97d-439c7ffcdd8mr1915714f8f.57.1772610549469;
        Tue, 03 Mar 2026 23:49:09 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:de3f:f927:40ff:12a6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c75a25dsm39957572f8f.21.2026.03.03.23.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 23:49:09 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-spi@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 1/2] dt-bindings: spi: renesas,rzv2h-rspi: Document RZ/G3L SoC
Date: Wed,  4 Mar 2026 07:49:01 +0000
Message-ID: <20260304074907.9697-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304074907.9697-1-biju.das.jz@bp.renesas.com>
References: <20260304074907.9697-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: CFE991FBD64
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28745-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[renesas.com,kernel.org,glider.be,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

Document RSPI IP found on the RZ/G3L SoC. The RSPI IP is compatible with
the RZ/V2H RSPI IP, but has 2 clocks compared to 3 on RZ/V2H.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../bindings/spi/renesas,rzv2h-rspi.yaml      | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/renesas,rzv2h-rspi.yaml b/Documentation/devicetree/bindings/spi/renesas,rzv2h-rspi.yaml
index cf8b733b766d..599c06ff08e5 100644
--- a/Documentation/devicetree/bindings/spi/renesas,rzv2h-rspi.yaml
+++ b/Documentation/devicetree/bindings/spi/renesas,rzv2h-rspi.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - renesas,r9a08g046-rspi # RZ/G3L
           - renesas,r9a09g057-rspi # RZ/V2H(P)
           - renesas,r9a09g077-rspi # RZ/T2H
       - items:
@@ -85,6 +86,31 @@ required:
 
 allOf:
   - $ref: spi-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,r9a08g046-rspi
+    then:
+      properties:
+        clocks:
+          maxItems: 2
+
+        clock-names:
+          items:
+            - const: pclk
+            - const: tclk
+        dmas:
+          maxItems: 2
+
+        dma-names:
+          maxItems: 2
+
+      required:
+        - resets
+        - reset-names
+
   - if:
       properties:
         compatible:
-- 
2.43.0


