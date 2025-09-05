Return-Path: <linux-renesas-soc+bounces-21488-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2214DB45AAE
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 16:37:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 563D6B61CF7
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 14:33:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72AE43705B8;
	Fri,  5 Sep 2025 14:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hcESRKBR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBF02D77E6;
	Fri,  5 Sep 2025 14:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757082888; cv=none; b=LvJGR9KCKe+OMbDs7zG5yPToAW+recdpl6Gzpbiwkx6+gTbkYwGUDGo0/9U1nnHWcDY3+uo8KYcllcP0FkHb1At43+J7QeWsjzWsQlrJs9xEGDt/HlRFB0cHhqnl+Xw42mKAmSIvsP5ggozxU/8XIdRwDNtRLItyqTQ3Lf2WZeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757082888; c=relaxed/simple;
	bh=An5OeLhhktgvzZSR/tjElJ0ESuFfsrsCFiF1iASjjyA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=knwB9w5du1qQ7DOSM2wn1zOfgQ/R6h4fQBctgDP+2EE+ikmE4DWahxIIiYKqn61iuWxm37f+pscDpnxU/281Gu1DUG/lUUhC0gqZuAXc9trzgr5yB6telfdBHhTKyr81BRTLP/Qyx3aS0/Soc7N0A4tCCHS9jEU0JGcYDQGNNik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hcESRKBR; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45b804ed966so9525655e9.2;
        Fri, 05 Sep 2025 07:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757082885; x=1757687685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1/swEdJd1Td5Geu1KnF2rcQJUWdhHiYAaX5DDanlgkU=;
        b=hcESRKBRiy0dqH+iOrBfnx61wg+KJU1qdBtD++Wi6Rz3N4AbsVf9FxL23A0b1JKsNe
         6MJIYEkUQ57Fc41W9r0OS2lEwbZk+vCbw7SgzzGjx6tug0YGUWtGts3EkX+R37HbY5+B
         Eo2aDspZYg8Sxm0t0RvmWiKTBqndS7jHM+UitmJOaBi2STEaXCBnUcoQorbRo/iKcrPN
         yzuQkKGliIUS2Qw1ww+mqblPWreBrQ0fKqUfA/zHQi6m3LWYXF4w/23ec1/JcHoa6EQs
         MFoZ/VGYlr5N4/NbR6KUNhMHTd5sOW+UokBMiIXs3bCwO/Xd5SDibySzpVQ41i2m8euu
         qeRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757082885; x=1757687685;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1/swEdJd1Td5Geu1KnF2rcQJUWdhHiYAaX5DDanlgkU=;
        b=lNRTdkgUc33m1ba2nAgfm16YCorqGi3WSR+8vWyBm3PXnpeWVy6IsNWsjSz1kHIJeO
         +aWIik41oqgPZzuCmRjxG20V1/d24tv4BDbEqTd4l502+GNqSBY26MJCxImJkKDHAOaT
         aVIDILnF9Dxmi73lPxzlkpPzuMWihh2C3ob/FZEljtgr0KpQWA+qYAzCZX+PVKSaaxfQ
         RneRdjbpcLmU2m3eFprKGhZnePxFCo2JrXlOws6Qh6Pdjmp0bFkNGBQaD0pyFkQZD+IV
         kg2dBy2/2P2mMROJxIOio0uiIGjpla11Kuax8Xo19xjGz4mpQTXUcR8RWLckpsbDizrl
         uUyg==
X-Forwarded-Encrypted: i=1; AJvYcCU5HrH4iqFvjd30QqPOKtkeAx2huW4E4cZsGCip1RExpahXfzgUOgAZ+KeukHZy2H9Jrehqyoj37zHkRj2TwLP0HIs=@vger.kernel.org, AJvYcCVfj4yb1b6t8bo8I9FTV16ltC07gQrIpWcoWyjdnkkDd9A2wfUZFrV8Qbd9e+FCYKGhSneJ2UCPrPgjh6U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWJDeJSmyId0LeQPcEvrzcWwPz/FYg6F+eWCh9aES9cVdX0aR9
	rMFHRadJayHT/F5bjfALEOTyo2O5edEl0waHB+whxjunRXKaqn5C3Ido
X-Gm-Gg: ASbGncuUl+JenLdb5SJCKjNHu9c6YlhWDHWsWpgIRCrIuV33/to8tPiT4nch92ZQqqU
	m4owvkLsph9lgv+zYXDdHYABbAewpGkOiN4u2IGVn89Yd8W5690Lv2a7N0Sibm0u8JWSDrg4nMV
	Sb88mNCLm9FI6z/MjEmD6GJejDF5Cu1ofJtlbJj/tn0b3yqF5g1DfXRKpHCVMz4yRTsCHAqeRlH
	ihMJAoSrGr07YIi478ryhJ4uGTmK9j18UE6WIZTbjFm8hRr6TL1AFOXDr3fc4Iy/5aj3deCVoGc
	v0eCBCnDXgPVGArkO608r20koMLLR4js+KpG1Kkd1zg3PnuIv1h7rRSO6gDRmL846tZ3uuqJ1dn
	xkl3/PlPlCsxZxEKn3OoJpp1ll5uF0yXGlSIxNu+/R+LPx00EGhJcGckmULMA2JgT1yBG76Llt3
	AXyg==
X-Google-Smtp-Source: AGHT+IG+J6hq5ma4/laDmyWTiAnHplDrbt1185O+2JmrbNZtNtlGgTZRZIVJnlXYwEVxq7AHjEQhyA==
X-Received: by 2002:a05:600c:1394:b0:45a:236a:23ba with SMTP id 5b1f17b1804b1-45b85575801mr182513835e9.22.1757082884841;
        Fri, 05 Sep 2025 07:34:44 -0700 (PDT)
Received: from biju.lan (host86-139-30-37.range86-139.btcentralplus.com. [86.139.30.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dd6891d23sm35355095e9.4.2025.09.05.07.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 07:34:44 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Brian Masney <bmasney@redhat.com>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH] MAINTAINERS: Add entries for Renesas Versaclock {3,7} clock drivers
Date: Fri,  5 Sep 2025 15:34:38 +0100
Message-ID: <20250905143441.7082-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add entries for Renesas versaclock 3 clock driver. While at it
add myself as maintainer for versaclock 7 clock driver as Alex's
email address bounces.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 MAINTAINERS | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index b13848dade9e..7a7478305bf1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21704,10 +21704,12 @@ L:	linux-renesas-soc@vger.kernel.org
 S:	Maintained
 F:	drivers/phy/renesas/phy-rcar-gen3-usb*.c
 
-RENESAS VERSACLOCK 7 CLOCK DRIVER
-M:	Alex Helms <alexander.helms.jy@renesas.com>
+RENESAS VERSACLOCK 3 and VERSACLOCK 7 CLOCK DRIVER
+M:	Biju Das <biju.das.jz@bp.renesas.com>
 S:	Maintained
+F:	Documentation/devicetree/bindings/clock/renesas,5p35023.yaml
 F:	Documentation/devicetree/bindings/clock/renesas,versaclock7.yaml
+F:	drivers/clk/clk-versaclock3.c
 F:	drivers/clk/clk-versaclock7.c
 
 RENESAS X9250 DIGITAL POTENTIOMETERS DRIVER
-- 
2.43.0


