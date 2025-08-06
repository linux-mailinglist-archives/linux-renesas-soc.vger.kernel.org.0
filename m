Return-Path: <linux-renesas-soc+bounces-20021-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC37B1C31F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Aug 2025 11:21:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 61F11183DFF
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Aug 2025 09:21:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7024C289E2A;
	Wed,  6 Aug 2025 09:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ixC2ZU6v"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA7F288CA1
	for <linux-renesas-soc@vger.kernel.org>; Wed,  6 Aug 2025 09:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754472111; cv=none; b=JcGXE2fwI/Hz0IIczB5und1iP/74D71wD2Feb7ssNKisGQI6yd+M8aTK64qujiJhGNuFtTfEipg0fEWUH5xn117MKA1IInnX83jcYGC3vC+w9rUSYr/gP84K8cFm3L19rLSmk9VB8RGcqP/eiR0s77b/Ds4nmfk0MXfSQjV6ws0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754472111; c=relaxed/simple;
	bh=o6frYcY7Lsqp/TYdOqMn+UDCAwEy/GzCfBgnWvFYZ8E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h9oyYveEbW5OqAdoKSxx+BSMGt/9QWwk1GG2sGELRxSk4rLDMq7RduTZtUz5iRsAOpcg83uEL787zYRvZFcJhhSYU7F0s87gvwi1Iy+/vebB6Bcq+BTAQbcIzHIWXrNNOyadyb8seBZOg0orIjiD38bDIXPApTYwevKmlvOkowY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ixC2ZU6v; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3b783ea5014so3128353f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 Aug 2025 02:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1754472107; x=1755076907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mCmcTtEoqltT4XvF6RcXsfvI9GESa+FLu3cPaY+Dekg=;
        b=ixC2ZU6v0WQX6LAUaysTCu4VS98/wvjFUSZGjhmMXZD1sTja6OzFhbcruMTpQC04eW
         LDJd8AW6sfDsPlbZSSaURzGRy/5/TnPT1PH990bly3yasWWRCpbFda2g03E0uwAu6+Im
         /ynKIAYKGP5JtCs/Ix7QjutZevdg6R9vSIc0EX1udGLkJ+gciqjXFPLlsZr2UrHnXZtm
         EBHiz8quhrhca4rFrRQ0iaDL2O3dgV0vDmAR5OOk9Y7xEiOEgfk5AXzRC90DDxbIKFX9
         NfBlDCG/fS1RfLVd3wPKK7Mv2yxoxSosYx4WbtI+Sq8kyG5vH1997L8ClmWyBDGtRq4H
         s3nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754472107; x=1755076907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mCmcTtEoqltT4XvF6RcXsfvI9GESa+FLu3cPaY+Dekg=;
        b=GLbRyYc10sjv4qFJ2LB3MY83C3Z/2TiGXoGS80VudobnrfJbh+n5uD0KxvPRyD0dFs
         sLX5ZnVBXfXXrDuR0y5iOQ+L+koyIBTHz2omnltZU5ltzQwo9aOZS+otFvSBATOmX1OU
         W9FDkyohoPDElHzV1rOC49SzGCorxqse/VFz1v1taX/QMQfr5PmcWs6oOhtdk/jcH8YE
         Jt5/Ob6pZu5P9CHbqwrEbvtOV4oXUAmxpHoIZbTMDh0I81juyacunCymxh4UUaXcBgfb
         xup/cW5I/50qH3nGdn1evLBUmwLCQoRv4APIU3RwyaYySe6/ftJxP5aGiScWW2GWuOT8
         Jsog==
X-Forwarded-Encrypted: i=1; AJvYcCVHB/I8jZ/hSOHyOsSmekKi1YiZ9l0RanGMWTgJvUGM1EgbjsI+afYstqasISfzO9yYKj9RjKoDFI+BA2mdGN++gg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0+PGFx817YDE03UxnALVmxj1EJEqFdOJq/Jdqf+fTaiD6Bnfc
	a2eJ4AZhNaFU/ykK6LHMjX1E/mdi61Yk89voEtpUVijMxW00lI04KN+HgsAFaaYZ8Ic=
X-Gm-Gg: ASbGncsu7JGHWtEqfbqsKGA1KkkMNrEb0+V3Ym6UpYdW1H1813aOt+4ct6LMjv4Yfmz
	qtlpKcp7PBUlyUTz22cIK/DlmTX/exB8Zupi5fPBfisJFsMCAgjsgG1rut97eQQmCBQhDYv4dYI
	BuJAkG8x3ip8mL/11xL6ynWGrTUqzG72a4oKAfMQAlFwvSWN/PNPtzLoyAiNETPVQLe6QCA/3z/
	oJefaPI6fG/82GchTNDYvcY/UPbHdhe37+Vc/PmMzmR+tc58UNgAYuLhFpdMMsglVKP+afpF8IV
	rR+obIMvH/FGn8mXfuGWRQ1X/XDW5NCxVj/HJFqSPklBp9RVkmLDGRl80Su5TvMth+4+CuqoG33
	PsdGbNoIyYMTi9H8whqf0VsW/1LiASPvUkmSO5zb9/C7+LfdnZ5/a
X-Google-Smtp-Source: AGHT+IEHNDD/VeZixPPF3+j4rzuPukE1duE4HTtuQxdZ2VnScB3EPBLRyNq5U40z9paD78Zr0FtZeA==
X-Received: by 2002:a05:6000:1445:b0:3b4:990a:a0d6 with SMTP id ffacd0b85a97d-3b8f48e9118mr1269308f8f.19.1754472107499;
        Wed, 06 Aug 2025 02:21:47 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.188])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e6867193sm30188445e9.6.2025.08.06.02.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 02:21:47 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 0/4] clk: renesas: Add MSTOP support for RZ/G2{L, LC, UL}, RZ/V2L, RZ/Five
Date: Wed,  6 Aug 2025 12:21:25 +0300
Message-ID: <20250806092129.621194-1-claudiu.beznea.uj@bp.renesas.com>
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

Series adds MSTOP support for the RZ/G2{L, LC, UL}, RZ/V2L, RZ/Five
SoCs.

Along with it:
- a fix for RZ/G3S MSTOP was included
- a cleanup for RZ/G2{L, LC, UL}, RZ/V2L was included
  (patch "clk: renesas: r9a07g04[34]: Use tabs instead of spaces")

Thank you,
Claudiu Beznea

Changes in v2:
- dropped "clk: renesas: r9a08g045-cpg: Add MSTOP for coupled clocks as
  well" from v1 as it was already applied
- added "clk: renesas: r9a08g045: Add MSTOP for GPIO" as result of review
  process
- added "clk: renesas: r9a07g04[34]: Use tabs instead of spaces"
- added MSTOP for GPIO in RZ/G2{L, UL}

Claudiu Beznea (4):
  clk: renesas: r9a08g045: Add MSTOP for GPIO
  clk: renesas: r9a07g044: Add MSTOP for RZ/G2L
  clk: renesas: r9a07g043: Add MSTOP for RZ/G2UL
  clk: renesas: r9a07g04[34]: Use tabs instead of spaces

 drivers/clk/renesas/r9a07g043-cpg.c | 140 ++++++++++++------------
 drivers/clk/renesas/r9a07g044-cpg.c | 162 ++++++++++++++--------------
 drivers/clk/renesas/r9a08g045-cpg.c |   3 +-
 drivers/clk/renesas/rzg2l-cpg.h     |   1 +
 4 files changed, 154 insertions(+), 152 deletions(-)

-- 
2.43.0


