Return-Path: <linux-renesas-soc+bounces-25600-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5AACA75BC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Dec 2025 12:24:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E66E13013E84
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Dec 2025 11:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77FDB322557;
	Fri,  5 Dec 2025 11:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="aQKljUeY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBC02E542B
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Dec 2025 11:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764933892; cv=none; b=GkOcYorp6ObD4SFOAUphzF54807xbsRta6iieJbKYnCq2afVxtf1uCUV/hlZjNf0Xh5fYZ3xKAiuI9pkPyyc/IX2C78nhizLRpa9P8i181DoZghxwmAVZTlzDRjqQVDa5xnaHqfj+cZtJGhP22NY5ESEFvg1Vu7LrAdnhDVIFbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764933892; c=relaxed/simple;
	bh=7mvPTtAkxGch/589grpI4OSJ06JNoaZrJlWD5ezBPYw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cLuZnGcQgGfxuGm5i8TgafecgvosbJciXV4DIp976H4zGoLtCdc1tuXcmkbzk+Skl5jiC+ED42RN5eWoQsVqWtLRVr9ZExBUv7RMSKGxsajsNE8//whqqIEZBqkc8LSr6h1slcJDsstgQFGo2EVYxOSk2cfZcDoDV/Xx69VHH8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=aQKljUeY; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso25629055e9.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 05 Dec 2025 03:24:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1764933887; x=1765538687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p+uaOHWzNRe+p5LocFUj4Ghbmcl+3sN5RqjgY7tb7wc=;
        b=aQKljUeYj8vMlq3T5b4GqwDrJDIx2/SFwTlCzIw+BKGZq1/JbZehFnIbQpLnZr9Pb2
         cQLD5xquBhE7hPMZaV13KnRe/ttFaP7S6gp6+iKQjwO53PbxU9uuFUxWDNpAAS/XplLt
         /VqmzIPJ1Kt9BEiyJRrmW2hkJw4WdsCXUiOdL1NpQMDBwcxpG+vWbFlfbgjXkeUyaP7l
         eTZBAV+BYLF1g8g+SIcoUhJM4qr69cGu1RJZYbvHvGwarSWlUal1vm2qdClO4P9jUKtZ
         T6FSysXKChfzaay2mykObTiFw5oYGqbkmCP4nyEaVAJBBTzLlQI9c79LMv8t/2qgfrj4
         V+PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764933887; x=1765538687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p+uaOHWzNRe+p5LocFUj4Ghbmcl+3sN5RqjgY7tb7wc=;
        b=d+4MlPXBbw1TSsjCAMutO6iFl9cvxN9uqmKZfYlicSfVeo5SXQs9v2wnXCRsqk3lcU
         /KqJ+Q30gqvWV1Jfe7ONNBpUBFQzlUaqIyKkekKjdbXLm8zpszhpXAWsqpo2Eg4GpRwo
         /8+gt9oJRixoyZ5tBDdKaZhTmv9aX/sHx/KAcABYTgBoNVI+fP/9V/6CwXy1wqiu0Gio
         CMAnVw6dv7gXLcm8HWJVwC0PJt03/QeuRp9Kf3SbVKF9iNXscNtuqDjCt7bzWGHnGCer
         MPddAIOglpDbFoMxoyAMtSMxnwKVwrBEB/FlXFyfa5LrwNXAPHDjrda26MjJvVos/dHm
         ZfUA==
X-Forwarded-Encrypted: i=1; AJvYcCV68ntoHsy+KAH9kywF9uHTUjJG5saYr/ostlXkYpYXsCTTiDy4edNX6ZTFXshucUR0RXmzZmWB0XWaM09RuJKfJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAs77D/WyYLXIZTzqcSIMCTGaOcQaNcbMaXBwojhHFcohONoWq
	NLPqbarmeTkebAboBS3WFpVKlvvy3q2Cuqu5L6f6HIEOLi1c3Pc+pmOl0I5zFCouFHs=
X-Gm-Gg: ASbGncu170qZW/nZKyyD0JCHJWmayRabkYuXjVLxjawg6SdHS0lN1UZGUGQRc8IjDaG
	3GrI588V7IuBvE4P1hRGgcuJHVW9ZpBXvj2TqHUaZnrcjTNXeYHJISUV3K2in7h7eJBo6QQ14Jb
	57tqjvzlMPwa1UcMLa4BqhXz6PCDFmnuOs5gJGiAz9NCcy12dSwWhPymRwaR3c+IgIROIWXVkxj
	wuU2TRimf0jEmZUj1bK0NSG8/JphxE1g65qmyto+jURfSOs6tW4R9KdwewegxLGnoMoaM860N64
	LY3ST74dGb4vz63XNwjnBSMpE2ID1CRg5v6qZLDv8bF231E673tsf83vSWp6nCGQnNPNl0Nvm7o
	fa47u7bPbYcE/G0L2GLAWGQp+6ncTmZtjakSEGGn0f3UTFnosX/isB8PNTzNqyposGomCMRC2Rx
	28V5DNlHflIf7FkywNGKPTqGauqFxV8Ca2yf4ajAAp
X-Google-Smtp-Source: AGHT+IEop5yf/enJbkcuIAAdW/2CeTmAvsqsHkxaqBz1Tg1XGRKj0gw2WAKsuQEoDfx+YIrCtjBn2w==
X-Received: by 2002:a05:600c:3b22:b0:479:1ac2:f9b8 with SMTP id 5b1f17b1804b1-4792af2fe93mr95141625e9.21.1764933887118;
        Fri, 05 Dec 2025 03:24:47 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479310a6d9dsm78176435e9.2.2025.12.05.03.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 03:24:46 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 0/2] PCI: rzg3s-host: Cleanups
Date: Fri,  5 Dec 2025 13:24:41 +0200
Message-ID: <20251205112443.1408518-1-claudiu.beznea.uj@bp.renesas.com>
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

Series adds cleanups for the Renesas RZ/G3S host controller driver
as discussed in [1].

Thank you,
Claudiu

[1] https://lore.kernel.org/all/20251125183754.GA2755815@bhelgaas/

Claudiu Beznea (2):
  PCI: rzg3s-host: Use pci_generic_config_write() for the root bus
  PCI: rzg3s-host: Drop the lock on RZG3S_PCI_MSIRS and
    RZG3S_PCI_PINTRCVIS

 drivers/pci/controller/pcie-rzg3s-host.c | 34 +++++-------------------
 1 file changed, 7 insertions(+), 27 deletions(-)

-- 
2.43.0


