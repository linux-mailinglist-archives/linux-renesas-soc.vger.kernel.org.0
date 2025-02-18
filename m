Return-Path: <linux-renesas-soc+bounces-13294-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD13EA3A1E1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Feb 2025 16:57:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5342A7A3502
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Feb 2025 15:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACCEB26E155;
	Tue, 18 Feb 2025 15:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="TPgp3EXJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5690D26E14C;
	Tue, 18 Feb 2025 15:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739894248; cv=none; b=MjvTWxwTNWSYxYFeV4LMf9SVStYyOiak3X7SH0Y4xGpUm8fIgxl8DoilS0jzKlDYr2a4OhEBF06RuI4G8ior2kmLjCL6pbRW+PG04FiF3G/g301MSxPvIU2CNpzLs0zAHqqPxF458h2fXtRmCcoa6uVQ509385ZszFoSv/o+GXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739894248; c=relaxed/simple;
	bh=RoOHTJvVlo6Ondp+M6nn7MqbSaI7ASpM1NPY1XhuHU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HA07rIkY9M9Jii9WXfeBFH38JKK8I7kbbTbh8jwApY/X9M5YCMC5Q+7ZRPezuk4YqKE4R4/7aLtTVIgZDEnpEc4asKIbYid/A56ZwAZmWgkJfKT1ZiRG5scKzsMYdCaiDbQ7txPQeyScDy1PgwwYSuaoXUJ4sReo7/jIQsMjHXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=TPgp3EXJ; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KZBDJtxcaW+EbK7xr8lVciQc5WFsH1M+cUzHurUjtms=; b=TPgp3EXJIxknNdQRFhGKtjsSGD
	zh4oCSSNqtHdPQMgdkyQvRpsrKvYx+FfAcbjG1SEjN46nlQGNh1VzvYSPlgseTPRMjdLM/i9cpMj9
	fLr8mhI8SxYDvXtugtqKsWdgSXeq87xwkVhYvmajXXxibojsAq/8Wk39wKqtPz3T4beE9QXZafPNF
	soUyX6Y40/lic0qMOCa+I1W6Oi9kgpSzpKz0zAjPH5iiEZvMycxwI/2JnlVvGxZaUgUy6GfjlffP5
	GYZGJ2RSLoTewgKGctKEHMR4CVHcP5yxhFQXwUwiw1GhFZxNPyh87MOEhHyi/DyOlzN1euG+K476r
	oh59WZhw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:37344)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tkPy8-0002Wi-1o;
	Tue, 18 Feb 2025 15:57:08 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tkPy4-0007NT-0f;
	Tue, 18 Feb 2025 15:57:04 +0000
Date: Tue, 18 Feb 2025 15:57:04 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org, freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org,
	virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
	intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 06/25] drm/armada: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
Message-ID: <Z7St0O3A_mXEYK49@shell.armlinux.org.uk>
References: <20250218142542.438557-1-tzimmermann@suse.de>
 <20250218142542.438557-7-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218142542.438557-7-tzimmermann@suse.de>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Tue, Feb 18, 2025 at 03:23:29PM +0100, Thomas Zimmermann wrote:
> Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
> buffer size. No alignment required.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Russell King <linux@armlinux.org.uk>

armada_pitch() does have some special alignment (it aligns the pitch to
128 bytes). I've no idea what drm_mode_size_dumb() does. Can you check
whether it does the same please?

If it doesn't, then this patch is incorrect.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

