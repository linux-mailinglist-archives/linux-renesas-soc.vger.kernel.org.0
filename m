Return-Path: <linux-renesas-soc+bounces-23909-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA41C21933
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 18:56:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D9EC74E746C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 17:55:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 264342F3C20;
	Thu, 30 Oct 2025 17:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cRkeRV1T"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA6B36C256
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Oct 2025 17:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761846933; cv=none; b=V++cOScOb26CEuFG9NNI39eualJMecT5G7wm0Uz+WiCFnpVEnNai5gjhdb2rgLtbO3zsZMRZoQ1n2hfdApAIymeVgYdHCwENhJ5uzqCEt5zbj+KS1vemV76jOpDUOj37fOPPLkd5k/Fdp6tWN4jcAwdb1qU15Oey5ylTXzjKP7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761846933; c=relaxed/simple;
	bh=E38nvu7KZl9ndawJz1k+ZLfO2UIk6shCOOTboPNO/UA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YDxliWoZZXIRUschJRlAIWiUARjskU5ze61QFRelbx+oxw2wXnI8LRujvHStuj4Y9S9DWhC4BJUHmBd8spuosLnNuz1SxN5Z27/6ly0M39FQyVA+cXzyGm/zKh3wrQSLJLxwfD93Y7g77VG0njG07iLSFWznyoEUHGd0kXOvolY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cRkeRV1T; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42421b1514fso870303f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Oct 2025 10:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761846929; x=1762451729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1gzjCSWSDa5dSUjUZXovzi8Fx64Uy71ap0+jFlPPV2w=;
        b=cRkeRV1T5aFp6KPNiZh69cIJ8Kc8DTiNNNAn+YjTJlvGD82sQCnWquAAqvJUhUSWeq
         /MPtMh+uCAzNi5lOgP3gwQMeXEX2tIb6u17t3a7iohPBJ2lsWPSBvqVpgAnV9jCDsOBI
         VP0l+T6/MGrA4X8WCjop1uv9hctGon1gcYFUc8C1eyCS57AHo7Ewb+mNmA7+g2qExbbn
         vcdI5wHLUtCd3Id1HvcXYB5As6or42bk57xIOjSPYoQdobpWiLmGNfq/gnQhlEis5NfO
         ByX+onyrwszfNHaG3RXHb/2gNMPdjd/zpg2tEPH0wQs65oLZCNGBpwF8+qhTfddhBWcL
         o7Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761846929; x=1762451729;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1gzjCSWSDa5dSUjUZXovzi8Fx64Uy71ap0+jFlPPV2w=;
        b=ok/sNtsbzh/e89stcYGhAZxujVVpc2W2Ou/ZFRqoBvwzfYvQjCzF/uEBX48yzEoxdw
         mcgbFITdbGmxaYSCvJ3da9E2S94N5o6eIAve0p1H7eXiFs7Iws87s/QOrAfBrnPNRGz/
         ZoFM+tqjXWdHUCnN+LpwXJgNCC4KrcAJbZHbj2SvsMVswrvw6ePNu1aqZ0Q9R2Ury6g9
         J7cc3OS8jkCodgacI0f4YdNPge1wtTnitPsDs2PGIrLgx0Al5Xrq0Ipn90fHeSt6E+lA
         N8Mgvla7ymdKzPiJRB9G0C3YDJMeal6sySf+mUosgFw1Deh1btS0RItaY5YHPw3oRE04
         34eg==
X-Forwarded-Encrypted: i=1; AJvYcCVat7SVfc/6vyi3LEotw3PJH1GrEGCUh3/2a8hnPewW5vZ1JaTedCzpXycbevMmVH/3R8vP0LSE5h05uDNdeXOW4w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyggs9f7IMAJVWkF1MCbTZmURhvqnRHV8crYT+0sr898xEnhQt/
	lBj0Jw/pRFd3ZcFYDfcJXlU1s9ALm2TQ5n33Zql0BZA8onvtQAws5ZXTWmL6shur
X-Gm-Gg: ASbGncvfhQQikAsx9s1R8fbKTNgd8Wd2vc7/q4FB2EgBB5GAlXzwdq8yQNVGswSE2OE
	occqFh+SklfrxxAOHvVa6+VKVSjjRjt7RXbltVGcr8WFdKqo7RlgzFaHwWJ760kdD9g4janqBhR
	ig05QMfnuDUydYZ0P98Wejze6RzDC2zV0O9hjzJlUo+7qYLuhhaaK9+twaD1YIa4kXso5Xb6ff4
	OXa/cMGXzaaFQpZYuhHzAv1t5AoD6VL0D6OmSD3kNvHcZ0sG0HcXYtB1WCU+uKmrokHAfcQSJt0
	Lx8Kzm0R+czCrf+uM/CIQb8UgFpDjZmDixlzuUQl31+NBznS2dmubZOTo28AZw02VtNsQBgGwjv
	d2MwoQVYALdDFLjRsLIJpngfiHiQbCt0JgCQhhOM7URnwSRMS5/YBqkivQVVmJSmMyPy03sbrAo
	Cx10iAXxQXsrdjZ+f65UxN2X8B8GBqPwx5/GvidB1s3ldzBSTzKqTLwSyGjc43
X-Google-Smtp-Source: AGHT+IFvVMZpr26r2oMzIBqKA97uZXvamh5HEXytVmPS+yPwKWlEnWn5bt5lEiXlmDbS5Rh6odZSCA==
X-Received: by 2002:a05:6000:1a8e:b0:429:8cda:dd4e with SMTP id ffacd0b85a97d-429bd6ada5cmr389977f8f.32.1761846928726;
        Thu, 30 Oct 2025 10:55:28 -0700 (PDT)
Received: from biju.lan (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952de5f9sm33384041f8f.38.2025.10.30.10.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 10:55:28 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 00/13] Add RZ/G3E RSCI support
Date: Thu, 30 Oct 2025 17:55:04 +0000
Message-ID: <20251030175526.607006-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add RZ/G3E RSCI support for FIFO and non-FIFO mode. RSCI IP found on
RZ/G3E SoC is similar to one on RZ/T2H, but has 32-stage fifo. RZ/G3E has
6 clocks (5 module clocks + 1 external clock) compared to 3 clocks
(2 module clocks + 1 external clock) on RZ/T2H, and it has multiple
resets. Add support for the hardware flow control.

This patch series depend upon [1]
[1] https://lore.kernel.org/all/20251029082101.92156-1-biju.das.jz@bp.renesas.com/

v1->v2:
 * Updated commit message for patch#1,#3,#9
 * Added resets:false for non RZ/G3E SoCs in bindings.
 * Increased line limit for error messages to 100-column limit for patch#3
 * Updated multiline comment to fit into single line.
 * Updated set_termios() for getting baud_rate()

Biju Das (13):
  dt-bindings: serial: renesas,rsci: Document RZ/G3E support
  serial: rsci: Drop rsci_clear_CFC()
  serial: sh-sci: Drop extra lines
  serial: rsci: Drop unused macro DCR
  serial: rsci: Drop unused TDR register
  serial: sh-sci: Use devm_reset_control_array_get_exclusive()
  serial: sh-sci: Add RSCI_PORT_{SCI,SCIF} port IDs
  serial: sh-sci: Add sci_is_rsci_type()
  serial: sh-sci: Add support for RZ/G3E RSCI clks
  serial: sh-sci: Make sci_scbrr_calc() public
  serial: sh-sci: Add finish_console_write() callback
  serial: sh-sci: Add support for RZ/G3E RSCI SCIF
  serial: sh-sci: Add support for RZ/G3E RSCI SCI

 .../bindings/serial/renesas,rsci.yaml         |  85 +++-
 drivers/tty/serial/rsci.c                     | 412 +++++++++++++++---
 drivers/tty/serial/rsci.h                     |   2 +
 drivers/tty/serial/sh-sci-common.h            |   9 +
 drivers/tty/serial/sh-sci.c                   |  67 ++-
 5 files changed, 492 insertions(+), 83 deletions(-)

-- 
2.43.0


