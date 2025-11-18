Return-Path: <linux-renesas-soc+bounces-24721-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C02C69F2C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 15:28:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BCF924F4DF2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 14:19:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88D5135A95B;
	Tue, 18 Nov 2025 14:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NM5rtW8k"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98332EF64F
	for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Nov 2025 14:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763475526; cv=none; b=AuHhz7h7yiO3SqaBOBPkeCd/ziQioXbvzCwi0lA6dsoclNtBydF7bk/5CVPGJbjZG7qv+zdT1WIUhm3kf3Mu9HeHi+AXIV77pGNkTV97e0MJ5aJmOAXFEbov3Jf/CBd85gqseUmDMvpSVlxn6vmtMDJQgkQTOuGeIBpkTKJ/b/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763475526; c=relaxed/simple;
	bh=XNm5SEXmvtVWoiWQMxPFHwO31RPeOhsDsE+mz8PKG44=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i6uSwrmeNCL5m35Sr13wMBVr7ohjf4NtTYk4MKL3dWlNGdtSaqx70ZFRb7K4smOuHO8z9gVhsfUP/ZLjeechg6FgR8X8dtDvrYbmQ5qD3V4x2ilbLrcwtqUmBCkDtiHdGUi0Kz9K5zyXSkyJU5LFqplzn1Oon9z2St997gT0/QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NM5rtW8k; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so25525635e9.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Nov 2025 06:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763475523; x=1764080323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qui8+v84SknU9Umcah51Re9uxWRY2Ng9adbI5wD5LWw=;
        b=NM5rtW8kzghTCE8mD2wzh9GzgY3ixymPOIZh8fwU6HuPEREYigsSNL/t/gWavUstwG
         FGZ2fpD1+sxOtJ8/yFvB3djjIkrckrj4731zQa31xnWVPmAWmEJLqWUmM+Rx9Iypms8J
         70qE4HCKYedjRe9PKfR1+nfsb3D2qLVmLGQMAMQs5VRyZ24beprdqF1p/rzVSxCpZqdt
         DSYEJyu7s8AG5k5lm3wTSysqU40abzs5eeD/HlMuuWPqQVSKCsGdnrx5WQQ/BqZXJrIE
         uiiKrKOgBw29vI90TKI7n7gIHK/Q7bpYqOkmhkjROGXapWobqmcWNAgVstHiAdabiEk7
         yrPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763475523; x=1764080323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qui8+v84SknU9Umcah51Re9uxWRY2Ng9adbI5wD5LWw=;
        b=fm4lJ7zcxZL9pQB2sVmk7XbMJt8HjcxbWY/ylpR7gbexsGge1+ELaQamcZQETlGfCG
         JlFQqCmzuQCTYoaL38vJfuWunCFvA0Ms/oIHlkfhnZNexc7X8TzOZdUbyWSpuOwDwnJp
         eQYoP1htzYh7XPar6b3R1dlnaoAho6l2mtlcPJDEuM2W7OT2HarJnpC9TKheNYn8tZvX
         svpS02T7g2/vIBoMBxtjDSvtZkG9MEfQCbkxvye7JVd4NZ+1azR5MpvS3Z2zKYRszoxq
         LDb5tonc8Hh8aZz/Yrc23svUubPOVeVelT1sYkmC/iE023PIJYjJbzW/gub48jYqHtw8
         upTg==
X-Forwarded-Encrypted: i=1; AJvYcCUXILSKG8Rv+cGLL2PvzNyyCIjqO38s1iBANQHeY+5k/wDasiJiqIYjkNd/TU90IQUVc/TXfwlYePI7+OQ/qFSH3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzC0u3N+D2nM1oqnliqvXqSzRFPAWqlmtteuldOl3yxlOi5qlJl
	JJ3rVoRKNU1prCf/ZA4QSG9J6AIpW+/wdrm9SPzfagpVkddDbwf2URc+
X-Gm-Gg: ASbGncsY+YymlNA8O2WYm4UMcSXidawn3HVZjS33JLwGOhDsjxLsrK1k27ksA49y49C
	kMHPXyDycnrclaS/b2Z8qxvIZD/gEn67jZ8yYqTQzlQN6MRCIoeFNBUwcZt05fga4DqOhZ4qo+k
	LU4fPRjfIgfZ9Q+R7AIrDx/hE3g9cpozW8V2xECCj1tLfgWMJV9sWMAulCxqjeJ46h5U3kXr6Um
	k7IfNvuQ/N/JthMkkDAsDgGVzVbJIPt03CJQCgyT9doyXgYzO72DdV+RYozgty4jeAKCM+f+Znm
	R8vKkHdgwuU8B15tkrvhsNpLkNU1U2ykyRPn/c+v2pcSwtfTOtb/GrA629cBbF0VTHRdmSrWKAd
	xdi02N7flLtqGxQ9LYbSE4zsTWlHHEfJTyHRl0Pf/CBPZ8PF6Rq7RVCN0iOZ3cKEqyPXVA6WrBp
	gD9TmZ48LLGpZIu55x0X9uDBERIx7MZ109L+mgvpqy7Np8GsBvGgaRQth0fc0dutwINbg4uSCM/
	V4Uc65NNsF4QKp4xvSDSmUPm4M=
X-Google-Smtp-Source: AGHT+IEqBD2t0X1IvlWqWiTrU/qzZiudDobdZc0iwHmOZRbMqQ2xWtFwlEkf0u9kPWTAvfeL1+PLeA==
X-Received: by 2002:a05:600c:4685:b0:477:7a1a:4b82 with SMTP id 5b1f17b1804b1-4778fe5fb4amr161762895e9.8.1763475522805;
        Tue, 18 Nov 2025 06:18:42 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e85e6fsm32487590f8f.18.2025.11.18.06.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 06:18:42 -0800 (PST)
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
Subject: [PATCH 0/2] Add FD-Only mode support for R-Car CANFD
Date: Tue, 18 Nov 2025 14:18:33 +0000
Message-ID: <20251118141840.267652-1-biju.das.jz@bp.renesas.com>
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

This patch series depend upon[1]
[1] https://lore.kernel.org/all/20251118123926.193445-1-biju.das.jz@bp.renesas.com/

Biju Das (2):
  dt-bindings: can: renesas,rcar-canfd: Document renesas,fd-only
    property
  can: rcar_canfd: Add support for FD-Only mode

 .../bindings/net/can/renesas,rcar-canfd.yaml  | 14 ++++++++---
 drivers/net/can/rcar/rcar_canfd.c             | 24 ++++++++++++++++++-
 2 files changed, 34 insertions(+), 4 deletions(-)

-- 
2.43.0


