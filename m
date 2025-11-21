Return-Path: <linux-renesas-soc+bounces-24938-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDDEC78DA4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 12:39:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id AB5672425B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 11:38:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1461B34EEF6;
	Fri, 21 Nov 2025 11:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TBh9lvWP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32F034DB4A
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 11:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763724978; cv=none; b=OlO7gRECSySvU2BvpddR443Czli1vHV0F+VGH+4TIdG6GtqPzVODG97C235xBatJjLGdi5lpraSY/onni+u46eizSnOuqjU60xDYk2ZtoXaPqBrbeqz49DtWCeFFNhBTzkdRnjuVlmCYEvMlRj6uNXYcQMRoiOy122HpXH/r7X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763724978; c=relaxed/simple;
	bh=iV5547O2Jkc5KxmhzNymYPOd0IDQwWkKNkuGqo67YKM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tzyyI6JhPu/giOJM9SgtdlbTZqBDkgLKvrQaHtJvhAMiKQK0bGoTuctKNG993y+0BiSfPK/H0bbLqAfLzIFJf0qHl1h4zyBd8tzA4x3NpYAzQRJ/4JqPVXdW/fvdgfrqUtohcYHoqtArczzcUoSMz7aW6M7NVg+JK/a+jM8ibZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TBh9lvWP; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47798ded6fcso11922885e9.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 03:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763724974; x=1764329774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BL9yVtMaskxLuPDjF5CARhK40Dj9w0uig2rqjbmy1/w=;
        b=TBh9lvWPl5qCRjt4wm/sUSifj8jSsSY1iO707TIGFAs9gDc2y+HpmHNNrmd6jYIHOr
         DC8ZS57NmuPuKvYD5fIIbeGqWAxCKKULLafZzgY5hbovc6JTn6QUQtv1qf8gb4dkUXSD
         WEpmw9K4IvmbmBgwI6BKwvaN7xKhfIOkUPILxevhFFPUXWbirFVjVn55cB9Da0qqqLHU
         2JKY5NrEoPH8vMMC0EhpNWoiSdss0tER2t8zcsWNDGl8EW7ZR9rak3lZiH/oxghN+kGI
         nNhrZeffgVjAjnngBs/AIOhpCqaQQIv5DiCw8wEvz0a3KhWHlmFoI759n3yvq3m8YmQ/
         XsJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763724974; x=1764329774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BL9yVtMaskxLuPDjF5CARhK40Dj9w0uig2rqjbmy1/w=;
        b=rH1+HApHefH4k7iXpGt31VsYznAQSXgzVnOhC0PZqqsVR+Pn9i9PIYU5RoHWPjuDTs
         gYiWqN1m1OiYOIegEd1ZksGilOaddOzAGY6xC6s/fobbrxDOkVbredZ0kUvJSfBWFVdF
         zKvTE5Ae8qhJ90SrfeabZD5OLIBYbVLflQgcHluY7nA2uOVcQ6WJpGOKarEEenQOoBPj
         BwfXZ8l6nTzTQE8yFYLPNsMkzwkPJDoX4yMRuWheZ18ZaGSWOrCYdM1gNXnRUCwVhOzI
         pH1kzHHz1hKm6Hr8B1wSxBOfQM65ZHHll0qo7WiRQg7EJowCdDuZYMt/tpMfIZ3DiRgD
         rfVw==
X-Gm-Message-State: AOJu0YyVG0agfrQP02jyTSAAJLiZxBZvqmJVK9OqBwy68CEuw+VcSwmT
	THgn7RKxsSb2PuOFPHCbYTOsddF+wtkfVhujHt1bEtVSAzr0OxSdNX3B
X-Gm-Gg: ASbGnctYKIImv8TuDf5Pz5mI+xBaHj4IVshA+qB3CyJhcrou9oGekexzdv3yJ2cFo5f
	NqHTrTKJ+Gg78jHuUeU/oCkgPgHtKG2Nf+CHOxTAgTVM23o/+oAT4B+XfPooGpEZlVSuxeox3zb
	Da2LYQpesg5GmPj3ry19TajapnsVi+uGXVkzcb5t5zBu90lnLTc22oUvai7SIt8qOshODRA+kPx
	HGmtHRs57PUNpiWpi6P+T88ZV/2UCKH/FMGUByeWpLETi+Q+cuBdf3ZtICQuqrKc1JAuvhj90gu
	gVyeIKD5H29gE521p1sbYLHdaX1PF10DR8sHZROg72D70SjXWFEj4/68YGFtJ5jrrkWNi0WiTnr
	yaeZ3/bJiDnno0JdSwMIpL8pgyCxRGZk4Pqu5W5r8yaPL7nLPGDn+gCxolg0cDldBCEkqdYZ7TS
	QtVwVZY6CTNnqjMtnJbPuvJFuuYUN1Lr84S3E=
X-Google-Smtp-Source: AGHT+IH36k8lUJuOn97e5nXbz9w9MMFZJjRypq3XClPag4vI3s41hFu6V390MCHf+PjbZXWUpQ6F2A==
X-Received: by 2002:a05:600c:4f82:b0:477:952d:fc11 with SMTP id 5b1f17b1804b1-477c11175a9mr22999955e9.16.1763724973805;
        Fri, 21 Nov 2025 03:36:13 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:9cce:8ab9:bc72:76cd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477bf3558d5sm38732465e9.1.2025.11.21.03.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 03:36:13 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next 09/11] net: dsa: rzn1-a5psw: Add support for management port frame length adjustment
Date: Fri, 21 Nov 2025 11:35:35 +0000
Message-ID: <20251121113553.2955854-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251121113553.2955854-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251121113553.2955854-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Extend the RZN1 A5PSW driver to support SoC-specific adjustments to the
management (CPU) port frame length. Some SoCs, such as the RZ/T2H and
RZ/N2H, require additional headroom on the management port to account
for a special management tag added to frames. Without this adjustment,
frames may be incorrectly detected as oversized and subsequently
discarded.

Introduce a new field, `management_port_frame_len_adj`, in
`struct a5psw_of_data` to represent this adjustment, and apply it in
`a5psw_port_change_mtu()` when configuring the frame length for the
CPU port.

This change prepares the driver for use on RZ/T2H and RZ/N2H SoCs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/net/dsa/rzn1_a5psw.c | 4 ++++
 drivers/net/dsa/rzn1_a5psw.h | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index dc42a409eaef..82f4236a726e 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -211,6 +211,10 @@ static int a5psw_port_change_mtu(struct dsa_switch *ds, int port, int new_mtu)
 	struct a5psw *a5psw = ds->priv;
 
 	new_mtu += ETH_HLEN + A5PSW_EXTRA_MTU_LEN + ETH_FCS_LEN;
+
+	if (dsa_is_cpu_port(ds, port))
+		new_mtu += a5psw->of_data->management_port_frame_len_adj;
+
 	a5psw_reg_writel(a5psw, A5PSW_FRM_LENGTH(port), new_mtu);
 
 	return 0;
diff --git a/drivers/net/dsa/rzn1_a5psw.h b/drivers/net/dsa/rzn1_a5psw.h
index 0fef32451e4f..41c910d534cf 100644
--- a/drivers/net/dsa/rzn1_a5psw.h
+++ b/drivers/net/dsa/rzn1_a5psw.h
@@ -235,11 +235,15 @@ union lk_data {
  * @nports: Number of ports in the switch
  * @cpu_port: CPU port number
  * @tag_proto: DSA tag protocol used by the switch
+ * @management_port_frame_len_adj: Adjustment to apply to management
+ *   port frame length to account for accepting a frame with special
+ *   management tag.
  */
 struct a5psw_of_data {
 	unsigned int nports;
 	unsigned int cpu_port;
 	enum dsa_tag_protocol tag_proto;
+	unsigned int management_port_frame_len_adj;
 };
 
 /**
-- 
2.52.0


