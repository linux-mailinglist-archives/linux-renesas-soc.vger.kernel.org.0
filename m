Return-Path: <linux-renesas-soc+bounces-31960-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kGg+AK/1+Glr3gIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31960-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 04 May 2026 21:38:23 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C444C34F8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 04 May 2026 21:38:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D4F7A3027117
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 May 2026 19:37:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 503FB3FBEA8;
	Mon,  4 May 2026 19:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SSCcPRq5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033CB3D3016
	for <linux-renesas-soc@vger.kernel.org>; Mon,  4 May 2026 19:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777923469; cv=none; b=dPOt+NmXJfk8jVIWVcs6ghAxniVkIqp/cIbC0IiGkmVdnc9Mq0u8GrL0fYeqn8T16JcP8C0hMfB7jHRlUU9rYuXAIH6GHKzFQ3N3u26Rc47DeGdIlSq+jpl6GhI4D/MQ6CD7a6qnKoecSHW0zAiPAZci04iz2EZ8rRlmwJYSRo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777923469; c=relaxed/simple;
	bh=1JOyIRRgBwbB/DhfXPbjmSn8yLF9GaFDLeyZF/pITec=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Cc0KzrUv/My9pGeyRRZUJUuhtrArw923VlCSK4pv/UJNE92/DZ5vYW5xQKG1xR2UqbwL29+XAYPuUC3+bOPLzyLH99/OZ/UE+rmq65rsz7WwuQdm4duIFS/XMHs4UiPcn60YuRv8lFhssT5isYIZsz6iI1e/MsvatZGyBtChEoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SSCcPRq5; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8296d553142so3363897b3a.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 May 2026 12:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777923466; x=1778528266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f0aIguRQYWYljT8AmitpZ9/B4tpFTi2ewvWnvOjrRTM=;
        b=SSCcPRq5Ssgo+8Kjf84DWCka94hZLFw8sTMgiVgfAdZ1DQ+yt7bu/gXG2voYqFe0g9
         3lB90HgwGgAKXsshtNsxiHxB+A7gsX6qRPjdpVANMcXc71OsTg5gV8WccvI34K1sEiOm
         K+ZepyzbKqay8soo1WLsl7r+7H+pixbstcegEedpIW8ScTfVMVLEkl25e7nb1ELW0iFN
         Rw8+o9qXQ8JVCApGCZaEl5avy4g1zjo5h09naV5/Ix3d+qTorKyJmocfxvtNFYlKIOe1
         4DTga03LkTI7/GwXY7eovJG222znrMkQyN4qvDGn2P/V3U0Wbadp2fQ4VCFodgK5H6Bq
         7iBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777923466; x=1778528266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f0aIguRQYWYljT8AmitpZ9/B4tpFTi2ewvWnvOjrRTM=;
        b=rVAlTUiDlsR5DnHdyHxgl+3TlQF9UsOfv0S1KZkNBVK8qqDngXhAj/h9IMePSX/JiA
         PCak52rGgrE3kQ1BsrJspQRLqhQXxMdUD/cnmpRwJY5vREjscOL3c1w3gM8LcNgt4qT5
         JbrHRlLZiiKEcmJF7hdaPLUO+9MIZpyOfJJoGw2QxE2mEPumrzOF7jg4ZLSTebeSPLy6
         9RhCJayEKs8orzAf/2ExcnL91EBkC6Hsz66fDjLsrfSZLOzpsgjN6qe9OI6uznZuRG6e
         YhHeyTcHl2Zl4BF96EIgFRymF4+6hkQcWyfHsXg5vNhLBcrAS8Tc5GwcHWn9Kbdpt1BD
         GxDg==
X-Forwarded-Encrypted: i=1; AFNElJ8O4eoQYboY3HKn4gQlmpcTgLbdXpmlfTXOCk+fzQ7Kq1pZaGyFvtROtinc8IGAs2G1SKJCwe5Tx3WMCMNcwU9r6A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/e+qWDy93i7Ih7G8tmvaAH5i+vzrXR+Rb2cgWQGE8zEu6mPGQ
	0d7aUfBP05R5tkCL+BmzLB3fDe+mj9i72kBefgKJnjG2Hvu9NB6NB05S
X-Gm-Gg: AeBDietY6xH7yh4Fg0KKaxJy4hptKQ+d+j3zRJeeCboGvxHYUwTRGcGV8AxsCZgkcFo
	WOwo+eAdj3Me5XFfd5BgDFgEXLU5WrFw8EzQeSyJgIR9lmcqxEI3Jg7cXViD8FxUvs10M2xxGDf
	AekaSW7MOszfpKaMZ2EPZ+9WO9JXkM58AD8ZP7cKiJgj36m6zu6a2lqZHdftXiZf7839CW1FRdB
	Fbue6RuooP9aKX0JFrD9RMWveS8LXPLlJ4W8pSa3tAy0XAa0giM3tobNotEpapkcu+UbrwibBRC
	SXt0ikjnSPws+4yLMijZNm27JL9PIq2Lmp/e7UqLJKD+KNcyaYNcnG4IvPYvGmO/o1RNCofdN9C
	XgfQ+l2XCeM28pqiJo+osHuoyPNUkpJruqp820h6B9VnJm4rJoKbJ+Ow9CmofO3DKOR5saDMHqD
	A2K7s9dODyOFg6+GQVtI18mMEcKYYTDD3s8L95M+AHq63Kq6r47b37NA2gEA/RkpZifj00lmbL
X-Received: by 2002:a05:6a00:3a15:b0:82f:761:2b49 with SMTP id d2e1a72fcca58-8352d2b0b51mr9887750b3a.49.1777923466340;
        Mon, 04 May 2026 12:37:46 -0700 (PDT)
Received: from localhost.localdomain ([115.110.225.242])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8392aeed4e2sm88980b3a.15.2026.05.04.12.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 12:37:45 -0700 (PDT)
From: Shitalkumar Gandhi <shital.gandhi45@gmail.com>
X-Google-Original-From: Shitalkumar Gandhi <shitalkumar.gandhi@cambiumnetworks.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Jakub Kicinski <kuba@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shitalkumar Gandhi <shitalkumar.gandhi@cambiumnetworks.com>,
	Felix Gu <ustc.gu@gmail.com>
Subject: [PATCH net] i2c: sun6i-p2wi: fix of_node reference leak in probe
Date: Tue,  5 May 2026 01:06:59 +0530
Message-Id: <20260504193659.3515669-1-shitalkumar.gandhi@cambiumnetworks.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 52C444C34F8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-31960-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,davemloft.net,google.com,redhat.com,lunn.ch,vger.kernel.org,cambiumnetworks.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shitalgandhi45@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	NEURAL_HAM(-0.00)[-0.989];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cambiumnetworks.com:mid,cambiumnetworks.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

of_get_next_available_child() returns a device_node pointer with an
incremented reference count.  The reference taken in p2wi_probe() for
the optional child node was dropped on neither the early return when
the "reg" property is missing/invalid nor on the success path, so a
reference is leaked once on every successful probe and twice on every
failed one.

Use the scoped __free(device_node) cleanup helper at the point of
acquisition so the reference is dropped automatically on every exit
path.

Suggested-by: Felix Gu <ustc.gu@gmail.com>
Link: https://lore.kernel.org/linux-i2c/20260201-p2wi-v1-1-e0ec9cda82b3@gmail.com/
Fixes: 3e833490fae5 ("i2c: sunxi: add P2WI (Push/Pull 2 Wire Interface) controller support")

Signed-off-by: Shitalkumar Gandhi <shitalkumar.gandhi@cambiumnetworks.com>
---
 drivers/i2c/busses/i2c-sun6i-p2wi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sun6i-p2wi.c b/drivers/i2c/busses/i2c-sun6i-p2wi.c
index fb5280b8cf7f..652b37b57159 100644
--- a/drivers/i2c/busses/i2c-sun6i-p2wi.c
+++ b/drivers/i2c/busses/i2c-sun6i-p2wi.c
@@ -184,7 +184,6 @@ static int p2wi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
-	struct device_node *childnp;
 	unsigned long parent_clk_freq;
 	u32 clk_freq = I2C_MAX_STANDARD_MODE_FREQ;
 	struct p2wi *p2wi;
@@ -223,7 +222,8 @@ static int p2wi_probe(struct platform_device *pdev)
 	 * In this case the target_addr is set to -1 and won't be checked when
 	 * launching a P2WI transfer.
 	 */
-	childnp = of_get_next_available_child(np, NULL);
+	struct device_node *childnp __free(device_node) =
+		of_get_next_available_child(np, NULL);
 	if (childnp) {
 		ret = of_property_read_u32(childnp, "reg", &target_addr);
 		if (ret) {
-- 
2.25.1


