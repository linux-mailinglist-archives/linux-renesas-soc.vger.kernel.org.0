Return-Path: <linux-renesas-soc+bounces-24406-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E834BC46E61
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 14:31:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9267F3B6396
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 13:27:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F04473112C9;
	Mon, 10 Nov 2025 13:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="P3CjxPc8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A223101C5
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Nov 2025 13:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762781246; cv=none; b=kvYe2PLKDxF2yBzdc9n/IAfS4mFbOpcSdLJRoRyafUTWNYt/E/MvfDkeG84UgwYL4pmIpcuRW62BsHQOa2O8fU1zfRBe/2GW6Pq394YFltMxe9sY/WENWDmzdJpr4W/e+xYJaFQ9Y1kQp84hqAWpvp/BFQbb1oCF+UOSP6ta0hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762781246; c=relaxed/simple;
	bh=Njp1OFTuz9utdC2qL/d8X0rZRq/nM4HD99+auXVWGJM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nqdGN2216vl07tdfLjGSS5L5B4EE0jMOcTY6fpUhnfTOzGiALP0hP35UGZNnfrjvwUC4MAzV59II3ZldJWGGwSBKlPmWHiC8DmcplHEtHvLzzvySlu0jE/mpqC5JdAIoZLCbpvURUWQBRflowH9DSXoBr2uB+vfdMQXehTDNVMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=P3CjxPc8; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-471191ac79dso31760475e9.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Nov 2025 05:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1762781242; x=1763386042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hDSYeqhLqgZ1KCbw764tGpkRpKz9b+tHmjUhRyEtv94=;
        b=P3CjxPc89Dq5Fgx9OZEIy1V8mWUOtnFxYfdia1KNR1cY5LIItlzV/Oka1cKY/tSnKK
         D6jLZy+ORqGejWgGBUlAhJTeVvKrjAoS+F/TMktLDYB509mAIKuFZe/mwIc1Zwq+BvtK
         4Mr4bmuhOq+rd6X6h4/LFjvFOsd9xgG/PkX6soVkCDGaGuuxjLYp26TdGV9qtnmhM9E7
         SvTb1yIC8VddkQWqKTfKNT6bAGWuJnqRLR7Bj2aNK0uFKaBx9Js9R2/fYnFZhrA7ZPi7
         qkgJelDy5B2wUCveKxMiEST0+PZ0n6eoTbBfeal16zXbVlvjNa1cd3v2QsWCypAu9FRl
         AaVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762781242; x=1763386042;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hDSYeqhLqgZ1KCbw764tGpkRpKz9b+tHmjUhRyEtv94=;
        b=m44Og+T3wtpiagndpR2lN87uzEIFEUs9sExyy5eTK5BNriaFsoAzeNF3PNYHXgyh5Z
         Pd+RcJno2/BAqOYqsS3yH3cVFcmj2IAG5BREYm/T4hBPuOWY34WKE9iKQLPDA8Y9k4X3
         NJvme45W2h2xmsmIguxbhBEDQcmEV5ICXj2nu6o8pZYVsDdtZRk2RJY8p4aTkqm28n4g
         3rNg/y2NeCQkt+/Eh/HVh3h5/sj5m2SqlsBmGMBHwCJtWBGjgg9VsYwRXJfK9r5F1ePL
         u0h8+Pl3EUPyM1XvzfSOC9d4Myy+owyTvnRYC+a8uoCm+QrnQiV/Od40xe1+IwKTIuKL
         9UOw==
X-Forwarded-Encrypted: i=1; AJvYcCXJiaHiYAjZlZ0so1v/kDkZmSdtyc3KY3Jfu3nLBmHIbJVT4JT7jeBTrP4cKI2127mIxSB5wCDZSH2rVpEWZsDMpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwI6wVt2UKp4m3xL4S0CtgCm9H6HOXndMPVLncJf+agePoE/Bji
	cfNJ/z1npnCNKNaFeZ+TLIqWCdyHtXFymLxRC1NMXjZnG+aiiwjzcYYTc1iGaIWmnvk=
X-Gm-Gg: ASbGncshSQjTPVj1xixhx8PrArlUS78JV+t9/WfXGnerwIlRY4pxdHmdqbl4LEuemct
	iDU9NYgiXuZ8OLgoshr1NQLBRgQOKJ8X20nY87zUTBS0BIdiE+jFF9iX8vrs0N2IT7MhyCYCv8z
	8ItDdtB1DXZl+4TJ5/jKAOXgPnE4PqltNOBvTIEHnxeE1BLtspLdgWHPK2Bkr4jzcPypUT8rXCq
	tXkoqXGxyQ7o7ZHlFi0L0FUtSw4/uS+ZP2z03ij35bCxZwfT3hCSS27k4/wENEa7gBITqvP17j5
	O2ORQ+lJSty38Ds4nBKjAkIeT+VSVZOcOaPvaANg3jS+cfLqZ9dOLarx7QDnDsgawt5ktsyQjEt
	WZBZ6amKp2sh0vNFvDiJwwDCKtm6Z+KFEea8lAnlK7i2rqYhpgtEXift8nihoOvmxmqPT40onqj
	PYRUy6br2lcHK8rjp2oXsT7+UzbjUKWg==
X-Google-Smtp-Source: AGHT+IE3xQKg+Mx3z2Jr4LgMiTiQav2Kn2t8JoLdkI/zvAlaZgGcoXnHD7GN7fbZn7l92N4WUe1ztg==
X-Received: by 2002:a05:600c:a6a6:b0:477:79cf:89d4 with SMTP id 5b1f17b1804b1-47779cf8b43mr32595975e9.31.1762781241703;
        Mon, 10 Nov 2025 05:27:21 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47778daf2c3sm94207025e9.10.2025.11.10.05.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 05:27:21 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 0/2] reset: rzg2l-usbphy-ctrl: Add suspend to RAM support
Date: Mon, 10 Nov 2025 15:27:13 +0200
Message-ID: <20251110132715.724084-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

Series adds suspend to RAM support to the rzg2l-usbphy-ctrl driver.
Patch 1/2 is a preparatory change to avoid suppressing any
configuration errors.

Thank you,
Claudiu

Changes in v2:
- use pm_runtime_put_sync() in patch 2/2
- collected tags

Claudiu Beznea (2):
  reset: rzg2l-usbphy-ctrl: Propagate the return value of
    regmap_field_update_bits()
  reset: rzg2l-usbphy-ctrl: Add suspend/resume support

 drivers/reset/reset-rzg2l-usbphy-ctrl.c | 105 +++++++++++++++++++-----
 1 file changed, 86 insertions(+), 19 deletions(-)

-- 
2.43.0


