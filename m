Return-Path: <linux-renesas-soc+bounces-22217-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 55114B962D7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Sep 2025 16:18:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7EF1C18930C7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Sep 2025 14:19:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6887211A05;
	Tue, 23 Sep 2025 14:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="m61MBV/s"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76A41F3FE2
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Sep 2025 14:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758637117; cv=none; b=V36CPzClcMLhorwSym1RR3DwCUOSZp3HA5EL5PtExueHqWUNzyp39Ke+CnrHzpO+zAPu5m53VVWq9NeB/bIaufqXzfdr6mpKAStnhHmuYWcjQ+915t1tr9CPTZgg7BRCas5HOMRJ8VxvXEh0CF+QYwppUa9soNKfKvcaRvEoNZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758637117; c=relaxed/simple;
	bh=dGetF1qRy9QXK0P3a8VW8pHQYytO1lsKqc29yOoYSyU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tff/7+lDGEx9ubsJkLZWpbXfde60TUwA9Zx5nClriLETOkWfasq9tKbvHPZUeiUwmHZXwiD+VAnNy0aUtI1QREJSKR8xjBJFV5i91/QXA/NJoIW7VmK1J1YFTOr9/VtO66r/qjlI1H8fGUjqGu4vE5pAGTaP9lIQKmjPGbq4yag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=m61MBV/s; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3c68ac7e18aso3150044f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Sep 2025 07:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1758637114; x=1759241914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NFG4tL8lqUh/sVKHN37qHfPMPVZ9QDTBTj4893Vci9I=;
        b=m61MBV/sTq4KrEQzQepc+JQRslZuNMRlDMsyd+DpfKD+ctGsIKwf67kMXHF6AcuHIx
         BS20phdd5i5QJtk8933lRym78Gho+0qBAc1dPIa5C7swHwGbsqgxdf/G1yd6azoLo2IC
         0gSK8fHPPYO/ath+2+tCnL5e1DiPtOJ7p3s8sqBcoF4O2S+DcXNT+YRnF1gEucCsQ0lk
         PGPFjVWwB1LPkRRiVrptyzwDliYVcDl3/4l7ResTdcXdDC32YI8kqKoa3zFOoqwW7BFK
         dvzwyF8Igf6H4rmaygLN4+sNvg4LovAcAeQM2YnrmN5lpwywpKE0xfARbD1iufLwW8eJ
         5AIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758637114; x=1759241914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NFG4tL8lqUh/sVKHN37qHfPMPVZ9QDTBTj4893Vci9I=;
        b=mwiJHExP9soE70e1OfXLRW5RYXAcJQv82M67vzsFNx5+dcEDHD7f58IRJ/55FmqoID
         cqLaBh0a7HVBpDyP6JHhajoUUXlupLpUiOafyy0QCCU3jTv+Q9Nn5ZOdkyMlkp4B8GTj
         uX9f+i+FeDzSZx45wo+WuYRet3W7vknCuMWa40ZB4cfG8qXhdpKvux0BnZPS9tkpET9i
         6v2oz2Cnxb7U8zLDB/DMvUl8a5Xl9eYUIvLTtMcsEu9mmaBeQmvZi/8ygihC4v9c5hUF
         JxUhiwZakljyhFSNjQZPmGEVZ5slZ9tdVWW5wz021yMxqJg4hbW6fgGniox785CLRzcc
         RKkw==
X-Forwarded-Encrypted: i=1; AJvYcCVs6Mt8EtLKtHYD0z2WSptfzRaQfn5PTComoMGZDYXoBMvgxwbtTByjBQmUl1hdcYT2GjIQY+llJBwqFmOpqKf72A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRDvE9zDTL+P47g3s1+du+N1rpDFxGjREYCbg6SokLoA2jqfFx
	OzdtiE4/H/QI0PeseDtr/nsnKlWqlB3xsxsL96TOEgObHXsx1RZiqk7FeQYbKu5zAb8=
X-Gm-Gg: ASbGncuE8E1l4kacSL0lc8qGsxmCeznysoluhURubVZfzk7uZr0fgJ280T0Ubm4ZvXY
	Nfo2HvTv5pJp7IJNCYByU9jpptvjjUi/JoMicxrDnSI0G6YFBrmWJhwAtI3Rv3QYHZKkgyyn1+4
	jIak8VjJBbGl3e0m0XfqadsrLx3wL2oRzLda3V74IQaYvRusttWHZzTbRDN+dfrgKXO0S46WHrq
	qmBY+mpAk46veNQYcpTsL5f2T/9ihTC+BhbbmYXYOGXeDJtmUhQxv7LlSQnYc0X2p4KR3XN3qhU
	aPN52DwciFplRXZOkulP5FlB0Evbr0+Fnb5JeirC0kV/GSXwjVw7OOWNmU++W6IoGsGbd84lxYm
	yVeO2cAkxKf94JJSF9q0Rmv0dlmeKFodqAqSqxRYaHYq2TEDQvyNN
X-Google-Smtp-Source: AGHT+IF4vqcfWEYZtZ/S8nA08HR0jyyV0IaZblTvH4YW512bTSjwjlBru1lEZAr3DAhQSemddQNZLw==
X-Received: by 2002:a05:6000:1866:b0:3ee:b126:6b6 with SMTP id ffacd0b85a97d-405ca76faa0mr2014826f8f.34.1758637114129;
        Tue, 23 Sep 2025 07:18:34 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.153])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee141e9cf7sm23617713f8f.12.2025.09.23.07.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:18:33 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: chris.brandt@renesas.com,
	andi.shyti@kernel.org,
	wsa@kernel.org
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH] i2c: riic: Allow setting frequencies lower than 50KHz
Date: Tue, 23 Sep 2025 17:18:26 +0300
Message-ID: <20250923141826.3765925-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The MR1.CKS field is 3 bits wide and all the possible values (from 0 to
7) are valid. This is true for all the SoCs currently integrated in
upstream Linux. Take into account CKS=7 which allows setting bus
frequencies lower than 50KHz. This may be useful at least for debugging.

Fixes: d982d6651419 ("i2c: riic: remove clock and frequency restrictions")
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/i2c/busses/i2c-riic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index 9c164a4b9bb9..b0ee9ac45a97 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -386,7 +386,7 @@ static int riic_init_hw(struct riic_dev *riic)
 	 */
 	total_ticks = DIV_ROUND_UP(rate, t->bus_freq_hz ?: 1);
 
-	for (cks = 0; cks < 7; cks++) {
+	for (cks = 0; cks <= 7; cks++) {
 		/*
 		 * 60% low time must be less than BRL + 2 + 1
 		 * BRL max register value is 0x1F.
-- 
2.43.0


