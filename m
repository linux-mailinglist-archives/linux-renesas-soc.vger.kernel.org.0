Return-Path: <linux-renesas-soc+bounces-1261-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3C6821AA0
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jan 2024 12:02:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE15D282AAD
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jan 2024 11:02:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A893DDC7;
	Tue,  2 Jan 2024 11:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="QpkwuAKI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4492DDAD
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Jan 2024 11:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3373a30af67so1779889f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Jan 2024 03:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1704193336; x=1704798136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YNkzD5zb9njcCx0vZ1b8LhvhJtEiy9sSNkU33s6Ms8o=;
        b=QpkwuAKIDPD87V5blayD2BznfUXpz+EZjreaCyYdfBL50druAcodF67sDfeIhf6bmC
         wglfKYHNajTgLHy9m3I0nYkzcTjRNLaUMFKFwADdr/x03Pog4epWFaCzoJdFSFnvG7n3
         WiJaxa09QNZ4eNccNcrjpA9NKSRWfmXVi0lf7VcIMUHNR0/PIbNlHfuujOv5Dv1ZO3SG
         C1XjrBSPLaJQPLThP5/9c+Rlwr8AbyjRZW6y0KCelqKNWyJ0SlT142U7YzkzP6PIPYi2
         Cxizg+3zutRdr1HtZGly0PUA8boGnLcv2YsVDkkeOHUmOCGW96KR68mwa8Wzy2KqQZLF
         jYHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704193336; x=1704798136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YNkzD5zb9njcCx0vZ1b8LhvhJtEiy9sSNkU33s6Ms8o=;
        b=CfCwcYX3E39bL/O0p4ZjxdK9beGZPkH/rp9uVHAJLUN9I6rYL+C5gI1yuGLg4QLD6E
         JuY84jucp5YhgZl8iRqUZ+VB9toVfNcWieozLMx+SWouALzt5UYXcD0stSYRnojMguZP
         JXWcG22Mtr/HIfw8O523DgxF1B0Qh1ybNU66Vfm49nNvp4lW9XrAvVEEmVB/RPx5b5lF
         zAvduSes//BK3fYoZFPFGxd8fkLtLKH1zIavCG6gbboq2tDmveGOn4Ihxq9GFBb0R1Ql
         P479Ghjtu+S7OgKqJ6T5D2QX3OjM+GtjXXBMHk/N46hjO1wK21HhGNtmpcIHSvpWemlX
         h5JA==
X-Gm-Message-State: AOJu0Yxwnt+cJD1Nk62LwIxzbW5UAOZNlxIKdESYztvkwJn9fLyPEq+E
	nKrpnUVYcvVxDhZMkAqqTdwH1YJ+DO4gIQ==
X-Google-Smtp-Source: AGHT+IHSPwvftzsShAfp3RqKi8xUNIaJQQWio+a7Wuf89z50BJDygo/PhLL41rlBR57mF8CZsuQ0Bw==
X-Received: by 2002:adf:ea10:0:b0:336:60f7:3951 with SMTP id q16-20020adfea10000000b0033660f73951mr6901281wrm.162.1704193335805;
        Tue, 02 Jan 2024 03:02:15 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.5])
        by smtp.gmail.com with ESMTPSA id l4-20020a5d6744000000b00336710ddea0sm28174229wrw.59.2024.01.02.03.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 03:02:15 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: s.shtylyov@omp.ru,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: mitsuhiro.kimura.kc@renesas.com,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH net v3 0/1] net: ravb: fixes for the ravb driver
Date: Tue,  2 Jan 2024 13:01:15 +0200
Message-Id: <20240102110116.4005187-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

Series adds one fix for the ravb driver to wait for the operating
mode to be applied by hardware before proceeding.

Thank you,
Claudiu Beznea

Changes in v3:
- s/csr_opmode/csr_ops in ravb_set_opmode()
- mask opmode with CCC_OPC when retrieveing csr_ops
- in ravb_set_opmode() updated modify mask passed to ravb_modify() to
  include GAC and CSEL bits if these are part of opmode
- s/failed to switch device to config mode/failed to switch device to
  requested mode/ in ravb_set_opmode()
- s/operation/operating in the title of patch 1/1

Changes in v2:
- dropped patch 2/2 from v1 ("net: ravb: Check that GTI loading request is
  done")
- kept a single "Fixes" entry in commit description
- updated commit description for patch 1/1
- introduce ravb_set_opmode() that does all the necessities for
  setting the operating mode (set DMA.CCC and wait for CSR.OPS) and call it
  where needed; this should comply with all the HW manuals requirements as
  different manual variants specify different modes need to be checked in
  CSR.OPS when setting DMA.CCC.

Claudiu Beznea (1):
  net: ravb: Wait for operation mode to be applied

 drivers/net/ethernet/renesas/ravb_main.c | 61 +++++++++++++++---------
 1 file changed, 38 insertions(+), 23 deletions(-)

-- 
2.39.2


