Return-Path: <linux-renesas-soc+bounces-20448-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CABCB246AA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Aug 2025 12:09:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0DB0C3A9F41
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Aug 2025 10:04:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9FFD2F1FDE;
	Wed, 13 Aug 2025 10:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GhK9KSfU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325832EE5F5;
	Wed, 13 Aug 2025 10:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755079472; cv=none; b=R/sBQ249JNEyyCQPVk9fIVrs/tTpyuz4L0tmAjkLlovnUb4ge/KQiOD/d5UJGIVUWf96jebSWMFlKtrx3enmH5xrnwcCWCMRxbNoMQHzWKsS60lHMo5nRPu1q6xZA+JtCP+ojArcLiUhrothdkHSDFmxKgydcMpOKVaiGf+caJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755079472; c=relaxed/simple;
	bh=CjipzCBLA0dk4QE580Prr8K+4dZdrKP11N9W5AAxlSw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CTVBRJ/Hx2Cp8Vz0Del2wzlyFPPFGPNNNYERFygfSfTmlj9cEDXweUyVAFMvfhtqLjmwREsrpV2aMeqzcfk0qaX6a32x1chr7X1iUX5VJxfSEcfG4xcdyQD2TbQa20ws9pHjvpVGYo/15DuwuzSGMiHy7Us96k+MVGS8QBxJJcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GhK9KSfU; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2407235722bso63433185ad.1;
        Wed, 13 Aug 2025 03:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755079470; x=1755684270; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pA6OisM0xiSXM2QYlyPmLpjSFc9U7oYBc1YKa/QuGPA=;
        b=GhK9KSfUCDeJweNLXeS/VJZ15srf62cNbQVSu7at/sWuGITzQ37nIGVXU/j2tGsKbI
         +XGWWToSkdwBovt0wVDyk2wzxYERvm2LFgTlg1Nnvqd3CsuRG5EMBbCp4lQMN1x4mxZr
         InxjSnJuOJljFL6CexKq0VZjO1NSOyIikvpClY3GL75v9gne3i8BZTXgd7JcyK62x3US
         Cl7ldzNcubBLn4OKtItlBlDAsldpJxTlQWIbhAvRVE9t5rKaN8GAA1DJBW1HfNXUPAZ0
         nILXE+0TB2T1eLO41Dv7a8l8ikIxide2CmNI6AB9YwG9waXcTVY0gllaVgPvmmkt+VAR
         UisA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755079470; x=1755684270;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pA6OisM0xiSXM2QYlyPmLpjSFc9U7oYBc1YKa/QuGPA=;
        b=exsPsIH3pAulCxd9em/o7klu/Gis8WByDqb7bRn+hEbdqGpXef1eRA4t1kslKT+C8r
         ukktDEt2tF1/bjJFCVn7P9i/CR4A3ZD6el3Cq4QqFVDwQgGnjEQxNm8Qdzf9EzO9paj8
         q2gsVhLBwMenI4wIVf7rpkgwoBZI7JFIgebNYS3gjlU2nNlDuWIp7+Hw5c7Oys6pIxA3
         0b2UTsloZT1Ds/+o8Ppc0lVLVvCXa54Cxr65IuxQRhk82/UVNhNxGkebutzprnm8o2RG
         r+WHvKBQY7jyGNCdECjfEK9mdt2Kcubmm7up0fqAybFdmZmT6rEBPwm8RGZjt2YUtyPz
         pv+w==
X-Forwarded-Encrypted: i=1; AJvYcCUktRqgPxxECn8ph6Har7x5yK+Y0v00D3cFPcXBVC68ll3Xazdm2r4EobLOWAOyGkOKTswWNOh3hAEPHYwITr0iyXo=@vger.kernel.org, AJvYcCXddZx71RaQjW1QirtY+PWqujGcxKTzTUw10FcM1fWYr0U9sUxRw+F3Qc/TzOqYV/U8r7gXEP5UO8aFfB+QUCs=@vger.kernel.org, AJvYcCXwR5pjqN7SQiZWlCQFLvBgtZxHuZXeEO5bcHvdzmi9hTBZCPtXzs3AZWlcUb6B1k7CRiphuANQbnnmuVdp@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8oq6zql0a9hXq3JXqJrGFLGf6YTfGRy17Ti/S3wFBjlsYh1Ih
	G4bblswAo2/DVjqSUqe2PAhuC9GnDsDwKCOqym6uCbFpDBKajCADjqYU
X-Gm-Gg: ASbGncsrMUZbw+i3hbW9nGpfhj5qmsu/OLVYzZsXQxoosqsNUMYpxbvDKyOnNIwI/FD
	jyzgBIHls4J1O/hxPCeWHhZNQsF8z7T6k5jbkofWPQyJoXrmYELoGe2MiZg1Bx1aBGiYqo8ejXd
	QH1NLHhOIs3pEl4ELD/VCtWAAHfssibJQzUF8dvI2VHnm+SyBooWVphkWZfopSrVTwkRldjKI5Y
	T6rR5eSHbT9Kcs7zsNcLFpyNCxtSegkBxkYvPcAOzv5oaqs3oOi5y+uVpvRJCa3Cq+RXZ1Ho8xE
	Hl19ZwNVoO8FQ7Bp9Hff3wsOSrW2NiECJW4VLAJEqeDJzDhqSJqLFq2if5V6Gd3z7y4z1Zz2Wss
	jAJzZ5PDmA6AsTYcdTX7OVeLeMPTMQdN45QZdAu/GgcNDnCgQLu6OAS84NV9IVKJJcy1tBfVMQq
	CI2w==
X-Google-Smtp-Source: AGHT+IEGRUvzVmCw1gWq+fPL2z8gPf1Lc1jO0/qbCXCywxlp9sv7Gs9Tm2YFFW1IY+GR7t19aZAzjg==
X-Received: by 2002:a17:902:e889:b0:240:a889:554d with SMTP id d9443c01a7336-2430d21d1d9mr41164265ad.45.1755079470435;
        Wed, 13 Aug 2025 03:04:30 -0700 (PDT)
Received: from [172.17.0.3] (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8aabdedsm321545335ad.167.2025.08.13.03.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 03:04:29 -0700 (PDT)
From: Leo Wang <leo.jt.wang@gmail.com>
X-Google-Original-From: Leo Wang <leo.jt.wang@fii-foxconn.com>
Subject: [PATCH v11 0/3] ARM: dts: Add support for Meta Clemente BMC
Date: Wed, 13 Aug 2025 18:04:12 +0800
Message-Id: <20250813-add-support-for-meta-clemente-bmc-v11-0-8970d41f88b0@fii-foxconn.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABxjnGgC/5XSzWrDMAwH8FcpOc/Dn3Lc095j7GDL8mpYkpJko
 aP03ef00sAycI8S5vcXlq7NRGOmqTkers1IS57y0JdCiJdDgyfffxLLsTQayaXhIFrmY2TT9/k
 8jDNLw8g6mj3DL+qon4mFDpnTwmtwAY1UTXHOI6V8uYe8f5T6lKd5GH/umYtYu8/oi2CckUEP4
 Ii0DW8p5/L2gkPfv+LQNWvGIjeuFDWuLC6gocSNE9rhvqu2rqpxVXFRSpUSJg2Y9l29dW2Nq1e
 XbEpSaeCo913ztGuKy1VLEZLA4P6ZFx6u5VV7g+LapMjYELlSsO/ajSugxrXFjSYEq41D4/2+2
 27dqn9oiytTAp+CgsBp33Ubt+4eXHGDBbKRdARs913BH3DLqw5Y8PUiBMqyEGlaFf/Kt9vtFwU
 gvy7zAwAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755079466; l=3316;
 i=leo.jt.wang@fii-foxconn.com; s=20250618; h=from:subject:message-id;
 bh=CjipzCBLA0dk4QE580Prr8K+4dZdrKP11N9W5AAxlSw=;
 b=BJkjd0kiA5Y8obGHU+q6FUc8+QDJ1WXZD9uSxKU29Zky8R5vRxRpNK01HbH/Vk9qthXmKFUNj
 wq0ZQ7HThYLCdP4EjcBvWj1whob5NKgQ/OA7LXugQL6ituxA13vE96/
X-Developer-Key: i=leo.jt.wang@fii-foxconn.com; a=ed25519;
 pk=x+DKjAtU/ZbbMkkAVdwfZzKpvNUVgiV1sLJbidVIwSQ=

This series adds initial support for the Meta Clemente BMC based on the
ASPEED AST2600 SoC.

Patch 1 documents the compatible string.
Patch 2 Add pinctrl nodes for NCSI3 and NCSI4.
Patch 3 adds the device tree for the board.

Signed-off-by: Leo Wang <leo.jt.wang@gmail.com>
---
Changes in v11:
- Rebased on bmc/aspeed/dt as requested.
- Link to v10: https://lore.kernel.org/r/20250801-add-support-for-meta-clemente-bmc-v10-0-c1c27082583d@fii-foxconn.com

Changes in v10:
- Reordered NCSI pinctrl patch before board DTS.
- Dropped MAX1363 ADC nodes from the devicetree.
- Link to v9: https://lore.kernel.org/r/20250723-add-support-for-meta-clemente-bmc-v9-0-b76e7de4d6c8@fii-foxconn.com

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
      ARM: dts: aspeed: clemente: add NCSI3 and NCSI4 pinctrl nodes
      ARM: dts: aspeed: clemente: add Meta Clemente BMC

 .../devicetree/bindings/arm/aspeed/aspeed.yaml     |    1 +
 arch/arm/boot/dts/aspeed/Makefile                  |    1 +
 .../dts/aspeed/aspeed-bmc-facebook-clemente.dts    | 1250 ++++++++++++++++++++
 arch/arm/boot/dts/aspeed/aspeed-g6-pinctrl.dtsi    |   10 +
 4 files changed, 1262 insertions(+)
---
base-commit: b785b5d88cc27a521ea22b3afd85804c4c321d4a
change-id: 20250618-add-support-for-meta-clemente-bmc-941a469bc523

Best regards,
-- 
Leo Wang <leo.jt.wang@fii-foxconn.com>


