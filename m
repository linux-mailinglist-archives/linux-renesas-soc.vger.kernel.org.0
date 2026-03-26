Return-Path: <linux-renesas-soc+bounces-30329-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHqnCqQTxWmr6QQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30329-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 12:08:20 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0677B3340E8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 12:08:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9811B304E781
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 11:07:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C68638C2B6;
	Thu, 26 Mar 2026 11:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AvDJ41f8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463613890ED
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 11:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774523215; cv=none; b=CZh/hEmac4iOx1nG66ry570/mZ3rLILDOGlkC4e4cY7ANrO/prWDGSZu+NGi5U59bjfQTtiwdY75N1uzGcyFja/l6Z53H+M3YdcjVZa5yM09g+WnUMsoKufQfRpl/ZC5lApGKMx5WhKBK4LvU/PXBNbt6dCeZJYb2Q7fF23KVZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774523215; c=relaxed/simple;
	bh=G+Y/G4ELK2p87HSpdmbvoW3DTLKvxeWbhDl98ZF1aZY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cpOLXIC30eds29iRS9VeLySg9M+pb34/45xgzqoqaRQTJXZww10RoNE5m7Y5VdMV845/xV4fR1cIPDMvbNhjdZyG8zt2L7p5prZdwKq8lTSr1rlG/p2aBL+Qw+RYYvuyzMNguDqG0iebmLMIgB0vxV8BJY2vK0eJPp/xbMIJT0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AvDJ41f8; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43a03cb1df9so746601f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 04:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774523212; x=1775128012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4ywyE0xSmTWKuu332KX+kt1wb7US9niERfVx6FOIzGg=;
        b=AvDJ41f8Yz6Ad5bDAWV9+7ReQpoxhmQbNMUl6+3TMyv2MTpmpSyaHZODZ7UyLz3vho
         Hlgp6xY7EZPtcadaIy1UQRymd60SepE6NxuFCVi6mJc6gW//NdI2dHJ0g40m9Ub4Sp0N
         ZZX7+efw1d13b2TUttHTIN8aIQxqkN808GrFmNmY6UvXcrbbyDQ37n9JDx0iqTO7n2mw
         edEzeGuNlp9otzGCuSKSZDUXTpizMkEbKq1rSx29y7xjVsYxkwvCkoon8JVDpWV91QAU
         aoX/0RcY922GS7hwET3PHK4QHvLlxwSE+aW7Z9zvjPsDTst3UgVGIQJ7LqJIRLOkJHhB
         RJ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774523212; x=1775128012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ywyE0xSmTWKuu332KX+kt1wb7US9niERfVx6FOIzGg=;
        b=OHD83wNWKk07ukjw6So429PFi0q0zyzfS2cZT8uYE/6VhA9BBz8ADxhfKhj4e4ymcp
         VB6PjREh5gwxb3vm1wIV86AyB1FDBTOiRdqpB95QbJSe33CVcK1N8YlBkPqK3WOx0Ro0
         G2ippDGZoO3taCiqiGdk5zukzQvL+k+pMt0GoLqFuuPhMTyUdw6DcT+IHAKTD+xe40q0
         QwnjMtkmMF4yn4q8i6Kaz0og4N9HM5Z23bMmo2IhS/wFYU2rb+ZrzqbD6q+3jSiAyW0s
         i9hKCYvj/eTUrFC63nMzDDOrjhg1cF3nbedJU/0JmTaWTtFvAc1Lbd0snYl5X/Nx53Ic
         Dgww==
X-Forwarded-Encrypted: i=1; AJvYcCVZ3MysH+VvJpRc47Y5mr+398duyaHEQTclxXtLvfn/Jp2CBTzKcr14N3mAnwG2jiAXFmXzR96U7VdUcD+6rlGo/g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2j4Zd5qyfwOBu0TbCLbgVI5dTyvSdWPU2v3cisgc87EJOIm14
	pLxQshhiYAs6r4FTuzOv8Rkwi4/57txsFNXTxO9t84ILoi1WpJ/Vy96G
X-Gm-Gg: ATEYQzx53OR8YAXT5i2L5jNWyo0LQN/UmsK5vrP1rkSN5WCoiyVMLgQDPTEG2gtsxZz
	DqxK5MITZVadW18lxFEKerHPmbZi/S+C5iGqihkNeZN/UQz+JA0v5HE6lhrkGj84wbRMYKirKXp
	7RyEoDgYmreYsPOhIrK1DqaUZTeJfEEfzt/iRd1sEgN4hlL0ZVZBYP9T1dnOj/XTSYkQixLPwnO
	yjD6kdoQLR7FN33oMwosZ5x9i1yDTCI9ATqy/Ri+0yep9JwwvUi4BnSiMn4wtDwQDNv70OOAImn
	rlBUqJv0n4UpYbo3bqO8RBfygu9FeT7d5r1+PtayMgBMHpzj4apZiNvndZsTu1H0FaZ3yyxncPC
	KUimp5ZhDE8NJdtkcNl7F3/NNsKK9xvE5vlm3cb+J1VS2gpnUbg8QJ6S9cCfpv7wKR0NRbzGg5B
	P7okh4PzaRA6rWlqqJRcRi/X5KcdI2z90Iqs2NeSjsjcqCOgRw
X-Received: by 2002:adf:f210:0:b0:43b:8f56:1e1d with SMTP id ffacd0b85a97d-43b8f561e71mr5352221f8f.13.1774523211372;
        Thu, 26 Mar 2026 04:06:51 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:377f:9a3e:6c94:560d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9194311asm8626084f8f.10.2026.03.26.04.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 04:06:51 -0700 (PDT)
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
Subject: [PATCH v5 0/4] Add support for Renesas RZ/G3L GBETH clocks
Date: Thu, 26 Mar 2026 11:06:34 +0000
Message-ID: <20260326110648.29389-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
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
	TAGGED_FROM(0.00)[bounces-30329-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 0677B3340E8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Add support for Renesas RZ/G3L GBETH clocks and  reset signals.

v4->v5:
 * Rebased to boot series [2]
v3->v4:
 * Updated commit description
 * Fixed mstop bit for eth1_clk_chi and eth0_{tx,rx}_i_rmii clocks
 * Added r9a08g046_no_pm_mod_clks to avoid PM framework enabling both
   rgmii and rmii clocks together as they are mutually exclusive.
 * Fixed checkpatch warning for more than 100 columns
v2->v3:
 * Added eth{0,1}_{tx,rx}_i_rmii clocks.
 * Collected tag for patch#1
v1->v2:
 * Separated ethernet patches from series [1]

This patch series is depend upon [2]

[1] https://lore.kernel.org/all/20260128125850.425264-1-biju.das.jz@bp.renesas.com/
[2] https://lore.kernel.org/all/20260324114329.268249-8-biju.das.jz@bp.renesas.com/

Biju Das (4):
  clk: renesas: rzg2l: Drop a check in rzg3s_cpg_pll_clk_recalc_rate()
  clk: renesas: rzg2l: Add support for enabling PLLs
  clk: renesas: r8a08g046: Add support for PLL6 clk
  clk: renesas: r9a08g046: Add clock and reset signals for the GBETH IPs

 drivers/clk/renesas/r9a08g046-cpg.c | 153 ++++++++++++++++++++++++++++
 drivers/clk/renesas/rzg2l-cpg.c     |  70 ++++++++++++-
 drivers/clk/renesas/rzg2l-cpg.h     |  10 ++
 3 files changed, 230 insertions(+), 3 deletions(-)

-- 
2.43.0


