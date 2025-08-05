Return-Path: <linux-renesas-soc+bounces-20002-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A34FCB1B34C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Aug 2025 14:25:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B6FB3BE50A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Aug 2025 12:25:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42E23270579;
	Tue,  5 Aug 2025 12:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G0pRY7Uf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812131F561D;
	Tue,  5 Aug 2025 12:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754396740; cv=none; b=keI/fSXooRA6kJxooAFXQNDqXHoDFPD68lGaCZs/NoaQUc/Y0V/V7nid+CuQ2NTXrkaDKEa7dSphiDo6oP1b4zgeKKBdi7CMoBZpoQhpzq4Bk3MzdFVf32HKqmLO1xbppDElpj0R4nWEbhiDYELkiTjr/rAqfSa5p7bXXtEwvOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754396740; c=relaxed/simple;
	bh=5D4tOJ/Ukpjgu6zPYUi8fs/FkDLpoRImbHSAcLahtb4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pFD2wPTwwkGcX1AB0/Etod7S0adouktv8hDHmU7CzJUvbh6mJdDuhR4tXl8vFaZ2LVHLitdi8/V1f1bs2QJq1SEw+cYFLtB55ZrJVnJ3CnZRSIYjH6WU0PdQSu8VDUCnUaoahZn80c+lZWzDp2ELVffZHQVeXyHxr81k7GPQmfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G0pRY7Uf; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3b7910123a0so5410739f8f.1;
        Tue, 05 Aug 2025 05:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754396736; x=1755001536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I5Ep8m0VKAwV5mXrgq4DZR9sXOgq4tSE6SfXbq4E5+g=;
        b=G0pRY7UfJqmA8iMMxACHiC6ECsk1//BhzvOdm/2bYxJ2UfchpQQZCGTcFTHO8Hi5ji
         G4Aqrom4zreTFNKzNsY7cgmxkLFMG/eooeHVm5hI9+oCyfvulw95ZYRy9fuLSLCfk6rM
         SJ2/wch6OUlFEN2m564w0WEkoT3riSY1hexTplqlPxjwmoLV3exdn1H6elgaZdJaCUqd
         BxVaLtvtu1yXBUb/xGRWWSRy/TvXtoTPJq1zqvKPZ7Iby0t83V7hBK4CMdEU+HSkxYmJ
         v29zVD68ZToPhds3/p44xw+OE+U+rmnWLtrnXeAxNVKje96IoosPM0MhYXB8lYgoPd8Q
         GV/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754396736; x=1755001536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I5Ep8m0VKAwV5mXrgq4DZR9sXOgq4tSE6SfXbq4E5+g=;
        b=NIL/eJBu3iMx8AKuwfb4XZBdMsgNS+aGs0lxIfhtmR8tpYuzCbYOC+IWkq+ZJjL6tX
         bdmYb6pqXbtRZMu32huCkBeUtg9qSg00bnVDGEPg9bzwmEGqDQ95728jE6+cy1i/XPjr
         DDH60Mvfziv4ugE3NCEOQAPeJtxX/mcN3iQvpLx+afE/ZtTk6AdYjkKvNKieB829W+jk
         sOSzfI7TcXKVvlBzBFhEP54u1/4Ht1dyCKKFoOX8keGO6hKBM2aTRXTlhkBEytYYpBr7
         Ah+zuCWfjfbYZ6QEs7w1WiA6ppxKw72Hpide/3WZRcvEJju9N0z/IDHFV8Ef5dHbu8na
         Co0A==
X-Forwarded-Encrypted: i=1; AJvYcCU+ewSQR7IG6m4huvUCA+9xH8UaoqsLQj1pKs04MxL+4/ADpu5ngWmHwwUsfMnxXKGN72N4hWhGEG81iJXY@vger.kernel.org, AJvYcCWQfqcHfbbJn6l0Y2AK6rdryJ3499AHt+qCw3VxOD+Nua/Pslkkib03/E/FvqSZqgRgSFgMjL+//Cjk@vger.kernel.org, AJvYcCXje5NRy2xIFsejR7YdvFX1x/CjpktVjuyfYw9TLZxjW4CcB8ys2ib3uYGnSg0wMWkxEcQJOpV3RllHTLssY4OIyRQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YywAdnWymTBaMrarFvR61LlUC5txhWeriN0KGuNDP1VJ0ylwens
	PDIjmUmCQhuxi7SNzSA+RFp+O+M6ESPMesgckfBpJaeFbPCaR3soSPbH
X-Gm-Gg: ASbGncuvHpWU6g+3nmPtbzsTcQLhYGmlIWIWFKZgqFtl1XzEK5z6RAwONqnlRetFDx+
	N9ZgRgjoytfa7pH4Y1sRioptD+CF2fgXt1KBA2iN2m7bvOj4u1uaUWuG/IaFpWfTzcvRk+u45NX
	fMxCXOZOyPNi08eBhZL0cgwA2iQKI8iAebqmOHf9Jo0UqxnO5ilQ/RjXV/7dSJpHqlueV0nPShL
	ALyxDRKOBk/sjVbUG3gK1saOa9G2nHbKTYyrNuDUaTuxb/7dLt+1N4T3/LUO+RujfgfN86Djpjo
	W4btCo2JTvx8FdReIW5UuW3myeWvCT1qxvozECaOdLNngnYZt5n1Ivk8g9CPJf8Eo4hF9DkLTph
	ZpBLV8XRS3ujb6zAxzY8zSjUXztIOx0QUlvRYVGzEoaJmYxQBcLxdxCu0jH39Z3APtSoVkwfVQw
	==
X-Google-Smtp-Source: AGHT+IH/BxE0hPVHk64qSFzfFDBSwRmjvC2GF0gHc1dmVlCBwJCvHU1LVAoN9rANd8IFap/CwdRMcw==
X-Received: by 2002:a05:6000:2013:b0:3b7:8146:463c with SMTP id ffacd0b85a97d-3b8d94cf0bbmr9070989f8f.59.1754396735746;
        Tue, 05 Aug 2025 05:25:35 -0700 (PDT)
Received: from iku.Home (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c48a05bsm19153986f8f.69.2025.08.05.05.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 05:25:34 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/5] dt-bindings: phy: renesas,usb2-phy: Add RZ/T2H and RZ/N2H support
Date: Tue,  5 Aug 2025 13:25:25 +0100
Message-ID: <20250805122529.2566580-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250805122529.2566580-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250805122529.2566580-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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


