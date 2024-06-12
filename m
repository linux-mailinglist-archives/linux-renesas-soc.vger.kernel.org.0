Return-Path: <linux-renesas-soc+bounces-6100-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DA78E904D3F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2024 09:57:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74DDF1F236E0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2024 07:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B889E16B736;
	Wed, 12 Jun 2024 07:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OfEZzYgi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F3A16C862
	for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Jun 2024 07:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718179032; cv=none; b=Nh54Nr4+j1zEQ5DEDjxZa7yrf8y2B3SjYYf6nCTKl7CaWdT+HgiR4YE5YKHRaBMTSTeLFA4BTIQ8H6izNhBZ0mQvZ40yV5ubpliLLXi7IG8kJIJLnvzAtyHF//mS5+i2Dyjun2TlNlmvDOqCf2wvwClB66NiceL7O5hwIBpAliw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718179032; c=relaxed/simple;
	bh=XTVQR2ac1MYwS0u7pZMkc65E4iu25EWS1Jezi/Yis9M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YK7jEStA+8+TwfIhmBIIK/DcYxCcUkkFsj2dEdT+gdqyuEYgvYo3rdPgAY4K9Jd5Wjrq618QcYPpfwtJKP+SQuGUogtkMCbkzaui+3vCd2Y9Dt53mPuix5fIFo6VTlsSkU70a2MlGhjc2x7xdiz0+c0T44c0uxDCtnfQjxu+OX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OfEZzYgi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BD37C3277B;
	Wed, 12 Jun 2024 07:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718179032;
	bh=XTVQR2ac1MYwS0u7pZMkc65E4iu25EWS1Jezi/Yis9M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OfEZzYgiUcs4bCQ7UMjabqFtCV2bfe08l5NntE75U3iv6PWOwNe7n83BmeKNL42IF
	 ING7PwvyamoidTtqZHSrlZl5Fz8gMISFnPZhSgGnz76PXOTUJ0qyLSGZW5gcAO9lSg
	 XhQ+F89ISdvFZKux8dQ3Ga0A00xG5WmGBm3hwVcFgXLf+Qa1skICbR1ZGYoG8icTNi
	 aTxPvVSGkjykcfimSXVSBw+1yElkDZj1dLMwp4ScMxgURsbc3lMMehei1segdzU2Dv
	 YDZZbbBSG4PIe4Wrq8g/sEKijR3h//hrbhsAFemt8Bz9iPe6qIOKbzt0NCIcpstVRB
	 6RMYA/9yt8u2g==
From: Maxime Ripard <mripard@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Douglas Anderson <dianders@chromium.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Maxime Ripard <mripard@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: Re: (subset) [PATCH v3] drm: renesas: shmobile: Call drm_atomic_helper_shutdown() at shutdown time
Date: Wed, 12 Jun 2024 09:57:00 +0200
Message-ID: <171817900322.766520.14073017611077959453.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <17c6a5a668e5975f871b77fb1fca6711a0799d9e.1718176895.git.geert+renesas@glider.be>
References: <17c6a5a668e5975f871b77fb1fca6711a0799d9e.1718176895.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 12 Jun 2024 09:23:13 +0200, Geert Uytterhoeven wrote:
> Based on grepping through the source code, this driver appears to be
> missing a call to drm_atomic_helper_shutdown() at system shutdown time.
> This is important because drm_atomic_helper_shutdown() will cause
> panels to get disabled cleanly which may be important for their power
> sequencing.  Future changes will remove any custom powering off in
> individual panel drivers so the DRM drivers need to start getting this
> right.
> 
> [...]

Applied to misc/kernel.git (drm-misc-fixes).

Thanks!
Maxime

