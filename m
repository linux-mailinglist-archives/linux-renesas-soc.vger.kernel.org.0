Return-Path: <linux-renesas-soc+bounces-27664-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLfnKwGdfGn2NwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27664-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 12:58:57 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 524B6BA426
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 12:58:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A33DF3004926
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 11:58:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA7B736EAAB;
	Fri, 30 Jan 2026 11:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xvmvt8UD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AAD286416
	for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Jan 2026 11:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769774335; cv=none; b=kU7+S3dsGIWcRkH7gyhhh8s2UsiZvi4dXQH07vJlKqpb6u0xNShMC0ZVcTwjRbfh6VbzO2YJPGgP/tZlgVMeMBjJT6qXnO1eiA+pz3MROE++va3Ge3iAYGlNETVSDx84VHy9D0Gl+lrXol5GMHKcAmDBfdjNyfS0gg2PMxCvNYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769774335; c=relaxed/simple;
	bh=cbi8JJi0SO7YCQ4i7ZUO8e5i5/hE7NQb1CADWoXIQ7g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LjyvuIjZKSUhEkrG26VD7tauoyDqpoWDMZeRC504RO/X5tipbE84P0gzOKHNeFLRChGfLH4HAQPSIbL79RR0el79viMDoYJCQCmHRhU+0enk1l9KU3b6N9eqrrRgR8ajxWJVyWLXoKtdOg02GRoLAR4u+awXoUfy+AS1IdnbXLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xvmvt8UD; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b8842e5a2a1so295848966b.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Jan 2026 03:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769774332; x=1770379132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PY8qjIxAVsMw/C198wU7j8/Ax7QR0zWZZ/ZBaLrr4ls=;
        b=Xvmvt8UDio1vFX8R3DbRFdjiaypMukV/aktzbaSWuA8PqjBGd1EjhUhHNUDxGuegri
         ltC2is8p7HPkpeQEGmLIrRkBDe+NcHiRR8IE+2StqYrMDmu5Dq0xN+ynO7ZKE7cgaLsB
         BHKZlkj6h97A5rJvSQRke9Ba/UvtDVlDuP7ORi8+W+5insxE1/pCip9HvzplzDv359zG
         5iHEIiMvl5bBjI9A/ouJApr1CQljcNVjkCr4FQ28UsHFpPOEtXFHOuDGCyEu4n71qqZu
         4hDxbbfPamoC+Exf2T6yTog8vHbJZnvRbexyeqitSMYEqwSer99damyTNJIPKkGpGrTt
         irhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769774332; x=1770379132;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PY8qjIxAVsMw/C198wU7j8/Ax7QR0zWZZ/ZBaLrr4ls=;
        b=QTONNSMViaFdw2YCfAY9cYFMVFpJEMDQEHzpTQVh9+42iCcljtfETFQs3WGzN35VQe
         KDPEe7bVbKyUlz6UqWtLo9Z6FQpMpzfcDJZ2Pro5wM2KJjLO5Ycm1YDVxWnqW6CWFZng
         1h5CfEkBoJCwO7Merjh0Y44Py5+JwDSlB4/raL/ISn754x4pPEWl8nnqN5V7YtGVq2VE
         aObYRqSlLM9hso02+h4hDKjoEnpClWnQu7VC/WccWc5Tx9F6SraN4oW/9y1wi3flvi5f
         5dYvO+K1D597rv8jh8LExH+V2r1yx5dLMaLnjhzckQel7PFKGmVk4m0BFGS+uwOT7ie9
         n9Fg==
X-Forwarded-Encrypted: i=1; AJvYcCW7DWULGkUPVzds+zGMn7LzR5jOH25H+TpzPiVtbB7FCkQzTPj2rg6wWlDORjhvJyEuFRcqQG+XPDJzHeGUpGOVjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyO7JwlzBE5/fdXuDqBLYhUxvwp9nSAnBrTgrWa+0K0u7U72y7p
	cRcrVediU9KF9gRKZaFAskynNXXWjpkqgGulKuBjHcv5Yzp4toRPV3IV
X-Gm-Gg: AZuq6aKMmrDXUa7ITAxO03UigNp0S+kvDcUfC/zCLoWH+Nb8FHcHRPygdSsADDsKZlz
	A9MqNzZKoLNUjgz4n8668xAImcMJLuvUOfrzlZtDAVAfP1c2Tl/AVkzHy/80c21NlRRnWsSSq71
	3jhvNrHp0yFJUO8Z1qkkT0qXB0KuvOWbBT8gYiIUx3+HwXCBbv9JMMH9DgjaD0qUl+qbmju2CgR
	V85n3khkwEsNiaUI5pHIEW7IawzzVY0bqpFlyl6PwJRECQfFIar+m0hhWj0Gjt+SkNW+37TOE8Q
	Zvyrj30JT1F+ipi9VfzuYtHN3PpIP/MAEVQoyf19lzFW9Ms/xLpNercJHjhQ4eImF8Ogc1beojp
	hFLcpI7cGkkoEEfF/mwh+IMdQf8LmoPMOnrACFKulcHE+BrVkeoxh611y2K3ZGA9bh6xlq3KAkb
	HjwcW2f2usEMcz0HQdHDAIFRefh8meK3RjYjo=
X-Received: by 2002:a17:907:1b1c:b0:b87:2c3d:ef08 with SMTP id a640c23a62f3a-b8dff722adbmr170659166b.33.1769774332290;
        Fri, 30 Jan 2026 03:58:52 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:bd64:2984:fe71:7633])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbeffed15sm404671566b.31.2026.01.30.03.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 03:58:52 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 0/4] Add support for Renesas RZ/G3L GBETH clocks
Date: Fri, 30 Jan 2026 11:58:41 +0000
Message-ID: <20260130115850.253555-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-27664-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 524B6BA426
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

Add support for Renesas RZ/G3L GBETH clocks and  reset signals.

v1->v2:
 * Separated ethernet patches from series [1]

This patch series is depend upon [2]

[1] https://lore.kernel.org/all/20260128125850.425264-1-biju.das.jz@bp.renesas.com/
[2] https://lore.kernel.org/all/20260128113032.337231-1-biju.das.jz@bp.renesas.com/

Biju Das (4):
  clk: renesas: rzg2l: Drop a check in rzg3s_cpg_pll_clk_recalc_rate()
  clk: renesas: rzg2l: Add support for enabling PLLs
  clk: renesas: r8a08g046: Add support for PLL6 clk
  clk: renesas: r9a08g046: Add clock and reset signals for the GBETH IPs

 drivers/clk/renesas/r9a08g046-cpg.c | 120 ++++++++++++++++++++++++++++
 drivers/clk/renesas/rzg2l-cpg.c     |  70 +++++++++++++++-
 drivers/clk/renesas/rzg2l-cpg.h     |  10 +++
 3 files changed, 197 insertions(+), 3 deletions(-)

-- 
2.43.0


