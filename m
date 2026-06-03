Return-Path: <linux-renesas-soc+bounces-33479-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fXNvAO3RH2qgqQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33479-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Jun 2026 09:04:13 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 53097634F60
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Jun 2026 09:04:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=VwFVfFSL;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33479-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33479-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B0D25310861E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jun 2026 06:58:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 278A939C015;
	Wed,  3 Jun 2026 06:57:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444F53FB7EE
	for <linux-renesas-soc@vger.kernel.org>; Wed,  3 Jun 2026 06:57:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780469866; cv=none; b=UPlOJ6KozIe/UB2hXbFILU6ZQfwbHJ3bmyiKjijW+cH98ANHjnPUtULrOJiXqBP8agXNpNOFOPzA8QxlBxabOaZ6kv+Vkrq6868AJn5Wh5v2cmFyRSzZGduUIw9QVV2ResLKIZrrJkRca/A25hRrAkuQK8KXlljGDCLBq0MBQs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780469866; c=relaxed/simple;
	bh=C+h0Tj+r5ZWZxe+aF5lrXQrv+HoX58xjGfKt5zIrl6o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lgNeL1pieWASxgkbD1KCcdXeHzUeM68nvkYrYe/Ke9DsFdV8Dn15Y8zOzRP598tlv86YfyLIU5bsueW50WxfIiSl+7SSsZddq0DwZRZUlhfFtRUT9hM8mNDJCtU3+RQ1zNsFdaiAdVwFwSPuPYlLFpFaGjpwOjvlK9n0uuCCscE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VwFVfFSL; arc=none smtp.client-ip=209.85.128.53
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490ae94a89eso23374475e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Jun 2026 23:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780469861; x=1781074661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JzLfIvOTnyp3/lkEWcs7a45/5McjEOZmlv1uoXxXmBU=;
        b=VwFVfFSL9OGvnjZXpoxgXpqOv1k3t1pkZgDCUok4SdSpjjT4D+npnO+5Kbc853+Zjp
         fw0A1OPT3XjH7WwV89u9pv4hO9qPtWKZsXXAA7EeOBO7ikxKta+0oMZioU82VVtKxmdX
         UltlELruIpkUAS2QaQ1s0BDIwcxoQQzh4Z0MOtHFxBRFrlR3eZgpYsbTV0+3RUfQlxX0
         dSOI87Qy9ZSxQ4sivji9bH+aCkGxtGFiARyDISqqqFbUR5hiV1U9y6BR6w5TJ7sLNj+p
         P3IDYBeF15xXIOY4QtFHH7tkBs/l6v3XVlekrA6HrxRoB06uRvPEPuGjSEeh8j39udI2
         XF8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780469861; x=1781074661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JzLfIvOTnyp3/lkEWcs7a45/5McjEOZmlv1uoXxXmBU=;
        b=fE2jmzCoIMtendMKCIEw8Uq0OAXtxV/l/0hbDVuGToL8jCX60rUDd8VODQlSKTxKUL
         xGQUTTcEE8T78iOGUy98UHX4awSLsE9BcSHpC4qDYDDXYCTLUasOrhgSCFubvw51pDNG
         9jtkLi8yq68GVqqSpB5cuAW6YaVpWgdoejRZnqAr9BAuAlzh8+i2tyHqM+xFoVp6AczG
         FVS8Kf9XTPrWual1rlmdTYtOwWKgRwDPCc5/eRlCV9++DLjMeC8oYgoD9VQDkf7J4KPG
         lfr3nz093tgl+cHNoRu+fZDmT1i36Hd9gPYaGiVPJmSba0wSVGxeGVFnAHfrxushRYzA
         EGSg==
X-Forwarded-Encrypted: i=1; AFNElJ9Fm9Pc1v74S6Zma2tzRZ/x85Py0qVFfTv5hjReg9VYOg4CAsXU0uLhjXhTvGanXZ4oSs8tOJMhblUClz3vb6Rz9g==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk30eAoR1rg+BiIzwhCioldkxBofBEZGPkVITaO5uitGaRYWVr
	9ZLr7V+qUxDZ3HoMHgj//GzPaIfQKLYi0e8atuDZS1YAw9XZOaHUCOFg4uuMrg==
X-Gm-Gg: Acq92OEyNezpCjgbOEyiPOxzVpCR6sGEgoKGBHTa8f66GFeTVtfFuxwKjXWi8QCdL8w
	CoPR82xiuCakcFpZ5u3Zu65XceO+cPdIeQUc/wxgVUNzf8qxdI+TssfqNCXuM1zuQcYYcv7fm2T
	xA892+cHJxu/LdLULF6rkanZQKjzzMHGTq65YfoXtV+8oc2M8I6pHliMaUeutqKuh2BT11Dnww9
	g32nkyXesM3jrvez+AzAJw288XO1aecmJb7NkwWtoCJVIa7H6V++WGJ3kyJcJY8fcAwcxJpqgYe
	ShdBllv0c8cBcvzKrrbg3yi1MokjNkdApMKKJXozOBI52z3YWHXLIF+Uba4iHc43uFCNYMTGF3m
	2+EnpXa0RvVbd6UQE8PVlTDYCwXFhqtAEoCYQbf7e0EidVj+18RPpfIIwgtmCKi2ungO0fctm4R
	wvOWXYnfvPHwlTiK3qMRu7KzUCI2AgCxqrLcVtJwOsFUtmY0U7x2+mdJ6a5pg=
X-Received: by 2002:a05:600c:4fcc:b0:490:59cc:999f with SMTP id 5b1f17b1804b1-490b5ea1016mr33443905e9.4.1780469861369;
        Tue, 02 Jun 2026 23:57:41 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:179c:89ab:19f6:9ba4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b79d90bdsm9001855e9.0.2026.06.02.23.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 23:57:41 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulfh@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v17 05/17] mmc: renesas_sdhi_internal_dmac: Fix whitespace alignment in struct initializer
Date: Wed,  3 Jun 2026 07:57:05 +0100
Message-ID: <20260603065731.93243-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603065731.93243-1-biju.das.jz@bp.renesas.com>
References: <20260603065731.93243-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-33479-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:ulfh@kernel.org,m:biju.das.jz@bp.renesas.com,m:linux-mmc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert+renesas@glider.be,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:wsa@sang-engineering.com,m:geert@glider.be,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,glider.be,gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,bp.renesas.com:mid,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 53097634F60

From: Biju Das <biju.das.jz@bp.renesas.com>

Remove extra tabs used to align .of_data and .quirks fields in the
of_rza2_compatible struct initializer, replacing them with single space,
consistent with kernel coding style.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change.
---
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index 024edc4e5fe6..08cf1604ef1d 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -272,8 +272,8 @@ static const struct renesas_sdhi_of_data_with_quirks of_rcar_gen3_nohs400_compat
 };
 
 static const struct renesas_sdhi_of_data_with_quirks of_rza2_compatible = {
-	.of_data	= &of_data_rza2,
-	.quirks		= &sdhi_quirks_fixed_addr,
+	.of_data = &of_data_rza2,
+	.quirks = &sdhi_quirks_fixed_addr,
 };
 
 static const struct of_device_id renesas_sdhi_internal_dmac_of_match[] = {
-- 
2.43.0


