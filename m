Return-Path: <linux-renesas-soc+bounces-26405-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCF9D02371
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 08 Jan 2026 11:53:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D6D6308FEAE
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jan 2026 10:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4DE848D65B;
	Thu,  8 Jan 2026 10:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="jmz/GJYZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D6448D62A
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Jan 2026 10:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767867976; cv=none; b=RyWmmrL/DP5Hvf+vZo27KZPMlUPPJZFmLPz/u2qBk2tFYBpWdvrJBlFS1UwQOOj0L9saIVdIg4jMcVWftyUxmp21UsP9yG2g/O16hw+TWybJsE7eX3lg0z0aN6FMe0c/cZuv3S6E48qhn/kqCfK74MiXnExx8rhhgwb+wjDCreg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767867976; c=relaxed/simple;
	bh=VJLjk2HPkQTQgrXKq5F4MZjwojetZEDU45326hW2YT4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=htZQZC2mZNISzlSp/zu/5cTPnsZjwM8U9yvG212yvuUMRQi9ZeqMku2lbytZVYVr36PGWcMHCht22uKe/tQ7QOENIhn8wrYhHPQBG9VgSKOnMuJ73XnviFEoY/sXKTvgNVnA84BmY5RWDY1CzZJWsbSzWhryajg1de/QpZWJTlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=jmz/GJYZ; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42fbc544b09so2119425f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 02:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1767867963; x=1768472763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rkqLTCkusDuuV6k8k6RyGMEaBhFkiLowl1AFNus4d90=;
        b=jmz/GJYZ+/FpSiT2CPD0kLPHREw3e+rnbZWE8/xDS3jDdYIusZPuBEW8Wl7QVnFwZZ
         AmUm0RlvhsjyL9bl83u80imVOo2HknU/hzUtWTujQ4fCEVC16bbiWx9wrukZK6A4JCcJ
         obGKIqXVmN4w6sKI94khJ0hI2W4jn/ntgzrEcYF61KWyGCMSpJfTZFlc5VXe2XjzFzYA
         ejjatPBd+uBrAtbzB9TFqkOB4WwRE/EbA1hjsDrSWi5QCsDlgNRLXXqJ9z8NG9upzDoV
         QOAs5UEkN9sB1gtyhfzuU16E3k64Zy7LVuEOYf9N0J1xxsBZMXfi69S6dZ5cOruqkVeY
         R10A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767867963; x=1768472763;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rkqLTCkusDuuV6k8k6RyGMEaBhFkiLowl1AFNus4d90=;
        b=Yfg0bjc2rJTrRkPaQTcjck58dqYNEltuExhS3jG/2m6fQxD9rmE+0oaZAkd+hi5O1L
         sQ97bWj4Lydk5Vzgef+Mr4B2lOTUKVTknlks9NfgG+CjXv7H3rkzjlSFnTId7LS+CiGE
         SXG+yjKpieg5xcbosI0HYnkX2j2H2n59qJGnPm3dq2QJj2+exEKpwOnoCCVGPiBtWgIG
         BcMaUy/9dNwNIvR+8YY7A/4+75j0v0rpwjnNvovQcQSNkgwdK30LdibSFVLPmLhQeSQ0
         wm7pgvMAVt8iuPs1/5FTJjSHjgWpQY0sfew8pGfhkiPV1XPJ+OGD+45CA3DQGYGk0D5u
         UnlQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/W05xug2uBsOFLSGSvKXsi789/US3wOvfU9kg28JVAPgkiiuuUVOdhTRBgybB35Lm+TGP74SGGYjgFv8Fou21uw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbPogD9sxhc6Hl0XXUjUSveQnfbp57vQ/e7g/I7oEdFm+3vuEw
	/FoiI5iHtyw/GbGjb5a/B0qpcj9BbgOUnDe5v9T+2V4z2hmpO4Jidv2vjpnccBRPq0M=
X-Gm-Gg: AY/fxX55q7hr/Fxa9gx5ZUwaZSvC52jzJkdz7qJbNS7QchuIAr4RjdaWUH3TB0E79Q4
	zg9iIqjwEesVlp9i45coapKM4Gx4qz+OH1RcHiInRG0kJs8J4vafzs6HxHcnWGRDuJrwkdhSp6Z
	RLWRLQ72sWus3uSVeafgXfSrlwXreMV7shZQ4zKyIYytzYyan8aWvV9g8wD3AazW+/D6FkMjCgp
	0JkBmFw/0kPo4HYPvL2oUKIJGhADj9WBKUwFHRNId8Ifz0s0ACDq1UNJaI4hwWGK+FZO8c50Q3Q
	LZ7HzrQrmMvl2XrhEqeLKx+dFC4e2ZXq22YmXX9psbAY+C798gUQJsVTFOpIZf4/3VCP0EFGy+N
	nPeQzd8HWTJLNMtxiB14V7pUALFrK/pSnVv1ojFDTo4BJsk5hsch3InSmTlcn6mtt+BxxgKdCc/
	1Sb5xStz6pJjHCci33ejZ+a6ImoJe315Xa3m2/sJE=
X-Google-Smtp-Source: AGHT+IFIKBRrvssFrTQyYPOj5ECr/jPpCm6rqmLigPfd+a712/rn2gjCa+Acl8LSJLVHJVmyUi8C0Q==
X-Received: by 2002:a05:6000:2511:b0:431:48f:f78f with SMTP id ffacd0b85a97d-432c378a79emr6509768f8f.1.1767867962395;
        Thu, 08 Jan 2026 02:26:02 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5df90dsm14925966f8f.20.2026.01.08.02.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 02:26:01 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 0/2] reset: rzg2l-usbphy-ctrl: Add suspend to RAM support
Date: Thu,  8 Jan 2026 12:25:58 +0200
Message-ID: <20260108102600.3477012-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

Series adds suspend to RAM support to the rzg2l-usbphy-ctrl driver.
Patch 1/2 is a preparatory change to avoid suppressing any
configuration errors.

Thank you,
Claudiu

Changes in v3:
- collected tags

Changes in v2:
- use pm_runtime_put_sync() in patch 2/2
- collected tags

Claudiu Beznea (2):
  reset: rzg2l-usbphy-ctrl: Propagate the return value of
    regmap_field_update_bits()
  reset: rzg2l-usbphy-ctrl: Add suspend/resume support

 drivers/reset/reset-rzg2l-usbphy-ctrl.c | 105 +++++++++++++++++++-----
 1 file changed, 86 insertions(+), 19 deletions(-)

-- 
2.43.0


