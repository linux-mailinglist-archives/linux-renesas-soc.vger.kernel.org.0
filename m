Return-Path: <linux-renesas-soc+bounces-16510-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5835AA48D5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Apr 2025 12:41:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5879D3A7B55
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Apr 2025 10:36:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CD1325DAF0;
	Wed, 30 Apr 2025 10:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="FmUjbCUe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF4E25D8E9
	for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Apr 2025 10:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746009201; cv=none; b=BPkjFrnWWzyvjNFjRMCXj73K7iDwhQ0ImyJc4eHCcCnp/Vg2KoWKQkuJ6cQu3ASl4Y/DZrmabIQ6YN38gPBa99IYYJZGM0KGqRyqnG6sTQkSEmaqCXCyV+rnu3EmwZ5F2AzKV8f8JhzvtYeh74AobXE5ed0gDok2TRxBFZROZ50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746009201; c=relaxed/simple;
	bh=/qb3LqOk0CPpYt1EbGZXh/Cw0pmf2cmac/XhDTHJc/A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eLGTeECjUxDWWm21M38BS1lTP0UbryU0pLJ4Y4z6ZXsfrZvhk+MDXmFrFU1kggOhUR0rdfQt17FH12DH/8grcHAwmhOfF7/29i5kf74GHgDBkXAUzTz1IiyN4ZpWZvRamyD+yQFTUMFsAMnMOZulzaqzxHBtqL0l0XljLd/g61I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=FmUjbCUe; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-acec5b99052so325069066b.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Apr 2025 03:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1746009198; x=1746613998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5/1UiigIwXR8rjSUy1c3Sx5vxGn2/huSophWGwjW0Zc=;
        b=FmUjbCUel/sDyoT96HiYbVfnZDo+v2BW0CCcZWw0bXzJ++Q4SVcTJ49ikGG0R++cfq
         aXg03AGEJAXs54SuWkde7nF8hOWT036NHNkkwZyQsmFXJJLUa13uq3yJbgxKKdfn/axD
         oS2YzykAKuXhdWJixjv+yoMhJcDe+ZMoicXN3L0MfJ6CaV5RkevYwhMZSzU2eEK8xjBz
         BSp8I4HfY6DB/hd0OxI22CAhdUvJZKRe0xh3HFZm1j4vSWyszzyczuAsbnvBEbr1EbaP
         0GkgnSQ1h6N0FyWhYWwsBoKgXXTSv41dldS8FRWOFIUv5RkGduvGzmRT1Jx6Y3LR4/br
         7QFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746009198; x=1746613998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5/1UiigIwXR8rjSUy1c3Sx5vxGn2/huSophWGwjW0Zc=;
        b=p5Xof8F9cvhQc09L520qUWRgM8CbCegFTvPTEli/USlKogYjN/EqFuhnW/Tor/888g
         +PKe3u6K2Vp4OLgATB1/fdbTFLH/d/N///4Ouja9GxxTSVcInYJaAk1zSf+gG54yTdYD
         Ct4C1xPhsx+JEoBOIwRxLQY72ZjAutGSoZgsc+kVMpARkzjcl2p5e2z3g394mY6zto03
         1p6xHWLd88CmZOePHeqqDpzAzCMzz33VzRTa7kphSCD/HD8MtQtFaDaNcT60ez94vZQb
         RSUvL79w7xA1wPFd5d+Yq0JCW8WD+d5YjYl2W8AUPaGGjemvVzHZbFZo8B0pxXgg3ogF
         L/qA==
X-Forwarded-Encrypted: i=1; AJvYcCWDNCQRHnfShaoVJ2AlfxbyIibxfQ0/4MXW81jHX+xRAgZkiN2R9+yZfaMK8s6i1o0MFx+xpI+A1HxkYbFjGR5USg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSa7sth3oSzXMi6OgniWFHyTzeClhdxNmCNurv1GBb015aMllk
	o3f9gFi7OLSrsnufZuaPxtJZdcvktT9mNe4dn6fZAZfOS1Q+h4dWpVjlCiBXkTk=
X-Gm-Gg: ASbGncvWjEMlvUCJx4GvvRu0aAZAeMS0AlggGfnhwaXrfnKYc/vb/CRLeCPGiJnZNHi
	n44IHNqswvcX0UL6cLH/hTXdNd8bpBpB2abG5aXWoyGKSjTYTHPegM2mDhHICMRiZJq+Uj8KHxf
	qWvM2s9mjs5k0Tq1MhloHcPOtwtW134Y8koPpS9RVXdVhMQuGI4V53zZcFu7cFjXrDIf8Hnx/46
	iQ8Y7lO8D4eHLbOJgRgfTRKaCw0KQ0naxd6RyBqJgfIYmJdc8y0u5Wdij8u6lp5slCFFWm+FBys
	4gcP0cOc2trbAzk/DiFQuHfs9IZen4NLt+btITCGTHGC36GQhldDL8riLW9WaKzrThf2K58=
X-Google-Smtp-Source: AGHT+IHBcCruFD2Sx7wtL0cb9Uodi9fNatKRjptTZekaQF3eLuwGTgjpuo5/jbKcvNzZcB+Y1bBY1g==
X-Received: by 2002:a17:907:3ea2:b0:ace:da39:7170 with SMTP id a640c23a62f3a-acedc768b2fmr307149666b.55.1746009197623;
        Wed, 30 Apr 2025 03:33:17 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.166])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ed6af86sm909390366b.133.2025.04.30.03.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 03:33:16 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	manivannan.sadhasivam@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	saravanak@google.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 8/8] arm64: defconfig: Enable PCIe for the Renesas RZ/G3S SoC
Date: Wed, 30 Apr 2025 13:32:36 +0300
Message-ID: <20250430103236.3511989-9-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430103236.3511989-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250430103236.3511989-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable PCIe for the Renesas RZ/G3S SoC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index a92c4122a8b9..b36a96777018 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -226,6 +226,7 @@ CONFIG_PCIE_MEDIATEK_GEN3=m
 CONFIG_PCI_TEGRA=y
 CONFIG_PCIE_RCAR_HOST=y
 CONFIG_PCIE_RCAR_EP=y
+CONFIG_PCIE_RENESAS_RZG3S_HOST=m
 CONFIG_PCIE_ROCKCHIP_HOST=m
 CONFIG_PCI_XGENE=y
 CONFIG_PCI_IMX6_HOST=y
-- 
2.43.0


