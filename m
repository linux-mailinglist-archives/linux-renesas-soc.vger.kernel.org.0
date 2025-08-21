Return-Path: <linux-renesas-soc+bounces-20874-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9574AB2FFD9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Aug 2025 18:21:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 697201886351
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Aug 2025 16:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 179FD2DC337;
	Thu, 21 Aug 2025 16:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eaN/HfZX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562852DBF46;
	Thu, 21 Aug 2025 16:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755793194; cv=none; b=uOZAnwZMDLNqfgZ+nxRJkpOBMeNP//IZ9BLZWKyCoC1OAquwsF02abj/JL/SkLrGsYqkH/LxppElMEMvX9Oq899Q/d3u+reebsZH2pv0tQ7LNGUmAO2CUeMYHMgl+68WM6C9BLYM0bamW98m6yuhvIkNmvwdyHsqFUVW7TPosXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755793194; c=relaxed/simple;
	bh=GtGqkTcLS1ceBcL5auy/IhY+0QRzkp6Vueo+gdxXWao=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B2rpL5TrDLOWr1YMrEArc3yF5k2NOD1myLYXGktgCfXXbyEY2/LNVo0mj4XPnyVd0mrWTdgbBpa5noatMkVAzoBRjxC22EqmaopJs+kL0unKhkCstIvUqVnW8R813PQs169UYo3raRGF3b9RZjW+afZj9S/bFhRo/ylT0f987GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eaN/HfZX; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3b9a342e8ffso920766f8f.0;
        Thu, 21 Aug 2025 09:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755793191; x=1756397991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fTMvkN5940SW84+RcC5Rq13leHclwNf9WmDN3d3WW+w=;
        b=eaN/HfZXFaSFIxZJ8Vs/h8zcUW5cnP7a38tGzWFAOCftivFELzj/uVsD9s7SBqwDPD
         Gp0QZtr5Gn2UYz6PcscXMs5fXXs7fBMp1ChHjOkgWu8H8iJWNAkaq6fgd/3egWvW7UHB
         OxgmWqcIQgq4ooT10a94HDq9XQ6hfBKxLXbjwXuoNxeWyhM0i8WFYbsdxmt8nFsMKVcE
         urr2wwscl3bTYcf8NGJlan7sk4E5Wg7uIJFGDffQkETcz/U8DkNuaxZKDwjxDIT8C7Yw
         5HRo4dZDk4P+NRvcTpuDRWRn4JlQzWsXxF/IqOJYwzZQUQOSA4ayGQEz3RzJmcVHihtM
         vg6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755793191; x=1756397991;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fTMvkN5940SW84+RcC5Rq13leHclwNf9WmDN3d3WW+w=;
        b=YHYXhy04deJGGR4URr2BPXInldi/h5OY083dRKCKjgbgGUqhVH+bZ+TQ+gabgV+Mb6
         dkuk1Pq0n4359MyNN3aGehd5nXGTXUDZQWHpwQgPiqD51E76ZMIqJL1W84mqMU5NLZT0
         cQQkFUbBY2RJFwD89FDLhNDrL2nf3XHVx/43n3BatotydmnBFBuH9Z8A/FdzACW1BoLw
         OOsC9lHVmwlHfiQ0gI13zemnbspuVB50FXiMHmRRbITqTC0XN6tFVfeMD5CzSmElKKGg
         W/uDMOg9jA34uxHB+6OTR4y8RUqNlNEwcyl01d++0K5NgZ8r3kT2vcnlCtWV8BFb7Nmw
         Bixg==
X-Forwarded-Encrypted: i=1; AJvYcCUfsjK4ACt2WZm5nTB+by1/0yv2fv8I8sHNCbLf3GlvF03dwsi5w8SzjKJ2/dAjZXRZYTqxt3bEBmNO@vger.kernel.org, AJvYcCUux4cRkcKHqV3wx7uXn/gQ63nT5z6Lls/vfGORVVR6RkYF5qZEG9B6YXT3LEfcTtZXrjUhP+Kl9eh7LRZW@vger.kernel.org
X-Gm-Message-State: AOJu0Yy71Y8pUNkHbR7ZFASOdwRJ18zM/kLtqGgIpL6ek/GUUfPzbVd4
	20WE+VpJndOL72Ib5f/E2wBFUtgqU8cqwNrOE58e7tUl02zMibCinGGr
X-Gm-Gg: ASbGnctS8lHxvEKD/bnxmuq4+CneL3usSWIc6Ahu8Mbw7gceTD7rH2rRBBeHzT1ypNx
	r6JamyGDD7Oun3cYAju46c69/A9JFTbAFy8/c86kGvXy+Rqq9uG6wZBb4Ps9xZjt13TCT2Lg0fa
	gSPN6I8HVuSsWUxzld+2tB1UBmgPx5jYErt1w1IKVXR5UO2odhxFEQAQyVSsOf7ZaoxvOl3m2R3
	XtiDOIt9JhNLPH9CuNN6cwx2n/KpXk2f2S0X0ROfTJnQst5QIoBOBf8DIKAd+Y1PJZDPfvPacPq
	w0PXJwLopbBfpRP1ehga0btwzBJknVDFnfnTlMW4c/dOoD5UrInu8rW+4la1+igtoxlDaaqJIBy
	SN11sZ+SUHW8KPSJbWgVrtbDqYP/8G8tj1mkIrGUb7yueG5jELcOq4X5g
X-Google-Smtp-Source: AGHT+IFioIErM3rMkgYrGIe72wb8WzpV4s9E2BuZBI5tRDNfY9dgUvoY7I8rjwPC27aHJVVxVmGR9Q==
X-Received: by 2002:a05:6000:24c7:b0:3c2:e033:3994 with SMTP id ffacd0b85a97d-3c4b5a85a80mr2496182f8f.26.1755793190240;
        Thu, 21 Aug 2025 09:19:50 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:9ed2:95cd:69a:8d10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c4f77e969asm2316464f8f.20.2025.08.21.09.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 09:19:49 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/6] arm64: dts: renesas: Add support for WDT/USB2.0 on RZ/{T2H,N2H} SoCs and EVKs
Date: Thu, 21 Aug 2025 17:19:40 +0100
Message-ID: <20250821161946.1096033-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Extend hardware support on Renesas RZ/T2H and RZ/N2H SoCs and evaluation
boards. Below are the features added for the RZ/T2H and RZ/N2H SoCs and
EVKs:
- Add Watchdog Timer (WDT) nodes for RZ/T2H and RZ/N2H SoCs.
- Enable WDT2 on RZ/T2H and RZ/N2H EVKs.
- Add USB2.0 nodes for RZ/T2H and RZ/N2H SoCs.
- Enable USB2.0 support for RZ/T2H and RZ/N2H EVKs.

Note
1] This series applies on top of the following series:
   - https://lore.kernel.org/all/20250820200659.2048755-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
2] WDT driver and binding patches have been submitted separately.
   - https://lore.kernel.org/all/20250820202322.2051969-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
3] USB2.0 driver and binding patches have been submitted separately
   and are already merged into -next a fix for PHY driver is posted,
   - https://lore.kernel.org/all/20250821155957.1088337-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (6):
  arm64: dts: renesas: r9a09g077: Add WDT nodes
  arm64: dts: renesas: r9a09g087: Add WDT nodes
  arm64: dts: renesas: rzt2h-evk-common: Enable WDT2
  arm64: dts: renesas: r9a09g077: Add USB2.0 support
  arm64: dts: renesas: r9a09g087: Add USB2.0 support
  arm64: dts: renesas: rzt2h-n2h-evk: Enable USB2.0 support

 arch/arm64/boot/dts/renesas/r9a09g077.dtsi    | 107 ++++++++++++++++++
 .../dts/renesas/r9a09g077m44-rzt2h-evk.dts    |  36 ++++++
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi    | 107 ++++++++++++++++++
 .../dts/renesas/r9a09g087m44-rzn2h-evk.dts    |  41 +++++++
 .../dts/renesas/rzt2h-n2h-evk-common.dtsi     |  27 +++++
 5 files changed, 318 insertions(+)

-- 
2.51.0


