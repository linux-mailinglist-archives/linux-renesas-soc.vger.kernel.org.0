Return-Path: <linux-renesas-soc+bounces-20635-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9F1B2AC4B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 17:16:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CA193BD51C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 15:08:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E88DB248F77;
	Mon, 18 Aug 2025 15:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bub9nz/O"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322CB2475E3;
	Mon, 18 Aug 2025 15:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755529686; cv=none; b=Qh07V09JJaMvs5CuC6R517q96f+lv9kvDiFjHYSl6q5uUI8HAr4Wk/AKrzWTNDi7xESN5vZ6xcH1+BHA+kPOc0O9OL3WzBklj28/Wgng1wWiWn/6zapN9GUlkYew0gZkpQl6G2Qb0Cp40fsO7jAXw8i/QY5WcIB6sanOjxkIMDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755529686; c=relaxed/simple;
	bh=VxG48FS8Awvy4h8SjKzR2xsT3/DYuytAWyXfjFNQx+M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kH7y4B7quAI+mPfn+050mrZCj9SWYelj0cgQgdHfbx+lrn/O8ndANWXj6GoiNWee25Vp5vaUoH+BjIM8pbUmkHfmlkEN7QQY0EDwNODWoclPlIxc4vRbb91pknUUln79ZBKqqLJ8PS6nicQckatRTfp+nFtj7zDzcXphz+kNrUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bub9nz/O; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3b9edf4cf6cso3962292f8f.3;
        Mon, 18 Aug 2025 08:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755529683; x=1756134483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nqim1ifCKPb/KzWmFvMcecjFHjsOCK/eGyqUPsAfPvk=;
        b=bub9nz/OfDWFq915T5ha9nmbSC5VgNR8QUhLCeCFqM1kF9gsurMu+jcbbjPchXgbSi
         bPg3rgBwU+6jfdf2qM7wW4piKA3XY5ET9msjxh3qw2pngragOuHkylG6bm/hQtV6C3LL
         7v9bPSLT45rwqIjhK2UksL24TuboqVQN190OVt2rXRdX53WaNj0vpGY7R2J6MsNzRtXx
         UtgcUn6NdS855IeDx5w+QekftoDKrHj/PQGMmyY1qMLAsfX9fkpUXgadUuTwF8BiA8YP
         DdBbjBt+JoROFAYEwUdVa0gRd1OQOnmVFC54OiEWfoLknSrsKNOVTtdZHplVsVZaQMNB
         DdGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755529683; x=1756134483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nqim1ifCKPb/KzWmFvMcecjFHjsOCK/eGyqUPsAfPvk=;
        b=n5fQfjXMqRL6AgpyJRoUv9e4+ornNm3bW9+BgebrLr5eIvuhv0m2HLvDYOTYSQ4Q7H
         94RN+aLP8dp/gMOydcLpKc6aVbavOd9mTjQc9E3vPO7Icly9GN3LjH/BpNYZP5+6AssE
         1K4CCp4ibe82QI1rwdpvtIiIvhRkSgmyszUutPaHBtXR87pGofWeu857stTVMxBmyoHg
         prol1MbAOUkoEU+jnxQAdNt5THCVCudEZrtNRwbgyIWH1Bde4FttwqjtiurAklzrOYPW
         Vh/rpGI1xwqMe0m9YyWlM03V4GWyuzPd2Zfy3gNstS/0jAywjaurOioZXlv/Lc+42rcN
         xZbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJR2tr5P1Ji3QljTvXXv+OsW7M+ykXHqXn1B1dH+vsoXPO6KUYGDKFeeS1UouMLCkSVaCwGxt4@vger.kernel.org, AJvYcCVE+QMUReoswJxpil6ONoNDLmnlRcEipR6HXxlA0ZkEVJmhiAHFyN0kkAFPZHFF/SPWjYRqqKUoONfiK70=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEWOfiTqDOLpZFByuWl48iVlOKJelEHJG1S4l/Php1Ta0N0oPx
	AU4Mz7znGrZGmSMZeIfOS+hkTm7AsIn1onOuKHU0EizmjBGW4/WO0OeG
X-Gm-Gg: ASbGncs+zTIYwAkUkk1rPzCCzbLs08jHjlqafq8J0+XeeZeNLEwuLmq8vU7F7KeiJa2
	LRHdxKiCo0Ivj6zqqNQeB8sDQxZrIS/f69qSw5KEM7yKk4dKwcJSegFti2tT2cCN+Rz0KKIAx+G
	0MWiEXiSl17/A8qpnaehiQtGi7cX8xu1vQMtHtMOouyRaJ7uAKQffsRLa0Ei1in/89MrjyTeubQ
	bd+7PnRoWLi3v8tzAadE9QNnBD8Qp+n3hByXUu7gjyCnk60EDkYMMftVt0mBmcmJgR8Xth+6Ae5
	xxg74CrvaibHjWvt9Z6s2HKgCvsFws1ZuCUg2pjmQ2pEV5x4Z7yfE2lrWSqOwQw5V+6zbHOK+jI
	HOm7LrCM7OzeJOMpKZ2Nd49n0P3e26YWT5rwagYxxWFfJxRHYYzE1heVWoeVkJ0Y0dHJV34brII
	dbuFzsT4Dl
X-Google-Smtp-Source: AGHT+IFZ4DMrR2GLeO+Mqg76Q5xa9rUbDahrwuFdsfYWn2QVOQQOfJRivAxjeacrbbSGo591fHYHnw==
X-Received: by 2002:a05:6000:438a:b0:3b7:931d:3789 with SMTP id ffacd0b85a97d-3bb6646ee48mr8409008f8f.4.1755529683038;
        Mon, 18 Aug 2025 08:08:03 -0700 (PDT)
Received: from iku.Home (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c6bd172sm187895305e9.6.2025.08.18.08.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 08:08:02 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	stable@kernel.org
Subject: [PATCH] net: pcs-rzn1-miic: Correct MODCTRL register offset
Date: Mon, 18 Aug 2025 16:07:57 +0100
Message-ID: <20250818150757.3977908-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Correct the Mode Control Register (MODCTRL) offset for RZ/N MIIC.
According to the R-IN Engine and Ethernet Peripherals Manual (Rev.1.30)
[0], Table 10.1 "Ethernet Accessory Register List", MODCTRL is at offset
0x8, not 0x20 as previously defined.

[0] https://www.renesas.com/en/document/mah/rzn1d-group-rzn1s-group-rzn1l-group-users-manual-r-engine-and-ethernet-peripherals?r=1054571

Fixes: 7dc54d3b8d91 ("net: pcs: add Renesas MII converter driver")
Cc: stable@kernel.org
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/net/pcs/pcs-rzn1-miic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/pcs/pcs-rzn1-miic.c b/drivers/net/pcs/pcs-rzn1-miic.c
index d79bb9b06cd2..ce73d9474d5b 100644
--- a/drivers/net/pcs/pcs-rzn1-miic.c
+++ b/drivers/net/pcs/pcs-rzn1-miic.c
@@ -19,7 +19,7 @@
 #define MIIC_PRCMD			0x0
 #define MIIC_ESID_CODE			0x4
 
-#define MIIC_MODCTRL			0x20
+#define MIIC_MODCTRL			0x8
 #define MIIC_MODCTRL_SW_MODE		GENMASK(4, 0)
 
 #define MIIC_CONVCTRL(port)		(0x100 + (port) * 4)
-- 
2.50.1


