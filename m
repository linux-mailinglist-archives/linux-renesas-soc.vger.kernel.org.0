Return-Path: <linux-renesas-soc+bounces-32914-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJROGFcxD2pSHgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32914-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 May 2026 18:22:47 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D440D5A92D2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 May 2026 18:22:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5BB7C350A1F1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 May 2026 14:51:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE0963D75AB;
	Thu, 21 May 2026 14:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IvJCklfU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F8D322B6D
	for <linux-renesas-soc@vger.kernel.org>; Thu, 21 May 2026 14:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779374886; cv=none; b=qSpnnabqv+D3ltSYUxqff6pqoEhlR77L+rTaRCU3rwoIhAcpRTDDkBeaTu5lpIN9zVlmqu1E3YXtn62kZ83eAQiNF7nlStmvsN4BnMmRYXMDtYiPaQNV0P7Zxwef33jPyodrMSDfFGR7HGWO63SCjHyrEpGzeJ6+6xnTl3lNYcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779374886; c=relaxed/simple;
	bh=fbgf4rB9r0KXPx1Oc+/VkrmhBfp5gpn9s2sD43BntBI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lmKxa2beuvvD+qJiGCAPJGzEZg/cTHyqYjr3KqI+2Jo33k2PXTCTn8pLy7TeCfUgHRJuDq27aLhVpBRaCpG2QEp2EP6uYlEKLgUt7uNsDPe3cc/v9SlEBUEUP4ekjz3Re7WyCLoRBGVPukj46HCypbCQwjwstROb+8AH7yF7aPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IvJCklfU; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-367cbac9c37so3435890a91.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 May 2026 07:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779374885; x=1779979685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nz2OvYWMh0kl6XvmHG/s79tvFsmkhMkBBeYvzMmnnb4=;
        b=IvJCklfU1mDZXWVqLLRiUgYfm5PmKdEsALpqmJFTw0CiURs65uJ/TsYvOeEM4kZd+p
         SuqL3MFF5GGUFuC/1c9N2CddP5G2mQwoaWbeAJI6fWM1Zb4+qbdSz664afWRUpIDxH/w
         mY4+sKT0RYXnPssj0dYlFB/MWf0zPQ4ygjjXy27plKiwlWi8maR/uKxOsiLUOHLelIH9
         L2sN3zH1aIqGPOxmQyANMSGi59iOHMeL1g0KOgbUC1OXQTEwHjCRKTb8+x1TZY2mJkpR
         0+/iMa1ohPacptgGbFJ4M1lwR4FC/wBM+AU0bkmVgiJcrhUnL8/YrMd9VEnNFlUkhYee
         5lww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779374885; x=1779979685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nz2OvYWMh0kl6XvmHG/s79tvFsmkhMkBBeYvzMmnnb4=;
        b=GBvo8V/sODjMPiGWxRufmlOnQKu78Un4+VzCmBnZtI6R8XFV5JwrxGos17P6DQxGyg
         DPAAQoDtln8Laiyzc4aGV0zitUlr4cB1S0V6+UfqImwfc6QCXc3xZWlCKNPlu2do4TTV
         6tu6oMug/+VoAOeSU6STxlVTVN39r8uk2cRO0QqRDgA9gfb6BOzihEF3wa9vGP917yK7
         7Bmb3hT+GV/k+RYDnyQuz1drJHLgpcKKtr14XIpKkJhvzxILAswz+VzOlrlUqW7RomYO
         /bxwgV5mM6YzzmtXCF2amtOOlYgkG156GDT08rUTQvc96VntIc154XT7m1BBCZSwGmQ6
         O8rQ==
X-Forwarded-Encrypted: i=1; AFNElJ8R5BDSUhbZMYV8zXis7GhS7xdz77e3uZBjEG9HQPtv/lIYwyxnnnYYvmSgQgm91ANHogs1cC/Rsky+q9SUHn68sg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqvPrOevmXkjdqykaaq0fM0/mVw8TK2Ttjlq7NfMDwCONuhxEK
	cjmARfY/LGiFJuS8/1AVJNhGGx0SY8KFOHqZHIZAZZ/de87raJuIOpd+
X-Gm-Gg: Acq92OExb5LJ9ly9vy89wIndEVK/cwsdz4cB7MOAW80gSdMSIUTb7/s75GoToCjwPcW
	BhKloLRTS2h+L0rgkPRhFNMIWNuDlW7Kh1TO73XYxUevye7UtIzwiO51x9s++kybzXFRk7FFTtJ
	DPFu4M7k28X5Aa/OuqYmFdMq+gNY8hUM935/welcHchtvoO+Ka+4ao/orjoCdkrzhSLuYOHmhoL
	Ub5TzOfmlbioHtNITRfNBaLjy9v9HmDhv1L3Wg/YbBkygtERZR3a+Q5koGOrDNVYDvRG2F3DrE5
	C4RDoZoAFSlyVqgbR30KIImJ+scwLMa4hfCiCHk632GxoaLFgoEfcfBKlqQm3eQrM3ZPfPpqQ4N
	X+aM/k25y+opwpzqNUXHdm3MLUor7BmaqLV4issK6dJ51coGCLivXGkTqAKKGbdKn1Eg56B0OAH
	kJOj8u7JaBR+Ak1oykx8nDwPl5ozONdCtAGmboyHNRfE8xpTnA4jvmdkm+VoI=
X-Received: by 2002:a17:90b:5685:b0:368:6ff3:6678 with SMTP id 98e67ed59e1d1-36a4561ca97mr3064735a91.20.1779374884646;
        Thu, 21 May 2026 07:48:04 -0700 (PDT)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a3cc5643dsm3773472a91.7.2026.05.21.07.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 07:48:04 -0700 (PDT)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	dmaengine@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] dmaengine: rz-dmac: fix dead empty check in rz_dmac_chan_get_residue()
Date: Thu, 21 May 2026 22:47:55 +0800
Message-Id: <20260521144755.3476353-3-maoyixie.tju@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260521144755.3476353-1-maoyixie.tju@gmail.com>
References: <20260521144755.3476353-1-maoyixie.tju@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32914-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[maoyixietju@gmail.com,linux-renesas-soc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: D440D5A92D2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

rz_dmac_chan_get_residue() reads channel->ld_active with
list_first_entry() and then tests the returned pointer against
NULL. list_first_entry() never returns NULL. On an empty list it
returns container_of(&channel->ld_active, struct rz_dmac_desc,
node), an aliased pointer derived from the list head. The "return
0" shortcut is dead code.

If ld_active is ever empty here, current_desc points at
&channel->ld_active. The subsequent cookie and status processing
then reads bogus values from the head's neighbouring memory.

ld_active can be empty when a residue query races with descriptor
completion on another path. The author intent was clear from the
existing comment on the next-following check, which already
acknowledges that the descriptor "could now be complete". The
empty case is the limit of that race.

Use list_first_entry_or_null() so the empty case returns NULL and
the existing "return 0" path runs.

The same shape has been cleaned up elsewhere, for example in
commit fbb8bc408027 ("net: qed: Remove redundant NULL checks after list_first_entry()"),
commit c708d3fad421 ("crypto: atmel - use list_first_entry_or_null to simplify find_dev"),
and commit 10379171f346 ("ksmbd: use list_first_entry_or_null for opinfo_get_list()").
This site was missed by those cleanups.

Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
---
 drivers/dma/sh/rz-dmac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
index 625ff29024de..3dd76615881f 100644
--- a/drivers/dma/sh/rz-dmac.c
+++ b/drivers/dma/sh/rz-dmac.c
@@ -723,8 +723,8 @@ static u32 rz_dmac_chan_get_residue(struct rz_dmac_chan *channel,
 	u32 crla, crtb, i;
 
 	/* Get current processing virtual descriptor */
-	current_desc = list_first_entry(&channel->ld_active,
-					struct rz_dmac_desc, node);
+	current_desc = list_first_entry_or_null(&channel->ld_active,
+						struct rz_dmac_desc, node);
 	if (!current_desc)
 		return 0;
 
-- 
2.34.1


