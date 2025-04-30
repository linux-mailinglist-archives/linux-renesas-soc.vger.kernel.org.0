Return-Path: <linux-renesas-soc+bounces-16539-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D366AA55C8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Apr 2025 22:42:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D89674C01E6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Apr 2025 20:42:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 671452D0AB2;
	Wed, 30 Apr 2025 20:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AGPuQrzt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779952C2ACE;
	Wed, 30 Apr 2025 20:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746045686; cv=none; b=U8hibufiY0nsz4dXdUDAcc1lGzirfXeuSOIzTgTANcYBJ4aygGqtu01P8HVgMXyvuw0Inp3LGATxHAdq4as+qllW/0D4GL9t3cOCp7EoVyEFXO6/e/crFLrJ2k75brWaHqSelOoPXw7SOtd+K7SidWaBbxuvNXYnzFOunSS7aus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746045686; c=relaxed/simple;
	bh=7gmW44bD7h7zUhjFwYkroXCgvjm9X9Rr/PvCicnjZ9c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r6ySFTnM5+JautN1ch3HWfeI/SRHUp0XSEt6EKJlnP93ngRd0s/bOHoejM5+S0sCi8Iu+wtHtPBZQsbCI9JmXyY10JIgeLlAIMf3uUEsEzRa2JHznKq6R6GtBN9GX9XuX4zww1KNOegfdcDT1+s3pfq2YuqYJEoL5132XBaLX/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AGPuQrzt; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43ed8d32a95so2225155e9.3;
        Wed, 30 Apr 2025 13:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746045683; x=1746650483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZMYwFd61jeM/AnC60Zap8f4r2F5Tqp87rmWVrFS3Wvk=;
        b=AGPuQrztxwoatQh03ZULYucvPKxLosmlBRJPY7eFPv2H75yxkDoikj1tp1j18AOUd+
         LWBYnouhINuo8VGMwyyRoBNiX6ttIXYvq4Q1sI8zNb2nSeYmYymGFfzIILPaJl0GZI2q
         DZal6Vi655JgmtAd9D64inTybW/+2nn/dp0GkRC5Ch9l2YbQcmYJ3alqw4NCj8qrQONL
         lzzD/tJYJq0oN7PBVFP+5woWfgP8f5xufhqBFAgqjPcEXuPjczAJhzDFow9JabIWboII
         eEx9DknVBMkfH8I4FDyTNTVfFFDRKGnTcoNg8WjD6ekoiJZM+WuBsNdQ27iBkGuwrKWH
         UqrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746045683; x=1746650483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZMYwFd61jeM/AnC60Zap8f4r2F5Tqp87rmWVrFS3Wvk=;
        b=DZrFD0jV1cFIwxHeFKtiUsQkT3okRP2CfQzhHC10fZi3Gj1i43erDt9dUEj9FJuXon
         cXbpEDzwzbZzaEFbXOAU0Ap+xXMR1aCzJ+FQynT/kq+Hqs73/ysUnzSaqg0/0bPyVZhB
         gkXSpHuBFVbv+97lVcO20a2eiAe9KGbBgGRlZPNiJBvj4bkiRgDgjKtg84QJ7eYI7s/W
         5p1iDp3Jg5ZwTs35ZH++hr7TpbTWeG8sXI/0VWz50XMSIvISGiEWnyEZA1AfP3B3P2BO
         40WYLlbNA7Pm+VBN+r8gnyJTpjUoQNvQIhGvGx8jXxnhFmg1Hn09iNer+QB92BEyRRm1
         bFqA==
X-Forwarded-Encrypted: i=1; AJvYcCUXazEdMjynS+WmsC+geWHUeAOdr4ajEcpp6njJDrxuZN+kBpQzv+sqxzZcvQnNHtrFhi8dxnHFZ9Z48X46@vger.kernel.org, AJvYcCUlzAZ20oxjxd5pOv7N4RvKVnXFvbrMVFU0nnq0VpNZy3q0jfHdxECL/N54nCTlpueleQT8Adl1WIWHMn0gGFPU6Ts=@vger.kernel.org, AJvYcCVM0pzrhWN6fQknXGTWI4z5PbO3mlHd2/5Rp/zbLOAmBW+Lpc+kgi9t9YZekQFea8zjC+JvCFi3IzVt@vger.kernel.org, AJvYcCWhCHq+4WKXcz2yYu50gpN4SMQKm2XxVw9Jk10Na7ELFvNkWMRCh91sB6DECmgBTVcEAvVLXVWmKiZ3@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3jukBDexMAeWrPOC5vMcBbGVPqpRMHlMOvY03oVLEir47Vlc1
	LXUObb7QOodRUZ1nOYOWK3yDP8dIZ/aWJhDcsS+IOR8FNWEBFU/v
X-Gm-Gg: ASbGnctuTfAsPqCWakHqfWvpr1MS7VxiaZtBo3ji5GJrjT4sfpOjWlrAeqSuUejNPwF
	MBFPwqJ4x6w5/c+I76BVrvNhmVM/PTgp415uYNAD73hAsgJFgp/ZkEIkUKzecQrU9YWCC9uNrmW
	hw5n0USBGFYsyTwVgfwfJDhB6AZEULrIHA62a0uVwkAv6WgLPVK6SPaLGYWnxSEMAZ/OpAlgjpm
	CcPYjEN8cqExuL8I+ePfXq06koIPi6wrxlswKci4NaIodbL8fYAunOJ1YFaSE+B/PFwctaXuNQg
	PETxRcoQebCL4sZUFqxirgrXrX+i08IA8mTcPdKKatM4nZNJyefMD9hUBzWOrcJVx/AoNz3XX29
	l0156EbjXxA==
X-Google-Smtp-Source: AGHT+IG1s0JflHsvw7aoodVtDTDPq8eFL7Snt93pxGgKfMKfGwBj3pCsYKVbW91T/9KWyRPQ+tNe/g==
X-Received: by 2002:a5d:5f92:0:b0:39e:cbe0:4f3c with SMTP id ffacd0b85a97d-3a08f799858mr3861267f8f.8.1746045682804;
        Wed, 30 Apr 2025 13:41:22 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:c5ac:bf15:f358:81a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca56d5sm18098132f8f.32.2025.04.30.13.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 13:41:22 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 05/15] drm: renesas: rz-du: Add support for RZ/V2H(P) SoC
Date: Wed, 30 Apr 2025 21:41:02 +0100
Message-ID: <20250430204112.342123-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430204112.342123-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250430204112.342123-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The LCD controller (LCDC) on the RZ/V2H(P) SoC is composed of Frame
Compression Processor (FCPVD), Video Signal Processor (VSPD), and
Display Unit (DU).

There is one LCDC unit available on the RZ/V2H(P) SoC which is connected
to the DSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3->v4:
- No changes

v2->v3:
- No changes

v1->v2:
- Added enum for RZ/V2H as suggested by Krzysztof as the list
  will grow in the future (while adding RZ/G3E SoC).
- Added Reviewed-by tag from Krzysztof.
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
index 5e40f0c1e7b0..e1aa6a719529 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
@@ -50,9 +50,20 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a07g044_info = {
 	}
 };
 
+static const struct rzg2l_du_device_info rzg2l_du_r9a09g057_info = {
+	.channels_mask = BIT(0),
+	.routes = {
+		[RZG2L_DU_OUTPUT_DSI0] = {
+			.possible_outputs = BIT(0),
+			.port = 0,
+		},
+	},
+};
+
 static const struct of_device_id rzg2l_du_of_table[] = {
 	{ .compatible = "renesas,r9a07g043u-du", .data = &rzg2l_du_r9a07g043u_info },
 	{ .compatible = "renesas,r9a07g044-du", .data = &rzg2l_du_r9a07g044_info },
+	{ .compatible = "renesas,r9a09g057-du", .data = &rzg2l_du_r9a09g057_info },
 	{ /* sentinel */ }
 };
 
-- 
2.49.0


