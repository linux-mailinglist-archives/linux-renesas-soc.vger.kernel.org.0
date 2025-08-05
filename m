Return-Path: <linux-renesas-soc+bounces-20001-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A409B1B34A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Aug 2025 14:25:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35D133BE844
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Aug 2025 12:25:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23E4426F44D;
	Tue,  5 Aug 2025 12:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="coquJs1h"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D21213E02D;
	Tue,  5 Aug 2025 12:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754396739; cv=none; b=hhRvomjRxOlUTk4Vy0t5Wb4WYzwinRnBMb9zGOvYfF1dsTOvZ6gZP/rcNvT3wcPgVN+iqZZRKkhhDKHIMxiIkl9LQxokzO2MehAuCsGr93SJlOeRG4kH86WwL+2XUJllTFc9DhgZbhz9Iqkl+idQf4DW5fR5fOv9UfD6cnuRavI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754396739; c=relaxed/simple;
	bh=N4y5U/NvjrRxQJcItubnHnlgAsoUKe3sq6btGq7iJpc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zi4KQwyKVV8PGHAYykdJ5dApx5O+gg+M/1/v5qb4e1o2VGKoG7yitGd3A2OzidqG1fSPPPBQrH3BLKI8vBL8rd9OsCueJYGI6pRamXdZw2nEd0KSWlmiBm29YbtInjdwFHmrFmNjHo2eVFzFvMuI7BIeqtxmkxXhl3iVQqVIBRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=coquJs1h; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45994a72356so20206995e9.0;
        Tue, 05 Aug 2025 05:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754396735; x=1755001535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AFgnKTTcacfgtFENVc4euXqwKnsP+ux58EnsqBigpsk=;
        b=coquJs1hZUZn3jVaPs7se0I3s0vKMjyI3gSMYPBZaMhDV7nUx/Be3YLPwipz+++jwC
         nTXLNfkXKZHXiCLrL9EcYxGKHF9L/sPULfvSCN5MWEa/UyYK0cAcFAN+Ad30O4J+WNUX
         nCUJgRw9Zr/eP3Y/8R4rWrm35LnqVuyoggbctD6034mHDSXWmBR12/bQTHh1s40wJ5QD
         6hjxYM6iPH67TWA4AQbkJNDy2OdRQbwgJ4vUbP9HGf36YtK4p8sEGRIq89+XB33BttQ4
         a6CpNoHR5KBYaJVCJhV1eQ3KDREyn10XBlSJ1ZbK5vldgSjqlrnq/6SDbJ/Y7qJCt/tV
         LsiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754396735; x=1755001535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AFgnKTTcacfgtFENVc4euXqwKnsP+ux58EnsqBigpsk=;
        b=c0ofxSZ3lKaDsWCqusbtovwS7TvTJnJ5ODDvyahioNk5kyDxzVsom9Zoa8K9FdFTXR
         8pMc3xORWTrkGwRnc2KMzINm7jMmDEY7EvEjnnUqEui9IXtqFRGPN10Ag2X6SSdfp4ZZ
         OfEOoCl81PknsEfV+vJAndgfLadJy31LnKkjXzyEijqFJ2USUSVso2dVROalJ9DPCJy0
         r2ncFvg36AW4ITMuG9Cqg5zcmchc3pqTfa/iBg4kuV04reZm9KNfRQFAIBSKztR5J1WB
         g1L00WnT21AIkF/OBH6jp0vLG/2R6XpVrtMTMULuxKh9h0NWrpOTZyh8Vv5/GenlnkfK
         S4vA==
X-Forwarded-Encrypted: i=1; AJvYcCU1KcjZsY46bUIVR7DcRjZ5QXpGps8bItBjwyFkgFTt5J1pbudopsYSQ7jSlWJRJnAH44M4tL5C/E0+ETzKP6LbQ5s=@vger.kernel.org, AJvYcCUuIdgfjdthaG8GXY+aQ7AtZeVwLWYOtY3OEs6YvMbPxkLK4VMknrUOkAioSPXLl29ZYqnjKnEv7oYkiXPW@vger.kernel.org, AJvYcCXSgmmj1GyXfuUawx3xA4s1czpPEB7PnKeYHJZjOefxg6txIYW9TS0xAGFuJ2AxKgOIWUDgXIzct1sg@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+vMgZiAWVn69hujVcawqeGKBGVh4t6K4UXb9WofYlpuDn6+iw
	O9igxS71nRD7/YeXJm4RGpjbx3gtTGintl14E3J2G2R9IkyktEJyhfcN
X-Gm-Gg: ASbGncvl7hCQ+tCgV6wmatRnbLL/MkMhwuCD7ghDb64mET7z8zJFaHFCa07enBuQl84
	q6GZGH6vq8b+BHy0o8J9kHCdHQyqwt8jV6AqgEY8xBCdpifcXRyH4wTHhWhsOzeCDTczueLslYT
	x8HsqHDg2cZmg2z2sWpT5ecRY4WzBX3CU12q+ieDW9Fjd19jtCRdCQSZ5371bKA+GKGTf7vBcKs
	9PbSgiyVez83aSUPPB5HhqNxApG7SKrC3r3H3zp2ztOq9qGMcWoSyrKyT+9cA7cOvF9BQVB1qsL
	HCyEnd7G3LbidbxyWIqONAdnTb3TRjV4ZfqZp0HB2urQksJWYSFY0Z78Zx7V+NIP9AaQandO+Vs
	wA1vP3nkUJZF3nOT32uuq2BRS8L5kGKA7RtHbaT9Mido4ZgbbDiJYKlucRg57ktFAriKj/QJP2A
	==
X-Google-Smtp-Source: AGHT+IFEGw1CHadqvXbX6GX6JyCURI52lepQZvMXWJsDZT97GUGuE4XpzqXRH8JUHpBDDocW9IRvQg==
X-Received: by 2002:a05:600c:6748:b0:456:1d06:f37d with SMTP id 5b1f17b1804b1-459e0d12436mr30203585e9.16.1754396734514;
        Tue, 05 Aug 2025 05:25:34 -0700 (PDT)
Received: from iku.Home (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c48a05bsm19153986f8f.69.2025.08.05.05.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 05:25:33 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/5] Add USB2 PHY support for RZ/T2H and RZ/N2H SoCs
Date: Tue,  5 Aug 2025 13:25:24 +0100
Message-ID: <20250805122529.2566580-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series adds support for the USB2 PHY on the Renesas RZ/T2H
and RZ/N2H SoCs. The USB2 PHY driver has been updated to handle
differences in clocking, reset handling, and register configurations
specific to these SoCs.

Cheers,
Prabhakar

Lad Prabhakar (5):
  dt-bindings: phy: renesas,usb2-phy: Add RZ/T2H and RZ/N2H support
  phy: renesas: rcar-gen3-usb2: Store drvdata pointer in channel
  phy: renesas: rcar-gen3-usb2: Allow SoC-specific OBINT bits via
    phy_data
  phy: renesas: rcar-gen3-usb2: Add support for RZ/T2H SoC
  phy: renesas: rcar-gen3-usb2: Move debug print after register value is
    updated

 .../bindings/phy/renesas,usb2-phy.yaml        |  17 +++
 drivers/phy/renesas/phy-rcar-gen3-usb2.c      | 127 ++++++++++++++----
 2 files changed, 115 insertions(+), 29 deletions(-)

-- 
2.50.1


