Return-Path: <linux-renesas-soc+bounces-24541-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F17ADC5648D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 09:33:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 234004E562A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 08:26:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9272A330B2C;
	Thu, 13 Nov 2025 08:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XFawGo8e"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D962C32F770
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 08:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763022357; cv=none; b=hapxqr0G+ZMJxycdY1HSz5yAnjCcux2yJWxQv0nDxAQNtw3pyAN1kIXDQCvTAgjAodJRWrcqnr7TevmhggG2AjWzsNl3IwG51XnfL4zx2Tx12c3ON2KTn0rf7aD+mclS77Wk56pE/2rsKIg6/wFm+xKiWBvkz8kUz3kZGSJDQhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763022357; c=relaxed/simple;
	bh=WYdmv/wAmH2bGHrjDBQy2zbnL0MTLz5879jybyLc81o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KBQeoSPEBFeRoSA1nHzeVL9hwnVlKq5jGvqkNILdnpK1tF/JpikzAPbnSzgJxs7/KsKdNVQNcXlyccEl1CzmHJSqTgxvRSgA9a7y3adJimrCTiKL7nG+vC6CGq67Duth1VpJNYTf89OrjSPW8aR3GjPhMyO+NEp5YfARsIabjPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XFawGo8e; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47774d3536dso4234765e9.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 00:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763022354; x=1763627154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cj5Mpbx2CmIrOrUNCLRh4UEGcYcMlUJdEeSo8yfEOjw=;
        b=XFawGo8e55DVLjswPC5gT71u/CRUcx540DjIBfviAfhI4d27uFDP40/tF6O/Afub1d
         8NywBPJRNc+5m95v8i4/kUmc/TBs7PoGVCguYotxQiUn051QuOXTSlGIttg8/cC5oWMd
         6K/NDNsmPfiuIdOV2lyqa12iymaW9athyWDWyDVBF59g5y8prqd+s28vY/IUjdUamB72
         iGpHe4rX4VqqRJgCmMkhIavTXgB8K4aMXdyn3f2+WUoKzPKpjcDrepywYdg7TZ8CHUfh
         AM6WZfByva99vho5EwFooGOObGxXyBbF0WHoij0ju2XCEu8bqHT4eOZ3PNR18SjoWIQU
         +9YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763022354; x=1763627154;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cj5Mpbx2CmIrOrUNCLRh4UEGcYcMlUJdEeSo8yfEOjw=;
        b=WI8TXZpX3xXLhoqntu5fzAbouoAN8hC5XUhkJq8ke6rzuTpseb9I0OuRDe4n77X9cN
         s2shABHddvQv+/o3VOHu6+xSukASqSOTR4GX8W7nMrV7xDttNCSrlTLBfu8i+4fH3S9j
         UJQ395hO4MPFIxBDW0DK77uClEeR4gR9FbJm6fQGu6QxY4WUo283RemdGzmL/MPrk78R
         yLghUaRGrV4yRmT7yjyNDboDuh8h3tPCWJs/lTvqLpQvZzWnOIHc3VQ7AcISPnR1kplg
         Q/0J0tS62mxjWiC14P2UJhHf9FXh3HJ2TxyqiDS1jU3/3kCrJO0euVSR0w0232mFjq/j
         jKvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWI+rXsUQYWGchx1zeKTKX3cilaTi41P58hSsGMM6lrMG3IMzHdVLVxceeeYVp4f48nz3nxgqkkm1wh+qYSppB/MQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkrwiJdBAmYfVZMLJE5DsvebeZ0FTeefakAJQn7gSAFhwG1luA
	8RXolaN1FlBA9f4YYd1i9EdofQNxApGHP5Lfoyc2piQMq4r0oBt4mWTA
X-Gm-Gg: ASbGncuSFDqHSsLVvdIiI8mBhdGbqfuHWVI65zdgCNYHCBIh4XeXhO/B8vNgo20xQN6
	XsBhzGtbNmSYEs/0nza0ZPQNHGmTHfPRIyPaOpw7DR4KzVQypqoKeNfitxDAAvuFgFyc57vNVPc
	3JNDXdZMM71aAvBBd1D5Dgijq9mutPA/kJHBBfIfi0V8ow3VrNPy9AgsC0kIwtPaoqSEltkVBn9
	5uVXZ6MzsEaDjnv8Y3Iz0fcbuAz7Db2L1lsmGNsKW1sdVWBhAP8i0w/KZ43EnI28ejhtKxt47AS
	90hgv0RWHOQWSX1t8xkVvDM8lL5mo9D8GQuLoGI2zMrbhWMIzYDQf5OsSBJWHPpQcnLMa4wdyfY
	hEZzJfaGZy5U2n0gPGSax77EMPHTWV6UJ9eyW7M38HqZ8IgIJHj/OAWNr2vTzyGOLkr3UIvSLc3
	lDwSgi59xi4F6gkhppkMc+ycnpilh2DJBcl0Emhbg8WvdVVK0r/eSJjS7lWVRZ
X-Google-Smtp-Source: AGHT+IFdUK8abWe3SfpGnIIlg1BGOiBLzAf4aJxdLNUOGmaJb0G6Z+ySoyP9XzrZjNZx01XS41rQEA==
X-Received: by 2002:a05:600c:470d:b0:477:bf1:8c82 with SMTP id 5b1f17b1804b1-4778bd744famr18919045e9.15.1763022353933;
        Thu, 13 Nov 2025 00:25:53 -0800 (PST)
Received: from biju.lan (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4778bb34295sm15214435e9.2.2025.11.13.00.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 00:25:53 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 0/2] RZ/G2L SSI full duplex fixes
Date: Thu, 13 Nov 2025 08:25:45 +0000
Message-ID: <20251113082551.99595-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The first patch in this series fixes audio channel swap issue because of
half duplex to full duplex switching during the streaming that involves
FIFO reset which drops the word leading to audio channel swap issue. The
second patch fixes sample width value in the hw_params_cache::sample_width

v1->v2:
 * Split the fixes patches separate.
 * Improved code logic in rz_ssi_start() by using else if
 * Collected tags from Morimoto-san

Biju Das (2):
  ASoC: renesas: rz-ssi: Fix channel swap issue in full duplex mode
  ASoC: renesas: rz-ssi: Fix rz_ssi_priv::hw_params_cache::sample_width

 sound/soc/renesas/rz-ssi.c | 66 ++++++++++++++++++++++++++++----------
 1 file changed, 49 insertions(+), 17 deletions(-)

-- 
2.43.0


