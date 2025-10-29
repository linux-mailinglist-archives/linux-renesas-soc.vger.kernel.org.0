Return-Path: <linux-renesas-soc+bounces-23829-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 986C5C19277
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 09:47:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48E041C81C8E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 08:41:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2948A318131;
	Wed, 29 Oct 2025 08:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fc1b2abA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33236313265
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 08:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761727243; cv=none; b=fMiwxq4QyjZXR5KUef6AJr5Vnq+U/u/FreUhVIdKXrnvRrvfNzN6BGmT6DaF0jx5TZ6XVai0F77gpoVKAkqTKL5wRAmUIR+j8B53/q5JnFhChsn1a8yFRj4JZNm7sTn/TDLCGngPKfZswqkg1t/+UW2luKJSDVQhHR/n+2tjT0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761727243; c=relaxed/simple;
	bh=ByNPBZVkQaRvvDMo6YDk7cXzzfRGMjEtnqu+EzYfgyw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nlhOPkkxtzmmMXhIVQ0oclupzT0Qc76yDxibY3sE8wZtoca29xz3X9w80SM/nRGGN8QnbEBkICoYsPNAhu6BDSXYaluoMSonxQCiiAQulgSsJ7NmICftyr+WTEr50Lya3KPSWUAjIbloznjdiQJcC2RBnhN7gWXE3MwpJIVifxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fc1b2abA; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47721293fd3so1991355e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 01:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761727239; x=1762332039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BWxjeRjOEhcNVgfP/QkxqsBAhufcjSTlJ37Z8hpahuU=;
        b=fc1b2abACXsGrYVYbOoRbk1aU9GwCAixenwSUb+70ZEoEYVI2UMcVw5og8SrRI0hWm
         plD5ndoxhZictdq0i0DZIF1V01lDGUBRxVuv9sRjJueikVmP/R8uIX/8HfoyX6OkpYyU
         QZbBksKXPNNsMHtzS0TeoBWBAbzdP9ZuExuT1QNinz08ElqYYqLvKyGSPeZdoawBwNAl
         mYP7LgpEaFLgXEXvo2p+vMr0HAkm38ncqI6CdNVYO1n761/olzxn92pRlPrAJCfyz7UK
         ARGQKzkJrHWfY9E/ABBd5sYbiW+xtvI4G6rLF4bhvdiGTgB0/NCaPzlz7y0bjBls+MsU
         Ki3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761727239; x=1762332039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BWxjeRjOEhcNVgfP/QkxqsBAhufcjSTlJ37Z8hpahuU=;
        b=Avzygay5SAuU/2vhp/nWaxNma/f4PI4/fPZ2kQVhFlF7zgQdyqRqMQENRk4Csm2xV2
         kICz/qeZhPk1u7gurAc8L9bzOnvAuuUWVnbZhbu4m0DQUM2z8XmOsu3nymWQKmUFjyDs
         t/OkDppXVqGaNvICfxqnVjgDTQUes82dgFFUyo+o65XfMUZ9SOTneiwuS91tLe3MH6y4
         a7XfxQ68tSGd3ZqYhviOPYj5Hwuq3T+5qhvhzJtomgEKKDW/xWAZ8MhlFU2rpKnIQwn7
         0fqAS51r6KeaylEqBFHO22n9PtwPi+5Y5sfJIhJoGb7oESLwFL1u/rSD0Ke2QKcEEjzZ
         TiWg==
X-Forwarded-Encrypted: i=1; AJvYcCX1FCg3Cc0zqfdj+MvUVrvfUWHNshAUZzFMK0d2Iiil3KI31fXZPUZ19Z/89nEDxFdXo+7a0Tb0PIRDXn96lsGslA==@vger.kernel.org
X-Gm-Message-State: AOJu0YykRB44sbpM/mHcf+AsVcOb1wfgagcvU9Uh9smMCKOQPNmgc71l
	gAzxXVX3oFgqr/Hw6Q4FatCOvQ9BPXhZTbUnuCq8zr/AYl+ZH1YbXYJD
X-Gm-Gg: ASbGnctaDDJ/yJbpkK96o09dSUvnQSOqAm0xSrpDSdE2TDb527OVEk/uWQLtdi5sVwZ
	MFphdkupSrhHEfui1HS/w9hqeokJjYFVg0qV16O5eRsRY/mtkq2qWfTaVaHpRwa54B6iPK1crGg
	c0jUeXOOdFigq5q4u7klaAEslqaCkg4eOJeHkVms6UXOYcYJcccGnPn8xIMwqdX3SaChaFiwoWu
	AfRVtxP3zx7mmh4Fuy/c4c8dgWXKLQSyhVz865JGJEuNYBtdzXLqNMl31nPJrK/7cgNuMig6yNN
	UD8ZXYtEGrrCDbZF21y6bcf+E8831Z/5xJU/a5Cn6wLJJpkKpXL14JJjxsmjY6GEaUeU1KlSaek
	aJv+NbxYpoed2oClJ4oYtE3gM4C/+TqqQwl2VIW1Qs39Yt+vcbXzYlG13FyIgDTvdJjUjZ2+VbM
	UmHBoXTZqvn80676bJozQrjHfSFI/NumQr3YbfY8T9VARMw6d/ZfOaxIGoZ1KT
X-Google-Smtp-Source: AGHT+IHzDG9SBUzGPViM4O6XUORkMfXDOjYXSdJLjQD/Nfqn6/OKgCqHeLDZcWlwFIAoLgO8gs3hzQ==
X-Received: by 2002:a05:600c:4450:b0:46f:b42e:e38f with SMTP id 5b1f17b1804b1-4771e6a188bmr20563075e9.19.1761727239422;
        Wed, 29 Oct 2025 01:40:39 -0700 (PDT)
Received: from biju.lan (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771e3a88fdsm39485785e9.10.2025.10.29.01.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 01:40:39 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v4 0/2] Add Renesas RZ/G3E USB3.0 PHY driver
Date: Wed, 29 Oct 2025 08:40:32 +0000
Message-ID: <20251029084037.108610-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

This patch series aims to add Renesas RZ/G3E USB3.0 PHY driver support.
This module is connected between USB3 Host and PHY module. The main
functions of this module are:
 1) Reset control
 2) Control of PHY input pins
 3) Monitoring of PHY output pins

v3->v4:
 * This patch series split from[1] as this series can be merged
   without any issues.
 * Collected tag from Geert.
 
[1] https://lore.kernel.org/all/20250916150255.4231-1-biju.das.jz@bp.renesas.com/

Biju Das (2):
  dt-bindings: phy: renesas: Document Renesas RZ/G3E USB3.0 PHY
  phy: renesas: Add Renesas RZ/G3E USB3.0 PHY driver

 .../bindings/phy/renesas,rzg3e-usb3-phy.yaml  |  63 +++++
 drivers/phy/renesas/Kconfig                   |   7 +
 drivers/phy/renesas/Makefile                  |   1 +
 drivers/phy/renesas/phy-rzg3e-usb3.c          | 259 ++++++++++++++++++
 4 files changed, 330 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/renesas,rzg3e-usb3-phy.yaml
 create mode 100644 drivers/phy/renesas/phy-rzg3e-usb3.c

-- 
2.43.0


