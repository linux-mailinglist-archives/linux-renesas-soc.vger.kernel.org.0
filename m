Return-Path: <linux-renesas-soc+bounces-3090-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A9885F56D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Feb 2024 11:14:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED27D1F263A5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Feb 2024 10:14:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E967F39FDB;
	Thu, 22 Feb 2024 10:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FwCI0rqL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C429939FDA
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Feb 2024 10:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708596862; cv=none; b=KkluzA+dB23rk2I8ZuRHJy4nLLdzf30VuMHbuO8wWCcodTGkYrdFOEDObCfhtxwd8O3G+yePkQeuuX6iw4xIqlGnYgkqjq+vLtm0JxrKpIfqX7j2faKaSZbGPqdz+TZ80HVmLVY4viy93FY/JdPl1vu/UAN+YUmDnc4KWhE6gKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708596862; c=relaxed/simple;
	bh=foxoZ9LRpQOe6jh8rAu3IF9Z8ybhG9+6DsKDBavcozc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZtNm3pN/SvisA8ndrqqmBUALv5F80YHs10vYnzn5gG1s7zHkos7XLrbmH7TDGIIxuHSYdnqoWFmJJPqYaXT+OsMuduJtHSzrBiV05sqBkJT/3lHozCAJCNal6vCrN7TnYjvYVuKqcacMrEGbyS6ad1/MPxUccQK7X3jq/7AVccY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FwCI0rqL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10BE3C43390;
	Thu, 22 Feb 2024 10:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708596862;
	bh=foxoZ9LRpQOe6jh8rAu3IF9Z8ybhG9+6DsKDBavcozc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FwCI0rqLgZV9yA15sWrKEcXlBSluDIaDzP8pgdBsSuu/SfBglNugA5Y6DNF6WvTH8
	 uopNoQ4tdKPqLzRLihuTKB0Wsis81z6VdlIRnNxgCMxzcuGOisZrQW3JbVz3Mb+Uka
	 1HbBQtazSbJF1mR1vuGtUNWjkjtJk7n/U62V+5ip84QqUkeOD9KOvOaOpmdT3K+5YO
	 uyDXRiah7wcpH6GtL4WQleTPnTewamYqvBhXrIFMiqUkIr/OT1Dw80OlBvOn+87noj
	 9F+BJaOvZUGcsaKARp1qS4EDLVI8feMf51GHLFN5El73RXqOX9BXWwJKxkS4iGjd8+
	 o5iOxmC91/41g==
Date: Thu, 22 Feb 2024 11:14:19 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH] drm: renesas: rz-du: Fix redefinition errors related to
 rzg2l_du_vsp_*()
Message-ID: <dmtawf7kybdkhf3tjp5chuwn54szunlme7l3gtq7bn7sxntvge@ozgpn3lljhmg>
References: <20240222095630.85949-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="marwcfzepqmkg4oh"
Content-Disposition: inline
In-Reply-To: <20240222095630.85949-1-biju.das.jz@bp.renesas.com>


--marwcfzepqmkg4oh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Thanks for working on this

On Thu, Feb 22, 2024 at 09:56:30AM +0000, Biju Das wrote:
> Fix the redefinition errors for the below functions on x86 by replacing
> CONFIG_DRM_RCAR_VSP->IS_ENABLED(CONFIG_VIDEO_RENESAS_VSP1) and adding
> EXPORT_SYMBOL_GPL for all:
>  1) rzg2l_du_vsp_init()
>  2) rzg2l_du_vsp_enable()
>  3) rzg2l_du_vsp_disable()
>  4) rzg2l_du_vsp_atomic_flush()
>  5) rzg2l_du_vsp_get_drm_plane()

This really should be two patches: you're fixing some symbols not being
exported (because they need to be called by what other module?) and then
fixing the redefinition error you're mentionning in the title.

Maxime

--marwcfzepqmkg4oh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZdceegAKCRDj7w1vZxhR
xSXXAQD4/RsuTn9UG1AMaOfUFVlhuIdi8EERjmWBgkb/aa7WsgD/XkYEWYepMCUW
43cjCILRWHh0JVgavn5ak51VjRkXbgk=
=Pxd1
-----END PGP SIGNATURE-----

--marwcfzepqmkg4oh--

