Return-Path: <linux-renesas-soc+bounces-34250-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RRQzAR5yNWpXwgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34250-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 18:45:18 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7F16A71BA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 18:45:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=h4ozNIG3;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34250-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34250-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F16D33050C8F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2026 16:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A58433BF684;
	Fri, 19 Jun 2026 16:40:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431484964F
	for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Jun 2026 16:40:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781887236; cv=none; b=fFPOn9Gx8/GMZ3fUs7es0pLxHDh6eopxhlXPbwNUwKsAFTMWPvr94RCCGUelnOw6Oi8BTz5gS4HJ/LoNzancgOU9kXPn0fbygg2JyOJVJV5KVBCgRDXN7+lZ0dzDU8hwR5bovVe3ibdB2B2wH+1vpV3xqsXvIZjG+ZEnwoFnGuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781887236; c=relaxed/simple;
	bh=fRiGDz/PnXRxujzQJocylPslpViJhpqWl66DtLpk2kE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qzMcyEInsK/fwxTQl+czgB8E/p6wrcoQHVbxzm1qZX9+hu2PGPBbtCMVjdHZ6hR0+so1ZWUpQfa4cqUoOGw+Ao814b1YxnrHQX9Rn0Whh1LNm7c0ftRP9RE1Jf0/+NsAwcTuYgAvyzfxLgRFuOKL0E6SuxJwEZMX/1nCBAIBL9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h4ozNIG3; arc=none smtp.client-ip=209.85.221.52
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-46255b269c2so1779032f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Jun 2026 09:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781887234; x=1782492034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5IwVlN3yJGrfyQnit4rech+V0QDajwRA0nwH1Dul5Uo=;
        b=h4ozNIG30Gi6nK5o+bKnE7J44N7BnmP6akMCh9pBJIJt+HGwJDeF/YaZhnxmdU4e/q
         Pmr/j84p9p18ZzDPLoc4UqR0zVV3rcCM1TTcSImAvyvXBAqm6K9tg0HCoqaqLKkd3jpP
         jISYpXqSpL1UXCMV5SLOmHhE4Rpnw03e2hMuOjk/TMMGKsKo3KuvlK6MpxIw/F2vm0B0
         EngpT4RAsS32cfm4Q42iFGr5IKKb7qzRUr8wa5XrPGqinkTTZMbjezDeHw71BgyF6OS+
         UVdEmj4mhWUB6OHr1dOO1808N1RDiPZgIum7V68AUAVVUKpYcvROxbznu4E4eoSQiVmY
         K7yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781887234; x=1782492034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5IwVlN3yJGrfyQnit4rech+V0QDajwRA0nwH1Dul5Uo=;
        b=OUl7CBIGx4NkweIAp1bkYQfxT+hVfwKu6u/xZ7Ei74VHDuAs4AL7lco5l3XIedk49t
         71ByazBMu+ogg5FxxfP6zj+KsJumZqJtBJ/9aK6R0pWZcnhkfo7D6Uau44OJ/KJGKDT2
         0yzOpOx0Sgg2KpRdClpGQh6bzCDSRskOELLexdcstsJ8fKFEN7K+Ay7QvwHqFECd/w74
         j2/wIEyBZxDi+1MFRL1AYSL+xQq/OE+V60HLUcJvnydQy14ZX6VhLRuUTZj2QrUs+aw/
         tUU3Iy0FBVpexsP0EI2iWEzGZG+76N54PrU56+wXaupWobyUhdv0IKRCrNFDdPY/94+Q
         u4JA==
X-Forwarded-Encrypted: i=1; AFNElJ90lALcL4ElRp6tM4sRRCIELLhlPhCs5C1XEda7YvuJ1MuZbky1zU6ArTdFxA4BqJm4pieh7h+BzF+74fwoTBvS+A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyoqh0yf/uenWFLmQwt2Zozy11VZiXruurOydpO9Q9NDm6TaDOt
	pMFq1cWHwvOAtyirXtk/f9LPSwkuXlQ7jSdjDTEMCrxlB5aQGaAXXJSu
X-Gm-Gg: AfdE7cluWdvLeIZC9sqOH6qt79iK537e5eJAQlo3hU0sxu+jgnFMbB/6oEGPeVdhJei
	o+nCAHjNNkinvSPV/Vc72w9cOV/WVhtB5JmSon1s28zUkZc19Z+q7OrUw+PXg2Q37ZSSQk7+2C7
	GX8kJcsYnm3N6292UIvBoIT7nkKlsDs98Myt3VjuzjjgttYKkvr54sbDd6op53S9DO3izpt4Nrc
	5pqpdH3ovILvSCNkJ1mxnPPyV7BLRC5V+tsabCu+msxrD7Nl9+OpWHLdxwb1wayFDTO7Z0QVOwE
	oNW/k5zIGbFJtrj5rQHG8uhydVpH2BSR1rQRzCpY9/jXtjVfOaCvfz9NDi0R0oSpeUwZOTDw0QF
	9kqUxsuMnJC9yTLQ2u/ZJS/aoxT5nVT4BCr90JLkx7qemBiTaW0wuOiSKof9VhFMsCvhx7yuINY
	xeo7tJQQiCIWP770XJd14YuYx+4vzjKHmnZs3QZQ3srT0kmvWP
X-Received: by 2002:a05:6000:2884:b0:465:81cb:bb20 with SMTP id ffacd0b85a97d-46581cbbe76mr5269641f8f.9.1781887233482;
        Fri, 19 Jun 2026 09:40:33 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:b387:a6c7:e8fd:bca5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46667221de7sm261621f8f.33.2026.06.19.09.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 09:40:33 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Brian Masney <bmasney@redhat.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 0/6] clk: renesas: rzg2l: Add RZ/G3L MIPI DSI, LCDC and LVDS clock support
Date: Fri, 19 Jun 2026 17:40:20 +0100
Message-ID: <20260619164030.380098-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,redhat.com,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-34250-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:biju.das.jz@bp.renesas.com,m:bmasney@redhat.com,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:geert@glider.be,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,renesas.com:email,vger.kernel.org:from_smtp,bp.renesas.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4D7F16A71BA

From: Biju Das <biju.das.jz@bp.renesas.com>

Hi all,
 
This series adds clock and reset support for the MIPI DSI, LCDC and LVDS
peripherals on the RZ/G3L (R9A08G046) SoC.
 
The DSI clock path on RZ/G3L is generated by a dedicated fractional PLL
(PLL7), followed by a two-stage divider and a mux that selects between
the LVDS path and the DSI/RGB path, each requiring a different output
duty cycle:
 
 EXTAL->PLL7->[ DIV_DSI_C | DIV_DSI_{A,B}] -> [mux: LVDS | DSI/RGB]-> vclk
 
None of the existing clock types in the driver could express this
hardware, so the series introduces three new clock types plus one small
piece of supporting infrastructure, then wires them up for RZ/G3L:
 
 - Patch 1 adds CLK_TYPE_G3L_DSI_DIV, a two-stage divider
   (power-of-two DIV_DSI_A cascaded with linear DIV_DSI_B) used to
   derive the DSI clock from PLL7.
 
 - Patch 2 adds CLK_TYPE_G3L_PLLDSI for PLL7 itself. PLL7 is a
   fractional PLL with its own parameter search (MR/PR/NIR/NFR) and
   programming sequence, distinct from the existing PLL types in the
   driver.
 
 - Patch 3 is a small preparatory change that splits the divider
   "flag" field used by CLK_TYPE_DIV into separate clock flags and
   divider flags, so that later patches can request divider-specific
   flags (e.g. CLK_DIVIDER_ROUND_CLOSEST) without affecting existing
   CLK_TYPE_DIV users.
 
 - Patch 4 adds CLK_TYPE_G3L_DSI_MUX, a mux that additionally tracks
   and sets the output duty cycle (4/7 for the LVDS path, 1/2 for the
   DSI/RGB path) depending on which parent is selected.
 
 - Patch 5 wires up the above for RZ/G3L: it adds PLL7 and the DSI
   divider/mux chain to the core clock table, and adds module clock
   and reset entries for the MIPI DSI and LCDC peripherals.
 
 - Patch 6 adds the remaining module clock and reset entries for LVDS,
   which shares the same PLL7/mux clock tree set up in patch 5.
 
This series was tested on the RZ/G3L SMARC EVK [add testing details,
e.g. board/display panel used and what was verified - resolution,
clock rates measured, etc.].
 
Patches 1, 2 and 4 depend on each other only loosely (they each add an
independent clock type); patch 3 is a real prerequisite for patch 5,
since patch 5 uses DEF_DIV_FLAGS() on the M2 divider. Patches 1-4 are
core framework changes with no functional effect until patch 5 wires
them into the RZ/G3L clock tables.
 
Looking forward to your review.
 
Best regards,
Biju

Biju Das (6):
  clk: renesas: rzg2l: Add DSI divider clock support for RZ/G3L
  clk: renesas: rzg2l: Add PLL7 DSI clock support for RZ/G3L
  clk: renesas: rzg2l: Add support for divider flags
  clk: renesas: rzg2l: Add support for RZ/G3L DSI mux
  clk: renesas: r9a08g046-cpg: Add MIPI DSI and LCDC clock/reset entries
  clk: renesas: r9a08g046: Add clock and reset entries for LVDS

 drivers/clk/renesas/r9a08g046-cpg.c |  67 ++++
 drivers/clk/renesas/rzg2l-cpg.c     | 501 +++++++++++++++++++++++++++-
 drivers/clk/renesas/rzg2l-cpg.h     |  31 +-
 3 files changed, 593 insertions(+), 6 deletions(-)

-- 
2.43.0


