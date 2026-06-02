Return-Path: <linux-renesas-soc+bounces-33454-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id X7PQKVE3H2pAiwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33454-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 22:04:33 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C30E6319DA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 22:04:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=q5WOnaV+;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33454-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33454-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A9254307D743
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jun 2026 20:03:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8368031960B;
	Tue,  2 Jun 2026 20:02:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E788F313547
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Jun 2026 20:02:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780430575; cv=none; b=av9TeuwnUd97+O3iN0++sPeDz0yK+GesqpuehgT9L8qW7cMpPatBa6RS5j/VboiIlGldU+J974y1rqof+8Wy/6Bs7WGntBCSqnj/vn1fCGEQR7alT32BA076Y9WG5Y3iTNigL0w1RHfjxSkqxVkwQl7cC5KmH1/nIy+AMjLwsTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780430575; c=relaxed/simple;
	bh=I92Yi+tkT9CMsn6qUnkOf841AL79dYZlftu3M2rJuaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zh4Ja3uKyacOUuBY3qP9AW/mwCPXPiCEMzhlKtBESUIKGH8AB9WF2gr1fPaptN70D0vbFAuUY18EJcdw/USP47e3KoVxVJZR4XkvjXU7BPuRzcx1uq4gSvgPojUwwnGujkX63DWIcly8qBWhZff+sg5YF9bDXt5Qk6YZwoC6Mqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q5WOnaV+; arc=none smtp.client-ip=209.85.128.47
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490af320e2aso19277935e9.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Jun 2026 13:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780430572; x=1781035372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=87wpdJkdKpucr71Tqb7S+bFMIF1JvoBzWRG4dGvBKnY=;
        b=q5WOnaV+Jol47pCghMl19sjTDFNfR5QsibNTTnkVMDFStgxoF5WFV2xc0zUi9bOymv
         b7DeP/tiILz+aHMzy7vPThcc9Gy7sMMHVjcALSmbmB/50aqRZWlB298Y5REPt59OGQUw
         bOWrV4cWn3VDciMg48w/GSxl7fW66+1eFO7pVreg31w92cpg9Hjl2dmQaUUWhOjsRc+H
         df0NeS3FpPaizgLFEpSXYBSBZlIFDZbf2LfYC8AiCMxVfn/j9L72zDmgTryYfRwgLrkY
         7OhMEYs4vS3rUudEcNB0OtEniT4+WiJqZDf2S0vtzMugvpTdAwhsYZAH3mvBZKTfqXcT
         qH9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780430572; x=1781035372;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=87wpdJkdKpucr71Tqb7S+bFMIF1JvoBzWRG4dGvBKnY=;
        b=DO/8adHMesnM/0JkL4pO5DAk1423seVi3iKgxnoqUoJKVRQH2onKRb0jlHwvDV0fZg
         9XorLPGgljX+/JDQw6EpGa0DtI1VtMPkh6W9G/yJrj2YZtJd6E2I+Y4JeqEWh3JRVc55
         NcR1pUE9gaUfT9kmxF9Z6UJRmlKcY4Om7out1raKKPtRQc7XcWXe3J1j2ERxi6qQocpr
         f2Pue8iV0/3O2xxWsIUZDcAsWkYC/4HWDwfboUta3E7pY7GL48ya8Wu69scynmc8xErj
         D1IDouebBzbupN2pHDSXMqcjh2aKsnFM2IRqpgH8cTxt7UcX1wG6V6TtNbXtachLlHSa
         SDBg==
X-Forwarded-Encrypted: i=1; AFNElJ/pzMVw0WtIoUw2AWk7BRbwepHpa10o4uS2W4syCKL4PBEBdcR7ANIl0Gq+BBTQmhdVvev6yxNWeEX0tu8QwEx8IQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAD4F3kMhCyVfaFLliO++9PDHIVvkGHRgWqq3rg3QbSH4WPibp
	jkAhkojqZQCqHxNUGwLhdwXp8mNUsIaito1jerhUO5fvxYHAUnQCeoty
X-Gm-Gg: Acq92OHLxwNY6hJFVaryHTTEre7dlAKtTFeudgNNTzYS/pEwizGMcoSzXpTAhnXOc0w
	cfrJmp86iqG5ZFkxISwRNT5vUC7aaiHWQpQ7WcHVsM7hPtLmMIOSwcXihmsaE0ZMzSe0vyrLKk5
	fNb9wmAHmWCxGaCMQL1d6YpY1jyYfNpgrWImWNpBOY/EkZTShnPdzkknfiuLp2diqvLjRc/SeGy
	t0Qx6XN6jImx1atOEFjBwM9reKqiynkK/uskf6kZoONP1oXeKlsOdOsb8RZu5BvfjeERuqMBJ0W
	gNQ/rABqzLMqQeZXz8LxEIH9HcMzLMsjMrQuBP+i4yNMr7ZW6k/OXq3L97gVgKW7JXB5LVJgnyk
	Piuty+K2Y3oukgnXkBORgTO6XRlWKi5sZCQk6Zb+OLZvPLzV9uJG0bELGSBak9QGfI+w75tutAS
	pXryu4LvMa1GoNanKfrL+Re+mV8gpWIN9ZDL1qh3QODvilrRgQYa7mNUxel0iSFRci/1PwhTMnG
	Kk+ndLSzbdjjD6Doe8vE9dcRWjhT1TYR1FfSSlq1L/84WV4s1csh+zKzQYVd+3lWtE=
X-Received: by 2002:a05:600c:c4a3:b0:490:b355:9c70 with SMTP id 5b1f17b1804b1-490b5ea6f55mr4800365e9.11.1780430572386;
        Tue, 02 Jun 2026 13:02:52 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:5ef:9913:4a77:3bcf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e823f7sm97978255e9.13.2026.06.02.13.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 13:02:52 -0700 (PDT)
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
Subject: [PATCH RESEND v5 0/2] Fix clk_divider_bestdiv() to get max clk rate supported and add KUnit test suites
Date: Tue,  2 Jun 2026 21:02:41 +0100
Message-ID: <20260602200243.1806087-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33454-lists,linux-renesas-soc=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORGED_RECIPIENTS(0.00)[m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:geert+renesas@glider.be,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:prabhakar.csengg@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:geert@glider.be,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1C30E6319DA

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series includes two patches. The first patch fixes the
clk_divider_bestdiv() function in clk-divider driver to return the
maximum clock rate supported by the divider when the requested rate
is larger than the parent clock rate. The second patch adds some
kunit test suites for clk-divider driver to verify the fix.

v4->v5:
- Made use of KUNIT_DEFINE_ACTION_WRAPPER().
- Added RB tag for patch#1

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
 drivers/clk/clk-divider_test.c | 153 +++++++++++++++++++++++++++++++++
 5 files changed, 180 insertions(+), 8 deletions(-)
 create mode 100644 drivers/clk/clk-divider_test.c

-- 
2.54.0


