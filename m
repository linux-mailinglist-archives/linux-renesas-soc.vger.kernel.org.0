Return-Path: <linux-renesas-soc+bounces-26099-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76ED7CDCE23
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Dec 2025 17:51:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7A38930170E0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Dec 2025 16:51:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A3A032720E;
	Wed, 24 Dec 2025 16:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kkzJLsDy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DEE4286415
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Dec 2025 16:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766595062; cv=none; b=uk3+rE3GXcCoVSJkOx2dYoz0oFUYbYhg9d1upwWfGFL/eUyp3vYjm1ki6IG7YgIgQ2vmngWZA/rkeooN457dkZ7HBn3KeX2qcm2DQBRjwvWQBckqbM1L7y8WFmecVdEh3op57y8N816QMhnwbdbGkXl/Na69fbHU+yp0l/Ltmqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766595062; c=relaxed/simple;
	bh=czLKHCU5+fP1Kb0qEK97qZgCkIO3bC4SpISrL4lljKw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XMYPwTbs88/NdJK/3+k67Ins24T41YIVky4Gp+7SfjllNW1Hw0+ozBlD4VHjJLbjPqil5UFReR9+57V2EvM5hp31A8kINHbuwlOkz02jYRR5VWoGQ//Qe9DofdEmGunDjsfMcFvKXjf74dx3VVAZYPrCGNpZ6iXIaJZhK6TdF0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kkzJLsDy; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4775ae77516so55210275e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Dec 2025 08:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766595059; x=1767199859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g4eRsHmASuGwyb/BaBJUOKdVAxYnEcEUDGaUnHd6qgo=;
        b=kkzJLsDypI66iwOtxlyowKWOLGtFdDhCJE64ZGOaq7o4hSec6hTyXQduuDAZ/mAABV
         Hhs4+9/VNt65lyJDgtsOPlw0/kVNtajV0G+V2WeIrUItnt8lDhZ6Nh8k0cuGbpfRF7wJ
         Qf+plP9fruLTifJ7z9v18Eg8uiWpZNllegojynMUKgQ/ZTBSHoR0LecAp/XuNxUJJKxt
         DuzkJkhoV8xPpdA42iToPaBkyt4VP4ew2ZxAhN/cGQk3S8cdfsUvNgSZ4l5tJBjuWTdK
         Pf8Ox7CZFtAs/6PU6ZLferO64mweyPzlMJUmFz9aYdHVP6Bs+OMHzmAdU2ybzYpP0eQM
         YCPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766595059; x=1767199859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g4eRsHmASuGwyb/BaBJUOKdVAxYnEcEUDGaUnHd6qgo=;
        b=PZKJBLukRlIXaawdzDG3qbj5Q2Vh8xS1IOsk7zMi2p2hTowUXnLoAdT5QBd2+Lfd0t
         Z5ZkugJbv5C+6Ts5u66hLL4I7R5HHxUb6LKpFBgQuO8Hf9NH6WR8Jaz1C17mF/ZsDD8+
         a6+y0Q+5zKBgWPQZXux0/AMdwVH1spNMzYw6e2q0RrV8F4pEDCJSiqvbquXSP5jGXWmq
         BgIVGwQfKN/vW+qF2c7t9X+ZA+RKXs5Vz/G5tpCj7O5W0gximKGVcIG1WIpKAvCRTEhI
         n7J/cQ4U/09vejEpbUkuBsrcIrId0wHFpwDCN1hIui60y+a1Ke/3MbNnbuzZMeEC59vu
         SHtQ==
X-Gm-Message-State: AOJu0YzHm98KDcFbj8X+hGOJaXNTKgPPm1h/9/+JiWfhJL2KkQ/nAJzS
	Rt/jwnwG4rSwAi/K4/C95Wk/3TM45vYIyKK99fQZftTVQnsuiBdNcl1b
X-Gm-Gg: AY/fxX70xnF+9/qmymxRsHjnF4PyLW/Ebs8zaBjqZc46vtHa6hfFYVEbuVQVa/SDfAE
	WndgL7o4IF/fAmrheUiDMK/5UXscy2erfy1+US+4kHBUGinSbaGy0fCq72hRFvFgPHrCgPFmDAf
	NhUpitxZXuqjiidJ7XiCoCmicngDbQqtrlz6FgfgUehIsWpIADHhkUIdFfiW/xeEWOo84SX8Knu
	wRKxzNPFDAHmZwEBRrOQMkvY3MwVgEiKcLAYetDIlRcDVKYjApNNbIB0wQpqsLwm4ihuNIF/Kht
	Kp7ryJZTkycKe+t6PBUEH7tecStu98sy6G14vkLd5/fG7/scIJZdU6uKLUyKIlBuVaGBo8oQdx2
	Qoi/H7FGtp65eo7W6/cu06LiCVDgbleg8FPeOPnBA+wdf71KTUtEEHfVseWVfQTFK2vCLktzwG5
	E5pM9PaXhWOHwMihuOOjzvLtl07FOboYity98wRwwQHbSyH5mnXByiuXmjur0IXBsSTdKsjGHa9
	dAyfDIo976UIWPuTMxuX3dJ
X-Google-Smtp-Source: AGHT+IEl/9OiTEZpBcYx1GBcVJZFF2FYtLewMgpxkdzBjzOsPnCkuhsZFwEaBxZj+b4rC/x1TmNzLw==
X-Received: by 2002:a05:600c:c08a:b0:46e:1abc:1811 with SMTP id 5b1f17b1804b1-47d197f67edmr141214885e9.27.1766595058836;
        Wed, 24 Dec 2025 08:50:58 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:3371:7b65:aaf4:d2e4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3ac5409sm136482305e9.15.2025.12.24.08.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 08:50:58 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/4] Add CANFD clocks for R9A09G056/057/077/087 SoCs
Date: Wed, 24 Dec 2025 16:50:45 +0000
Message-ID: <20251224165049.3384870-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

This patch series adds CANFD clock support for the Renesas RZ/T2H
(R9A09G077) and RZ/N2H (R9A09G087) SoCs along with R9A09G056 and
R9A09G057 SoCs. The CANFD peripheral in these SoCs requires
three input clocks PCLKM (peripheral clock), PCLKH (RAM clock)
and PCLKCAN (CANFD clock).

Cheers,
Prabhakar

Lad Prabhakar (4):
  dt-bindings: clock: renesas,r9a09g077/87: Add PCLKCAN ID
  clk: renesas: r9a09g077: Add CANFD clocks
  clk: renesas: r9a09g057: Add entries for CANFD
  clk: renesas: r9a09g056: Add entries for CANFD

 drivers/clk/renesas/r9a09g056-cpg.c                 | 10 ++++++++++
 drivers/clk/renesas/r9a09g057-cpg.c                 | 10 ++++++++++
 drivers/clk/renesas/r9a09g077-cpg.c                 | 13 ++++++++++++-
 .../dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h  |  1 +
 .../dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h  |  1 +
 5 files changed, 34 insertions(+), 1 deletion(-)

-- 
2.52.0


