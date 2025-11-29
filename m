Return-Path: <linux-renesas-soc+bounces-25391-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E346C946A4
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Nov 2025 19:52:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36BCD3A40B5
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Nov 2025 18:52:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB28125785E;
	Sat, 29 Nov 2025 18:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O6/1zxlJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49471FDE39
	for <linux-renesas-soc@vger.kernel.org>; Sat, 29 Nov 2025 18:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764442330; cv=none; b=Y/BtuMWlAjbfxO0zuMGUlZo3CrSSS/7kUgmOiKOKajxxZNgjvwyxTd5VoFaCICynlhwc5MV1/faZWTCip1TCvKIUUlKQdRtEYnB5lJEgHJ6Dorr5FDiGmxpZHJKD48KWssSTjjSOkreGaeSfl0M/zv0n7sM+Kv8UugYoVVFQV3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764442330; c=relaxed/simple;
	bh=EAj4YR59DFcx3E8WLT/dTjKozDTXEVhEmhSxMKw6G5k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B7cEBoMkdcEf/pEm89dWpRzZHdR2oHLB2V4UTboVW2FLyEGs/RLU4qn0HH+Vh/+1qvlyNyUg6yRGdvCaZNNpKy7VWGzW2OsBPsenOYBNN6o4dG9FTt7Ew/iJ9JhSnVBTUJTAIv5ZnHEmd3aRHQwzCfQU6EPJGZOPwWQwMze5Rxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O6/1zxlJ; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42e2e167067so49598f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 29 Nov 2025 10:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764442326; x=1765047126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rh+9SxG3Y37TCuHfuodKq8qmyi4CIAVj61rveyWfT/A=;
        b=O6/1zxlJ8t1d2hle+JF+yx1d5qT7JBMLU2lBQhC8Uphe58HYc4RcW1nhNYfkme5rld
         sm+siRyjzbLCYRv9cMBf94qeF/C+Ke94k8TkQCnvO8pCFj5vWVdUlstu/d7pQGxIesrL
         Fj57XttjWtqtpFEFU0xIv5Ch6DxD9NkW2Z8JrE0OmqoiPrG/s+H6KFD6irZo54eT/4AB
         eeWdVlspdoQyP2duRQ7rOew6IhpXXrB+HoKQq2DfKTC9pll4Z/+W0K6teLDluGdbtGk8
         /eXuL7uTw3wt+K5mpS1eTV2E4Teks6X9rM6BLyQ/9db10BdmliaApBnLwQkXjM0Q5nYi
         2OGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764442326; x=1765047126;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rh+9SxG3Y37TCuHfuodKq8qmyi4CIAVj61rveyWfT/A=;
        b=b7DcswKRRoPWEj7OlqxRPv8vxUpDOoCE8sh0qUQgInCWTvc10+gwThwqbpMoiPHZqN
         paSyljQFc6bVYIT/cUY9iP+sUOxmd26eJLtwKIr1hIao0nYfa9qal9jtzLdFn0d1+7fA
         GJqsmtePGAWWXT/MHRJOOutO8KHuVsrhohIRrkvuNWAUaGVQz0qssEyetRlAXUCjnvM2
         5QFMNuTwYDUnvUI/vbidB7jzufSnmlChH1WOoDRRkckcZ3vjOT7o4Bneuh9e6ojWS61v
         uu9LMFJe57EB7slAYaD0NbNpX8s59MZOD5uGtoRbFUlIovWqJlGhNEPO+8/hIJ/sILHW
         bxUA==
X-Forwarded-Encrypted: i=1; AJvYcCUzGWxfcsYzM9u7ZAt2Cr9wWmxweliYPcxT9wLy1vjDKAWhjth/yzq9vtf6hRzuez0mwODCrR3EUc1uWLbq/L14Aw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJx3i2rN3E1pH7diVLQCE/B3olhPGqwjcbvyiGymJ2osQEHEpI
	Yv2XGLElKmLEwAZKSwsox9cEEeANSt/2yJoq2hFlGNgz2kdt0HZJ2YAJ
X-Gm-Gg: ASbGncu3eMmlhZvAo6AfMdDtYY3fjDU1zPwdColJ2KZeBco7aOUAOlj8535njNPo57q
	V1e5LdHgbVG74n0YWh/eIuHNlUPyE33h6PVhqqcdHZ46NES1g7ugpQra5LYwpjSJecxI3HUHYHM
	aIrP3CG2JqAbLyoKIMeSEPkjU/F6K/Y0gjXFFQFB5IdZdnqKsr/TfST7JWAHljEZrv7SS3w4e8g
	ZikJTs9qK33j2tKGZFkoNJnQRG2TAy6fatQ5SiVg2O/+s5xtfczWrVoD+pab7CavYmbTB6sVs3h
	8GTkkktqf8t0ZPoTdn9/siagf5FygaMvgzlI2CLrfYLSNMxABHOLnwz5riu++YYCJzuSy+/YL+v
	aKhZyBbVHCtRvMXt0w7XgzFQvLKDVjA+a7th2ho54ISYsXVvyI4Tvnky9H6cnQW307sH2MYtKxX
	EtaYwYOms53uKvP6Kdc980Cb+n4xkU9iECLm3JbgukwI6F2EPK7+Z5WmbLiKE60H319WX3XoaYq
	cKK0eaSmaxT435ieY0nDLZBxUZaPvs=
X-Google-Smtp-Source: AGHT+IEch5XdeUdr7mXT6sdy54b/BDLGlbVtRraVRhRpYmFhS3inVBTeg5/xHMV5vWpNer4OItr+YQ==
X-Received: by 2002:a05:6000:40e0:b0:42b:41dc:1b5d with SMTP id ffacd0b85a97d-42cc1cbe330mr33382500f8f.25.1764442325934;
        Sat, 29 Nov 2025 10:52:05 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5d613esm17442067f8f.11.2025.11.29.10.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 10:52:05 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 0/4] Enable RSCI interfaces on RZ/G3E SMARC EVK
Date: Sat, 29 Nov 2025 18:51:55 +0000
Message-ID: <20251129185203.380002-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Enable device rsci{2,4,9} nodes for the RZ/G3E SMARC EVK.
Patch#4 is added for testing BT with rsci2 interface on M.2 KEY-E with
the device[1].

v1->v2:
 * Updated the compatible from r9a09g047-rscif->r9a09g047-rsci.
 * Renamed clk from bus->pclk
 * Rearranged tclk{4,16,64} clks.
 * Added missing irqs aed and bfd.
 * Used hexadecimal numbers for module clocks and resets, for
   easier matching with the documentation.
 * Collected tag.
 * Rearranged pincrl entries order by port number.
 * Updated the comments to reflect the board signals.
 * Added missing pins CTS4N and RTS4N.
 * rsci2 is guarded by macros SW_SER2_EN and SW_SER0_PMOD.
 * rsci4 is guarded by macros SW_LCD_EN and SW_SER0_PMOD.
 * rsci9 is guarded by macro SW_LCD_EN.
 * Added uart-has-rtscts to rsci4.
 * Dropped rsci{2,4,9} nodes from renesas-smarc2.dtsi as RZ/G3S does not
   have RSCI interfaces.

This patch series depend upon [2]

[1] https://www.embeddedartists.com/wp-content/uploads/2021/05/2AE_2BC_M2_Datasheet.pdf
[2] https://lore.kernel.org/all/20251129164325.209213-1-biju.das.jz@bp.renesas.com/

Biju Das (4):
  arm64: dts: renesas: r9a09g047: Add RSCI nodes
  arm64: dts: renesas: renesas-smarc2: Move aliases to board DTS
  arm64: dts: renesas: r9a09g047e57-smarc: Enable rsci{2,4,9} nodes
  arm64: dts: renesas: r9a09g047e57-smarc: Add support for WIFI + BT
    test

 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    | 220 ++++++++++++++++++
 .../boot/dts/renesas/r9a09g047e57-smarc.dts   | 107 ++++++++-
 .../boot/dts/renesas/renesas-smarc2.dtsi      |  13 +-
 .../boot/dts/renesas/rzg3e-smarc-som.dtsi     |   4 +
 arch/arm64/configs/defconfig                  |  26 +++
 5 files changed, 363 insertions(+), 7 deletions(-)

-- 
2.43.0


