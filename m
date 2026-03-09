Return-Path: <linux-renesas-soc+bounces-29063-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFYVOhD9rmkxLQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29063-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Mar 2026 18:02:08 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9651423D46B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Mar 2026 18:02:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 426D23028B5A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Mar 2026 17:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E6CF3E5EF4;
	Mon,  9 Mar 2026 17:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LAZdRNAV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E438E3ACF14
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Mar 2026 17:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773075602; cv=none; b=j1GrqHMlxsODV8XxQadobGm5QH2H8OAZ04vwYlvcqe2UXeFl9hlkjWZO8/Zc23FkUcX1pjSu6iZ4oOWkDuZR+ck8ZKO8yMHc5/MBW0Bmf1Ti5E4KCZeO1RuBTwSQRDetOa4nrXa629r9ntMc3KY3rzbJjwJuy3DGdd8InlClNeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773075602; c=relaxed/simple;
	bh=TGN2kMRZzg0NZJ8YyHSMBnffuhVU5z381ICMdB719Ys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mgccfstW44VXXw6idoC4t4/nay4zXyriCS6qDDnTQy0wvWh23I8G6GoNYiQ3Z7E55O8+IDxnE5by+IFNr9ig+v0nJPSSb4Ajgjg4q3G7BwkDJWB1G2xcL07vEAyecv5lnYqU54Eozzg5CL9UJJEUarO58ZFRlt7yM7KI/cE3q+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LAZdRNAV; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-439b7a87fb5so5421541f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Mar 2026 10:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773075599; x=1773680399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pIh603JsJ+cKEApksgrJBCFG1wpFyxsF3D4AloDzLvY=;
        b=LAZdRNAV3rMdEisb3Wk9KRNcZPZNymm2HQm1FC/HQjLv/k48ifLw4joE/1X9Aro5hp
         86Ndmg/yvrVLh2suDHgpcSDaRz8hl4LITtcex2KOUIeKD98N/4+vlAVwVcyotxivzSIu
         x+rl2Rw0UoLA9ZAkLTexn9SRO8h8fllk6abi5vtlzCHulq0sChQRnQY7aFz6hhbMqSOx
         2bpBXXJ5D3WSwXbJ8WFjdl5EN87xh27U5CZY6bvseWPXOYK7/C0Pxlw8Cnegzaqq2Zpn
         S9DTDWdHI0m1fACIApgMmULekq8ktj9GOHzX7cIHZd2jsZZ7co3F0kupCB7jPYt5bOjT
         dqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773075599; x=1773680399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pIh603JsJ+cKEApksgrJBCFG1wpFyxsF3D4AloDzLvY=;
        b=pEqchgq74lSAgXExkdPl8Xhi6D07j5q7lHbqSuMk1F4+NoqNcAmRHBkeAMrAKYtNG1
         a/+k7qgZgflsLxThHQON07MIog0REP7h58EOjIU027eQCKFuj16VnHzxCWDrAl77edcM
         UkoPe4zpa2s4yZo9QOwa/8f+qsVKdbXazNEGFHrQ7aNp+78rcwRUplqmj/h/wVrG/9KZ
         aaHaOUBf1aA1b5ZvkZps7fy+fwjhkNTPEuPE/MUK/Yb7AiRUNG3wxaNzbe5QP6I8D1gL
         G6BJhpA5XCZI0L+rzHc2SO5t24M5lE4TxeLbWYA6zfP7cSDZ0vDeGJXoxhh8bCVJjXXi
         UwLA==
X-Forwarded-Encrypted: i=1; AJvYcCVHjoAqg6FjvOX8E6WBZi3aA3nD/pJp0HjggWu7w/RietalnrE+8Fz0ufLtfqkJHVgk5c2SYKAL7UtsPJsNIumJRA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQz4ANuO6wOAJxzjvvVsRCh7+XKDr3cH8DzbcnVfcQF+8y+07p
	HFBCApvzFRVmG9JUlancwfXtDgd0AYC+tO8RB5AaXAuCMfau8kwpyuLGPYiitkuuwvk=
X-Gm-Gg: ATEYQzxy5I2P75qERYVB2Q0TYiI9A4odLbdQ53qf/swhKPccEwMOKQDmSAtgbLSoyjc
	GSgtcpusdw2W3AKiBbtu79JZH+q+jnvQyWnqyZ0evPwW8T2jINBE7iitqYvZElcyMNQhW3ewSGu
	+opzgtY3ydIyTcFfcnsQVDxW4w6IgJ0dYACAPWM8xdJRhb/MJ5AkwHsonsqRFLjCq3IbhpWy9by
	2qTmZ9tYxqX3NMm9hTNxUzQKN9lFyoOxSAz0NUpZ/3aqrFPwjO5cVp6dlZjdtoGdlc+RC1FIp8c
	/YYeGtgvAwhNHVdF4SDerGzzv6ym0+M2MY+UuBGqHn3p9099Zx8BVDFlB6dLKxdHw+MxjkEeQSp
	jR3blhuZsG/IgDEn/nij4j62kBFyyX6orYdqjvJxpFa+hWyFtXE3LqPcJg7NVqIvUH64AOHglkF
	hgGTYC/2HvkenW7g9hHdSYdqraJzbn1r1QSBM8r2YPyaWpdpod4iLT4vJrCz2npw3ozTDoKc+vK
	CdmYLXY5A9VYQvDV/5ewkpKsq/6F6x/r8WskxRM5eqx6P3nlgjEbf8jEw==
X-Received: by 2002:a05:6000:40de:b0:439:b744:c610 with SMTP id ffacd0b85a97d-439da3488ebmr20554073f8f.8.1773075599158;
        Mon, 09 Mar 2026 09:59:59 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:a11b:83ee:a423:4205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad97abasm25596307f8f.10.2026.03.09.09.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 09:59:58 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/3] soc: renesas: r9a09g047-sys: Mark rzg3e_sys_init_data as __initconst
Date: Mon,  9 Mar 2026 16:59:45 +0000
Message-ID: <20260309165946.3003731-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260309165946.3003731-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260309165946.3003731-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9651423D46B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29063-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FREEMAIL_TO(0.00)[glider.be,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.979];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,bp.renesas.com:mid]
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Annotate rzg3e_sys_init_data with __initconst as it is only used during
initialization.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/soc/renesas/r9a09g047-sys.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/renesas/r9a09g047-sys.c b/drivers/soc/renesas/r9a09g047-sys.c
index e413b0eff9bf..ea3ca10fcc33 100644
--- a/drivers/soc/renesas/r9a09g047-sys.c
+++ b/drivers/soc/renesas/r9a09g047-sys.c
@@ -139,7 +139,7 @@ static bool rzg3e_regmap_writeable_reg(struct device *dev, unsigned int reg)
 	}
 }
 
-const struct rz_sysc_init_data rzg3e_sys_init_data = {
+const struct rz_sysc_init_data rzg3e_sys_init_data __initconst = {
 	.soc_id_init_data = &rzg3e_sys_soc_id_init_data,
 	.readable_reg = rzg3e_regmap_readable_reg,
 	.writeable_reg = rzg3e_regmap_writeable_reg,
-- 
2.53.0


