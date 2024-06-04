Return-Path: <linux-renesas-soc+bounces-5835-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9D58FBA9E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2024 19:37:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6550F28A595
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2024 17:37:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9512F149E03;
	Tue,  4 Jun 2024 17:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HBNMImIT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60C8146D6E;
	Tue,  4 Jun 2024 17:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717522638; cv=none; b=b5k4ezGwEoUJS+tvdfXfM52ruYUNYeRh94MIWegxkEqcs3PUjhWQcmy0VAHV6x4cWM4YYcQivAw954JMdTkJ0d9vmYMsYW+NPzZHcHRkSjS6sbdIzPtq2vp0wOcfDwBsNN3P3KmgK9iMDSfFFIdJQTaREc4q617Kk7PIgYBBdhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717522638; c=relaxed/simple;
	bh=BZTgjf9ANpfltpQEv+7jHdj3nf3ioxC2QbCC+Li3LfU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=usoTdfcI0cAuLOBl4bpwd82csubwLRcJ0eXUE741Qa+CvBkdN7t4MSmbCW/m28e4+n5Q/cJ/QqwXk27j0J6fJUiNJffQGVGw8wd6Qks/2MsLfetjHjAZlq9hOxG2f7dS02IBK0VBZnX0kxurDAVTms1LZg8j2Yui3EH0HNAEYDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HBNMImIT; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-421392b8156so13055535e9.3;
        Tue, 04 Jun 2024 10:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717522635; x=1718127435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kU5ARIlzxtuGFM6tyPtbUIy34Lxr4+NyXU7rtkdO4mE=;
        b=HBNMImIT+mqDkbbTw+umv3cyKdPA6l9mEQx4KveES2Dc+TxexNXuT43aBbL+TajxVq
         5IAYmTBn2rGuqopLLCHBY7RIm1E5yOkwWpRTTXFTyyIIAhYef4/yDAk73tOi1BVR+U9A
         IikbId3eMRyMR3TrzHFXQJK0npMXOkXeAJK/Zfm5La6A8z6mhc7iRH829e+TGaUVX7i3
         JagNj3vAfhPSVa3LlL6iLpz7ShKNiopwtOfnYB4jhZ0NYx77OfVbozYnoTFJHGQkXjmD
         pF/yw3RwJ/I4rzkHXPCVdDibC7kBlK4ERGTswytUtjhSaw/ZuylYiMy1QKoqJ9QSRjpl
         INPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717522635; x=1718127435;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kU5ARIlzxtuGFM6tyPtbUIy34Lxr4+NyXU7rtkdO4mE=;
        b=gO+ua/QuNbIM0yGTnGc30rMeV5VMnWNzRECcstwC/oNUH8+5OlxR4Qw5gawcBfOFpN
         yLYSBWxm3wY0EJIdWrlnJC6O0brKJey9VzREym4cTD48cnQFfCr+hTL3LJ6AwaWv4uoI
         Q+Gm2Vfxg0tuo8PPiLzJH9hiqUeb6ELPY8GAQ0AMuoMs0px/qnx9rTAEBkzNwLZpbeND
         aBXUajea5RTqMp9oDnXSXdRcFme30fiqTOh2mKbK988bvB9yfYHM6fpGFC8d5mWyO6nA
         4XpH2YLH24r4uZ47Myo/F5jN5i3z2dmKJDSkz16b5HW4GXPfG0yLN6FyBf2Y0CgxlqzZ
         R72Q==
X-Forwarded-Encrypted: i=1; AJvYcCVffQZehLzTpr1UZyn3u32GwFzYP86ItA2H7y/ljX6BRbjiMmJjCj0lw30ysUbPL3IC+7FH9DBnr8PLMdQoYs8p2BKm3DaiHdFNuD7T0Rx9qmQdXjngCLk8bgX6CGybcLKgGQjG2Q4KvSHYy3LZ
X-Gm-Message-State: AOJu0YwRQuWyChcfQXQKQ5024ZvRQRmhPZE7Tei8rzWxmzOdvT9U5hHa
	tdrzL7u/maAxCpDfuhmDXup67vG0x+IWOGTdwRf6GA/oS1PKoqWY
X-Google-Smtp-Source: AGHT+IFSx5eQvMo/7LYEQWdiAZpTYDMya4eK9zX8FJ33ZNqsYuWWrs195TjjCiAfnrRLHRRE5uGY6g==
X-Received: by 2002:a05:600c:154a:b0:421:2b3e:3a22 with SMTP id 5b1f17b1804b1-421562cce3dmr2749115e9.14.1717522635105;
        Tue, 04 Jun 2024 10:37:15 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4213c6629bdsm87844085e9.8.2024.06.04.10.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 10:37:14 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 0/2] Add IAX45 support for RZ/Five SoC
Date: Tue,  4 Jun 2024 18:37:08 +0100
Message-Id: <20240604173710.534132-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The IAX45 block on RZ/Five SoC is almost identical to the IRQC bock found
on the RZ/G2L family of SoCs.

IAX45 performs various interrupt controls including synchronization for the
external interrupts of NMI, IRQ, and GPIOINT and the interrupts of the
built-in peripheral interrupts output by each module. And it notifies the
interrupt to the PLIC.
- Select 32 TINT from 82 GPIOINT.
- Integration of bus error interrupts from system bus.
- Integration of ECC error interrupts from On-chip RAM.
- Indicate interrupt status. (NMI, IRQ, TINT, integrated bus error
  interrupt and integrated ECC error interrupt)
- Setting of interrupt detection method. (NMI, IRQ and TINT)
- All interrupts are masked by INTMASK.
- Mask function for NMI, IRQ and TINT

This patch series adds support for IAX45 in the IRQC driver and enables
this on RZ/Five SoC.

v4->v5
- Reversed the operation in rzfive_irqc_irq_disable().

v3->v4
- Renamed rzg2l_irqc_init_helper -> rzg2l_irqc_common_init
- Moved the locks into callers for (un)mask and (en/dis)able functions
- Collected RB tag from Geert for patch#2

v2->v3
- DTS/I patches dropped from the series as they have been merged into
  renesas-soc tree
- Just using a const from compat string instead of having it in a items
- Added RZ/Five specific irqchip

v2: https://patchwork.kernel.org/project/linux-renesas-soc/cover/20240403203503.634465-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
v1: https://patchwork.kernel.org/project/linux-renesas-soc/cover/20240129151618.90922-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (2):
  dt-bindings: interrupt-controller: renesas,rzg2l-irqc: Document
    RZ/Five SoC
  irqchip/renesas-rzg2l: Add support for RZ/Five SoC

 .../renesas,rzg2l-irqc.yaml                   |  17 +-
 drivers/irqchip/irq-renesas-rzg2l.c           | 148 +++++++++++++++++-
 2 files changed, 155 insertions(+), 10 deletions(-)

-- 
2.34.1


