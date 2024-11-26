Return-Path: <linux-renesas-soc+bounces-10698-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1EF9D9432
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Nov 2024 10:23:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47737281E23
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Nov 2024 09:23:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47E6C1D432C;
	Tue, 26 Nov 2024 09:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="UdSqcXsp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B93E1D27BB
	for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Nov 2024 09:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732612882; cv=none; b=Oun0ciXB/FUL/L3zY+YHNZHpZM1M2C5oSlew9HirZ0CR3EoWwQkYj8jvP+dqt3IYolGIjkmAnhIfox0TerJYW08R5YuZRHSHKO1igz8b3F/iaPhUfJLVGY3B5cTHdVmec6FnBCrCkzaEHXcOv8Ek+lAREY9TBPQgQUlUT5WJnNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732612882; c=relaxed/simple;
	bh=oNWXU+YttETsW6YOLdXCM5FnMtFquAK1N6LvtZPkJkY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EGumpawsg2oexr15GmAVIBzWDcYPKF7746HBagwBoEVkoh1xvoUbcj2lkFz3LPOoTnebl+2svypLlKZkWwYE0QOprvq0fMS/JVdPhQKDBqVPc50xgNhPFT3Crn+Jy+ISYtD6wIpqGvqQDy9s87iNbWBPUaA3KmaZLMmBmG82dQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=UdSqcXsp; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-38246333e12so5354226f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Nov 2024 01:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1732612879; x=1733217679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/jPyHfXjv1sKCq+VDx+r3KGfTA+9eZQsBfgYv3YFZiw=;
        b=UdSqcXspX4GlVVQ9ykeNkVCt1X+Jj/LfbN9xD/pmohjLFZrU8SIiOVFdfAqhU6jGu9
         JZ+GNbfv3X5aPU8YWnehhC0HTItYCE9ZdHtmzNJ3TASEVVg15zM5UfKc+NaGYpgO75ze
         0vEC0f6dcALONwYLOHbUmQl/78LTYeEA6ClBTI8On0/dYUr1gnsrjrj3TNfSc+5Dq5NQ
         e6TUy+XjsODNZ/0g08nZiCmro+mWP9Y7nhf8YjGuL+pp45FCXcAMypVC1GNG5VKCPbWd
         m3UEO4KValOWTdgC/HRl1F2BxIVluJhiJSNXFJdhf7VqtWX3QgqxFT9wB40kffi7dQad
         5+LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732612879; x=1733217679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/jPyHfXjv1sKCq+VDx+r3KGfTA+9eZQsBfgYv3YFZiw=;
        b=UeMPhCijDpr0rGpcmxKhOVC+GJSkrwuKeXd25qfRXyy6I2YN4ySv/ZPXP/rlM6Co9H
         YuPjnaj05PsKf78IkwR+g8Zw4maMvE4Z5kWVmzSuyKIHKKsgy2HZ4yNv+2o0m6nenDga
         c/LIi0M9srs1YsM9dztE2Dfp3KGCkI41gKYhyJUQmxxPShpYkuDW5dv8y7CB1z5dHn2a
         M7a/Bw6ihVnsntpcB1P35Vw4/YvfCA6pAchdYP67xMx+2nlCJNLWRluF8EZNBFJF/gZj
         rr39eYwIkWXw5Ikn4KNkDrIKSS1SxCbrcEvWv4/9tW0e6JJpkLGXiBurqe9yn0h4neyw
         BD5Q==
X-Forwarded-Encrypted: i=1; AJvYcCURBeqxlrXixzTEcA3UpiRSNMEQYD6FaeRToFumGhFVHUvAVWp7aB/VZV38AgJYILj2iEA6mxJMPUb7TuLZIV7zlw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFB+287OlpLkTsge2coTiIQ9ZIc2850CGlBnBePihEjVcs/0lz
	jKMZOOnZXwhFSBtRvfTW7tjaVuYdOFDJxOpfq0bDWy53IlrL4QsKgT1P8N06vRA=
X-Gm-Gg: ASbGncu6FCjpBTVfLLk3NrGesOLGyKvMqSt9tKOFUzJMwRzA2HSbt4EP/sH/aH1Jrpm
	fbAGtgbvxNnnvhd78WIXQx9e9yh5p8Ja2QDsk8XO8i7rJtJufq2vFHeosAmGH6nuawDMNUs4pdT
	Lff2RADtTosAEwcd5yilLFjXw7ahk45RQKrrOVb8f23uahjg/5/aKhJG1e5LUT8JR2mx824/IuF
	rDEA0oqGYl7SOqX4WidBJZKtLgQXKBmNI54+Wh5QSQbKEx1R2l9LCyvMZODnoj+hFIl7jA9K2cg
	WOs=
X-Google-Smtp-Source: AGHT+IEp0nHr3rTgVabZUcIb7+yLYE3qyOs/bjCx+FjVzVqxsxe18o0APHGg56PeptK8REX7Zr/0Jw==
X-Received: by 2002:a5d:64a9:0:b0:382:4fa4:e544 with SMTP id ffacd0b85a97d-38260b3caf5mr16113423f8f.6.1732612879055;
        Tue, 26 Nov 2024 01:21:19 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fbc3a47sm13027694f8f.73.2024.11.26.01.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 01:21:18 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	gregkh@linuxfoundation.org,
	yoshihiro.shimoda.uh@renesas.com,
	christophe.jaillet@wanadoo.fr
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 08/15] dt-bindings: phy: renesas,usb2-phy: Add renesas,sysc-signal
Date: Tue, 26 Nov 2024 11:20:43 +0200
Message-Id: <20241126092050.1825607-9-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241126092050.1825607-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241126092050.1825607-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

On the Renesas RZ/G3S SoC, the USB PHY receives a signal from the system
controller that need to be de-asserted/asserted when power is turned
on/off. This signal, called PWRRDY, is controlled through a specific
register in the system controller memory space.

Add the renesas,sysc-signal DT property to describe the relation b/w the
system controller and the USB PHY on the Renesas RZ/G3S. This property
provides a phandle to the system controller, along with the offset within
the system controller memory space that manages the signal and a bitmask
that indicates the specific bits required to control the signal.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none; this patch is new


 .../bindings/phy/renesas,usb2-phy.yaml        | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
index 2babd200bd98..3b8dcacc3740 100644
--- a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
@@ -85,6 +85,16 @@ properties:
 
   dr_mode: true
 
+  renesas,sysc-signal:
+    description: System controller phandle, specifying the register
+      offset and bitmask associated with a specific system controller signal
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: system controller phandle
+          - description: register offset associated with a signal
+          - description: register bitmask associated with a signal
+
 if:
   properties:
     compatible:
@@ -112,6 +122,18 @@ allOf:
       required:
         - resets
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,usb2-phy-r9a08g045
+    then:
+      required:
+        - renesas,sysc-signal
+    else:
+      properties:
+        renesas,sysc-signal: false
+
 additionalProperties: false
 
 examples:
-- 
2.39.2


