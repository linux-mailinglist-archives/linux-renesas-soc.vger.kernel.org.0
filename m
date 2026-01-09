Return-Path: <linux-renesas-soc+bounces-26522-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE677D0AA83
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 09 Jan 2026 15:37:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DDD0430019CC
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Jan 2026 14:37:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC8B435FF62;
	Fri,  9 Jan 2026 14:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="K42c3wz1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC0835FF70
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Jan 2026 14:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767969428; cv=none; b=TTnho8nS2lfi/nAdq52jPdOQRi6eSYIdTqyYuUko6LZRcIAbRPpUrxlA30tUVbqf8VFfLde1CFXVXmijN6Thzw5g+R7I+j++xnNx4aRGJ+xQqsIIDprMKo5vDwBuvRsmEirjBSN7RauLi5m2es11b+u2Z0vKziV15MIZEy63JIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767969428; c=relaxed/simple;
	bh=D1XOT7NKKQDaFQmeeeA0VXyv5a+xr+BZNsKGEGE/a84=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fzMOt5V0t+USq1jxajTTDf3aJ0UrHRSklxnBJTfTLd6kwyXINo4o9mGSYzuWJskCwAIAgJXgu5/2JSyHbxzpMf8x+PfLOK3250x0ItYW5Yg+myVUtvMOY9gphv2mHadj/oKRRGODX9SRfDehbjgSwH4DizSFrMLs+rLhcoaM6NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=K42c3wz1; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47a95efd2ceso39029775e9.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Jan 2026 06:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1767969423; x=1768574223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FqXhRhhCax8vaDV4bcsLu2/vIHeOI6+rosJU7zJmBPs=;
        b=K42c3wz10nQmOc8XTjk/EEEcaVxDVKTE5HwvbJ5wgvD+xZyioc8BqxQsZQ+FZHbFla
         bYCxKCeAL6u7AKBHBhMZb1w1bviPoQeCwjvwsW6Yx0Sz9VQV2uTl4ulqtJZghTc/tVIl
         0+UkgGIniqZtL3HGlpdN63F2J3n7hXbgN2wV5nSCiuL0jkma6eSpZc51vtmcVXtq3Az4
         YVgmIsX9zMkRMI3r152LUi32LamAh/jwl928AMuzGPMNzdTx7oNt3HJ3401N9wxI7PDl
         8AuAy//n5QpvA7r01lM0YSKQcUvI3VlBq22AD+QQX8rIxIIl+3Zb4CkvD+C0ioDRok2D
         NVsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767969423; x=1768574223;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FqXhRhhCax8vaDV4bcsLu2/vIHeOI6+rosJU7zJmBPs=;
        b=KOlFN35CSEzZgDlJdEb8QR/qgVhhIepzETqbqsiBrx7Nyz0F4IcSKr/jyEI6AXwd/c
         LQHnyubZosdjl3RgiRJdidU9/WRg62eNWviJRxTlu78CEB3/L/mORnBzK9R61nepKWF3
         Vr0zqvh+3wD0f6J4b5ACnNU8pFherJCZZAoqrj1Dn+OSxYmD+0HqhXIRy7pVODiRY0VX
         /fNjFALABCViZVV1Y8iDy+40qijpqYkF2fywhqeRM3NLdhe4CrTRB8SQfJWlHdjPHwwr
         TTLalNeaKxTlpXVVcDGL25QrP/gTQxnyXdSyTwC7GzLwtb6ZiuzSSkTc1TmwRDcKBP+E
         vFkA==
X-Forwarded-Encrypted: i=1; AJvYcCXfse8iVX7BTrOcnbBmOy3DTgo9IVm2vLzBigNDPcbC5HiTtlE5zi2aJYyATJckxVbMADaZhzxF6+4rIDJzeoMMRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVKh2cq4EmMQkBDZsNHgSgIb9Rc4NBhgvKtFqN32DtgcUJL/ZL
	rAiHkQaFW4AfHN86dr+TjaT9OGremsRDG6qWDQGImPPS8/w8Ti09+KYINNfqMzZw2kw=
X-Gm-Gg: AY/fxX7bu28JlJ+FBSR3NiyHwEyUxDJqefwAGWpnFbBtizFnOvimthq9O6gNgRYgC1a
	oO77C2ZNXxS/JmsPsH0wfZVoFfa68L7BgH1HvGjdss+Yt8uF9t4rMl+qy9GkFvugAbbclkYMh04
	CJ/pKXSMTuqvcgMqWZTIGuVx+dXoRmHh7/H3URvV4K11DvXFjS9vOJTHVMwGVOf9MWi6a7Ow+d0
	52QzaDy3JJyCzB+PaNux+Y075rbS62y646VFTp9549OTSBTeLXYpvCqKaMOWlqs+aoVV2EbXGZH
	HKqSHbe9ukrmYsqfYo0GeFXAkoCtDsjkuDaECY/AD60RJ7WY2H9WEytGN6Z1yolexgVES84b43c
	Ci1ckC9xgvY3wqj74XI/JvtuMjfSiNRDjbarhVz8YZR7qYdIAki/4FB4W83iQxMOVbTHHOivqux
	FTp56e+SvpJ+rLp4MWVrapWZsHwtpNBPRdOkcgqlo=
X-Google-Smtp-Source: AGHT+IFZF+7StIVqGilXpwdoxOvWN3qNDikJVv4IQeBtTM8G79k1WXQB7YixhP0IkWC29Vxmoa5HOA==
X-Received: by 2002:a05:600c:1d04:b0:46e:35a0:3587 with SMTP id 5b1f17b1804b1-47d84b3a06fmr126595565e9.27.1767969422431;
        Fri, 09 Jan 2026 06:37:02 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e17aasm23197216f8f.15.2026.01.09.06.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 06:37:01 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 0/2] reset: rzg2l-usbphy-ctrl: Add suspend to RAM support
Date: Fri,  9 Jan 2026 16:36:57 +0200
Message-ID: <20260109143659.817797-1-claudiu.beznea.uj@bp.renesas.com>
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

Changes in v4:
- warn when suspending with resets de-asserted
- collected tags

Changes in v3:
- collected tags

Changes in v2:
- use pm_runtime_put_sync() in patch 2/2
- collected tags

Claudiu Beznea (2):
  reset: rzg2l-usbphy-ctrl: Propagate the return value of
    regmap_field_update_bits()
  reset: rzg2l-usbphy-ctrl: Add suspend/resume support

 drivers/reset/reset-rzg2l-usbphy-ctrl.c | 110 ++++++++++++++++++++----
 1 file changed, 91 insertions(+), 19 deletions(-)

-- 
2.43.0


