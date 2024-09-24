Return-Path: <linux-renesas-soc+bounces-9019-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1654898477A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Sep 2024 16:18:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6C70EB210C9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Sep 2024 14:18:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D480C1A725D;
	Tue, 24 Sep 2024 14:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ODC2ER7/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD6E13342F
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Sep 2024 14:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727187478; cv=none; b=DeAtH2Otu2LNkMsvqtxk9XK+QZqt8VUxPGLBon/B6hfAhSvihCyteccp9vBXF/TiDd+QB+RO1OWbBnHE4ku74i1o1bix1KQvvww8ib0h5WElaLFlOKTNNOyedraZL+FCltkQxxdGNZ2jzL917rF+vQ275zQn8rYNPo1Ct19TF2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727187478; c=relaxed/simple;
	bh=J5TBaRRy4m28gsa5Yj7EjOg1GBy2En1MJiMCYbuKp/o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=f0vJMWkCDwz86mLrP4wq85EfMT70B61lAUIHeR8yCEni9nger9PT+JthzwNbMATO+SZfeeHLqG+GpC4+e1aXXdwdZlZMeg+ms5aB1cGQbQekULe6FgGFcG49h+oyvBiIMXnGPYF9IWlweMbt2qR6+rQrK64qu1DP1MkuMvLWd9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ODC2ER7/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3162EC4CEC4;
	Tue, 24 Sep 2024 14:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727187478;
	bh=J5TBaRRy4m28gsa5Yj7EjOg1GBy2En1MJiMCYbuKp/o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ODC2ER7/pbpA2Tg96XYG9NClsI7ZsArgatndyAh+YWAVgJ7uCHN4RjeswwXV2iQNK
	 g/2FCzK9k3mPALyxNlAC/c8mBjWOtssKl4qSVGRuPnVVgNi0irPEpgl2UgP44bh3Fp
	 Ja1T7U1wH/TW+JUPZX+59ttIbcx1F1FkG35ky3V/MdMW0gPTowvbCEqRE4maqY1VHa
	 Nk0oSYB/rgMFpsdO/DW6aYWJJHT9tUHAdK4sspXn1ozDUc5RgRyhg3HzTQgohp2Vto
	 vgqlUhi1rUA0E2fgbUSGgcSkhUiBXnoBHhnxg71egWob3+pwNHPCHWfOkVZOjy0lJQ
	 E7uXec2cxgmpg==
From: Maxime Ripard <mripard@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 David Airlie <airlied@gmail.com>, Jocelyn Falempe <jfalempe@redhat.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
In-Reply-To: <b633568d2e3f405b21debdd60854fe39780254d6.1716816897.git.geert+renesas@glider.be>
References: <b633568d2e3f405b21debdd60854fe39780254d6.1716816897.git.geert+renesas@glider.be>
Subject: Re: [PATCH] drm: renesas: rcar-du: Add drm_panic support for
 non-vsp
Message-Id: <172718747586.94652.10830946679925222683.b4-ty@kernel.org>
Date: Tue, 24 Sep 2024 16:17:55 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1

On Mon, 27 May 2024 15:35:49 +0200, Geert Uytterhoeven wrote:
> Add support for the drm_panic module for DU variants not using the
> VSP-compositor, to display a message on the screen when a kernel panic
> occurs.
> 
> 

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime


