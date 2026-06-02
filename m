Return-Path: <linux-renesas-soc+bounces-33445-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XOE0BAIvH2rgiQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33445-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 21:29:06 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E15C631670
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 21:29:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=o0YRtmGJ;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33445-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33445-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 45A16304411A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jun 2026 19:26:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E1513FBEAB;
	Tue,  2 Jun 2026 19:26:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDB83EAC89
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Jun 2026 19:26:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780428373; cv=none; b=NIUU4KVjTylRmjqeDRk6M0k5IhiM3yhkTaHuToyKMwRiliPC4FqXEo0GSAFyZzsWRLVq2KTvMF/cyQjrtvtM6Y9A1vbuDiVLfKogeHWKUCzLT42M0gXqEHNFzcwY/Q0iReyj+ClY79SM5GlyWk0Bo8j/3n3+hfLYEXSdq6sbe3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780428373; c=relaxed/simple;
	bh=KmqoBxF9Fq/rxvKf5KdwMsGgv5Iw4McuSBL71dPTzh8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SKXS8uUh3DnrCXThuMRug17fI0B+NqlYtbWy6UxCzbatVChyWMblN1G/4gPGd4uoxnBd+KAlcAhEoc5HflPC3Povl4f+lqyVj5sFU5MKrpKlHM5iwlu1f/7E74f3SUjuG0ag6qIhmQmUFc+wxlonrctWHSN1fe+NYjy+gzAanUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o0YRtmGJ; arc=none smtp.client-ip=209.85.221.48
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-45ef372c58aso2377004f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Jun 2026 12:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780428370; x=1781033170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HuHBcNAKhq2nFa40i0FpC1ftR1msEUqJgWkorTy+ZHQ=;
        b=o0YRtmGJHfNW25OhCdNYDB8gvIJdIQSYroRNnp8p9hndjEa5sFqIAeGEhu0y75j68Q
         krh8F6xRcNasVf4+xTd/OMFT+z3mla032qj6+XfjYNdEc0Xu0r5fFR5Qp/4FzPuEQC43
         SCjzRCWPamyCVEHghJhrTeNpZm6BBYQOtW5SObecX+Vk/S1mhdGy5tVC7T0KPCUBz2Yx
         8a5tMwZ+BVEGe9rb+A6BlWtEgF3ApULFL4vS0BCf2bBvhyiRNSN5sTKqlOkSDqvqdBfe
         COpWafOYQ3je3r+60wSl1wglkOH7HZ9Qcb1SIIgGAKkiffSUTrzrjkUx+DKLBoNt/jXk
         ozhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780428370; x=1781033170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HuHBcNAKhq2nFa40i0FpC1ftR1msEUqJgWkorTy+ZHQ=;
        b=IcwxO+tzZFF7Vks8rDQcl2xrrKKRnBQE0xbratsXCTuZWvm3r6S3bjCTVXJCFxkEb/
         f3CT+gSVUNK5kYwK89N2X22c9g4+gUZ3pvIGAjRDFjq5mJKrm6yk3kVDYg4i05JWGtUI
         aO+gm++t6MT6dqW1SD0xYLq5Sngjb1V9Md0iPLrvs0ac7Ybw2AEDRodCMiJcJsO1Ke/V
         efQCeOTvb4d8wI81irsepWLGZW8UXcErgjk9vvU3u3o6sgypvvsK0Dk4dzeERnhNzPgr
         irun7ikhQFs8xTDF20BehTIz6I3dgp+iO8vHdo+0ts7zjNfJ7jbgYk149vhTPcD45N30
         8+rg==
X-Gm-Message-State: AOJu0YxUIxfg+/grU7knxz7iWuFPqJicue+2aL/P8Gi7bZrwE+M0lh1g
	BQUJ2LNu6gta4E593UBWrtKGMxj0ds0GaiKmNow1SOTMcWH1xz5LySbH
X-Gm-Gg: Acq92OE1Mzynlo1EdGLDhSogSYjYTJV+nq5qlfp7RzFrwf++JKTAV43pWfOvjJXZc2v
	d2B+nfnVu/K6Z49aOyCw5a92fpmggq9eddqj2tMxrOqfmCDWwlSWUiCD5PhyKR6mzkNpZaaIfTO
	EOy8MdD6oRuyosd9P0EqdW1Z78fmtTCKw/Qtv1iHgIIBEY18IxO7LMqL/IUw6DjrRmDuFnYPf2d
	MBuakaeTQfy8mRMCD8ZGBu/N65SMa0P+5CuzXfhnqrsqG+K2apdCuuwL3n5hnjKL0dkc7Nj3E3P
	gNsaFxwpuJIJ3J7B9PFPXI12NIMlZAMDYSBayADMx+a9ehN95DdR5asqH5x82nJY+79xubI707h
	iSKgcI0BkguM0O78CBk+Ea2pONcMVgZJfJH2DRR5CGZgcgsP8wJ+Oo8n6KNRQDUAULQT3wertAn
	H2nIpADX6UP1SXIE9CNF7/cEc5Ym2Tr9C8wdh/eujozVpnksyQvASdW5PEtQHRfajvjVqv+9ABY
	OatOHfQBdCMp4mr+1dmP2V23FMvsnICaWZl7Z/qX14PIpkAjT6F5qIp
X-Received: by 2002:adf:f2c2:0:b0:460:1a36:deac with SMTP id ffacd0b85a97d-4601f6087c7mr745571f8f.24.1780428370407;
        Tue, 02 Jun 2026 12:26:10 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:5ef:9913:4a77:3bcf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dc577sm1473364f8f.3.2026.06.02.12.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 12:26:09 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-rtc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 3/5] rtc: renesas-rtca3: Fix incorrect error message for reset assert
Date: Tue,  2 Jun 2026 20:25:57 +0100
Message-ID: <20260602192559.1791344-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602192559.1791344-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260602192559.1791344-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
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
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-33445-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alexandre.belloni@bootlin.com,m:claudiu.beznea.uj@bp.renesas.com,m:geert+renesas@glider.be,m:linux-rtc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.csengg@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:geert@glider.be,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,bp.renesas.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5E15C631670

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Update the message to "assert reset" to accurately reflect the
operation being performed.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com> # on RZ/G3S
---
 drivers/rtc/rtc-renesas-rtca3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-renesas-rtca3.c b/drivers/rtc/rtc-renesas-rtca3.c
index af2a3878289e..8763745b9172 100644
--- a/drivers/rtc/rtc-renesas-rtca3.c
+++ b/drivers/rtc/rtc-renesas-rtca3.c
@@ -702,7 +702,7 @@ static void rtca3_action(void *data)
 
 	ret = reset_control_assert(priv->rstc);
 	if (ret)
-		dev_err(dev, "Failed to de-assert reset!");
+		dev_err(dev, "Failed to assert reset!");
 
 	ret = pm_runtime_put_sync(dev);
 	if (ret < 0)
-- 
2.54.0


