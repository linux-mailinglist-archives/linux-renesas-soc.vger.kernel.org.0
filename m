Return-Path: <linux-renesas-soc+bounces-15925-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A697A88697
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 17:14:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B1CC567E91
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 14:59:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4142A275103;
	Mon, 14 Apr 2025 14:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QhD5pzMN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF36258CF8;
	Mon, 14 Apr 2025 14:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744642690; cv=none; b=Nt3TSKHhsoqdFb8sn0iLvkjP2GucUnruPbHYhi6Qtz7DQTBA3HufFM+WrSK19xlTf2kae/q5a8e3u41qYinUZCzKLDiYf5Zk9zLW1lzPRNUER2z5qVrzpSc/Gxkutt7xFKHTjgiLuwo0xzeKeO3hQG9tQ3Gc76BTu/1dfmk/fvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744642690; c=relaxed/simple;
	bh=cP4l0NX/jd2hqGEiFr22WgQrdgK39j+nLbzps2UEjOw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YEPef4BouLuhHeJA8OzXPDWFOi++bwBPvqRiqgNOhumENZRgGG04HffRYf5vDKU2JPu2JuC3P0EvcZt9tp06YdZ3aYw9NSyYdHoA2oSlIFI1nA4l7AEmi+zVEL8MnFBWApFpRJoEgWPJ8sl7mI2qD1AINmeCTEdZH468grd+aw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QhD5pzMN; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39c1efc457bso2895571f8f.2;
        Mon, 14 Apr 2025 07:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744642687; x=1745247487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DGq8xiqXi81gFjKnbUkYxKmJhAAFdXbyWQx1OPU+kwc=;
        b=QhD5pzMNjk8NIGhOhAWfWr1togQ+4dbVP4KaZQUlFG/mz3AxEd7U7HxTDYDjUc28pu
         RxMatOi9ejRFZseWJkDBv3NV4PuNAwuoDKo8A/c8SCOB7KOxJds+YS0kzNo9xsH0b9xU
         Ikprbi16WHi6szspvfHPcsAfrocgPjd4HoubkHBJn5mRtjl3rdH4EHDaXjzvhzdvOY26
         iSZSHsM0UaW7SJrtmK0bR865P4rHTEIigdkh4Djsuys1uN6DnDi8HdB86vKNL+y2FRqD
         RuNifNXm93E4mBeSmN3PSJF9N3dx0X9V4POJtuwFggXwIA8gbjhUS2iInodZbe7fFAkm
         h88Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744642687; x=1745247487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DGq8xiqXi81gFjKnbUkYxKmJhAAFdXbyWQx1OPU+kwc=;
        b=gA4WVLeGWvmO1cult7NHgxJQBnYoTrgFSbNb4ztrQosZPXZ+KljSLFFUF/4f0XGoQe
         FFVw8QZAhG9ptfK812XatKBMTUaXlMoKXDHkkDwoas3hxRTY6cxQNSL9xDj36RGqdNyD
         eg0CjDQFpzCphM15K+qrM9Vesva6NOwwSVzyEQyBiXDdIs4nEguSTfw4vYB9f4IHDAOe
         /x3y9D7FuXTKeXPCfOlLX+IMHk3wL3x6zRebmXCIcfIXculZeF5O+tK6Zf5oE+SwotKi
         DYR2BSwSLntK7klN4Q5kzZtqwwoj/ftC15v69/xhF6aClEulKtx96SiZWxVNLqXQ79g4
         b8/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUj6K2wIlMl/tXKSeF4NVUNtTHEh2uFQtdP+3RLvEGqeAm3IqsqvqwLIuoT10IJY5A/qIHnn8aAVE9yMNKyJw507CM=@vger.kernel.org, AJvYcCVP3eglxfC5C+hO4Q9lfFsAeYUsiZh08DWYrysVgjeaPTOO4LQ9jyoHJ8kv6tUOgb+Crwuk6bP5CzNS@vger.kernel.org, AJvYcCWQslbzRawYZnU9J6ZXMsQZ2U2e/e0tYy00lBLRCtqg3Dt1hbHt5vnd+x3X2CTKF0t3iLhfCUhJ/Y6IOOMC@vger.kernel.org
X-Gm-Message-State: AOJu0YxP6U4QcpOEPuXscsBqS+F2wQce0Y0f0FR4jh72kDEqBXxO1oGj
	UgblZdvBaDiwkHMX0/CY7K59SRIfYzEM3mPR12kgOVyw23k5SJ6o
X-Gm-Gg: ASbGnctAkmv4ZxoZCFvFWWkBv4Yi/iekRX1YfGv1B7757cj7L8/41eDB0Or17cEqoeh
	3iMyN+RKsXBqjWwjqTqy5Ct9ItCOrCNM3DIunz66+0+YBkEOPxOV+odpmanwfCVoEqTwsTPsIzc
	1lYp4L7zs42HVem7ebrS5XPcPM4SAHRZeXRTniotvuHgBok5I1QLOh0CO11shSDLlf+ujMZLZqV
	CVnMlZcU6dgw1+KHandmgbqJ62p2X+eQuUkUDWdE6kqHQeo/DNnts/PGSO8w0tlrrer26yxnNKN
	2qPF5/j7jgz5BnvL+U5VByWSJ6QAwJekijYtbUK9StLXoXKE8rCDrmx5AS42FLjB
X-Google-Smtp-Source: AGHT+IG7PSvp9NkoMogYg0HCjjGWaWgg8x773MSh4hDMNsCBCViD2qh8zvbkUHFdVV7cqTSvgz9Yrg==
X-Received: by 2002:a05:6000:210b:b0:39e:cbc7:ad2c with SMTP id ffacd0b85a97d-39ecbc8a256mr5864365f8f.25.1744642686335;
        Mon, 14 Apr 2025 07:58:06 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:eb55:397c:6c6:e937])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96bdf9sm11067041f8f.22.2025.04.14.07.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 07:58:05 -0700 (PDT)
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
Subject: [PATCH 3/4] phy: renesas: phy-rcar-gen3-usb2: Sort compatible entries by SoC part number
Date: Mon, 14 Apr 2025 15:57:28 +0100
Message-ID: <20250414145729.343133-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250414145729.343133-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250414145729.343133-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reorder the compatible entries in `rcar_gen3_phy_usb2_match_table` to
maintain sorting based on SoC part numbers. Keep the entries ordered
numerically while ensuring the existing generic compatible strings
remain at the bottom.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 775f4f973a6c..10d1a89558be 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -606,14 +606,14 @@ static const struct of_device_id rcar_gen3_phy_usb2_match_table[] = {
 		.compatible = "renesas,usb2-phy-r8a77965",
 		.data = &rcar_gen3_phy_usb2_data,
 	},
-	{
-		.compatible = "renesas,rzg2l-usb2-phy",
-		.data = &rz_g2l_phy_usb2_data,
-	},
 	{
 		.compatible = "renesas,usb2-phy-r9a08g045",
 		.data = &rz_g3s_phy_usb2_data,
 	},
+	{
+		.compatible = "renesas,rzg2l-usb2-phy",
+		.data = &rz_g2l_phy_usb2_data,
+	},
 	{
 		.compatible = "renesas,rcar-gen3-usb2-phy",
 		.data = &rcar_gen3_phy_usb2_data,
-- 
2.49.0


