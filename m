Return-Path: <linux-renesas-soc+bounces-33370-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANFhLJQMG2q/+ggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33370-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 30 May 2026 18:13:08 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A67B60E011
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 30 May 2026 18:13:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5AD1E30A743D
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 30 May 2026 16:08:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4454B33F8B7;
	Sat, 30 May 2026 16:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DTpB+7IJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A6C33F59D
	for <linux-renesas-soc@vger.kernel.org>; Sat, 30 May 2026 16:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780157317; cv=none; b=pmuJq5XehirooTVmYYSXTG5BOGzSm3REIlTOlKrUU74o1J6n9SQ4Fvkp8rYuwMgIZf12Pfub/HY5GHKxuC8rzE7kAyjWP/iIaBorqTduf9ep2A4mqtqsq/fj+w9+8QZRmQBTZweSbNKoEO1td8Q8CAukx0OqrNmVYiUon+BS+MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780157317; c=relaxed/simple;
	bh=Owt4UhDYyoqlak1RP/aZ4wSyc0y7MkZ4NXK/flnkQTg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fM1a/8xWHd8jkicmpgWy30w8p+PtqxBxI0GW4PqZnl2t3fs07sgDZqlS9i4QgXFN22gY+ZoA4qBSdZ5mGV2KYyvZZwOW9mTCMlewDvC4nlhElBwT7dD+CShTrINRy9mr3xwaCRGBYdbWXj99Djx1xcit78xETWXIqJ56GZdnPOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DTpB+7IJ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490686877a1so47663705e9.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 30 May 2026 09:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780157313; x=1780762113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ttG9dNHQjkNjpv+ijSMYFkL5/U5ISQtOPA8aCgiOPIY=;
        b=DTpB+7IJwff5+I4e4Oqefs1cJ+SN6qYBjwQGune81quSmW3zBgNm2N5HPKmhLwqiLQ
         Z9tbKnZUSlfNpOwEYejuz2agd+3ac0G98n+uuqyax9aWslIP4dGFGOT0ni8bOJKv/bP9
         KiMqIa4i9n7hrHwR2QOPYvo9dy7RBlHlNdAOra43rSZLFoPoQx96CXM9fausPmZa10Kz
         j4i51reP8YHw/HXBPsiBsir77L6RcQB+lSK9TU5Rk+thR/vSrZeiGgEpcyIj/aCw8GUT
         il7ejD9C8oAwJZIrQSxkRzuRrqi3uSaswfdwOsPmj+9CPrWAwf1Gnz0yk57ERAvKqCOL
         5zmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780157313; x=1780762113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ttG9dNHQjkNjpv+ijSMYFkL5/U5ISQtOPA8aCgiOPIY=;
        b=URWbWG39LJ3kRq+RQIK1Dk3LINRuhwbeeDdXalT1MRebP3OPkETdLlClBlkcVJ5O6a
         jDeDVmJkR+4oTTdx2xaG/Y6J9Vt8dJqacDqB07CfliZVoD9V8oSfkEFEMcDkRgIq8ZRL
         yjzvOEPbJgeKOZ0IOR5gNHwoo4242YhtmzAzmA3tRYfnuO9KrufzkvkMUsJqlk8BtBHv
         ut5/d2Nq7xLTbkHxVnvliqHI4mT+S6c5TuW5TQkbzSPO2shbKHWytyKY+H+QiqMRMCPs
         w2RE+3Ca6zaRhv4PTEuddcs9VMdfSP5nnStkPcR3dgep+IlZUPYA3bS9+QaWt9pXDbai
         Hd/w==
X-Forwarded-Encrypted: i=1; AFNElJ/yU4FglfmgOUzl8blV+G9Z8FdWpj28mpnOzeQEzkiT3732oTd2yUDCEnTVKy91/Jz6LjON9YOw0QztJmrXVWOOew==@vger.kernel.org
X-Gm-Message-State: AOJu0YyuypA3CuT1PBiuZM34fBEcKZrUEsxMau6Rp/bVmL3nwxnvS+k4
	nlG354X+a9w929rXevz98aQh4kWPJgcSkQgZAsWwkRJ5FZ6grNRDCXV4
X-Gm-Gg: Acq92OH6ROy/FhYOsxERRL4e9Pt5x9w1IjkpZprbanz91YWs+qgVRvtDW2JKDZZUB0s
	6MpsBimQYtpPgEznURHQUnwQ6Sb5izpGY1gvxocVc1jcwyjPGegCr3a/O+K4BCo/f9s+gJC6a4w
	VugMz08bMVp2mzpHN7+KTXwKLSFAjOMStX/eGWBktC8MQgKNY/gX/farKQSYJBqPjRyt5Ufj4Dp
	zj7w04Xl+z+aaAfVm1ZlEJHiPftC0CXcbpcq8lCIsxQwWAfZpzfhtNaGdfbP/yJVgoGDx/h8LA3
	aoDLBYVusj+kZ4c4cHWW3xjoGoFdxzLu/OfT8nD25Lyi8PDianrZWpCBir0bvINYU1W6PE1qUZb
	vC75aGj10T23MjDvyM+Fig97U1JYJkAZJ7EwwyP0+SexP/xqM52pPLUNucfDsmkvEFo8Gwdnl33
	y1S+ZyZc5qyQNlc4UZablDx9IBXZaaliWYUI2iOTW26ZZ95iDLP9FZC6lJ6aBJTp2mnNoGFg==
X-Received: by 2002:a05:600c:3545:b0:490:50ff:d394 with SMTP id 5b1f17b1804b1-4909c1670a5mr114901055e9.16.1780157313534;
        Sat, 30 May 2026 09:08:33 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:5db6:a512:6ab4:aa07])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef35874b7sm12170799f8f.35.2026.05.30.09.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 09:08:33 -0700 (PDT)
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
Subject: [PATCH 05/17] mmc: renesas_sdhi_internal_dmac: Fix whitespace alignment in struct initializer
Date: Sat, 30 May 2026 17:07:59 +0100
Message-ID: <20260530160823.130907-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260530160823.130907-1-biju.das.jz@bp.renesas.com>
References: <20260530160823.130907-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33370-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,glider.be,gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 1A67B60E011
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Remove extra tabs used to align .of_data and .quirks fields in the
of_rza2_compatible struct initializer, replacing them with single space,
consistent with kernel coding style.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
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


