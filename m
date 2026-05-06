Return-Path: <linux-renesas-soc+bounces-32169-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCxQEUNx+2kNbQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32169-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 18:50:11 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3D24DE4D2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 18:50:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CDAE4303DADD
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 May 2026 16:49:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42A6D495528;
	Wed,  6 May 2026 16:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X36KRS78"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5943F49550E
	for <linux-renesas-soc@vger.kernel.org>; Wed,  6 May 2026 16:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778086162; cv=none; b=bCsW3T0ZcXYnzSQjSJEBaIy5/rHuigj0v/a8Vhs8tp+WGGNGcCQKq3XZ5IkEzV3hP2b5QIKgWwaNnjKEZsgfjdfh3zkO9WxXoIDqI86gXibTvOeYSMTbpw+VvZbwjLi5nVR099sgPlF+y2WvBWfYo+gfNPuMYwLg8cr8Lo9i0Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778086162; c=relaxed/simple;
	bh=Ic5kVY6Rq8d1btQ9z3kI93gZws6has0O855jspCPo30=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GZTYDvk2lQ0iRdEajpag35qHHxoADqvnP+YYINqEtTGodHW379GznwyVcREMV5bpuRyoYAfQEtWUhozGc++BGZOMLR7z6U2VJSUcj9tm8WqWovquyPxeJLWTZVPMwNsinh70vGQrvX+BNi5oUN25vsLVDrE+OZKJif7CpeW26ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X36KRS78; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso51892135e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 May 2026 09:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778086159; x=1778690959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zxWuPcuF0UKPqeCZ8y2hNLNnCZzaOu2O0vTDxb6yruo=;
        b=X36KRS78W6d7jJr13JyeZ1aOQ3EnhXbTn7VL3+ME9sejDevGEWQKucWQHnttvKmZTy
         nrEB55WREXmiAtUdK7LEN0EY2II9g77XxsYCHFYElpWYpd21s7UmZmot9Uwxhy0RU1Tt
         BQn89d8Xy43iOH8Mr/yFc+AOlYzXLliiydNpydpj0+JhyfstUxVOJ+X/pYlJl7EICegA
         5BxnmQmx0Flq0sbjUfuLQ/wKL2S717o6choYfkU9e7n9ATC+ibKu/MqwM4/XBD0gtzNv
         8RGOhGrX8HzEkD4AsD8sqsYazKYeKP6npzUQDAoLbPHeg9NaXQjQEc51sI6Bh5pOC8fJ
         ZWvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778086159; x=1778690959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zxWuPcuF0UKPqeCZ8y2hNLNnCZzaOu2O0vTDxb6yruo=;
        b=MaFrMZ8Lt3rw0gdLlM1Zs8YjOoDcFZ1r3QFOlkCUF3cLPuplx9+6RGG+c+SguAfuYR
         amuZdJyg+5xMBn5EQgi4WzTrI6l9UgH3XJJTaNVtmsAXtfuSLtVX4KIQ9BIA3GbBwkYV
         IddWR2sm5Ojn8pBU2ar2nlwW2TG5eYq2RwdKaAGo2B1mph/DCW5zRMJBl9RPu1DvJMch
         JO7unYKAGfppT9DyMFGsqdB0Xr7akBhJFkM3W2gHKyKKCrEe7FZVhVoDiSFoSvrbRW/b
         qIFaPWEn11ZBCYCkdHGYX8ZsXE3k8UB2EuPSRKwFOUTRDRkxDJW31cOPA7wnXuCiFEv7
         WR1A==
X-Forwarded-Encrypted: i=1; AFNElJ+0ydUWJDlX6oFwV707LfF/EpqQmxDWv/IHleZGyDH7Ly/lsjbx6KUkKKnNpB2e0M2ZJLEVOT82Mi1fHPHJ0An0fQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo5kTEDEjMBSPqxS3BA6ECHX0bJAi9oCYVH95tH8oXCudEliXX
	DQ6eTrxYaciIba/wOP1gfEfUJUXRxwr1Mp3PJSOMrx2rFe1g4WezYX2w
X-Gm-Gg: AeBDieur5y2++OxUrgsnKRTlWBhEAn7sN9FrptaboDKup2YvermtfUnsIEPYSzjfAzy
	GfVnnHKUyXv3XXy9kfdwOYImrlocd+xi38l2bjITOGHVlEzjKQMFroMzZyO62zWLWsph0nQVJn2
	a4wZoyWooeLZcpdDQjqEz+GHIlWRaFefKcJnVTtk79Vocpd0K5qrSs0stLrpHmlawPye3g9jJM1
	RdAn0zvAlBW3VAtfP99YPb3EID1i1rzU9edBVxZ2ffTvWhK7lYrD50Z16IGOP4ut4l0kUacfIw9
	0VOLWqY/1jTosxfS80XOnM6B9ze1TCzNb+dBs5ZBb1Hmng3uEKEbf8/cXztYJzSBj9uzjJAOyP0
	PMLMhdIrZ3CutEoGAW1FFnJj4RdrYmiPdOdfqI0an6P2GNw+VpKgaQeBMs40INoIeQO8t6YDQDY
	mZEd2l6xS7CbUK0QnnD5IAZacPRFHC6x0k2MTPkY98k1xU7gB/X02tD+36E7YFqOkO57eZ3UHdh
	CuMv8g7b0WftpVsoTDtK9HURwXDi71HAOuUDv86qZBAabOMD2bnVIv7OlDCw9v/f3kj
X-Received: by 2002:a05:600c:c082:b0:485:3ec6:e634 with SMTP id 5b1f17b1804b1-48e51f327fbmr52468335e9.15.1778086158703;
        Wed, 06 May 2026 09:49:18 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3dcb:40a8:a5b9:2327])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e530fdc50sm33060795e9.5.2026.05.06.09.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 09:49:18 -0700 (PDT)
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
Subject: [PATCH 2/5] rtc: renesas-rtca3: Check RADJ poll result during initial setup
Date: Wed,  6 May 2026 17:49:11 +0100
Message-ID: <20260506164914.3987293-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
X-Rspamd-Queue-Id: DA3D24DE4D2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-32169-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

In rtca3_initial_setup(), the driver clears the RTCA3_RADJ register and
waits for it to reach zero using readb_poll_timeout(). Check the return
value of readb_poll_timeout() and propagate the error if the poll fails.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/rtc/rtc-renesas-rtca3.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/rtc/rtc-renesas-rtca3.c b/drivers/rtc/rtc-renesas-rtca3.c
index 2dc080d0eb6c..af2a3878289e 100644
--- a/drivers/rtc/rtc-renesas-rtca3.c
+++ b/drivers/rtc/rtc-renesas-rtca3.c
@@ -634,6 +634,8 @@ static int rtca3_initial_setup(struct clk *clk, struct rtca3_priv *priv)
 	writeb(0, priv->base + RTCA3_RADJ);
 	ret = readb_poll_timeout(priv->base + RTCA3_RADJ, tmp, !tmp, 10,
 				 RTCA3_DEFAULT_TIMEOUT_US);
+	if (ret)
+		return ret;
 
 	/* Start the RTC and enable automatic time error adjustment. */
 	mask = RTCA3_RCR2_START | RTCA3_RCR2_AADJE;
-- 
2.54.0


