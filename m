Return-Path: <linux-renesas-soc+bounces-32171-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMLUOi1x+2m7bAMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32171-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 18:49:49 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1264DE495
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 18:49:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5620430095F8
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 May 2026 16:49:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 348E64963AC;
	Wed,  6 May 2026 16:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TkJvC5rX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4C34968E2
	for <linux-renesas-soc@vger.kernel.org>; Wed,  6 May 2026 16:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778086164; cv=none; b=ilxf49NOPnDld+wZ294na/hMCBP/Um22NKgoEk+w6P449pObJsf5yWyvrnv+IJ+KYj2h9ao6AwaSCw2yrYz6PVSckOgVax2sc5NEszAjEi3o8aIbWZUNUGzpY25BDoXBxyfPrA8CTGXuEEG4OpQq/ZJG9r3m79pIa6BDPWnP9yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778086164; c=relaxed/simple;
	bh=wzCBPvBCkMMqnErOKQmwD5AV3I93Zdz23r/gv5O1Gw8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i/J6X10n00kajnBfmfKcoKS0AwVAwTdRqbLJb94U8X593NVJmifuwfiugPtaqB7AK2/0hoUbNPyPpNxkBf0eeMUi6//BR+Fdt8DATJPcrukcZJvn8kgnJvzYObJ7+nCdm9soqAAAog2pxRk8dtZVImfHUpdG5zbyyHl+SJhkKeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TkJvC5rX; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso79534615e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 May 2026 09:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778086160; x=1778690960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=STu6TPkqcvci8Vu+kzoZratWgCIQTVhRpqVSL/zlfsE=;
        b=TkJvC5rXIkAOMYOk5S8fvxdzGZ/VGOZyqGQ4LzcQkOOtASKHgvzNmAiE4vd2zQvAB5
         CSrq/9dvF5UDWaobyEQxziXEsbbeg35Bx1aG6gjXPuopBaLM+nrlPp5MbP1MBn5blFoE
         72nBNqorTn1AeQFAWzyhQI7V7F0YW8dJnlBNlPaoAPMI5j8/tc//jsvkHM0qJWzc2spN
         Nw4UQsySWftPQAeQSSzVP+8TQt5IgfnjLUdt2HdKjlgffgkxjNGurng4R59/7Kw9Hh0J
         cu6Utvf+OtS9snjM6H5Ycw87/WF9YCKRUcGNZTY+HZtiFuibhwZW9FV5WzXhXMEnkCvh
         5cPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778086160; x=1778690960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=STu6TPkqcvci8Vu+kzoZratWgCIQTVhRpqVSL/zlfsE=;
        b=GwR4Fu3Q00HYUIzyv0H5IsbphIJfe1NFUUBmrBxtdEIu/6TsN50R+9hmDiwHEpc9E9
         wFkae09XfDCtVSYjt6F6A79AkJkB6OOMaW2hLFkEQ9avihlK44qbEYF5ecz29M01TiEv
         9bt+Jdhz664W/G1mdxDIeBXmVywQfztFgc0KgUm/GFiQjhSRhpCiVAuEugvdctCekpEN
         ZmC305fhPP0rGhDgnvpIFrUR3IHOGG7+WN/iYfwel8rUPRmnRPn8Eomtx8m3y23PU+tk
         ntudfCm6dV0rHnca70fd634wy1//iYqxvbX/8OhnhXCH8cFQid31KrzrebbQK4dI35JN
         78tQ==
X-Forwarded-Encrypted: i=1; AFNElJ+aEX+YacKV32lJC5SkdmAQn+gryM9QagoDENfQu/ccD+dsNJ5UncGFkxzdH77xVJhfjmY/nyNyBMfKtNS76S//1g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLgdwmE9OZAB57bnZ7FN/mkx6AE15fpDyX22sg0tWHYehHU7H5
	PuTMxaTpOSQe+xsxqFIxchDEJSWIIwcttsUiNDOlnQwvu8ysXLEIJsiR
X-Gm-Gg: AeBDieuz7NT5S5JfnIBGFN+BZg6r3FnZe6LY68ftMBSMOmJt5Sz5sOO6zo7RQ9cJwvu
	ny/SWf92zUy5lIjzDtFF0ET7WT8p62gCwoJ0eXGdv4Rczz+YmTT1c4fYU9cw9pDRdYK7790KorD
	aY0AXms7iMpW0cfIOsTEWoAhH/1d3JRGZpCXNUp3OYFk/4UGEW4/x16xFh/5Vm6BnXf2B6/gcyC
	91EIoibDYw8NiB5hfAe3tRxh1G+K7FNsEFIzx9ORqEamuDR86iEBfTmDlsWa4PcW4FAb4XI6n+d
	vwK1+1Q15g0VWNgCaX/HY37yXBqxmGsHed0YBvkj6PwU5nGQD87tgURSE+NbbNT2hNVoSaOccCC
	KFLRibYXd4ewPGEEPichTEf3+amDJ4XVFhxi5vLA6tqzr6nPfGQAsbTG0erUHLRiTr8yxibyDlJ
	UT58rPIm/tCfvuMl7OhNRDOfvuQm1qH7Wo0UWq8MGTPIuiADveNUsVUJFT2UWMF4sbzfXsElF92
	cXyq2mdhlW3VEQJ0dMCw0gnDrC/y6nDUggC+rP00ox8sed8FyjxxsvaCt0cyqWYHwQ2F6udaXBd
	VJw=
X-Received: by 2002:a05:600c:c082:b0:489:6c22:e081 with SMTP id 5b1f17b1804b1-48e51dd3a1bmr55435145e9.0.1778086160424;
        Wed, 06 May 2026 09:49:20 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3dcb:40a8:a5b9:2327])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e530fdc50sm33060795e9.5.2026.05.06.09.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 09:49:19 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 4/5] rtc: renesas-rtca3: Fix typo in rtca3_ppb_per_cycle documentation
Date: Wed,  6 May 2026 17:49:13 +0100
Message-ID: <20260506164914.3987293-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260506164914.3987293-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260506164914.3987293-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: EB1264DE495
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-32171-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.998];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:mid]

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Correct a typo in the kernel-doc comment for struct
rtca3_ppb_per_cycle by fixing "adjutment" to "adjustment".

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/rtc/rtc-renesas-rtca3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-renesas-rtca3.c b/drivers/rtc/rtc-renesas-rtca3.c
index 8763745b9172..97e7e65f59a5 100644
--- a/drivers/rtc/rtc-renesas-rtca3.c
+++ b/drivers/rtc/rtc-renesas-rtca3.c
@@ -103,7 +103,7 @@ enum rtca3_alrm_set_step {
 
 /**
  * struct rtca3_ppb_per_cycle - PPB per cycle
- * @ten_sec: PPB per cycle in 10 seconds adjutment mode
+ * @ten_sec: PPB per cycle in 10 seconds adjustment mode
  * @sixty_sec: PPB per cycle in 60 seconds adjustment mode
  */
 struct rtca3_ppb_per_cycle {
-- 
2.54.0


