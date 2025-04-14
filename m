Return-Path: <linux-renesas-soc+bounces-15922-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCB9A88633
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 17:03:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B41E176F08
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 14:59:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69BEA252294;
	Mon, 14 Apr 2025 14:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RZWNkHsp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB8760DCF;
	Mon, 14 Apr 2025 14:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744642687; cv=none; b=Sk01je0452utfRyRlnXo8yh4xSSfs6EOIJNw73FC5vNxHYzTDQdf8gCeDTMgdwjT1/G5V7c2fBSuL+0LMftpJZQwGrFVPRBNSoPpKLIN2AtG+d2SzUX/qXCUvLTmBXeGbTouQEbqt5QsM0ogq2jgK8FtSZ/0u/vX+DAaZ82p4mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744642687; c=relaxed/simple;
	bh=8MmHBd8wz/TyzpcGxo23yEMNUS7HTINXGTVS9whTgrA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LtTmYpxZn3BwXWBwA3qPZLryZbJG5tkTavA8LrHuyM/y/qNy+MaqjOm71tK/CyYdSJOQelKYTtkEmWTOJbc28to8AY9v1BZFlGk4dwln5DL7Ta27tUNXGvw/Vpei/Dv9I3FDEae6ecqRvOtnGtHlwTa2GXkxFMq87Sgx86QAKWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RZWNkHsp; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39c0dfba946so3194856f8f.3;
        Mon, 14 Apr 2025 07:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744642684; x=1745247484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9GuDr3OODxOaS6eMA/BRTIN4gXbmYJXN0wNkkvy4ipY=;
        b=RZWNkHspQBUYr8nn1pD26zmlsbVm4CtajyFRDyi/aPzpMZuCOZA+QKU6Qvm11WybWc
         SYiP0En6187xBnPCMo5bR0sVw6teFGNA9yFFICHOkGz3Yk62W2D0CAN1xuganQ1DAvZ3
         /xVeM972PNuA7tBELu5PBPGpITIhFUaW9RaUEoOz5KGVT81Lm4kw5JEk/jhSBjOHt7CR
         06onJroizLFRsixMc1DCsIeEdV8u3Z1/MAjK9OCGq2jI62jCz0rSmHnWFgZCCMGcuAfb
         X541SswKB1dZ2lMCObhmlMDqz0Wctz56iiOw/r8Pyi+Sm5QKbEs9/8BOka6MI9QVONMc
         UJLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744642684; x=1745247484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9GuDr3OODxOaS6eMA/BRTIN4gXbmYJXN0wNkkvy4ipY=;
        b=w3Cofq6PDDNXJ+eZJfmzn5rGCxUQn0vxlGQwWLLVhal3fLZYPVC/EXJ4/k1osY1ekT
         4AhwJbQd2S1Zt6+rym8TGRK7fpUFVPPa7sVamD/bYUNhdYA3xYwq6/SKu+5WNDk9f80O
         ml34d1FUQ33kYZU5ATge0rNJ5dlL1HPMu1yArev/0LMK8xBLCTc4KT0mffqwRPUHNqtk
         TcFic3qexw72UXeJP76JSEX6qEBi6ZSnWPiYOnPuVhTba69B+4a9k0/r4Zrc2hz+ZHAH
         g9Kflun7IJgM4dsiu03MCaTlA1Mbc3XzibWIzGuwLOCfmX+tEhxV5TdM1Ic1JbZXM3W1
         D+eQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQjUHOT862wbGsV/H2eJukujjM9EJPWQaGPf3fu6kQfyuC844YCxgOwVXjaRlOykMVvs/VMCFh785BZv8d@vger.kernel.org, AJvYcCWIy4ynMu8JQTk2MS/p5ihoQ6Ej81gYEhxKAWEdcMUcxkh2oOXhSpmMLqNfeR+7CYHmvpoOzs2ApyYSP83OFXnfsMQ=@vger.kernel.org, AJvYcCXJCrBV6Yrlqo68wLCtiKkufRnU7U9eVFNSCaNZ2XIXHVjdHKSTBS6IiFAba0s5wZnZt2cTxlQyf+o0@vger.kernel.org
X-Gm-Message-State: AOJu0Yy49Ye5P2+G6TES7y4DLtC8zzplrkNQ4oaa3b8IozjVmOaqRRAi
	mSjp9Dl2k/sQTtkrEuC1ZNs71bOSw0L2MG8eHQPqeF9zh+sAIP6V
X-Gm-Gg: ASbGncviMPJeQ8rkzOoSLuEEaZHUAUiFHf+HVYMJ7VQ9WpxyqKTt4f1vZTkMljwo0cE
	QBf04wqTGRGZ7Uu9LsTrGR7mTVW4mTnD4FHAaTh2ZwBWREgLrICOEZ+IW9mVHteM3EEtnOheJKh
	o70anYIhXWd4U8Dy22ttVLBuo5T3iYWWSX/YlZrN8owuSI3brJwVZEfG6SwSuv8QdRx4Me7vmRB
	0E51O/0Et6bCG+oTROZK0WVx6CfiP557Veb3RidocIko3tpZ4hhifyeVDM95GdWLDGD/2CSSb5T
	8NFGzP8vqyB06hPKy1evyideS5sRUYpo26eCRx9cniunqIDAWT3T4fXEInRv3VHiuO2OFr/v+CQ
	=
X-Google-Smtp-Source: AGHT+IGWCwKIq/nNeRQ2UTY6+IOOM2Pu2ytEms5QgF0NEmsOrc8nzRtVMUhcJboDBExAT/971oRTtw==
X-Received: by 2002:a05:6000:220d:b0:39c:e0e:b27a with SMTP id ffacd0b85a97d-39ea5201aefmr10245762f8f.23.1744642683517;
        Mon, 14 Apr 2025 07:58:03 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:eb55:397c:6c6:e937])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96bdf9sm11067041f8f.22.2025.04.14.07.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 07:58:03 -0700 (PDT)
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
Subject: [PATCH 0/4] Add USB2.0 PHY support for RZ/V2H(P) SoC
Date: Mon, 14 Apr 2025 15:57:25 +0100
Message-ID: <20250414145729.343133-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

This patch series introduces support for the USB2.0 PHY on the
Renesas RZ/V2H(P) SoC. It includes updates to the device tree
bindings and driver implementation.

Best regards,  
Prabhakar  

Lad Prabhakar (4):
  dt-bindings: phy: renesas,usb2-phy: Add clock constraint for RZ/G2L
    family
  dt-bindings: phy: renesas,usb2-phy: Document RZ/V2H(P) SoC
  phy: renesas: phy-rcar-gen3-usb2: Sort compatible entries by SoC part
    number
  phy: renesas: phy-rcar-gen3-usb2: Add USB2.0 PHY support for RZ/V2H(P)

 .../bindings/phy/renesas,usb2-phy.yaml        |  8 +++-
 drivers/phy/renesas/phy-rcar-gen3-usb2.c      | 38 +++++++++++++++++--
 2 files changed, 41 insertions(+), 5 deletions(-)

-- 
2.49.0


