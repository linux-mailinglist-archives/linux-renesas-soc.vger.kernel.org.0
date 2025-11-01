Return-Path: <linux-renesas-soc+bounces-23976-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 589D6C27781
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 01 Nov 2025 05:24:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0AB284E032E
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  1 Nov 2025 04:24:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94E41285068;
	Sat,  1 Nov 2025 04:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AgsLooRp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8C5156236
	for <linux-renesas-soc@vger.kernel.org>; Sat,  1 Nov 2025 04:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761971095; cv=none; b=iFHiEjaa3hBTzoQssdH8HfpKRrY0ob3PQm44M6QkdD5BOi6ZRUAMnOmRRrt3pycWCb2GcIbQ4Yckx08IjDVrdoUM0EwzSBPaSBRRUqkuHgowjVXbGs2p/wK99TndSxgoiqXX6riLkMzhoPE4rYKYDnzcXIoqmzyWZxbX+hh6a7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761971095; c=relaxed/simple;
	bh=5WHfnnAEjEl7b65PNjGeo2Ba/xJE8CKHD2SN89cu3Ds=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oGg8vrQCjMhAxpdRedpotbKCBUnfwJPbBfzYA13oY2ZeYDiockGl+95QMBSd9ZjKmk9rrTKX2KGp4SJiRyxJ4OuBSRpR0WTq7HvFgBA+RDXw9nmGeardBQf2Wi/b7WAXl0Ipwu9SnRO3J5ej3uQkS6HDjmoXsY7LJr+7NGfU7nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AgsLooRp; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7810289cd4bso3357125b3a.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 31 Oct 2025 21:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761971093; x=1762575893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cpDoufdPjG28A/t0l3uGrRRBG6p6T+fKPiyqq6TZvRs=;
        b=AgsLooRpDTUkIS7wnKxThtMOGBE9alk1zizSUyt0orMuVHT3evGWwNLvdSulqS/gRP
         7is1N0BVgLy2agIVUqonQL83X9Jg0hFRZDrlsrTeQsDOA1pIw/3WBGI9DLoY+1+ZszsT
         QAVpLGrzN32Ec04oA3w5M0ur/k5SJ+/e/PcUKMlU9qPZhPLATzyvFNDGeurh8s3pCRm3
         9bWNwyBiHeLRK0wxNM+ZrUGBH9bP8+wiFhRlUnvZaFWHMWaJlDtH6tK758bqmXPwEi+Y
         +/kThZKUMdV67YUNLbDbyALO2GEIkiygoigHcQV82d+QABetEaz+FOeIEMTbTiaIciQA
         MzGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761971093; x=1762575893;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cpDoufdPjG28A/t0l3uGrRRBG6p6T+fKPiyqq6TZvRs=;
        b=nkivzVJIYhp2ZmUAbZk2hp+Ob1ZUDtTAfzwJCj4ie/wnbFqdfaVOVLs2HIG6oDAC0/
         3j2VfbLEp4ahgaVNA1Sw7QKEDCRqUT6PZK6rUIg2SjXOpGcAr/pBH8dQCHEJpllER8E9
         /TpqTR9LVW1SuBGaI3AMhKbKrHH5EDqCc4kGVrRDIK/QVSH0oneanPSA5+scMf8zXAKF
         74m6vhJmte984VQ+UPi3KNjuPZAk0E1IVjEX+NqsJt8FofXoaIhmpIA2uKwQzZTbaGvr
         vU/koB36vUQ6ZPUe3hw5Xn2o0AWAW2hraWdoAEqihOUZFFX1dUFkudDYPbYhR7BkGCeD
         NfZg==
X-Forwarded-Encrypted: i=1; AJvYcCXZUv+BxAMeOOuRECqesqReB2B5qzIM/9q5EOXre54cQu1H4ybvMfa2yQs28MkWS+tgLxocT1yjg30Tj/xVaap4xg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXySKopF1l8kPi5owzRIkDCtBjExntVd1NSvivbdq/oGzJVbNB
	snyFrSPUb4Ej86KsemZvEv9YiTU79DfkgLkjoXWCl2TXESkvBFSZusG+
X-Gm-Gg: ASbGncuVhqC9FGJZdBrBTlPX+o0i2qQWl6sWLv5FgJZV3Fy6u3ULi7p4Ot/cCNcCADh
	/8nZfrZHbSUOGHPNgrMfm/vFLTuHT0K9GXxqcEzdIOT9ldWvUipXVLlw13+rgYvkepEwawUsO3a
	x+vFy+zqfe3VkX/a5QlVNEua59KWrVbxubibdfiCmbtEuS+HG4nUh5MjwaWqEehmumG8HEcMToJ
	6bLGIPo5K5H/SMCYVZmqiHxkeLkEHJVODJ8CoSKN5imN5SQam9jn0TDTqpOTjUdjsRIbttU58Mk
	s5K78ME1uS7OIYD+NB181ffvkeTfBl4yQnKgYeIFlC1kbQDLJF1eXf1GdZloIxJEwj9CA4zcnqO
	gmWkzB04HyAFpa3ceDRC23Q9FFHegUYkILdeY4GvLnxqXP4cI7wc12If1sQjwqBuI3FkwoUmSd+
	9s9lrT/WDSCx4CyN5fuET1mmhKoOL/VSRB/xTBcT43/g==
X-Google-Smtp-Source: AGHT+IFBtoVlonGhlHWnTjQtAUPLEqb/CZBWvidsGzOw9KrDiWj7lh+Ow3/Lpm6it8MHYuXUquZ47Q==
X-Received: by 2002:a05:6a00:1251:b0:781:2290:e7e7 with SMTP id d2e1a72fcca58-7a7788ff6acmr7585723b3a.18.1761971093225;
        Fri, 31 Oct 2025 21:24:53 -0700 (PDT)
Received: from iku.. ([2401:4900:1c06:600d:690:cbc4:d4d9:22c2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a7db678f67sm3795120b3a.57.2025.10.31.21.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 21:24:52 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] dt-bindings: usb: renesas,rzg3e-xhci: Add RZ/V2H(P) and RZ/V2N support
Date: Sat,  1 Nov 2025 04:24:40 +0000
Message-ID: <20251101042440.648321-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add device tree binding support for the USB3.2 Gen2 controller on Renesas
RZ/V2H(P) and RZ/V2N SoCs. The USB3.2 IP on these SoCs is identical to
that found on the RZ/G3E SoC.

Add new compatible strings "renesas,r9a09g056-xhci" for RZ/V2N and
"renesas,r9a09g057-xhci" for RZ/V2H(P). Both variants use
"renesas,r9a09g047-xhci" as a fallback compatible to indicate hardware
compatibility with the RZ/G3E implementation.

Update the title to be more generic as it now covers multiple SoC
families beyond just RZ/G3E.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../devicetree/bindings/usb/renesas,rzg3e-xhci.yaml  | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/renesas,rzg3e-xhci.yaml b/Documentation/devicetree/bindings/usb/renesas,rzg3e-xhci.yaml
index 98260f9fb442..3f4b09e48ce0 100644
--- a/Documentation/devicetree/bindings/usb/renesas,rzg3e-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/renesas,rzg3e-xhci.yaml
@@ -4,14 +4,22 @@
 $id: http://devicetree.org/schemas/usb/renesas,rzg3e-xhci.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Renesas RZ/G3E USB 3.2 Gen2 Host controller
+title: Renesas USB 3.2 Gen2 Host controller
 
 maintainers:
   - Biju Das <biju.das.jz@bp.renesas.com>
 
 properties:
   compatible:
-    const: renesas,r9a09g047-xhci
+    oneOf:
+      - items:
+          - enum:
+              - renesas,r9a09g056-xhci # RZ/V2N
+              - renesas,r9a09g057-xhci # RZ/V2H(P)
+          - const: renesas,r9a09g047-xhci
+
+      - items:
+          - const: renesas,r9a09g047-xhci # RZ/G3E
 
   reg:
     maxItems: 1
-- 
2.43.0


