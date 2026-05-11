Return-Path: <linux-renesas-soc+bounces-32408-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHkgBJYtAmq/ogEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32408-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 21:27:18 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 661DD5151AC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 21:27:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B2C8E3038C50
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 19:19:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A43E14D2EE6;
	Mon, 11 May 2026 19:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZSCtR/15"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B314C901E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 19:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778527156; cv=none; b=o7Lycig2TSIlTKBANadSnqcsY9/u3Wlow7Ra2naBHyuQsrYTc7/N0XfhjhHlvPVadZOF/Dlwf2ObCxhp64qh+1bqkHW87XEBpodZOQ4HaTdqk5Bndk6zRo4KLuO2JbM22tJe+dFQ3wDtRlrb5BKOpXSuJzKCkqtfCDwjhoANJGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778527156; c=relaxed/simple;
	bh=amfR39GXM/RYwIJ89TLxwC1xDMx9DOHbmIVZ1T6/tow=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fbzmPiJjTGw3z5ixwcBBD8qsYPqK7sSG3z+D69ol0YCuXj76IzWXpAfExUVXxeftoVNC0KfNbkx1EUe01pfvjpR8x+jFBuQInFXbKJEVQwvYQNShBMyjaJ7YXyrcQX9dXHo8kUp0+dnw0C4IRzWUVTKSl8eB6vYPgSkNhlnpBws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZSCtR/15; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so46327075e9.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 12:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778527152; x=1779131952; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0VBMYUO8iwKdjLIgQm/2QKqt/0wCxzU8CXHOfJiBo+w=;
        b=ZSCtR/15+Xn0OJxpi0QnZYkmVo7yzHs3TCpK1W9IPuZZQCtwxH4H8Dv11DtzHGNQJK
         RTQb5kCsyDQnTFVWKo4EaVvh3cLW7lInIzI2Qbrho8l1aurg1FACjaf6yemeCIiWjnR1
         AA5poUyoLjDQ/GG3JK++iDhVxSIQJfwVGSIJLoxAnxoq3WAI1r4B6o1t7gwASOJ2fmuv
         yPY6sW6xGePPhdyb1pZ3vb4t7KyQqZ7lPzfSjqaRJLMu3TZmKUs4pdb4hnp1KLX8GdtR
         8zp+s393lL+szXW9lMAdegE/mt4/1DKRhOySwGWvKDX8aSuNWt3WcTtcxaqUKrBW8y53
         doig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778527152; x=1779131952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0VBMYUO8iwKdjLIgQm/2QKqt/0wCxzU8CXHOfJiBo+w=;
        b=Gl+GB53QzuZRIIFvgwrQ/lkS62eIysIjgph6ozXDeF7VVFgpnRhBRebHjvMO+03/JL
         4TVk0OR++D9koYAMnWU8uTfhPhkKdBZFTB985hgXfWt+LBSecO8nyz9ETdbcxrE+ljMV
         beH20vKZzm1S7b/luF3esBatlB4+uJlzGrvaCbza1s7HUtRYP1tYWrUuOeIst2V53uou
         GNOkIf09wexZF2wlbLGUXT1Tr20BrdbgNjaLQT86jY1MGgN++bLT/uTsNYxifUInT8GC
         pI4PEX/ywL31xVAzc6ss9m2/2t38yJTLAlsI2Q7V6j8qxl+r2Z99/Z/tEH4v30AvqQCD
         rY/A==
X-Gm-Message-State: AOJu0Yx+rHwtvxLFxnFSJjV+GFVoLdXB41/Vebef/1v9hgyc+7HxE2dh
	jSjd53Thygz5nbzXoyGltM9Uc7Y4KJn0QYnP2non1ful5/M0VK8WPKKK
X-Gm-Gg: Acq92OH9XeLuY1G/cc4604TZMi6OAhIaOcH+x7I2DL8jXVzkwwL8mDpFVrAq7gTiakv
	xrnJMpt9Q+SJY/5dGQbMUKOuq87iV3e4mOh+xHTFU1zG1CnZB3fcj7LlfVlHtLP3bkRuAe2phkk
	KBYfhtZqnjn4l/csmIydD/mJgg39LeTflahDQphWUwj6cRIpXfV6kEF0KE2OHL9ICgZpKsJyFZZ
	4OkAmHg0akUpByb4ZFN9KGQ2oj0Jnq6LkCRxU2udl3qggBZhURsb+IeZbsBiBv1WF6CBvAj7K0j
	PE4/tkUtFv0ThO6uFnGVv5RpW/eyjoF9fgD+h5DdflIbnCGJPkF+C9js07bSIhfknA7S7PIaq92
	ql/ZKj/G+GlhCVK9EwfbjHT+/EbaASe/j9aI/1HxgwDpB2U8VXIHwVBwShLVK0Z7CxVt8w9E0vG
	lXNVLjB/heKYOl1kK0i0rLqtM3ENL7dIJoqjqrT/upeaD9pUfmZdmAQFDXvTRCcxfc4Hz8DH1z6
	dX7OlJyLFw2IlNQmcniZK1UUByWw6IjqQGdGQ==
X-Received: by 2002:a05:600c:c096:b0:48a:f18:ece4 with SMTP id 5b1f17b1804b1-48e51f50982mr315270505e9.24.1778527152357;
        Mon, 11 May 2026 12:19:12 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e687:6094:b849:9886])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e7e45ff89sm150350725e9.8.2026.05.11.12.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 12:19:12 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/4] Add PLL3 and LCDC_CLKD support for RZ/T2H and RZ/N2H
Date: Mon, 11 May 2026 20:19:06 +0100
Message-ID: <20260511191910.1945705-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 661DD5151AC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32408-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FREEMAIL_TO(0.00)[glider.be,baylibre.com,kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-0.974];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:mid]
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This series adds support for the PLL3 and LCDC_CLKD clocks on Renesas
RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs. These clocks are essential
for the display pipeline, specifically feeding the LCD controller.

Key Changes:
  - PLL Reference Flexibility in  the RZ/V2H(P) CPG driver
  - MSTP Dummy-Read Mechanism
  - LCDC implementation in the RZ/T2H CPG driver.

Cheers,
Prabhakar

Lad Prabhakar (4):
  clk: renesas: rzv2h-cpg: Use per-SoC PLL reference frequency for
    calculations
  clk: renesas: cpg-mssr: Add table-driven MSTP dummy-read delay for
    LCDC on RZ/T2H
  dt-bindings: clock: renesas,r9a09g077/87: Add LCDC_CLKD clock ID
  clk: renesas: r9a09g077: Add LCDC and PLL3 clock support for RZ/T2H
    display pipeline

 drivers/clk/renesas/Kconfig                   |   2 +
 drivers/clk/renesas/r9a09g077-cpg.c           | 369 +++++++++++++++++-
 drivers/clk/renesas/renesas-cpg-mssr.c        |  65 ++-
 drivers/clk/renesas/rzv2h-cpg.c               |   7 +-
 .../clock/renesas,r9a09g077-cpg-mssr.h        |   1 +
 .../clock/renesas,r9a09g087-cpg-mssr.h        |   1 +
 include/linux/clk/renesas.h                   |   5 +
 7 files changed, 444 insertions(+), 6 deletions(-)


base-commit: 5fcbbc1fcc4fa78bb5a184caa2c32db423676577
-- 
2.54.0


