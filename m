Return-Path: <linux-renesas-soc+bounces-21672-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BA3B504F4
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 20:09:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 745BF1C62585
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 18:09:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 069353680AC;
	Tue,  9 Sep 2025 18:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KbLV5SoD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171A5362079;
	Tue,  9 Sep 2025 18:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757441294; cv=none; b=RD8VJp7lFtrTnENLRwoDKaEgJmiOR07nZgM2JKHKbtqnvyVA4Msl50AlaquO+fW13+zCCUG7dyJfBX62RirymKkN7ySYXgD272a3xNEyN+xZFH8USOzzwUCxhsYCRX9S2TKu869z29c0ksYLjg6VL9LuFgwNcEBekW2X/lR03+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757441294; c=relaxed/simple;
	bh=fIGjHI8/W0+pwTR99Z4f0HsA0/FfU9KKbzeZnzaw/OI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RIxgLgxFmvfN91QDh6hX71V7RuUKxfuxVehw2pn5DfsJAYx1khOdUDUzCLTv3ILo5VyfAXWSbz+5z4aoF6A1JmFi0D5vIDF5wF2iApjc1XFKxyBSk5v2SPZ0qGESbWquFCySUyq/yJRL2lw0cFDLASA0XKDIC9KkmNAymRKHsqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KbLV5SoD; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45df09c7128so9099875e9.1;
        Tue, 09 Sep 2025 11:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757441291; x=1758046091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oWGGEEXO9doY3zWVkc5M+nFxD7+GBjX1YcKCbz6zeiw=;
        b=KbLV5SoDMJuHZh8oSJJ+SSigs89KbKerUeNPLZGGiu38gVuj/8JLk71HdAJdmFv6cz
         lxEXw2oAg2mFcZjB3ON7pgJ2Z28L+tIziz84LlQ6AkM1fx0f4H54Jv0/vRrC4YDWjjGo
         dxJJMM+JN1CnoAIwyxee+aDXJ1Neb855i8SRu3Xp+6Hr79mhMJMYos2cHQMN6v2ujjMf
         fnTadgQOFasD17jiVVQ8wYnM1Tn6rii4x9JFjU+CGO0eb0pIILnWk+/+ucvwHBC4LM6Q
         0bqwQJ+N1Rn/0EydVwlYAVr+008Ci6RLEl8PpWgQCFxzNxqtLr9SDDL3Om4mVlN17p0V
         lpfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757441291; x=1758046091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oWGGEEXO9doY3zWVkc5M+nFxD7+GBjX1YcKCbz6zeiw=;
        b=nt+1j6AaTivnm0U5r1QgFLROonDL9wGW1u/DlPHEuq+GTZ3y5I+/n9w7bCK+agtQ5V
         dOOfDEAgWVRMWxxYPUEYoviVTFcOh1rFj7o+VyevjiDkVOP113oLZDTZWgkRQnVCRVtW
         tSlD1jhssMZrqGNXNR8ngIiVAJfAgxsmONwYuEfY8LEwopvZdzf7WpUPl8C7ND8lyML4
         2Ybh26Ihmhh0zfOPtzAu9tZ8aefmFfKDQE8KZxSMNJF0w9rEy4HBqXboHzV5Dt3G+duE
         AtFJOScIbgdzjqd/4+ULLrnuKLt2YY7Pn1oXS4NmJJeGKqLQXlbPD9DjkieNfrnhiuhh
         0BVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJ3QqdJHnnncq1vDhRlwHPxhAgtAYPYX7ka+KnUyjZBA27DNShNyjzzwiQZ1cexX5+H0B3nq82ff1m@vger.kernel.org, AJvYcCUin3YG9KTbWq3CNt6QCWb9dDi7ez+m8ZWLUyIfys+Y32oH2dbamrB693mptnuxHT1bMT3VQzseW1eSLqs=@vger.kernel.org, AJvYcCXOGud6DCiizuCf29QMQ70qbIP15VQoba22KmsDLlrYHcVePxkUz4OGWDmwR4/46yBK190D+J30ADpljsqHCl5/Xbk=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg5YVUHekrIFiMfdSLPmKb1wukHZNF5zXMINQ9cFVtVZmrE2vo
	RvZmUxlnqE/Qq9/+COFH0OtSiEMYXXgSkZprOVuEKqfqHt/Ww+aROmRD
X-Gm-Gg: ASbGncsvOIXoO58JHb951rCD81rNknX6GmLSlSyQsTE59tHgAvAYdVhxEsU1lL5XQrn
	R5Y9BJiDtaoPN9qLterdlcoL0SpmwQupZIru2JT/0lvxMd94iM9cmIWjzgP4Wjwf6NvPeCGMj8L
	VxJz2HPAruJZmbv9gk/FGPqJ0c8TEzj1jgVad5A4UqbhYzQQZoHn+XhnBoLV3JpBoeJ0mb+0TP8
	I0YXob5TDvgMyXV0VWPUhncFwtbZhXV6fKnLY5TmZJRAjoMysHByRrvflFBQTyBT1SVRKh3YYVU
	31vJeMYHXE+3zF5Z3K/iOUdV35igBJ1TiqPloO6LlRk5c+cWKpZISyHrZZU90BbbvoCqsPhgQUR
	PPCM+lqqjETl8lMLlPannG/eWEtx/QhPoSB1V36fux/s6zZUN5eOvdg+ZAzQ84RMw1p6SraIuVC
	ubiQ==
X-Google-Smtp-Source: AGHT+IGSo2sHTcS5ZkP4rIEPzYEQa9nbruOE2ZEKcLlnA44k1BNEg1eIahC9y4kw9MSFb8hOYcVDLg==
X-Received: by 2002:a05:600c:5309:b0:45d:d86b:b386 with SMTP id 5b1f17b1804b1-45de73821damr76871915e9.14.1757441291002;
        Tue, 09 Sep 2025 11:08:11 -0700 (PDT)
Received: from biju.lan (host86-139-30-37.range86-139.btcentralplus.com. [86.139.30.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df679a4c9sm4174015e9.3.2025.09.09.11.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 11:08:10 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 07/11] usb: host: xhci-plat: Add .post_resume_quirk for struct xhci_plat_priv
Date: Tue,  9 Sep 2025 19:07:52 +0100
Message-ID: <20250909180803.140939-8-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250909180803.140939-1-biju.das.jz@bp.renesas.com>
References: <20250909180803.140939-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Some SoCs (eg Renesas RZ/G3E SoC) have special sequence after
xhci_resume, add .post_resume_quick for it.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change.
---
 drivers/usb/host/xhci-plat.c | 14 ++++++++++++++
 drivers/usb/host/xhci-plat.h |  1 +
 2 files changed, 15 insertions(+)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 5eb51797de32..7191a63dec2a 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -74,6 +74,16 @@ static int xhci_priv_resume_quirk(struct usb_hcd *hcd)
 	return priv->resume_quirk(hcd);
 }
 
+static int xhci_priv_post_resume_quirk(struct usb_hcd *hcd)
+{
+	struct xhci_plat_priv *priv = hcd_to_xhci_priv(hcd);
+
+	if (!priv->post_resume_quirk)
+		return 0;
+
+	return priv->post_resume_quirk(hcd);
+}
+
 static void xhci_plat_quirks(struct device *dev, struct xhci_hcd *xhci)
 {
 	struct xhci_plat_priv *priv = xhci_to_priv(xhci);
@@ -509,6 +519,10 @@ static int xhci_plat_resume_common(struct device *dev, bool power_lost)
 	if (ret)
 		goto disable_clks;
 
+	ret = xhci_priv_post_resume_quirk(hcd);
+	if (ret)
+		goto disable_clks;
+
 	pm_runtime_disable(dev);
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
diff --git a/drivers/usb/host/xhci-plat.h b/drivers/usb/host/xhci-plat.h
index fe4f95e690fa..4c2a89bd83a1 100644
--- a/drivers/usb/host/xhci-plat.h
+++ b/drivers/usb/host/xhci-plat.h
@@ -20,6 +20,7 @@ struct xhci_plat_priv {
 	int (*init_quirk)(struct usb_hcd *);
 	int (*suspend_quirk)(struct usb_hcd *);
 	int (*resume_quirk)(struct usb_hcd *);
+	int (*post_resume_quirk)(struct usb_hcd *);
 };
 
 #define hcd_to_xhci_priv(h) ((struct xhci_plat_priv *)hcd_to_xhci(h)->priv)
-- 
2.43.0


