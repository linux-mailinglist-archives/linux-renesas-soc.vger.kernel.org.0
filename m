Return-Path: <linux-renesas-soc+bounces-31209-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDVtCcSl22meEgkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31209-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Apr 2026 16:01:40 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7908C3E41F1
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Apr 2026 16:01:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B852E3028ED2
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Apr 2026 14:00:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A7B136A035;
	Sun, 12 Apr 2026 14:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="djZqx/vD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3195A30FC23
	for <linux-renesas-soc@vger.kernel.org>; Sun, 12 Apr 2026 14:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776002440; cv=none; b=WPmepBiowR9owk+cVDasV/exLifeVuz6/C7PM7NhkfkXYCiTPDKsOg5/kKmwgJFYLcJ2x+olfPPvHCHNRqdiUMFt6HXlZsIPmIB49yTg2dM9kom3bkP+Dpp1aWbQuqUzCYzKrVpMC8Y8aD6OqVASS+xHsCMVHtwQih1XxvY/cP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776002440; c=relaxed/simple;
	bh=0kCU53SzmV+uinnrkVidKHIPcWwqk66luWO+WnEojvk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SqpIdkM+4VeKSY/PierXyKkCyxTbrCiZCQ7vO3OjCwjw8cs2MdogX/rq/b8VCBZi10IpO2hOQyxCsdQ4wrg3fVPx/+OjXPJt26CfnD1vUZ/yAfr2uHp7b+plepZzlx1S60VUvIJgjIowRzNwrxv0g6+IUNtcm2eET6e44EhLmy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=djZqx/vD; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43cfe71e5d3so2508573f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 12 Apr 2026 07:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776002438; x=1776607238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jIWV0wD0IVAod/dfAsNX5Qr54zSgEU8/W7tRZNFLB0I=;
        b=djZqx/vDe5Thv2DKY82iTkaU9cAkcWPQvWc4bWhja7r817oLp/YSNGxS3nw0O84FC6
         hZt6b7pCHb+vWOm7HSZQxlPaIdubIu0yOOTBOiacnV8XC1HzfsNcqUh0H3KL59Ro4D1p
         Mh9WdGLX5+ffSbT27xs6HjbcNHTohWdXWAycl0zhAlJ1kL6MFRaSgvAXDfoI2TdVIjoC
         fgEUkVtkP43QVLKba8MuDKkgldZJTYwX/lgMe/EhufTOOhLS4kAD9urVf2XZwNzHbPwF
         4JTcxBIYp3naWyIpYeqHmXEX6ByTDy/AkGo6eyHpbWKgDRTmVoSbj3RwF6uQQdI/ikDL
         fr4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776002438; x=1776607238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jIWV0wD0IVAod/dfAsNX5Qr54zSgEU8/W7tRZNFLB0I=;
        b=sVwUkA9I7S72GhS7emKchD6d/B77KpOlSut0rMGIHeky70M8VVA0KMI/e/uQQH31UT
         F+8XAnDGDmEU8/QAg3jXs9qBf9TCtIAfhMl5UB6hZ4Wy2ytc+FJ8W0GrIEgWRlSleXED
         lIQYyxV2IphWpfqTiFOkUbDgl/SBv8dPcA7r5u0qoJAb2hwFk533+2Dqpf5S4J0aiODi
         GfobKlBcILm6+qn/w1jTJL0dl6ZIfVIh4GZOxz4OXC11MO9JlXAC4Ekxz/qyGkM5wszK
         w8j18ybmgSnaiW4qCKgGqlzEOb/D51dxmWGwSGg4Jirw3nwKRJNPskImEdcj8r+TjNmJ
         ge9A==
X-Forwarded-Encrypted: i=1; AFNElJ96kBc2YbRTrzXmmfG9W4irZjAAqIf8pEr1dRn+OD+3I96i9pe55uIPTh7zsJ8449z3plm+6WwNtzerDImgWE1olg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVIzlT3mD3oDBtf2GJ/KZEOkuyzckOhXQlWky+4L3RFf+20dcm
	h0UzBNAdci4uX4paEZ6vmmYZdBfNibf3VAI8/ebnuLSMpa/htrY2iSlf
X-Gm-Gg: AeBDiesMbWdzBg+hyToZ9JgHz9jrCgUKcq0GcmME9r8i4hNIspb6FLoaj2kLHtNgFaj
	H4DnOXN0ylQrtLY4LHxYxKlP/cFIsuoe/9QcwG0ExXQxutHV/w6hTQVaMcTF96e58IiVWE1l4/R
	xtJy5ydIKE45w8YVqjq/TxIF+lF9d+jnS7B42+LUoibTyD+e1g0UHJr76IUQRnD6aDb49gJfD4z
	lS7hbsrPHKA+tyDec2wrnru2qXsseKu9gvapokWwgvVQ/NEUJtnyCBAqxF6pO6JNXOTiNYLkHnz
	XMl2HfTC5rEmR6d8zWQvquB5d4KQt+Px98LVuOoulXfBUM6Xp3lTrHq8jZ1DZac9mpq5keNgLW5
	YzPges315mqeGQdrLyYTW1KhwA4ZzKulCRpbUfyw5KkiwP0HzNqSGwJqRhPpXABfolEJfw2qAtq
	qvrdG5/j8R0mfMiqaw2f2XXAh6TwmK78QweEMEKna0a3dM8AtN
X-Received: by 2002:a05:6000:18a9:b0:43c:fd0a:5c6b with SMTP id ffacd0b85a97d-43d642bb025mr14837112f8f.50.1776002437560;
        Sun, 12 Apr 2026 07:00:37 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:6956:2074:5220:4650])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e50015sm26127538f8f.27.2026.04.12.07.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 07:00:37 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Heiner Kallweit <hkallweit1@gmail.com>,
	nic_swsd@realtek.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH net-next v3 2/5] r8169: Drop redundant phy_init_hw() call in rtl8169_up()
Date: Sun, 12 Apr 2026 15:00:24 +0100
Message-ID: <20260412140032.122841-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260412140032.122841-1-biju.das.jz@bp.renesas.com>
References: <20260412140032.122841-1-biju.das.jz@bp.renesas.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31209-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,glider.be,gmail.com];
	FREEMAIL_TO(0.00)[gmail.com,realtek.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 7908C3E41F1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Since phy_resume() now calls phy_init_hw() internally as part of the
resume sequence, the explicit phy_init_hw() call immediately before
phy_resume() in rtl8169_up() is redundant. Remove it.

No functional change intended.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Added the patch into series
 * Updated commit description.
v2:
 * New patch
---
 drivers/net/ethernet/realtek/r8169_main.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/realtek/r8169_main.c b/drivers/net/ethernet/realtek/r8169_main.c
index 791277e750ba..cb22105f323f 100644
--- a/drivers/net/ethernet/realtek/r8169_main.c
+++ b/drivers/net/ethernet/realtek/r8169_main.c
@@ -5032,7 +5032,6 @@ static void rtl8169_up(struct rtl8169_private *tp)
 		rtl8168_driver_start(tp);
 
 	pci_set_master(tp->pci_dev);
-	phy_init_hw(tp->phydev);
 	phy_resume(tp->phydev);
 	rtl8169_init_phy(tp);
 	napi_enable(&tp->napi);
-- 
2.43.0


