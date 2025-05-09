Return-Path: <linux-renesas-soc+bounces-16899-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A728AB18D7
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 17:36:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A31A7524FD6
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 15:36:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E64422F769;
	Fri,  9 May 2025 15:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gW4iVNZ/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9073D22CBF9;
	Fri,  9 May 2025 15:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746804966; cv=none; b=LWVtBDvqb/Aqq9rV14ENgSfIHrpgH7bhxVdXk7MemlHRSfHqMgqhOc0stiv17lBwawy5RhBo7HFdCbcJACjFNCXC6Q5gepZv8nn7B5rBTuh7FVHphzXM3Xlyx0on+jdPeZorDlf1OZZvthpls78m5FgJUoFS0rRi86uGPExy/mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746804966; c=relaxed/simple;
	bh=WE0fOY5xn/zRrNUuuDCsqORrXmpm6bWnZLnTYRbmxt0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EmsRUFnSdCit42kLBrbQwGITAxt5Pykr+wTjGJ9PVBedciUDoAOmWvRR2onZRUun7m7T0i3VXYIvoG7h1qHom2qSieTNXUcs6vq/Ex9s9G5nxcVWiSaIRZD8OLVJI4CWua1dVpAb8cv/RH69+hSNBBdmdMGFvr31Axv1gzVnwN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gW4iVNZ/; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cf848528aso18362525e9.2;
        Fri, 09 May 2025 08:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746804963; x=1747409763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w/Pedr7HjmxfXrC29fzWYuuyhJcKkZdd4/fbBOBGppo=;
        b=gW4iVNZ/FpdJTSidO3VbxzMEq4YLZ2l8ux2UCAXdEuHt404MhIPyPH0QRin0U7R3Vi
         XH5kWNqzsOCiZ6a61RNHrWej70KxUYplsCdoVxekoNe4jeN79aUa83796HKXLcr/X2mM
         zxLOSKyPeVcxDwZXEjCKj01laRc4XqU5qSfXqr41KbBGyRQqBlWtXy83krqNtDKNxqSl
         uy1tmUHHmMScw4Og2qj6lyBD3wKqtOOi23gr/kuGHbtlmWTCq/eK+IF5+WfSOWglkzEp
         WyhqzCiKTZQp/8qqx0hmzzo99bkyrK0zKVhcDRuZogMGm+os4VS9ySEC1nThsMkpVMut
         MUvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746804963; x=1747409763;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w/Pedr7HjmxfXrC29fzWYuuyhJcKkZdd4/fbBOBGppo=;
        b=tR8kO0XZji6BA3NdbEEczpRM5xagSw2EG2YVjBSQHncMilkkYmINejqgHL00CbTbVN
         6+xGh2jw6mVgP28u3FFbl0dMswKuuQOcZmiHzW9IRl/DC4IrF0eiJICNWvOOx/Bah4CT
         tnWyaNtvaFjfYFxl7oBE44xQXrPGZvx9LXRbDe5ZkObQ7FV1FlYtMJBXJfwKYIBIBpgz
         g0DFEX2PzhGGD5JaDTfQI4XDlCqZ23Nb3MkiWyLgyTb4h+XPDWjd0SWo8Nfsmk9uCZaI
         yfoy2ZVs1DHhcNMX0rxO8r6Lxt+iwkkeUpR7s+5E6Uj4Py+oFGFggwBbb8HA9Wx+uT9d
         dhJg==
X-Forwarded-Encrypted: i=1; AJvYcCVthwr8CMH/1l0roGFQug0JA3J7E9clBZuFLZ5+0Ikcsk81sufyDnnVkSbfz+RZ490UMBOc+oyvmCgvIqXC@vger.kernel.org, AJvYcCWUIfeJzVvMX4uDvUVDxHYfueEb08gDq5zEfyvT91lrjBdey5bRPfYXhcKxH7E+4kjNvgu7/tLm+AG1@vger.kernel.org
X-Gm-Message-State: AOJu0YzkYj+zV6a+cqV4l6H6IBljWPeIzchVOSw8nmdNWlAkMEOMYFep
	Kg1QioqlsXj6vRowHdIJybH+/C6oO3mBE6AaYPoxMxPmrOqiYAI3Hij8LjGI
X-Gm-Gg: ASbGncu2O7w0Of9hAPMNBwZuEfNjS9ADBmlbw3dgrv93W6ZiATjihVEpcfWzxdGXkzw
	elbY/EfEkhweS4b2S4cOp6XFXpLuaGGhhUrnLsZtkRUP7Q/VdZYaTHZmuuo0ySkPYMfpOfqNxiv
	mwSdsmwELivwNmi5RwZAYa5u3iMlaZU7FPuUSleskpcihKEA0C5F/N9mg7ELM3ntaDQgTGr4aKA
	8JtPRk1H4OTv8+2HcKyqAI27lE4L9gS0Tepp1sf+MfkcY7crVOKnrtcJdkth+S9WcpmoUz+X30H
	JkYEjm6pmmc1ALf6sbbHzHfVINxE5CWgbaa4xuEvhSGq8wm6IIJD0z21z7zk4MiTjQ==
X-Google-Smtp-Source: AGHT+IGPY/e0+8DHiPQIjJTwVZD06Mfgb3x7QCyd3iQfpCfuALJcIMJxnBpC2cCNEePTbw6ruqhWFg==
X-Received: by 2002:a05:6000:4287:b0:39f:7e99:5e8c with SMTP id ffacd0b85a97d-3a1f64c0df2mr3586609f8f.51.1746804962574;
        Fri, 09 May 2025 08:36:02 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:40e3:34f3:a241:140c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ec912sm3550781f8f.23.2025.05.09.08.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 08:36:02 -0700 (PDT)
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
Subject: [PATCH v2 0/2] arm64: dts: renesas: Add GBETH support to R9A09G057 SoC
Date: Fri,  9 May 2025 16:35:57 +0100
Message-ID: <20250509153559.326603-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series adds support for the GBETH (Gigabit Ethernet) IP block
to the R9A09G057 SoC. The first patch adds the GBETH nodes to the
device tree source file for the R9A09G057 SoC, while the second patch
enables the GBETH nodes on the RZ/V2H Evaluation Kit.

v1->v2:
- Added missing power-domains property to the GBETH nodes.
- Fixed interrupt number 745 -> 775 in eth0 node.
- Added  snps,rx-sched-sp property to mtl_rx_setup1

Cheers,
Prabhakar

Lad Prabhakar (2):
  arm64: dts: renesas: r9a09g057: Add GBETH nodes
  arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable GBETH

 arch/arm64/boot/dts/renesas/r9a09g057.dtsi    | 197 ++++++++++++++++++
 .../dts/renesas/r9a09g057h44-rzv2h-evk.dts    |  74 +++++++
 2 files changed, 271 insertions(+)

-- 
2.49.0


