Return-Path: <linux-renesas-soc+bounces-30225-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONwPMb7Iw2lKuAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30225-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 12:36:30 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D365D323FC9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 12:36:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 792C0308E88A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 11:20:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 990B83CCFA0;
	Wed, 25 Mar 2026 11:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pIK+SGib"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282673CCFD1
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 11:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774437649; cv=none; b=HNZhc0xkMJx5QjFnQIK1DA966aDVuVMbxeQHK9ShcCNmVLQ8xe8xXeoqMP6W1wItcg4o3NCrIRziaGfQ//YRZwZhaFtCMdfM7JMXBMTVV7J96HVV6qLW+ROHHXj8QobgH9tBDqw2xuKF0NOHzELT4U63BPAt36vaizbvt64b8Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774437649; c=relaxed/simple;
	bh=O+ThQsahUnk734oWnoBLUJg1oyxuP1qQGEU6Qizf36U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tI3RlHrv7Dvs6wuefjDlx3px+k0LW00hvDYtbaBeTiOKhY9cTrWCCERVBPTrHTxCej+M3UkzUGcZHZRmlCNjskKWs/0djMlkvuwyZwKGlrbxUokgGshm1H7Vu+GISmPbJ8TR7jq8+97xfWQ0Pf0S+kkwB9NpHa7mlybJgFo9nvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pIK+SGib; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-439c56e822eso2205262f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 04:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774437646; x=1775042446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0dwTG4J1M8IL8PPbtOF4W3xYh4+M5sfK/wvLd5SnCE8=;
        b=pIK+SGibUN2f9Z4RPOKgExzsikiDDJZHfhIm9ZIJ3hSf0g7vhVhbv6HqDI9JTaTp5r
         e5GPk9u3npUZ58+eb7vNS/FzhyzFQ7YacXUNYTs1NUZKm/4ibKkps8CdvtvZc9+fdKyd
         z7y2cNdKB2XKM5cY61O3DYZ+AxqioV2/ZUuUPlfF0clNUxXFUBfar0+qnhuHUxtuOP5t
         SiMwQEz1rMjQb0hd6QRWbmPS/R/foy7spDUENzeSx0dyomnWKsKrXTuh+C6S89WSArxF
         fI/bANCQIDhzUWHOYaJB9wFLVc/E0j4Ooc0Wb9w1v/O/a9kyjSda2tHbibLE2DzSzCS5
         aIcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774437646; x=1775042446;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0dwTG4J1M8IL8PPbtOF4W3xYh4+M5sfK/wvLd5SnCE8=;
        b=izvFe35YL9jy/qBh68NViWKdfi3GRAMDVaZo8nb5JWMzVrD7DMcmfjcRVvBK0W0aYb
         jI1JS0Mq4L9cAWpWz11vBwqcUrlTvS7ZFo8cT4Gr7LgLmHnOgQDb4nQC1HZ5E3NNEOVy
         pSmA5wB5XGkhVyMqDwIYsIKHURUXLkYHcRIQwPM3Xe1cZ4MTIQUTO0lu1PsqfHtfEtdj
         DLmQO4zTWb0QpAXq5dGQCTGISCfub61FObcB0enEUswn82fWYoyp/eXQZyNCnHl2Cuh4
         iNEIvrvPMir1W8KGqy9ntkRWBcAcwGKATdV3XugPgwgXMD599/S7kJd+VJC2qxPQjPac
         WzUA==
X-Gm-Message-State: AOJu0Yy8CIemQD70xLMsWKxrLT9XNOFNR5JxSq2175gJZPR3C1lrNT8B
	HbFH+VELGKj931dU+JknlnpvcHnMROEiqlIMw9R9cvBByJbJ0YmhO8q9
X-Gm-Gg: ATEYQzyGffv0KMCKT3b5fqsSmUjq6QIKzcsNpcR3MEavxLpYIJCJ2/HiVcnckRbsqpy
	IhsKcvRuiIo8WlGpcqFPV+6ILtI1Ek4EVlQ+NuigDMoj8m3TO3TMT0Y57bR+1jouxkdXukNQtz3
	3dQzsEsgj122v6f4q5T3jwKySUbc2/94LQkbVHeuUpejf0ujHQYIn4oAjgpA99JWQzn4UBModG6
	So830S3B1+UarXezCZGzlWFIl0HOXJJXdFJaxiKIEJac1h/MTgFQv9e8PpiaSHY9nixCcY2ztWW
	HWn+IUZRjI4xCmNiu7PEKtuUeKm0pQcZFj6uYFtUUP0mJG5Tg3J8ZsMB4ZTCKyZpPLBm6F1Fhor
	DtgTzfIk751c1vNAD/oNlxPa78M7V4Fc39WmVBrEAUBZ0PVJ8RUCQAcTFyqQ/0UtWNGaOKpdrHa
	3c4Hhd4GrdmlUXiyK/ndVLeVYDQjiPW6MCAmUcbHW99gcoNrp2v6nHBo+bxCOo15YQ4WOmWn5dR
	TgLs293zpdESMYH+RMJ8YIGW4h9TgnlW80+
X-Received: by 2002:a05:600c:1e09:b0:487:5c0:671f with SMTP id 5b1f17b1804b1-48715fe711emr53696995e9.9.1774437646297;
        Wed, 25 Mar 2026 04:20:46 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:3783:5d64:bc35:885])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487165ecf00sm20077425e9.5.2026.03.25.04.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 04:20:45 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Pavel Machek <pavel@nabladev.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2] phy: renesas: rcar-gen3-usb2: Simplify ID/VBUS detection logic
Date: Wed, 25 Mar 2026 11:20:39 +0000
Message-ID: <20260325112039.464992-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
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
	TAGGED_FROM(0.00)[bounces-30225-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,gmail.com,bp.renesas.com,renesas.com];
	FREEMAIL_TO(0.00)[renesas.com,kernel.org,linaro.org,glider.be,gmail.com,nabladev.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,nabladev.com:email,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: D365D323FC9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Read USB2_ADPCTRL once in rcar_gen3_check_id() instead of issuing
multiple MMIO reads, and derive both IDDIG and VBUSVALID from the same
value.

Drop the redundant !! operator, as assigning a masked u32 value to a
bool already performs the required normalization. Simplify the logic by
comparing the ID and VBUS status directly, which is equivalent to the
previous conditional but easier to follow.

Reported-by: Pavel Machek <pavel@nabladev.com>
Closes: https://lore.kernel.org/all/acJVCOdlchLiSe5n@duo.ucw.cz/
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Rebased on top of latest next-20260324
- Combined variable declarations and assignments and dropped
  redundant !! operator
- Updated commit message
- Corrected the link for closes tag
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 79e820e2fe55..9a45d840efeb 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -314,13 +314,11 @@ static void rcar_gen3_init_from_a_peri_to_a_host(struct rcar_gen3_chan *ch)
 static bool rcar_gen3_check_id(struct rcar_gen3_chan *ch)
 {
 	if (ch->phy_data->vblvl_ctrl) {
-		bool vbus_valid;
-		bool device;
+		u32 val = readl(ch->base + USB2_ADPCTRL);
+		bool vbus_valid = val & USB2_ADPCTRL_VBUSVALID;
+		bool device = val & USB2_ADPCTRL_IDDIG;
 
-		device = !!(readl(ch->base + USB2_ADPCTRL) & USB2_ADPCTRL_IDDIG);
-		vbus_valid = !!(readl(ch->base + USB2_ADPCTRL) & USB2_ADPCTRL_VBUSVALID);
-
-		return vbus_valid ? device : !device;
+		return device == vbus_valid;
 	}
 
 	if (!ch->uses_otg_pins)
-- 
2.53.0


