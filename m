Return-Path: <linux-renesas-soc+bounces-13950-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2F8A4DB41
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Mar 2025 11:48:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BF6567A25AC
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Mar 2025 10:47:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 244951FCCE4;
	Tue,  4 Mar 2025 10:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="c8zaq5o0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4153F1FC0F0
	for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Mar 2025 10:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741085314; cv=none; b=aB5CLPd9b6HalDVcf3xN8vhkAgPezq6OzEUaozDGdbDY+04ru7l2ciChd22KFPNcsajhVf3FXN7pHKYxRg2bk7LNcnEKtqrIowsehaDtOWrolbNGXcz7oCtJT4S5ivuVWDNc5BcCiq4putrR/NmuC8a75ba4/nOzC1CYNNEOy/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741085314; c=relaxed/simple;
	bh=xkWdbiE5pDA61A/wnO9/ukqrTGMw8FiyU8xHAw9+pqU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jOuVgpyfj2uiuljd+zSL+NRMoL/B1gzxXRTeL1ZAqYTwuUTZWoXtT+6sR1SX5+JtCNt9DOjYQbEEtePEYLlqpCho1WXiaply3UonhhloSaNmVwc+aFEz2GQW+YFeSwN22RXf0IAie7+I5JgXRt60j5yrZDbpkdFrpDSIVcnegNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=c8zaq5o0; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-390f5f48eafso1685983f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 04 Mar 2025 02:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1741085310; x=1741690110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9XPB1HGwlRjHpgwyLpPMHl+9QLJ8Tbr4jECS3aE3w44=;
        b=c8zaq5o0GWmARYH+vGwIpqIf3n/TAeygB8v/v1ddG441JtsE5nQ9EKOK852iDO+rEr
         2gm4M3eUjD6WalkjaUIUbKOiArF7aC3lCOzFvikwWQwROffuI6yrhL2ZRo8AyryM9UEI
         Xf5oy/XTDwVK9mNtJwkXMaXMBLof7RKr144xqvBEfM9QrUdjr6ZHFhJ2mhSK+krotjjg
         gzVBXmrN71922E88ahSHBz3DT1bq6RmFPr/VI2GaToMCL5ujOP+nwVZH3AEcqqdNMLj5
         jjiP8kggZMc9SQUgq6j621rDM3HllJG7AQ2Oxcz4rkxcW83pwTnvfc5YZGzbf7siPJ5P
         Gx8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741085310; x=1741690110;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9XPB1HGwlRjHpgwyLpPMHl+9QLJ8Tbr4jECS3aE3w44=;
        b=Cv3mDEIbWYZ4kxy7jrjSguUiJmzEDCTmRMDm9UsiHDvj9HFtnx7JsC35/+Ng+zPatx
         YDeQYoaex/q262bResVG5zjVqsuqzBfiX7Bjhrfr1VUCkJMc1tf5FHbtgk899UmeSDuA
         p9HzhLaCGImBTvEsttMf2WF1v/sOs2BimCqfja2twUxw7VmR9mn1LZqjYZ05Jc1Qz1vA
         x12BreoVysW5DyuZeaQTui0S4+xS2DYL2GVelyPs2cpg9vvwSZzYq6/GZtuIOLqLLaGN
         009SZWvE9OkEmDMAHj562Ccq0riAtpT4yYQtZf3wQdIArx4iWxGfDO8Viq005RncfGe5
         Bbzw==
X-Forwarded-Encrypted: i=1; AJvYcCXdyaVl1/JMunIcfnXAYg8yrkYdW57191ioA9L26Z4/KvuVgaoh9GvqdeYdvuqK1GucVASR5Vf36PggLbuAALW8rg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+x43ir1o8VKnFegc5A1+8NNnDu9xPpS9/p2D9eIsquV0dXIrL
	nbZPrYvELzjqPrDHHOWjKfQbLLdkSfE9ssJPH0RWCR/LKuwH4pQ8i6R2S/LABY8=
X-Gm-Gg: ASbGnct95j/gSLejwEBM50sZdWoZH1VOZ0C1xQsVHyjgv07wSGMPFXoQfm69bBwTLxR
	7ivv9+POz6+M+Fu+fI1x+ioCZATW/J30k8rV7Le+gI019jsj2xLQsTystcxcf2Z+rvHeIoMS2Aw
	hXdp7s4g1tpXXdUlQo2PoUd2qD4+4zluBmogVVRW64nAKE6zhImwCprJL6VQw84L31dhIbA6UzI
	2J6ymGV84nOPbksrc7SwIvw7dVXJs2gOqNpnjI+On4d3C/XDfy+TEQjJAi6OS3Tf3P3AWfJ2HQB
	2wDgFXkrlNtQPyUABXjInsEd4Lf7/C4r7S3we0ZcpySan9n+79o8map+nqp/iKC2WpRHi8omA3I
	=
X-Google-Smtp-Source: AGHT+IFVrf0sQSW1RaHIuqMe1zsgZYOxQjalOSZJpBfpyvJNxn0RgZcyjbBC1AuujFsNmEiAisqIpA==
X-Received: by 2002:a5d:5f93:0:b0:38f:23f4:2d7a with SMTP id ffacd0b85a97d-390eca070a7mr13797386f8f.40.1741085310559;
        Tue, 04 Mar 2025 02:48:30 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4844a38sm17445161f8f.75.2025.03.04.02.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 02:48:30 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: yoshihiro.shimoda.uh@renesas.com,
	vkoul@kernel.org,
	kishon@kernel.org,
	horms+renesas@verge.net.au,
	fabrizio.castro.jz@renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 0/5] phy: renesas: rcar-gen3-usb2: Fixes for Renesas RZ/G3S
Date: Tue,  4 Mar 2025 12:48:21 +0200
Message-ID: <20250304104826.4173394-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

Series add fixes for the Renesas USB2 PHY driver identified while
working on the Renesas RZ/G3S USB support. These changes are
needed for the upcomming RZ/G3S USB support (especially for the
power management support).

Series (with [1] on top) was tested on Renesas RZ/G3S with consecutive
unbind/bind and data transfer tests before/after the unbind/bind.

The unbind/bind was also tested on the devices with the following
device trees but w/o checking the data transfer (as I only had
remote access w/o USB devices connected):
- r8a7742-iwg21d-q7.dts
- r8a7743-iwg20d-q7.dts
- r8a7744-iwg20d-q7.dts
- r8a7745-iwg22d-sodimm.dts
- r8a77470-iwg23s-sbc.dts
- r8a774a1-hihope-rzg2m-ex.dts
- r8a774b1-hihope-rzg2n-ex.dts
- r8a774e1-hihope-rzg2h-ex.dts
- r9a07g043u11-smarc.dts
- r9a07g044c2-smarc.dts
- r9a07g044l2-smarc.dts
- r9a07g054l2-smarc.dts
- r9a07g043f01-smarc.dts

Thank you,
Claudiu Beznea

Changes in v3:
- collected tags
- improve the validation on the code that requests the
  optional IRQ as suggested in the review process

Changes in v2:
- dropped RFT
- collected tags
- fixed checkpatch.pl warnings

[1] https://lore.kernel.org/all/20250219161239.1751756-1-claudiu.beznea.uj@bp.renesas.com/

Claudiu Beznea (5):
  phy: renesas: rcar-gen3-usb2: Fix role detection on unbind/bind
  phy: renesas: rcar-gen3-usb2: Move IRQ request in probe
  phy: renesas: rcar-gen3-usb2: Lock around hardware registers and
    driver data
  phy: renesas: rcar-gen3-usb2: Assert PLL reset on PHY power off
  phy: renesas: rcar-gen3-usb2: Set timing registers only once

 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 135 +++++++++++++----------
 1 file changed, 75 insertions(+), 60 deletions(-)

-- 
2.43.0


