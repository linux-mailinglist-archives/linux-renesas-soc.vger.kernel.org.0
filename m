Return-Path: <linux-renesas-soc+bounces-19999-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D98DEB1B2BC
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Aug 2025 13:47:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E45B3181552
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Aug 2025 11:47:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B424262D0C;
	Tue,  5 Aug 2025 11:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BaY3q23J"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B041223AB95;
	Tue,  5 Aug 2025 11:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754394465; cv=none; b=c6oXqIRgLE+ZLsZKhUrZpp5H0zVaB2UCcj/bW006MwNvvVyo8VF4d4OoxtcMrb0JPj/BqJ95xrsm7HZ1nvx3JnDNiTWIoLWuKVMedxZv9H2cHJ2oy9V4naKuKH/MFWJmIepzLepS7M61WFaEipkEl9O/hzHDZeHR0BV+QjHGPUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754394465; c=relaxed/simple;
	bh=N0YEoG5hwLFIaus/mroWA6UvYHFsa1kc8hpmLTq8Rq8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T9gw50mvVCz8I9uIzvjAz9E+CnJpMZvxh7QN2z9ERbDlx10RN77b7xO2lU+/7qfwXKEqZIeSZ2mrpWGVNR74yAof877P0Z8PBMMRLxHdwic8Ptsqe3aWVpFcKwsAfJQ4aCdcrr9DNnukaNzn09MgS4cUa8mIrIwwidB/bj9ADgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BaY3q23J; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4563cfac2d2so39437475e9.3;
        Tue, 05 Aug 2025 04:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754394462; x=1754999262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OFvs+lLr/uYBTEhc/tK1NwmYe1mvdvo7oOPX2dpVWn4=;
        b=BaY3q23Jbpn12ouYu0tNpPyokrRKvISbsoXmtgeJHoVFkLfpxt1xB3y5spuBkV/av2
         7G+tyyfquFNbEligjX1LeMQvnRKoiSFtQMTYXyG21zpmVcOCCimnP1m138icQY2fjJBm
         NrODYdkUR8q7Jmwny8YiN9+HrU5wbMAgVVxXRcwAyWLadCqwJc6UJY0WHlv+0hemjOGU
         W2ZDJ9Rw4JijfSC5iQQlWc1vxnXE9QW+ismlJytB7cPRfetbIFK7U5v2DLwI+zXSn0ZU
         BGZiE9ZYGI4hm3uxwHLFvmn26KzFBEtAMM2QXO47U+z1W8/p+JGDANFivc1gHApNrmIs
         F3WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754394462; x=1754999262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OFvs+lLr/uYBTEhc/tK1NwmYe1mvdvo7oOPX2dpVWn4=;
        b=n2iM64UmgRybnSo8eMFd+BbII8yk5jkjecxlCayDyp4JKp2gbLGUyk/2pEHY5dhC1d
         NwURnrjzAv9X/xBz2PsXrTlRLOzN8W5EXit59jgRtdCYGqrJXnAk5M5/8ljE5Lq/pB9K
         QKTbZ9MTnAZ0NEX9bFHTQ1gMONa4fXlVQVKOt/CQC/VYTLjxEmOObxrZc7/UTSEco0v1
         a96HKiImR3ANFv87rxBCnjMTjInezV+l91OrDc7Dc8QJ8OnjXo4U/1BWvc9o7C3pThj4
         T0Aw9wkQYtNfiVHDbAmBiVlPPiSOmIrPXwd/DmmVTaJc8GylukcX9sFFJNyYaOKlyMDs
         QPuw==
X-Forwarded-Encrypted: i=1; AJvYcCWbY40SSUSDVRkKZIYrYzomGJnYnIgCo9sCr7laa5snxlM71y3gXwEBJJPeb4zXyy0UlmzYGmzGQoBVHWPW@vger.kernel.org, AJvYcCWqsaqqxKGwDgIVzMk2ZyxjYGpRmTWoBxom97Eb9oQmVWSycKGMZ8RNLJ5h5B5rdtjRM6KV/In4pqZ1@vger.kernel.org, AJvYcCX3ZYpZd4TkQM30tysKdFY5AOOgk9AV3sgijh1dW3amofi2X/hKvk4MJsvbCOjE2mMJBMZunxnHi59MhzC6+CSBRrA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxco4U4OWZlROOcf0FmUz9MQjN3DpDlVXt+GbCMpxObjNgM5Wob
	r91CEm5X1bjEIWR8q1mjohRY2Dq1kEtxVG8eqFyW0Yxle7p4O/NQK3iTRl3D0T7V
X-Gm-Gg: ASbGnctfF1PfQu/juOijOzItRYd1tQkZxmlSuybXhLRqaniLCkKpQcx7O1QiRMWizSd
	TRr67+HnmhJc/YtAdvDK00PARzpmfMbYpWTFZ6uOTreR5RAuOz6m2MzZegjCMfQCgIqOrcQm6yy
	+4gxg37q8D2ZomuizqqX/jB5j2sqX7ENrUZnYCRcwzrelMJB0nzG4o/vUvZUiczcFXUDWdoZuDS
	fvIzVqj5jC9qj8z6tr3OjFE+8wESgaySJTEAzoXxmmbvFCgjNswG8uLdRL2I8cgqBMlhiTHhvui
	5WQhOkD2iHSnujhSccIxl7Ovj9Kgldkhg+yjEn658ZFPpFYChb4aojKHvGk2zIuMoQZf0IByNh6
	PZzXcZMjuhxknj53ai+B3BjdaPzhIWUyIxNZRQSXWJ4uUup5j5mB7H+kWlGocjUti6Tq4UGnhjw
	==
X-Google-Smtp-Source: AGHT+IGfqfg9myuco/Wec8r9O69HFWKWBhDBYSw4m4kNus6H9A2flihRvry4Neb8nkWBMeOF4pbDPg==
X-Received: by 2002:a05:600c:1394:b0:453:81a:2f3f with SMTP id 5b1f17b1804b1-458b6b59706mr124674745e9.30.1754394461720;
        Tue, 05 Aug 2025 04:47:41 -0700 (PDT)
Received: from iku.Home (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c4a2187sm19593597f8f.70.2025.08.05.04.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 04:47:40 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/2] dt-bindings: usb: renesas,usbhs: Add RZ/T2H and RZ/N2H support
Date: Tue,  5 Aug 2025 12:47:29 +0100
Message-ID: <20250805114730.2491238-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250805114730.2491238-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250805114730.2491238-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document the USBHS controller for the Renesas RZ/T2H (r9a09g077) and
RZ/N2H (r9a09g087) SoCs. While the USBHS block is similar to the one found
on the RZ/G2L SoC, it differs slightly in terms of interrupt configuration,
clock/reset requirements, and register bit definitions. Due to these
differences, a new compatible string `renesas,usbhs-r9a09g077` is
introduced for the RZ/T2H SoC.

The USBHS controller on the RZ/N2H (r9a09g087) SoC is identical to that on
the RZ/T2H, so it uses the `renesas,usbhs-r9a09g077` compatible string as
a fallback.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../bindings/usb/renesas,usbhs.yaml           | 28 +++++++++++++++++--
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml b/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
index a19816bbb1fd..0b8b90dd1951 100644
--- a/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
+++ b/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
@@ -59,6 +59,12 @@ properties:
               - renesas,usbhs-r8a77995 # R-Car D3
           - const: renesas,rcar-gen3-usbhs
 
+      - const: renesas,usbhs-r9a09g077 # RZ/T2H
+
+      - items:
+          - const: renesas,usbhs-r9a09g087 # RZ/N2H
+          - const: renesas,usbhs-r9a09g077 # RZ/T2H
+
   reg:
     maxItems: 1
 
@@ -141,9 +147,25 @@ allOf:
       required:
         - resets
     else:
-      properties:
-        interrupts:
-          maxItems: 1
+      if:
+        properties:
+          compatible:
+            contains:
+              const: renesas,usbhs-r9a09g077
+      then:
+        properties:
+          resets: false
+          clocks:
+            maxItems: 1
+          interrupts:
+            items:
+              - description: USB function interrupt USB_FI
+              - description: USB function DMA0 transmit completion interrupt USB_FDMA0
+              - description: USB function DMA1 transmit completion interrupt USB_FDMA1
+      else:
+        properties:
+          interrupts:
+            maxItems: 1
 
 additionalProperties: false
 
-- 
2.50.1


