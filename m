Return-Path: <linux-renesas-soc+bounces-25290-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 10310C8F7F2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 17:24:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id AC957346318
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 16:24:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9059A2D3EC1;
	Thu, 27 Nov 2025 16:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="deAjZ1QF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D120726F471
	for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Nov 2025 16:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764260694; cv=none; b=SBIEu7k6p2UG/BmmDfU1NSZr3E4HEAY6zPVVcEBELaRX06kQ1OiEgruyQSWZVWw7ogWsVBHG4m9jv9DGzhztF1q+BJAQJsfpynkDZOqijUiBvNdnIon7W6ra/NoGsti86i0aFBJpMcYmmxT8kCUUbg7isgJ0/Gi36z35s/Wc1z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764260694; c=relaxed/simple;
	bh=e/Pl8gPJeRgvwhXLV/XhycyxN+OEC6dqAt0LI286kAU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EDdQ2HnXWcy6+cYqdTREZxusylQ0dzPK7/E5wU3V0U/kkadNbukAfgOkC+4wAR5PdAXsvO3sdIZX257QJaw+ZuS9JLLTViAn3C0NE2iqU0TrV9nUwLC24V7kOstfZTFNemsghY/a2rgCCioE+yg0lTeW3Syt9hliCYIqMpfxYxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=deAjZ1QF; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso10264215e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Nov 2025 08:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764260691; x=1764865491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tTuDofZ/dpgnTKp8dEB3WWnHumrubQoNy1pQF+WHUkM=;
        b=deAjZ1QF5jflXB/AnOGEh+GsfGEOy5QIBsAwaTULEktUYYokc2K0223F3SxEH0LtEI
         7sH7Go54GYgdjdsNN8JkWDkb4WRp6SkMX+rWG3o/LqvPE5yc+jTR2eUrb+yeEYXc+d7O
         aN3pK33FYHhtCHtx9cEKOPKpwa+phCbZ6i0IXKULMVLaPCqT54u97YIAh8Ro6AT13/er
         F3VM9n3X7G7f1oqFbHge4kb2Pts6fwo5i7335TLxDfKrSz4A4EmmkvzKnz/Fz+72tskJ
         F/k2J/QEH0pOP6t7IHrSXf0OEHn/sj7O4TCovABy5TVAx+SBMOFBhGNtBjlHVLxvf5HQ
         Wh0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764260691; x=1764865491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tTuDofZ/dpgnTKp8dEB3WWnHumrubQoNy1pQF+WHUkM=;
        b=Rn6eMPuw571pSmp67uS20xZnu8CG/JHQVe4nbufJ75ZMAB0xctXDthfZ9bU4SUUunf
         fdM4xK+GHEyBY+AnevyPsV7RMDFKnPNVwyz+fw+rKZt9xmv3GrKURziqcXjw8dB5YnbG
         opkM/VrJzC/nPN+hkp0cVSUlbv8IPaDE52oyniv++tOXv+wBGFnGQ0HnV12CDB0PVxnL
         s2KnQal/EHmDFPf19Hb8unDxG086yugYv0xqjxUXfgdBecuqL17uUinV5OHE1q5/V9uA
         hIATtxNtjnIazugEfe0dmfNk5KFJ2TCaJC/kaCyUeHkJs3tFymiaO+hl0AzKc17qNQzW
         VInA==
X-Forwarded-Encrypted: i=1; AJvYcCUQ+bPEABuNPzZ4kyFnH6jiR7/Kdwa1xdH/ADHUEfO4H+j/aenMClvB/93mIJKGwEGapRmDon5PIxEhLJ1njRYJ/A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4Gy8uqovoFk2yjJAI6uV/2htQwkkN6hF9NzNBTlW5JkObYtsC
	Mr/RFi4dIEIQvgORXWItCRIDvqhJitMnP+eHfoVnFhctk5TB7LUrZL/7
X-Gm-Gg: ASbGnctTFW0qHOeESQA6TQxEAnoRLdR+4aFnPN3+zqZrswr/eIr/sTZAHXe7IIgLJC1
	OOKD8lMdkD9TUXhLThcb0mUIg+YnpY72qDMY1TM/c75bJ0DZYrEOPxxkHbirgimJJ8p4MXT7245
	oOHcK5gpkI4Gm5v3QpJp8vcRzKr2YUuZJCpbWdh9OkDwPQ30t/LfstBhfj7Y4pPahZT5olsvSIs
	/C/4Cl1uFhLHmna0W/ChAew4I3+tPzb3LiKMo2CTaV0uYwRvhcFvYhguHeX1gWoXRj6wZ2ntC2U
	iWaLbsMlhpTz6y0UV847BWIJqrkoUq6BOd+tMKQzXGwJrFfy5dVs5WOgX62NYVrLhuVqPtKlByv
	Zzs1N/z/YbDvvrVJGRdvKcKQNH/grjJ/flhhrg3eAf+s0KBAgm+7AczzopTlUBPsTuvEqVbgXOX
	HG+wmu1WoKLjoaQhY+SfFSDJB8iFSVi306K0FhqD3SOjwo
X-Google-Smtp-Source: AGHT+IFq9LHNEfkuv+wmHM5cOoro8YICUk1Dn/GDuqG7DPnL1vUlWtkf5nHAOa5x9M5ou3zEUEvztA==
X-Received: by 2002:a05:600c:1ca5:b0:475:dde5:d91b with SMTP id 5b1f17b1804b1-477c1115ff6mr282457745e9.17.1764260691031;
        Thu, 27 Nov 2025 08:24:51 -0800 (PST)
Received: from iku.example.org ([2a06:5906:61b:2d00:4f24:123b:7b7f:5ea9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479111565a1sm39163795e9.5.2025.11.27.08.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 08:24:50 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/2] Add ICU support for Renesas RZ/V2N SoC
Date: Thu, 27 Nov 2025 16:24:45 +0000
Message-ID: <20251127162447.320971-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series aims to add support for the Interrupt Control Unit (ICU)
found in the Renesas RZ/V2N System on Chip (SoC). The RZ/V2N ICU shares
similarities with the RZ/V2H(P) family but has a different register layout,
notably with a reduced set of ECCRAM related registers.
The first patch documents the RZ/V2N ICU in the device tree bindings,
while the second patch introduces support in the irqchip driver by adding
a new compatible string.

v1->v2:
- Dropped using RZ/V2H compatible as a fallback.
- Patch 2/2 is new

Cheers,
Prabhakar

Lad Prabhakar (2):
  dt-bindings: interrupt-controller: renesas,rzv2h-icu: Document RZ/V2N
    SoC
  irqchip: renesas: rzv2h-icu: Add support for RZ/V2N SoC

 .../bindings/interrupt-controller/renesas,rzv2h-icu.yaml         | 1 +
 drivers/irqchip/irq-renesas-rzv2h.c                              | 1 +
 2 files changed, 2 insertions(+)

-- 
2.52.0


