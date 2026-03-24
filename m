Return-Path: <linux-renesas-soc+bounces-30167-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJdREliBwmlneQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30167-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 13:19:36 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CE13080EC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 13:19:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 24948306A036
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 12:16:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ADFC1E515;
	Tue, 24 Mar 2026 12:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kSMGyQkx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F1B381AE0
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Mar 2026 12:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774354577; cv=none; b=Hsiramd/xNatK0aSv2Br9iZ1MoxAOtnvFhQzJIZ3F2l4iJc5V/mvn1XaIoBcJ2oLi/+FMAbAIJjvr6O5delvHY8ElOWrCosYMWYiiASTuXMIdNrU63QavamcF5HeRXZrI52LjOBozd5TB18rS+yW6xtH2+Ua9fy+CiQYcY+T5rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774354577; c=relaxed/simple;
	bh=hEfF5W4oxX/fqDeA9TTMSfWjXJiIH2rMu+fLN7mIz5U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Cq8A2lQTjgLuE1+/hUv6qFez9Sc559gvBg71aGoeXGVgZ3dzNWNpaVjRIR+ehkgvM8PasG6dJiXNHZ1Ryc0LddfwTMC5bhSMqT/zjekNoIhuZbnuWnJ9sRjnAoYzg5mV4sWMSmnC/8RLQC/x4e3sfLGUUVsLkUk8p4/AqJWdohM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kSMGyQkx; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-486fd5360d4so13521015e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Mar 2026 05:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774354574; x=1774959374; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4cOxEkIZIj6Xg1xsxLA1DjkGW5e6LCK9Hqybd5NbOHw=;
        b=kSMGyQkxczvfdR8ax1E1WJWF4YEMk6Z6uqpvzwSFlWsbu30Mwzgg0ycv/+/fFbbUv+
         8qlx2ya5xktzCX9rROIawx8L0EpDsvsyGjilrxhHvqtUrWSMpvc62OFA6hXUhy1WIdap
         Ib3uc4Wn9I/q9F60jNiE+jsghcx+yu3yZHeNG96nxR+e1x6213SR78URAtfoeXewbpUy
         YdGq/Q09aEXSCtRi0T1+hrO0kPGizR2wuN+qfG2RHbWNpIweCNqLiXxcE1wgijhwb4aM
         f2LoYl6OmAVOfN/HUpCKs3jmy6mdbpWkSEOeidiipuNavlsxrLX7CtV0UHL6+GlBUVLk
         N/GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774354574; x=1774959374;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4cOxEkIZIj6Xg1xsxLA1DjkGW5e6LCK9Hqybd5NbOHw=;
        b=IV+zrd90y9EXXv9xa/bXOJGqdu6tgfnJ6maNMfpRMu440Vbtz8gEl6ZNC+GO+S0wpa
         XFZZk1v2dz5JhVaKh3JZ1oHKgOiCNaZg03lhY3paQYx2qMAqLr1z8nBvVn1SbqL5TDqW
         8Dzph+f4+qbpDnon/onQUYP0KDZFXUe+5puYia8//TLptv45i5WRxawdzqYmgqPc6ejv
         dMETz+HLyLOFfXmzJpqiel8KBLgnfJPkgSchMvMXG3JA9VMoa441Cb7icSFxeRuoEMge
         SU0wrZnYI0YcAooM4sRV9NPapPJeM6hjpmnX+gmtZQULJOn0V5/QuXGiy+jtyjsjkAB7
         y3YA==
X-Gm-Message-State: AOJu0Yxyiye1FVm1L86KXDY1I4WMwTYRS7UI67bcpbA1/8p9o2I3A5P8
	8wWRD0MUhlv7YhCMjjXx9dlIEbh6qxu7S7y8lBUChtPHaOoWUu0shOKH
X-Gm-Gg: ATEYQzy6w9x3U3qn2my4XlZTlbg6hyQdi8zPVOSWHeq8K+xDvVVTWYSIzx42vRMBV1O
	OKw6VyzuXiBLjTqGiguBbTkr80NXKkPaIDu4QRPDYl3EwWtdKZUno9LcrDsofSNosKQuGrlzor3
	/+MI8PO62HfKu0zVDo7wzqb1pSbRjXFFvG6m+vAlqDTDvcaAGFNw9hfaJofG8HGzAgYMewIcG4J
	Mth0apMUTwfTp0IyA4oRvp8XKCv3lKbv1alVkMuukCRknHr8gBJwUlKUnSzdbAS1JB5PoArrwa+
	I549tkF/LIe5tDyp8kkQvCQqaTtK6pI0JOlqF934SCI2452qdwIkB/36qoeN1DtyCnEI7IZOasK
	nWTFWFYa2pND36MOOZH1t1RknfOA93Eo0Ej9Ev3ISbNbGpG41FtSzRjzQLSEX2yrkIYfh+JCIiv
	TYInIj0Acj9zSjmLagjqLcpMLlJSlFifRJr9qb9O9dUpWWspm5gT8tYLshZ4AbbUrgpIxMQ/vG9
	5qjewNu3Mxbt94n+5njEXe1BDe4H/T4NgiTdg==
X-Received: by 2002:a05:600c:608c:b0:487:1114:d42f with SMTP id 5b1f17b1804b1-4871114d526mr30660865e9.1.1774354574154;
        Tue, 24 Mar 2026 05:16:14 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:439a:df4c:8bc2:631b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487110b5589sm17744405e9.26.2026.03.24.05.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 05:16:13 -0700 (PDT)
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
Subject: [PATCH] phy: renesas: rcar-gen3-usb2: Simplify ID/VBUS detection logic
Date: Tue, 24 Mar 2026 12:16:08 +0000
Message-ID: <20260324121608.3444943-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30167-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.renesas.com:mid,renesas.com:email,nabladev.com:email]
X-Rspamd-Queue-Id: B8CE13080EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Read the USB2_ADPCTRL register once in rcar_gen3_check_id() and reuse
the value instead of performing multiple MMIO reads.

Simplify the return logic by comparing the IDDIG and VBUSVALID bits
directly. This preserves the existing behaviour while improving code
clarity and avoiding redundant register accesses.

Reported-by: Pavel Machek <pavel@nabladev.com>
Closes: https://lore.kernel.org/all/acJV-Xq-2uq_JFMn@duo.ucw.cz/
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
Note, patch applies on top of next-20260323.
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 79e820e2fe55..74d7561dbf79 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -314,13 +314,14 @@ static void rcar_gen3_init_from_a_peri_to_a_host(struct rcar_gen3_chan *ch)
 static bool rcar_gen3_check_id(struct rcar_gen3_chan *ch)
 {
 	if (ch->phy_data->vblvl_ctrl) {
+		u32 val = readl(ch->base + USB2_ADPCTRL);
 		bool vbus_valid;
 		bool device;
 
-		device = !!(readl(ch->base + USB2_ADPCTRL) & USB2_ADPCTRL_IDDIG);
-		vbus_valid = !!(readl(ch->base + USB2_ADPCTRL) & USB2_ADPCTRL_VBUSVALID);
+		device = !!(val & USB2_ADPCTRL_IDDIG);
+		vbus_valid = !!(val & USB2_ADPCTRL_VBUSVALID);
 
-		return vbus_valid ? device : !device;
+		return device == vbus_valid;
 	}
 
 	if (!ch->uses_otg_pins)
-- 
2.53.0


