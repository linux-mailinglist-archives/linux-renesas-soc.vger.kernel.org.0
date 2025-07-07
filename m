Return-Path: <linux-renesas-soc+bounces-19335-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DFAAFB778
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 17:35:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5786F188B11F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 15:36:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01E8C1D63F5;
	Mon,  7 Jul 2025 15:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UGdxUQnG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B41620ED;
	Mon,  7 Jul 2025 15:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751902542; cv=none; b=TBrFz8S6IHkSQnYlHzWAhlN4NsYtRDNwXe/zD2c0Lf33VpuLLrfLqn9o+z5ALunx41RTNgrqfBwd8eQEZG9X37NIj23oQj8TYL870RtFYMQx6URpXJQWPj5eSzRbxy7ZNKjvoZCiujmS2w4MlP7dSu8j34/oF52hWacBbK6j+Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751902542; c=relaxed/simple;
	bh=vBqumU6AcgZetCzx9bcBC6ZSgqVUb0TZazDGOZ7pjo4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LdsP3UkaqD9nFG7U18UXvJY+202ZQge20ristjmcGVo/AgLTsVSCB2KIFlZW58VrfrZ8WTANUbW/z1xYkSKa/mCbCCLEoOxxIitN4r/iw0bmbuJEDJVLiY5i3df20JyX/KIFVenKZn+rEwUHurqQ5xwoYUvopMEpvSp5CnnabWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UGdxUQnG; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a588da60dfso2184871f8f.1;
        Mon, 07 Jul 2025 08:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751902539; x=1752507339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iPd+HvIh5yPcSKTWaOH+VesDI8I4Gkfjp9MPpJrp42U=;
        b=UGdxUQnG5xFCi8UXHzfFg4ty59Rlydjn4GgNBHcMIhAt7Fnz3c5MtBwqgROpSPeUND
         mIHKHaAYmr+6+KOzMRx6D91Nn0PPMYT9bIsDTTRt0gKco/1DSGT7d8afe3+qc8Q/eR4r
         iYLOfzTeQ3g6CFO9GYFXKRmqfBUQkT6S3iL4CRIus7HFcvt9uZdYi5sd8g+WxOFwlHBz
         uWTv1Ja6GwszAyv6Zls6XrjrW8oGgByS37+VW5D9MUzanmghQNfxPd7a9lfPY44op1V8
         Fb0tucsJ01vqFggS2pbCDto9UDY8V1D4nr05KR+ViXweufmDbt5GpZdQ8Wp5PBpjypSR
         ORMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751902539; x=1752507339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iPd+HvIh5yPcSKTWaOH+VesDI8I4Gkfjp9MPpJrp42U=;
        b=vOs78jT2Uphu0+UPf/UuytO6QY8BY8HBZBVhkAG/opuHvttt9cXPsYkVeKBBEqA1V6
         31VLDTDvgnxyMH+avYw0LtN8PC4PsxAdZF0SxSptlaqV3qFIzUXOx2UeS8RWDlfBSuJu
         zHxhjScQvlXBKRwA1NR4nQY1JdP3dQh+3W5lVZVm2XO7NpINz5GXNW+9VtJM5w2CCFEv
         sPOsCNWLfbB9u3uAFxLJ+wEDu9vp6gmYb9FohyB4/SfTOaNZBeRnqPtXTENs7g3E5Osm
         FyMJHQFnaXn76T4IgpLoAFvsVwYXSaWFb/qFMKMI+rI0zrwl/LUH2sMxO6gpI9hNYilG
         feeg==
X-Forwarded-Encrypted: i=1; AJvYcCWVQtxYF4JSoSP+wJi8rAesmEPXSAfJXznz2Kx3ONNqOBlItLHWoBIrQJ0e05yKXNBnwBg78S3tYi1E@vger.kernel.org, AJvYcCWa6tYObn7tZ3p6hlWozfbIAiD1z9dt0go+YwPemgYr3G47W7EjE8afwtCwsgcaq5pHZVqJCu1zpB565WCF@vger.kernel.org
X-Gm-Message-State: AOJu0YzjfcOLDfFmE2jmHngmRwubJy0QqHk65CaQgRim1x1rPurc714F
	6gwKETSMzr2dB4UEtiS+R7X2e4219l/m8HPTIjM0eDV/uQM/xD/1i+yI
X-Gm-Gg: ASbGncsjjKsdPnU4flGA6T36X1Vg2Vtl6ro/xTMrwgoNA5fkDXpA0DXfnJyCwxdAXTd
	DqGzKcxMOiQYhrXmQK1dwyYOVZS6wnZSz5BS90Opfyoja1brrWmqUBz2mBfSxIWCP6YTTQgxQQG
	v6AmWG8IbbQjQuavtOvDbvS4OgTygMd60rYZRBBQgpTnG3q4bYO6R54e8TntQLs2ZsELDg61Z8q
	e+/OWts1HzCi+VGxYdLR9w6Tpng4lEoTnjS1azSwqdXsQQvoIgFhHBgV96rVmSLzZP4MzhLx0Vq
	VtePRlIlUDLL0SULy5FO2Nzr98PJedYl/5j/vReXvAs/SonvTNNJLr/Cw3pHZmEsc6AU7tCe+Xg
	x4R6hblzP+cLxQ58zWKE=
X-Google-Smtp-Source: AGHT+IG+mvUVGsKhXBMzbws54AiFWZ4xUyfLxfm+y4sFmbyj0//QiEmqR0H7X5EscC1OHKN7XwCyLg==
X-Received: by 2002:a5d:5f55:0:b0:3a4:f52d:8b05 with SMTP id ffacd0b85a97d-3b4964df03fmr12394223f8f.35.1751902539151;
        Mon, 07 Jul 2025 08:35:39 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:d418:e5eb:1bc:30dd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b161e8fcsm119491735e9.7.2025.07.07.08.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 08:35:38 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/4] arm64: dts: renesas: Add I2C and SDHI nodes for RZ/T2H and RZ/N2H SoCs
Date: Mon,  7 Jul 2025 16:35:29 +0100
Message-ID: <20250707153533.287832-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series adds I2C and SDHI nodes for the Renesas RZ/T2H
(R9A09G077) and RZ/N2H (R9A09G087) SoCs. The I2C/SDHI nodes are added
to the respective SoC DTSI files.

SDHI/I2C DT binding patches are already merged in the -next tree:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20250704&id=b93d8b1cab299bc76f574f9e3cb8aafcfafc0037
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20250704&id=ac54e31a205346899ef5646d0456b97179901070

v1->v2:
- Fixed W=1 warnings in the device tree files.
- Fixed clock for i2c2.
- Added "Reviewed-by" tag for patches 2/4 and 3/4.
- Dropped led enabling patches as it depends on the pinctrl driver
  changes which are not yet merged.

Cheers,
Prabhakar

Lad Prabhakar (4):
  arm64: dts: renesas: r9a09g077: Add I2C controller nodes
  arm64: dts: renesas: r9a09g087: Add I2C controller nodes
  arm64: dts: renesas: r9a09g077: Add SDHI nodes
  arm64: dts: renesas: r9a09g087: Add SDHI nodes

 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 85 ++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 85 ++++++++++++++++++++++
 2 files changed, 170 insertions(+)

-- 
2.49.0


