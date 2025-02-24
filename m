Return-Path: <linux-renesas-soc+bounces-13601-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F53A429DB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2025 18:34:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB341188C2E4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2025 17:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2082B26560A;
	Mon, 24 Feb 2025 17:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Be8RlvtA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D98E263F5B
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Feb 2025 17:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740418323; cv=none; b=LMRPQXzxwk+dqRMKMxBBiH4aJAomAqOAS3uqWheVrWP+XZDxZvZ/e7auut39eCQcRFi7ubAHRNqItLOYnH73unaLAarE0ZK16e3X48s7tXn8JXqwGfCpZSkdDOrHRxEbOP6V1XnOFEhx5KaOGi+VX8FrKcQnhgmLFlgD0vCOkUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740418323; c=relaxed/simple;
	bh=ImOTi52Fq1zni/iFsL1Onf2S8Uv8Ca8bqVfaVlyZUAM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lKowS3BdWfnOGyXKV2Q237q6NTqVeciccH0mA/xNE/ReYFlOWqHuNxHBzeuN02nC/nKcRRWqJp6PNf1AjZYbQfVCBnXaZRijwFz4lPWEKxIRbBxuj5kyCgRQrL7KYiVRAo32WCmcYnIcqFMuNIZ+AcPI6ya7mW3gIO5wA73JZNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Be8RlvtA; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5deb1266031so8557806a12.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Feb 2025 09:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1740418319; x=1741023119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=420c+7A1+4JbduZFaI1FEUdQhJT2kTAJKMnNgK/61Ek=;
        b=Be8RlvtADCeVH+puTeNMW6jETTArRB0pny0ivF+OsVJix377fH6d8YI6QrGiV4BV9W
         hcoRQw0xlyVUu7horfJxkZiVYVOR0rreOtgFyZ65o98mGQfoC6jRBPDm4pC1VDa7oufU
         6KgkQMdBbtQSxisW5WZxePR4AGfn+ATaxAqhxGVxHUthV0Vwvet4a7iynEKgkwewz609
         oBjqXd5NmkuDcIr+GQaiW/NRUDIkFjVyL/pxFF7BkF15GwOaFK+cKhiEgKyK5a7aT5dD
         jkjDHqJsiGcmGCABf1HK1WtJbkLzmItbjr0MI4A7bLIQZcBhxK3noijYEt1kkz2wMSAW
         oayQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740418319; x=1741023119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=420c+7A1+4JbduZFaI1FEUdQhJT2kTAJKMnNgK/61Ek=;
        b=kg7PAoz8GzozGoURLDzUff6hPu+ePu23qqRMYiAIru6wlUuhr05gKPO2pbQ2ENy8Q6
         FM1nfyktyEdJC951hH+lrp/kOdE/uB+eWmkPJ/Oq/02MXPQrTLgncczlgyylusuRj+/8
         DiHWvbS07Bq7IqQMXWSJA1Fj3uFh+rgMzUv32XI4Axxs8cHBlUH6w3p2CEAqrwkvjVko
         YO6VVkuv3f/2JFsWZ0Z/KlLvEKNehQGphn0dfPleX3KPSqALCeTXgVaRTLvMgS3KeIS9
         VOAmaMM+Npg0KdbfawHoDXYY07wBPL7phVA6chjeNzbUHJKJfC32BSZm1Sfi7qxo6EwQ
         y+NQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaIazwzoR9QKAeTahWTrpBpJoLJ6PQ8N0JJtUllKAF1SX8+ghXDbBqAewEfM8Yzz+I5mInsJdSwt4U48rlC7J2Rw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEp1DsV1JvpQaA/AeKm2eNto3tYHD50y3d+xg+v8dmOBKCIQuZ
	g5aAYCsFfdw2QKu5MZIVwOoipBKIODmq1f1Fps87ufk6M+gOC+rWy8cyHpvO8/0=
X-Gm-Gg: ASbGncv2OsevaWjV5gP5dyn64/2pEoIp2508PwgtB4DuGhNoHqVM7TUwKGLj2/BuDba
	n0h82UhbmOEFAHYiDun48emnDOSRrGoPBuWH0mYGJDbaMI45Mynoq+PU2vTOAHgF/QNazXEGSyu
	GIY+s0MfwnvfhVtDI1x0LoB96m1c4VGDAiSeTKmu+aLpbTREs1ROwIQfugP6RGRtGUZGaC9WQIx
	adHItMff6p4mkp9dpE9KcyVAngfKp1Fez67gyZhG1NZI2C4L+n5/CMJJAlnhkO7kTUdW7sCMThJ
	hEtTsn/Kd8q7bnMlOadb8M3vpFaAjRaPelXIyUYEb5Fs+kVLzp0VVUI=
X-Google-Smtp-Source: AGHT+IGZl4Iy4uZOUjM9U9IVmRSlfdQAcLT3D1dKp6aQmp4d42Kr2CFruUdsHT4wSp4NM1fW9G7V4Q==
X-Received: by 2002:a05:6402:50c8:b0:5e0:9607:2669 with SMTP id 4fb4d7f45d1cf-5e0b71070a2mr14757051a12.17.1740418319292;
        Mon, 24 Feb 2025 09:31:59 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.25])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece270a7fsm18674357a12.58.2025.02.24.09.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 09:31:58 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: rafael@kernel.org,
	daniel.lezcano@linaro.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 1/4] dt-bindings: thermal: r9a08g045-tsu: Document the TSU unit
Date: Mon, 24 Feb 2025 19:31:41 +0200
Message-ID: <20250224173144.1952801-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250224173144.1952801-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250224173144.1952801-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The Renesas RZ/G3S SoC includes a Thermal Sensor Unit (TSU) block designed
to measure the junction temperature. The temperature is measured using
the RZ/G3S ADC, with a dedicated ADC channel directly connected to the TSU.
Add documentation for it.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- collected tags

 .../thermal/renesas,r9a08g045-tsu.yaml        | 93 +++++++++++++++++++
 1 file changed, 93 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/thermal/renesas,r9a08g045-tsu.yaml

diff --git a/Documentation/devicetree/bindings/thermal/renesas,r9a08g045-tsu.yaml b/Documentation/devicetree/bindings/thermal/renesas,r9a08g045-tsu.yaml
new file mode 100644
index 000000000000..573e2b9d3752
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/renesas,r9a08g045-tsu.yaml
@@ -0,0 +1,93 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thermal/renesas,r9a08g045-tsu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/G3S Thermal Sensor Unit
+
+description:
+  The thermal sensor unit (TSU) measures the temperature(Tj) inside
+  the LSI.
+
+maintainers:
+  - Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
+
+$ref: thermal-sensor.yaml#
+
+properties:
+  compatible:
+    const: renesas,r9a08g045-tsu
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: TSU module clock
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    items:
+      - description: TSU module reset
+
+  io-channels:
+    items:
+      - description: ADC channel which reports the TSU temperature
+
+  io-channel-names:
+    items:
+      - const: tsu
+
+  "#thermal-sensor-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - power-domains
+  - resets
+  - io-channels
+  - io-channel-names
+  - '#thermal-sensor-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r9a08g045-cpg.h>
+
+    tsu: thermal@10059000 {
+        compatible = "renesas,r9a08g045-tsu";
+        reg = <0x10059000 0x1000>;
+        clocks = <&cpg CPG_MOD R9A08G045_TSU_PCLK>;
+        resets = <&cpg R9A08G045_TSU_PRESETN>;
+        power-domains = <&cpg>;
+        #thermal-sensor-cells = <0>;
+        io-channels = <&adc 8>;
+        io-channel-names = "tsu";
+    };
+
+    thermal-zones {
+        cpu-thermal {
+            polling-delay-passive = <250>;
+            polling-delay = <1000>;
+            thermal-sensors = <&tsu>;
+
+            trips {
+                sensor_crit: sensor-crit {
+                    temperature = <125000>;
+                    hysteresis = <1000>;
+                    type = "critical";
+                };
+                target: trip-point {
+                    temperature = <100000>;
+                    hysteresis = <1000>;
+                    type = "passive";
+                };
+            };
+        };
+    };
-- 
2.43.0


