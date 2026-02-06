Return-Path: <linux-renesas-soc+bounces-27993-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDGEOj/RhWmOGwQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27993-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 12:32:15 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E502FD449
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 12:32:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 50C7C304AD89
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Feb 2026 11:30:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98E6C3A0E8D;
	Fri,  6 Feb 2026 11:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I04/5I+E"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8D53A0B37
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Feb 2026 11:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770377418; cv=none; b=CZIv9Qvv6tioLZlR8CyIwGExG5rG4zHSQ4u4a8yM0WP/aPKLSLcmMVPIHfjhBNrIE/yrvhUII4fT76bEUWA+yiV+FcpLDTEFFehVD2Ctaq4CVV4e+S1CpgPXJkhALkX+I9HgG7FcJGRZxh3V7+ECbwRfyz9KgB17GBdNzQoXj8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770377418; c=relaxed/simple;
	bh=R7DUQAuvYhTSo94YH20cF6tnTtvfZT6izsSg22thJ+U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E8nwcP454BYZm8sVaPRjB7DTvVbQR4eqGV3jHZ1nxyEYQE7e05UN6UYE2JptrAmK9mORbAYMFXNsBlFSrQHpnaHRUTR98IOtzwcJafayqdrvwDy7Kgsetgp5pKSSaPSidjv+4wr+yjst5gtkeFpDwX4UeMpy/E1Sdnzrv71sg+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I04/5I+E; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47ff94b46afso20343285e9.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Feb 2026 03:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770377416; x=1770982216; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sotv5YDzx4AxonykCWo6bLZEaSi1omaZJtDitN3zGPQ=;
        b=I04/5I+EJzA9NK0ZcllVbiKlB2gSLEW/K3BJITJPm/FnZCAzVvkAUtQWJHMmH0TL5D
         2iaH3gGK56uIpUoIG/WilnhkI+3TjIbR7X0JMzwHkRID9zNS1P9wlHsUYi/yhyMwJ/+o
         rpE2dphSg8KxvcNuVGcAQD7kY5XX2oGI9bwinsuHUA2YGAC04NYRjQTWiG5by0NxQ1Zl
         HB42b9HQsenplvRT8BF6dxnquRO88/orTys907eeQjgY0Anljwh/Y7P9lc8+MR3y7Byy
         hlP18BrLErv4SSINvRE7E2u0jW4jv3A54RyD0lh1oAQa4MXSiseR5tkJ4si42TMnMme8
         4xfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770377416; x=1770982216;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sotv5YDzx4AxonykCWo6bLZEaSi1omaZJtDitN3zGPQ=;
        b=O+2VwZZvBWAGoa0QGayaHZ550LyYET44FckXIdTxFV+asrAB7n7jsW1o3WNKwqWuG/
         Db65m9UKtFq+jKts2b9Sxy7czO3IbYglgNrUAzMMPVHKmLgp+W00RiL8ZkPwgjbAKl8w
         zr606uVkCsi+omRIwin70pFEmTQKI+KVFDRzWJovZ4bXIMo6OOqxwTH4pbwRwLvZ8hYP
         BDPyPH+A5F8mKwpFLL4ROwJGzr4IL7ud7I/KnvETnZOL4tr28MLMNyPb9N47Qbk1zU5G
         42GgoQL/Lt+D5l+4CXZGO9dI1hxWkntw0swr5JOOL/vpFhzHID/gKtv0t8oG/9dW479h
         kVhw==
X-Forwarded-Encrypted: i=1; AJvYcCW6BKyTc8GWXtyawvp8SZuG0IJgD8JX5tCSjXfXMunCL2LlHFYtpVpzTKOkl+7eZvAPNnvGAsDgSuETJTEENTornw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5gye9o1m2Ioy3bPiPc84EKqr64VB4/Yt4AskBbeO+8NAY1tSI
	OiYZMGt+CvQSZPVX7vn4m4WUu2QuMcIWS1TUc15btDQXxajEwgCW+Lzv
X-Gm-Gg: AZuq6aI3jXM/rKw1kvYDa7t6zsk8aPCQxzOOj4e6DcWdAdSpN5gki/vo2IPk1XEzOpM
	p5cdgjn7lSVgMoftqF7/+u/4QcQdtIUT5v+ULngaxlaHm1RwxRiHFhg0iOoV/h0Cir1V5yNWvpo
	lFA+FTHSQJopHeetGjrh57nm/gXjwCBdYRI4ohYy5AkF1AhI3J20LXNBJPGfpCO9pSTsd43GOoW
	5TRvaYsnZFNOBgkCTdbGyhTWBDqAAGlHKoOGqHdv15Xs9WOQKR9xtR++1HcwjTypd/NCx38WPCv
	fdgj03YHaMdN1J/iI2CCqHHxTLq2hEQ3TrTTYbphD0QD4b3Rt+by0htVc2pV8TKQMbsijHvzNJS
	nWOg7Dem2T+LyayIyMX8QIr8wq+4czphccqC4oBOUkcy+ppywRPQwwYcJwJc0KGfgsOojHIMION
	U+8IpAN+xlvB5U11jyEQ==
X-Received: by 2002:a05:600c:6986:b0:480:1c1c:47d6 with SMTP id 5b1f17b1804b1-483203ab641mr33367465e9.6.1770377416468;
        Fri, 06 Feb 2026 03:30:16 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:1e64:f8d5:9d7a:19d4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4362972fc1bsm5309670f8f.28.2026.02.06.03.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 03:30:16 -0800 (PST)
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
Subject: [PATCH 0/2] Add support for Renesas RZ/G3L WDT0/CA55 core clocks
Date: Fri,  6 Feb 2026 11:30:06 +0000
Message-ID: <20260206113013.233432-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-27993-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8E502FD449
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

Add support for Renesas RZ/G3L  WDT0/CA55 core clocks and reset signals.

This patch series depend upon [1]
[1] https://lore.kernel.org/all/20260203131048.421708-4-biju.das.jz@bp.renesas.com/

Biju Das (2):
  clk: renesas: r9a08g046: Add CA55 core clocks
  clk: renesas: r9a08g046: Add WDT clocks/reset

 drivers/clk/renesas/r9a08g046-cpg.c | 36 +++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

-- 
2.43.0


