Return-Path: <linux-renesas-soc+bounces-31212-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEUnHVmm22nbEgkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31212-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Apr 2026 16:04:09 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E59A3E4227
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Apr 2026 16:04:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C8D8305A425
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Apr 2026 14:00:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62F0836A035;
	Sun, 12 Apr 2026 14:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mGpQaASC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8B237C92D
	for <linux-renesas-soc@vger.kernel.org>; Sun, 12 Apr 2026 14:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776002444; cv=none; b=pOqYq8ourCa/W3mBuSeJik5q7hJDX5J5vS89o6Gz4NgesNYCVcPLyffnlGVZbhf4mFGYzQBArM25NLC/1K2ksK6MmAEXgfaHdsGy05souqxmkcUjCh1v+VWGLfr64hPeLxyfK9zet24kPSA96TyHyVxp1jikrkt/vfbUO/XSGBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776002444; c=relaxed/simple;
	bh=zcEQ344RiBm7JrfsgTgQ4Lp6CjbZtUDRo6ogiL5TbHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SdOJf+aDWYJ/Uskn/g97UQkSqEANi45wjd9MfvmAqxcuygc3DoCbJ05LF8yiRM5pGsIWsUzd7SZ6YYkmtu8LoV8UrjMaoTnhx6oktepNalAxzZwzLd11OilEeyy7Mb4bzG9uhHe/bXPzZic3qwHylUiWh6kswWVz9fsF2qao0aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mGpQaASC; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43d7645adbdso162412f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 12 Apr 2026 07:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776002441; x=1776607241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cNQ4/Bgols+4vK0uVdE0kuKThLWN9Gx/3rmL3xyL0Gc=;
        b=mGpQaASClSZZdW3sshx72H505xOtSaza6rn+UfaUh2aTggWGRAJRfY+vTSxOGuuxZY
         B6GOXBg+CcxaXmk7YkT6vy+d5Ms3EFQX4GoLtYeZg8EH8KgoLyPPDFDXolzzSbfNSXrZ
         upuvIPMVjnsJTu9XNPmD2K9JftY6pdro0I4j2LasfhE0bivVOnEWYIEGpnBY9o+MFc4j
         Z35+8gJuHvVQCJOSOPIwTRED3MhynjnpW8rSGAqTfciFNSOj3nX/1NUEuu/9gG7oj9nE
         nUMouj/iQjrYpojI7ta/D62+I2x+jOcUKoLUbtdfpLBWZS2U2jgmKyfSfvFa8eaHo6Q9
         lfIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776002441; x=1776607241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cNQ4/Bgols+4vK0uVdE0kuKThLWN9Gx/3rmL3xyL0Gc=;
        b=f+G0s8A4FDLKv9jM2quGZkJnU6I09gognEnJ3exfFsHd9ZrFTB5xW28oG6OYdRCM23
         AD2722cNC7iW/TeuB4uZU9TtAl/vs8rlkZixxduJuhFoVyS58Ppr/82Vuq0KdrQaXlXd
         eRjNBwRvqsjqHuDYf7+uc99gfdM4eocM//ABl3VbwsxmKYp+W0c10QcKKsevht66Da4E
         xfCFnAYM1aFqPrBdnpm2ekjj1c9iXrP1NrkIQ1FF7y79LJe895hsJZK9gfUa4aaA8bUe
         YPHqEEjnl2YpuRd+MipWK1sUNMSo3pzlX8eMPNe+I6LGgbKCvRK0XOt2MU0YKbFFwr1m
         kQEw==
X-Forwarded-Encrypted: i=1; AFNElJ80chEepWvEv0J1IqIwCA5lccxbt8aeJICioSgSb1XAvxwjl0nQAP64gqKCevDozZNf7zvIcZpMtz7bapZV/DZLJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBpl14vNikrmjrg+izHD1ovvH4LeIufZmn+8AMLjSxqzPuuH4B
	Zey2CfF2YQtjOz6+NK/vW1oL2k7o/qTIomM9CULtok69qjxbl3YLvAiF
X-Gm-Gg: AeBDieunQ+cKEv8afJdaL400hzkYeCpE7xl19ogjSZsVK1qdfGbfYjo9JPKhBX0a07B
	USwNwBXIWJRoO5ZzkWn6dQG4XQedEoKtyFG2h0k4U9qPpjn+JGnzO/0GXDBvSMt0RdlYI8WsjA/
	BToVzzo1qgFL4R6ORMu8TmCenDUR29SrJwrFfXwc/i1qExIqZcU626uzPaHr6Y3Sivn+4x0DEiw
	ngeTp46gm3bwYYaSjNw0sg5dyfN1sRHgwl9KSuFi0pa7w/+KpyVszHTKXiacpNSLNuQ9/SrBbmG
	Of2Q1sQgG0QFzd/D7qZUWU2OEPNEAj7oSDPJFFDzGaImvcwGRBoQ3nEGjMY307nIR/ofqAa+knP
	EBEYn+nVqeIi6KxAqKB0UhrswgfkqSb0ikHB36QAdr4EFXJnJ0Dym3gxoPbRe8PYQ5kcA6ZNxk0
	fvYgTQYxT0aH/fGxuuPg0RYZqQ1l4dcDbFckDLIeXxgf9+HST/JXrVAlXRip0=
X-Received: by 2002:a5d:64c8:0:b0:43d:76b0:78e with SMTP id ffacd0b85a97d-43d76b0161cmr2231826f8f.14.1776002440962;
        Sun, 12 Apr 2026 07:00:40 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:6956:2074:5220:4650])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e50015sm26127538f8f.27.2026.04.12.07.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 07:00:40 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Russell King <linux@armlinux.org.uk>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH net-next v3 5/5] net: phy: Move phy_init_hw() from phy_resume() to __phy_resume()
Date: Sun, 12 Apr 2026 15:00:27 +0100
Message-ID: <20260412140032.122841-6-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31212-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,armlinux.org.uk,vger.kernel.org,glider.be,gmail.com];
	FREEMAIL_TO(0.00)[lunn.ch,gmail.com,davemloft.net,google.com,kernel.org,redhat.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0E59A3E4227
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Now that redundant locking has been removed from PHY driver callbacks,
phy_init_hw() can be called with phydev->lock held.

Many MAC drivers and the phylink framework resume the PHY via
phy_start(), which invokes __phy_resume() directly without going
through phy_resume(). Keeping phy_init_hw() in phy_resume() means it
is not called in this path.

Move phy_init_hw() into __phy_resume() so that PHY soft reset and
re-initialisation happen unconditionally on every resume, regardless
of which code path triggers it.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3:
 * New patch.
---
 drivers/net/phy/phy_device.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 4a2b19d39373..16fc2fc63c50 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -1999,6 +1999,10 @@ int __phy_resume(struct phy_device *phydev)
 
 	lockdep_assert_held(&phydev->lock);
 
+	ret = phy_init_hw(phydev);
+	if (ret)
+		return ret;
+
 	if (!phydrv || !phydrv->resume)
 		return 0;
 
@@ -2014,10 +2018,6 @@ int phy_resume(struct phy_device *phydev)
 {
 	int ret;
 
-	ret = phy_init_hw(phydev);
-	if (ret)
-		return ret;
-
 	mutex_lock(&phydev->lock);
 	ret = __phy_resume(phydev);
 	mutex_unlock(&phydev->lock);
-- 
2.43.0


