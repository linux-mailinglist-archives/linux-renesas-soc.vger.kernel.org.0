Return-Path: <linux-renesas-soc+bounces-26518-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B214ED0A9A8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 09 Jan 2026 15:23:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8ECFE301D5CC
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Jan 2026 14:23:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F62935E524;
	Fri,  9 Jan 2026 14:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GCNcswNh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF9435C193
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Jan 2026 14:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767968583; cv=none; b=NfT5wE7meY3khge1RBHK+wRbM/8aUnfAobqR0dozLceqxuu4CihxR+SM88LdjhdrHqA82bpRnLYLbPA6jafp73jouZaY27XjINQP/+v4RpyZjY/KdaAolb/qwS7e7ZmrW7/1U8l/wsm1Sb5SybQTasYS0GYEJGvg6ZFw/zaSPdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767968583; c=relaxed/simple;
	bh=UY7UFflbDgHZVibFTmDMq/bNYvMSyEoJd/ePrvRn4bM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hzpHOFDrHALVj4Kot7PSJ3lsKYPppH+sPylDmK1JqyZ5ZHc4qZ6dV4lA7Uzjjsy4hQIH9zeN1VMYNs3aIXrnle4kejGNQpO6gj3Be1nnFapfdeHY8SZoJwh26dBUtz6Id6UCvgtMuqtQSJY7/XgnyvRcV1tXxS5ZpMtB9RruASI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GCNcswNh; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47774d3536dso28171605e9.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Jan 2026 06:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767968581; x=1768573381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VZhhwAXsDIlx+lDJ1akeMoR5QOac1v63YDzTMpwdMz4=;
        b=GCNcswNh5fdd0ywVQd83AEgN08putvRSqXc2WAqW7ONxp9tJvycRwLUFJGVHln9PEa
         flYYox094U8NpyQTSbZZDPxPv38wN83VbCEnnDI2+NyhbXFSPtgwaNaXfYCgHVcckj4Z
         fVmT5xWgxO2eC1Ztx/JkeQ1j6Yn14nmfQIvT4wrWEvE2sKdAdRtK/L/jxillAvVF+1it
         yr54BrGS22C1sgjq3rM9e5jhmHgxwLSa2+E98DDj9FMUSDr5+RJ9VVz0r1+Sf7z/5BXQ
         JEZzR4XXyMz80lASupKf5rXNq8+KnKNX7KFLO5sOsP3DJyN7PsLD7TxBu0uZZAzdSWEH
         e6rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767968581; x=1768573381;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VZhhwAXsDIlx+lDJ1akeMoR5QOac1v63YDzTMpwdMz4=;
        b=TthgOs2FQGUo2IZzjhjAOTIISrKQC42iAUQ0dh9tfoeh60AmNDVXTT0bi3jZkxdh7S
         zbwnStPdCG0xE8yJlPNHWNOv/sUnx7H335HsJP8Ax7+V5lXzLuIMpwIW8OLmPpSI39Yk
         00nhY0bs4o/nqAwNMWGT+kJZ6fK9OECTzKXh8LFdqc6+y8ng2Tgv8Ah/DF8m+tOHYrce
         41HPhlQkbU6XixtuSQI2HY/xomd1JUT616fhtU4qQDmhIipXVo1C9nOIUbR68vtKjxpE
         jZGrnjdO5zZqeTTOdAwYmtOVgmfjCkjhsGyMIu0waxUHOMWhFkyCDMAFLK6LG43rS8Tu
         259g==
X-Gm-Message-State: AOJu0YxItC4ztBtaN5jcNxV5qslXRDwrYJ3c8XtGwVKtGN3Jp16TkJTZ
	xvUpAXqiCre4V1big2FShHdmjjUhzFhk5NBD79iJF/NElz1RuOvp+hsN
X-Gm-Gg: AY/fxX5uxnkIq4+whgjwPJkY76MbS+1ndaKFF/kamKOXzsvwNSqphvwSGIt1rrjg0ac
	UWXhz/Vl/DQ182rQy5VwgtsX1GK7vNbVlsKa39N7ttJpgpT58g50W0pra9mqFhwMm2yX/aajTt1
	uY+3LUonYdZYq83J0kOIAMveQnargyO8j8zXjbLlPH+tbxcNORQOFV3Ig8I81nhukCQdMeXbOSb
	hOlzZEG6MB0jBYjSy8Fcbs5GIPZmdHU0lXT5OeDBr4Huvd4k3yhB2PEMDYLk3TipiB3uGJE/KY6
	JNNF3h99gR3COcJiSSgTag6SQOK/Dyej0MiwPMNSBRGVBcn1BZEGhoOauMNJNNCtF5Dzf6DMWGj
	aYYr2hFjTvvHRC+fItDafJIg8/AgmSf6elIRC2jUwxuBXqw5kClWn9oHB9fwXhXmjdTwZQefBog
	KlbOud2XsyRqYNYehFY91sb1bbIkh7XnziTasWu7Ap+2s9PyPdVSYlZZFeLzqMJFni62dPZKs91
	fpF5Fpd3mXeFbwaEYEr9g4=
X-Google-Smtp-Source: AGHT+IE4xUeJTRReFgbyqrI4+BRSkB5yL0hyNobdmJhLiKldprwBuzroJ3WhNsl5L6ooZUp8tRuy0Q==
X-Received: by 2002:a05:600c:8b37:b0:47d:333d:99c with SMTP id 5b1f17b1804b1-47d84881c77mr103101565e9.18.1767968580372;
        Fri, 09 Jan 2026 06:23:00 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:3d06:ce2:401e:8cb8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d871a1e11sm61448855e9.19.2026.01.09.06.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 06:22:59 -0800 (PST)
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
Subject: [PATCH net-next v2 0/2] Add support for PHY link active-level configuration in RZN1 MIIC driver
Date: Fri,  9 Jan 2026 14:22:48 +0000
Message-ID: <20260109142250.3313448-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
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

v1->v2:
- Updated commit message to elaborate the necessity of PHY link signals.

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
2.52.0


