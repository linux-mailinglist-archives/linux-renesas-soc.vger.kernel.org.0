Return-Path: <linux-renesas-soc+bounces-32641-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJ10Nbc8BmqmggIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32641-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 23:20:55 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BB5546FED
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 23:20:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A2B6430427F7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 21:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A55813CA491;
	Thu, 14 May 2026 21:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c75OmXFZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B812397323
	for <linux-renesas-soc@vger.kernel.org>; Thu, 14 May 2026 21:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778793631; cv=none; b=Caf6JIVnwZi4yRfS9hpafG6AM4xods6K84M3r1es9C772Xz+UPg3h0RSFalaMcpVvvMr10zczkhrRLNvmXhLyYWZMfCo6cxH2hkvw6QHx3TdZHPBt+OubVd1tdXr+msUsGji7+yaUBF+ZO1uXCznD0Wp6zertDFa9wwAdbktn9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778793631; c=relaxed/simple;
	bh=XPrW+LN3Qu1mBubr+kS6ch2XZNoo58CFw8wcZXn4OOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RmGS3IuTakWSH7BSKiF2P+xpjs5BexQKcw466BS4cPuSUgL5LNTQJiy6GdPna7yaHByIKC96QWgY9Z0QVSh4UunlQsxwUO1AAGqURokqRe5E0F6AXg0Tfpe7JeU5+wefMPSW+f4IBQ7xXKerCFCBe5st6FsoIzWvJqIMcK1rtNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c75OmXFZ; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-44e1ebb3122so4520563f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 May 2026 14:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778793628; x=1779398428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Lx+wfWkAhI1VCh8VDA1mDnreR/0Zt4DovZ/nCSUjjYs=;
        b=c75OmXFZ3L+FOntgkkGKJRUIHLb34cVy1igs+H1oYrcDmL0ojnDWt4RcRDoieGnapG
         uJvvHpE+PMPaoXaUudL5c3Q6JLg+tWwbZDcZcTFtrIw5oKG3VCPO0fZnxPrGnr++1Ymt
         DEZ5iymyWAlsZbPPBEyraEXaNzLsV0dazy+QT9x8wAXd/NqQwT4KyQAGFLRmiNel1IcX
         zgHOg66+o3u8EgLBjSOK26Fl3t5Gm+ttT7Ox7zfOKvWeLjCF4P5Ut+q/WeC7/7bWJSmz
         B8OJD4eGPPVtGD/vMf7BNkGa5d9VSfRSAgPm4/dEu1+VPqZerZNuetF8ZsOztyFxgVyH
         z/yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778793628; x=1779398428;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lx+wfWkAhI1VCh8VDA1mDnreR/0Zt4DovZ/nCSUjjYs=;
        b=CF7YjZ+4JFAtYFVqTYB9Gdqo2mKNZhbiRXflYmoI/6CCnwEkQ9ToO1dP8s9fN8tC1F
         fd8jp0mHVY9fEQKv/5gB+rCR7g1bAbsMT0S8FhzsjEBSI1TFe7P8g8LyD5C05ubuxwO1
         Drwwp81kfdylwamUs2BUX+5RnFXInUcQTUN6tm/dYvQsh5K9zQ404tVUmUHDYa2+TBQm
         uy9JoYentTE7ODeJE2YC04EYyZ1oRC1xCMrG8TnyTCXQINPdPsejWu5c0v3gJb0iVEK+
         U669qGNUtQDjjv1MissCDXeb9Xb+mMqDO52EHVn3eXKPk+Olaqid8YK/n0SXX3OAtz2x
         6UBQ==
X-Forwarded-Encrypted: i=1; AFNElJ92adxXYLpIrB7flqLlxz+aVmWSMRe2SqDXpZ+t1JBjfaK2R1vaQXAUaYUmYIXq8e2+uEHFaLUt1AmwLDbmE0nIOg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxC46S4oDoPy7dzx2PwMmgNUSeI20oRGZd5vVZ9nwozgtqEqqIz
	GHXM2znBTG1lp2VqCmuR+yTHLM4ws+T/ShEqMM+CikZZjtKJtYM2z18P6zw3p+nP
X-Gm-Gg: Acq92OH+VhKKPhEunc31IVcZ5uThzShyzcXywiXCRieyyK2LZeiO5jbRNRaExPHyc3N
	Kne/wOvkw9IPVncz1axy/HB5NGSdfe1ZOf5WHINCGALEGO8/E4qVHS8D1pkAJD9DewQgyEq8cHU
	2GXaTuMr/+2l1xUW2ch4EYIUP/YPBUhKc1jmWeFkCHPlQ/P2xeZ/7BjrWZ9FQ8wRq1cldJdzckH
	V1u4YxzyqW690Mvha2ahrUalzeXTvf3LdKQj3VWZsyDchkVRjYERp4powIMuDfIzyAqjdJqbu3p
	13UKeFD9iNCbc6Wueyuq8bUDbdWeU7CiEk4ChYZmnKPrZr+wtzX1IM+TI63/95KyPm2ekxXAzpl
	9lL11K++PXkxiwVM7vc7mPPk2aPCvgN3f7EtcycxZnog/6ZTr4ED12g4BUWBzTD6T8KxQtIRMXO
	XBvBHAJTmX3agIPglt2sI1igTDuVZQ5cKU2EBLJHGxD/ZcyziN9PhtIew+sh1tGDyau52wHK1Ai
	QQwWdXbtMEKx4gQtWJ2mv37LKGPgBZj1EpjMiGJdd5aMBTW
X-Received: by 2002:a05:6000:4021:b0:45a:c97a:905e with SMTP id ffacd0b85a97d-45e5c35db40mr973342f8f.1.1778793627421;
        Thu, 14 May 2026 14:20:27 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:4d56:d792:6583:2fd5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe13a7sm10216038f8f.29.2026.05.14.14.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 14:20:27 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/3] mmc: renesas_sdhi: Apply tuning quirks for RZ/G2H, RZ/G2N and RZ/G2E SoCs
Date: Thu, 14 May 2026 22:20:21 +0100
Message-ID: <20260514212024.1624517-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 81BB5546FED
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-32641-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This series applies existing SDHI tuning quirks to the Renesas RZ/G2 
family (RZ/G2H, RZ/G2N, and RZ/G2E).

The RZ/G2 series SoCs are functionally equivalent to their R-Car Gen3 
counterparts regarding the SDHI controller logic. Specifically:
- RZ/G2H (r8a774e1) matches R-Car H3-N (r8a77951)
- RZ/G2N (r8a774b1) matches R-Car M3-N (r8a77965)
- RZ/G2E (r8a774c0) matches R-Car E3 (r8a77990)

By applying the relevant bad tap quirks already used by the R-Car 
variants, we avoid unreliable tuning positions and significantly 
improve data throughput stability and performance.

The following performance improvements were observed during testing,
on eMMC with HS400 mode, using the mmc_test module for 1000 iterations
on each SoC:

SoC      |  READ BANDWIDTH (KB/s) | WRITE BANDWIDTH (KB/s) |
         |     Before -> After    |     Before -> After    |
------------------------------------------------------------
RZ/G2H   |     42500  -> 100744   |    70109 -> 72594      |
RZ/G2N   |     46680  -> 104731   |    73393 -> 74298      |
RZ/G2E   |     159472 -> 180781   |    126355 -> 127725    |

Cheers,
Prabhakar

Lad Prabhakar (3):
  mmc: renesas_sdhi: Apply bad taps quirk to RZ/G2H
  mmc: renesas_sdhi: Add SDHI quirk for RZ/G2N
  mmc: renesas_sdhi: Add SDHI quirk for RZ/G2E

 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 3 +++
 1 file changed, 3 insertions(+)

-- 
2.54.0


