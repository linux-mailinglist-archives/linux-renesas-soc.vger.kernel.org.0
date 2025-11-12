Return-Path: <linux-renesas-soc+bounces-24517-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AB871C546C1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Nov 2025 21:23:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0B4E84E1839
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Nov 2025 20:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D90F2C0F7B;
	Wed, 12 Nov 2025 20:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XYFvh+/o"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38182BE05E
	for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Nov 2025 20:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762978799; cv=none; b=rK/avkbJ9cpQD5b8kZxudd49v3U1pOeuN55dFrL6yy4XFBJQapaCnRn4oQx9TpXHcD1LQ76yuAetQC2QN6aYy7GgW26qVa/ftUYex6osfAtAFt8UuC6AoLnmb/mcKHT3/SHa0zgtMV3uhx7TDgtNa1O1cUgfKKTrGQ2Or4F65VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762978799; c=relaxed/simple;
	bh=mXLUdMaeNsOsocpfIsU47VhtEmPcnzDzuj2QI3HCoVg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Kytpuz8r0DkaY1Aq038rvkEuvC2qWE/rXpHAX5xNQp8vTbrVZdD+wi0OdCMcuw9RZNTyOSO0JOn6CCVZ5K6xRdWPhdpWi3Oa6DszgvISFGHsJT762Qa4dXpMLBQTwTcqlnyDaqJGgjOwU0sygFuYLMPfKFTihHhxy09NEklk4Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XYFvh+/o; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-bc1f6dfeb3dso35244a12.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Nov 2025 12:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762978797; x=1763583597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5Ix38lM9kXoztkSDoiHdLhWVZujA0TOjZPfShJrrOb0=;
        b=XYFvh+/ogcaKO/P36GiUxCEBwXR+FqcmnRcr4SMs8XnWGPDr4tfyMa/0Fcp6U05VN3
         9Yh4fmYguEnPn+S2tm6oOTQQhZMGbR5YRHgW3MZ08g6jPWLQhPxJhCKjQ7W+JnVWMvTu
         T6wzGxyZvQ53NcR1iNV9qsVe+PbAg5FTDsWO6GYppIAfire9/2na++ZjI4smd2kNyX59
         IxWszrY+QUuLMDXbsdHRP2b8Sdg9xtJuhxyjz91M09PfNEngP/xwX6UnUdvgR8U2JBQF
         6qs97h7qGyQKa+PuTukH/z7TTjLbJnezRjy/ma4Ed35edfxFJmulA/Nr6vOyaZgb6/GP
         XPfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762978797; x=1763583597;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Ix38lM9kXoztkSDoiHdLhWVZujA0TOjZPfShJrrOb0=;
        b=tujYjI7qXfAugt0pIlmpaJIWrzlxxZXEiszk3/l2PxZrde0MFCRZTaNpSj/58Tf+Tk
         Z99fI/cQ87AmNVUpmoWNWzcg5wujl7Lwordw4r+mIYiJXTwRkrnrJMLAdyZxwrWsYA7o
         HgKAnWC8F2l++OK7MLVL00pqpNeKsJDLyBbuJpj+Rx6YmXYTmrc6b6M4NyJ8h8WjE8qz
         rzfWykzwlcf7+NGw5eHyle3z1D6oOmID22KShhWL3G6x6FVYJNfGjXXSOXLKDdp5ESpK
         TM7Aq7Yzx7yTVpr4Wq7w7cmEVRDkwmjtKqZijBFwRVE54Nj3CAUYPwRGC8wKydfGeg91
         EHLA==
X-Gm-Message-State: AOJu0YxwaPAl9vRp5CC/Iw4brNEiyc7scIZm7opH28zZQB4zhRIza4n3
	BdeUG+UAECSeE43LfAIFKtJw1vALmO4X5MNyVi8Bbma1ECSGiffJqsm+
X-Gm-Gg: ASbGncsgP9ZY2u8tiA/itr3eq+FsVfIjgeJAQfIRpxXQ1i3woHIMfadfqP2TwY6bVOd
	/kXKGCxdNQCpbJu8Q9IQBToCh2KXJX7A2HIls4DEAcaUpnRB8Xnx6v7imhfWISSQh9ESxPBvxqt
	raD2/kFkAYLFtBBSmrHRCr/aui29FUkIKm+D50sDLpNmgxeTM5O6X8xoqIctvXYBvEbNzj0djCp
	3e8skNPwsqZrZK9FFnFa12Ey6KKV2Ncteq6SKFxaKVoKmrZMkBcRo28QIPhWtOn7NaugvA4IlK4
	5gUWLGe21uSCcWhvGN1lWbuDNpdEB65Du1n+a8V6nsyQq49BLCKYCpGhGrqi/MXlixG4Kqo1zN4
	OX/Lu3kFqK/itC/uG6CZNhtQebVy74dNT4zUZE6E8JmltwPTQ90CsaQynx4THu9FIoe6e29R19V
	vlfjFTjGIc1join2Qv0jejIuuJpGxep96b
X-Google-Smtp-Source: AGHT+IEdxgwGyfM1n1piNaZeQalD3y12iobhYBGRKPRDwAyJ8G9Oo2HW8iH8goas0/jcmlTS1F5TpA==
X-Received: by 2002:a17:903:2385:b0:295:1a63:57b0 with SMTP id d9443c01a7336-2984ed9d5a9mr58544975ad.23.1762978797023;
        Wed, 12 Nov 2025 12:19:57 -0800 (PST)
Received: from iku.. ([2401:4900:1c07:5748:721b:a500:103e:1bad])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2377e0sm261015ad.23.2025.11.12.12.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 12:19:56 -0800 (PST)
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
Subject: [PATCH net-next 0/2] Add support for PHY link active-level configuration in RZN1 MIIC driver
Date: Wed, 12 Nov 2025 20:19:35 +0000
Message-ID: <20251112201937.1336854-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series introduces support for configuring the active level of
the PHY-link signals in the Renesas RZN1 MIIC driver. The first patch adds
a new device tree binding property `renesas,miic-phylink-active-low` to
specify whether the PHY-link signals are active low. The second patch
implements the logic in the driver to read this property and configure the
MIIC_PHYLINK register accordingly.

Cheers,
Prabhakar

Lad Prabhakar (2):
  dt-bindings: net: pcs: renesas,rzn1-miic: Add
    renesas,miic-phylink-active-low property
  net: pcs: rzn1-miic: Add support for PHY link active-level
    configuration

 .../bindings/net/pcs/renesas,rzn1-miic.yaml   |   7 ++
 drivers/net/pcs/pcs-rzn1-miic.c               | 108 +++++++++++++++++-
 2 files changed, 113 insertions(+), 2 deletions(-)

-- 
2.43.0


