Return-Path: <linux-renesas-soc+bounces-19823-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9933FB17E30
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Aug 2025 10:23:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 924137B54A9
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Aug 2025 08:21:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C60E21ABAD;
	Fri,  1 Aug 2025 08:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vp8HIq5E"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE0B5B21A;
	Fri,  1 Aug 2025 08:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754036595; cv=none; b=P7Xdseh6TK+7dBCl+xfjlkN85V+Pj9hIJe0rB0N5jcPlvbgnUrEoQl+GwdxXOe2CESO9KhgbLKqWcoO2AhhrqeoUZUY0D2vo9afP9IRGLxCXuxuVuZKfjUK2LjL5WNmB/QoqcHV/4Qx9XSG5Ud7KGl2dsuVao3jcbZqQZ1C6sJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754036595; c=relaxed/simple;
	bh=oFW8Pcf+/M0flUeJ4t5z0g/SaacnwFP05q4Nt+4Z9wg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=j+jvucGkLWOkG0KOF4k/7EbrndMEN+tpRyW3SQTbjeK+nnYTpseSvlcCCwNbJWSqkv09j7Ol2/qSzPz+rLGK2SwE6NzdLwobr1PQmw6uG87t58ol/9IeMrnQi0qFNUM27g99BaQGKQABbtilXcCNOEVBBEzce6nmufW4dE/KPyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vp8HIq5E; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-31ecd40352fso1315235a91.2;
        Fri, 01 Aug 2025 01:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754036593; x=1754641393; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9XTlkPv0IBw1LQNFKJofErU6zJZ+bp+//Zwh3h0I84U=;
        b=Vp8HIq5EMYbJFlcwdocMaYSnSvSlUAqWkhMy/pHOKmLN6gYGcfq998g4ivej6Zbmwq
         trnZc8rD2eJbemo3N0vAkDgl+tFJjL1TD4O4Hntpqbmxg4Q8Cckon1zIma8uUZoPSIdV
         OHGdnCrJx8N21opT+VNnZAaWVUPlphxh1vwlxZMC1MtnJzoXD4sl28/QlAX7m2Xjx84e
         q+wJV84f5QQZ1aCXCNM6OuHnCWBGidm+Ury6FeP8FAFykBaL+KkbI26Lcp2mJLy++dA8
         ESILJWQ6gd4dv+00ta84xZEAdi993JlPQkqIfVs5xgtpPk+TYYMIzBTHLr8E4qRDjs8k
         ozOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754036593; x=1754641393;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9XTlkPv0IBw1LQNFKJofErU6zJZ+bp+//Zwh3h0I84U=;
        b=qAsPNBOnyZFOwMcqrUz3tF6xglZdwtmqVSN9Hhr5Vo1OFt1WybMMbPWeLH1oSnMfih
         GALKgt5IqdD6XvflrOhpJ+Ozvwg3n1SuNBTvYeUVAeWZy5dx2jTF5Dn4Qp47eH8caNXk
         PMY3uM+quu/zirVaLrcWkLOqaR/jwtSudwB1yz8sqawKNtOILvJhQ6c/vDhHhWiYU3aQ
         +g3EsaYzwN64i1cpBdjnAuJujkX69CKd+RWlVNuvq+qb3K96a4wuK7cmjWGB/vQ9lZSN
         hxQFoTyKiQzIzHteqVDqni7UOIRaB2HNPU6Iqj5UgBDTEMup4BNx2pAIl97U7c5U+OFR
         qA2w==
X-Forwarded-Encrypted: i=1; AJvYcCUY0gr2R5jxJTuA68VzwMPMcj7A7plSx0badymI6WJwnVHMF7/4coAHcNRSV9CaxK4vuGbg+DKk65A136+Ag+6M5Yg=@vger.kernel.org, AJvYcCV6Mj3Lpkx0tkNHQipLHKr9C3RkLq8Dr85pRLMm+SVIF8d8XFJmKeeuh7SquXVGYig7AeBdetDO9Qd1E9Ez@vger.kernel.org, AJvYcCXOAE/2bpyWq3jybfuSfS1xQl2jDBNU22JGystWjn0Ht71l2YNKvLqghXovK7VjPFq+2caowNFDlg2LoXXN/a8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9Y/RelsNwFyadLDgbeh59DmcCT3xZyEQ0PjuhChC2MeqFE1l7
	WefrejqUWDfupOyNLkBwQii2QvmgwzHH35pzGazZrZ+8uvi4XzyTXfdv
X-Gm-Gg: ASbGncuLvSSg8NfVBxfYOgW+M+6WTM95pB+FST68b4dUJQpIHamMujMp/Z9pddqYe0z
	ZBMb251fmCRvE2MWhUN5PQu39iEEv80ydhTzM1+Bh2TRzkAHkSCz8HUowOox7FW0V80HEwqxAGI
	JR4RtW+BgbO2OypyAcHTcS9Z6Ok2CMV1HvLi3JC1dV3dX1guqfxFpXZ4emyOncj2dKbnrF4H2iK
	+36gzm+DjVGMyk3zXUSLYyxrUaBANHKrx68N1CfSPF/PqStbfuBUaaxYN/YTX0c2nGjc9uJ9xhm
	BI79+ObJj/dGwAqv7cXrRUKZM557P7RV3rTusb6xcaQB0b7OCldBEaH9MJcOOewnAvvU9X6AWEO
	5r/IZrosOCzDt+7KzjhqrdprDgt97e49FgKmplSfA+zFdPuqhLyqhn4UjDMP3Topxs5SCQgtvaf
	4hxQ==
X-Google-Smtp-Source: AGHT+IGvj0g2SL000bEpFWCRgDs2CE3+7rERXhrbik2vKVQje+4iGkCwmUe9S42Dfhh7fy3ca7XvNQ==
X-Received: by 2002:a17:90b:1c06:b0:31e:3f7f:d4b1 with SMTP id 98e67ed59e1d1-320fbd13993mr2917452a91.24.1754036592766;
        Fri, 01 Aug 2025 01:23:12 -0700 (PDT)
Received: from [172.17.0.3] (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3209a850417sm3992725a91.35.2025.08.01.01.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 01:23:12 -0700 (PDT)
From: Leo Wang <leo.jt.wang@gmail.com>
X-Google-Original-From: Leo Wang <leo.jt.wang@fii-foxconn.com>
Subject: [PATCH v10 0/3] ARM: dts: Add support for Meta Clemente BMC
Date: Fri, 01 Aug 2025 16:22:47 +0800
Message-Id: <20250801-add-support-for-meta-clemente-bmc-v10-0-c1c27082583d@fii-foxconn.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFd5jGgC/5XSzWrDMAwH8FcpOc/Dn3K8095j7GDL0mpYkpJko
 aP03ef2ssAySI8S5vcXli7NRGOhqXk5XJqRljKVoa+Fkk+HBo+x/yBRcm00WmonQbUi5iymr9N
 pGGfBwyg6mqPAT+qon0mkDkWwKloICZ02TXVOI3E530Pe3mt9LNM8jN/3zEXduo/oixJSkMMIE
 IisT69cSn17xqHvn3HomlvGoleuVntcXV1ARyxdUDbgtmvWrtnjmuqi1oYZ2QLytmvXrt/j2pt
 LnlkbCxLttusedl11pWkpAytM4Z954df1ctfeoLqeDTmfsjQGtl2/chXscX11s0vJWxfQxbjtt
 mt31z+01dXMEDkZSJK23bBy991DqG7yQD6TzYDtX/d6vf4AdUIfe5kDAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754036588; l=3087;
 i=leo.jt.wang@fii-foxconn.com; s=20250618; h=from:subject:message-id;
 bh=oFW8Pcf+/M0flUeJ4t5z0g/SaacnwFP05q4Nt+4Z9wg=;
 b=aEkmJbS4z4oVHMRyPJVF+2OC67JWDL1S9Gy1HYPiBX98lLoJ4Tit/AnCyZMx10XwXEcHdsqdy
 kAurb9DK/J1BoDXviwLgykl1ayq8RLQQzkQVo2kyyjk5eYPsBgFQC1W
X-Developer-Key: i=leo.jt.wang@fii-foxconn.com; a=ed25519;
 pk=x+DKjAtU/ZbbMkkAVdwfZzKpvNUVgiV1sLJbidVIwSQ=

This series adds initial support for the Meta Clemente BMC based on the
ASPEED AST2600 SoC.

Patch 1 documents the compatible string.
Patch 2 adds the device tree for the board.

Signed-off-by: Leo Wang <leo.jt.wang@gmail.com>
---
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
base-commit: 52da431bf03b5506203bca27fe14a97895c80faf
change-id: 20250618-add-support-for-meta-clemente-bmc-941a469bc523

Best regards,
-- 
Leo Wang <leo.jt.wang@fii-foxconn.com>


