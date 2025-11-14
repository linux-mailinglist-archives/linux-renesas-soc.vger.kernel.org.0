Return-Path: <linux-renesas-soc+bounces-24618-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D8283C5BD06
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 08:38:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4AFBA3504BB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 07:37:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ABBE2F6587;
	Fri, 14 Nov 2025 07:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l/oay8gF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B992F5A1C
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Nov 2025 07:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763105837; cv=none; b=svhipCn28qChS2SkpUbQPcSX8gJWvKmW/uzorFtyn1dGy7LwkR93tEQHKcPlgCcmyOUpnqpBFHn/wup6SxLMjnhT0OLEUp4PdBRchb7SKsj1lvpglm6ixgROY/7wpVf6Sc/vNgRWICbxCusdeURqKksN8CjqZcqLwaq/NL51C5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763105837; c=relaxed/simple;
	bh=nLW8hXJbFDbAk+S2a2f4YlzqFIsMONGXazabO52YUxc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T2hwVciOKzVBBKZVdFMRHMkBlUBSSpv8BcTvkL8wBbLhkp/YeCdTblM/vm5Izc3iKXXwsa1rJgjGoJn/W3ZqOQ4YfyhjnaUeYEPX01iC2KsS9JRymTcUIHYooYxtFJuGyWRmiISAWt2rDHz0h6f33TXn+DV6hJJjBsfJRQWQ/W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l/oay8gF; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-477770019e4so19497175e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 23:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763105833; x=1763710633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=spGEMZyXb2M9z42+l2X6hK3iU3ffAx/VJVjGK4UPR8Y=;
        b=l/oay8gFO/KDP+oeOZFv5j4sfKVjrhjCXZQ35JL7bpa51W04IDIHeNKU6u26yrU5Zu
         wBEDPhxVE17aFbvcVP5yqk8T29HFoLwtwtUaAxGlFRirUgK3rXBjTXqvpEuQRr/PPCg9
         2uB/ArMW2rHMejlJTh0W+edkAIKHYIj9lLHYxQrBigV/Pln6XnoIi5dKFcZ4h/ORyDnb
         2HXJJaO7r9f+P3SZ2gf8uRGaVeNXUrdDbE3GKMVLCSqhBiS/R948vqBS8ZTKyQO08tOu
         1dtheEZbtThVNhujd7kDtw7X4uuI827gOz62ShPl5LnhAOdypRaFIftGSA5qNZFiOgXz
         4OPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763105833; x=1763710633;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=spGEMZyXb2M9z42+l2X6hK3iU3ffAx/VJVjGK4UPR8Y=;
        b=gVZpmcdYEDEiPF75DvkMxhpGTBqyu0rnZ2gzOBxEbDuYk83QQxHuGrDLYx0/m5dhkf
         derhGxXq8pPq/ByEksqsaan2h46Kgh9jMO/IG2w3jdrcx+w5rr1E/RRbgqFK0NxiyPCJ
         t1WyZApSguYcuE8wONoRP5sdfRPhSqKGtqIkqITzWx4N5dnzzgm0aopGOzfbff278awC
         RJH7LCrPWrxo+lJtgJDCbdgPpX/sVPGDEf7zyORY71Ols5G7IgVPv7KLb+/vc1F6Usw8
         b/v216h3JKk01mTjy4JRWVJI682DowXNtQo1/wu4mTcnv4EtjK3//JKzxHM8TAP24Ydp
         ZFyw==
X-Forwarded-Encrypted: i=1; AJvYcCXQx0i1jNA1DayaV4VPjFU0HArPUBzA+CTngVUDylEAQzKwUHYXx8RDXo6cIGzub/Z8uO6qKNhS42Y7qblKgTxZJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAG3AotkLaTzp2j7muNTI8cz77bKwbVgIT8qd3DdkwHsz1KP6m
	NpsO2RUqBGc76LvVl8szQBt9ICg21KN0stiG7rQgAMvsE/MOGcLuIxYm
X-Gm-Gg: ASbGncvry7m1twXMbl40p+ujbFlt3YIa7nL5a7EUL7frdAiFsYw3ZtOR48CSZw1Koq0
	AHbP7nhB9vNZDhOTRe2KsfxezhohhGT2N8Qx/uad+ICiARbr54FpmA22M2OWO3V3DCHN8FC8Yv1
	bUyjgZwp7rk87t7RV3vYl6Md2Ibfz7mJRfU4KE3iVsC2zp/MWyBIzRzZ+AOGicrhKoT94vAtrfo
	at+AJNOS7KdijfTS7pSEQTeg5f5wvWIukU0s9n/dwvF3ZS0TrKFAAlirw7n/dq0gGTVvQcYCOZG
	2SR6feOjAPi9Lp3GaP5EHl+KQ4SjYmFdkCD+nbFUl4XqjGuDtDXNX/I+feL8QTb2qXHndQF4ZGk
	3zHNptcXb7FCz/KwfnIsOaw5zpFnXTBdHaTO4dgp1F+vBzPi6mu8viIOJPKbTLMEO8mYxtrJHa1
	ZRUCs/faAbjsiGyDKh35aydakuZxwfmj6o3jpypJxVqB2JOtuBbEFovtbvXAo6yjBu3UO6aCRBK
	/c8VbDs0HAlIX6v
X-Google-Smtp-Source: AGHT+IHfewQs+7a3lfvqTwRdCBtuVmy50gUcb9jxgnl491ywRf0F1Ve9RTaE3/Z1x1yp8j4QOY2Teg==
X-Received: by 2002:a05:600c:3b0c:b0:476:651d:27e6 with SMTP id 5b1f17b1804b1-4778fe9647bmr18114185e9.36.1763105832799;
        Thu, 13 Nov 2025 23:37:12 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4778c88bee1sm95071825e9.11.2025.11.13.23.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 23:37:12 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 0/2] RZ/G2L SSI full duplex fixes
Date: Fri, 14 Nov 2025 07:37:04 +0000
Message-ID: <20251114073709.4376-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The first patch in this series fixes audio channel swap issue because of
half duplex to full duplex switching during the streaming that involves
FIFO reset which drops the word leading to audio channel swap issue. The
second patch fixes sample width value in the hw_params_cache::sample_width

v2->v3:
 * Reduced the indentation by restructuring the tests in rz_ssi_start().
 * Retained the tag as change is trivial.
v1->v2:
 * Split the fixes patches separate.
 * Improved code logic in rz_ssi_start() by using else if
 * Collected tags from Morimoto-san

Biju Das (2):
  ASoC: renesas: rz-ssi: Fix channel swap issue in full duplex mode
  ASoC: renesas: rz-ssi: Fix rz_ssi_priv::hw_params_cache::sample_width

 sound/soc/renesas/rz-ssi.c | 64 ++++++++++++++++++++++++++++----------
 1 file changed, 47 insertions(+), 17 deletions(-)

-- 
2.43.0


