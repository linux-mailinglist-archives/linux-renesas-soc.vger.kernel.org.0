Return-Path: <linux-renesas-soc+bounces-18667-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 64173AE6DBA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jun 2025 19:40:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 588CE3B9564
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jun 2025 17:40:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DFAB2E610E;
	Tue, 24 Jun 2025 17:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d13jDyH0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500592222D2;
	Tue, 24 Jun 2025 17:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750786841; cv=none; b=nOvJdAZVBgfBSYR6immNNo+G0S8a+G46GdJh4a6lFFqZu0dCFR6ohzL6lD2crbIW7Rc3xsSZtck91OC9WCYpTGnNwwKixnSEtHQxAVj2fABFE3plXarkztub6tmluxvr2MS8Enqubg8EUaqGfSU/m8urxXSraF3/TSq74Ez2dHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750786841; c=relaxed/simple;
	bh=YhoQgm0PvGp46pc/NLqp1FnyCxWoY1MPU8o9QFlgx1U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZjcGWNcf0OfDK72kazol6NN82DHvAeNnBmiKWiFhZ9H/9xgQ5mVZ2eU8KRKXxrmj3WdWCLUjZp+YU2bjEZ2p13IRb665sntqooUpLn9PNAGs1bWuZRQAFoJZJPYjQl2QWYFVAyqpkC+jkUBqlSCowZ580zOWn3MeWj3rPINA6fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d13jDyH0; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a6cd1a6fecso748575f8f.3;
        Tue, 24 Jun 2025 10:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750786837; x=1751391637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OFY1porl5bWPwHx+ruPBvNUd9kv7h/Kd82He4WS0fRM=;
        b=d13jDyH0K29I/6MjRpSkSHLTZ8Q9mHJBk2LqqMfG9TXqz1QsZp7lhWiQTalWN5Fqjn
         txTlHUec1UG4WylaVb15r96oTthJ9CtWvSFU7XQyEmfBSzVZ3JDpH+VNZsB1q6DidD7P
         FnFRJP+nus+Au4IHStc0Cptnj6RdnaJy0U/hKv/rK5MT/lFXxjaU8q/UieyHWaJ02le/
         diyl1yk26fdiwy77KaKvhaJbyCsStNIvaw3AAWNTv2UvJb1yXCfS43UGnNQNGqrZhZax
         VPQdgHj4/LOhT9UTGmPpFjCUuGJQZrqwUoEjS8TnbcQtpprJqDADbjlhQSaaeKy8XDX/
         YoIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750786837; x=1751391637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OFY1porl5bWPwHx+ruPBvNUd9kv7h/Kd82He4WS0fRM=;
        b=Si1ZoKXJyvnrPHuyvDvmTharNLVNjjtp8fqmtchQtyYG4o2u/SzCmDmnJfJx/4mz70
         KdGWm0pEpRQ88RRoyo+VXrvYxla8s8oAr+i3XwPskEObUCGKLretc392aAMCarYKCUYC
         vgIt5eI/y0erfAQGMtimcYbuxR2YAvJ8djL87aVrvJElpIbhyEhAH0M/zW0MLGHCLC57
         mHfB2Ehx9IiTuopPdAf+JIPbc5wRVOkZGAE3tgJrP/rBMULzMMQgaLjrlYcxor7imk6U
         1pZsRYESnRlfUhZweR0B/PWoDk6HJ6qpvMjuc2UJbZ6fJK8C33h7/ML4Q2Q2LDIjLFyw
         dWrg==
X-Forwarded-Encrypted: i=1; AJvYcCWa0i/TCO2r3qcawiAqJ2Cqy0ZEslMzlSHPj1vMJEKS70lqq5cqhuRJRFUvWc+VRYnihjO/jku1nXzv@vger.kernel.org, AJvYcCWo/ka5y/L1rIOHNK+pnFWCrrb3kLlg23m9BQgXi5Cm8x46pK0rLobQ9LT0uh7vimEkgJ4XheINIQBLdfbK@vger.kernel.org
X-Gm-Message-State: AOJu0YzaEa6Mqrt2J70RDyP5bagFy5cg1wEetyi4BgCGGB+CbikoJ6MN
	YkKArb0Wxi2A0aKcWj+Qa+Gij6UxaaU5PsKdmeKtgVb5Ki7zo2yVi7ZFEL2NMJfF
X-Gm-Gg: ASbGncuNIIIFf6CVCpxc8I05Jd12dNp0sAIc61eiEvTKsu1hw5qFK5fvHSBPDoWNE4V
	c8ioFOkCG2Mc+Bj/HWZtkZ2GTuX7fBDd65yIrKJOPilmLept2p2fljdH39F67V/gOpysyvooRZd
	vThqyBAh36McT8MuCVA77o05tY/xShZ0CF3WnrtuSu6oCmwz7TE3BE1ZP0a1BFCdoGNydBgtrht
	P55F9XJc0eUwpMijmiPrQSHXH3L39532dnrsgKT17oB7Dh4if9HD9zvsq+axELZQ+0CZIvoL9d3
	wEaGFoJOKjMAQCZLjLm37YjD45HPVZ+bElUXQtb30XowsFzDt6S7q7hXASkhsGK2t7JrrPjY7r3
	dSFqOioSHXNp1AvaCFHKz91oUs28VYJ8=
X-Google-Smtp-Source: AGHT+IFtT41vpD34xSBuIrcMJgXGQTeQjP18pvo3pwzWrXiRe2esqep++fdIDTaxFi61D0d5cVUWeg==
X-Received: by 2002:a05:6000:2482:b0:3a5:8abe:a264 with SMTP id ffacd0b85a97d-3a6d12fb9f9mr13459853f8f.37.1750786835620;
        Tue, 24 Jun 2025 10:40:35 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:a522:16f6:ec97:d332])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646cb692sm149812735e9.2.2025.06.24.10.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 10:40:35 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/4] arm64: dts: renesas: Add XSPI support for RZ/V2N and RZ/V2H(P) SoCs and EVK
Date: Tue, 24 Jun 2025 18:40:29 +0100
Message-ID: <20250624174033.475401-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series adds XSPI support to the Renesas RZ/V2N (R9A09G056)
and RZ/V2H(P) (R9A09G057) SoCs. It introduces the XSPI controller nodes
in the SoC-level DTSI files and enables a connected serial NOR flash
device on the respective evaluation boards.

Note,
- DT binding patches have been posted seprately [0]
- Clock support has been posted already [1] to ML
- Patches apply on top of series [2]

[0] https://lore.kernel.org/all/20250624171605.469724-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
[1] https://lore.kernel.org/all/20250624173030.472196-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
[2] https://lore.kernel.org/all/20250620121045.56114-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (4):
  arm64: dts: renesas: r9a09g056: Add XSPI node
  arm64: dts: renesas: r9a09g057: Add XSPI node
  arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable serial NOR FLASH
  arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable serial NOR FLASH

 arch/arm64/boot/dts/renesas/r9a09g056.dtsi    | 23 +++++++++
 .../dts/renesas/r9a09g056n48-rzv2n-evk.dts    | 48 +++++++++++++++++++
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi    | 23 +++++++++
 .../dts/renesas/r9a09g057h44-rzv2h-evk.dts    | 48 +++++++++++++++++++
 4 files changed, 142 insertions(+)

-- 
2.49.0


