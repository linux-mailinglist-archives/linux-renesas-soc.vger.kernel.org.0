Return-Path: <linux-renesas-soc+bounces-3054-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3719585E308
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Feb 2024 17:25:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C870F1F25827
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Feb 2024 16:25:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83DA682864;
	Wed, 21 Feb 2024 16:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kHUHABLw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602F581752
	for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Feb 2024 16:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708532729; cv=none; b=IwlPbOUyF/xCfpwf2Ac9zHkaew47USUlak4Ked14uAK+SNOJjJS/vlGQjfDs3Ath2Op0AOyV769Xluucrqb+vLHutVU6GU02lvNI6ma9dPn46LgIv2FIMP6RME9aEaEpKT++b49G3d+ki9hQloRrWwCCnbd8ivB3iyFp8YAVTbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708532729; c=relaxed/simple;
	bh=dG9DsUBKNvtePLZ9PWNfjmPztmVh0FDOnEtn/qZsPTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=vBWgmpBcH4Bn3fnjIAKCk0o3tkGR1hVZZePDPVob7VkR6pImVJ7mdabJkNsxn7tbpzPgRL0AWrxahUTBfA/XZum4rdCePHx2Hb8J6ntoYm6mdg9CDXMGl3ZdNVRlx7r8XFwCkhgZ6QuBJNu2LXaUioiHzF6sLP25BVkkWxRBjXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kHUHABLw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BFDDC433C7;
	Wed, 21 Feb 2024 16:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708532729;
	bh=dG9DsUBKNvtePLZ9PWNfjmPztmVh0FDOnEtn/qZsPTQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kHUHABLwZhLb/90D8DOnF2BezvFj85peclBHivE4BZxvT3n9fKbdUdi9jyOaiCQEN
	 xNzphvUOFHuWInAC+/tpjdlrUEH4luAUt0d48UTq7XlcvEfLnR7v4ft5mVgutUaCqe
	 jvMR1lkKsgz82wTEfP6AEpiUEIpdVpbalksOr9QOX7ZBe4f+oUM3Srbm/GfVs5mHpY
	 +zUV+dKr7rocE2O5Zq8QhVenFuWyMUpkbxy4/v/ej6sgkRRjXs2w9a0ZiBsqSaeGkr
	 Pa1bdR4HS9gHahzO9zQ/Y0CCQrir/hBICrnJQ2DFuLzFStJkjvJw+NzMpGmwdJMroC
	 nyEsZe8b0Hy1Q==
From: Maxime Ripard <mripard@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Biju Das <biju.das.jz@bp.renesas.com>
Cc: Maxime Ripard <mripard@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH v17 0/5] Add RZ/{G2L,G2LC} and RZ/V2L Display Unit support
Date: Wed, 21 Feb 2024 17:25:16 +0100
Message-ID: <170853270350.761953.5548304576754745596.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240218164840.57662-1-biju.das.jz@bp.renesas.com>
References: <20240218164840.57662-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sun, 18 Feb 2024 16:48:35 +0000, Biju Das wrote:
> This path series aims to add support for RZ/G2L DU DRM driver.
> 
> RZ/G2L LCD controller composed of Frame compression Processor(FCPVD), Video
> signal processor (VSPD) and Display unit(DU). The output of LCDC is
> connected to Display parallel interface and MIPI link video interface.
> 
> The output from DSI is connected to ADV7535.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

