Return-Path: <linux-renesas-soc+bounces-18843-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 680E1AEB92F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 15:45:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85EA41715F2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 13:45:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43AFA1DDC04;
	Fri, 27 Jun 2025 13:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ekomk+CW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789C82D9EE9
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Jun 2025 13:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751031903; cv=none; b=g2H5OhJohYIaAkq4QaW6LphWn3+g3CXWvjX/VOX43r+QqLybf/PFuHuVTpIB+fGEXZzz34iPJ5nozjRId0+naRVJHxPB3abH1njgaznwMuSJ309iZUK3nTkFeI6HCP7pp+ESqSZShAHdEGQtZsPRFdWP8vK3wfi6bHRnRcV6f1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751031903; c=relaxed/simple;
	bh=8bG3o5gRZA5FwgazcAq8PDL3/TF2VFfzR2zlNp78oD4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aDvU0aXSvQZ9z4B65XBIClWgsWPl5UvBNYGzR5Poo82pjZvdLjCSPjdCOdzJZaXEo4XUwD/rN674zA7AENQXfgQNBcJLGBH2SnEREUEybkcU+ZUPnliMZLYkhPZwo951TuI5pCZou6zGdKvvhC/ziHuqY/59FiXw+nhGh2g0/4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ekomk+CW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751031900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sfCzCKZHgavpsXvy8TlJ0gEXh9QhrZFiByLFjuD7+iA=;
	b=ekomk+CWZ+TbrAyh/AXhQf6dkapNq1qaX0xJ60hUFR1UZDIippBij+gTt3mHhrd83Ep5og
	0oSTE07dp+o8baJ6P4xvfvtpYOA9MM0Q3JbLg3dj5x1ogciPVz6wfvjlomI6b92JM93syD
	EF9bl0bthGPPavIiomHxpAahOeQfY4g=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-XpLH2SHPNoGR1zkxzbuebw-1; Fri, 27 Jun 2025 09:44:59 -0400
X-MC-Unique: XpLH2SHPNoGR1zkxzbuebw-1
X-Mimecast-MFC-AGG-ID: XpLH2SHPNoGR1zkxzbuebw_1751031898
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-450d290d542so13842505e9.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Jun 2025 06:44:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751031898; x=1751636698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sfCzCKZHgavpsXvy8TlJ0gEXh9QhrZFiByLFjuD7+iA=;
        b=ONp+fNovvPlGetgF10EIlI0OCVUdf3rUBdOcrO6zJ8BJg259MlcOb3mOhCWw3R5kby
         N2Px7mIIDJZTBdWwFAwyBhUp8iQ1mbWakxeQGzJ+9QSa5exZFHnFsPthYOSq1N2lXQqw
         dUvkX1DwzeFH3EgWT/NoPCCUmyPt4kQHWHbRmtfBbNmMG06NNDh1AgtqGjSu9Ur3GVDM
         ib27TclWCE/9czSsX5CfVaIHWtAJGvdNVOxCjO3Lv4pDCl9vm9Mn6bCv9A8j/1G3xC8l
         falOXM7nQw05rya/PgjKhuczpJkzFwBY05leqM1jSbBt3SkAeuwgPi1+Q/OSslEy/n7D
         9d/A==
X-Forwarded-Encrypted: i=1; AJvYcCW7qoF43mtOfVB7UYOaogzdNGpyXjXb5h1onvbFZZiLfd1N5fvFhnOnow3aBN5OYEju8Q5I8KqH+U2Z4XsoXWORFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoZxqtfWhg451LRvb/eobI6KSyX0IHtmGsp+mjJ9NNmRzdLfmS
	Wm+nliTa5K0n7OWkNzt4SeP6NF3bFNq0V/rD7WYDZJxsk5GEJT5IgpsuSL4QRK41AVIEbtEGTg3
	tlkYDq4riEhGyRkz4LOiaitJE2eB3LSQ5uKbUGif0y7+JNGL8f6kyi6JDrjo7/q1QzrTRLDsm
X-Gm-Gg: ASbGncuLcdrUQ2rYyRUaKgC54S2yuNKIfIywW1p+C4kDfaOI2N5RKhiKPNchXO+VbLB
	xsSVZnmbhfIhP7qG+cjyNUpYr7ymGd5mnOEpDZ3OBqOGXmxhP0KllNr2HBCNx3+ESIHyeKcsrvv
	PCraR0ScR4uqWcS6Em97MFVXRQfeHOsu/gmNFY5KLCVMLkfUUHYYZIao43L68DKKTJRrTb5+hnv
	7/FDkImu3Ghmtp7uA1Mt/sdPtsD+YohpeXORu59eMFl8PhIIlVKAYwLwD44gOtYC50a3f6LWLF4
	7/cJT2E0d15tjtK2VQ+TzCO5TxBNL0BbhMSKDsl4sWJLt6lQlasVkYcgJ+S09MluAs7F
X-Received: by 2002:a05:600c:1e0d:b0:43c:e478:889 with SMTP id 5b1f17b1804b1-4538edeb1e3mr43906675e9.0.1751031897508;
        Fri, 27 Jun 2025 06:44:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5wO7lBzKmrbrRtSD3MlBN7myKwo/CLhGpeObS/nJo2QfYJbjf/v98tsfeefUPIC/qB8O98A==
X-Received: by 2002:a05:600c:1e0d:b0:43c:e478:889 with SMTP id 5b1f17b1804b1-4538edeb1e3mr43906355e9.0.1751031897103;
        Fri, 27 Jun 2025 06:44:57 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e01:ef00:b52:2ad9:f357:f709])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233bd14sm83028885e9.2.2025.06.27.06.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 06:44:56 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: adjust file entry after renaming rzv2h-gbeth dtb
Date: Fri, 27 Jun 2025 15:44:53 +0200
Message-ID: <20250627134453.51780-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit d53320aeef18 ("dt-bindings: net: Rename
renesas,r9a09g057-gbeth.yaml") renames the net devicetree binding
renesas,r9a09g057-gbeth.yaml to renesas,rzv2h-gbeth.yaml, but misses to
adjust the file entry in the RENESAS RZ/V2H(P) DWMAC GBETH GLUE LAYER
DRIVER section in MAINTAINERS.

Adjust the file entry after this file renaming.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d635369a4f6c..bff9651a9a94 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21271,7 +21271,7 @@ M:	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
 L:	netdev@vger.kernel.org
 L:	linux-renesas-soc@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/net/renesas,r9a09g057-gbeth.yaml
+F:	Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
 F:	drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
 
 RENESAS RZ/V2H(P) USB2PHY PORT RESET DRIVER
-- 
2.50.0


