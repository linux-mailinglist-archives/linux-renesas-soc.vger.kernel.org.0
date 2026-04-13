Return-Path: <linux-renesas-soc+bounces-31241-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHcAIlTm3GkZYAkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31241-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 14:49:24 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5E53EC2F5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 14:49:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4D3F8300BB87
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Apr 2026 12:49:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B90C43C870C;
	Mon, 13 Apr 2026 12:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YLRjUbPS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278753C7E0F
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Apr 2026 12:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776084561; cv=none; b=UVhQmwnUAyVF+ntcMfwldvaCTH5aD9+pTvYHGSgTUVCYsIiZBNpxKE4Y3mojK21Zm24MT41uSxtAVvkIeGHkbN5Her75ngkSufu61mijcKnRctakJNZAQigCoXhQNiD8ioKCAJ/No9Ky0CkOfgm85tPUo/JPQt//kqgVXwG/7NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776084561; c=relaxed/simple;
	bh=VwbgQIaq3OLeFJ6TuVKcR/q4kXymk0heOmmzGHImahQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TCkjBSJqK9IsQRtGL8mcLVuYLn4nYTLRvb9BmSbYr9lWpSfwWn80/Q4uktFJKr2ZmAm/Dpa6RJeE7sjz0o4ijYnknvM4tzoaUqV68CJk9rFDSiZy3YzuAqc/8D2kO/ktcbvKKeVvFv3iJ2e7HkWfexeZZrPVOZGZHTJ1JYTbTdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YLRjUbPS; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43cf7683a28so2859785f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Apr 2026 05:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776084558; x=1776689358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DSP2hPPChRRMgpsEd3cMQjakL+sjPbtFmawJfDI4eN8=;
        b=YLRjUbPSe5dJMfqGZ5tpyR9f439RU5Ep/0SNL2adjyDKXVDhWUYxECN7r7H6ETVz93
         l1XMYFPcDB/An/xr00Tm6w7QcPp/fkRu2iEdXevP80oZPWlxIrOt5SnZ7De0bg5rttsv
         NzoVBcio6qooukfJVDO++IQHqQ+UNvPmLb+tE3ZKK60/w1pJIpXVRHx/83jrV2qEXe7u
         lSdQ7+pNK+gWPutZvhW9ItvtRMolY8ifrBslC+HeURQzpAIOsYpXjSCa5CFR2uJckxe5
         LAdC+NSjUKoJplULjf10/9Hmz2brUa0FVKMPm7yGIUuxhi921vpY+5iJiK6l5ABBDifj
         F1SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776084558; x=1776689358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DSP2hPPChRRMgpsEd3cMQjakL+sjPbtFmawJfDI4eN8=;
        b=m589cH/vc9tXQxIFl16YZQ76Ew52OU5fWBPRIwA4fjkunH8CHSHG2Wd7tkiFIpV+Od
         v+kGpNm6vPlXPlFOnOlSWOA14HjcFZa6PcLmbxziqW26FfBrmlBl0SUs/SHlqiJz7KG1
         O/0XFEpfBKNUCLqk/NULTt3M2C1QD7KsKpj9IPNcpBr9QfBMFFGHfudcgx8s9oQGJ+fl
         DgNkQ9E/eRkM//AtGTOX6ALlEKxgRhJ6cwneMKNsMNfLqLcX7ehSRmJyHhXXoW4t2pZx
         N0V1SDK9dJukSMu+7yvZLQc6GWw1gYKWrVyhQjWPm0qMkP+EEqYKE9HS7MAVijRYehXd
         BrBA==
X-Forwarded-Encrypted: i=1; AFNElJ9IqrzM/CfJ2ELtDNnUdyXE0JchD1S6/CTMThIgfnriKBhVZe0prRaYCtvTger9HBjCA0T4E/emok7j1Z4KqUjHSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPII3+ywiMASPqHinSLBXqoyq63l8D+YOorGnHR0Z/TPYsp8yH
	m0rLlxO/EISaZi13JUw8UuO+BjMM1XMsB6s78co0JjbtmMpmbf55KPWO
X-Gm-Gg: AeBDietOlSeFTn7WuzKfkg17W5l+m6jszQ7IaM6SFBY5qpvJZWzT2GesKXyxPb/dWHt
	Nc3fueVQmcPEZIGuZfN+YdDEsSVWJrrv1wgv5TqS9bZ83mWoGD2G0CKqdwtyrVctBJBKQIb/u4j
	ngqQxRFjSs0Uuvmrf2v0BwfhJwfWl0jajxSyN/PyD3v4cvuzJk1RYmQWcVNCtLakoykpLhTwL+j
	YfY4DL1tMa6Yy6+x40deGsrgJAYfQp++dj8ROKlHS+qtxMrnugMhrWjE8pXzTxB2vy2C5dUl8Wv
	APKs1AwdlN7SWoTIu4DcEXnXkciUcCCmrMudMgnNmN8WakN3r0erpAeiBgjaYqbmj0e2AyuN094
	3PwIHOGx8AzWAHkHFeA8RYBLP0a5kS79zWS8jCaV2UWPAgo1p7rbgIbyKR3nzBFMi2cETvPDQlh
	MuU9vVoX1ol9uoJImualWHU6s124Dqk/44mRgfEJIMK43Mpufr5neBLuFMTL5xBizlROnkBypeQ
	bcebaahPfrzVfqS4U/9f1PQHcenYJp7xeit1pIKqa3D+ro=
X-Received: by 2002:a05:6000:26cf:b0:43b:4212:2ee8 with SMTP id ffacd0b85a97d-43d642b9daamr18907213f8f.24.1776084558434;
        Mon, 13 Apr 2026 05:49:18 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:8060:3087:2ea2:f494])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e50015sm34634318f8f.27.2026.04.13.05.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 05:49:18 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/2] Fix clk_divider_bestdiv() to get max clk rate supported and add some kunit test suites
Date: Mon, 13 Apr 2026 13:49:10 +0100
Message-ID: <20260413124912.3260571-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-31241-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.994];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 1F5E53EC2F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series includes two patches. The first patch fixes the
clk_divider_bestdiv() function in clk-divider driver to return the
maximum clock rate supported by the divider when the requested rate
is larger than the parent clock rate. The second patch adds some
kunit test suites for clk-divider driver to verify the fix.

kunit test case logs:
case #1 without the fix:
------------------------
[   44.288459] KTAP version 1
[   44.291655] 1..1
[   44.293844]     KTAP version 1
[   44.297411]     # Subtest: clk_divider_bestdiv
[   44.302575]     # module: clk_divider_test
[   44.302583]     1..2
[   44.310280]     # clk_divider_bestdiv_ulong_max_returns_max_rate: EXPECTATION FAILED at drivers/clk/clk-divider_test.c:71
[   44.310280]     Expected rate == 1000000000UL / 2, but
[   44.310280]         rate == 125000000 (0x7735940)
[   44.310280]         1000000000UL / 2 == 500000000 (0x1dcd6500)
[   44.310705]     not ok 1 clk_divider_bestdiv_ulong_max_returns_max_rate
[   44.341802]     # clk_divider_bestdiv_mux_ulong_max_returns_max_rate: EXPECTATION FAILED at drivers/clk/clk-divider_test.c:134
[   44.341802]     Expected rate == (4 * 1000000000UL) / 2, but
[   44.341802]         rate == 0 (0x0)
[   44.341802]         (4 * 1000000000UL) / 2 == 2000000000 (0x77359400)
[   44.349940]     not ok 2 clk_divider_bestdiv_mux_ulong_max_returns_max_rate
[   44.381047] # clk_divider_bestdiv: pass:0 fail:2 skip:0 total:2
[   44.388922] # Totals: pass:0 fail:2 skip:0 total:2
[   44.395783] not ok 1 clk_divider_bestdiv

case #2 with the fix:
---------------------
[   22.077769] KTAP version 1
[   22.080931] 1..1
[   22.083168]     KTAP version 1
[   22.086739]     # Subtest: clk_divider_bestdiv
[   22.091826]     # module: clk_divider_test
[   22.091835]     1..2
[   22.099869]     ok 1 clk_divider_bestdiv_ulong_max_returns_max_rate
[   22.100612]     ok 2 clk_divider_bestdiv_mux_ulong_max_returns_max_rate
[   22.107902] # clk_divider_bestdiv: pass:2 fail:0 skip:0 total:2
[   22.115589] # Totals: pass:2 fail:0 skip:0 total:2
[   22.122473] ok 1 clk_divider_bestdiv

v1->v2:
- Updated the patch#1 fixing review comments from Sashiko
- Added a new patch#2 to add some kunit test suites for clk-divider driver

Cheers,
Prabhakar

Lad Prabhakar (2):
  clk: divider: Fix clk_divider_bestdiv() returning min rate for large
    rate requests
  clk: divider: Add some kunit test suites

 drivers/clk/Kconfig            |   7 ++
 drivers/clk/Makefile           |   1 +
 drivers/clk/clk-divider.c      |  25 ++++--
 drivers/clk/clk-divider_test.c | 151 +++++++++++++++++++++++++++++++++
 4 files changed, 176 insertions(+), 8 deletions(-)
 create mode 100644 drivers/clk/clk-divider_test.c

-- 
2.53.0


