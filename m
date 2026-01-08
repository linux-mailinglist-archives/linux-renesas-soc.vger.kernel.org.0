Return-Path: <linux-renesas-soc+bounces-26414-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E9174D02D40
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 08 Jan 2026 14:03:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6157030024C8
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jan 2026 13:03:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6932B4F2F80;
	Thu,  8 Jan 2026 12:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YBm0FK7n"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94BA54F29A6
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Jan 2026 12:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767875679; cv=none; b=Q7H0ZT7/M/BHQ0854mxtv2OXqIfsT8GKTYACtqeQNdOlo3qk6XS9ZaACsOjCGwzvQ2N9oKEKf3pT/+nEKz4Je/wXTaFcuH2EklOmHaf0vfOzthjs8Y3jncIzZpzHEo6kTEcXQGgjZ//NE4wDC44hIJTVdYEra4irZLoc2ZXl1A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767875679; c=relaxed/simple;
	bh=F1x0vYfegBL7n3iJichIb1PGAil9viNpxvOdcjfDOjY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=liUn3u3eaOrtbqew4zzp+XsWCizmHm1M9HBTmnuE1Jb5Zqf4c4rSpO115hJPWyUIMJlZ82nAmK/vm08pcs/vX7jb522I7prJ2yVwhgAYub1/peeKDwnMBKzuK37MOR5mo46y0BiHrEM/J0NRJNWmzGobZwJSeZZlE77Q5GBNNIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YBm0FK7n; arc=none smtp.client-ip=209.85.218.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f68.google.com with SMTP id a640c23a62f3a-b7ffbf4284dso457450866b.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 04:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767875676; x=1768480476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QxA3rCi4n4Zd11T4YjtWJ+fLfFPU0EDYmXEJgipwb9E=;
        b=YBm0FK7nhFpRjm14qR7F9a3mNpJpnA8FH8kueIg4n6zYlybC3DCkLmjJCl5xR1o4U/
         lqW/kNaWnsjTuSd04FGdK0RHZMNdnQUj45ixrJXrN7Wp8C+pzoWBwYMc1BLp41YBDziQ
         AZkU1jQPMZYIqAbsauPWENFFBQl6sPKR68cIza7LtNc+sNMFLJvNGnVIEFIF+BMweJm/
         vbyL2a/0mT+MR+e2aShGCzzjovXoWDD4LyvDmG7bWipJ2ewvH4cnzxPsdyu7otkjMij1
         moZSDnXPY0sjILrSQZIHKlN+KQWBjmHaMz9ok9KdgvFP57C3N60PsZH4yAPnnORhI9Le
         D6uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767875676; x=1768480476;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QxA3rCi4n4Zd11T4YjtWJ+fLfFPU0EDYmXEJgipwb9E=;
        b=nMybvCVPJufNmy957fcBeO5lb8LTarfXyIsTp8Pa3w21qOSwchrkmor2nXFKlFgkq9
         dL5CLfAwwLTGX1m5UsGKbQxyu0XaJFvDLSnchMeaqIELyvGTDmO5q/eUQPYX8uZH3mNI
         678yNMBuLWbtY5x9ajr4FjXxdiLTTzOnrNk3gBDcH8DdPgeUTBBJ5BVw9sCtomfYVQCt
         FoFbF3+b84NujarZOe40tYsD9xRFojer16pAyRVo3whZyOvldOI6MTe+o2L/04KgPDLS
         W6i+uT+ve2p7Bp5OSU8lTkbcrlBVxv0x/JaZwt3oF/iNrMgyEc2PqjuUNOkEy50TjdpT
         vjRw==
X-Forwarded-Encrypted: i=1; AJvYcCWGnUT75SyyBJPm+b9RICq2RcB5GUUK05AFvT8K1Qk6pLPHjlC+soVZCwoOFdPOqEVnxE4v1qrZOkThJ97W7uQAkA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8v0UsYcDFdbB7lKzh1rnHOKPf7mpY+HFfqP7gr2v4311sT7Cd
	HIRccE59hggnamAOAQ4bS78slIXkotbN+FE3C+XNjJly8Pkym1Wmp/e+
X-Gm-Gg: AY/fxX7Dgi2jognUy9dynoZKXg89EO7WR8+CE5WubW6wp2HK+Ubkt4wSQWUtPZ30wVi
	3OZrkdvpM2h0SCiaTvv/nFc2YzgRcIQXxVq/6lihXB7jC+wZXMwPzSnwRk7+nkuIeS6qUKpjfpH
	oFeEld2dFJzQY2oK4sdUuTgG0r1RM2Z8JeJuSpiZWzI7HWNjwGlfa9wm2I9Y7otehtoSSAh/ZlS
	rV6xZjNhF8UvtcPIj9jX9df7syP8d2if9V+Clni0fGXKb9OFAc33HAF1+7FFs0qD75GOi823SJd
	Su9YnH3Dr3jXDtAk9muWPc8KDEkNx8wNaa/ryGnlnHVt4EFUQ5sTla2BGKiyRe8DQkY80jCAX8B
	Jj8oF4xcRYRi1IXicrtYpyV9EZ5alww1x5LX68NE/Ny+/9h2i3G3c1MISeDHCjRdv/+P6T9iVkp
	cAQIMyW4kDBczBnMybqRRZc6SZZmF9HLIqVTs=
X-Google-Smtp-Source: AGHT+IGDYWBzdLP3GPBfT4boWtLi0Nz7sIczo+oyRUwJh3nn+ZhSgyvvzjobNVrE7I2+mIZQNWdOhg==
X-Received: by 2002:a17:906:6a1b:b0:b83:3294:af63 with SMTP id a640c23a62f3a-b8445031bd4mr517614466b.1.1767875675518;
        Thu, 08 Jan 2026 04:34:35 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:a172:15fe:21c8:edf5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a56db21sm780412166b.71.2026.01.08.04.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 04:34:35 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 0/2] clk: renesas: rz{g2l,v2h}: Deassert reset on assert timeout
Date: Thu,  8 Jan 2026 12:34:26 +0000
Message-ID: <20260108123433.104464-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

If the assert() fails due to timeout error, set the reset register bit
back to deasserted state. This change is needed especially for handling
assert error in suspend() callback that expect the device to be in
operational state in case of failure.

Ref:
[1] https://lore.kernel.org/all/b417865397822176e83bca6b9d8094fe92ff2451.camel@pengutronix.de/

v1->v2:
 * Added the variable "mon" and used in readl_poll_timeout_atomic()
   instead of reusing "value".
 * Dropped the assert check in error path and simplified value using xor.
 * Added Rb tag from Geert.

Biju Das (2):
  clk: renesas: rzg2l: Deassert reset on assert timeout
  clk: renesas: rzv2h: Deassert reset on assert timeout

 drivers/clk/renesas/rzg2l-cpg.c | 9 +++++----
 drivers/clk/renesas/rzv2h-cpg.c | 9 +++++----
 2 files changed, 10 insertions(+), 8 deletions(-)

-- 
2.43.0


