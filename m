Return-Path: <linux-renesas-soc+bounces-30856-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMxHDC3Lz2m50gYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30856-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 16:14:05 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9AF3950AA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 16:14:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8EF72300C398
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 14:13:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AA333C3C18;
	Fri,  3 Apr 2026 14:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="N4tqb3Sv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F8036657D
	for <linux-renesas-soc@vger.kernel.org>; Fri,  3 Apr 2026 14:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775225631; cv=none; b=EI5vWc6wQgMPYbmRj2yrHhG1WAqxIEIshz68BchG4D/JTAaFIx3J2lo/QlcDHrn6inLE5A967bhYMNumxcazEmw2ta0tDxLXx5nbFcroocxqWUSDvmPf4JMGFYmxhdkHjy02WdVh6UEbcHM/AFFDewHO7FsCtBwD9acQZ8hr9tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775225631; c=relaxed/simple;
	bh=KxGvA0PVExetwgBdhug1BRBq91afFfulX4hdB+eF40w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FJvG3UsLOoHtV3CaS2Bqa+EViLc5sksYu02+kyQE/s3SoDHqEAGEbdnwpS4MQS9hJ/kmOLETb3Pgr+l0NLYT3Bw0k2nwsfEb2nKF7obrZ2d0ZMYNBnUfcWFXHHTqk91iBoXg4SHZfIMC0WUXUr9FPSBxLbKm+EHCvSbDNpYlbXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=N4tqb3Sv; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso18372245e9.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 Apr 2026 07:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775225627; x=1775830427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5BFpyUIn0/BvHbOjDY9ZRbJh4+NzZ5otQo9l0TsgYco=;
        b=N4tqb3Svvpxhi1oPjukQX7p4z5o3F5sctPpbPNcPWHRTvKvnn60YkDw9DYL0Yo0Otf
         aFmqVFlmBEJoHjMVG1DFa7MqeqV99RPdP6AWisrmwhNKQanRUnP5wV8CY78fZpsOz7Wf
         4y5zveRhcqy8pK/gAv6BU3CouqXr2ET6/nPv73LwrXMnOadLFH1UBLifn8KHTPJr78rQ
         Lrui8o+Sp94VeU8bS1Fc+Ed3tS+exjzAV7+ztJc9yjPR8SO4C2GRkdMcjlko2x6qPX/X
         gwmEyRsekz9DYxCrgrA3XE7H1gY16Py/IhJ2kPOoEoJwYjhFXd5Wc1VaKaJP0yP4htOW
         QXKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775225627; x=1775830427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5BFpyUIn0/BvHbOjDY9ZRbJh4+NzZ5otQo9l0TsgYco=;
        b=lC3iYW1AvECAwSDJbIAyQPFviStM69azAKsTH/OMUgiufj88o+aDzgoiWvxUwj+6IB
         Ip9nZBi7aHYi+2pZ50dkNuJMQKdsESqhlaFDSxhta52cQwiiokXkUGuk9MDCtkJG7hgF
         Lv5JDadWdLH2dUsYxS+eAOZoyGdjkfbygCw8W9kpeeKq51brsPS3RULvo1God9SL1y7w
         8AlWSDMFeYEdpJCr4uz1OdU6S5UW+yUqmNndbRd3bqcvm9/4pWA93lzd26toEjf296BQ
         j6rmZ9kZp7HTX9czxocewNodXHGeBnce7yLMbXprmtYDRYarfvG6fMlFRpdCk0HJJMW0
         VMiA==
X-Forwarded-Encrypted: i=1; AJvYcCVAyQ5oUQHyLRXZ+u8i9i9sC8ftlxzTfdduPGgMfoyDvz7Gafy3iURaJEhkU5ZPuBBsxYxtfdH0/FX8dKnCVKcrew==@vger.kernel.org
X-Gm-Message-State: AOJu0YzG7OMfsnHYldUpXHOycylV07dqWUw6f8r3t1IuE1Qsgno+ZMq3
	bB6zbn3aJtqTl8V7DuiE9nep+vVjI2d7zZmcxMeTWpCwVU/5ko4k9h3DRXpXZg6GqHQ=
X-Gm-Gg: ATEYQzzN47Ws3nU/emplH/ytZqn5NjMob6dZ+/0NFORlXhzWkIExLftCsWnQdxEVLRX
	j6cAyw8/8l6klathsq4wXPQ9IJF2bwWUXWmP9Kv4gq/RImjODKO65Qrt9A2DeNo16zTDNJhW9fE
	R4IzI6EC4/YPMtZBHZEGSIBlinADjIrYZGFjigf6H4tHnEj1VVtbEo+lJUi8BgSJaZKzzscHTBX
	Ah6/taTIeAebTC9pNnjhJDwH5zkeduhjZC4oGthFJyWZGazhqY356fkdrJw/kcXSfikcQ5hyDqb
	gmCbNbixuSgswA+igkE9g1rReX64uuu73RGZcsDmb/P3c+0Z2jbie6gryK/JHbmxq6dgnKSRHL6
	3UWM8AMlX5V9rTiWYNyoUU7YzuSQU61YuTcjsql90gRIDlr68OSpctiuZF+dIVS6DWb+BrRsydG
	QeyXZMNFCNFolLWxQ3dyUi4EWBCi0VyZX2V0K9TtuYoqSDdIaV1rqifQ==
X-Received: by 2002:a05:600c:818d:b0:485:3c66:e230 with SMTP id 5b1f17b1804b1-488997e617cmr48789395e9.29.1775225626628;
        Fri, 03 Apr 2026 07:13:46 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a6f13sm16958970f8f.3.2026.04.03.07.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:13:46 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.reneasas.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 0/5] soc: renesas: rz-sysc: Move common code to helpers
Date: Fri,  3 Apr 2026 17:13:36 +0300
Message-ID: <20260403141341.2851926-1-claudiu.beznea.uj@bp.reneasas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[tuxon.dev];
	TAGGED_FROM(0.00)[bounces-30856-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[glider.be,gmail.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 1A9AF3950AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

Series move common code to helpers.

Thank you,
Claudiu

Claudiu Beznea (5):
  soc: renesas: r9a08g045-sysc: Move common code to a helper
  soc: renesas: r9a08g046-sysc: Move common code to a helper
  soc: renesas: r9a09g047-sys: Move common code to a helper
  soc: renesas: r9a09g056-sys: Move common code to a helper
  soc: renesas: r9a09g057-sys: Move common code to a helper

 drivers/soc/renesas/r9a08g045-sysc.c | 33 +++++++++------------
 drivers/soc/renesas/r9a08g046-sysc.c | 31 ++++++++------------
 drivers/soc/renesas/r9a09g047-sys.c  | 34 ++++++++-------------
 drivers/soc/renesas/r9a09g056-sys.c  | 33 +++++++++------------
 drivers/soc/renesas/r9a09g057-sys.c  | 44 +++++++++-------------------
 5 files changed, 67 insertions(+), 108 deletions(-)

-- 
2.43.0


