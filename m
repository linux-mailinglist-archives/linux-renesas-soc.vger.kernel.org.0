Return-Path: <linux-renesas-soc+bounces-8441-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AAA96276A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2024 14:41:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4BB301F25247
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2024 12:41:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF017176259;
	Wed, 28 Aug 2024 12:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TDXaMh/f"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFDE15FCE6;
	Wed, 28 Aug 2024 12:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724848911; cv=none; b=hNrXuTSn16GZMPpxcTMsOt57zj4wKNBTY0khOphRKk4ZkWrpC7gibK0uPjvEIzkmmz5/7qF1b6FM4Och99fFB0r+LhXnydcSpYdQE3up/GCNOapFVMt3TPzu7bi2ofcqnvKIs4UYq8VbMF0fM7Ese11457Jg1VGZYvv2MfTn8BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724848911; c=relaxed/simple;
	bh=t1NiamlGABMzAxM19Y4i5EveQXPVFxBgG/o3dhs1c+I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=D6YqPrF1v3WOzUb0CkeUolDVradWwjjJLLX9YrEyKHkhJgJOnIPASt5iMuTfqF1i1TgTg4AoTfl0IWJ32g1ERq4GNVk3GZf0WMRuAt/0UShhGD+ZD5rvh5FZjhEsBpU6GR8BV7QGp8nxmjPGVmb3pMUGVF1h/mgFwKGDGIQhung=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TDXaMh/f; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-37182eee02dso372305f8f.1;
        Wed, 28 Aug 2024 05:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724848908; x=1725453708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1nJQKSj2boxd2bhitatHFOsMZ6Pd19llfXmaDeWCeWg=;
        b=TDXaMh/fwcGT6JC3yCdr5nhPem3FVS9DzXmHwHkp/0n8OATi/Bt6ZqpkC6pKLliN8f
         IG/2bQgR6YmF6dGj3uCSRvPbiZYeZJlvJFjLZ2D92gqoi4lxzL7y6yMye683e6QzaZV7
         mToo1kgOA+t8CD1WpxhOCLbp+lP3Ct3fdcxzeuTK8+PMMXGKgO7Nwm5/eeZyVXCG8asE
         HIe0mTXmlLcaUjC6K3bC0zHV9EWoujbhTbHSoU1237JyE0nWz7AyW03skcqRgrf4KIut
         NSL+l7QRuzSpv93S9zZAu8Aq+fJ5yakjaaHsiP0IxFlBWmBB8APyXLKi2DRmT6qO68t+
         opFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724848908; x=1725453708;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1nJQKSj2boxd2bhitatHFOsMZ6Pd19llfXmaDeWCeWg=;
        b=ZzpxE9HPRJk5T9f4Y/Gpga3Ux6I1ysnjDAR8X9/pVSUjG5HFYRFlHsIGOa++MTcyc+
         n875kCF+8M8VSN/bZ7PZ9NrhFq2unEenm0CNy4PjFbEJqIpW9sPCw/syikyWKWdCkrRB
         R2r5FFnS76Xw04hev9FPGkGlEbj9728Iyjayk4MUliT0CDBWyDvUp+EBLOqqsOcyoCbu
         py5ANsKZ46TzrDiXioHONd64IY1hu6nhwCkPfJL2gg4wfsSAW6fL5SVTvgZnLxU0YVnT
         ckZSOOBJhHq5DL23R+wAsbOi7LPSqx+2PqxbSvFCCxxBSnJWlzOXajGCVDm4AN0O2kLf
         Ya1g==
X-Forwarded-Encrypted: i=1; AJvYcCV/NX9TbfKHLV36cpCuQHM6C+tLmYyezIQbpjZOEiJicXoKvfUfoWRkRkigvaHhVUIEBFNPMQR5YnyMOzhd@vger.kernel.org, AJvYcCX0POtMm9iRC/EawkYVEfyd6rI1heQpcT9sNZ595/88Fc/6YUx9xgiSwdng5PcVDwbZvxgn6xibzR0I@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/lcYWXCnhngHkgiTDbJR9/6LNJKTExmWmeH4woS4Er1im7cSV
	h/DH1B1oCIWwt7jxNxzGB8a5cinob8LH4O74MaXTkDqLSLM9NnKH
X-Google-Smtp-Source: AGHT+IGA/I/TVWZ/yg7sb1lN+72L1xB+lmHdJNYlngIBsYDJ2haoYP8QMs/RC/6ItkP5vvhO0JzM+w==
X-Received: by 2002:adf:f187:0:b0:371:8451:5a82 with SMTP id ffacd0b85a97d-37495f40fb5mr1337699f8f.15.1724848908062;
        Wed, 28 Aug 2024 05:41:48 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3730813c5edsm15508226f8f.31.2024.08.28.05.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 05:41:47 -0700 (PDT)
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
Subject: [PATCH v4 0/9] Add support for Renesas RZ/V2H(P) SoC and RZV2H-EVK platform
Date: Wed, 28 Aug 2024 13:41:25 +0100
Message-Id: <20240828124134.188864-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series aims to add initial support for Renesas RZ/V2H(P) SoC
and RZV2H-EVK platform. Support for below peripherals is enabled on
RZ/V2H EVK platform:
- RIIC
- OSTM
- SDHI
- WDT

Complete bootlog:
- https://pastebin.com/01YLBmuF

Note,
- Patch 1/9 is from series [0], patch 2/2 from series [0]
  is no longer required so dropped it.

- patch #4, #5 and #6 depends on
  [1] https://patchwork.kernel.org/project/linux-renesas-soc/cover/20240828093822.162855-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

- patch #7 and #9 depends on
  [1] https://patchwork.kernel.org/project/linux-renesas-soc/cover/20240828093822.162855-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
  [2] https://patchwork.kernel.org/project/linux-renesas-soc/cover/20240806210623.183842-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

[0] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20240724094707.569596-2-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (9):
  dt-bindings: soc: renesas: Document RZ/V2H EVK board
  arm64: dts: renesas: Add initial SoC DTSI for RZ/V2H(P) SoC
  arm64: dts: renesas: Add initial DTS for RZ/V2H EVK board
  arm64: dts: renesas: r9a09g057: Add OSTM0-OSTM7 nodes
  arm64: dts: renesas: r9a09g057: Add RIIC0-RIIC8 nodes
  arm64: dts: renesas: r9a09g057: Add SDHI0-SDHI2 nodes
  arm64: dts: renesas: r9a09g057: Add WDT0-WDT3 nodes
  arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable OSTM, I2C, and
    SDHI
  arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable watchdog

 .../bindings/soc/renesas/renesas.yaml         |   2 +
 arch/arm64/boot/dts/renesas/Makefile          |   2 +
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi    | 523 ++++++++++++++++++
 .../dts/renesas/r9a09g057h44-rzv2h-evk.dts    | 256 +++++++++
 4 files changed, 783 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g057.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts

-- 
2.34.1


