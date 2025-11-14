Return-Path: <linux-renesas-soc+bounces-24621-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E718C5BDFA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 09:01:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C0454203E7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 07:59:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7E022F9D8C;
	Fri, 14 Nov 2025 07:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="encw1fIm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7E72F4A1B
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Nov 2025 07:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763107142; cv=none; b=f85jmRsguPQK7GXzwQvM37lc/cyVFdJEoR10xcmOsNBnl7EPzEI1a2KWWxtVdLgyrJmgOI/kwTxUn25rv47l55qjjVc6WyTFxXqO4ti+RSyQxZY79ScQJBJBkM3wddLHJytSkchHltodT+9Fv2Jypu/uCz/tKvlBP6j7m/kAt94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763107142; c=relaxed/simple;
	bh=K6kFMsWtM1uT0G8v+wllECV6TczozdzJfUeJP9AdwjA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lAZM59HkYimVnON0uPIdG4mkDATmlE6p0aRUdD7GhVLAK5IHeqMbvkbdVDZ/ZUl+n/79vIKMSNI7zBxTugYiVTyTcgKdnLXQRjYzcLEFwU8nOS8/WLAvbe0WMYzhQ5Db1fLfyCU+x7Rc7R75jhCUIpFXis9YNIJh7v7xNLTtWtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=encw1fIm; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4710a1f9e4cso12081725e9.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 23:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763107139; x=1763711939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4nZcF6rR9cWQwcQ6vkLS/sjYhQpkMylvaRplPyWi7Fc=;
        b=encw1fIm5oKHGySsvLo82gAcZ+KJUj6exNGuzvw1jxFejlQMu/lLjBx2HzZynSo9A4
         vLAaqs3rVpkaZACxoMT/HrwBDZYsaaBEXW3tl5a51awsFU6q0MGLuKiCfJ88LQBjbZmf
         j3nvlQOq0sx0b97rdK7c1l/2v8E9lOrS2NcQzvJpkiWVYL6kknFBwqAD/dbz3VOjbde/
         z9VvQP7UmXVkr9B6hgPvEVO/2shGuV+ucsJGYi2slOLgJr9W9EqiLbBCCsM2ffbGuoeU
         qyyrmUPFIFvbFKnCYDbQWVycANA9nek9LLr4m0D0XFVvFWAaa/6VC4vxA9auOgRhMxpT
         xdiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763107139; x=1763711939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4nZcF6rR9cWQwcQ6vkLS/sjYhQpkMylvaRplPyWi7Fc=;
        b=VTsW1Sx4qSD/nCjFJ4o9kDJ/5GKec3j6nwAIiVJhIraO+WgP4ItBD1Qug1m0ZbJZ3q
         GhwCUyIr8YiAYYQY8kF6uD9AKDfWlaKlQ5rczUiX+Q2HHv6pBj/Og1k30Eh0XGa1S+ng
         WAjHWjywSwuFTJhd/GSaCKJnSJlP8FYIJ8da7Dk+5cEdIL51OzoYLWUfWd9yThkUi0ia
         TKCaZcciZgFDl+a8qdGuzGZd5bRrjNaLJEEsvwwyHDs7rKBlwfTxQTj2KjNtN95mGmow
         sq3+5XV7WXY+XJKsR8/Z988Is6K+x51AqKzoiI21ai6O1IYvHPsz2SMdnUY3htbNjUlm
         kJ5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXkvf+IhO1A9jBioXTDKPoSvptb0A3ui+KbatTBxEcKT7jFhcCVwQn+iUQo3VedsJThieDXjJan+rprR4ceDrllIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YypwSwWuBSMYfLXCX120Q1L5ziiGokbAJP0jjwxTA2msc8/VW+l
	sjiv9PWQQdlIZ5MKlQ3nBxEPF88UN4OMv3TqbxmDfur8xaYZi4rducD2
X-Gm-Gg: ASbGncvwAXfQB6Vz5zTdKu64pEXWa6x99rgC0c5A1iypVEcgg2NmHBElcXHN4mSYw91
	n3FFwQmEejyuzd3JbtAjTtZDHmrsx3H2zIMgpQ3rEfp/WArvOEcdRpXDYPYvr/oodnSGOg4XlAK
	i1CBlUSkQZsrhdEbSFRFsAROBcPeTC/DehZ8UJ0uBGtYPoeMAFCAULs4CiuzmMzOTs/ejRvnPi/
	KS30q3tOObGUAL2hlr/DyqRHHyt2FgfOj3NL8FM6/KqdxrKix8qE0IF3hvv3umQTyVqGSM/YhUU
	Y3IteXgeQUS6+74c7jmBvqL8qKw2nMsvjPbZcEJoA6aqHBQsYxIEZJR+CpvaLyxDVzdRkb+8lwN
	hbOjmNg+lCACqEtn9dHPB7eOSkAm2ingk1ANxcM5Nb80bfzq80cYviPM5BlPXvDSLcBNafR/rek
	YIGz+bougxcUmm5mI2WBTqDKDEZd2BGoaWOaFMAoLNOd18uH0/K5MGJMGTdapefw0KN0vKb5mzK
	tIfVA4KG7Z7M8kz
X-Google-Smtp-Source: AGHT+IGiDe2czH2Lo7OvZs+3cOgWuuEQwOYNbSwWVHCI7obWE90KDolM00Q7gem4K9/2rVG6uqhESQ==
X-Received: by 2002:a05:600c:4505:b0:477:7a87:48d1 with SMTP id 5b1f17b1804b1-4778fea8810mr21552705e9.30.1763107138936;
        Thu, 13 Nov 2025 23:58:58 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4778c847bbasm76347895e9.1.2025.11.13.23.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 23:58:58 -0800 (PST)
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
Subject: [PATCH v2 0/5]  Add {24,32}-bit sample width support for RZ/G2L SSI
Date: Fri, 14 Nov 2025 07:58:47 +0000
Message-ID: <20251114075856.4751-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add support for 24 and 32-bit sample format width for RZ/G2L SoCs. Apart
from this, the patch series includes some code cleanups.

This patch series depend upon [1]
[1] https://lore.kernel.org/all/20251114073709.4376-1-biju.das.jz@bp.renesas.com/T/#t

v1->v2:
 * Split the feature patches separate.
 * Updated rz_ssi_clk_setup() to make ssicr assignment in single line for
   24-bit sample width.
 * Dropped checking {24,32}-bit sample width in rz_ssi_dma_slave_config() as
   it is taken care by restructuring the test for 16-bit sample width.

Biju Das (5):
  ASoC: renesas: rz-ssi: Use dev variable in probe()
  ASoC: renesas: rz-ssi: Remove trailing comma in the terminator entry
  ASoC: renesas: rz-ssi: Move DMA configuration
  ASoC: renesas: rz-ssi: Add support for 24 bits sample width
  ASoC: renesas: rz-ssi: Add support for 32 bits sample width

 sound/soc/renesas/rz-ssi.c | 119 ++++++++++++++++++++++++-------------
 1 file changed, 77 insertions(+), 42 deletions(-)

-- 
2.43.0


