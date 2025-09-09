Return-Path: <linux-renesas-soc+bounces-21655-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1929EB4FBCD
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 14:52:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 072664E6FF0
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 12:51:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AEC233A03D;
	Tue,  9 Sep 2025 12:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l7VkGHtY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED8233A038;
	Tue,  9 Sep 2025 12:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757422287; cv=none; b=ODhYC8G9XohH2EuXGxvmzMN5b8HK1feHmvl4z03HijsPt2QD3vKF6FCzHQvjhGvC20x8CWTiIOghDiXiPVGk33eLaDrCAm7DBdV3Fr6yAkgllgGiKIJsuX1KdIWqMU2qhrcS+JDL8zgKb86qJFWidFRd5bxmRyVNU4W5fEdZ1as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757422287; c=relaxed/simple;
	bh=I4b+aKBGVugeNvvUKj2s/TJ6lJ6f7L/HxrD77pVXUOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VYJNN2h7HswoyeQK5S9twLaqveELDdmM1lOERloclGC6DbnWCA5zI1GIkNuiWkNCh8pl6hUc16nSN6eLH3lEcFSrlXSr6jbedvIkjZM232Cx81o10xsyowAZjmv28BtXQDnYMiouuqBSa60QSBdRdbb+weJeRPKgvfV4H76k+/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l7VkGHtY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C940C4CEF4;
	Tue,  9 Sep 2025 12:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757422286;
	bh=I4b+aKBGVugeNvvUKj2s/TJ6lJ6f7L/HxrD77pVXUOE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l7VkGHtYqMX2mussnwYBS48dM3PdfAyINuv9Q4xUSHg7mD3U8ZFwaZR/mdSsq3g4A
	 zuyLo9CnKuERwb3k1Dn3GGSZGOIoEaw1SYpmbAfPag/WBMbWfQpLhNUeWfgm34Gwa1
	 oDtLcWV9dmqnn5wNXQ1xgtciRhbu4Dg1ZKKfDaQKpN9ujGYc6BQNxMVXSclq1jHak0
	 /xMlU56RpwhFRdArIckr9NBiPWM3gBMAh8BIrOEOzgOzBEMJ61LdcfkE8KpULvdWXa
	 4MR3rH2PnvvnlSsjXsnefciTw8m4r5ACSjhN1AtRk5aH1Kkhp6mFMPs2fPGKcw8zLz
	 ra4+TtAn7pJgw==
Date: Tue, 9 Sep 2025 13:51:22 +0100
From: Simon Horman <horms@kernel.org>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/3] net: ethernet: renesas: rcar_gen4_ptp: Remove
 different memory layout
Message-ID: <20250909125122.GF14415@horms.kernel.org>
References: <20250908154426.3062861-1-niklas.soderlund+renesas@ragnatech.se>
 <20250908154426.3062861-2-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250908154426.3062861-2-niklas.soderlund+renesas@ragnatech.se>

On Mon, Sep 08, 2025 at 05:44:24PM +0200, Niklas Söderlund wrote:
> When upstreaming the Gen4 PTP support for R-Car S4 the possibility for
> different memory layouts on other Gen4 SoCs was build in. It turns out
> this is not needed and instead needlessly makes the driver harder to
> read, remove the support code that would have allowed different memory
> layouts.
> 
> This change only deals with the public functions used by other drivers,
> follow up work will clean up the rcar_gen4_ptp internals.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Simon Horman <horms@kernel.org>


