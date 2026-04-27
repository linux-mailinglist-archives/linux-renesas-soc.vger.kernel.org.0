Return-Path: <linux-renesas-soc+bounces-31676-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KLKpDXFJ72lO/wAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31676-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Apr 2026 13:33:05 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EA5471C95
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Apr 2026 13:33:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D44363083EB8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Apr 2026 11:28:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B812C3B8944;
	Mon, 27 Apr 2026 11:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nu5eWBRy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC6D3B8BC0
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Apr 2026 11:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777289324; cv=none; b=jNVwEFQtbOZdhjY0977sITMqHpjSMtectY/t5wE0oCv+vvnk/AZrG0NYLM03FDruMyoe/3GR6bRFsJQlhcQE6Tj7zLeTbwn3tKVPG+M46wGib4yg1UtcVIzk5taCrSVG/mzr0o88aVFCX0LPDouEevBkNX23bSzbCT2xyrWc+Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777289324; c=relaxed/simple;
	bh=2JKzYfN+MJGLPvHkAbxjuQEHRWIHSgPv4e/R/kdMn24=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QZ3VxCbx/WTQaqvEIwMpkwGS/Vq8aHZUG9u0FPC01A0wV4WbbcnAVcfCtF39rauZnfGp63QOzjGqDlwLWvHICVNyPCdBE4JmUGUGX10rIIlExTNlTBDvK2nvleTbuEZy5xL7k+xeisLBf5C8vdQvBibKGUxHlmhXD8gKhT8cWv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nu5eWBRy; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43fe62837baso5925003f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Apr 2026 04:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777289321; x=1777894121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IVOzV4Uc10PzeUcUQ++usc4lm22yOkQ+jtrqe01beWA=;
        b=Nu5eWBRyVV5teBxj+6MDtrBUmM4SkN1abCwKimm++Dqk2asZMVvupy6zwMOIdI5dMh
         ZT7SZLGlAHhTkwVCsjEC1MvWuFnJy9YJmSVi8VwKLcrUxRRIlwp1PPk2wsmd0YnP/ALI
         zwIAU4dkW4O6ro4hEK1FUsXkSGMXPC1VtrTPBaE3Gf7HhRHlFC/7QPqJHqcVXv8Xc69H
         WSixYF0NoQZ4FlW4tsDZd3yP29c06IkE9KnGiGW18M4D+0PZraOhgPG9iq9aFuBPmWYJ
         UavQ8k0Yaogm1SR3AwCoUaW1j0ne5SI0MHfPgXT4hV1MCszpB67j4t7lWAYF6trBAFcl
         Y4gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777289321; x=1777894121;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IVOzV4Uc10PzeUcUQ++usc4lm22yOkQ+jtrqe01beWA=;
        b=JFRFpE+mRPPr2pku7WR8Ks6bra/vpXARytmKoDMr2xqowsyHvInGL5XQ78MlTaWbuM
         cJeYCPZnPhAS6NuLAkvqC/ywfLBMN/bNn+miKuOzOG0pYjQ+k9x+78U0EmL5y632TZ1U
         H8UNI7EDRsfBnNaCh+ZS/fmGqcflzNapAIPQcbstYeIz+Om5Ol7qGU1IRkgvFx1b5UAs
         wdb9SO7nfB1upneHIAm78UcLU64B1FbaS9+glgHh07LwFRL9TTNCrF7pc96IfyXJkew+
         Hi658cY6PdkQHZpw11go+ZzJshvNdDULH+UJy1VZdKzi7e3CeF9TXSdZMlp0HznjMwfS
         35NA==
X-Forwarded-Encrypted: i=1; AFNElJ96lSttgpAhuQkPlDN/PGgtYRr/vOXhm6ab8erWLW03mZ16ObVTz6kkE2op9uKoVsy0c9iZsEjyjOwUMwKEFzpY5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVPYJS2BoNEmZ85j+ybrQQ00EFGNbGFKYycLcCMrUMhyMjIQBm
	qGgClikSKtt/i5YFed3chYFsEQLRUgGkkcCmcJzi6RPzxUIHgyLdZj58
X-Gm-Gg: AeBDieuUcocC3dEiXRQ5G8fPX8AHn8ZrC89oynaEH+uP38zMn46A7gV/VzuLYM1cMa6
	vEOUA7+7OuPKP9SvOlZseRfDsaD3UT7YdAzniIYmzpWhMu5fQfuHLFK/i2+Wzbf+P2F4amKP8v8
	esQXvy75TVEkrw9colbjb1PTwFh3ee6ihB5KtgL93JN0Nuihqy2RYpbfwdzc6eerGqGsYnxubzc
	MbMQTZg0cFSzErznpDFR8DdSIT+MHXPWa44s0lwA/re9BH+X3Z3M/pkqupv5pSJ2+osujONHKGN
	HUCGWQMRPlVhddKoWohJMTUwhsdzlfBzlUNrdtd5WqTzKjHKdiPu1qJ89P4cg3IXjUPf0mB8TSO
	I+bqZCc5NEPEvNL3QJ5qOsNGBu4aSDnP8ef5HLJyoOKCKNujlvqEPKetocEpYeQxwW9YdF9bAHR
	M8KNV8Uc27kG78UF6ibT3A0t+9Q11DG+zuR83lDbip55fhRCXpXYd9aA5TnFmXlGSE0+tDPsYzr
	qpQ2IUWbtYq3NRxnhomEunAxDTnk87xxyTlPGhb6vrOI0HfgMRpX9uGGg==
X-Received: by 2002:a05:600c:46cb:b0:488:a723:ea53 with SMTP id 5b1f17b1804b1-488fb744fbemr612268015e9.7.1777289321307;
        Mon, 27 Apr 2026 04:28:41 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3f97:a47d:8f30:c055])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cb135asm85759519f8f.6.2026.04.27.04.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 04:28:40 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 0/2] Fix clk_divider_bestdiv() to get max clk rate supported and add KUnit test suites
Date: Mon, 27 Apr 2026 12:28:22 +0100
Message-ID: <20260427112824.231150-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 94EA5471C95
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-31676-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:mid]

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series includes two patches. The first patch fixes the
clk_divider_bestdiv() function in clk-divider driver to return the
maximum clock rate supported by the divider when the requested rate
is larger than the parent clock rate. The second patch adds some
kunit test suites for clk-divider driver to verify the fix.

v3->v4:
- Dropped unregister_fixed_rate/unregister_divider/unregister_mux wrapper
- Added entry in .kunitconfig file
- Fixed reverse christmas tree order in
  clk_divider_bestdiv_ulong_max_returns_max_rate
- Updated MODULE_DESCRIPTION() to be more specific

v2->v3:
- Added Rb tag
- Swapped the order of the patches
- Added the expected value in the fixup patch

v1->v2:
- Updated the patch#1 fixing review comments from Sashiko
- Added a new patch#2 to add some kunit test suites for clk-divider driver

Cheers,
Prabhakar

Lad Prabhakar (2):
  clk: divider: Add KUnit tests for clk_divider_bestdiv() ULONG_MAX
    handling
  clk: divider: Fix clk_divider_bestdiv() returning min rate for large
    rate requests

 drivers/clk/.kunitconfig       |   1 +
 drivers/clk/Kconfig            |   8 ++
 drivers/clk/Makefile           |   1 +
 drivers/clk/clk-divider.c      |  25 ++++--
 drivers/clk/clk-divider_test.c | 152 +++++++++++++++++++++++++++++++++
 5 files changed, 179 insertions(+), 8 deletions(-)
 create mode 100644 drivers/clk/clk-divider_test.c

-- 
2.54.0


