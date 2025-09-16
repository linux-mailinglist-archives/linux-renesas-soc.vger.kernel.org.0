Return-Path: <linux-renesas-soc+bounces-21937-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA35B59B7D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 17:08:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B813E58124D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 15:04:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD0BF350D53;
	Tue, 16 Sep 2025 15:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ixts7/yQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8054734A33F
	for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Sep 2025 15:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758034987; cv=none; b=TF5Rw3MoJ6azF48TOO098UtPCyBWmjevqXjic6ycr11MpWRSFBGkOU0jBS6bFjpkz8tcvfeb9hM8X9ahlLkKpCTDWcXpxlDG8ZWrsmi8ZkWjOrIADwTvLHjgRzs+11E1hh1+wpWmiSHn1lyXXgAN+EQ9U7t/XA7Q7WO8rqEJ9II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758034987; c=relaxed/simple;
	bh=A/pVmo2VMMUD2z+HUZj4DpziB5TxDDr6gmH3385sgqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NCmuGLiZaxvP/NQdPSvX6znXLYFOH77exoOhoQ7A0U/7+hFhEftUFGe7BD1p24bJAENlQAD5I7fFxkGjymZ0erqiifMY44uSYcxt+TQTQGK88th821CihrRHBKZAyYV6yKV6mLChj3046RDzStYUqPVCmSlRpYPP07Tr+zG0HKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ixts7/yQ; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3ecbcc16948so522389f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Sep 2025 08:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758034982; x=1758639782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1/k7vhUf1voL8kqIJSX9PkvL+7B3TmZ2+++u1y1uP1Q=;
        b=Ixts7/yQY5gf8B9y9C6Zf6BHoYLLlWuB48hHKmNVehxpj7geI3FWHqvNJyz0A26UWY
         FbvXxvYsISIGLgIPexfICQ4NvzMJbo1Xa/j7ij76W4wDFKWWzhIowhNxiarVvfTT5Ml9
         GKh5pJgDIwFN8B7UFAI4u48lLApSKl76YQBkI+DuChCLTMkVWm1yOOR4AaCHYWnjBbXW
         WuPjyJ8DJyfrkBZDo/Si8yt8A570eQK1hjlBnXblDLEuyggkhCR7ajeltN6p9Pb6r1Xo
         zAN5NTaJX7VV/L2TQaIOE6SbsNy5Vth2MWzYhp69SfifXzv6W3cZ4cHxp3Za5fhHWGhw
         SeyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758034982; x=1758639782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1/k7vhUf1voL8kqIJSX9PkvL+7B3TmZ2+++u1y1uP1Q=;
        b=OOB1MWHy/ZSq/p935wZzi/ehmfM4lrQDhBgbMMjEmt5Lb3eBTTmQYPrwT3b01IsPw7
         5SHt10dlEGcHHKO8MjoH7sj+5qe1wVchhyj4awZXHz5QgzzcEKRTeRP8dBG8Wh5GzGgE
         sjmlTH4UXBumdV//32jA/5HrFP0lo/9+jV6XV66Z2cJz4nLDMLZ59/hW44LCqQffmOIK
         RrtlAENKXtq2oKW6NrDs9Oxbcck2HJ5hZubNB2kpcIxgbneVJSxLdL4QOt61ZXAIowbi
         2PiPkxHO3BYvU7rSY3/fg2fx9lY6IQGX4RcYx1ojhPUrzQuNO9qebHtsprVt/q1sdkih
         U3NA==
X-Forwarded-Encrypted: i=1; AJvYcCUSq8+fftl+HAZmSlehPY6TJW1GU8uT+TPn6cGfe5xWa/EH77DOGBYK3dTbT1uyqCtHtATR4cbGw9LYxd967MFEQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwuyXaiGj+uPPfO3L9J4MV5BqDOD/Nt97ooB5w0ZCTGxncVXQN
	ZOQfIXwjlMb1xwFWAQsa+xIkeBZfT9wHH9N1/ePZZ3mATsp7CUzjBq5U
X-Gm-Gg: ASbGnctjUTztp8cEb5xFhdMqP4SY4U/H1f9QMFAXRzqTdUFN59ajTVeXpm7FDQJwIQE
	QCW7B09T+0AyKYG7BEmAhMcekE9F7P7tKn0hWrnoMoKzJH+HM2sSh579V0lTFT2FdiNHiP/K2FU
	U/HUSofH8cJm6I8TRziaR2+nJA4LyR4VdWSK8IxKfXXt9dfj4Sblt0aIrBBXgUJGt/1T2kDI4hA
	H36IQxUXIdSVNAwUIkHUkHtZOoHcT2WNpb6oIWfvUBQEGjzYeqzHyBxYcp3olbpnfwZWSQmus4/
	3QD4TjpDAqV6Lj6+SxqiOT3FNboAcrZjyughzKMBrVDRg61Fm0j7rTj6Kpp5DYbUq98UyBmIJzX
	ke9wRlxMyhYHwgqYdeC9UcHptE5IHX0CGrCbmLKErHDEy5PIElghGtHkey2QQxwOAP5eNBMNTH8
	ANHg==
X-Google-Smtp-Source: AGHT+IGrfbQPvbjSEiLxQt7eaONhgRJwkDjXjoj1pqSn2g2OiHYXCnZlBuCibXYoLvrggR6sX6Hh/g==
X-Received: by 2002:a05:6000:2903:b0:3e0:152a:87b4 with SMTP id ffacd0b85a97d-3e7659db0ecmr14198255f8f.35.1758034982264;
        Tue, 16 Sep 2025 08:03:02 -0700 (PDT)
Received: from biju.lan (host86-139-30-37.range86-139.btcentralplus.com. [86.139.30.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ecdc2deb20sm932154f8f.47.2025.09.16.08.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 08:03:01 -0700 (PDT)
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
Subject: [PATCH v3 5/9] usb: host: xhci-plat: Add .post_resume_quirk for struct xhci_plat_priv
Date: Tue, 16 Sep 2025 16:02:41 +0100
Message-ID: <20250916150255.4231-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250916150255.4231-1-biju.das.jz@bp.renesas.com>
References: <20250916150255.4231-1-biju.das.jz@bp.renesas.com>
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
v2->v3:
 * No change.
v1->v2:
 * No change.
---
 drivers/usb/host/xhci-plat.c | 14 ++++++++++++++
 drivers/usb/host/xhci-plat.h |  1 +
 2 files changed, 15 insertions(+)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 3a56d8f94519..9e58431f486b 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -75,6 +75,16 @@ static int xhci_priv_resume_quirk(struct usb_hcd *hcd)
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
@@ -529,6 +539,10 @@ static int xhci_plat_resume_common(struct device *dev, bool power_lost)
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
index 2b32a93d2b76..00751d851831 100644
--- a/drivers/usb/host/xhci-plat.h
+++ b/drivers/usb/host/xhci-plat.h
@@ -21,6 +21,7 @@ struct xhci_plat_priv {
 	int (*init_quirk)(struct usb_hcd *);
 	int (*suspend_quirk)(struct usb_hcd *);
 	int (*resume_quirk)(struct usb_hcd *);
+	int (*post_resume_quirk)(struct usb_hcd *);
 };
 
 #define hcd_to_xhci_priv(h) ((struct xhci_plat_priv *)hcd_to_xhci(h)->priv)
-- 
2.43.0


