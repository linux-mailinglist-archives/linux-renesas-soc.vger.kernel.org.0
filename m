Return-Path: <linux-renesas-soc+bounces-7625-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 762599411CB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jul 2024 14:26:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7A4A1C2315D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jul 2024 12:26:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DBF119E828;
	Tue, 30 Jul 2024 12:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lJqG08Hz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895E8187340;
	Tue, 30 Jul 2024 12:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722342383; cv=none; b=L1PJZ3xhmCAM1C8H+t91lAvFyEm/qx2QYN3yyYMoIHeD2vMbmk+vqYw7ihJqFcrvz1EDMC19g4nk+9zAqjIhDZE4ArtYsEbC+JKxBUwmvjEyXjJKFDcGWMyxPF2HhBG3+eGiTGv622E5xdViLFFI7tMCrVba3XRXliqYKkSkJ7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722342383; c=relaxed/simple;
	bh=psjpdqny/AT34993h/rSHUqKDueTCD4QaVMuA7f5Gik=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TkRTxRMmBWluM6Sc6fglwftSau5E7nLNSetKeseJMklAJIgixzH5QUP7Y4Fz2ZPdm+907AZiNge+7XRHcfNai0PPFUoLbmSgEbc6wwPPssIXDyPUGvqlYwH2/iqVZsp8r1tNktIbDD5EYnJc23/7F+Ej4tprWpl13Ny/8bavsBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lJqG08Hz; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4281abc65daso19829355e9.2;
        Tue, 30 Jul 2024 05:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722342380; x=1722947180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3un4gr+dg+yEKLgzvAmUvLBXXzIjzbNm9J4CeMjygc0=;
        b=lJqG08HzhIBuV8wfGYc7DAs3D04IeMi28xix3UWWbPPSlDqYX/mYxGuVAGLFVTFia4
         c8mWQIowTAEX/viDoEmlM3eb9kURqptIG65FwQDX24Lq9vUCKIj5fh2zQ6/J7++H4yfm
         pNxMK1+0B3QYqjetWl/iqLH4GNtWUGNqHL8KW3yRoDGH9bPgJ5Jfe0ZVU8p/HDMiKs+s
         JOqdLHB+sDBihFhI/lqThla7hIT93lrEr+N7RxSsPFkO/pzji2IO8dVpCtGWYKKB0hvy
         2Yq0MdcAAkIrsn5Zkb5PYF2xhcJB9LH9ySTn4Ff/rNKOd5gJEXy+Q9pZhgNu6gOoYV4K
         eH0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722342380; x=1722947180;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3un4gr+dg+yEKLgzvAmUvLBXXzIjzbNm9J4CeMjygc0=;
        b=T3UHyDyII0lkliw/NKV8hz4XBygUa5+J+QcfWuusD3Mxe66MxyEL3cWayRgZ9/dSaQ
         uYeaHRqejYmqSIubDVWKqaXBc3wtkwAnOe8GDpk/EibxrWSSrOKrBBFvr0DF9ryEm+G8
         86JQ/w0VL2Q+RHwhaqu1mnuTYbtXgV9OJUXzx2MgdDQrAkHFw+3YSo3+syo55j0q2fqw
         b1C0HTI+28jBuT7B0Mm5L94nqWEstM7VIm4ywNPn5DBbL5mAk8RRlmkOaZxhdfYWpxzP
         ojQlJub7suYXjjfzcihaeT4xbAHGrkBkgKH7azKpy45hP16G8bdiPsdPhMtDcM6M+cBP
         he3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWVL+OAz3YfO0YAfxLI8e5mFAo+4lkYmOoGGbCedFW7HUCCf6hso0Rp1Px41QOmsLtPt4U/aZWOIVHgzVnFWaq11miAz356/ARScGHuXcLbZMGsfbHAgiySSqvWClknPgEZXKoxabkuFA==
X-Gm-Message-State: AOJu0YxOvTrq1bweAsp8uTlEZjM1IOqDvTBGwqdMhJGQF5ngMcl4LfBj
	cuPgQODKBh7nM4mayOWFGoQ7NZdJFbTsWk5NV+14dVb1XabbBB/L
X-Google-Smtp-Source: AGHT+IEo0OR4xTtPsdsqpG9cCpF2H2qx9Mp+KLkzvQb7BSn1LNo54KkYB9VB5F3x2a7GDaRrqqiQHQ==
X-Received: by 2002:a05:600c:19d3:b0:426:5b3b:88b0 with SMTP id 5b1f17b1804b1-42811d89d55mr80911355e9.14.1722342379341;
        Tue, 30 Jul 2024 05:26:19 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:a2b2:16cc:b7df:405d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42813a5b3f6sm125366615e9.2.2024.07.30.05.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 05:26:18 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Marc Zyngier <maz@kernel.org>,
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
Subject: [PATCH v2 0/4] arm64: dts: renesas: Correct GICD and GICR sizes
Date: Tue, 30 Jul 2024 13:24:32 +0100
Message-Id: <20240730122436.350013-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

This patch series aims to correct GICD and GICR sizes on RZ/G2L(LC),
RZ/G2UL, RZ/V2L and RZ/G3S SoCs. These SoCs are equipped with GIC-600.

GIC-600 supports MBI by default, so GICD size is set to 128kB.
On RZ/G2UL and RZ/G3S SoC despite being single core the GICR size is set
to 256kB as dumping the GICR_IIDR register shows it has two instances of
GICR.

v1->v2
- Dropped changes for single core
- Updated commit message

Cheers,
Prabhakar

Lad Prabhakar (4):
  arm64: dts: renesas: r9a08g045: Correct GICD and GICR sizes
  arm64: dts: renesas: r9a07g043u: Correct GICD and GICR sizes
  arm64: dts: renesas: r9a07g054: Correct GICD and GICR sizes
  arm64: dts: renesas: r9a07g044: Correct GICD and GICR sizes

 arch/arm64/boot/dts/renesas/r9a07g043u.dtsi | 4 ++--
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi  | 4 ++--
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi  | 4 ++--
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi  | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

-- 
2.34.1


