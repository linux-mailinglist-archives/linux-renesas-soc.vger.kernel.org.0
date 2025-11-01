Return-Path: <linux-renesas-soc+bounces-23977-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 02515C277E0
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 01 Nov 2025 06:00:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 51D651A276E5
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  1 Nov 2025 05:01:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34688216E32;
	Sat,  1 Nov 2025 05:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K3C62Da0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD3B1E868
	for <linux-renesas-soc@vger.kernel.org>; Sat,  1 Nov 2025 05:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761973247; cv=none; b=aVaCDVEW+o5ktcyVaPDtNHqX9j7+x81+QxOn/PbKGL1z0DfsX06v3+NlbSp8gBHe2xsH8KSJoF0ov/zfedmm81eA9dnAMBi/JNDC2PIsrGJp4TSzZKpwXxxgejLGYcbuqCa7N9tYMLdnnriHGsJGNr4IB0+sKg53g4v85UkgrfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761973247; c=relaxed/simple;
	bh=Oh44UZjHsMc/rfrWX2YnpJEvv9Vn65qg079kLT1V5X4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cJ9fRHJz5Sb279FYNFuP51SsJ7zVwLhINM8IjcSN+XvqGkLYT7o2m79zT7VFe3sz5kES+LIl4pSpJgiwiUJkshtQxGglZVUKDCuvqAx0vixCuh5F2wjqBfSCpaMo9JVNosjJ7fB13IcdbBak953gNE2W2WUQCCq2U/8ql2JTn9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K3C62Da0; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-781206cce18so3328178b3a.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 31 Oct 2025 22:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761973244; x=1762578044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wIwIO+j2mO8maDFel6M1v9YStfB+c9Y+ZJYZAlcF5l4=;
        b=K3C62Da0MiW2n+FCH7++i2JfNn9L0KD7y8swc8xt+7eNOTCsy1PHF73Cl0F0jjEijL
         2GyQjTeYRkONJKkCIdPkbKnEIM0cm67/EIb4ZJBs6FfQPQdJjddVZv10I0K+pE9MOeq4
         MmijoZG4OCbeOkutGtJKd5Lbr1rC6XFrmcc1xemrSIvQsvuZReQJSw6mCNyr5upeylJe
         GkkCGLo44eNjdybxR2cGzo5TyHHn9wRE5Dh+Ty5i5KfhJIFE2Si306VRoFBhrpXCnZsZ
         YXg3SzvcwqsUZEGTVbVxxRh3zS7cLaFFh9IMMPAPLmZytdnnq14D93cOv+o6/v36tgYW
         EAMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761973244; x=1762578044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wIwIO+j2mO8maDFel6M1v9YStfB+c9Y+ZJYZAlcF5l4=;
        b=YeST0gsLymYhL2j4+ZimLi8IXVVx+LfJ3K22gqWYvnww+PGuMLoyg9tcbnlOxDBX41
         rK4u7sJxw/TFmKB9YNLcH8kWiuaucWtGv/HhduSKdiMjD6v2AqQyzPEpE5hd9MuRyw8+
         C+LZ3QGQ62VZTIWC5e2P8yy7eKdNtL/r5kQAgCH9t44HIGOQBzL9IwbeRyMXn2LTq/D/
         iHdk83ZWQ2cuGfU8jGPO/u6IySAS5WcVgz7FuDfvbm4t/QsiedUZ/sNFBfDts1g98LsJ
         27jKTkP1CcQ6TrktseB9N8wSUE+AuZlk+i2dFhuAvBDG+iX4DbdUVdCgnea3gzgHJ9Ee
         VjUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXz5V/R9N6aYl4f9wFKQaWWBEubY+vRV/1Ymt7dMaqwSCpwxv09yu4QJmRdLh0RbGKIYuYnx3WuLrrhIKaQ67mIRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXGIAcY+oiiiD0dg/ajgk55rSpbJV24qYRQ7+1rilgs8+0sw2V
	hhJtxb3XiUcxdRW44Jal7+RjWy2LTgI6Q8FxIH53lHSDPpPVYnUKcQBW
X-Gm-Gg: ASbGncuc+n76QleoW2nk7S3earBtOZtEIWswUug/3HQLtn/w4Ql4dK/RtcCbB7udpFK
	gdYfQ6VF88uA9ozjsCyc1IP7kOTvtmIBFQqneDKgxf1+SHFelfcCDDwG0pV7YKhVUSZET4T9XE+
	g1jyALoRre5pe/P3bBH30vREejEi0EBcgjRmGcpeakCUyV6gOwHrlA9vRuBXOh+yMuAo+yj7vqi
	oN7fRB1jkEJnxSqtpU4MI9CWb5psE9WeR6XA6enaOF3hastieyjc6hxV5UkgtxDSBOln1wtgtwp
	1lK6zPGBVEVJh3ygTNF14t8cEeVaz0qHP7h6sPMbr3pIItGAna42h+Th8rKxhBB9VRmi5+XUQEm
	cHaoO6Sy2ukI6z0PcAIIJB6EjjrKCdpknSXYT7/LFRj10CyCTIiK8s51hTSQxZv5HytyyfH7XNl
	7KOj12aGNstaxVBaidDzJD7xuM5woZXBo=
X-Google-Smtp-Source: AGHT+IEMhJ6NXDRyaN0YqS139CnyyfuTRt27C2a8e3X3e0TG0+kZ4vhiRrmxHXesFyCgHskXvBB3jw==
X-Received: by 2002:a05:6a20:c916:b0:341:8609:3bad with SMTP id adf61e73a8af0-3477a5c1395mr13547881637.5.1761973244223;
        Fri, 31 Oct 2025 22:00:44 -0700 (PDT)
Received: from iku.. ([2401:4900:1c06:600d:690:cbc4:d4d9:22c2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b93b8aa3ff1sm3761095a12.14.2025.10.31.22.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 22:00:43 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/4] Add USB3.0 clocks and resets for R9A09G057 and R9A09G056
Date: Sat,  1 Nov 2025 05:00:30 +0000
Message-ID: <20251101050034.738807-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series adds USB3.0 clock and reset entries for Renesas R9A09G057
and R9A09G056 SoCs. The changes include updates to the clock driver source
files and the corresponding device tree bindings header files.

Cheers,
Prabhakar

Lad Prabhakar (4):
  dt-bindings: clock: renesas,r9a09g057-cpg: Add USB3.0 core clocks
  dt-bindings: clock: renesas,r9a09g056-cpg: Add USB3.0 core clocks
  clk: renesas: r9a09g057: Add USB3.0 clocks/resets
  clk: renesas: r9a09g056: Add USB3.0 clocks/resets

 drivers/clk/renesas/r9a09g056-cpg.c              |  9 ++++++++-
 drivers/clk/renesas/r9a09g057-cpg.c              | 16 +++++++++++++++-
 .../dt-bindings/clock/renesas,r9a09g056-cpg.h    |  2 ++
 .../dt-bindings/clock/renesas,r9a09g057-cpg.h    |  4 ++++
 4 files changed, 29 insertions(+), 2 deletions(-)

-- 
2.43.0


