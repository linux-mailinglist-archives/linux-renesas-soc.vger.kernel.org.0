Return-Path: <linux-renesas-soc+bounces-30543-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YK/zKZ78x2mIfwUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30543-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Mar 2026 17:06:54 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0784034F193
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Mar 2026 17:06:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5FEB8300423C
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Mar 2026 16:06:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5414D34DCEE;
	Sat, 28 Mar 2026 16:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l/0AyRXB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2EB3932FF
	for <linux-renesas-soc@vger.kernel.org>; Sat, 28 Mar 2026 16:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774714001; cv=none; b=ADef2igN5VSNb8VFoLG9RBIp4aGmKy0TCRZjgzRpeor4taiajuTwF5kvTBvZs+w/XrT5ocQHmSkxCi+RqV607i48v/QgkdGCL8o9gGYK/htGsrOOeyHDWBKO8yW05d8WvM4CZ2hfOeNgjfS0SuzP8j8gCNhPQ3A/Rd0VMHFaurQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774714001; c=relaxed/simple;
	bh=MdQfG1i63z2+B8h+hGMucXuxr1uS0joRSYii9egx/pQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qyO5F+AZxkbXOT+pDaFklJ+h8XmEX9e3Fduu2jfEjp6FAHDJ4xP+F03jt3fj7qe8RW+ZCnHltN8qKKZWHYImT9BmqXUFTsA4rKeK1lsIe5onOZWIht33NfuY4yEmLEP5dckprmN0u7pZvIWn/4IL3DEaUmmYHkpEA88xouQl/kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l/0AyRXB; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a279ce9475so3686668e87.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 28 Mar 2026 09:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774713996; x=1775318796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mrtALhRQ+/dB+7gUCD8Q9TtNE8HoAMbogKYxXP9zCuc=;
        b=l/0AyRXBQq0pAPm2APqqzfbl6hyGEMelQF987jNL49sEGEvJD/csp9CXCIGSsiy6Rq
         a2PZxlvRwPl8ZIQkS281LY4Fnaw7fl6rpJexwT8HctRvpTgCdcCk4ELS9r7+c8M9mknW
         ZxAqakMfQglmpKIHi7iAuMwX8sywclUS/PrmRjZGPML2/5IWPp0xIxEAn4cvb2BM+s3N
         l+ZBLS5PqW5vwLKXUxIvdJPJ0Z66lJ48cA+P0hjWKnSoyXa/kg7wGHWia2mOWCfpsDnC
         o/2Z3jc19cMl66rLZx8byl1HiidehJMDkMsOHegRvayQT9xOnoxSTlvLbKmLSmLiGjMQ
         p2Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774713996; x=1775318796;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mrtALhRQ+/dB+7gUCD8Q9TtNE8HoAMbogKYxXP9zCuc=;
        b=eXhz0Je8luIH/mQNI/DEc0ySH8aykER7GMJT5BR8Fbk6LykE/eN5kDxczWReKdLcZb
         fZLEcyMWW2F8xuyoQ0YHZ6TNGZ5IaWN+wdcCkdxi5+ydvV6hMP7dIsSxkybUFerDDX+r
         JGaiQLjexPgsfPUCE+Rn4KeiUiKPGSvxNisXGdVZzP+zzbnlpnZXxiIjVz5+zYDFAz9u
         uhKWNPQhQJoPiowvBZ5HaiTChaz+QCEaL3BWml1S4/zC+7EKwGRymhhcIfnt4xJA+e3g
         MEy09i8AFnluTSst8O8seamSyCl/1tKPPe3JZ+6a85KclsPjodYCBls6mCfw4zKADJFr
         QxnA==
X-Forwarded-Encrypted: i=1; AJvYcCX3y4nK4xqZtVjV29l4YNiz+hzQAjpp5apHlb+EoNib8XABOFdCAOyf2YYO9SEu1wAQ3Z4/QzI2mbzGPhbr8Jqy+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEnGp9IDMGF8QNTIgGx5oIA6xSCYEV9atmGKPkD5xKNdfBTFgP
	xex+3RsLaHu0Fwb+XQxlqy/agKtsxslJ1zkW2lbNuzSi7osI2hJAR6fUY7Iy8A==
X-Gm-Gg: ATEYQzyBmbUdnePwkwJIWJXfaXUnuXGHoE7LfOi6mpZROtINZU3Stq0EPgj1UtismnH
	U5rzt9E2uA64qn8nGfKsnPmEkNrDcgqPmI5ucZVybLqYP/abrGpLlcNW7H2OEiwSrt61Qsq4wuE
	jUTbXpx/cQn8/meWvwlOHeiOVGUUH3LnRHm/fzHrJBDTMFOEel3BKSgEAXL+sGIKgFyNolwttXL
	ej7sBkZtHYSyGJuFjNSzXq/aar6rSHZctJFgkwMmnn0NlsmqdFAYCqjzoGVZK+rtvG0yX3uLPve
	3XXkFWSrh1PT6oKFKVxpTbZVzsx+Cti1MHUsLdxUyPa7xCu7YEokNlVdcWMuwtWJEwOTPWqsDRa
	mAAgCSyw/giEDdQsrnAyQCttcn4Rl+rsRiDtTzHJxrg2joYzyrVnNGBhyi3TQJHpkhMEYB80F9s
	2p2oVAi85Zb/9tApsu3QsCyy0CoWD8SLVRNFTbXi3D4ArGe6GU
X-Received: by 2002:a05:600c:6986:b0:46e:59bd:f7e2 with SMTP id 5b1f17b1804b1-48729109c35mr75510485e9.11.1774688752254;
        Sat, 28 Mar 2026 02:05:52 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:8a55:5310:98fe:930d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48727bfc5ecsm77227735e9.1.2026.03.28.02.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 02:05:51 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH] pinctrl: renesas: rzg2l: Fix incorrect PUPD register offset for high pins during suspend/resume
Date: Sat, 28 Mar 2026 09:05:45 +0000
Message-ID: <20260328090548.84124-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-30543-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 0784034F193
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

When saving/restoring pull-up/down register state during suspend/resume,
the second PUPD register access was incorrectly using the same base offset
as the first, effectively reading/writing the same register twice instead
of the adjacent one.

Add the correct + 4 byte offset to the second RZG2L_PCTRL_REG_ACCESS32
call so that pupd[1][port] is properly saved and restored from the next
32-bit register in the PUPD register pair, covering pins 4–7 of ports
with 4 or more pins.

Fixes: b2bd65fbb617 ("pinctrl: renesas: rzg2l: Add suspend/resume support for pull up/down")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 561e6018fd89..68b94c748f53 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -3049,7 +3049,7 @@ static void rzg2l_pinctrl_pm_setup_regs(struct rzg2l_pinctrl *pctrl, bool suspen
 			RZG2L_PCTRL_REG_ACCESS32(suspend, pctrl->base + PUPD(off),
 						 cache->pupd[0][port]);
 			if (pincnt >= 4) {
-				RZG2L_PCTRL_REG_ACCESS32(suspend, pctrl->base + PUPD(off),
+				RZG2L_PCTRL_REG_ACCESS32(suspend, pctrl->base + PUPD(off) + 4,
 							 cache->pupd[1][port]);
 			}
 		}
-- 
2.43.0


