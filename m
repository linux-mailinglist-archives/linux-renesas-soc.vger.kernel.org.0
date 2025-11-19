Return-Path: <linux-renesas-soc+bounces-24778-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E580C6E1FC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 12:06:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 56C492DBDF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 11:06:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0082350A0B;
	Wed, 19 Nov 2025 11:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bX3/6o6E"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34123502A9
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Nov 2025 11:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763550316; cv=none; b=eWZXAJOzS3qP4GcxC55MnNm8fwZUcdmxVhy/GQNVK0xpAXP3B65rtvPQcToi9CW/ZyaxBBP/DwjwimSVvFHBG9v/Ze1/BiYc2sIunZ4oAmdUX+rlxO/BiVZ7232KQT/oPPRa8UM8u75V4+u8D5NDXunQ/lpjONOgOEIGUKeX1WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763550316; c=relaxed/simple;
	bh=Z7BqYBP1hQPbK6MRUQ0wzMjKx60/qWpwRoZtM1hFtxw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xj4cvscE9mWr/1l7dHC25cxmW5e4T0iFmzDHFNPc4d4r8OuHm7THqzrPv6sWQWN6nqXOIZogv5laoruMVc2PzZyQSsPNqUQIQptl2FPCD8EpFCZqjuJnyFK6pMBIQHvmgPE5IAvL6EI1VQJUDXvK7+thsQGMNPMSrc2nJrMElpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bX3/6o6E; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4779a637712so28803405e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Nov 2025 03:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763550312; x=1764155112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CWlw20o6LQDwwv5VrwhL4squAhrFIax2gZpjeEuMfG8=;
        b=bX3/6o6EQ0Bo7pZDfiKNTIgQWCmGWO0wLdAY8eSqHdItzrMgIIW32UAyeqZQI3EHpD
         IQWrTRQA/nxQHfIiYlb6AIuKi55sBuzOEWhNcezCkQ2yKkO7vROXfetRi3MofDC7+Tag
         2viCXLp5apzMcfPrTMGaRfLEBE9YR+YzEDY7Zy+0gXnWL/TSpMNzggUnwEUCBaKmVwRR
         +cYUODnpgHVQkXozdE3xuCSkldKbtolpougTHwhkzuGUE/Fsa3E5ctmX2zF/1Z7f8YRf
         RQHycmOIL2ePkw4Yfsxtvz6Uo3nuDwOfaN+ID8ESaeUkMIe89CciLe0qkV9+Jt1QnDTe
         2bqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763550312; x=1764155112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CWlw20o6LQDwwv5VrwhL4squAhrFIax2gZpjeEuMfG8=;
        b=N4SlnD/+Bw6OXd6rDZheoxenGG9hpAAP+NhjwnTNDiVDCXujyomKhOqbBfammNhz+a
         Hel77nSySMM4Zr0EsjEJHWT9U1MeVA9/tMAWb0aagGYUfSj5dAk9LuqxeDRuwX2+SheO
         fAPWrw3q+6PCqaJT7ugykCjZdpjFXzhhzZI8yepQL6vqQjXNr7rDLqgWC9QU5p9FMQog
         pD8L+wXEwHJD66jOCFsiNw+xyZM3i97KqVyM2vwX84ujXmGDvK4rBtA6GQp/P78wsZuq
         prRhpBtX4PcTshtBch3mrP2ABzixljBB+EdiYHmQ/PdTKiaI9pkuYgRlv8riljPR6wxC
         OHhw==
X-Gm-Message-State: AOJu0YwpDMrhHZk+H9dcVnl7L3cloz0t/S88abGgVEKGVY9GkqNZS/2N
	cZpsXL351zeaz9YD09e1EMjL6iBb2s+LV4WVehXC6N3uUU28wGOXczv3
X-Gm-Gg: ASbGncuB50Mqhb0OTlddrunV+Cp86v3CpyCI7mwbG4WeoV7pf3Bx3L+RTDC/NZ/7N+e
	gol57rq3TN4/OfTezZAw2BIzC6V0tDdd/rBYdeqNUMkwHfff6wcattwi0T6gESuEzEutQjZifkR
	Ks1JQMKeq3QSF5GDS9Jcx7Q4ipeu9K7SbpHHF3ymefGloAB9At3fi6jXQztHAXzVJPHqDfFgPB+
	9riQSvO2EsEdy5MLCZ4I3I3b4R3NIvdZcywV720VQIYCKTooJn8KUuOTUmefYfu2gFR2u++nsp0
	7ztAEaoFRaj27OZ/pWU+fD9jL6+awjaX/d/S7F+h0Sezl+ornyg9hkiAaRBucQTJPGQ4S8nJuvq
	TGvSNwGCEPBLtReDqSKp7wI2dKjhjplvMo2GfbJImztMQKbpSUnRKVuY4FpubMV3+WsQLZJxMdD
	j8CPFbMTrwl0s8AcBsALRgtOTk/+dJClhtNdJ9Hl9onxb/SRci/agREUaW
X-Google-Smtp-Source: AGHT+IHvIJl1Yyeyb6PlfbHbv2vqvVFA+gZ94GJdtTnuQ5bBm81qZUqFHMsfO2W+YX8YNlnln+efZg==
X-Received: by 2002:a05:600c:3112:b0:477:9650:3184 with SMTP id 5b1f17b1804b1-47796503351mr160637325e9.2.1763550311378;
        Wed, 19 Nov 2025 03:05:11 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:4b7e:3ed7:e0b3:cf30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9d198a0sm39884505e9.1.2025.11.19.03.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 03:05:10 -0800 (PST)
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
Subject: [PATCH 0/4] Add USB3 PHY/Host nodes and enable on RZ/V2H and RZ/V2N
Date: Wed, 19 Nov 2025 11:05:01 +0000
Message-ID: <20251119110505.100253-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This series of 4 patches adds USB3 PHY and xHCI host controller nodes to
the DTSI files for the Renesas RZ/V2H(P) (R9A09G057) and RZ/V2N (R9A09G056)
SoCs. Additionally, it enables the USB3.0 support on the respective EVKs.
The first two patches add the necessary USB3 PHY and xHCI host controller
nodes to the RZ/V2H DTSI file and enable them on the RZ/V2H EVK DTS file.
The next two patches perform similar additions and enablement for the
RZ/V2N DTSI and EVK DTS files.

Note,
1] This patch series applies on top of below patch series which is
   already under review:
   - https://lore.kernel.org/all/20251103200349.62087-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
   - https://lore.kernel.org/all/20251023212314.679303-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

2] The corresponding USB3.0 PHY/xHCI DT binding patches have been submitted separately for review.
[0] https://lore.kernel.org/all/20251118180712.4191384-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
[1] https://lore.kernel.org/all/20251101042440.648321-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (4):
  arm64: dts: renesas: r9a09g057: Add USB3 PHY/Host nodes
  arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable USB3.0 PHYs and
    xHCI controllers
  arm64: dts: renesas: r9a09g056: Add USB3 PHY/Host nodes
  arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable USB3.0 PHY and
    xHCI controller

 arch/arm64/boot/dts/renesas/r9a09g056.dtsi    | 30 ++++++++++
 .../dts/renesas/r9a09g056n48-rzv2n-evk.dts    | 15 +++++
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi    | 60 +++++++++++++++++++
 .../dts/renesas/r9a09g057h44-rzv2h-evk.dts    | 30 ++++++++++
 4 files changed, 135 insertions(+)

-- 
2.51.2


