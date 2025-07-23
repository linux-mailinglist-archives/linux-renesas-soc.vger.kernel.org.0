Return-Path: <linux-renesas-soc+bounces-19620-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D91B0E92B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jul 2025 05:43:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F96D4E5D9B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jul 2025 03:42:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DD9E2472BD;
	Wed, 23 Jul 2025 03:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UDBFXriS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EB317BEBF;
	Wed, 23 Jul 2025 03:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753242178; cv=none; b=dz/Vr07a7LutRDdtlfB2UcpVreaex5d+N/HzwuJx5a8uwVca6iyK6TeZkHlzRnWuKPoqJ1Gd1+RU5b9PiD7C/dFqYh/G7WY8cNhT1ezJmm60qce2rZbBAhmaQsFFS7YZpfcx9FYCKFfy64e7mKz5MzaEMrOngkkoHkzI3s4W7h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753242178; c=relaxed/simple;
	bh=AuSAmkqHcM4OHqTPBGVEv3kpwNw3rYsqqDHlncqpHCc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hT/ZtYM2g5U0Ou7GWeVVF4EXvca0To4FlLs1Pb25XQ2GGokkF84trDmCu+H56OvRA3hEPi8QNsvGm5u/kL8ryMMWGLK00dbrgxGm6I9NQqY6yT8Yt5Ysj9sowHV255yuJ9eX9d6vnko63l3YcYmzZNToLUMBwZXdWVVv40AI5vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UDBFXriS; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b3220c39cffso6081664a12.0;
        Tue, 22 Jul 2025 20:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753242176; x=1753846976; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zYRwMvyfo/b0Z0fdscYgn1jvIel8XvwropGmloEytZI=;
        b=UDBFXriSylThoqHbGxvwO1NgSvSKNu2HSe6Mv7MEPkEQT/GkAJgh+RISu5bpzFrV+r
         RRk9vZrJVGzivPt+MceWZt7Xxnw+DyeqTe5PkE0FU9Mu4i8NhN9RSkL5omdzKr01xAOv
         H9TTW7ojvYhbHIMyh0I5H0ljNnK4zGgQOI2pQhdDCeQjm9a2hWCzJKpWWP5XhUTHea+T
         qhUhGx2zebny/oca9ZQjNdo21DVueA8kHwswaYe/BVDZK2UZzuOjhb0l8edeyqpG1taT
         JuRtOpdbzPJqoZrsChUHBwxkC6/Ne3RLwdpN5CKpmA4KxbQyGnmNGfv5ol72H8Dr990o
         VMyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753242176; x=1753846976;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zYRwMvyfo/b0Z0fdscYgn1jvIel8XvwropGmloEytZI=;
        b=PDq8UdzP+1esb9v7THChd0yBIT58Ye2zpDq3+YmRrzeErJS7nkz47rPMRFzVowvM3Y
         hG9SPwJAHFSKFbCN8FLvKJIFWnYovOelj6PucnyvtRlQIw+Z/OkCex2HXRyvNaCL409/
         xX2mnwe1L7DfMwYYAscqrqd/9NFEEKEhxe4xi3SaYpSpCL0/RGlfkzD2kpmcDqwT3vNZ
         bjH7nzpVLpMEsTbZcCa5iFaEIv3klgwoJf6O/bxj7587ePX7FL11AAyTGE/KLD2KiDv7
         LQ7sBDRcGwpzdFSw6B6xjAo8mS2YVmwKV1nbEdgN8Ygt48uzuS84lx9irqHVmX/v93XM
         5g1w==
X-Forwarded-Encrypted: i=1; AJvYcCUsaF9ydYYbukad3Rcle3hSdqp16LF1fstVpYnnaFElYVfk82GSkgyQPKA+raL52iZpnMTlMV0wtsrPkCtQcbw=@vger.kernel.org, AJvYcCV80D/bS1FddF0HwB0qZOlZ1b/acAnEJ/vvC31XkX4Vo2lPxkk+M7WfLdb66yP6UGjkA273AM64wvf1deZ6bXK5AUY=@vger.kernel.org, AJvYcCVv5xUKZmLUNRfaJgc3FncEzzHxrtcY8t7GFbB9IB7QW5RyGL3OW5gH9fn81YTUvCnixCxHcVPbI6tcdxhk@vger.kernel.org
X-Gm-Message-State: AOJu0YyTFhGij5276/BF4EnYKPl7YHs/HV8JqUEN0lbwa1wwWKd55gxc
	9OceHRHNs1Akgxs0hojuoZeWmbFxrXNpWQk2ZDezKL57i5hThO/dtdS/
X-Gm-Gg: ASbGncsosUBF+oAOQWYvNjNAtrgb+7pho3ka3Nwi4+cpgYo/wQdY55o63LVEJp89jox
	hFbL10VGyvlQAymer23v7MRMf9x/BDfraOmgs974EVveLmjsC8Hz+fSVNDQs7pWkXDtoYjOGW3v
	DpTsQ+lXDR1p9q/Ybm1I/iQhNY4TLhbwNhpMUE4FUtRoTSoERG+qM/4BAoAEI6FgVwMMZca6F2W
	G4QhauaZK1NDN7GnPNdBQ+0k8OC5AN97tVkUB+qKpC6wE0AloY88x9+5ezjUWrQkogtK6rkwVhK
	UHFg9a1Onhy7yHRDnUT+HsCfak5Ky0mosUVqqDisb4DqLpL/fSjwM+0wV66tSQfV9750mR9eepV
	R7WYuOTvpqRLRWf9XBqwbE9wzyStRCJZWK8LCdynVspktBF3xnWbPbdPksG2GtnuyVro=
X-Google-Smtp-Source: AGHT+IHgMmQu7p8TJdr89s8prYT42MP3mN0kb1mkNyslHGE6mS1Jt2errHLIA3LNcROo3VW3v/R5OQ==
X-Received: by 2002:a17:902:d50d:b0:236:94ac:cc1a with SMTP id d9443c01a7336-23f98193560mr20187515ad.27.1753242175660;
        Tue, 22 Jul 2025 20:42:55 -0700 (PDT)
Received: from [172.17.0.2] (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6b4d47sm86197605ad.99.2025.07.22.20.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 20:42:55 -0700 (PDT)
From: Leo Wang <leo.jt.wang@gmail.com>
X-Google-Original-From: Leo Wang <leo.jt.wang@fii-foxconn.com>
Subject: [PATCH v9 0/3] ARM: dts: Add support for Meta Clemente BMC
Date: Wed, 23 Jul 2025 11:42:39 +0800
Message-Id: <20250723-add-support-for-meta-clemente-bmc-v9-0-b76e7de4d6c8@fii-foxconn.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC9agGgC/5XRTWrDMBAF4KsEraui35HVVe9RupDGM42gtoPtm
 pSQu1fJpoa64CzfIL43aC5iorHQJF4OFzHSUqYy9DXEp4PAY+o/SJa2ZmGU8Qp0I1PbyunrdBr
 GWfIwyo7mJPGTOupnkrlDGZ1ODmJGb6yozmkkLud7x9t7zccyzcP4fa9c9G36iL5oqSR5TACRy
 IX8yqXUt2cc+v4Zh07cOhazco3e45rqAnpi5aN2Ebddu3btHtdWF42xzMgOkLddt3bDHtfdXAr
 MxjpQ6LZd/7Drq6tsQy2wxhz/2Rd+3aB23Q2qG9iSD7lV1sK2G1auhj1uqG7rcw7OR/QpbbvN2
 t31D011DTMkzhayor/u9Xr9AaF65QhAAwAA
X-Change-ID: 20250618-add-support-for-meta-clemente-bmc-941a469bc523
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 leo.jt.wang@fii-foxconn.com, george.kw.lee@fii-foxconn.com, 
 bruce.jy.hung@fii-foxconn.com, Leo Wang <leo.jt.wang@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753242171; l=2850;
 i=leo.jt.wang@fii-foxconn.com; s=20250618; h=from:subject:message-id;
 bh=AuSAmkqHcM4OHqTPBGVEv3kpwNw3rYsqqDHlncqpHCc=;
 b=jkX0xnPl1Vav8XFrtAj/GFS9wUTsOPnX24pKpHMomGWsUEABEEgRbz2vJNi0ABEwzZN+MnGG8
 G/9njjuRVmeD5DHubis+ZuzI6RhPD/s3XRDqu3Gr8e0JUMY3jRefu32
X-Developer-Key: i=leo.jt.wang@fii-foxconn.com; a=ed25519;
 pk=x+DKjAtU/ZbbMkkAVdwfZzKpvNUVgiV1sLJbidVIwSQ=

This series adds initial support for the Meta Clemente BMC based on the
ASPEED AST2600 SoC.

Patch 1 documents the compatible string.
Patch 2 adds the device tree for the board.

Signed-off-by: Leo Wang <leo.jt.wang@gmail.com>
---
Changes in v9:
- Fix comment alignment for // PDB TEMP SENSOR.
- Drop non-standard aspeed,enable-byte property from i2c11 node.
- Move NCSI3 and NCSI4 pinctrl nodes into a separate patch as requested.
- Link to v8: https://lore.kernel.org/r/20250717-add-support-for-meta-clemente-bmc-v8-0-2ff6afb36b0e@fii-foxconn.com

Changes in v8:
- Relocate IOBx_NICx_TEMP TMP421 sensors
- Enable byte mode for i2c11
- Link to v7: https://lore.kernel.org/r/20250716-add-support-for-meta-clemente-bmc-v7-0-d5bb7459c5aa@fii-foxconn.com

Changes in v7:
- Relocate CBC FRU EEPROMs from i2c13 to i2c12.
- Link to v6: https://lore.kernel.org/r/20250708-add-support-for-meta-clemente-bmc-v6-0-7f3e57bd0336@fii-foxconn.com

Changes in v6:
- Correct Author email to match Signed-off-by email address.
- Link to v5: https://lore.kernel.org/r/20250627-add-support-for-meta-clemente-bmc-v5-0-038ed6f1cb9f@fii-foxconn.com

Changes in v5:
- Remove accidentally pasted texts.
- Link to v4: https://lore.kernel.org/r/20250627-add-support-for-meta-clemente-bmc-v4-0-ce7ff23460c4@fii-foxconn.com

Changes in v4:
- Move properties of nodes defined in the same file from label ref back to where they belong.
- Move pinctrl default configs for ncsi3 and ncsi4 to aspeed-g6-pinctrl.dtsi.
- Add properties to i2c10 and i2c15 to enable MCTP.
- Link to v3: https://lore.kernel.org/r/20250623-add-support-for-meta-clemente-bmc-v3-0-c223ffcf46cf@fii-foxconn.com

Changes in v3:
- Modify leakage sensor to reflect current design.
- Link to v2: https://lore.kernel.org/r/20250621-add-support-for-meta-clemente-bmc-v2-0-6c5ef059149c@fii-foxconn.com

Changes in v2:
- Fix patch 1/2 subject line to match dt-bindings convention.
- Reorder device tree nodes in patch 2/2 to follow upstream DTS style.
- Link to v1: https://lore.kernel.org/r/20250618-add-support-for-meta-clemente-bmc-v1-0-e5ca669ee47b@fii-foxconn.com

---
Leo Wang (3):
      dt-bindings: arm: aspeed: add Meta Clemente board
      ARM: dts: aspeed: clemente: add Meta Clemente BMC
      ARM: dts: aspeed: clemente: add NCSI3 and NCSI4 pinctrl nodes

 .../devicetree/bindings/arm/aspeed/aspeed.yaml     |    1 +
 arch/arm/boot/dts/aspeed/Makefile                  |    1 +
 .../dts/aspeed/aspeed-bmc-facebook-clemente.dts    | 1294 ++++++++++++++++++++
 arch/arm/boot/dts/aspeed/aspeed-g6-pinctrl.dtsi    |   10 +
 4 files changed, 1306 insertions(+)
---
base-commit: 52da431bf03b5506203bca27fe14a97895c80faf
change-id: 20250618-add-support-for-meta-clemente-bmc-941a469bc523

Best regards,
-- 
Leo Wang <leo.jt.wang@fii-foxconn.com>


