Return-Path: <linux-renesas-soc+bounces-14759-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFBEA6DA73
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Mar 2025 13:55:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E28857A7D41
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Mar 2025 12:53:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C2F025F7BE;
	Mon, 24 Mar 2025 12:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A6dVcf4a"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512B225EF9A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Mar 2025 12:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742820766; cv=none; b=VYRgitEDPndtFXSZmqMCM1vC8OTsO/8UF1nZU9epZMmbiTTQdxz3mL6ynAY3UAbujLEEfTWx2rkXPk9IDI4wesWYjHyNfbZ0zURxpusZK/rtFEggI5IFY9wbcq/u0S3GwYfTmy2elcck9XxEY91qbbzkTliOgBM0/tw2LTsP2rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742820766; c=relaxed/simple;
	bh=nq18JtxBJtNAIX2CZtMajdEApqZ+taDn1bWvq4LSEp4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hFe7G7t8oXAsGqr2oqPL4CRjBRaEUPD0TUD2eUSgI2EC/CoFz1hsAbEHPRqjaD425aGl3pxnTf47O+kengd466p/Oe9dcbF6ntob9FujhQh1HX85yAFhjbj31uP63aYjE55wsRLrht7jYr9xmluldSbFqbLLry+AHg7V1H8BGbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A6dVcf4a; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3996683dd7bso516136f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Mar 2025 05:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742820763; x=1743425563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=72JCJOMx53Iw0msa6ZgjXoc2/P2YAnqDlDwWLnOfpuU=;
        b=A6dVcf4aiKvBfHcpB53+xDvl9QMw0E3LuES8lP08dSTu1fPcVG4gzMu6xDGJmQaTjU
         74wVzvN78ahAMaZeXTdPSs4v1B0do7X2zvAZvS0q7mojlM96Uhy6nAKkYk54ZblSzaDg
         eODUUwJAav8IE3+xdBecciqJL0p6EOxI0lmUnB+ocCNNH2TWFDNuZKyvXMyM2QNjhNNp
         x4ukRzYqyO+u+4xde76Lcslf8PjjQazClIDxOr5caxqJleXnTBavNA83FxXEbgj9iEPQ
         NPsi4V6AiTCAHgRg6Hv5scCSqHQEmJIfLP0uH8LOS1mRyt/eDBOJf7IMJyUe12zKtwKw
         nUFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742820763; x=1743425563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=72JCJOMx53Iw0msa6ZgjXoc2/P2YAnqDlDwWLnOfpuU=;
        b=FsXNf64CVHUcINK0xRyARN1G5MXoUa8PMb7EtwkL28Ab1TOrRxKFyVE3bXTbnn0uSx
         V83yin3FTzgq+BBA8EkPJ2nklfQPo/BOf7iEivgStgqvTV4aOcgjgLDoshifsJh777aS
         1ULmyix5rx0/VWQ1T/zcngJ+xPOIEL7FcXekowNrYFeW8Yqg8lNEq5GJ21+UEosXRhen
         b9MNR0boTkUz4HH3nbUkc7cIDwc3gqbBBy9YUOU9+f9EScOS+r2Y2UsP3vDg9neVGQZX
         k/oJs7lNmDCWhV9AuMBUxS4nHsyp1zEXHELyBRNEDRQGRU7KuG4OmhElw4DmoIYa1cvE
         EIHw==
X-Forwarded-Encrypted: i=1; AJvYcCU8DzY6DX3SK3/R4VnNEMMndQZH9C8feFKQrRbamrbN+ppZSk5SsacEzzSltCeFDOcVfxxyjllUscCHKwImmdPDqA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6pY5acUSBbGgeHo9JUztwY5Sk1+A4mLV83E9ycqRqtssR8pjH
	opxPoYncpp7FtJnPm1aoZ4cmNEujjkkY0nJZyxvL8jhthlVkV5R02T0foScffJw=
X-Gm-Gg: ASbGnct6GC/B8e/pVf+DQC4O1x9+htKWCEocRTdxZWkAww5fFcY6qw+AJXxFGOHuw9c
	GuEyX50Qb7QPosFq/ajfJcuW4+LUOsxFczYLZUe5mCLf8Cw6RF1iEtCFSJp8vkn81zvDDvurBiK
	LfnLux08GQ08S0uSo7MiXGuJHK1Rzh+y+Lwh5OpfiVML6Qp9evCHBWbVCAdr68S9uE5IAWbAm7o
	Yqz5q8oIEBJmyx7wz1mf/LlIi7SIzq8Mzz8XmHRj0eNlNL9Wess6J67FW/aKHAvTi1bk/eSeJvg
	HdWIN7XlO7AU4MJF9vJ6A0crSqi1b7euz/xWHrcUUU4rwltxp64pjSZc8OsPJDququHh
X-Google-Smtp-Source: AGHT+IG1z2NVJpJhN3ud8o4Am8/PaU698t9GntqKjtvZTM6FnpwxjCYqBRlF7gCoxVd0XB60+Pn5lQ==
X-Received: by 2002:a05:6000:401e:b0:391:1319:9007 with SMTP id ffacd0b85a97d-39ab7c2fbb7mr3331354f8f.5.1742820762583;
        Mon, 24 Mar 2025 05:52:42 -0700 (PDT)
Received: from krzk-bin.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9f682bsm10811402f8f.101.2025.03.24.05.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 05:52:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Colin Foster <colin.foster@in-advantage.com>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jeff LaBundy <jeff@labundy.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] dt-bindings: mfd: Drop unrelated nodes from DTS example
Date: Mon, 24 Mar 2025 13:52:38 +0100
Message-ID: <20250324125239.82098-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Binding example should not contain other nodes, e.g. consumers of
resource providers, because this is completely redundant and adds
unnecessary bloat.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/mfd/mscc,ocelot.yaml          |  6 ------
 .../devicetree/bindings/mfd/netronix,ntxec.yaml       | 11 -----------
 2 files changed, 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/mscc,ocelot.yaml b/Documentation/devicetree/bindings/mfd/mscc,ocelot.yaml
index 8bd1abfc44d9..b613da83dca4 100644
--- a/Documentation/devicetree/bindings/mfd/mscc,ocelot.yaml
+++ b/Documentation/devicetree/bindings/mfd/mscc,ocelot.yaml
@@ -76,12 +76,6 @@ additionalProperties: false
 
 examples:
   - |
-    ocelot_clock: ocelot-clock {
-          compatible = "fixed-clock";
-          #clock-cells = <0>;
-          clock-frequency = <125000000>;
-      };
-
     spi {
         #address-cells = <1>;
         #size-cells = <0>;
diff --git a/Documentation/devicetree/bindings/mfd/netronix,ntxec.yaml b/Documentation/devicetree/bindings/mfd/netronix,ntxec.yaml
index 59a630025f52..06bada577acb 100644
--- a/Documentation/devicetree/bindings/mfd/netronix,ntxec.yaml
+++ b/Documentation/devicetree/bindings/mfd/netronix,ntxec.yaml
@@ -63,14 +63,3 @@ examples:
                     #pwm-cells = <2>;
             };
     };
-
-    backlight {
-            compatible = "pwm-backlight";
-            pwms = <&ec 0 50000>;
-            power-supply = <&backlight_regulator>;
-    };
-
-    backlight_regulator: regulator-dummy {
-            compatible = "regulator-fixed";
-            regulator-name = "backlight";
-    };
-- 
2.43.0


