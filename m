Return-Path: <linux-renesas-soc+bounces-33373-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2AjJANcMG2q/+ggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33373-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 30 May 2026 18:14:15 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4E160E05B
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 30 May 2026 18:14:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5709830C20A8
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 30 May 2026 16:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CB1C33F8C2;
	Sat, 30 May 2026 16:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ta/dvyDU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7663B340293
	for <linux-renesas-soc@vger.kernel.org>; Sat, 30 May 2026 16:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780157322; cv=none; b=HzipjHDRrVa25XcRBpj/CzyGNShADmh21GVhOAb0AgMTwL1YNv65mi7MqIwx3H8MQ2fLskrFteIPEmj064tJZh6UDfUtUAKrffxIt5u4iB+avTHs9g1rDxOUKebEq8ZssVqwxSqPKzx6kx6G/cVdFRI1GHpRxZ8AtIlnXAcjAsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780157322; c=relaxed/simple;
	bh=SYztovYTTqiV+u0BtE2Wzg9/qtD3Gvz1IsbvkrjW9Lc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rBhyV5RVkaLfauPsfI+OPyKMt4MmCKbR4vtvOG/1fvpxNnIeg1Fs0wv1sDNvvC6U7l5u5nOhNuLeemx/1YHZOpMyjmd7OCaPZnUNBYgP+r3kPXNmw2yUCZ8DjvO10n+QFvuR2PucJi9bzOgbnhnFw+7igH4QAirySbbtt7n9sRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ta/dvyDU; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45ebafde87cso5538934f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 30 May 2026 09:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780157313; x=1780762113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UQM9T3pZW6lWQbyMq8N6ExK734KBfMavqxmApPQ5V14=;
        b=Ta/dvyDULHUV5NoJFd6VJVKsy9+Rqd0dHX/JUzsOU3MJT4zXNEWFYepLPuzsaumSCh
         yyKcZC3RokTB8fCmzAJE39WwLU6oAE0k+EP/P2buFJAv712nXpdR2+aMMWsqwyqcurJZ
         pHOmtzgoYRayILcMqK3HsfRA3Rv26T1iKCW7+wXARCP5J14GVsy/xZr2tRi8ymaDsdjm
         yRFysgzH24cSKN5AJ8CwQTApKeoUVp7FEwuk5upJuUtqEukXCduI+/1WVjUIeDEzI4TF
         F7+xJaP55KhhijV8Z5MjcCU8g1S0dEh76ylV8d28ZWQB5gBOPyTDqQrZA8Sa66/Kp1jy
         J19w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780157313; x=1780762113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UQM9T3pZW6lWQbyMq8N6ExK734KBfMavqxmApPQ5V14=;
        b=oFCIGQmWdTuXPTM90GjlauN5pTWDYoZ8pnmMOMkjLCL/Eq5Gr4tXMyr9bCamjtyT3h
         HTGpoCqRwqraIh82JfbaXgygnHQZfeKwBkBy7AopqhGMMUsblIXdLr/SJccBfZtZLoff
         /vxq4ur42jUQMP//371xgxoedL/Kpko6bysqiaNzQel0hZEL1FUivGuTX0hsY85Vre+g
         Blxu1jm/CQ4vp1MaMQlCk+By+ZJ14YkYsIgpHot+ic5T3VRlSUDV0oqkQBpJR4NmTE12
         CK/NrYrfMqscdQwUJEl4q1v98gECWxahxybvN+CL9okpOHmfVSrOZCTRsSXA8Jd18BF+
         D7tg==
X-Forwarded-Encrypted: i=1; AFNElJ/9ycIuwwSkZrACtIbAgf5JOLAS2TDoLgUCN5Mz841MkG/iJHAKtsvCQH3P/LZaeH0nb03QBLXFQfZCKh6ANnsHfw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw06kccwSdaBZ+Hw0nHI7k2Vx/7XBA2TTDtNXcJ0RT0QI+jfZCj
	qIMcSOJwy+2FZoMBPYWkOyNY1IZk/TO1Kaw9g7SGLW6X4pW1PxuH0D1r
X-Gm-Gg: Acq92OG9rdazXjw5onBpJ3pfvIpe+OVclvVr8DeCmIlq8RcEH9ShB2GKQ5I9qWo9vjb
	IQmF4joXg8Q0NHyhsa+pZ0ILyA5WEjfgLLQzfcgcetz4U6tC1ohMioHF9e+AvtHWfXC4UKM2/Mo
	yHY3U0l5OIoD35QOZ9lVrGySrCJPJruvNf/iQINkfyGFw43ZDm3c5odScYlCYLblFgBUVBquHed
	AEWtjHypPBTPd/IpEVUhsHD6880o3Y8x9iADb4h3yZBv7f9uNZz28buWoESFkyZtaleMPzFDm17
	sascQsnlco0TasRA/Eu8kjt17FGW9+unh4E2rBYOzplO6A/0nsRADs2+BM6JLPDgf/waJxqdNgf
	0TxB0WmlVgEZj7JNdg4xVe3XhvVj6XlorGAdNjaNIa77ejbt3TDJ2QFgJSTl6Bw4PDmR/p3QehU
	mKMVfgWyezSULQURNk3ChOPs2P34yPnO8BuZ+BIuDlwJSiN27iyFZKorlybhLR/0MUY4UPew==
X-Received: by 2002:a05:6000:c11:b0:45e:edcc:f6dc with SMTP id ffacd0b85a97d-45ef6b028ccmr6224994f8f.6.1780157312835;
        Sat, 30 May 2026 09:08:32 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:5db6:a512:6ab4:aa07])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef35874b7sm12170799f8f.35.2026.05.30.09.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 09:08:32 -0700 (PDT)
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
Subject: [PATCH 04/17] mmc: renesas_sdhi: Fix whitespace alignment in struct renesas_sdhi_of_data
Date: Sat, 30 May 2026 17:07:58 +0100
Message-ID: <20260530160823.130907-5-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33373-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,glider.be,gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 6B4E160E05B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Remove extra spaces in the renesas_sdhi_of_data struct definition,
replacing the tab/space mix used to align tmio_ocr_mask with a single
space, consistent with kernel coding style.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/mmc/host/renesas_sdhi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index afc36a407c2c..09bf9b24a8c3 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -25,7 +25,7 @@ struct renesas_sdhi_scc {
 
 struct renesas_sdhi_of_data {
 	unsigned long tmio_flags;
-	u32	      tmio_ocr_mask;
+	u32 tmio_ocr_mask;
 	unsigned long capabilities;
 	unsigned long capabilities2;
 	enum dma_slave_buswidth dma_buswidth;
-- 
2.43.0


