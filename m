Return-Path: <linux-renesas-soc+bounces-31141-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJufBRwK2WnnlQgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31141-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 16:33:00 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEB63D8B25
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 16:32:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 54A88304E32C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 14:29:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2F0A3D34A4;
	Fri, 10 Apr 2026 14:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tDREwrzt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04C83A75B7
	for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Apr 2026 14:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775831352; cv=none; b=YB9mK4Z9L7MbOVLZyrtsi6FitmZ5G7B1Ll58zqDWD7tK7NneBJgNogHBPMYr6ltKi5/lfViYUmYEm+wrDoqqe6iRyaYBUhSHlywKDWV/8vykITWSVXULeTxkyq03Dy43hqV0LGWxppAE0aaYrP4ztL+x3wytrfoN2XmV1z0eg9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775831352; c=relaxed/simple;
	bh=TEf5F57v7HEnHtXPb+hOYDZ5jDdp0Hf1213WKXRWpec=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JipWrEXVkxzBMMYH2Eo6KagxGzLR4SRMn8Xax+0TXGlN9NDgGp1V9MVdyAYMEw32Cwksxn9FD+CDwJi3QIKMHTJAendwjMjoJyErAkGvOpOu14vRa8iY8Y8volHtzVBhl6jzJEp0Pz+0zM8Z5Yt88v+uZPLw+spw9bb2D0AotiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tDREwrzt; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43d17bb1c1dso1663508f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Apr 2026 07:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775831349; x=1776436149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+pEe+gtdxvWjftA7HMrj78CByc1wgd3xl+mbsfpya0A=;
        b=tDREwrzt+BJDg+XjKWmRVUbSqCAO2s5tCmEDoKyq7Vw9jwo56xdlbgnpBpX9nWAsps
         10TocxSq3Ph/9AV0DlZQhOkj3RcfNe3KKfx/W/f0AWPQsRJkiSbIX0mKqJECcuTJ/4yU
         Mbbxm5pDoro48sfB8RzSEbxAC0Irho/IzqCz3otIWP+r0Xv2tx8Jm99ZtXeZtoV5v7sJ
         8dsIzIIBv5d4aVcbtkGkd/xgByfwUPPOdsSwQkJtq6Rr81arTS5iKwStmkBOAN6elZyg
         w4lFknzkPjMPSrx0+e7CvbEX/ORMizQeS9x3BHqty4K9AVwqKd3fEvpk95Iam5jQi68n
         H1EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775831349; x=1776436149;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+pEe+gtdxvWjftA7HMrj78CByc1wgd3xl+mbsfpya0A=;
        b=ou2yaG9bwLANOuocRYPTHtXq7aPdZ0JP5JrnE0W/Yi6uE7SDmH5VCyS5HaQgkVcMdq
         AT42WewjX0oM2bSpOCv+G9ZmU1/4Lj/jUjL5eBIW8N0/iNx6ABLllFfTP//p+fJ8Toy7
         KQ4+L3WHpp7dxh1E0Xm+mAhGv2+vwV0XNvFjaVJnj9tFOLnOD8toZA3VTzCjW3ou2tQq
         ITBkrewiW9AkIZyWq10Ca7WMyqHLFm93bSymGg9S77R4FoYRmZGjpIB9DtDmsgXZBWam
         8BaYEEmMlZk72ZIfS6EMreOoH3k0IbAdJ1L4OleICMXvwDoJimiEMukzPTNXAbCpMTd3
         Q1Nw==
X-Forwarded-Encrypted: i=1; AJvYcCWiaqg9iPSdxkyeUQrmQHTLIoCcNN+pw33w2T5z5rqd2AGaDPRMG92JQTGjSlD4kSgwXDY7WK0p15o+dVOEADLVOw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuAxhvUW/5XrnN9F2XA0M82fv32Zej2MBSr006MZcIuCNkKz7v
	zmq/3729bxQI0uLdvY05fk9HtHLKm+xiyromciYCRE2EiHF3YE/WkLU/
X-Gm-Gg: AeBDiet3oSTJ4eiN5RvrdtKpNgsPqAxLKahiWMe1i6X92DcV8t4E/kKWi+nZuWFDf/I
	+5IyKBN/m6F/4eSs5jU86HpPf1KX5qTz157sN1jc5IPjNbmkeRaEewp/MXDJnl2m61BfREOajuU
	RcoJDtwABTU8vQj+Dkna0CLxY7+8O+zFaWuh0Kh1an4CytKSLWsZ0AEll2z4g7+AC7Giga91G5i
	JdFl/8e27CkhzKwEf1jBwN1xCadvKdnEnqRwU+2idpiT209T9eoA/PewNc7X4WrjlmwV/0VYfO2
	ul95Zza3J9oixAT8uNJQVEZ25tdkjMi3dQSxcDxHZGoM7pK/GvAgJBIpkOwHovSa/k+2YgUUAf/
	BeRkE3k80PRCWbGFldiyU9vBPtfycKxr1YTMvekKPYste8pEv4ZwFYzAHCWDkbC0gSsszWQQoNC
	C9i7DQIA7lt4O0z7HeEDPVeTbFeL/bqJ0j0sAnexKw+rH7nvJs
X-Received: by 2002:a5d:698b:0:b0:43d:68c4:df0 with SMTP id ffacd0b85a97d-43d68c40e82mr725167f8f.10.1775831348892;
        Fri, 10 Apr 2026 07:29:08 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:2bb2:802c:245d:23d4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5c98fsm8389818f8f.35.2026.04.10.07.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 07:29:08 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
	Russell King <linux@armlinux.org.uk>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH net-next] net: phy: call phy_init_hw() in phy resume path
Date: Fri, 10 Apr 2026 15:29:01 +0100
Message-ID: <20260410142904.439666-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31141-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[lunn.ch,gmail.com,davemloft.net,google.com,kernel.org,redhat.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[renesas.com,armlinux.org.uk,vger.kernel.org,glider.be,bp.renesas.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 6AEB63D8B25
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

When mac_managed_pm flag is set, mdio_bus_phy_resume() is skipped, so
phy_init_hw(), which performs soft_reset and config_init, is not called
during resume.

This is inconsistent with the non-mac_managed_pm path, where
mdio_bus_phy_resume() calls phy_init_hw() before phy_resume() on every
resume.

To align both paths, add a phy_init_hw() call at the top of
__phy_resume(), before invoking the driver's resume callback. This
guarantees the PHY undergoes soft reset and re-initialization regardless
of whether PM is managed by the MAC or the MDIO bus.

Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/net/phy/phy_device.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 0edff47478c2..8255f4208d66 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -2008,6 +2008,10 @@ int __phy_resume(struct phy_device *phydev)
 	if (!phydrv || !phydrv->resume)
 		return 0;
 
+	ret = phy_init_hw(phydev);
+	if (ret)
+		return ret;
+
 	ret = phydrv->resume(phydev);
 	if (!ret)
 		phydev->suspended = false;
-- 
2.43.0


