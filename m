Return-Path: <linux-renesas-soc+bounces-24932-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FC1C78D59
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 12:37:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 85EE12CAFA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 11:36:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2427334C98F;
	Fri, 21 Nov 2025 11:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dTfJ7ThJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E6E34B42F
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 11:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763724970; cv=none; b=I4QPkAwd/EhjtRLzN2sj030Y2IGWtjoOUvL30/kRKtw+/uLPILF8GGAMEmuRn/g8br9FbTj2vugDR6iRlYUx5D0XlLhSuuRRRWtLPT0ZA/X2WSDa3YZRVs2yMFeVujfh34sBpqgY5HE9tOmrrKcSxxj4N54LKpIWISRGiy3Us9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763724970; c=relaxed/simple;
	bh=txNrbR4kjc/pY51+xvNJPPLRbwZbm/EM4zTlrSM5lhA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qp+qkY2n6EClWXNPkHqAgQuhj6QKiaGhRySX35XQGFTAxqqle6t0zJ+oPf/JeMOUiGE/1wcP2EDJsXP/fZp/T+UtfPvF1rspn8wf/nuLrkalBo9OsJkamPI6gj8O3DdIb0FZ0/05BEQjknhxClh3l+mA+zGLyb6VC94S9tW4I34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dTfJ7ThJ; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47789cd2083so11736575e9.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 03:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763724967; x=1764329767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xkXvNfxvuRshzrX3T7DmPxZ6UESlXh/M5H4rR5c5zXs=;
        b=dTfJ7ThJI1xlL7R/hBx5DVskgFPSntxVjwwKejb4CYoAxxLtjIgMl87b1CByEQ0uKC
         FPDgneU8bOz1kJteTQXaPLV1zA4eKIldW33vFgFMzVXipjLxpLatmNBtLy+mcMRzJ2gP
         i+KlT+v3wwhZQvgxTJVT8l84NdBxjF92SM6FRGAgKZJ/tX2h4wxJicKQHY+OmJ4U2YiC
         Ho0EkTI+v67vh2ck2RcTn5ufXuK+qyI69Jk0YQC1GVfOzGe8JLTycHeI5PvoQT6kpObf
         f+Nv+IwVX19l2jnmB7P6N5WEBjORUZEBNpmhxfxGTm0RnlXtnRPF1uP9FDGDxulvjoWW
         QfiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763724967; x=1764329767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xkXvNfxvuRshzrX3T7DmPxZ6UESlXh/M5H4rR5c5zXs=;
        b=KbGSSHLLRKlSje298Mz6FoH3gLIzSuvHWYNhqoW0QR/afepycyWUZjdLjbxuJdfEtG
         v6r61eB4pQForRS+mDZ+E8acNBOIdUwdhN96ALJuEDKdQZ0ZZ6LT4UROOsfjNDARM/GL
         LNw+gIKwx8yYKQyd31nAvmc1s7mDtEKNt7sOzTBaDf1Mfz45i5kXlzBJrFIjpy+cxjjA
         v9S+y4Dn2qkQqeR+ff4UE47x+zgbu2N2QTi6NQ48+wLqsPWq6mHZtHb2PIuXLmKPqTPe
         WFGY0J58lyXSt8roh5Zp1xn0F64Q2JGU63YWwoC5dX2d9xgEiDmtR44HiXTFX3OFZ6/T
         RLyg==
X-Gm-Message-State: AOJu0Yxa1vW3wPW/lJlPwnPR51xmoHDlKXRyAO2G4EXG5QsI71VogRdK
	XHoaY5bTFIFsvT2ynbffiacrzipmew9lUR12LXwngWmK5NhJfQQyZdPj
X-Gm-Gg: ASbGncsqyy7zAM+02YOPx/b+b+RolXoqL/ghuKJFWsOCAx6nX1f3b8UOVRIVFFvHAwy
	dc5UPvfI5dFp71D+HU4SIwpHE/k22Qfl59cbvzL26X6/AygMTIvSFHE0ZDqubafChMYHMsAhz4U
	LC4foT82ZmgdJecgydJ9CdYboztCZ8R8HFIqyekvX6ZxnjpTsZeYTvQsSXgYHg6ZztOMDtMgmLW
	Y57dJOuPm/OZD7G98ZdJ136hXJExKqAX70/FIZb8uV/9nwzpha1yYaV5SjAhABCcA3DbDmgZkRA
	e98RT2a5/zETGdBl8k5dQwZStigE1LTUEZytjoFSLX9+nQN55mspYmbFPpXq3YUc6+4CWS7ptoK
	LG1Jg2ajwxL6NL4Lm7DuwEO2qd/1wnYp6hUk1zfUkhUft3I9bs1CgFY+ohBW7ROZ/dXlZvRj48l
	q43CqntOQ5i0PE+3WNTAT8ewAHEVXFMlO5X1w=
X-Google-Smtp-Source: AGHT+IFBmFYvdBEIuzrTSbSnwbk43MBJtoPoX7HxLBKhni5O1VX3pQuLjHyH3K2qpXRDhjoQjPVdbQ==
X-Received: by 2002:a05:600c:c492:b0:477:429b:3b93 with SMTP id 5b1f17b1804b1-477c1143089mr17859875e9.18.1763724966973;
        Fri, 21 Nov 2025 03:36:06 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:9cce:8ab9:bc72:76cd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477bf3558d5sm38732465e9.1.2025.11.21.03.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 03:36:06 -0800 (PST)
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
Subject: [PATCH net-next 03/11] net: dsa: Kconfig: Expand config description to cover RZ/T2H and RZ/N2H ETHSW
Date: Fri, 21 Nov 2025 11:35:29 +0000
Message-ID: <20251121113553.2955854-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Update the Kconfig entry for the RZN1 A5PSW tag driver to reflect that
the same tagging format is also used by the ETHSW blocks found in Renesas
RZ/T2H and RZ/N2H SoCs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 net/dsa/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/net/dsa/Kconfig b/net/dsa/Kconfig
index f86b30742122..a00eb3bdcd0f 100644
--- a/net/dsa/Kconfig
+++ b/net/dsa/Kconfig
@@ -159,11 +159,11 @@ config NET_DSA_TAG_RTL8_4
 	  switches with 8 byte protocol 4 tags, such as the Realtek RTL8365MB-VC.
 
 config NET_DSA_TAG_RZN1_A5PSW
-	tristate "Tag driver for Renesas RZ/N1 A5PSW switch"
+	tristate "Tag driver for Renesas RZ/N1 A5PSW and RZ/{T2H,N2H} ETHSW switches"
 	help
 	  Say Y or M if you want to enable support for tagging frames for
-	  Renesas RZ/N1 embedded switch that uses an 8 byte tag located after
-	  destination MAC address.
+	  Renesas RZ/N1 A5PSW and RZ/{T2H,N2H} ETHSW embedded switches that use
+	  an 8-byte tag located after the destination MAC address.
 
 config NET_DSA_TAG_LAN9303
 	tristate "Tag driver for SMSC/Microchip LAN9303 family of switches"
-- 
2.52.0


