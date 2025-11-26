Return-Path: <linux-renesas-soc+bounces-25207-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1149EC8AAE3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 16:36:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDB1A3AAD17
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 15:36:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEC623191D8;
	Wed, 26 Nov 2025 15:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A9Ol+VqS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A418C331A44
	for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Nov 2025 15:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764171369; cv=none; b=GIMPhKwcX16Gtn0/Jwt8rqRZNhirDLD1uPzv25Tv5+PGBMIPME/shK6OL/j67akCLchnaLORiS9PhG0wSMQ2gJTcIbjo1EckUJyzu2mvNLTnNn/htm4oCQ8wrWAmYCoDYNfY3BuoOKywGRlzEcAkq3QGvNsbTjxUikKujMLjgps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764171369; c=relaxed/simple;
	bh=Y0m7XkTikj6ospUwLpKvLK5W/cenH+bYDK4ibX8N4fA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kHhQLV3RTiHaGmUmNJoc5cZfTg/NndHT0x5eEPU8eQFnL1x7buMmHnMnBOXJtkdumJq8lQQ3DmXtSoM61bUWef2n7TIU37fSBX++j2ZASfL9/g30JgZcZoXnnG3vTPEhqHMmW0FlLE7NzrPJ0uZLvS6dvtbXBoQmruspvAT0pB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A9Ol+VqS; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-477632d9326so41131485e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Nov 2025 07:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764171366; x=1764776166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l69M0FfGvAr82YipFqTveTpBnfUfX0eUrFYwwvzwoAA=;
        b=A9Ol+VqSohRx80s8BpyHIInrvCHA81ZKZMaNTk3tWiJl7On/SeQy9EJtdPF8ZyG1HW
         WOmBkgYXM+GzQ5yfDQEp5ZItKoCkqMWzGeRf0Y8XKpUKystUBkk8V0N0mqiPIBoGoIaI
         AN1K9/Ap9yAPlQM2Y8oQhWS2X4xO5NwqdORrdNl8AY5dj+4d/al+7t5rQHtKweVbPtXo
         ftH7lUtl/e45djQ7+hazLtM7PJqMhxKcbQkoySGtDthOXY3mck00ZM0kk1bY6DdyOArs
         QxKYk0m0S6uGjMMc2CeM771M1dPW9YQJc1bjP79Zn7BHUMiZXc8Uh1L298PvCw9qvyw/
         SiQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764171366; x=1764776166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l69M0FfGvAr82YipFqTveTpBnfUfX0eUrFYwwvzwoAA=;
        b=uCYL8HbgZXJpXEUq2MV3zfHHT0vDdQ56owiWCIesAODIgxL7IhNnbXW7cXlo1+MVVf
         eAEdnprsTfYvIeWndh71JXQ+vY1CznxAEue17DNotjEM3lqZMpRBzZhImVCJiEmzrcAH
         pVdPvmsz7WazW1gcA5Qz1lOdPLGV4cj99A7oHOmuKXgXIZrRhRzca+Ck1fcQv3boOnvK
         QOKO/WGOY8nKxzyWpJppZW7yysDs8e1T+dMj5KAmqCvCy0pwZ/s9vLe/64yLT/joW/PJ
         U+TdUchjFBbXhxDj21p9k3ggc2fk7vsCHALnUXdZaqpJ8ZHxWkgJM17TKCQDqv/85RMH
         LoJA==
X-Forwarded-Encrypted: i=1; AJvYcCWVC1/m+0X6SBV/0hQomxHIEFb58fZxBA9j13H+LlC1MBRZfEMRRqaEreoRxf2+uVyZF/b2lWnM131Xkiz83LBQKg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9HNYLmpQ1KBOmbBFjy8sb6x9HKYuHUuOkakRsj42/3blck4C+
	PvyzNorNeGBEwSnDqkG/CkF6hsCUf0Cev3m9OWp3bbuvExJixw/OP/cgZzdvmg==
X-Gm-Gg: ASbGncsRB8O0r7ibI+iVg6D12ltauP+8qxxmM1bBblQ9HxeeGyT6NzO8Hu+tfBIe/2/
	u/Xh/V3mzz2F7QZICYJ7th3YoXlVBB7Ua/JxGqTaHpc6Pv7ewRHmkp9m81Jw6iw9rpzciNc5Auk
	8KpRBvitwuDlAQ3ZblrR/V7jrvyPlLMa6O+h6TYMJlEAxrGDIKL5srLoIoGWA6qYjIe6s6AdcPW
	+XINNczkPRXyDMn69p+GWYnhB5SIH6BKteztwu5hdD7peLM7zLpPFyvr/YkbeS/yawuKWKVRNG0
	EBq3rc8uXy6yRNCRchl8LCA/DQx72e0q7SIoexTpoJ/ZN7Q1TVJUpRac8bjnqzQb3gGMxiEws2/
	f2mwasAvWLCpmZU+TMvSKTwJEta6DMC4O6mWDFK1DKPIjEDzAUCbm5O1IFOcSXlEJLV2VCah+Do
	dKlpji9rpWLZlSK5OkQmmCLesNqB18CR3uzWPqHKIvyPQnFR3hE5jcRqig78LRfNHSlNK3xrXND
	dSb3v+jJkNghA==
X-Google-Smtp-Source: AGHT+IHMxbJuNqRMLXan+uNmkq60wu9fS1SvjlHE8P/M25jeGqpRmxpAH1/jCOTWsBqAIVRGO3ZyVw==
X-Received: by 2002:a05:600c:470d:b0:471:1717:411 with SMTP id 5b1f17b1804b1-477c01edab1mr255084475e9.24.1764171365683;
        Wed, 26 Nov 2025 07:36:05 -0800 (PST)
Received: from biju.lan (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f2e454sm41223775f8f.2.2025.11.26.07.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 07:36:04 -0800 (PST)
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
Subject: [PATCH v3 0/2] Add FD-Only mode support for R-Car CANFD
Date: Wed, 26 Nov 2025 15:35:56 +0000
Message-ID: <20251126153603.312265-1-biju.das.jz@bp.renesas.com>
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

 .../bindings/net/can/renesas,rcar-canfd.yaml  | 74 ++++++++++++++++++-
 drivers/net/can/rcar/rcar_canfd.c             | 14 +++-
 2 files changed, 84 insertions(+), 4 deletions(-)

-- 
2.43.0


