Return-Path: <linux-renesas-soc+bounces-25035-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EC7C7E00D
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 23 Nov 2025 12:23:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD2AA3AA28B
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 23 Nov 2025 11:23:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 211B12D3EC1;
	Sun, 23 Nov 2025 11:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZxK1Tt8B"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04BA10F2
	for <linux-renesas-soc@vger.kernel.org>; Sun, 23 Nov 2025 11:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763897014; cv=none; b=rGG5TRievWvI6ILA3+NqAt5xvoq8F/zqPgiR0K5G7IJp9y1EtPGA7y6CYBM6EAEOuOXdt1UmcXlfS6b0T0/pDRtBpw/AkR20dzvbyhngQgC0gIuUeV4XNN2Jxpxw18WWSwMXQoxbGUiojbXRf8Uo+g3A68Y+dgaxIVDE+nvsYY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763897014; c=relaxed/simple;
	bh=YxkQBwXeaDK5Ahlcqc7tH6KRyGRRKLvTUkvYlpv0wpU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JgeARV+4opBomn10+ntPBMAoWXpMIeo6TuU1TZoa9+eKosZQiXz5yp2U4FEoKk5NgA9ZmpUsVYegt3zW8iwdswByBR5AQ2msBb824BrvltPrpcGwm2a1YXYP2Dp8d+G0IsnCkz1Yyh/iKt8Vp+EAl0ZPgz/cykmf63Pkob9ErL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZxK1Tt8B; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-429ce7e79f8so1944186f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 23 Nov 2025 03:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763897009; x=1764501809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gUVsPl8aKiLhU+zuYZZLZKdCn4OQAATzfIPdBb3xnLc=;
        b=ZxK1Tt8BZ3N+1VTQhHpa3hX5VpouGF6tXtHHirA8wdpH0P9mHQuG8NbZDwOL/dhyRe
         btrQKx7NjaaWJTdsPQWQ8PyPpf43xzgnOj96vXFuU/MDT2ACR0U/HXIMViSPc8RVWvT2
         tSfKyHErYNJft+3qvBc0Ymgcuv5XSop1uCzeg0gLOtpoZh+9STNdhLsfp+FuAmPz8ojp
         z1YBD/0cmMNhAz0aZDvOrbgN9CzB0Cy37bIYWaIfAXj0Zgxw+xVAgVPL+sGdmyBy98Br
         ydxLo+Fh298ewCdFM69MgS8lxCLagJe5Z6+ogU6AsTr0P2iAovtTe+z4+g8eZ3So3sPc
         mRLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763897009; x=1764501809;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gUVsPl8aKiLhU+zuYZZLZKdCn4OQAATzfIPdBb3xnLc=;
        b=sYgr7daCoT+qOo2G2mx5xWFc3/N5ONHK8P6PRqdcrmZbxzt2obuM+iMPs+tGyt0bsv
         l4r4IWSX0c2UWW5xItFc6SmMOXYQH1ixAeg9DVAQ9NSQAgWlDtSRjCi1t8qliivBcJAS
         lpEg//MnAMFQJumoNMiiILD7l9U6TvPqCS9rzlprXcuK7vPE0tdyrWbj9wuefhGWyXh3
         v5d5Vfqi9qZXurx321e6M2zcMuCZPffBzfYB7zPg2+Ry/0oULM2W9hbEQXP4k36+/hl3
         To4DUdrK04cvNrRwLTXiv+eyZAprbBXiiNIcnod5ZdnTUAM/l6t/ilwFy8clJNOjuXSy
         VHOA==
X-Forwarded-Encrypted: i=1; AJvYcCXOF3jsmqkIlH91xnrukWVGao6NfjGTwK+NZjtuVCtTdKWVPGUrVSJVb5DGVPwKlOd0SzKS6bmL7YzO74In43rg4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsUVXOGUkQ2FUF6dTjhH6PP1y5OmLRuMx3FXln94IikCExL64F
	Ro/qGHcwy7YS1Wz244NC3TmJxxHrzI1UmRXUYfe3cqCKm08Nzkdc4Vo7
X-Gm-Gg: ASbGncs8ZWxw+h6ZpvlyypqfjHnwyFRRqadQoQg3VplGeODdwj5HYefy2FuTDdRTE6R
	HZV4kQ8gGT2cxnu9/Nk+ScmJWoZp0vQccV04eLvdiqfP6epJN7AnVcppIyYQGZKtEjvzChQusPy
	ee65LR9ArJHYzrFE6E95MHms6lXBpqix+D7rXx5wg7LEKg7+feCYNR99p2/+L5N3mY9SpX96zD+
	8hzn8rxbwDk0Lvw5ybs6ZQqFRFJIAwsyddhN601L5HwKmiAUpXimVY87eL+Lt0HjaEo2my+G8CU
	drZpiIT5CrKzR9+sJihgljS+6FOx7NvEyrO8lYoje4w4cwL4OLeseMubmuq7r/NYGqhQRdIwS7S
	UUysUpl1tRG5WI/RD97J+6SdAAFQGS5afpDcF6/Xyd/VZYsZmVAG0nLxTkb4xWzssJWuul/dGul
	YY16RPMEdSFjtFvvo7Gz7hv1hCO0fw2t5+TGJVRt7gzq3zV/aR1O5Ks0N1lkzC+Tl7a/UmOI4=
X-Google-Smtp-Source: AGHT+IEx7AWatN2BQs4y2OJkC+YYVlkGVZrC6zppZE1i8KxRoEXxPptJb0e6TIw+8Q3zMRycyNQj7w==
X-Received: by 2002:a05:6000:250a:b0:42b:4961:eb4c with SMTP id ffacd0b85a97d-42cc1cd5cc1mr8751552f8f.1.1763897008927;
        Sun, 23 Nov 2025 03:23:28 -0800 (PST)
Received: from biju.lan (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f49a7bsm21765703f8f.19.2025.11.23.03.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 03:23:28 -0800 (PST)
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
Subject: [PATCH v2 0/2] Add FD-Only mode support for R-Car CANFD
Date: Sun, 23 Nov 2025 11:23:19 +0000
Message-ID: <20251123112326.128448-1-biju.das.jz@bp.renesas.com>
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

v1->v2:
  * Added conditional check to disallow fd-only mode for R-Car Gen3 in
    bindings.
  * Dropped has_fd_only_mode variable from the struct rcar_canfd_hw_info
    as it is checked by the dt schema validation.

Biju Das (2):
  dt-bindings: can: renesas,rcar-canfd: Document renesas,fd-only
    property
  can: rcar_canfd: Add support for FD-Only mode

 .../bindings/net/can/renesas,rcar-canfd.yaml  | 24 ++++++++++++++++---
 drivers/net/can/rcar/rcar_canfd.c             | 14 ++++++++++-
 2 files changed, 34 insertions(+), 4 deletions(-)

-- 
2.43.0


