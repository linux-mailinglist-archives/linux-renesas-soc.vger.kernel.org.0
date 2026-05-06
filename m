Return-Path: <linux-renesas-soc+bounces-32170-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJKyHE5x+2m7bAMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32170-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 18:50:22 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA284DE4E7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 18:50:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 03B6330416CE
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 May 2026 16:49:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3C6349690E;
	Wed,  6 May 2026 16:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LPimbhyH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB074949EF
	for <linux-renesas-soc@vger.kernel.org>; Wed,  6 May 2026 16:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778086162; cv=none; b=NIUXMjqTRUrvQcdyRRytGrzjXhLbWPwlQYGu85SNiqMRCVQTmQtgNWO3AOcB085yrPAdohStEMiJqIxMZSo7Ikc2i9f2Tq/E8ktLFNcXtZo6r9z0q1O8wPX462/BDnoD0bL9Ctc0Dt3izXY7yWnbkh4vpHAiZ3Mry2fUJFxC3R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778086162; c=relaxed/simple;
	bh=lFsX/jd4tZKyR1FusrQfBraeYnlcWQljOD4ISRSsBto=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qUvT6Goj96ZiWC6xglIHh8toZkT2eirpzuMS8QLQm+eLJDxaujN1Va4SJYu6fOf8T9HEP3Ohd7/bnOmUMyaJQ09gzn466pMHzfdBVqTKJ2QAe09NiIyYAFM0Ihql8JpYQVGvC5Vjy7w3w87l/9vjU5Y4gw06E9gw9D/Fn4sgyM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LPimbhyH; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so75091785e9.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 May 2026 09:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778086159; x=1778690959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pFSpHvDu0iC1ydwX82Iq+Gw2dgxQCozdU4APQk89sRY=;
        b=LPimbhyHxHo1KiEtJSSuoDJoMH/uJkoGEsXH8CTDPaizcQGd3CUL8ysY5qrnjQ1Sw9
         25YWR+KBCvfPIoU9q5sT0SsmcbfFbiu/JQ5LVvUHqVXMi0dcdx/l2WXF6iZvNZKnl+oN
         qjdHszSOk1f0DuQYuuTP7XcdOsprhjkRIYD3mbTtlT+0Btv0G01CSg+OmXLLJX8L4Nmy
         YGZywQIHDDR1Yosx1KG+SjlnXecBDWcyVr1+9brdO2ZbxSeuz5cOJS2rzWI6a8O0CNVy
         /TVi0Db+x3gKJJGaxMTb/eyOSUjVedj/UnZpoYOHKR4JGoNTDV/9tgEurC9+rJ4rEHcR
         ljow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778086159; x=1778690959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pFSpHvDu0iC1ydwX82Iq+Gw2dgxQCozdU4APQk89sRY=;
        b=h0acDwyTneP8bVrzjW5LNMMgRmgwKnsnurEj8sSb52loOzAYRXm1P/MJRkl8IwfZwH
         isPwHj2gHYwvH1tpre0+TuvxiRdLH/9XI0kw34DFro6Eoi6xseQshmfBCP/q3veFIxYJ
         Vm9LS+HQqSAdby/D3zhhaQ+rw5r07xDqasKGMNU6IJvVYuFuGebd4meyXAlD324OTLBf
         KLa9Ryi90tTJnaCS2a9f6i1MXVM3zfjtKV6PXVuAmZ9GXDxDssXIvILjOGVgCdyYwNiY
         30Diwnw9T62v2hHMgYqkltvuyqX1K5Y4tQeJCc2FVuOYk0wNpYafvQkpZU9jXZTSVnrm
         CVEg==
X-Forwarded-Encrypted: i=1; AFNElJ++JCB8ONsb1Gj038+yg9bD8WsK8cs3rITVBDu1AkhWVv1g80bOyIpf3QSY3Nl1EEc8eHMN1HC+yPKzDh1Ca9wDfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdYQuT6QBDNPbmpXsE9xyPBK4pX/N9dsYYDgJuKMp8Le4qMs5Y
	t41u61ZHdz+lZjbTojBvnytNXawEJ2X6yKLFkalKJpS8qlf4CLSLBC71
X-Gm-Gg: AeBDieuUI6+5Ll1Kx30Spj9h2o/UuvtkXa98NN3Y6H13fszGIInuQvEhGHbSpRBJMfw
	rXZ0tN5fSq+kC4eXMrTCxBUkcazuJvcdwATgx+Hmh52Er+w6QndT8EOqcxreofPUw7H+mxquWW4
	yhmGbUTIq8zFdkSQccLFhTnY5JSwqHCn7tvJ5xvxQXAt7uzJhBMwQMltkcNtjMVDuK9I3S7h8Di
	wKa3zbBboHhIKI0kfyo7yvaR44C0al5a838EXHMFBa5IlEYFOEXuvewfrYHgWiFW2fKCu+HhyC7
	AOs1lW1ny9YWWrWMqYPM4na+Nvq/AU6qhOwrK1ifPvkw9d+9WkzEhUIXIo9SzP1ttB/OZDQS/8t
	mxpWGtbD7mQ2S1X2T8reiYlo82A8bxx4YK4VX9Zrmy889gWmp9n6sq6AYrEov3d9aHZvlOjPFJg
	cZtbHs9p2Wvh4nxy4zM+l/uy62cP9QehIHVW+cKgVDIMyBt4AKJ7U/W1IvkRSydHTf6OUhjlQE0
	xviwgsB6mplQHlmvocMgr2maG/6ir7+OuPVQHKEH+H1/iVg5AveUxVUmA==
X-Received: by 2002:a05:600c:c096:b0:485:40db:d40c with SMTP id 5b1f17b1804b1-48e51e08fedmr52814505e9.3.1778086159420;
        Wed, 06 May 2026 09:49:19 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3dcb:40a8:a5b9:2327])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e530fdc50sm33060795e9.5.2026.05.06.09.49.18
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
Subject: [PATCH 3/5] rtc: renesas-rtca3: Fix incorrect error message for reset assert
Date: Wed,  6 May 2026 17:49:12 +0100
Message-ID: <20260506164914.3987293-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
X-Rspamd-Queue-Id: CCA284DE4E7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-32170-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Update the message to "assert reset" to accurately reflect the
operation being performed.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
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


