Return-Path: <linux-renesas-soc+bounces-23079-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 882FBBDF3D1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 17:03:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54AF619A1E38
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 15:02:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 028AD2DE70D;
	Wed, 15 Oct 2025 15:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D+CQSoJn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571DF2D739A
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Oct 2025 15:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760540442; cv=none; b=p0wAIDLcU6+s3wB9lIFbzjBkSwAdovGdl6fOUa3CdjhXzV7FSvjiZEFd+9LWLgTCwgkZFqLKjwY7U1H3rMCQPNKawq0zU5rwuFcN7ld1kR29GsGRdVRGT4/j6jgFUSGIqUmy8/AxevzsYJW03XGY7X/9dfx0WOdlYZHHoPXEm8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760540442; c=relaxed/simple;
	bh=F0ClBApCMgVyjID/CjFDSVUx5gSGLZfHQALoUwC/I1s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nvWPhEpXtFh438vbtz3DGFCqB+k86chCEPIV36H3wbJR1jAkA2COceh7Swbc9QAkIHqLPsUCl/s9iGqKWMSYhaZ+GbtvtyeHGddE6y1nyRBfGUunA8gcUYF3wc9kJQTYNy6SVg/wAltS37gSaGBtAg19XsN9BOsX7QMlf0wHf+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D+CQSoJn; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-269639879c3so63841335ad.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Oct 2025 08:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760540440; x=1761145240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R+DLV1CzXLyhsDAWia+k6Xr/YGg9OzRZzk7hbqGZmlI=;
        b=D+CQSoJni2Tzr+xgY9K9hksTn1gps1rCC1MoeNr00IM1p8wo7/YP39uRxb9tWk3Gn0
         SeXFhCefNGVQj1s8eBPedGh+jEfisENjU4u4NYRGtjXukM683xVrJWVBg9fv5wP+Zs3F
         5gsBuPupVsfZVfE8cSoYXEiW1ptKKDqRTxfpSjKdN4UFGU0FM0U+lq2oXf2oCaNuBWhT
         NOipqC6FTvtEKWLVVgX50iyn/9n5+unVNNgpqiuqQkpaSmsuvBqqyBC3VjkyoMl4QJtr
         2gm4+NXVLYdhpMbq2AEauN8ApRurx8HxyT0omf/cEFF7XsmFLNAoA4xLO50L6tLQEgkN
         J1dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760540440; x=1761145240;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R+DLV1CzXLyhsDAWia+k6Xr/YGg9OzRZzk7hbqGZmlI=;
        b=pks2eZFXnaa19GiAc0ycHLSy9Cdi5SYt0gvYorjHl9LdD5AcwgIV3s42Osb/T528jD
         dT0lfujnSdn26afs0oG+O/2d0gDCojzTF01MvhvJpho+t4LgxRrkvWa9gIxcqCtYCwCm
         tI9i5sLuS6CeYEsBn2Yk3oO49syngxAsLcAeQPS4TXvy2jGB4pMITKogKwtzxAUmtWow
         CAMQISN+nEHV1zUCMPnRbcQnB248bfioPJPKSmsNZQ/NeiHBfElWSPqjFA9I8xMYu9B3
         8fAd6Q1f3tKqvawc4Vrcmg6RNx5dHYOlfhafaPvJT3OwtoToC7JjfD8RjA7Cc+4bKTxL
         QibA==
X-Forwarded-Encrypted: i=1; AJvYcCV+24VEKyExY9wBWqWVgyT6I3ywI0N4ifKBfdsstkR4GITGAT1hnnk1ywk6DRGfr0Q/84EUdKFaji5JP8jl71l1ig==@vger.kernel.org
X-Gm-Message-State: AOJu0YxeEuCdYI50cneNCPbbk9A0BNF7gnE3f+Xvox7uUoDYglUY/CAH
	yVg7ieuOuNQcPnVOZxHyjXBbFmJmJd0FFwEdudAmNyTqjCbIsGGDV4er7diaDw==
X-Gm-Gg: ASbGnctM3R10hmI0gvpl7ZF617Y7gRunK3iSjkXDebkd4+wQwyP1i67OwPI/yZkxx5a
	LMYpuSUf7rNQLNTlJnv56mHiPctTshk5mQPUEa9goj4bmimmHaJta+69mpWTefee0FT0tOtUHNi
	Hc/+gNXNsjSrbVMK+/GeGxebZDKX/cqWqQrZreUo1l+KrtZAUlyOYeenPoqFs/X0bEJTdQnY6gU
	uzrlGIt3CehTZZ9GKQQLTDRxd6bUXbmq0iJ7H6w4WoQE4lrmbX91KPxWaL43lBItMrqqGGoqJ9z
	68leViVH1V6NCRCYvPb8YN0jM+1EB5TX5keYdLVs4bkor8SsP2uSpT1nByunfGi8ZVbLmbBWMDB
	aOrWTO4m0arBEGIhxDJdFs6Na9VesOlSBpCdH3FGe/0UnQsb4FMGKlX6Cr6reKpA=
X-Google-Smtp-Source: AGHT+IHwRZTs9TuYhczA3uxy66laQtAYZoZCfvpPr08dztpOuSb5LWAjgETrqlREdBPDLdAa8s5nJQ==
X-Received: by 2002:a17:903:faf:b0:278:bfae:3244 with SMTP id d9443c01a7336-2902741e44fmr368699015ad.54.1760540438774;
        Wed, 15 Oct 2025 08:00:38 -0700 (PDT)
Received: from iku.. ([2401:4900:1c07:c7d3:f449:63fb:7005:808e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f36408sm199642265ad.91.2025.10.15.08.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 08:00:38 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Paul Barker <paul@pbarker.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/3] net: ravb: Fix SoC-specific configuration and descriptor handling issues
Date: Wed, 15 Oct 2025 16:00:23 +0100
Message-ID: <20251015150026.117587-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This series addresses several issues in the Renesas Ethernet AVB (ravb)
driver related to SoC-specific resource configuration and descriptor
ordering.

Different Renesas SoCs implement varying numbers of descriptor entries and
queue capabilities, which were previously hardcoded or misconfigured.
Additionally, a potential ordering hazard in descriptor setup could cause
the DMA engine to start prematurely, leading to TX stalls on some
platforms.

The series includes the following changes:

Make DBAT entry count configurable per SoC
The number of descriptor base address table (DBAT) entries is not uniform
across all SoCs. Pass this information via the hardware info structure and
allocate resources accordingly.

Allocate correct number of queues based on SoC support
Use the per-SoC configuration to determine whether a network control queue
is available, and allocate queues dynamically to match the SoC's
capability.

Enforce descriptor type ordering to prevent early DMA start
Ensure proper write ordering of TX descriptor type fields to prevent the
DMA engine from observing an incomplete descriptor chain. This fixes
observed TX stalls on RZ/G2L platforms running RT kernels.

All three patches include Fixes tags and should be considered for stable
backporting.

Tested on R/G1x Gen2, RZ/G2x Gen3 and RZ/G2L family hardware.

Note, I've not added net-next in the subject as these are bug fixes for
existing functionality.

Cheers,
Prabhakar

Lad Prabhakar (3):
  net: ravb: Make DBAT entry count configurable per-SoC
  net: ravb: Allocate correct number of queues based on SoC support
  net: ravb: Enforce descriptor type ordering to prevent early DMA start

 drivers/net/ethernet/renesas/ravb.h      |  2 +-
 drivers/net/ethernet/renesas/ravb_main.c | 30 ++++++++++++++++--------
 2 files changed, 21 insertions(+), 11 deletions(-)

-- 
2.43.0


