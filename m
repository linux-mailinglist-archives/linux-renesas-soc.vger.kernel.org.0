Return-Path: <linux-renesas-soc+bounces-32168-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MLVaCzdx+2m7bAMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32168-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 18:49:59 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F944DE4B3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 18:49:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A3D593035828
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 May 2026 16:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D3734963AD;
	Wed,  6 May 2026 16:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GuflnOgR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BC9494A13
	for <linux-renesas-soc@vger.kernel.org>; Wed,  6 May 2026 16:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778086161; cv=none; b=tcWDSE/IDLsN6Cw71uK1iNgyJuPqFExeElOgij6bWtv8gkH17heoyDcVEyPz44VcCV4tgwcMiRHCI7bAn3mILmq6zmpm4IXAfmKAIAlCRX+5KTLa15bUNrLi8QI0SMBsL2GO3P37gZUeuk6TQYqVldqZhVoqxDbhJy+swq/NLKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778086161; c=relaxed/simple;
	bh=ydCT1/JE/JPYLI+J+iW6pMlD2xEDI2Bd5yteqX85Pl8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xn4Dmk5fmg2rB4o0b1xXupx41cyaM03caDjZ/cqW+gfr5yCaYph++No9CokSpDEyGQ4l6ZyYB9IZuRj+nDEeN9wQzt5wErf0AY6yXMIiNczBAzWBuB3AyUM7KxHPdIvNR7Yzi3jXTO2yvuTex9l4WKUKdNlvPjTzC/9AvxCuCys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GuflnOgR; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so102494515e9.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 May 2026 09:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778086158; x=1778690958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WM+K0gilZXjULIrmHaDGvw/aYGEN7GMhe5rYaCexhFI=;
        b=GuflnOgRZpE4oGmRzQdVTRTQipqZOw50zLhrOZq7SOY9SbfXfiy/+A/HHVUEKXynGh
         pPafotKB6d4A/7LZUYg0j+jXd6AxnNeErBenhIzpOaftJSSmx8knYR249+LDBTKYntNv
         ry7+rleU2M9Wg8a1PO7PZCdHJfN0YWloVpjDKS2AnxXwRMNGdAfLoH4lh82fLw7O7DLd
         j5emGSKn8U+BOnXU3m2PTMb+POJU32+9488H3ZFRY8/ILcrye7O1VR/GIQo2DoUACq7q
         MmkViZeNl0U7XzN/jLEpOfAovgH8Jq7ui6XkSYeQI0yLRUY0gOQ9LJ5nfbclVBi7nkKs
         iMNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778086158; x=1778690958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WM+K0gilZXjULIrmHaDGvw/aYGEN7GMhe5rYaCexhFI=;
        b=hyXe5fninZe9M8Y0YmYj4dpE4cLy8oq67GIxOX54DtrYwXLXQD6WGTd5jym9WPwE4P
         CVvvxWb0t8neEY2d7y4MT4shWBIFzI919woHHg5fKaCXX1TaDQzt9rWM6XsjJcG9ZGld
         4b8PaiKjXYARH74Gxa/HYzVD3u4ogflnBT49sajEpS2qmX9Lqm/mQmb8/j4Rev78Mdpl
         L3XuPDpmEajeesm6squRTsy6QVwOslKAJ/mf/OIYibR1vvh/ZMr4s5PukIagokh7QoYm
         m2E4FAG2QfAF6hrR7yriolKQd25RFxWcLLWDM0iKa2E73mQhN/wakEP7MJILQXqu3ALL
         fopQ==
X-Forwarded-Encrypted: i=1; AFNElJ/kkY9dzN82jL9gMytDmbj/wK3zUCPxobLLQnTr0F1VwGsY7hliXCzDMFfaJl47Lq/cSSnvCXyGr4R8+KDx4YdQKA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxOzLk7hcLoGzra7YOgeQ61DJbNLVSl1E0E6RwxArL3tuAE+jAP
	iXf4XspjuR8o4aB+QcXchFhIoWBlAI10lar8efJ3klJPlwZ40G/bXK18
X-Gm-Gg: AeBDiet3YDVXTKzj2nZs26Z6f4i5LUy3oxbeTOgM1I3eXgEYBeCmvJtOBqNdNGCtJ3x
	f6WaYDcqvOwoqj/KqqGXdwePZwBd9rsbu19fnmrydvZpmrRhTLM0LJyctCksBPQf0qWuERw6Y3b
	Iju9DPMNyFDafcuECWdk8ErmrnUXdoSkTO88xzk0cTQWwftcO3qpXJQ8r0N8zfml42+iTh1cpzo
	IdblzXgsN8ZqAZ5iOLoYcM6878bGDxWbWPbn1l8085K0g0+MoooNO+rW2We67CzzwmjPg91bNOz
	Qa9OfWW/+eG4mNu05BaPz1O9Da1sR54/sxFXFdfqcR6psNdXRTxAsvVeVKoN7j/pu1/uOTBft+7
	II7RzNc7SIsnJmftDuRfWqip5sqQJmzLfIMoXxPmS02S+A/oMfmAPBdiYzNtyEoc/UdZpVNyEtw
	kJvsPeha4InrTmo3lRtknAjzDGCF3fMm8aXX8bSg+o9myGQ4dfRwyhx8cQP7vdkEa8sUDC0hSvQ
	/lra2EUJz+KcjE+BL3ditxBwyGrl/EKcFuv2xlSZ/Tln4e45bLYzUqY9shXOOjDZRVn
X-Received: by 2002:a05:600c:6d7:b0:489:1d23:4524 with SMTP id 5b1f17b1804b1-48e51e0bc19mr45621445e9.5.1778086158014;
        Wed, 06 May 2026 09:49:18 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3dcb:40a8:a5b9:2327])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e530fdc50sm33060795e9.5.2026.05.06.09.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 09:49:17 -0700 (PDT)
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
Subject: [PATCH 1/5] rtc: renesas-rtca3: Fix PIE clear polling condition in alarm setup error path
Date: Wed,  6 May 2026 17:49:10 +0100
Message-ID: <20260506164914.3987293-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
X-Rspamd-Queue-Id: C4F944DE4B3
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
	TAGGED_FROM(0.00)[bounces-32168-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

In rtca3_set_alarm(), the setup_failed path attempts to disable the
Periodic Interrupt Enable (PIE) bit and wait until it is cleared.
However, the polling condition passed to readb_poll_timeout_atomic()
uses an incorrect expression:

    !(tmp & ~RTCA3_RCR1_PIE)

As ~RTCA3_RCR1_PIE evaluates to a mask of all bits except PIE, the
condition effectively waits for all non-PIE bits to become zero, which
is unrelated to the intended operation and is unlikely to ever be true.
This causes the poll to time out unnecessarily.

Fix the condition to check for the PIE bit itself being cleared:

    !(tmp & RTCA3_RCR1_PIE)

This correctly waits until PIE is deasserted after being cleared.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/rtc/rtc-renesas-rtca3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-renesas-rtca3.c b/drivers/rtc/rtc-renesas-rtca3.c
index cbabaa4dc96a..2dc080d0eb6c 100644
--- a/drivers/rtc/rtc-renesas-rtca3.c
+++ b/drivers/rtc/rtc-renesas-rtca3.c
@@ -455,7 +455,7 @@ static int rtca3_set_alarm(struct device *dev, struct rtc_wkalrm *wkalrm)
 		 * specified timeout for setup.
 		 */
 		writeb(rcr1 & ~RTCA3_RCR1_PIE, priv->base + RTCA3_RCR1);
-		readb_poll_timeout_atomic(priv->base + RTCA3_RCR1, tmp, !(tmp & ~RTCA3_RCR1_PIE),
+		readb_poll_timeout_atomic(priv->base + RTCA3_RCR1, tmp, !(tmp & RTCA3_RCR1_PIE),
 					  10, RTCA3_DEFAULT_TIMEOUT_US);
 		atomic_set(&priv->alrm_sstep, RTCA3_ALRM_SSTEP_DONE);
 	}
-- 
2.54.0


