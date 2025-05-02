Return-Path: <linux-renesas-soc+bounces-16641-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 77151AA727B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 May 2025 14:46:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 162C93AC95A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 May 2025 12:46:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30C8822DF95;
	Fri,  2 May 2025 12:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fU2kXog4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C1A26AD0;
	Fri,  2 May 2025 12:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746189996; cv=none; b=VGV+7H/zteA7zwNbj4TUeznQsDjl9z/ZkYpURfj/dXdFAh/0tet7qSysPxh3QtBZdA0CiGyCFghNQ6rPD3dLuvMi1GCG+XGVX+zaTcu6/Tt5b06q0sO9G5fgilTaLj3d/dyJwZWom0a4gu4+nbXjDH0hVEqAFFQHpYmFJVb6G1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746189996; c=relaxed/simple;
	bh=2O/yPkPA8LmZoaEnwO/qZJZAkfgxJPIjXRlSOH9rGoc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e9Jw0CSBYBVAX0XW/NA55L8J8VBjhwCJNR7Q+HOTu7HYn8P8TOt03llXHvSqEUYBQ5x9X4PL9Tu0zUOpLcY3KJUf10FLWxXOJOMgvH/fJiVU2W4hXHb9OBb3403d69sQVn5LqX1opYytFVKG33Pd6mb4DEve0sQY3LUdGGmTAJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fU2kXog4; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso1839015f8f.1;
        Fri, 02 May 2025 05:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746189993; x=1746794793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c2FlfXbn4hS/8cFqnyoFgpNVEhmx+w6APuLnXY7ftuw=;
        b=fU2kXog4QUXJ10NW8xVpFxzRrNU3/5qhvY+9VSg9I29qE0c1R409tBj7tZ+00A3UUg
         EG2eEHWvIPRFKz3vIzKmJ7yDw4K8qGcxktW/4RbtjN0LNf1HeLBovwb1rBOtfdLn+bT/
         /2NrUgsxj9bY6Wl1zDPrL6pdGDRSvlYVxdvtT+syzCivwDiDqK7IsPSDbjMf+JLheS6/
         xIXEv3ghmQYCrNxU+EAAC3+2RU1cNYsPmOZMNZVp5wxLTHOGd+ytXlNTbVWaEYtif8Vo
         Mq6j8tvahR+folB1SsFd5ixC/O6dWe9LsdUHifPpuTkeg1mZiTQlJQ4Md8gQr9zjRy7J
         4Rzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746189993; x=1746794793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c2FlfXbn4hS/8cFqnyoFgpNVEhmx+w6APuLnXY7ftuw=;
        b=NPelH30MiTTbucMo9SfqYbfA2zK1inGluKfyh2sNfRGOtA/Dd0Hsn6HaczTgEsytYn
         1HfpIPbkUJ4Zej2BQZOiI5jb+JlSoWL89IqGhILCtxKhs9kSzcLyQ6l+12G8ZWrZgy3+
         rXNfR62LBH4pnN9P9KbLP60MBr0lfBW4+zONcpuYrfFoMuSQjwfftlkGNIBcpzS0gG2s
         jETmeLDIeQ2c0zRh8DLwpnTxh0kBUjEq0ohhyqFhXh6qtreUfyaYvuFuoJzLFB0SdCi6
         OT8xEpc1Rq46igggAR4sAQWmtThWoWsgTY6Ly81B1DIP+yLtEPCa5b5ku4eD8WOqboGP
         7jkA==
X-Forwarded-Encrypted: i=1; AJvYcCVFNh34YozG5w1cDEFh58HqiZ7nvV4WZZPV+MGY33QMUMaGedtGXdJEEF01Llh/yf7JHhvp/QARvkeX5f9pxdETkCk=@vger.kernel.org, AJvYcCVLIDmed2UODtaGRlEtY/8JqfLqI8stS5J2UqR6XEfvFNOeczMwVx5UzmqQkA/4pJqCa/B4IRAIs7C4@vger.kernel.org
X-Gm-Message-State: AOJu0YzqdBJK2uD3lNXrOFwYDmWLogYVJyCBBW1uM4WnUa3BRZS4IMft
	EMZOyCDeWhpdjbYe8bzIi6VAWGoosqPMQj8kHBD/GqrJQpjbFLsi
X-Gm-Gg: ASbGncvjaFOo3WQesPEC/+A6Mn3VfH69/2lWnuZb/WyAEwoY09CrIORow8yotJhoeq3
	dyNuyLm+rBazLjJsIRuD4Hs5Xe+GfXszoAjkGu6TwS1sfT6W68XjrHbuIsR5KgP9re/8bCC0jk5
	+Ab49LLghjUB/ylvZ6/NDbABdXedwbc7/Mf5fdk/ZrSDf/KONj/w5MkUlgd40NjYApVsbihz5Gf
	nwKD5FdtTYFUmF79D/wBwZkBEiCc9TyQqNCSaHpr7vMNM2P4cQFCt4HNiRjuky66PmT+I0eeMcg
	2vtS7h+hTXbTSH/wYZp77yPl0FtGDsaL1C/nbuSiZznhLOLJ9oKQvKCvQgVnWnSB
X-Google-Smtp-Source: AGHT+IEO0uGPBo17YbzVD8A6eqC8NmxQ95EKCHHFrtSUvfPzFyesp/iA2RvWvGw6zbn1FJK1xRraCA==
X-Received: by 2002:a05:6000:3105:b0:39f:bfa:7c90 with SMTP id ffacd0b85a97d-3a094038a8fmr4804593f8f.13.1746189992635;
        Fri, 02 May 2025 05:46:32 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:10cf:e432:b2b:bf99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b0f16fsm2059134f8f.77.2025.05.02.05.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 05:46:32 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Chris Brandt <chris.brandt@renesas.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/2] Add support for Renesas OSTM on RZ/V2N SoC
Date: Fri,  2 May 2025 13:46:25 +0100
Message-ID: <20250502124627.69644-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

This patch series adds support for the Renesas OS Timer (OSTM) found on
the Renesas RZ/V2N (R9A09G056) SoC. The OSTM IP on RZ/V2N is identical to
that on other RZ families.

v1->v2:
- Inveted the logic in the dt-bindings to require the "resets" property
- Instead of adding config for new SoC, changed the probe condition to
  `CONFIG_ARM64`.
- Updated commit messages
- Added a Reviewed-by tag from Geert.

v1:
https://lore.kernel.org/all/20250501123709.56513-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (2):
  dt-bindings: timer: renesas,ostm: Document RZ/V2N (R9A09G056) support
  clocksource/drivers/renesas-ostm: Enable reprobe for all ARM64 SoCs

 .../devicetree/bindings/timer/renesas,ostm.yaml      | 12 ++++++------
 drivers/clocksource/renesas-ostm.c                   |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

-- 
2.49.0


