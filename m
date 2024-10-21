Return-Path: <linux-renesas-soc+bounces-9954-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7B09A90BC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Oct 2024 22:14:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA4961C22D28
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Oct 2024 20:14:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7E7F1FDFBE;
	Mon, 21 Oct 2024 20:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RzLFHJWw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28081FCF7E;
	Mon, 21 Oct 2024 20:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729541645; cv=none; b=WZq9h4YRy+luxpRrkDSd921k+6CPyGR3hhAWN7KYJRmp7CD15BM5evAaQWMw88OgIKdQSaRGPF7Dp7zy8BqnZsatXE7qpJ8CHZx0FomXQPcYmfDAboizSvxLM+x4/QOJy0T/uPqL7K/bggBjtrYkelbzYLXpdDGkW1GN7Kg/LWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729541645; c=relaxed/simple;
	bh=RhDfivLBp99aqQqN99iX1ihiJWuLb8WZSsBqMTiq5Jw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IxxLJRLK6o9ZYw5KW+32XwHeigR7Mj0J6LYEkOKV6eiHS4qIYcU9RbxXQzxmWbNEnHp/C5DJWuidfR8smqzS0I+90ktN3YW+PSGv9Hwoxd66gtM5aS/3seDcnoyqsVXC8q9CFNpzmXI02r0xuB63LUq7+AH4c4yu21j7Xu4U/Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RzLFHJWw; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4316e9f4a40so22248515e9.2;
        Mon, 21 Oct 2024 13:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729541642; x=1730146442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g2CsLO4eOiz7g7HoJIEax9lPCTEohwl7YG0piqoqEL8=;
        b=RzLFHJWwQPIET+M0qFgGBeeQsOKJm/1hjgBxqBg5KKSqEUKfRW8pu/DtS0DwFhj+ig
         e/oLAmBOXXf2sW0tS+dfJtr/A2ttpALoe12blxAX63dpPnFXlAGLSRN34MuRkpYBHCmP
         afvBcDh0u03G4gPFJ8JvkHTEZy8V4FfCY1mBvld3ecxMSz7tzKFY8arxNGmLXsTj7VZs
         aOIjilZZO0yjssY5qYbmDTe+Cmtz0Nkpb6+PhQZQkf9DVNiQnTu2+ujdwhqeIvQclslY
         KcDYXjPNLUOjnKVKm+jYQYUbDLqzBloNbgEDuSs5htKbSIG2jGS74mxUED2Z8k7VToSg
         nJlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729541642; x=1730146442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g2CsLO4eOiz7g7HoJIEax9lPCTEohwl7YG0piqoqEL8=;
        b=arzI9rRe11VWNuN7BWZktLfkL76Hdh3NL1w6iUa1Ezjg6k338TgiYSBzC2G2au+sI+
         OvA93oeQ2hruYln6iZG48u8DPJ+VbXKu8sr6NkxSaIvHQk//siXonBiAFYz0dX/iFQVZ
         nr3ejceaNwcDCY5SDUY4/0zztsPB1rWcrs76UOu/ffw6rDbngZU2M3lEsUTvFHe17ine
         5vlOujvSo3ABG41QFigbtfia8UXlMDOhLKynbWLwMGNn9qso0dA/jzc4UKDugUb1mosQ
         jeJC7bqJmlxwi8Hai6SzpKsWrubcYCmc+32134DJXyR4SpXFF1/QCVIxWWpmpOWe9hjO
         Ha4g==
X-Forwarded-Encrypted: i=1; AJvYcCUHdFCPyhTFp/Vl+2NvW2Sb6Qf3mu8vcNNcuoCF8uetM234jSevPT7vN6i2tdCWWhv/EMNgFPjqYyOzujo=@vger.kernel.org, AJvYcCVuZ7oPUNSInae6+jWfOfMIslnpU76eCOdqNXiUFj1QHSmCq92LCNbTe/RGO3W/7JwEVkLm8EP7P8TSa/7miQDDa10=@vger.kernel.org
X-Gm-Message-State: AOJu0YwH096E1VUnlBkvEb9MIfTVH2B4D1LUENxRRQ/Fbn7+6JwHxQhr
	SRLiQoKpCMOqfjSR0CIBc0IzyVWLP8UoMDD8Iw+x+fzPm25ztL7L
X-Google-Smtp-Source: AGHT+IGI/nrbbKfm2jJIJ6i1KjPgU9c3mQaNa+6RXVH3tUt9fB6wnoYKd7sqCiHgga1LmBOPynV6Cg==
X-Received: by 2002:adf:f186:0:b0:376:37e:2729 with SMTP id ffacd0b85a97d-37eab6ef33amr8403475f8f.31.1729541642144;
        Mon, 21 Oct 2024 13:14:02 -0700 (PDT)
Received: from prasmi.Home ([2a06:5906:61b:2d00:8a20:67a1:e60f:941e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a584f7sm5042935f8f.53.2024.10.21.13.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 13:14:01 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 4/4] MAINTAINERS: Add entry for Renesas ASoC drivers
Date: Mon, 21 Oct 2024 21:13:49 +0100
Message-ID: <20241021201349.395022-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241021201349.395022-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241021201349.395022-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add a new entry to the MAINTAINERS file for Renesas ASoC drivers. This
entry covers the Renesas R-Car, SH7760 and Migo-R audio drivers, including
the device tree bindings.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8994bb088035..3a07e76fc7fb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19622,6 +19622,15 @@ L:	linux-remoteproc@vger.kernel.org
 S:	Maintained
 F:	drivers/net/wwan/rpmsg_wwan_ctrl.c
 
+RENESAS AUDIO (ASoC) DRIVERS
+M:	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
+L:	linux-sound@vger.kernel.org
+L:	linux-renesas-soc@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/sound/renesas,rsnd.*
+F:	sound/soc/renesas/
+X:	sound/soc/renesas/rz-ssi.c
+
 RENESAS CLOCK DRIVERS
 M:	Geert Uytterhoeven <geert+renesas@glider.be>
 L:	linux-renesas-soc@vger.kernel.org
-- 
2.43.0


