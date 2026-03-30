Return-Path: <linux-renesas-soc+bounces-30566-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6M5QLy1Uymn27gUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30566-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 12:45:01 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A953599AC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 12:45:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3FFA1300145A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 10:45:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3ABE3BED6E;
	Mon, 30 Mar 2026 10:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nxQSqMop"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5CC3BE642
	for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Mar 2026 10:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774867497; cv=none; b=I41IRrkADq5jlxMwLeWYHTVzdK1Vjp3XdIW4wj9MJv6FLnoU1QlH61ODno2ujeSmG1Nh1bPc3kKM/1wv3dGd3Sf3MtQ2+gbQt9ZaeoJSxXQW6jYHStg3k2IKL+ijmqzJf08u2Tgb+cAdr2l+2VnHymV374Zq5n5hkTmqUNl6Sec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774867497; c=relaxed/simple;
	bh=MzOtZWP/O2N5LKw24jYYRCeYIdMx+g3OLyY1254aW1c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FITU71wtJoK4oAoOH0N11cBurs7bZ0xZ0H/1HnAQIs1JoxZpyc4UH2EdSgaFNpSKX6/Noq/PkUrJ4SURGMxZjCzF9eq1O/KWD4jbtHfWh2VCT9vMyMcvsslIo1UYiySaoX1EX4pnFWCmnMRX+PHPgmPQn1Z3ttgQhzTmX/y+ax4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nxQSqMop; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48558d6ef83so42440915e9.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Mar 2026 03:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774867494; x=1775472294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3uX914YhuYkTgoe0kk9VM5sxxzK+tc1qOdfmAktq/XU=;
        b=nxQSqMop1lplLs2GCTkNuAgopKzghYV6BZjs4RpKPM1vwYuEnPDhbVgfaacUmBHplo
         rvJokCvw1pVf/k/lflO38Nx2+jtnKkRLZSkcgFhzD+iBi6Lff098uRUdYyHfVZQH+bfP
         fV0P9Bx55A3CUW630x9gQwPHhc+sa72SmGFScJuiSipL2Dw5t8fKkr3ZrW0jv5D3MbFd
         JcvcIvYMQmlr8icnO/JCIhdBuGSqKrndX8arf6uNNuo11CY1QjTHHdErpqipiEf9yfWF
         wniW8Aw3f8DeDYye7/rtZBPXBJ5Q+ekuCi6tVhYSiAzjyKJq985xdhCuI5C2kGo99v7L
         wDOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774867494; x=1775472294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3uX914YhuYkTgoe0kk9VM5sxxzK+tc1qOdfmAktq/XU=;
        b=HuE3ZNWKzNFV/hd0AokiJvBQpCTXt3swxa4vpLYSwGXZ2xt+RRUQa2Pp61kySgnCm+
         A8mzW4C8rxo3suKKm1Yss+4HIZjQDwvUie65LoLSTdTpR0WNwKlmOJxfOG3B957CQhYO
         wK77X5BZre2K8vZPftkxqOclDRaiZWXDpJiGLa+srjwHR82zzzNKimZq4XGj1TTITIp3
         8AcOHacLfL66giMNq2H2ZGMcUBEer9//siCQ+EXf6rhTfBYpnRkoYbeGTjVP29viCp2v
         +Y1QmF6uJGjSqoM40ljNfSXfEt/c95LXoC3RFldG5wDMlGdzLpiVVuuf0cCf1Lz+U4Zx
         6L4w==
X-Forwarded-Encrypted: i=1; AJvYcCWODEBnQK7TeOKAITN6kDgIsU7idPW95IZ1XcJGciFLF9LfWONtibJ+cBuBOfnpLGRs22LxGs4DtrEvvQa7rXitPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlKMnO7Qs9QZ7+MnS7tBCjuB3pntRtXgMl9NcSKE9URnqEfxWg
	HewRLy8VaL1vgmoIoKG1AABwbQtDAdwlCZy+RWvN94c0UNKUm8mQm/Bh
X-Gm-Gg: ATEYQzy/RMTk5v11CNVut8M3ituVhnrmov0wABa1irHe2z6rd2i8+mepLyP7gYQ/KTr
	C5B9yFtoBN2CMdrJSIflCSITOuaJeQuRW+EOiT6fx9nYihY0ihjwJ8gGWJQJRmD88lkH7fhpx2t
	r8152z3z9ZPYMgYZSJHpRI27+3jENbgwLAGhCbdLRml27zMnSMPmYZ5zn39WwDxw2Nt08ysVHCH
	2GZJAvA7ggK9hnLNyY079fM2uCRBqy9/6LPDBT/FLl3phDu7dckV1ef7CD4bl3z4efV10oOr7Hj
	pJpQOCCyd15Y0r+iYYN5O1uOj4CrEaazPElfolyH3U2WhaeQyQmb5PY/F5dnt57HS/csxgBNNrA
	cJOPuoiQFcaah7q+11KlyP8AVIpuw+rS6RAxZS4JJQHmYBClMwg980a0zf6TB6nO5Wyka76b8mV
	Q7PSANKLdqNjYH92+yNDQLK1hMwxeJoQ==
X-Received: by 2002:a05:600c:3504:b0:485:3e20:4013 with SMTP id 5b1f17b1804b1-48727f0b109mr170977975e9.28.1774867494040;
        Mon, 30 Mar 2026 03:44:54 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:e60:2c8a:54bb:d692])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48727bfc5ecsm185842685e9.1.2026.03.30.03.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:44:53 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Chris Brandt <chris.brandt@renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 2/3] drm: renesas: rzg2l_mipi_dsi: Increase reset deassertion delay
Date: Mon, 30 Mar 2026 11:44:45 +0100
Message-ID: <20260330104450.128512-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330104450.128512-1-biju.das.jz@bp.renesas.com>
References: <20260330104450.128512-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_TO(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30566-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[renesas.com,ideasonboard.com,ravnborg.org,lists.freedesktop.org,vger.kernel.org,glider.be,bp.renesas.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 57A953599AC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

The RZ/G2L hardware manual (Rev. 1.50, May 2025), Section 34.4.2.1,
requires waiting at least 1 msec after deasserting the CMN_RSTB signal
before the DSI-Tx module is ready. Increase the delay from 1 usec to
1 msec by replacing udelay(1) with fsleep(1000) for RZ/G2L SoCs.

Fixes: 7a043f978ed1 ("drm: rcar-du: Add RZ/G2L DSI driver")
Cc: stable@vger.kernel.org
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Moved the patch from patch#4 to patch#2.
 * Added fixes tag.
 * Updated commit description.
v1->v2:
 * Updated commit header and description.
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index ff95cb9a7de5..9d9f77d8f949 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -528,7 +528,7 @@ static int rzg2l_mipi_dsi_dphy_init(struct rzg2l_mipi_dsi *dsi,
 	if (ret < 0)
 		return ret;
 
-	udelay(1);
+	fsleep(1000);
 
 	return 0;
 }
-- 
2.43.0


