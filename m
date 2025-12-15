Return-Path: <linux-renesas-soc+bounces-25778-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B46ACBEEFA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Dec 2025 17:38:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 17142305D3B1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Dec 2025 16:34:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 598962BE643;
	Mon, 15 Dec 2025 16:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B8YF4zkO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60DC195811
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Dec 2025 16:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765816450; cv=none; b=diwmz50nSQ8GURU0q+wIgXRrMFztN2J8FLlVrdOrmoqM1Bl1HsOEt835Kl8xXGTD6q5dXFtCGCDvrutOj9J6Gu9For3qZocp2CsZJsUKpdoYFwMD2JMt7vmQScQhCLpSgOA+sDPEeLG3igYunkiEFDBH5BS7+SrIHgtwd0yigL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765816450; c=relaxed/simple;
	bh=hFOqOAv7uVbbR5WcwgFciMeNnP/0OHxtKFdzXAKrw0M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Yn819xDf9fPYFrA9jYg3UCie3/JVRUGMp36E4MROTuw9oBvtQqFDNBXA23f47jIV0rRvoE9qzRdBeN9Gm/k5X7FyvUqCQjgDzeJbQjuBxvOJHJLVxK6vvpPhidM/OPyo24qFjlU1xlDRPz7Ob9TRCy3MSs5VqLaoThwvVoDA5to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B8YF4zkO; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so38725005e9.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Dec 2025 08:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765816446; x=1766421246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nc6rFfK7Gz+qc8AeSVDPFVggINyHTEh1EA+170hv3AY=;
        b=B8YF4zkOeH8r+N8Cv5Wp8ukiCx8H/WulEGw92z2VzlOHbZyALiL+TxqDOskubVs5sN
         hE5vzZzDXlqHMf4678mh0eJhDTp3RV6e2CGDbqp8OEy6edpc+PUbVbD1vNlC9Rs2CMFy
         uRaPAnNtEWciamDzf58sRzO/nOZx3QDouQNg/5S/lMizZwz/ewXxaQ4YFdjQD3BJhAal
         qNUM7imXmDQj52qD1s1OcK1ICKJ5BgozbM1LvIlX9ccThx2jlvXjTTyBi5etefOTUwoc
         OVN6XDyMImZch8aqB9N/fgjVBxnETr+yiK0Q6rPPFedUq0huYJ5LJfNkTHf74y3KQh1N
         5y2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765816446; x=1766421246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nc6rFfK7Gz+qc8AeSVDPFVggINyHTEh1EA+170hv3AY=;
        b=eT4qZciN79imM5re3HvlhZlBD6Nw5zQFND2ccOlSHu/7usvitAKxihYFHp2re1k6zH
         /RjTT6VJvvFd6ugBWwwLaVj2G9lSyIt8ehka+WpkqjbasFYE5LOFEfSRz9+hWktlEjvP
         wzGcazX01wneEpxb5OACfASQsRFwwaAdiqhnVtSyoEW9m3UIYl+h5gfOnjYoapkgpv1Y
         bIiXg7H+8kot9t7/8HXFuQspRIg/JRkt3r2blwUJZ7N4Of43HffYcwZH2jlJNeYhzV2H
         iJ+21FMSsD3IjBKiCfivWZMchs5rCGzD2WuPTBA+UNJTUlspzk+AcDCumVi2zAx+o++Z
         e17g==
X-Gm-Message-State: AOJu0Yz9a28Kqr46jV/N8mcyz1pPHCqLe+y7zJdqqnsemuQ9UNUh0bXZ
	PXUXmNCNXtKN8hm7BAMXxGIQGgOryELW/x49k/MW2GYxp1aK8sikgLLb
X-Gm-Gg: AY/fxX4DksAeLJbEKvfH+yxTE9B15uKDfexllJB+6aN4A5V/7b3DDbIej0SHCyIIccg
	ao62YXBCSpzKqd9zTveexnpQo7o2SBkG2/m+4uCNgrvZsDN7KWEg0rlzqveXyDUsNKzFMeyhUk1
	Ys3S88Npw85xpSzDR9B17yI8hy+n7SYsWfY1ezuWBkepziiRf2yhrxqEO8GoY3IJ2lMpAYxOj+t
	qZ84kttAw94VWD//4uRcFft8jMQzT+h6rQfmxmHhG0XAq5jxN1pGrVFEDlLNOAsifAzBtu41Uoi
	aVrMdGKg4VOLuYy98H2JFDJtNz3VvpTMco3FEEcdvX79WcfgCgx8zdGZGdLDESJ+oKZnsFnT94/
	JTN50TuLxn/167Gl3wPJY+kvEiqY9EVpDcaz+cIdCdi2MrXNN85MNnBZtDFOxyxEmtfwHDZsOae
	XS9XRLAjTMx55ewjhVD4afSohZ2cd89pz7Pv6rUzvJCqbg6bR2BobtkF4=
X-Google-Smtp-Source: AGHT+IGJQDjr55225GtOMFt6JjCMMfs83+3wPGXQ71w7l4LaIX1V6FNmpVhtEikrmzWNAcp1Vf94BA==
X-Received: by 2002:a5d:5d09:0:b0:42f:9e75:8605 with SMTP id ffacd0b85a97d-42fb42c1a55mr11777957f8f.0.1765816445926;
        Mon, 15 Dec 2025 08:34:05 -0800 (PST)
Received: from iku.example.org ([2a06:5906:61b:2d00:f5e0:bc9c:3d69:b37f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fa8b9b26fsm32609640f8f.40.2025.12.15.08.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 08:34:05 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/2] Add DMA support for RSPI channels in RZ/V2H(P) and RZ/V2N SoCs
Date: Mon, 15 Dec 2025 16:32:28 +0000
Message-ID: <20251215163230.227849-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series adds DMA support for RSPI channels in Renesas RZ/V2H(P)
and RZ/V2N SoCs.

Note, the DT bindings doc patches have been merged separately and are part
of [1].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git/log/?h=for-6.20

Cheers,
Prabhakar

Lad Prabhakar (2):
  arm64: dts: renesas: r9a09g056: Add DMA support for RSPI channels
  arm64: dts: renesas: r9a09g057: Add DMA support for RSPI channels

 arch/arm64/boot/dts/renesas/r9a09g056.dtsi | 6 ++++++
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 6 ++++++
 2 files changed, 12 insertions(+)

-- 
2.52.0


