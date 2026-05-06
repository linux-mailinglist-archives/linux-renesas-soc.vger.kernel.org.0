Return-Path: <linux-renesas-soc+bounces-32167-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNSlLzNx+2kNbQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32167-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 18:49:55 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 528144DE4A4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 18:49:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 02738302E426
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 May 2026 16:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C74CD49553E;
	Wed,  6 May 2026 16:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WOVv0wAO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9BE4949EF
	for <linux-renesas-soc@vger.kernel.org>; Wed,  6 May 2026 16:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778086160; cv=none; b=p/zxBjOO+Yq24ejtWm4zDvfJqdlY95OjK+76kYVTXjiiirQtQkWUfo/S4CqyRCzU7c3QjAvnXK0WCgRM1dE0onC1suxyG75GcrVoiLbbWmxfgYnoTRq9ZulvdCjo4NdEuZx66Rt8p02SjUAdPiMCGVpLqi2sIFmjX2CTKcoUbBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778086160; c=relaxed/simple;
	bh=2WmdsWgyNrqBDcYztbqF2FmZEYG0Du/8DGy0mnaFdXc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gjrd2Ocs4Zi5H/j49W2c1T+Y8Xu0c66c4zGJgxxx+tWvbM9MM12S78LF74CCA2pjShTwkSPcRpN90LwAnf0cv89B1NE4TH4R0EMh12CFlB3TLZmg60++33kkQWjqodsCBOZr78FV4hLATRHxjt2cH7E6UPbhA6cwpFF+Gax0pD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WOVv0wAO; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48d102471a4so34622935e9.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 May 2026 09:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778086157; x=1778690957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o5IQtUiTVmOMq1NI94r1G4wkYsaH8ZLtA9DARynNJv0=;
        b=WOVv0wAOkE+k//8w9T8Y/e3RagE3G6EifWtyQ8+d3Sqa/6KzeiCg0GxdPzDHMTroWH
         Q32kHKhBRFi4mXiyoO+Qtbu/VmBEw6AUGQOWumn3THTvgpMS2JB+qdilcMTuiABlMrtX
         RIBYltWFge9JKgyEJsEGX0qMKDCyi6AQJpMQWZ4rB/MZxjH0F8e0zfamobvhfOADx6ZP
         rzFy1QgFuHVDlJiKfMGZDLIDSqrT8x0A2dxsWuZvVOBFJ38AOUqmXLNq2Fgl0hL4uwFJ
         E1SjScHrLYCzRyFRrggdELRweVmLGM9Q695Po8pVdKOU9DCq0MIqKyzhD4HYVKrnNKEP
         lPwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778086157; x=1778690957;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o5IQtUiTVmOMq1NI94r1G4wkYsaH8ZLtA9DARynNJv0=;
        b=UwfYR6Kmmr9PzxKgY1LU4vuvdKDPdGMhztN/5n6OEHaVC6sCV9aqDmLqaoMqF9vg9q
         0bweqHRidzJOf/HK2PzoGt0GfhB2p0gJNIdcyQS+IMzqPUo4z4Xw97z9lWXV1HLtV86O
         dZLtYfA8ab30l0sfuHYLuBUWdaQY4uf2TY0mgsAvKuf3HcjuP57Hcdu4gxjB1GP1a4eE
         MiUzuXAUmoWrxMx9CSRSxbBkzTjxiHo3tTGlRIaDk6uc0vLrm8/1p6ES8GtlygHnxn+4
         GxCyhUX7wjGlf2KZYMPYKlwVYbk52ucIdM6IOzMm3M0DIiOtlamKghjxTv0fT0SYiF6L
         6QjQ==
X-Forwarded-Encrypted: i=1; AFNElJ8R0IOTZ0l4CBCqJsJ/rFdthuT5mTap4angEkqmN2pSypa3xVTzPkGM7t2JQpy0BaU5Bj5Pr9irqM4tGXm8kXKfpA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2edBnlGNIreaXRy/qIaypSXrA6JDxkLXySINSm6cWPLRyVWtk
	IuDxXnGbdsbLz6AQVtt6NePNQOELv4H5U4uyE3glf6km7x956HZ/0plP
X-Gm-Gg: AeBDietnHPc3GP2YoUzvxF4KIWdmJC1oxRPZeQOQ8pD0CEDY8LmokRnoZFzZydVAXAQ
	MqsuJeYeSqEbhfLwYgqdfRBN7IMPI0PjolY3RS8t9sMdIjjlsup+jGqzZtG7Clz1N57q4WTEttw
	VHWIy6/MbraWGe2H0qbNip9Ub+YDUNnG45f/TVLkOkSb1IyYQoBA5S/KoQZQYEnmLtze83hPyTp
	Ccq5SDB6O8rR8peiF0UZu9yCXujCy9RZHeLQXfUnGHsV7wilM9KXtA+2UOmvFQ5z4ccbrT2oRnn
	lxH3i9PPbeE/AhVAxbDeXgl2gGne+7LDL6kCwhDTLS8Lcu4BpNr970S3IVU4kilaOSojeycv+D3
	O8HIeVK1Q5DhayRkElAnTMZqaDyWBmeiAe/O24dsQD1sdhclMCKHZ+XwtRFRcKEIqBVQHHq0rq5
	EvpU4vEXnt45i43Tp9KoA4Z8F7jj0W5lrmqp7CVy3RauMcts9x9kXpdQcO+FW8tC899wRhdpAZk
	rkklVmJZs0YDyTs55lt/+WDY+O1NswQyxeGbqfB3Xh/WlFUo+dZgxypXg==
X-Received: by 2002:a05:600c:3b17:b0:483:8062:b2f with SMTP id 5b1f17b1804b1-48e51f18561mr71722345e9.6.1778086157412;
        Wed, 06 May 2026 09:49:17 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3dcb:40a8:a5b9:2327])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e530fdc50sm33060795e9.5.2026.05.06.09.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 09:49:17 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/5] rtc: renesas-rtca3: Various fixes and improvements
Date: Wed,  6 May 2026 17:49:09 +0100
Message-ID: <20260506164914.3987293-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 528144DE4A4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-32167-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series includes various fixes and improvements for the
Renesas RTCA-3 RTC driver, including:
- Fixing the polling condition when clearing the PIE bit during alarm
  setup error handling.
- Checking the result of the RADJ polling during initial setup and
  propagating errors.
- Correcting an error message related to reset control.
- Fixing a typo in the documentation for the rtca3_ppb_per_cycle struct.
- Refactoring year decoding logic into a helper function for better
  readability.

Cheers,
Prabhakar

Lad Prabhakar (5):
  rtc: renesas-rtca3: Fix PIE clear polling condition in alarm setup
    error path
  rtc: renesas-rtca3: Check RADJ poll result during initial setup
  rtc: renesas-rtca3: Fix incorrect error message for reset assert
  rtc: renesas-rtca3: Fix typo in rtca3_ppb_per_cycle documentation
  rtc: renesas-rtca3: Factor out year decoding helper

 drivers/rtc/rtc-renesas-rtca3.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

-- 
2.54.0


