Return-Path: <linux-renesas-soc+bounces-25644-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D67CACD51
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Dec 2025 11:15:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 150873002607
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Dec 2025 10:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82B3A30FF10;
	Mon,  8 Dec 2025 10:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="abb7oYgU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B8A30F7E9
	for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Dec 2025 10:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765188845; cv=none; b=P3592mwUyWP65NYQ4RjgkSqixkRF4F6fiAHle3OdV/iSqJxBTiTYD0V8beg+yevogHYSEVbJzF/TY08DpVSR/Gp9AX3HM/B2mB0D2PKFhEOtKhlCNdXyZCsB1un6H7nx0tZN9Ncdst5hyPb5yzmjZyBb4wiFLukxL1J3Fh3Hcmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765188845; c=relaxed/simple;
	bh=OGUGoktCxv+0k4ONqo1t/yzLSpibAYrMGksQDCiuiag=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hKhvhOkw5p5s4J2DVBhuo2OxFQJ9S56STEawGgOUIKUMh4I1GqTqETPlXhb9tIP9MHU+hsm376xIBAeCWzZiihhCTc9LlGDwNGp9CNPNHNvIpa170cBOpauNzO1XFLIGsjS7J2l9S1ziOt7IIVcNXGDYv8vMcdmgNVCJRG3IY2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=abb7oYgU; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-645a13e2b17so6059456a12.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Dec 2025 02:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765188839; x=1765793639; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jrsDhKmOIR7ug90SqQaxVq0POQHtj2Sf0DAiQ8VB8DI=;
        b=abb7oYgUM3gjNdwDphwx0AO0zVm3y4GnghQkL5QgC38usakCoqVvqGcr6PyG3rmm/q
         L51uiKUQnizzYdJR7upjrP49FbGT4MDqZ9Nd+fByKNpHr161UjsNNBjOfQRZDj5mQVNs
         LK2jltdDxUjK1tyxXH6+AZnwclCCfhjjj7TkMS2TLVX9imWt/dxtfDR551L8SwGWciQX
         00RO/1V9Z154Kx5ZO6TB8f0IUEjuCDbXpYRq98cqG2IjxfoFQC+fDWVM6lu9JciZdoHA
         B5rFtDLgF525AfYN5RiqsPgAbk4ruPr7qKryDxBD0MJI73ybjUGZg4EEkXEIGcR0Jmo7
         NMYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765188839; x=1765793639;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jrsDhKmOIR7ug90SqQaxVq0POQHtj2Sf0DAiQ8VB8DI=;
        b=CCeoABCzOdUBPmusRiLdjge4a+UMjPbIFIEmZGg2ccTQKqSmLrZ01M3w2nZ8GJ7x+Z
         ntYY4+eNj0UrdmrU3CDZHfsN5e61LphRk0pOXoWUyloscJG30TKvIO0V+r75FxP1TwUA
         i2EDl7vN4+6YtilxJNxZZrbnARc4ZSF22afwDVM/1SM+uhGypYGb7RJOrN3NbNgI32rR
         RYLzHbcIv+zCDrlAJCDJ8W5wlxCOjmWlNGMHif0nt3fOTCasU3Arzsl0PD1BxjTRWYUI
         waud4WvwFqyO72Z7F8c39wXW+uSLrKON1uj6f5X1TUTIGwxYEaWrCvqbbIPRxEAEBa56
         lWTg==
X-Forwarded-Encrypted: i=1; AJvYcCXOv/cNjzVPAAQtRYM+PFj0jngLdqxWP+cEAwbeHuMQ0lq3YDFgFYD8jTx3y68E1lga8/cusPrpBx8u9uOWFJcT1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YztQTQMnnCHDa7hRZojCf3FeiEne75sEn6/myi5C00PSEj/J+1h
	PLNNEiw6wx+vj6UK2NI7p5mHqI+8npzBCZXriewtp1diHsTaA2u1uYfSHqEt4g==
X-Gm-Gg: ASbGncs1j9XAc3ufVJm7gG4hiVm7hL9r+OjevsfArgSHINu3UWzmJp4aMXHM00cdO4R
	qb8Trh4wh2oRUA3CwsC88KeKiZTwtGUP+j9Bxp10kDDzD39v1JEjdfVvx2kP7o5krazmWDU0FoX
	9+qKTXd/+cdDWLtqpSdowQwkHs/QPD/ziu0PM/5tJwLxSWKMvePnDgL0G0xG8dj5m+LwigJyqc8
	mGPaJheujPxf8CsmoLrJ2AkbNMpntLIVicc+2kfHQS3MTW3DCe8mEPP1VyCsNy4V5HEDmvWi2ti
	GGjDmCBxCUIQamUGIZWM21kOiCTsXN2kd9vOFgWqOJ0s4Hc4cDBPzb85sMqbqNHVvowVd50nYBW
	xBiLc7d6MfAa6F8lWAoIap28JCSmr2p84VAxcYo1TEdFFSX4jb1rUSYl+COmwyUKqHFgDbPq+Vd
	gUFyvvGHBHhAngsDkfNh8LKOlJHvPJ9mP/xnZAh+6RZbyVFKf5+spZelJcI386DP22O8T3n/S8D
	ztY9l8VviQvJQNgpHQwV4Qic7c=
X-Google-Smtp-Source: AGHT+IH2rD/pn61Su/h9KiPu4oiF4zA/ByyzaA9JgtRUgkihMJUMRcUEh402amntg+HsE8+/LFj8fg==
X-Received: by 2002:a05:6402:4403:b0:647:8538:fcf4 with SMTP id 4fb4d7f45d1cf-64919c10408mr6355625a12.10.1765188839288;
        Mon, 08 Dec 2025 02:13:59 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b413b590sm10547083a12.35.2025.12.08.02.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 02:13:59 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 0/2] clk: renesas: rz{g2l,v2h}: Deassert reset on assert timeout
Date: Mon,  8 Dec 2025 10:13:32 +0000
Message-ID: <20251208101356.101379-1-biju.das.jz@bp.renesas.com>
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

Biju Das (2):
  clk: renesas: rzg2l: Deassert reset on assert timeout
  clk: renesas: rzv2h: Deassert reset on assert timeout

 drivers/clk/renesas/rzg2l-cpg.c | 5 ++++-
 drivers/clk/renesas/rzv2h-cpg.c | 5 ++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

-- 
2.43.0


