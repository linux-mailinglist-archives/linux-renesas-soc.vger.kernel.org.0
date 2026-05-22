Return-Path: <linux-renesas-soc+bounces-33019-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLWhBnVxEGqgXQYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33019-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 17:08:37 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AFADC5B6AA8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 17:08:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DEA05304ABAF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 15:02:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D56243C046;
	Fri, 22 May 2026 15:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qp8yE/UE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D727309DDB
	for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 15:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779462146; cv=none; b=u65sXlvrPJ8o3bR660Ffq/n0yLIZI3kwAuju+EvZZANI2N3sgtUGxQOdZw79obe3zSeBTeVkWSdQnSwDGoF0l6SSl3RZXE2h6CjLDyCJ+vDcdylboLgwZqcidLiY4y69Ac000qnBycwfxj5x/8DsTiOyFRlJinEP62/Z76YspEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779462146; c=relaxed/simple;
	bh=OAwoS6WYo6gq8SOThj7G/LsS3ousVQdJn0oVyZYrOQk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Zu5Q4FjMgKQJntvnQNpbdgeeUJRBEiBWbcv+sSliWXW4wjHdCxpb0IQgm4OORDqToGqpVcM9DdaZnwHBxCIaeEuda6JYvJxkdonSaqkoqPmp6GMfTUd+lkg4+vJ4buz106Y6Zw6cW0VNZx/pl5QMTPIUAEX+stLwjonGe2zY7JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qp8yE/UE; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8353c9f24d2so3839419b3a.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 08:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779462140; x=1780066940; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NV1iGgeUXsI6eaSi8LS7eYC/k6KaxInCak9T2RCHqa4=;
        b=qp8yE/UEmIzzp9Z7IRtHQ3U5IWLTD4WL3jo7jQSg9xxV26cf2lUAnfSBGdu7MI3nEu
         VsKicHxipRQ3pvPcpn8cbAcF3cubXwNBEjqWobFYfZ9slJWlsIHHo2qm1To8fmQ3ZFxl
         TGe6PBvDf4UTQyeaMhWLkndGCVzPlwK916YzuPIpekS+spTIgHh6o0C7/HLJvpYrpkEm
         ykqDJnoQK3scMCS8hkGvrlwG5a44oTqpae9rIAAio3qGx3AVgVZQ75knDUIjYbIKAs3M
         kdPSAWdyNA+59KZrKxrXl4SCXb3podJiOlPZBcbXsK0oDBwXH5tman8EIRybqbuP7hsB
         HOVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779462140; x=1780066940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NV1iGgeUXsI6eaSi8LS7eYC/k6KaxInCak9T2RCHqa4=;
        b=klEEYsCh7h+RZVBrr0WVXJtQTiEfbRwEjKaGR7CpliKuT1meanFIoEQT7ftdfzA1fF
         QriYwodf7ZodmCIdKXoyj3txtB8BwEKLOdQZZVgvioyl4Cfc4TeTiPTtjWp9eJq65K3E
         nV84NXPkwnF7UJ7r5ULHwyInDCiaWIq2wU212ngXr+CLkINPYeezm4dqTJsBZhroVtgu
         uVM5tXa9iCT8Aa8JkXRoQCcW+R1ODHQRuaZe25y2kgRlZRJfHOVFkpr5uTMEByuFJgh7
         GPn4ooP8E7TQzHJA73YYLOj5lwlGzYPn8ulEn5w95itPpwW8hs/xrgzryqXBWedwCWcB
         LGyA==
X-Forwarded-Encrypted: i=1; AFNElJ8jvIz2ob+nShhcmvDkGxWpXT4dnU5wo1QiT6rlqOForwqfstHixPJc7f7hj1eVnTePJ7gG7wActs4GDDsXw8xbZg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhpcr/WjWWZr0yrgrnNbYgBMTbJblFJkGbEik5TDYMNjBnbfa6
	3aECUzSey/l1asjuSER5SUH4V1wm7KpE26ixlyB3+kOQ5PrE2rMeFyRx
X-Gm-Gg: Acq92OFstbq3+OZPHMjdWXIpVVQSqfNibeqVSpPFTEZKDW4aiSvRPdbLQR/AbQcL3Rv
	OFGc11aow032qYLPf8q4jl4nEIh+eCTMp+IbkDDSn7On98jQB3FZVE+1Keo5CmiCXH9ZBWB5dQZ
	SvHupQ/MpqzrdGjTESHpl7EMG815/RqMGoR3URgQaruiuDun9xviRmIqKZFOFACkunf6L99o/87
	02aaaPXZVYqeJJr3wqBOr/HEuieAS4tAl4yYt8iLgEhYX1/4uuBsnlGDo6g/wwTweoA+HvkfccF
	Ja3eoTtX0sqCudFS5N9ZsKWoyDB1W9hlYzfuhI7od7dteId5uEbPWXvrJEuCoCGR77MAQ6g2DbY
	OTet1disO0hjdTNfijvQxP/paN7J2H60az1ZIMkpmXIs1E2yw66IoBzaYYIOGexn8guw05ToiwE
	nMYDbxXQ==
X-Received: by 2002:a05:6a00:e11:b0:7e8:4471:ae55 with SMTP id d2e1a72fcca58-8415f439579mr4279178b3a.33.1779462139137;
        Fri, 22 May 2026 08:02:19 -0700 (PDT)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ac9522sm2216488b3a.11.2026.05.22.08.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 08:02:18 -0700 (PDT)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	dmaengine@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] dmaengine: mpc512x: fix dead empty check in mpc_dma_prep_slave_sg()
Date: Fri, 22 May 2026 23:02:14 +0800
Message-Id: <20260522150214.95651-1-maoyixie.tju@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260521144755.3476353-2-maoyixie.tju@gmail.com>
References: <20260521144755.3476353-2-maoyixie.tju@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_FROM(0.00)[bounces-33019-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_NEQ_ENVFROM(0.00)[maoyixietju@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,nxp.com:email]
X-Rspamd-Queue-Id: AFADC5B6AA8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

mpc_dma_prep_slave_sg() reads mchan->free with list_first_entry()
and then tests the returned pointer against NULL. list_first_entry()
never returns NULL. On an empty free list it returns
container_of(&mchan->free, struct mpc_dma_desc, node), an aliased
pointer derived from the list head. The recovery path (drop lock,
scan completed list, return NULL) is dead code.

Use list_first_entry_or_null() so the empty case returns NULL and
the existing recovery path runs as intended.

The same shape has been cleaned up elsewhere, for example in
commit fbb8bc408027 ("net: qed: Remove redundant NULL checks after list_first_entry()"),
commit c708d3fad421 ("crypto: atmel - use list_first_entry_or_null to simplify find_dev"),
and commit 10379171f346 ("ksmbd: use list_first_entry_or_null for opinfo_get_list()").
This site was missed by those cleanups.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
---
v2: Trim two paragraphs from the commit message per Frank Li's
    nit on v1. No code change. Carry forward Frank's Reviewed-by.
    Drop the rz-dmac patch from v1: Geert pointed out that
    Claudiu's "[PATCH v5 09/17] dmaengine: sh: rz-dmac: Use
    virt-dma APIs for channel descriptor processing" rewrites
    rz_dmac_chan_get_residue() through vchan_find_desc() and
    removes ld_active, which supersedes the fix.
    https://lore.kernel.org/r/20260512121219.216159-10-claudiu.beznea.uj@bp.renesas.com
v1: https://lore.kernel.org/r/20260521144755.3476353-2-maoyixie.tju@gmail.com

 drivers/dma/mpc512x_dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/mpc512x_dma.c b/drivers/dma/mpc512x_dma.c
index 0adc8e01057e..f5934136efc4 100644
--- a/drivers/dma/mpc512x_dma.c
+++ b/drivers/dma/mpc512x_dma.c
@@ -706,8 +706,8 @@ mpc_dma_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
 	for_each_sg(sgl, sg, sg_len, i) {
 		spin_lock_irqsave(&mchan->lock, iflags);
 
-		mdesc = list_first_entry(&mchan->free,
-						struct mpc_dma_desc, node);
+		mdesc = list_first_entry_or_null(&mchan->free,
+						 struct mpc_dma_desc, node);
 		if (!mdesc) {
 			spin_unlock_irqrestore(&mchan->lock, iflags);
 			/* Try to free completed descriptors */
-- 
2.34.1


