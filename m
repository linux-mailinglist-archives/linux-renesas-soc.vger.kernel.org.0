Return-Path: <linux-renesas-soc+bounces-26770-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D83FD1FEE5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jan 2026 16:49:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A00E3007FE2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jan 2026 15:45:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25A0C3A0B2F;
	Wed, 14 Jan 2026 15:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BQN8X8K5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF83239E76
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 15:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768405531; cv=none; b=jWdIV6oc7A4Ea5Eaur768E4utsIF66UqQOP4+eOcjlZqScoCUEf/4Kq1j3eohYgnB9cZ6Du+otfCh17BwjBpSLjnTHaj2ETZiw59MMPiEQfGm8ucuHf7Rwk5ip7jDg+IkdVs4LwXl9t26Iygay6mpZJOsls5HejmWmTcvQCvI3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768405531; c=relaxed/simple;
	bh=Up2AstbZWFGTvOK9odG/3yJUO1giaEyY5igE6wJD6Jc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K6vj549/Yx27wfjVM1PI4T8EsZc+8zTfe0v+9IsJb8ibpqRB3M6UShaa7QJCwOf+ERmSVSnQPyTJBCAVbDtcYCFxRudfQvdULGghThhU1bw5C29QSGV7qOUSGLeZ+NoB1kciqRF0BTgmhQDg6292Kv5f5J5wtaHAZxZti32i6cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BQN8X8K5; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so65971375e9.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 07:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768405528; x=1769010328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+KLyVPl7ef6pflNddejrx56gS9wwrDJcy0wiU6lH7IE=;
        b=BQN8X8K5oQLntQjbYTr+qhNa4mEVDEazwQOTi8zvqXTP66WodEGasnj5jA5f4v6syZ
         qcZj7ooOnq4mdp3IFHyXJnowIKriPjqvOgfYDEz0vIvtZ4DI0HtRyZOVTmRlOTXcYcCt
         f+zYcg4kuLG6ec0LtWQq1xxutTtkwEUXMvN/E2VeH1XG3UlyPgt2YUJd8lrtzXR0d49h
         2Wx0cCaHJRfEYrigIjB8pevhZ//5N8MqXaFEj87J7AWPPLM5FKUUqZwY8QnoAgUsY7XR
         N411LOXwcg5kSeYnfuXD0DlS0KZGjbZ8evhgZiuFQBycik6ms6FlParQzi1uUKfCgJ79
         gTeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768405528; x=1769010328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+KLyVPl7ef6pflNddejrx56gS9wwrDJcy0wiU6lH7IE=;
        b=hevsBh2T9X7n8D2jPt38plMrvLvStnL16BhEcBI0EM98lK7+fG53cqBiANv3NW1UgE
         Ctu3SEf2UEY2YSZZdX/wFm92iCVbsYnSRXhN3DZRt7x9INcwHJZnuntCyU+ojZqM0CtN
         TujaWspYRZFw4lmdjgefFN7CP1AGT9HCqjj2bfzXv0f3DsnccfY+50VhyuzwrKXaEnNN
         dYya6gjETjHf1CnfWHGzsZEOsVykuOVhfj7hrW8elj5I/O9s7tI4T1xQRAMREXNOT7+I
         QjHywmtTCZgxufMapbZtphkNzvNLD3hSyf9AefCwE4e5ViwzKdMzTeiHzsVPGAhh5jbC
         5aww==
X-Gm-Message-State: AOJu0Yx5N3yPhurcgeeZ9KG2GvA6XCpN8ptWPpWQzCHRRzgF2QukxKsw
	4iaiZowIRtX331OfY+ZoXaDJ2LNibCw18s4WzZ5UKy1+OsxyVy3OyBj3
X-Gm-Gg: AY/fxX6DxcwYmOod59haJYW8AmQJdYwY3ekIIg1sxRf3aqYEOPxmbf2e8tUXNB+TcXP
	096RwCDKOUt7oJI62ijLzG8XcDb1ito1WOv+oddDCGnjjuLBwHNo3iSUD+P2sxx6EYGjfJjzgs+
	8s9bb+MBdUIov8fuKFZDbCefU/ynjQ3EN7XEk7Hg1/zF1IzQjTT3MdhdRUjtDaeV4TJq6b5nTaM
	cx3cwGTcY0uF7ID/AMYkANByuKYWnmkfFvT+/e9fg1i+r4WGlAyZ18OQmSpi9YbHwURlTkb+olR
	KD4DF/4849TxUAnxRzscbwRaQUchyliMl4u+u3RDfJwLkTFiUb85DXbqY3rEKQIX5jyS6UpqgNS
	Ug0MxgWEq9uzmGUI+tsbd2/1p5mHJkeeCcDDPDsO6WJid8gQteb7tamOLBz42D+Wrt1imrTsbGI
	pCn/h8Msj1bHH12R19phyqLNINVGxOtRvx93oVe5gVicfcXneHk4VJxM2ii1mTAa1qmiiGfxvDH
	21gpIMgyzNu2toKJ+IrZLue
X-Received: by 2002:a05:600c:3483:b0:477:9fcf:3ff9 with SMTP id 5b1f17b1804b1-47ee33a0fe7mr38193535e9.27.1768405527738;
        Wed, 14 Jan 2026 07:45:27 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:7f20:df14:ac2b:3d74])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee544387fsm33867105e9.0.2026.01.14.07.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:45:27 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-can@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 0/4] Add CANFD support to R9A09G056/057/077/087 SoCs
Date: Wed, 14 Jan 2026 15:45:21 +0000
Message-ID: <20260114154525.3169992-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

This patch series adds CANFD support to RZ/V2H(P), RZ/V2N, RZ/T2H and
RZ/N2H SoCs.
The CANFD controller on RZ/V2H(P) and RZ/V2N SoCs is similar to the one
on RZ/G3E SoC, while the CANFD controller on RZ/T2H and RZ/N2H SoCs is
similar to R-Car Gen 4 SoCs but with some differences in terms of
number of channels and AFLPN and CFTML bits.

The patch series includes:
- Specifying reset-names for RZ/G2L and RZ/G3E CANFD controllers.
- Documenting the CANFD controller on RZ/V2H(P) and RZ/V2N SoCs.
- Documenting the CANFD controller on RZ/T2H and RZ/N2H SoCs.
- Adding RZ/T2H SoC support in the rcar_canfd driver.c file.

Note this patch series applies on top of:
https://lore.kernel.org/all/20251126155911.320563-1-biju.das.jz@bp.renesas.com/

v3->v4:
- Added Reviewed-by tag for patch 1/4.
- No changes made for patches 2/4 and 4/4.
- For patch 3/4:
 * Dropped Reviewed-by from Geert due to below changes.
 * Moved single compatible entries into an enum and to below oneOf.
 * Synced the resets/reset-names handling with other similar SoCs.

v2->v3:
- Updated commit message to clarify that reset-names existed previously
  but was dropped for patch 1/4.
- Grouped single compatible entries into an enum in patch 3/4.
- Updated commit message about disallowing reset-names property
  for patch 3/4.
- Added Acked-by and Reviewed-by tags.

v1->v2:
- Moved reset-names to top-level properties.

Cheers,
Prabhakar

Lad Prabhakar (4):
  dt-bindings: can: renesas,rcar-canfd: Specify reset-names
  dt-bindings: can: renesas,rcar-canfd: Document RZ/V2H(P) and RZ/V2N
    SoCs
  dt-bindings: can: renesas,rcar-canfd: Document RZ/T2H and RZ/N2H SoCs
  can: rcar_canfd: Add RZ/T2H support

 .../bindings/net/can/renesas,rcar-canfd.yaml  | 79 +++++++++++++++----
 drivers/net/can/rcar/rcar_canfd.c             | 18 +++++
 2 files changed, 83 insertions(+), 14 deletions(-)

-- 
2.52.0


