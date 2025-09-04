Return-Path: <linux-renesas-soc+bounces-21324-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98EC1B43A68
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 13:42:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3008A3AB29D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 11:42:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AA5D2D9EE7;
	Thu,  4 Sep 2025 11:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KgKpZ15A"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99AF23D294;
	Thu,  4 Sep 2025 11:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756986134; cv=none; b=QzpzhbnqqekWTtW2o9bhfydg0Ah2wXMba3cV10pEltcAWLOclmvUYJrtbyCdloW3B7F5JEU0A1p1RqQ1P72FVTtiSRSmwceyhY2H4WXd+6kPiWNzb23h/HUJFMt1+Fq04PZffpHNru6S2/OXIs4pRkAHiBQKsEcQEdVkhOUT25w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756986134; c=relaxed/simple;
	bh=1MUqA7hWALrWJNVcTA6jdG1k9mrLG7nXYhtixAi+iVg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kN0hIRxIDI92wbSF9FGfjtPbcU5aN0yxf5kwQZG3hkBtWDOdFJcjOa14XsLetRtkmprDt3pDlNlFJOTv6Ip3ZwXlG3uNAl2P32+X60Aq/jK7NRMmPJbSIhHVVedDTfZRNIYMK7uY+cif4ZjJZMdyaTnSZ9z/xUkPC65VXUt18pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KgKpZ15A; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45b7722ea37so4457525e9.1;
        Thu, 04 Sep 2025 04:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756986130; x=1757590930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sPQgRFguyILbH6DCvIqQ/VuOI0P06SUVH9Lw+Z0uxLs=;
        b=KgKpZ15AL7uRvT2X8hVmAjluuBIGzYe9qwz9vJ+pMOeAU5v1urQ6kJkSWikIvdXeid
         /CcLjPhJ4FgbPkCVAu0Ils/EgxGssIErdVdRZjxpIcv8yVTj1LIZlD4LuDxwlzXgGb1y
         0QbYqjU4VtFAMTPUnipNdjhqnaZWJgB0t2am5fVRzYwKX0cvWwOlQ2O5/3kPqFEKznys
         ycWs4MhPULlhSdRyDqmixe6cVRHe88DA4xI+c91lXiL4iqPTz1jvQLWOfMfrHIt4z/o0
         LE9f6l2SPnrKiAiBGZxqGeVXnZIoYky6m5a1szV8kWsHQR1cz9ZnUbLtmpfllQEZ3Boa
         WUfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756986130; x=1757590930;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sPQgRFguyILbH6DCvIqQ/VuOI0P06SUVH9Lw+Z0uxLs=;
        b=FqFyfXyTXKIj2qDxklKYaNqJmHSZQ3hUJlgRsezk60+yxH467QzX7oNKYhzsXmaPE5
         6AqiNSbt7KKfIj1ZT+cyuPmIxjMShEbLdueuwXLTD0kHqIhFbuxn8O3RZgOLtzs591RX
         /M3oKMXuElKNDP15I3+BCI4H9l3fCA6avlF6xmX7lk84bm4o9w/OCopfcKQTMR4vxs7Y
         i1/ia/LAQudNV5fYqzRoo+3auX8N7vqjJ1W5+wkTwI38XV1sPFvCBVZNeCoMr0rS+7kZ
         +jKyWiHOQKFm3AD6m/gJahNaY5t1MSR9xxNOoAMsDyEJMIJdMZpMNKnja6ZvQfbct6lJ
         lJvA==
X-Forwarded-Encrypted: i=1; AJvYcCWbZ30zcXJSnAaePxR8Nlxk78Zn04uv5n6x8VvNwr9BTU3QoWnIb9PHLJNhDpC30c5RxhPNDnk+@vger.kernel.org, AJvYcCXYzntfFvR8JNTv3SblHDWRW72wuyxfxpIqvr21lP00VL/M+BuLD/ERUfKdDXKU+xrItTdnJbdQT8Go@vger.kernel.org, AJvYcCXxDLf0Ng81laOlBFpg6gdHxcFjxKYV81Hy287kxaN6nx3NTobj69CeY+j0v4EelFjXuhp9mDCIU9hp3no7@vger.kernel.org
X-Gm-Message-State: AOJu0YxeA8WcT637IKBU5ww5ejYvfbbSMBCSGdUdfQaXt41r1lW64EWL
	010Gg5be6Su/1zjm+RaHQoYt9w/4iBbMAa4NGTUqXYpK9ilcQf0HmOQy
X-Gm-Gg: ASbGncsuM4PHieRwfcmBPnM4bk8fM42t92b67OTaqcgyVr3uNf+E2T3Muer/KghIN7n
	7/YvrzRPNrvBFKrHxijkt8vFKyULOnlQctBIe4GnWqAad4TEfbNQEwX/RZSrxgugq8EcJeZyUwF
	aCvB7SWG6hHx9XiGohdjIEkzijrod51qMk+2RQ1QdLiWSKVOtf8dq/smgf3Hhb/ifsSI4xAqXiq
	SeyxOGSBQwzXNXDAQsXztcXCbShnMO9cSLn6PZFYjN8NE6PtOAx5KJp9S2U1gDXsdHnnoz19r0k
	YEyaDlSyVRN9VfQOLOGiPJVlq9k8BwLK2DKhiPzpcDiC1JA96T4rnb1gLSfOekxZ1uizDCX53k5
	NkyWYNVvmCQvGUMqp4RQcUeJDxe3SFIrED6GfPTbqiT9z4ohykIlyXeuzoA==
X-Google-Smtp-Source: AGHT+IGvDvWRKXMto2g65HIePrJwmZ1mupZ7K7vtP2N0YCH2Sp8yq+tBWJIK/R56Ce85t/h8dl0F8A==
X-Received: by 2002:a05:600c:3512:b0:45d:5c71:769d with SMTP id 5b1f17b1804b1-45d5c717859mr35683525e9.8.1756986129847;
        Thu, 04 Sep 2025 04:42:09 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:904e:70c8:edf3:59a4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dd0aec70dsm14658475e9.0.2025.09.04.04.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 04:42:09 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v2 0/9] Add PCS support for Renesas RZ/{T2H,N2H} SoCs
Date: Thu,  4 Sep 2025 12:41:54 +0100
Message-ID: <20250904114204.4148520-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This series aims to add PCS support for the Renesas RZ/T2H and RZ/N2H SoCs
These SoCs include a MII converter (MIIC) that converts MII to RMII/RGMII
or can be set in pass-through mode for MII similar to the RZ/N1 SoC. The
MIIC is used in conjunction with the Ethernet switch (ETHSW) available on
these SoCs.

v1->v2:
- Dropped regx in title and description in patch 1/9.
- As done for other IPs used T2H compatible as a fallback for N2H.
- Renamed pcs-rzt2h-miic.h -> renesas,r9a09g077-pcs-miic.h
- Added matrix table in the new header file.
- Corrected the resets check for RZ/N1.
- Updated the commit message in patch 1/9.
- Dropped regx in config description in patch 9/9.
- Dropped patch "net: pcs: rzn1-miic: Add PCS validate callback
  for RZ/T2H MIIC" is this already taken care in commit 508df2de7b3e
  as pointed by Russell King.

Cheers,
Prabhakar

Lad Prabhakar (9):
  dt-bindings: net: pcs: renesas,rzn1-miic: Add RZ/T2H and RZ/N2H
    support
  net: pcs: rzn1-miic: Drop trailing comma from of_device_id table
  net: pcs: rzn1-miic: Add missing include files
  net: pcs: rzn1-miic: Move configuration data to SoC-specific struct
  net: pcs: rzn1-miic: move port range handling into SoC data
  net: pcs: rzn1-miic: Make switch mode mask SoC-specific
  net: pcs: rzn1-miic: Add support to handle resets
  net: pcs: rzn1-miic: Add per-SoC control for MIIC register unlock/lock
  net: pcs: rzn1-miic: Add RZ/T2H MIIC support

 .../bindings/net/pcs/renesas,rzn1-miic.yaml   | 177 ++++++++---
 drivers/net/pcs/Kconfig                       |  11 +-
 drivers/net/pcs/pcs-rzn1-miic.c               | 296 +++++++++++++++---
 .../net/renesas,r9a09g077-pcs-miic.h          |  36 +++
 4 files changed, 419 insertions(+), 101 deletions(-)
 create mode 100644 include/dt-bindings/net/renesas,r9a09g077-pcs-miic.h

-- 
2.51.0


