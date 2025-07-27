Return-Path: <linux-renesas-soc+bounces-19705-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3855BB13044
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 27 Jul 2025 18:07:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 708201761C5
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 27 Jul 2025 16:07:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADA2B21C9E1;
	Sun, 27 Jul 2025 16:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VYMxq+gq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FC786337;
	Sun, 27 Jul 2025 16:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753632459; cv=none; b=RF5dxXJAYqk7bbpLJN4J7PhqwDBbh39dhOL/IRYlL5KqpBDAGbpIKxmRqYpWf0SmSdRoJJ/4xLwEaICkhPpKzGKfcNSotz2yQzWt4ICxb51FSXuLwPlwjxRfl2eD6khw7npg7hfHj7LFZMaO/l2iPK/Z7tKLPHnYLBkky/EIem8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753632459; c=relaxed/simple;
	bh=0CeknRqE0eEfZCrRsdLe+YXGsdILn1lLahY4PY6zFEs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZQhGoIn2yZ6V7W2E9LRptNVpDDMb+irritCc3zGchot0kGcwpg8tN16a7vo4KOyE/92b3COg03GAVncKpljQb4ziK3Cgk7TtCNYcTSRvbbGh3VB6zESKd4JnDMm3Yv2PRJGkt7aAwCd/KC4rd2z/PqY7EG/gIBSP7Dn4+SuIKYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VYMxq+gq; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3b773767fddso1757175f8f.0;
        Sun, 27 Jul 2025 09:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753632455; x=1754237255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tOkAOdu2F8aisPK/SoSZUBGiYlXhhPOuWigARvcwBB0=;
        b=VYMxq+gqGrNlZ0xkwE9AZbiaL3nG7Z3bpZImoR1yYHs9qWs8hqXzWCJT8j0RgwbSMy
         IvJOQgnNg2LhJoI8bbkN0cpVerYSTOhowTU2jWnPZEmhK+o5TALDBOUlqxhiY1l9eTSC
         Lif58CdpyiEylLd+1JoJ3ehcFDaFYTSUP/HEti/VDz6qBlm/SBOe5X/Gp2NDlVM0DKe2
         C1qtX9p8IB0O29z6Sp88DSD935gJ64ig12xKMiMErYv5ftDMqjkK3jS8fSC327Z1dll9
         CDcG+T7l9U9+FeLEWB6TpMujRxilb4vVEzJtYqngOlTTHE/Uj/W/jX4x/rw4+3LzpHCY
         8AIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753632455; x=1754237255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tOkAOdu2F8aisPK/SoSZUBGiYlXhhPOuWigARvcwBB0=;
        b=Xrg/F8+mYggkLlrhEZfAepV/YWUw05rvWZ1rOxLLDF5CsGwZd/3nWW5txwRn4gN+3v
         FiXhXWg9i+0X0WI0ainOYO0xSqr77Sa1hOIqC0+yx00hejLL7ZOJb/nmSm0EMKGB+SRY
         lSeucbajSOGKV5qSwNN+6eyQW2wdzw6outN7k59013egWwOWZplW1I5GfFR5SnDGg6XS
         Q5LUL1aiCmSQb8fdPOy7YNLijkj7nG1Z53IhGP8dP4S1vITEtXGL5fFzflxpClT3M+nn
         UGPJymO27rwYAlg24mdeU4YPPqqCPWuQOydZx8youvzEapavZ8HX7PJJ5up2xrW7ndJQ
         3NgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrafTvVyoREEqEYr0m5brf++TVHTpfiPVGHNHc1gHWxV+P/2lZMi3FyakoqEsgjlemMguWfihKZ4I3V1E=@vger.kernel.org, AJvYcCVm2LrVR84LdYKTM6SgW5Snbif8LbuzniMkUcnUSTLcekzSdOfvfu4kss898cD/0KmV77sI+2/mH+e5@vger.kernel.org, AJvYcCWOYfEJa+N3Fv4sFcaHhQbofcEobFRytsdg64suqcSUI6ftf8IJMATpb4rO1E8AVxA4TrcXToYzlVuKfE9eWTKIb8w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9oB4UFzxvT/9iZwWQR+pAGg5/3B9LJtqWafa4XMwR2FnmKU3N
	JbpyzF/waHcjH/5NPxvRSj3IJNltzqq0CkmTN/HzSfEBY6nWMlD6dozCnFUtkBpx54c=
X-Gm-Gg: ASbGnctblNIGOb4IT5j/QXyTmnB+4Sif08SPFho1ykI/e/LfbHqJ2LXx6sjpJo/Ii5q
	l0R/d6zXDY6R/q6jF94qxfl+ueqBl/oZAcy2b0QjZ4I0yydRgYC1ydaLbJg9N4ruAF4pc9EwkKF
	6ZEConjXGeqVpD1S0cIY6xkFJsZRMtPowIheC3TtOa09Yhcs4MfQV/XTQKnC0GUPT/CpeHgyp3a
	wgUfdk3aE2AMrP6xDfJQFSaS9GmPbUs0x9exxdNFazhC1Ua7Ia5BzjllYd2mexbapdhstArMOSh
	NYJn7BXCI2cmhHBLDH0jLk5IvtfqN8sQpNsC1jDRe8P+yE7hhXHv4qInVYqBJIARXaR9Tapqqve
	VyRv6yL2jhVpmAngOw2YNxykr+WiWyG6on336B6V8L2K7wal7k0j5AaWRQ5Tnk3m5Ry/k6beIFQ
	==
X-Google-Smtp-Source: AGHT+IE3oplR9aeJ8D+dJUnqodAsc63A55seAZ0/aiznjn5Chr3s+GYBXldiuwfaqSz6ZeN8EgqFRw==
X-Received: by 2002:a5d:5d86:0:b0:3b7:871b:8cba with SMTP id ffacd0b85a97d-3b7871b8d7fmr1160729f8f.55.1753632454759;
        Sun, 27 Jul 2025 09:07:34 -0700 (PDT)
Received: from biju.lan (host31-53-6-191.range31-53.btcentralplus.com. [31.53.6.191])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4586ec63d29sm107788615e9.1.2025.07.27.09.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 09:07:34 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 2/2] mmc: renesas_sdhi: Enable 64-bit polling mode
Date: Sun, 27 Jul 2025 17:07:27 +0100
Message-ID: <20250727160731.106312-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250727160731.106312-1-biju.das.jz@bp.renesas.com>
References: <20250727160731.106312-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Enable 64-bit polling mode for R-Car gen3 and RZ/G2L SoCs.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
RFT->v2:
 * Collected tags
---
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index 4b389e92399e..9e3ed0bcddd6 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -107,7 +107,8 @@ static const struct renesas_sdhi_of_data of_data_rza2 = {
 
 static const struct renesas_sdhi_of_data of_data_rcar_gen3 = {
 	.tmio_flags	= TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL |
-			  TMIO_MMC_HAVE_CBSY | TMIO_MMC_MIN_RCAR2,
+			  TMIO_MMC_HAVE_CBSY | TMIO_MMC_MIN_RCAR2 |
+			  TMIO_MMC_64BIT_DATA_PORT,
 	.capabilities	= MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
 			  MMC_CAP_CMD23 | MMC_CAP_WAIT_WHILE_BUSY,
 	.capabilities2	= MMC_CAP2_NO_WRITE_PROTECT | MMC_CAP2_MERGE_CAPABLE,
-- 
2.43.0


