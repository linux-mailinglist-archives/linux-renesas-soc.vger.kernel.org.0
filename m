Return-Path: <linux-renesas-soc+bounces-33934-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sx8wGTwZLGqHLQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33934-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 16:35:40 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC7467A3C8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 16:35:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=rRaignoN;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33934-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33934-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A2EAF32451FF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 14:31:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FFB63B1002;
	Fri, 12 Jun 2026 14:31:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07B43A0B1D
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 14:31:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781274662; cv=none; b=kdW6LsjDxERUTe++dk70zZfiNE3YN6wRrcKfJp+Q6U/N45Lw41pv7QDFq7xVng1eD/yzt4D+OvQuMIHWJyUfOdqW/Is8SrMOnoGdY+8mEPOtrZ8dc+/g0WHhbllFPy8H1G8T4muJ6v/PWs5Fgu66cVhrtIHSLA6Dk3BCMHmW5cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781274662; c=relaxed/simple;
	bh=s43LqaxWJoz+8KoBSafLl3SEaGnKHh5t4Kj6iU9I7ZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bei6aBVzkPc75dtmbyunfY7sCLDUxF8YfGAjse32vZNzHEe2VsZb+dAnzHA80RLWq3/+GrLemfH/lq4v8428FuryrylNE9ihQkIb8fk1aGGeeFr40uWrlY1xygUUi+0/983SogZZlILa2NZ455ztuMwc2nU6zIy9J0+daE20ojs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rRaignoN; arc=none smtp.client-ip=209.85.218.54
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-bebb72b845aso175423966b.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 07:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781274659; x=1781879459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dlNfWCkBlvoF7s7VT/UN315rRjUSgiiIqxtqEozxAsM=;
        b=rRaignoNflmjhsCZkY32KaH4R45udG2WnUPmidMh0/RgpIhk1u2PjnyJdFDLAGqNS4
         RU737VAZqrn3cbMlOzGANcAA7S06k1MvdvuzIUAPMrM2j7ZWkb4V3LFM5arw0Mbz2XAh
         P33jvAtYWtlNiAaai/6CmBe5OHSYVIHN0vclvFqwRJRp4dMe3eQfhJ9G7p0PWlxBIKDV
         kP682xXsHAvsVId/yEutbH80k4fu0lSIdmuYavkq7FS+BX5roXFWTfDiMPTV9lBJ0myC
         kXDIYngkLGjcKbvTKiwElJn674YGGJy7fzlMspfYQR/jQJbnW96gmGgrnfiqc0oebXJG
         zNkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781274659; x=1781879459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dlNfWCkBlvoF7s7VT/UN315rRjUSgiiIqxtqEozxAsM=;
        b=O0oiX5lzn+fAG/9X1z+1wsqECXm+EirfZNY8tszrPC/T3AtxT8CA61qnZwjkDhMT/X
         JtFx430c5GRolvoYWNoNKqhNkfmEhod20YzD7RwTuT0wNfy8l31x84okIkxSJ+7ymD6/
         wAIi8aAnpPzuwnXz4ZsNPYRo9B27QgHUl1OUR/LVXAxWzJLPP8ryXRBrjDDbqKOFlUyW
         g94O7rGkM8fOj+eNyLWHV6ijd9zJHAzvcsCv4yG0dPN7z4WFAqhli7HvVXTMH4Q37nTA
         99Jf7rWuXkordTkx2B1iy3F8nfMjqDRdCc3ocCWlcvXYBGPH+uqssmzwC8lw8EoPnjkv
         +cvg==
X-Forwarded-Encrypted: i=1; AFNElJ/e3mslpxsT4d/Wlfki2Kh+a7E9YnCha6YzqQwB20r+oCYVSwySqNZx25CGxIb9IACiaLapShnhuCqpEE555ku/8g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0IJgTrtT3thNvKx0Tq1Vtl628rdL0QCzvA2/hEhOZThiCRBYk
	Mi9LGaJvEEwUuchujLqxoIYLHwjNEcIWDLUJ1+n7ULaur7ff8JehnBA7
X-Gm-Gg: Acq92OGTl49BU6EpEDa3uMSbc3ziE22Yh+9Ha4AcG0Ul0CjIG1nEZa68kssr5pgunfK
	g1XXK2n4Brb8DpAqcDTOxTb9ti71f7Nap3ISLD/DUFpTR//P2N1M6siOd+7In9+cg+PtYAT27Bi
	p2bgcMt+Sskd3Joqq4etFoRN6hwJxPZ2y+A3ZhRYewpcqrQezDPgvrJcqkyRkk9cAJgEKjaFo28
	mYALcHBzKTrqmBzzKikTqmfyNjCOM6QiHNj1kszst/KMRA7j0EFjRvtXDoaLz8jFDFKkE34o4rc
	SZz5Ai0mf7FT3Z7aYMB/3rCPImXY2u3x8/9fWiSqsL1V7HvNIWvKdBC+UObi2G4oxCo8vfj7ZfX
	kgqbTBuVbC1d5OHN0qA5Ac7qe/5KF8myfsmed6lmbkBiM0zCPEs4Y+w5EbPbLB6tsvXLLbT7CMu
	BDsOJtXks/D1n0eA3Z/tcjWXP9swij4btPEhBDWPxCeYFY6ZL2gXs7pVdItgc=
X-Received: by 2002:a17:907:75e6:b0:bee:4562:3308 with SMTP id a640c23a62f3a-bfe2a1149d8mr95992766b.26.1781274658810;
        Fri, 12 Jun 2026 07:30:58 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:c72c:50c4:8b28:9a3a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2c3782sm5850016f8f.25.2026.06.12.07.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 07:30:58 -0700 (PDT)
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
Subject: [PATCH 08/11] phy: renesas: phy-rcar-gen3-usb2: Add RZ/G3L support
Date: Fri, 12 Jun 2026 15:30:36 +0100
Message-ID: <20260612143048.317907-9-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612143048.317907-1-biju.das.jz@bp.renesas.com>
References: <20260612143048.317907-1-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-33934-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:yoshihiro.shimoda.uh@renesas.com,m:vkoul@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:biju.das.jz@bp.renesas.com,m:neil.armstrong@linaro.org,m:linux-renesas-soc@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[renesas.com,kernel.org,glider.be,gmail.com];
	FREEMAIL_CC(0.00)[bp.renesas.com,linaro.org,vger.kernel.org,lists.infradead.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CAC7467A3C8

From: Biju Das <biju.das.jz@bp.renesas.com>

Add renesas,usb2-phy-r9a08g046 to the OF match table, reusing
rz_g3s_phy_usb2_data since the PHY configuration is shared with RZ/G3S.

Unlike RZ/G3S, RZ/G3L has two OTG controllers, OTG interrupts on port 2,
and a controllable OTG_PERI bit in COMMCTRL for host/device switching on
the port 2 USB controller (fixed to host-only on RZ/G3S).

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
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


