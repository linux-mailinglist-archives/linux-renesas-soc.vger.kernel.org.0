Return-Path: <linux-renesas-soc+bounces-25634-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F3DCAB4E7
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 07 Dec 2025 13:49:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 57AC43060A55
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  7 Dec 2025 12:49:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CF7B2ED866;
	Sun,  7 Dec 2025 12:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K/p2mTnO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD92B2D481F
	for <linux-renesas-soc@vger.kernel.org>; Sun,  7 Dec 2025 12:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765111760; cv=none; b=crwGHP44bJMm6btFobSE1IrFGlKxUqaLNqgM9cvyhCsr2mFm3ynx24dfaGBo7eX0HbIOGqeHNtnnxPJirtpmhCi/0CrdXn+/RW8AsfANgAGYJ3HCtKnEQe+V/uRKqfhdw33bq5d3VbvlA3aghJKAoeMZqUhma7kBNQWkH9uw/i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765111760; c=relaxed/simple;
	bh=bQFpEG3o9LQ536f6JxBdq8z7Y1JAJhEjOJQfUO1giYg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FC4Vr8g3XpmorkQ7WfvIHUSOrs2RtVRtSRATaS41vtPYtQ8cHKD6AEWHHfzY4Xugmh38ORXd2tERugAJ6LSiLN+aB/s/wCx8yMbcs5R8KJIhrSpgCjGjAvzwkJRHnXSZAeVuKAzv+T+6FFka3uH2lF6wwWt5UFiamkQHTkwBQ3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K/p2mTnO; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b727f452fffso611764666b.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 07 Dec 2025 04:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765111757; x=1765716557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v+8cllFdmmZn50x4l8XYZK9RXQXxmWBAkLfGXs7iEf0=;
        b=K/p2mTnOjDFUbX8/I2xpJm10EtLnLD8QLDQvtpy8kyIhN4Ejetp8vQF8g22nI/Plhj
         SeZ2TPtUYVjktIIC8GNr4bbUe11bcxCSHrIadLm4dYu2jx808hzOtw7O0twqYqsTPDPs
         p3mY6tU/OSl1kZMgEIm2lkLRncky9bf24MSpRZPmJ1DG/bUyUWAhUQq6ImTlNF4OFH0W
         Bmo+6ej4h8lDxUt0REVbr/Xvu1e1rUBNhnOLnxaw0XkS3rHuS1D5Sp2KFs44hRCK+rCF
         bWxLFU2KHGuohLT2rQxKTOq7IoA/n8JGlpDH59FpIrvrsCSdV+s+KQPii7RvOJ+G/2/1
         ES0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765111757; x=1765716557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v+8cllFdmmZn50x4l8XYZK9RXQXxmWBAkLfGXs7iEf0=;
        b=qmmAaTAIr03ICqH3N3tXNHP9R+fMo+ODUQcL35sWoWlhAEkAEVDmZ2ow/D7XzlRTlt
         Icuq8tX9gSjMnrkgsDhc8w3GK9Bvy8gaOmir+kWo+BbFo8nnWWa4HJKrkdK/0Dr2piSU
         un9MSJw/vk9JqVD/9pI0nZx6rCJF1df1jwwuDQUztutK9sl9bgygqtdjpI/FICHwuZbT
         K2C8Ij/ObkTynv5m4oKddma/hqqJOzCC1tQ+B6AQW0AR/f5TTNQBbLa2gVX625mP1Ncs
         ENV33yWgu+cKD3pnZWsFjuqsCyYVhL9bVkApdJi/8XV0kO8Hjx9tizWEOhrhYseqcGnL
         2yBg==
X-Forwarded-Encrypted: i=1; AJvYcCXb1I9Ew0G8HzsASctmxvVERpAx8kZZG3hzVdyZkJGcy4EWzxM4KoUJFkaKDyN/SHLWd0WYm7a/v9NxbXAvrjjjHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyywMzIVUe/vy8xDspKHvlpHRawav00GYwYqV3kMxCQM87+hkpI
	lCIy8X9u5nJ4tOs9coi/ThhVw/obeyaEJZPgQa133PTt9Kd/mnIyGhIS
X-Gm-Gg: ASbGncsgtpvBEjFwN0YoSXKsx7ON70IYKJB0fKWkr+vBnf6ae+YBCTyzo4+GFMmIIFi
	d0g5ZpBSULgozScN82VXYJBz3VUk35rIelwTlw6L5bqEuapI6lmhovCwa/suglaJmUTZOrfxbj/
	OnTFZAhICjvVJExRXW2aKoIdSFrAknE1YkDT9Tn56TU5LRO5JlIVTsKSS5SKd68NefhocT50JmC
	EEFhWRT/DDnlgN7CndttiOHHHUJIyItGX3NHp33IPl3ahEJtf3KWHL/xinUysz+3Ux71klXOs9e
	uhX15Hs6p00XjHrGKGyEukmN57kX/QpDHDjghZBqnmiVXmxS+3sQSpcNk3wl6cqoOrS0r9wQApT
	BRKiGpyXpvrKqLpCTqK5dWMbAzDuUslHMBMkO6Xejx1c7Xg8HPXg7ro1TVVUvfRBkouCWDaz5eu
	W+YIHzG8oCQBMU+hNT++3QfJi8iZgQ67xc5e1j4lgTvpCMxeiLCcL+2vWQ+54C49bV6jVfnNIdu
	E/Pj1hOgeH35oYw
X-Google-Smtp-Source: AGHT+IE8fOENHVwPtQI3pGjpRrNOqeblBeyp2cP1u+Su1TipXnFYjjo9bgkVLkCyRo2mgZyc5c7Cfw==
X-Received: by 2002:a17:907:3f8e:b0:b71:60a3:a8b9 with SMTP id a640c23a62f3a-b7a23b7f165mr540412066b.29.1765111756891;
        Sun, 07 Dec 2025 04:49:16 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f445967fsm848078366b.10.2025.12.07.04.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Dec 2025 04:49:16 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/2] usb: host: ohci-platform: Drop ohci_resume from ohci_platform_suspend()
Date: Sun,  7 Dec 2025 12:47:27 +0000
Message-ID: <20251207124742.96526-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251207124742.96526-1-biju.das.jz@bp.renesas.com>
References: <20251207124742.96526-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

As per the suspend_devices_and_enter(), if .suspend() fails, it invoke the
.resume() callback. Currently ohci_resume() is called in 2 times if the
reset_control_assert fails in ohci_platform_suspend(). Drop the duplicate
ohci_resume() from ohci_platform_suspend() callback, as it is called
later from ohci_platform_resume() callback.

Also, drop the other duplicate callback pdata->power_on().

Fixes: e4d9da32bf60 ("usb: host: ohci-platform: Call reset assert/deassert on suspend/resume")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/usb/host/ohci-platform.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/usb/host/ohci-platform.c b/drivers/usb/host/ohci-platform.c
index 2e4bb5cc2165..5342cffbee47 100644
--- a/drivers/usb/host/ohci-platform.c
+++ b/drivers/usb/host/ohci-platform.c
@@ -281,15 +281,7 @@ static int ohci_platform_suspend(struct device *dev)
 	if (pdata->power_suspend)
 		pdata->power_suspend(pdev);
 
-	ret = reset_control_assert(priv->resets);
-	if (ret) {
-		if (pdata->power_on)
-			pdata->power_on(pdev);
-
-		ohci_resume(hcd, false);
-	}
-
-	return ret;
+	return reset_control_assert(priv->resets);
 }
 
 static int ohci_platform_resume_common(struct device *dev, bool hibernated)
-- 
2.43.0


