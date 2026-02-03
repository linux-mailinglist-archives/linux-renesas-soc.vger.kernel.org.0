Return-Path: <linux-renesas-soc+bounces-27798-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EL3BLzrQgWl1JwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27798-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 11:38:50 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 56458D7D1E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 11:38:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4EB2A31427B6
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Feb 2026 10:31:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 297A8339863;
	Tue,  3 Feb 2026 10:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VDOp+1Qq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD3131A7ED
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Feb 2026 10:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770114639; cv=none; b=cW0kyLmXik595zbtL53Ypr5rhb+/nFEhqvA3Y3YTEztyQZa7ocZoj3PIuJT6Atse0qn4lmRn1qu85OpZKdEcMUVtaxKz+AcYAh9edxxpvPOOFzhw6EZnrGEL2p+RJlOCqiUxbPBMVWI6ENOBGz+NRV78TOIIjHFHrbVliy5llWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770114639; c=relaxed/simple;
	bh=PjFk164I71mZxjVv/pn85dLTnDDTC9xoAQHGjiSsSzM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ymb8ooDUdZ5MG9oDi/2Pe6kxYX7n9phm0c3JwYBKUXOb0hW4soWA1kF98iQAj6yeY3N0xtcWiAs36upaoiKSWlNkJFzNWg5mVSQkS9kk8UWR2rbUIfvUwxVN7tiEF9+AHLvo6mDX4gzvorbD9sBfpFP311D850EgE8AGqEyppY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VDOp+1Qq; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-42fbc305552so5048546f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Feb 2026 02:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770114634; x=1770719434; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1U+dkg/+uoRE1uMSj0xkZIAtaZIHuboawXSgHR45QSU=;
        b=VDOp+1Qqhmta6P9zx3krp0YNF9MNafOkWV5JgHTha1WegG8L7HsN2ArHCah+QtoTa8
         /7eLs2u6AgkEukxXBL9qzmdBWT0oQunF4g4ckqdCSSKtJg/WWszmXxlp4MmxnuIKyixh
         e3DjwPDCHok89TsyBZMaUpNmwut64PGxLfGV5cYQTdN7gKGSvsEOv/haoUS3/rY6K89C
         kugC4l5m3+MY8VKypR2vRq4OKuDqaw0R/WGHU8tpqlGBCggLHc4IHJgCObMNiwymQokO
         UQ5ewHbLAOAKh8rVmGIcGpEeiGrdXibRMHKJBe9+UlORfFfblkJ/iw6HeaIhdvLALTpQ
         8HuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770114634; x=1770719434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1U+dkg/+uoRE1uMSj0xkZIAtaZIHuboawXSgHR45QSU=;
        b=mgxo2BnXmDG82PZ+S4+uKt+o4EuR2HCY8i+QzJlk70dgXmLSsD/Vmvtlej5mcNo6JQ
         IzFkuZ/gGnXpJ1dchWzZunj5bLeOi6YOhMP5lbB3ZCWiuXDJFAQKW+c+DGxb0JWJquad
         v5LalsKMntxlLpyhGnsaJwt4rqxMmAQCydZpMcQJGI6EiRN+1iOlSTTgsHqXi8a9QQRA
         78jNbnLdRDUktH7njIxJgshZtHk+wEZuBgjWbqq89FWqglF85UFz1czj2cFSwIWIITnX
         NKnB0ojnG+jdKUgVqbZJE3B/JDizbSeabwZhoPHLcoAy7BAxfGUxceZE1UqisJYuYYKu
         LW1w==
X-Forwarded-Encrypted: i=1; AJvYcCVLrMkg8qFZ4kY39kHD35t8CzGptzVKaKbzO2W1TCO5rZ5UePGtX5+oBTNSMkZGGBVhAKcs1yA6ZqmNc4yWuukmOw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6MLWKdVhyyeING0wUQaViduG23kCCj6slgN2nystgQo8aHihV
	3hxhahIPeswjSJt5ngL4piCsG3jLhDJEaBZwqDsnwmOLiqBRujIFbegh
X-Gm-Gg: AZuq6aIF0fxDZnAyCglbn0MI6uYm9mMTJh2iXWViOCiFtYQft9B6k3S5iXiZ+QKx/h3
	bt/XMedLQHzuuQtF7jc8ivu6Y3III2gfya7vJkCA+zzcU3e7fZxWzga34OBQYGvKAwAqpFg1eg6
	jLzwG1mYzgTE8pVUUa5AW/Uw82r1lI8mvLHPj1t8ZF42XRpQunPqSfLW0bCamYG1NlVt29p/Yrt
	dDIIyGRi+hBOzCLn6KpJDiWf8MpajrrXD6bAMksAl27eXSoAZGUFNsnfIK2KhwzK+5+1oguvgt5
	Oh1qpT+qFqijzgmJam2eh/VEpPLULHEgkIb7MN7SS69thiB4GyKY5XapA6wUb3wBEfuQQkh7l6z
	f+8t2M82M/qxeoHeJiXuFbsOOi9wGRX58jRJky9UwZy4tmS0sGBQVv6Gov3wk4uV93W1gwF/XQg
	ZB6Nr+N/weCYy6zT3egPG8Hm0UHQ6C
X-Received: by 2002:a05:6000:1863:b0:435:a136:b891 with SMTP id ffacd0b85a97d-435f3a6a7e0mr20936885f8f.13.1770114634374;
        Tue, 03 Feb 2026 02:30:34 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:9cd9:f748:166d:55fc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e1323034sm53160961f8f.35.2026.02.03.02.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 02:30:34 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 01/10] dt-bindings: dma: rz-dmac: Document RZ/G3L SoC
Date: Tue,  3 Feb 2026 10:30:09 +0000
Message-ID: <20260203103031.247435-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203103031.247435-1-biju.das.jz@bp.renesas.com>
References: <20260203103031.247435-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
	TAGGED_FROM(0.00)[bounces-27798-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com,renesas.com,microchip.com];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,microchip.com:email]
X-Rspamd-Queue-Id: 56458D7D1E
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

Document the Renesas RZ/G3L DMAC block. This is identical to the one found
on the RZ/G3S SoC.

Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change.
v1->v2:
 * Collected tags.
---
 Documentation/devicetree/bindings/dma/renesas,rz-dmac.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/renesas,rz-dmac.yaml b/Documentation/devicetree/bindings/dma/renesas,rz-dmac.yaml
index d137b9cbaee9..e3311029eb2f 100644
--- a/Documentation/devicetree/bindings/dma/renesas,rz-dmac.yaml
+++ b/Documentation/devicetree/bindings/dma/renesas,rz-dmac.yaml
@@ -19,6 +19,7 @@ properties:
               - renesas,r9a07g044-dmac # RZ/G2{L,LC}
               - renesas,r9a07g054-dmac # RZ/V2L
               - renesas,r9a08g045-dmac # RZ/G3S
+              - renesas,r9a08g046-dmac # RZ/G3L
           - const: renesas,rz-dmac
 
       - items:
-- 
2.43.0


