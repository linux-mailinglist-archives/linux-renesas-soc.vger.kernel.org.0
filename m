Return-Path: <linux-renesas-soc+bounces-3053-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E54085E2FC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Feb 2024 17:24:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DC621C24768
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Feb 2024 16:24:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 672BD81759;
	Wed, 21 Feb 2024 16:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GUyR/l0k"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E4181AAE
	for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Feb 2024 16:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708532691; cv=none; b=S2NJavnadTlY+LY8ZTJ9Kv7dLnCr0RN9E9qvKey3hCbPHKl6HPpFc/AeJz5zzQXbmnSu6LTHQRK6bw0ncyruozBOzYz2+fTOVog9QXGDgw2pxhHoYu/rajDESQRot9LHysA35KyxOtsyG4GvupYj2ALTmPM9pkjabz9Tsc6ohMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708532691; c=relaxed/simple;
	bh=zKxSt+OXfwNTtuenGgaTIdVfwrd2JY+VgzTzGWangZk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FHfjXUl4kZ/XFt1w5F5RadPgDbWckmwDOUVZzsMGK8udv9UA5+a+Ni6x5kuYNSJ9CIEbKaVisEM8pIvrocA6f/SxnMyvuKG2mNvsPfJEQN1+gT+Xjm8kfzRSzfxs2U5lSGWQwMthjWYNqPYYmTxWFdJJXZxCRBhHqVfkEDz4XbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GUyR/l0k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F18A9C433C7;
	Wed, 21 Feb 2024 16:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708532690;
	bh=zKxSt+OXfwNTtuenGgaTIdVfwrd2JY+VgzTzGWangZk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GUyR/l0kmiofoUgoEZJ8sLnmKUxss5ljQxoux7pUB63EvfN9jxkQXgXAORlQPp6Ua
	 BJG5MxG0smLkBNq3/lA1wj029RdwHAlDmjhRkhTNHOsNqDoHh8M4H8ZjI6/sDt/hK+
	 5uGCp9aB3Et7n95gUlQau6wT3cp/V4c48cXt+WDYwKpn+EOHZ/g26yfrWHniFQUGyf
	 5ykMAgQBaK3bsBi67v28FLmSRUtc28mB6y0qmBx72myxu+Qpjzn7mdow1p2waV7fmB
	 C9fX6jFA7Vx8zOhnNXHOYhpR6OXcyLsOsTKXsP9esB6qkHlMziUAW8C5dThzOvJFtv
	 smtN1y+4PYCoA==
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


