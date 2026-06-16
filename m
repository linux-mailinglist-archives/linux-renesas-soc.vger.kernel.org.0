Return-Path: <linux-renesas-soc+bounces-34068-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WwPMB8wpMWr0cwUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34068-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jun 2026 12:47:40 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9792268E724
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jun 2026 12:47:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=pjwhXh3G;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34068-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34068-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C8868316BE7A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jun 2026 10:45:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B23F367B71;
	Tue, 16 Jun 2026 10:45:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7B6438FF3
	for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Jun 2026 10:45:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781606715; cv=none; b=kgX2pq7A9vDpA4KxVtSghmSfkG5zdPUSo3DJkLP8mx3WPgtKMCx5HpDOMC9MG8A+S4FGgGv2QsUxEQXC/QxL7OF9O4NzmtclwRGbCztMGabCCbAby7p1/4UNJjF7fQdkE/gJgZn71E3L5GT/wXO64tOxxmnbVZZZ1MuP+CA5snk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781606715; c=relaxed/simple;
	bh=2IP5bzKrPP1avWGyw9czyrlEpkhAPYLy492taEVBjNM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DHxPzkG5h5c5eq1vQ9JrLeHZiXpn5O2wgw6MpOXIHfh5FszOUcYY8xv9rYagf+eex/sXOQ+kaH2Ev70GZKeC80Y3P08sByJUH8BG9dC2a++oG1I9dqp2uvfCfMwCbxc72BEq9iVfojvKEnazi6qWgnHNJCBjuXIqHIm5pri8muY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pjwhXh3G; arc=none smtp.client-ip=209.85.128.41
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4922244f7c7so26342625e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Jun 2026 03:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781606710; x=1782211510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PsFjgSS/FX2x/zJjPC7g84js6C+0Fg+tEgzYfiVoIkA=;
        b=pjwhXh3G9yWqLHDSdeumNFlbIsL2AmX/nhz40eyd4r1TwRwKwjxcRUY4JwjoGnrur+
         giB56cBJPLj8tRfl/pPe6CCJUkj2VeU1NVMzdQ2oK6f1D2edVgE/jL58FlpWgh/N4wix
         O4IKtotEwfyBUOb0/Yn7LhAXuNvlApnEAMJn+rQJRGVqwmT8qJQgb27LBY2UUp6IkAq/
         SskLhffRDSRmukfYH++DeH3keRVRNlxfPRO9FQ70FgQ0oZNigxZ14PwEch6ci/SnL9VQ
         0N+/50cnIPHSYGaTIVbELj3+zZHi9kqW6vVi4LHI29HocyXSH+t5+ZBWYC1Ni7jw0lKF
         5Ncg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781606710; x=1782211510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PsFjgSS/FX2x/zJjPC7g84js6C+0Fg+tEgzYfiVoIkA=;
        b=LUjs+ZQDaet8X4s7HrmVJ4F0xbEmNIItWWNwkGZiTZTgaH6Q+aH725sSn3bBwm3fNq
         MPcOaxoXBtXH2jFw2lCoQEHlMUnDxvXiBCdXlauIvC6J/ZPTDN9NTvS4Xb9mmeP6DO60
         7NGep/NsjF1WUy3evAxBB5v6NtKu9hB0cG9hS9friXM/B6lotdiRsdSmL3ilVmO+55jr
         A2V09mLoUkhrFjwZi9yVzDjWW9UVuXzm5bZe2ak3jlBhbk/EO2pZOemDUcgdWlV0pAXW
         PeyZx5KwJs3qiamDzthcLda5yDv+NVeIe+zHAhqJFXQcYc4O1Z0k1sw8SIhOhNiYPlZR
         jVxw==
X-Forwarded-Encrypted: i=1; AFNElJ8mkLSC8yQO27CKNtB+svvKzyO70Ed1G7iDiF9OfIKFuOKo09d7d9hIKdap8RPc79pxgChc45QjsCgOj6RuUMYqnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyiK7c0TXm2gdlS6srSOst1GvhhuPWHy80wlXkVnKFEc8bWjMGZ
	k3ZCA3cVTFoOW4rTMGdipzNGHTB4S1uYkRrfyCxsW5wXKf5DvTfbfSqT
X-Gm-Gg: Acq92OEIRD9+d9qBMKrb8TCkOJ0JTUzI8iQmHmbFSLed2vfkj8fX+mJvxPAVLMIzAf/
	V1WPgem94nYF8miMAXcWSRjC83U6kkEmuKIt/F4y47xxSbF/VV/URYU90zqfwg4LWAPM0SQI6Tk
	pz2YsJsTQd8flvZfCnlF78/ihxY7k4udJcNEHC4XYFVLc1ZoPtDy4/OWeWIj+GKRXIfXdr5rSCw
	GUjA5ner3zaZi62r+UTFVcz0fRzrEUohZr3AUKWFKL5vVGCY1jGsD/wPC850O/Vi9IayNXKAbDe
	Lmci99getA3FIo374B22OVkh6YHPQyQsmM7O87lIm9yozpT9bwdrWm/F0eyRM/0zecpeK9JwR9A
	SPIhhcFrztEQmJjwXZKdpfYil9+RBlkF31spviH+QxQs3DcCHjHbVwZGMXP6EZk5Kz9Byo0PAuQ
	UnEVRuyhBAkJ9YKy+Td9nVKrzJA0WriKg/xyNphVck0zwYm4yd
X-Received: by 2002:a05:600c:1383:b0:48f:d1b8:9ab1 with SMTP id 5b1f17b1804b1-49220074737mr210663065e9.9.1781606709211;
        Tue, 16 Jun 2026 03:45:09 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:7499:34c3:598b:e20c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa47da9sm82458485e9.5.2026.06.16.03.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 03:45:08 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-renesas-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 07/10] phy: renesas: phy-rcar-gen3-usb2: Add RZ/G3L support
Date: Tue, 16 Jun 2026 11:44:49 +0100
Message-ID: <20260616104459.410743-8-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616104459.410743-1-biju.das.jz@bp.renesas.com>
References: <20260616104459.410743-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-34068-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:yoshihiro.shimoda.uh@renesas.com,m:vkoul@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:biju.das.jz@bp.renesas.com,m:neil.armstrong@linaro.org,m:linux-renesas-soc@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[renesas.com,kernel.org,glider.be,gmail.com];
	FREEMAIL_CC(0.00)[bp.renesas.com,linaro.org,vger.kernel.org,lists.infradead.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9792268E724

From: Biju Das <biju.das.jz@bp.renesas.com>

Add renesas,usb2-phy-r9a08g046 to the OF match table, reusing
rz_g3s_phy_usb2_data as the PHY configuration is shared with RZ/G3S.

While the PHY data is shared, RZ/G3L differs from RZ/G3S in that it has
two OTG controllers, OTG interrupts on port 2, and a controllable
OTG_PERI bit in COMMCTRL for host/device switching on the port 2 USB
controller, which is fixed to host-only on RZ/G3S.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Updated commit description.
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 9a45d840efeb..d06fb52ed5f1 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -721,6 +721,10 @@ static const struct of_device_id rcar_gen3_phy_usb2_match_table[] = {
 		.compatible = "renesas,usb2-phy-r9a08g045",
 		.data = &rz_g3s_phy_usb2_data,
 	},
+	{
+		.compatible = "renesas,usb2-phy-r9a08g046",
+		.data = &rz_g3s_phy_usb2_data,
+	},
 	{
 		.compatible = "renesas,usb2-phy-r9a09g057",
 		.data = &rz_v2h_phy_usb2_data,
-- 
2.43.0


