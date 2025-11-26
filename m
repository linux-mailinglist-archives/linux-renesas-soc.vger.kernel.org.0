Return-Path: <linux-renesas-soc+bounces-25211-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D895C8AC9F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 17:00:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04A403B6AF1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 15:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22FAC33BBDE;
	Wed, 26 Nov 2025 15:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SeHRMm7h"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8186E33B971
	for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Nov 2025 15:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764172758; cv=none; b=luCGGPMN9LxEyIQBECAvzBl9/KVnN1mNd2gkgNGophZBDiFkIQgKim38XbptwGUR+cBom8MHbRCDXoc3ENyCMUZHLv2nxpmJTqgeWqIM5mzRcn5t0Nk2KYzCyymYGggUqu196qebWSK9hLqQd4oijgRhTjdehRkjFjUOkvzEZEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764172758; c=relaxed/simple;
	bh=ERKv6BJ7samXRoCYS1XzO4dixkxXVYyT22KVc2Mdd5k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e1Ukyp2Yz3FS9cYE0srGSkhIlP6nNTZZnUtztxPsQNhoCML11pdtakFEManOk6ULY791b0WW7KuILcefpnv0IkKGzsQo722CfxC7oRrR0X40c1daad3Sfo1yCjR8cqKPkm5t7MEH76kOOMhew9+NaMfP4hAGnINstioii/PLUGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SeHRMm7h; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42b3d4d9ca6so5702224f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Nov 2025 07:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764172754; x=1764777554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9ESZxS3g/bI8A7c471R+dv7haNkg67ON3Q/C+bV3xdk=;
        b=SeHRMm7hfvMEXVXEfOnKUhKaAePC6hNhnY4/XeHHz4gqZ6H7RtLnD20uEIoIEG4vXL
         peiK/ExCLXzJyB6QbazqMCZM/cOBRsXmLWrhA88uINaD/Lo6Alomxj+0NETkteaXYuaS
         vsItktNkjDnZCKvoecT6Wqj4Dkr6d0ycwQ3KpcIGsWGZ54pLjze/aOQodkr5IieCbzRg
         6A9+hMroH1+hZTQq7TG981eB/fQu1kUonyncfrEUr5trqdtqQqcdchfz8Xs9IlOogdeh
         mwTRWl13zyR6rDrILdSYSkp0Wbxhfk0pBDYyVDrbM+pKLseEJxBPWFO5ha3Ueb5djyXx
         Ocbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764172754; x=1764777554;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ESZxS3g/bI8A7c471R+dv7haNkg67ON3Q/C+bV3xdk=;
        b=DDAcI0UVsi38ICFd8EsO5F7JsYjzGhdwc4nD4ldAzNjk506LmgyHu3raoLy1MywgYU
         x4TlAqkZFnWeBVJ5VUMYVwN4sVPBNgZuzdXBuUXQiIokuhD8nly3NvoiIW0wG/G/T42j
         mcAgY9KlvvXvSbLglWkUkt1VoJwyM+cyv+p9KNAcs9obb3uxpcLdgvQJtdLaWihYuiSC
         mfG8jvkpRjN/YBEMIeodizRlEgU+9T6OmaaG62qSErgzK/N4qyeGFmE0XEExwpYdTQl1
         Zc0RNiBApxO9gs3qUhut0I52PKg5aDVtCEfLpyPwDqBvTXy7eIE1NLpeYOfME122Lqt5
         VJyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZbsqQR6HTGHvSQ3GcqJvE4lWLuh9B0XRo2cDm4bBfq3UDMSTFMUhlbjrJ5Ur669n3GmPdMttbDZMwQFTDehuNmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIT/lgL+rQe2oCXrJ/vVZMgHTtZ1Q0CCMAVaEWosrIbb4FZLir
	SkTnjYMNn3pg+ptfhZcafvjg7ZQjh2Y4XEynr7jfbiUHbb6ht6R0GGxS
X-Gm-Gg: ASbGncsU4Csn2EcxA2WiXJC31WnmIRNA+0/mma4xq/GP5MlRWvxQ1S6sMLQT4lqSXnm
	dQK9UN39bRxeMoxs+vwVri/PnJbmTPRew+RE9mCNiF/f3SYjBXz2JVTWw+J5mJB97jm7BxMY0+1
	s/k53eJbINaOgVi3fPtG/h6ZsFdGEz04b3rZ+qF3v1jn6izrIymM7pzHZhrkULP7iRK693uHnTK
	9fLdAwzz4c70PD8WIpegL5t6BI0Sthyt/R8SmKWFArtIMFaqkdAqz6wrCnChYkO0o2GxSCPBvOR
	2J9A6hNakPf5lWRn/6DQ5o9FpxCc7hTk6sJmrL/aFB+37l6gAtG9lRU/F8S/VBP25e3V92inb9E
	HuvuU8FlqKAS6+ykqwT/dtgGBBCaILxjbORyjxy06cmgWAf8oK8lA0ECm0BcsD7Ljiez6U19fNb
	5dEZvKNbaxxdcLD5QDvaDmEaYq5P0PcYSkIKJzfpM2bzz8LStduOgzG+uwrP49MQ5eRTVS6jw=
X-Google-Smtp-Source: AGHT+IH7UdPYYyTxG5Pih2eonGUNBGlykwZfMhHzrTZlGeBNNpxXs0Z36wXzLdlDBoBQwu9XGSaSKA==
X-Received: by 2002:a05:6000:612:b0:429:d4e1:cb9d with SMTP id ffacd0b85a97d-42cc1cd8f84mr19353425f8f.8.1764172753491;
        Wed, 26 Nov 2025 07:59:13 -0800 (PST)
Received: from biju.lan (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cbd764dbesm38197188f8f.27.2025.11.26.07.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 07:59:13 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	linux-can@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v4 0/2] Add FD-Only mode support for R-Car CANFD
Date: Wed, 26 Nov 2025 15:59:05 +0000
Message-ID: <20251126155911.320563-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The RZ/{G2L,G3E} and R-Car Gen4 SoCs support additional CAN FD mode called
FD-only mode. In this mode, communication in Classical CAN frame format is
disabled. Update binding/driver to support this mode.

v3->v4:
 * Dropped the node added in example for just testing.
 * Dropped the dependencies from covering letter.
v2->v3:
 * Added check to disallow the usage of both fd-only and no-can-fd.
v1->v2:
 * Added conditional check to disallow fd-only mode for R-Car Gen3 in
   bindings.
 * Dropped has_fd_only_mode variable from the struct rcar_canfd_hw_info
   as it is checked by the dt schema validation.

Logs:
root@smarc-rzg3e:~# /cip-test-scripts/canfd_validation.sh FD-ONLY
[   13.914196] rcar_canfd 12440000.can: global operational state (canfd clk, fd-only mode)
FD-ONLY
 [INFO] Testing can0<->can1 with bitrate 1000000 and dbitrate 4000000
 [INFO] Bringing down can0 can1
 [INFO] Bringing up can0 can1
 [INFO] Testing can1 as producer and can0 as consumer
 [INFO] Testing can0 as producer and can1 as consumer
FD-ONLY
 [INFO] Testing can0<->can1 with bitrate 500000 and dbitrate 2000000
 [INFO] Bringing down can0 can1
 [INFO] Bringing up can0 can1
 [INFO] Testing can1 as producer and can0 as consumer
 [INFO] Testing can0 as producer and can1 as consumer
FD-ONLY
 [INFO] Testing can0<->can1 with bitrate 250000 and dbitrate 1000000
 [INFO] Bringing down can0 can1
 [INFO] Bringing up can0 can1
 [INFO] Testing can1 as producer and can0 as consumer
 [INFO] Testing can0 as producer and can1 as consumer

EXIT|PASS|canfd_validation.sh|[00:00:19] ||

root@smarc-rzg3e:~# /cip-test-scripts/canfd_validation.sh CANFD
[   13.914196] rcar_canfd 12440000.can: global operational state (canfd clk, fd-only mode)
CANFD
 [INFO] Testing can0<->can1 with bitrate 1000000 and dbitrate 4000000
 [INFO] Bringing down can0 can1
 [INFO] Bringing up can0 can1
 [INFO] Testing can1 as producer and can0 as consumer
[   37.246104] can: controller area network core
[   37.250607] NET: Registered PF_CAN protocol family
[   37.291606] can: raw protocol

EXIT|FAIL|canfd_validation.sh|[00:00:04] Problems while producing data from can1 and consuming from can0||

root@smarc-rzg3e:~# /cip-test-scripts/canfd_validation.sh CAN
[   13.914196] rcar_canfd 12440000.can: global operational state (canfd clk, fd-only mode)
CAN
 [INFO] Testing can0<->can1 with bitrate 1000000
 [INFO] Bringing down can0 can1
 [INFO] Bringing up can0 can1
 [INFO] Testing can1 as producer and can0 as consumer

EXIT|FAIL|canfd_validation.sh|[00:00:03] Problems sending data from can1 to can0||

root@smarc-rzg3e:~#

Biju Das (2):
  dt-bindings: can: renesas,rcar-canfd: Document renesas,fd-only
    property
  can: rcar_canfd: Add support for FD-Only mode

 .../bindings/net/can/renesas,rcar-canfd.yaml  | 38 +++++++++++++++++--
 drivers/net/can/rcar/rcar_canfd.c             | 14 ++++++-
 2 files changed, 48 insertions(+), 4 deletions(-)

-- 
2.43.0


