Return-Path: <linux-renesas-soc+bounces-16752-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 63086AADFB8
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 May 2025 14:50:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BFF559A4302
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 May 2025 12:50:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 424D0281509;
	Wed,  7 May 2025 12:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="pjSsV5iU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106222135D0
	for <linux-renesas-soc@vger.kernel.org>; Wed,  7 May 2025 12:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746622241; cv=none; b=DB21aqwh7UliWzA9rRRycAFCIoYgQOlwmlleprJswMc3tdDKO+kcHoRhIa20lAgfLBLyX52H48+SGkMeaOTFRfG+1MpX5b5lMvxqERjY8y5Qx0qrb4Xb86z8abnqc3DTsnW4jviZF4wtzZmrI5uwE9bsG3UN6HvGf3l3uPiBhMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746622241; c=relaxed/simple;
	bh=xkWdbiE5pDA61A/wnO9/ukqrTGMw8FiyU8xHAw9+pqU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B95yLkLr/wv+64Ac9SuGaZQqi1rMXvjazf3ikXkYhtgcAmizRKD2oX2Kup90bLXSv4xANS2Nv0zAOhuYRECOt6sKyomBMx6SLTGmMtaoPyuNLjbN072+g8noFNq010f2MfjnlD6jUuzqluyH16gktFGcrQPLawYIsTEFS2RqtMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=pjSsV5iU; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5f3f04b5dbcso10272597a12.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 07 May 2025 05:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1746622236; x=1747227036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9XPB1HGwlRjHpgwyLpPMHl+9QLJ8Tbr4jECS3aE3w44=;
        b=pjSsV5iUQobf14wfsxRugoqmmM9L0ktufS75C8FyrVBg2nbLRRXFEjjAfCY5AkoPwi
         MoOfMqrXqhuH4jPHxb0jPy1T2LV4S4yzfBfv6bDPy55TKBjpygo1Y3+Cf6FvRHnczdWv
         CHG9c8H2QaNY3s0r7vhHTtQrfvWNQvSGiAi7Eib9w+BuYEL0UlGS+hzYuZ9IHVZ7spMy
         ogkWHwe45QBq4iMS4McS6Jv/T4nEiDl+Mw/NmCjN3W/lVvc1hC8bJiKzNVS4X85EZwCY
         nucpSR/E7T6HgZnGVubhLNjlqgbAU/OHJFylT7y38k/4TZHOFbqozrWETj9muPWz3xNo
         W8Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746622236; x=1747227036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9XPB1HGwlRjHpgwyLpPMHl+9QLJ8Tbr4jECS3aE3w44=;
        b=klDNZWltx8o1aLaE+4/415ZLZUalK56iMrYymPX5f/NEfCL/vfaF55kqIOJ2xZXR2Y
         W4O7VRZixnIPVaJRoLeDZIemv9UEBow2v84w8pudaVAjok1bz4qnqkM47pYVsk3Z4JgS
         T21PoahtgU8R8JnXqMZLzmWfYFEyMky2KQkuNULLxZtEpmtntxMdrmeaTYpYQP7we+V9
         luMLJcOTBTSmFjAVePMRQJlVQuYqKL9uEnDaP+HlszBaTWlnT/e8ExKKOE2vCZyZQPv9
         8E7cfsuiQFjGfCLRfsfuQ3kG5JpEmAHuJMjGEkW+XQxpFDv+p4/fZAGh2+TJU0CP8UpU
         yA2g==
X-Forwarded-Encrypted: i=1; AJvYcCUw8RvKkeqLdWR61onKMQfC36RCzQsKaB33sy0guIEFXkRlv0eH8pFjAaWKVDPCBNinpDk0K4qwqVf2udFWkeiUUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1QrKUkfZZ5eN1dRVcoRy1LZUyL8h+iZRpiWyr8fIqG8c6exgH
	ky41tJRrYnbWsIygLYos6QpO9+yZimT93q2wfiiCO0P5DrYodnFRS8N4nQm/QvI=
X-Gm-Gg: ASbGnctImBSAOvcZD36JTgZ5AJJ0zMfeJuM+e7hahJoogaDOA8yMycobcFNni230gxa
	P+6iWPRTFoFXNl0sWKZfXKX7C6KqjR1krNL4ZntQzu8Dnk3K9GrlulhFBkDxqDoIHa9i6jX607m
	MizqO5HqpEwjcAZlJPwl+SBjiNL6BjZJwlcgjEK+us0h9+dusK9cHxlX+f547vSwD0u+wpousch
	0PEV8zTXyfdAGCi0RN+aCKX5dTUr9rKhZy2EMynjWpBVF6Ru62kd2I17TTM2MVtihAcGpBfcbR9
	yjPjLhAQkrAElqilCB6OQy0ex2EpGvfPsvaIFpqpuqs3ahE9MwcHoyid7hp1k5GmuYJS150=
X-Google-Smtp-Source: AGHT+IEnh37YnyS3+S5eif7yK5Fo8gm9rBs01T4L23mUs9FibGROHIlq9N4RPguWur+H1SJaQtg86A==
X-Received: by 2002:a17:907:a4c1:b0:acf:c80d:ad81 with SMTP id a640c23a62f3a-ad1e8d03300mr327007566b.39.1746622236306;
        Wed, 07 May 2025 05:50:36 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.147])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189146fb4sm913182766b.10.2025.05.07.05.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 05:50:35 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: yoshihiro.shimoda.uh@renesas.com,
	vkoul@kernel.org,
	kishon@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	horms+renesas@verge.net.au,
	fabrizio.castro@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH RESEND v3 0/5] phy: renesas: rcar-gen3-usb2: Fixes for Renesas RZ/G3S
Date: Wed,  7 May 2025 15:50:27 +0300
Message-ID: <20250507125032.565017-1-claudiu.beznea.uj@bp.renesas.com>
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

Series add fixes for the Renesas USB2 PHY driver identified while
working on the Renesas RZ/G3S USB support. These changes are
needed for the upcomming RZ/G3S USB support (especially for the
power management support).

Series (with [1] on top) was tested on Renesas RZ/G3S with consecutive
unbind/bind and data transfer tests before/after the unbind/bind.

The unbind/bind was also tested on the devices with the following
device trees but w/o checking the data transfer (as I only had
remote access w/o USB devices connected):
- r8a7742-iwg21d-q7.dts
- r8a7743-iwg20d-q7.dts
- r8a7744-iwg20d-q7.dts
- r8a7745-iwg22d-sodimm.dts
- r8a77470-iwg23s-sbc.dts
- r8a774a1-hihope-rzg2m-ex.dts
- r8a774b1-hihope-rzg2n-ex.dts
- r8a774e1-hihope-rzg2h-ex.dts
- r9a07g043u11-smarc.dts
- r9a07g044c2-smarc.dts
- r9a07g044l2-smarc.dts
- r9a07g054l2-smarc.dts
- r9a07g043f01-smarc.dts

Thank you,
Claudiu Beznea

Changes in v3:
- collected tags
- improve the validation on the code that requests the
  optional IRQ as suggested in the review process

Changes in v2:
- dropped RFT
- collected tags
- fixed checkpatch.pl warnings

[1] https://lore.kernel.org/all/20250219161239.1751756-1-claudiu.beznea.uj@bp.renesas.com/

Claudiu Beznea (5):
  phy: renesas: rcar-gen3-usb2: Fix role detection on unbind/bind
  phy: renesas: rcar-gen3-usb2: Move IRQ request in probe
  phy: renesas: rcar-gen3-usb2: Lock around hardware registers and
    driver data
  phy: renesas: rcar-gen3-usb2: Assert PLL reset on PHY power off
  phy: renesas: rcar-gen3-usb2: Set timing registers only once

 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 135 +++++++++++++----------
 1 file changed, 75 insertions(+), 60 deletions(-)

-- 
2.43.0


