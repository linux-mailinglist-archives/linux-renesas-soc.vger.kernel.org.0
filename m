Return-Path: <linux-renesas-soc+bounces-20167-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF40B1F061
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Aug 2025 23:52:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ECDCB1C26D8C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Aug 2025 21:52:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DBFE289E01;
	Fri,  8 Aug 2025 21:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f8qhwcZX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0409E1B2186;
	Fri,  8 Aug 2025 21:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754689941; cv=none; b=IXigPa0k/TRqpP1RE4tWSddsULSg5E9kPRh10DFgovDCzQqtvI2jdyTVEVMhXYEyfRm25lhRmcQoTva06+bIjrbTIY1NNiWdW/0gwCYyBi9qHS1/Ggp+hlpj6t1b9udIG9j8Gjp5jsSBVDbaWqg0P0kKwEsBXXVUPUF4H4217bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754689941; c=relaxed/simple;
	bh=OKamttH+kFbLNMDEkG7nHwdBxfowlH1gYrLiVdpzKM8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qDdr5HqOLruxirmO4vbrS2MMpHKc2HWCypeVFmjSyZ4dqiB15SlX9e4nMdjXcxrJoG3Yr0Q79JdXP4b1tQC78v7GDhlfFfiKqPF/WJ6W9yha3rkXzM1XrEYljKOl9KMQ1nrq2cwXUbjp35+4o1TUViGHj7czsu/U5ckgosw4W8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f8qhwcZX; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45994a72356so19999275e9.0;
        Fri, 08 Aug 2025 14:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754689936; x=1755294736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s+fXikZUZkaaLPmFsKD7HSeeldtesS2bPwhKabpIbz0=;
        b=f8qhwcZXJCgUusOxN99VYpneoBSePSrBZGKfP5bnt3yX3NvfcLalZIFjAcYjDGxI+O
         KFaI6qPrycWm7NVMTlUd+SiXskFpbz4WLcuS/NgWLCoUqEippBEQ+rq8kB3VbXAEGwM7
         heIO3l5vIYdj3KQjMnXsRoE9lvbK9sD5lsXmyBqKyEf7c1dq48tkkXtyBkrFAVlvfL5M
         HyNuL7E9gbRTrp1+RHt1weBkxy5VMQ2vWquHwyq0ZEA2T6Z02o2Fqc6SsheUsNkUdlkd
         CFrsHH7Ep8dSRBWl//gjGJcaxkhUV3lAEEnVVT3gBAJ6qHIvmV93ltpn6Ooawef4Z/tM
         aefw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754689936; x=1755294736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s+fXikZUZkaaLPmFsKD7HSeeldtesS2bPwhKabpIbz0=;
        b=rUc0CndvTe7pU6+wHhlOoUgDclEMWQa8oT63llJOYgm01CVFVj2ycL24+Tol7pFgHZ
         90p4DiT3Pk9nDBDhnkom/HXhZp03QCOAvQuq6hvn7x4Fu90HEVve56vLSOudWiRUOE1A
         H6uwRZTcnA7LnCkgmqkSqKSc89jN6mnsdA5ozakYWMJmDuyJguP6XDbGwB7Pw6jugPXm
         edD9dtGnCogxuXmLV5pS2UuREu620Ry//GIVBN8BoeVseRCZugqvcH3rgNUTtvZ2B0Pw
         dd4P2oEzgPYJ9V08WGmNf96NRPySc5HfXORHvB1+QwcU+h3U+OjRQkLoqYw/zH3me3TW
         NALg==
X-Forwarded-Encrypted: i=1; AJvYcCV6CV7A6ENHPGYsv3daoRhPPSnDOtrftS/xbDK5qFjN1OsRCcFepvA8E+RbHKH1V3c8iX4cCNrAeBspqcVTVn54BuQ=@vger.kernel.org, AJvYcCVNLrBEgU3hS7iy+Yki3fDc0VOhzXSXVZFNMfmG1fN7s4nqUVUXMeogdQZFVINYfZ/up96JaztStZNh@vger.kernel.org, AJvYcCWaHPMDReQAdDBA+s+4i5AzvGKct6TX8vodI6vXL9E5NXCWHvE3OL9c9FYm6cxx3iECppa2i9z7RZS/7XE+@vger.kernel.org
X-Gm-Message-State: AOJu0YzrSdctH4r9/39KEYju2uLsOsS+ZTnhdCXMcYShmD6RLb+ecB1n
	6ZRIQIx5NA00xAYMzgcVbygHNQ+uKzs6/C2/fUVQfhsyxpjYLVvXc0Ku
X-Gm-Gg: ASbGncvIlZhD+WNoEN14GxiaJ7kf/36Qe3Se+cULzfFWEiy0nma0MQuQ0frbYRwM/TK
	ZFdaOiwRbbQKI2JMVZznHQRWJVTkXYX/VlN3FLrSCCKVu13JHAizaMI3zCqwX+DiLSr++Sdn5QF
	HPK0mJLArshLEWhNIRkFmHr/pQgKjzShNx3DrSdp1eh1UKBEJPH3HkkjjMJCxlOGHG0oN5g41Bo
	FRJtn0pFvnn6pkSaV7OIT9fBiBbykQ0XxJZ21QIAzm/vXyPVi6rbo2KfMwDyuf8j6L//xUMCj8J
	OXzmm/RJ1IPYAueq8oTNEWYr5JlKMpTo63XPntykuTe4b+Z8txI6ca1d3DzMsKUk1CYi3pwce7P
	bu4qXRhcctX5Hohm7o/DDyMmAHaZ+PmmNmpcd+N1/vV+TUEVqVw5+Znhq22JoElTtHicrTDyI8V
	JAuNGyGXg=
X-Google-Smtp-Source: AGHT+IGZxYPfZ8f3OOb3dfhUOyySNqL5+mV0PRRqjPLBZBpsNMy6HBq87hUeVascfeL1LTmbENPgmw==
X-Received: by 2002:a05:600c:1d19:b0:458:b8b0:6338 with SMTP id 5b1f17b1804b1-459f51bdc4dmr39764275e9.6.1754689936127;
        Fri, 08 Aug 2025 14:52:16 -0700 (PDT)
Received: from iku.example.org (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b8ff860acbsm5326759f8f.51.2025.08.08.14.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 14:52:15 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/5] dt-bindings: phy: renesas,usb2-phy: Add RZ/T2H and RZ/N2H support
Date: Fri,  8 Aug 2025 22:52:05 +0100
Message-ID: <20250808215209.3692744-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250808215209.3692744-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250808215209.3692744-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document the USB2 PHY controller for the Renesas RZ/T2H (r9a09g077) and
RZ/N2H (r9a09g087) SoCs. These SoCs share the same PHY block, which is
similar to the one on RZ/G2L but differs in clocks, resets, and register
bits. To account for these differences, a new compatible string
`renesas,usb2-phy-r9a09g077` is introduced.

The RZ/N2H SoC uses the same PHY as RZ/T2H, so it reuses the RZ/T2H
compatible string as a fallback.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
v1->v2:
- Added Acked-by from Conor.
---
 .../bindings/phy/renesas,usb2-phy.yaml          | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
index f45c5f039ae8..179cb4bfc424 100644
--- a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
@@ -44,6 +44,12 @@ properties:
           - const: renesas,usb2-phy-r9a09g056 # RZ/V2N
           - const: renesas,usb2-phy-r9a09g057
 
+      - const: renesas,usb2-phy-r9a09g077 # RZ/T2H
+
+      - items:
+          - const: renesas,usb2-phy-r9a09g087 # RZ/N2H
+          - const: renesas,usb2-phy-r9a09g077
+
   reg:
     maxItems: 1
 
@@ -120,6 +126,17 @@ allOf:
       required:
         - resets
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,usb2-phy-r9a09g077
+    then:
+      properties:
+        clocks:
+          minItems: 2
+        resets: false
+
 additionalProperties: false
 
 examples:
-- 
2.50.1


