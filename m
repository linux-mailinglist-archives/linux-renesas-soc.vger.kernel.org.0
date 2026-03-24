Return-Path: <linux-renesas-soc+bounces-30133-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GsYB8P0wWmmYQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30133-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 03:19:47 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7587A30115C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 03:19:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8FE1E304D94A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 02:11:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D52363845DD;
	Tue, 24 Mar 2026 02:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dr79q3pK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4C037EFF7
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Mar 2026 02:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774318282; cv=none; b=CzEXTTf5sfuhKtOfGQNbHW1e1vQLsNfl30liB8U16Zzw53bj/SqjIA/bMmQunuut6E26/kxZCG3A9obHrCLhq93LXG9FLprOpSzIdYEntNyyEE0EcMEo5sJoKnF7m+QMI5ijdjQZs9+IAcBInqOSMjBMmxhf1HQRoz19TaHlvKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774318282; c=relaxed/simple;
	bh=5LCSZy0QNtO4bzoIvyj24RyYrTxJ4vg7ZKTxOvocysw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Pc0PKWygLS7fqBavamewKH4D6BbCAIPG4mj8NpeJ+gyRo0NzzxPih8ao8GFmaDxGtv/LSv8WBUl8OiYhqwbjCZX8l28RB/VINVuIBq/Uhumnt1mNa7AcFolo9h7KqFYYFmmzXGAl7ozVkngkARQIj4iDA2/Gz9ECMOhKQ2vQwmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dr79q3pK; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-35b97ed057cso2090097a91.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Mar 2026 19:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774318281; x=1774923081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pg3BeEF/NeYvq9HpPYQyLEWkUbXwDTNUoplMULCqoG4=;
        b=Dr79q3pKlHDZoriUdWMx6Rp0FzjGAH+djAn8d7B40mgLTveQDTs9vJY2ygw8V+/8ma
         Dgq2Hb+09dZYJiOSBS7qX7lpoSF7NowmV+QPwK7Sk2tV658rueIF8+nCcrXuS/u2kvOh
         gujUAVBF6XKckecqAbUGr04HCDa9HfGqDxnz16RGN3BkdhPI7ypFiQdLYYyGCB836JIs
         lgsKHLhWucDa5s1i661bSlPnT3k+JSyqAoYV2dJIXWb+yzjQ4AjohxsbVWWOr595F7mR
         h8EmvYe4DvK2vfOZUr1JbTkVRapjH6rebMAGBEWUP9ggKWoC2DgJzceDLj4B3IZKqSCJ
         1A1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774318281; x=1774923081;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pg3BeEF/NeYvq9HpPYQyLEWkUbXwDTNUoplMULCqoG4=;
        b=ncIMbrQsWzfRxdakI8JQb8gzrN0916pS/FEyMac/n1znZeFITRWSjSecad9rR5qHki
         NUGc3soEQVRY4mDVLY5JdrLhq0lYYqjx6NytlBpR1SgNVmtxgo/KeKr1ufXKmkSEtdAn
         Ml5qO2l7ocvo9vECQvR4AfVG+hSWmXbzOIuL9iwa44pBmzts8Tz725Qp8tdYbRMe7TKe
         Xgdeiz2+0ZlcaWtXcIqvx6Wecf/JSr9Cr1HHhU3509xq1+7M51px2YlJ26J/NAQ7MGPW
         nvw+BoFZOEeK9DjvugqnC/NSpqthRyvcyPj88oiBAvY3If/PURmJV098Wgb7XvUzXTPk
         FGoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUinreXVDbDEnZegP0wLRtrkt3AGuwrBlOuQrI6KTbCevP8j2Kip2b1ZGaAfuuyf+BkcNImvuPgeUtg2GWadFZbEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YywKkKGyzB5u77Dsnf6tvT7sjOU0iQLC18N5/tqUz3oCza+tpPh
	XmgAIA1yZmlphaXgCnykL82rO1HfSTynJCboMW2ZLCf9+5xcYXzaoEUI
X-Gm-Gg: ATEYQzxuWvfw1kdSvIC7FJewlU/wQYgpgw5FqTkat3eYarGTYQlUoD09OFhzehb0LYJ
	dm0p3cuHM8knv6IQArS/UKcUb9Jl78mVHDfGijcyQYw36Gt6K8q2vUVJmNB0hNlooyFyVGD/j/8
	/uf6GnqIPNiIrhHHcNmFfQ7zv29TZMiiInhRtsd/9F+McP0Sbd6vs9QQTSVLyqIIp7ZBa7NqW79
	d+YKXj0x3402/u8CzHu8kaR6wcWmL2NpRUy4rNB+S2SaOmtAeoUCrkCyNIRNuRBy9LRFwxsA1kF
	Rk3Jj+GWzvoWbGIa2MvO0cbmuhTZTLn76RhZdqP0gkYcKNdh3IYIYPJMCfNF8hrHMXRy9aGi9i/
	FR1hhR86zmXxDZyDTe8/Ws5EpZvEzmSNcRwGwBOQUfyKfCL0qXzPLs24VBseCt9BUs5tLsj2ytf
	66KbkhWCVikEyp7E91FeLfLYddWi52UfQ5mHh9YBpMUswc6IOFCeKlTXo=
X-Received: by 2002:a17:90b:1e4b:b0:35b:e6a3:41d0 with SMTP id 98e67ed59e1d1-35be6a342admr6003709a91.26.1774318280932;
        Mon, 23 Mar 2026 19:11:20 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c03149db2sm457965a91.9.2026.03.23.19.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 19:11:20 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-renesas-soc@vger.kernel.org (open list:RENESAS CLOCK DRIVERS),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH] clk: renesas: cpg-mssr: use struct_size
Date: Mon, 23 Mar 2026 19:11:03 -0700
Message-ID: <20260324021103.13651-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30133-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7587A30115C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

struct_size is what is normally used when a flexible array member is
present to avoid accidental mistakes. pm_size is still needed for the
memcpy call below.

Added __counted_by for extra runtime analysis.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/renesas/renesas-cpg-mssr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index 64a432fd0e8a..26ea85cfaa02 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -569,7 +569,7 @@ static void __init cpg_mssr_register_mod_clk(const struct mssr_mod_clk *mod,
 struct cpg_mssr_clk_domain {
 	struct generic_pm_domain genpd;
 	unsigned int num_core_pm_clks;
-	unsigned int core_pm_clks[];
+	unsigned int core_pm_clks[] __counted_by(num_core_pm_clks);
 };
 
 static struct cpg_mssr_clk_domain *cpg_mssr_clk_domain;
@@ -667,7 +667,7 @@ static int __init cpg_mssr_add_clk_domain(struct device *dev,
 	size_t pm_size = num_core_pm_clks * sizeof(core_pm_clks[0]);
 	int ret;
 
-	pd = devm_kzalloc(dev, sizeof(*pd) + pm_size, GFP_KERNEL);
+	pd = devm_kzalloc(dev, struct_size(pd, core_pm_clks, num_core_pm_clks), GFP_KERNEL);
 	if (!pd)
 		return -ENOMEM;
 
-- 
2.53.0


