Return-Path: <linux-renesas-soc+bounces-3055-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA4085E30D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Feb 2024 17:26:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 906531C2189A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Feb 2024 16:26:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C89D82899;
	Wed, 21 Feb 2024 16:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IxmFuhRq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376858286F
	for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Feb 2024 16:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708532732; cv=none; b=ahazI3GZmayrGjJQCP2zsFTuX9J/bvg0erEa4P4BgcjIx3zW1tMLxsgbsg7ok9YpWLj+GhiUYHpB2RnTOW9xb6hztA8PfgiP0HtvnovnFGQZuQNCRlKdQ/maVZRJ8/1SbCZGp5+lk9l9OVSg6gEODnaLZJixDIrOKOIn1YZYuDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708532732; c=relaxed/simple;
	bh=zKxSt+OXfwNTtuenGgaTIdVfwrd2JY+VgzTzGWangZk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BHMmbCy55V3j961LpTIOO3kwI/hdf0MCaCajsyxe7GGIhl6S1RNJbULQ3CoTG2tBSXtaRkDN7vvxAfpp+78vj2Ye0V8l+eH+s69vftiRzSiJJJhxvcbfdSOSUTIlBb1NKgcN9LNtNA7nxcIdyL1tI9VFmzV2rekImJTUY3UTfuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IxmFuhRq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F769C433F1;
	Wed, 21 Feb 2024 16:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708532731;
	bh=zKxSt+OXfwNTtuenGgaTIdVfwrd2JY+VgzTzGWangZk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=IxmFuhRqxNL2ajOG7BTFQgXIr/Obmiky5ITDKSR53CmHtAMX7YRDnlRxUOGzHeEkc
	 XUfH3axovly1udZsLDO0Zx5HA4imniiikfhi7MXSuLpQqPKs0AjejZZaV2Y6H9JESj
	 i9cGKVh3aDb4AgSYP8wpcFA4WeTi7HOwKDRsXqPFPn+qRY6QSoMUJsCAyP1pNgE7yS
	 Lfj5AkZQuehIo5Rq5aSkrtWW2FdILxSBjbzauPTZrCQi8EoytztWyAyaPMeTfnfjw0
	 pR0/UhRwiHoTjDh+XGCdDKbGnTANHZMFMZLeEWa6gGJah/Ix++wjvlQ/flZEYIzNnT
	 qCGXBzYnSjKlg==
From: Maxime Ripard <mripard@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Biju Das <biju.das.jz@bp.renesas.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, 
 linux-renesas-soc@vger.kernel.org, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Biju Das <biju.das.au@gmail.com>
In-Reply-To: <20231128105129.161121-1-biju.das.jz@bp.renesas.com>
References: <20231128105129.161121-1-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v15 0/5] Add RZ/{G2L,G2LC} and RZ/V2L Display Unit
 support
Message-Id: <170853268755.761834.4644414762765104456.b4-ty@kernel.org>
Date: Wed, 21 Feb 2024 17:24:47 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3

On Tue, 28 Nov 2023 10:51:24 +0000, Biju Das wrote:
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


