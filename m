Return-Path: <linux-renesas-soc+bounces-31194-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFRdI+Rx2mln2ggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31194-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Apr 2026 18:08:04 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4DA3E0BF5
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Apr 2026 18:08:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 72C0F3002F74
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Apr 2026 16:08:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 628041A682F;
	Sat, 11 Apr 2026 16:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QGk70xXO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B3D35A38C
	for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Apr 2026 16:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775923679; cv=none; b=dxaFWz5ek9SVYeaLb75qY/XemCR33ju4oUKnW6MsY7UaWYu3cW26LmrUFIx2vRnS93s7NC0jWRwwXzpfsc8j1sKB7OSFuKhKZIao5+Jin3cWA5jbK/6M9Qm4lY/HA3LWbA0MvIEyTBAfgnJtaacSrP0qYWsIsireKqyC2xH+vxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775923679; c=relaxed/simple;
	bh=IoRvBl5NbwVmePrT/sLsz6MCHOaWq/wLqfn9iURD72A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iUXqHfAWHcj/cY5xBEen0QdsVUt1kRz2zyJoLBvFdRqbSwx0/cLYr0ggj1TK7Ai6cbZ5RH+NSVlC+tv2E9W8s8Fk1nUsZ9B5PwwcAITNhNhsCa+bVv38qBH7p1BNlIxTR0Vl0GxuMlgW2IrnxBhMLu0dPosYTHhutJZNedLQ4EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QGk70xXO; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48374014a77so42370635e9.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Apr 2026 09:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775923676; x=1776528476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X4ngqPMcB97z9LiWUOSiTShgxTHtSI2/jBhJeR2rFVk=;
        b=QGk70xXOueS0TRYHlkyxWAaOKtJM5KTjB6nXIuJYBcfw3YPA1F3QZ5V5MvET0MTLf3
         rrUv4TwARnASrleKSUfFJpN2ZDVQHssqeL0TZCsA9fgd9ZrestbFC8Exsy3X4F/sg3lN
         4+req7peOggnNrYuTvz9SE2nEBpMx9bGkl+OjfP77eLOj8T1KlTzRnbRFzi0wnxn7gCD
         RZZhhIWQmsY/4U0bD9CYc5W+C9Xc8ftK2kGE4S+NRLcVzZ9DpVWgXxFNJ5ogUYnY/eX4
         MxK1H66XChb6r0wc6McTR8Jc3+ug8TfMTkUJBXnDrZ1iq2nw2P1zfMi594iDCSSdBLXk
         PUtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775923676; x=1776528476;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X4ngqPMcB97z9LiWUOSiTShgxTHtSI2/jBhJeR2rFVk=;
        b=k35iVqScYZUvkarFTm9GvjYV/b+CcTF4660vRw68d5DFrB82o9SHE6rUp5wYmrcpXy
         aF8dccC/pI2YFW8cZ6ry92Nrv5uhPEmpmwNRWYI5tBwsw9dUC6/9oNaXJpb+cJ0Lhq+O
         ZXoST5r7l2lkU0OStszmF2vtIJbIXnWzB3DxVoNjHHGLtf/BOe+TKige+d9P/S+wD2BP
         XYsx15/ZJBOEl7oOEnScghat2ur8o6XzR2TZK7rugrtOg3T5mpp4t3drhQx9orCHdtgl
         QIkGq4E4nIO3y3Y82ZT0ofXe2VQ0F5XDJM6xpJMtB9pwidZs0b8/V7di7zBKOVczkBPK
         MHig==
X-Forwarded-Encrypted: i=1; AJvYcCV4C2JlMauRWpOBSFas5aiNhL8PZLh5pcXlDuCFz/nqfpm5305UkmxfaXYAao0NrQZkXxXF1VOp7ltqsnpgHkkxyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxuatN9oTT8hthPTAD7ankFMIJDbVYPl+zgm/p6sxMMQhiA0T2
	o9DXIZkvbETkw/aJNSPlzzBPiKMPJ8ukyxIXpt3OEHWa6xV146Cd0WD8
X-Gm-Gg: AeBDieuef1i3Y20e5Fnea6Ipw0eXBGFdwS8UL+GRWIXQ0I5oBhhSaI8Cl0HUPDjE1WI
	Z/aPdHcX1URsAavB0l9YccPBXgz03sB3ewsv+Tgj6luQZuxk4wj/s8EsuGMk1NbEfWv7xbQ/qSl
	0Ozt6IFiUAJAfrr4u1P4OQAqfAvoXSCEwPpa0spar90x2PCK3d/Hi5Czj6AH34NpNr2+OTWLKTi
	kJXETcUoeT2RnjpnKF1/X2C0gqciD1rtej7I1+dYoWOwtFhFwzXXXup/UZPwR7d95OySYLE9hjU
	px0NKyOXLqDUqG03aDDVQs4ITITe27maH+Y094I8lSDhVckJzL8SQRVrWQmMkhhvU2nll2Lrc93
	xfpwqdQZWJKn5lcEcoPPRl4fWT6bqF+dS1viJm4fvQAkzw+257CpTgYCqyEKE5G2IjIAWb6FNlO
	fR+OF3a3NImbtWWi1F7xWVtFvgKno87891ejKUH1sE4g==
X-Received: by 2002:a05:600c:5308:b0:488:8d44:bf98 with SMTP id 5b1f17b1804b1-488d67f088amr97620445e9.7.1775923676105;
        Sat, 11 Apr 2026 09:07:56 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:1ef3:1f1e:3a7e:32e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d531f1f9sm199900805e9.1.2026.04.11.09.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 09:07:55 -0700 (PDT)
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
Subject: [PATCH net-next] r8169: Drop redundant phy_init_hw() call in rtl8169_up()
Date: Sat, 11 Apr 2026 17:07:50 +0100
Message-ID: <20260411160753.201182-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31194-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: 8D4DA3E0BF5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

phy_resume() called immediately after already invokes phy_init_hw()
internally as part of the resume sequence. Remove the explicit
phy_init_hw() call in rtl8169_up() as it is redundant.

No functional change intended.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
This patch depend upon [1]
[1] https://lore.kernel.org/all/20260411142956.88343-1-biju.das.jz@bp.renesas.com/
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


