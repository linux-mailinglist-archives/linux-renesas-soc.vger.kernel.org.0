Return-Path: <linux-renesas-soc+bounces-21656-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C87CB4FBCF
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 14:52:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E4B3B1BC4032
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 12:52:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CB3F33A038;
	Tue,  9 Sep 2025 12:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gm/bZ8vM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5524E322DC3;
	Tue,  9 Sep 2025 12:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757422299; cv=none; b=GGbsPYf5LjsR8qGUlxM4Htk2oL3pZ6jAnoDB80nStuY9W6wIUZlJd8YtK1QHOxCyX5XmCaXHaYS1WVHgDhbTO/p358KZbfKjIb0kkbNZFO5GN1Tuxw6BJPVD14ypRDvFGGpVpFsOBnTByYhSRxb/+Nwb3rGfzekfOSwf3hmCQJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757422299; c=relaxed/simple;
	bh=4BlFj5A4ZV/YCg+/3lRvbK+EE8Cc7L3lQE5j5L3mpKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tCBlvTaaWxIr6ASgGjmhO5ayg5AyuUi6ryE5OEMk/ufN6zNpCi0vs3JeS32CmjzFmtkEKoNlGspMpnlT6GptwgD31mMLNMaQhyf1UeB5TV84537JOhe15KlcOFliwqOWdJaXw/LzsdtOGXaSLqKjN165f2w8HQTegwNCABh2jFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gm/bZ8vM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3110C4CEF4;
	Tue,  9 Sep 2025 12:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757422298;
	bh=4BlFj5A4ZV/YCg+/3lRvbK+EE8Cc7L3lQE5j5L3mpKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gm/bZ8vM6+XA0U1YFgFcCk6q4NRXjj7wCOtgV0ReI4ykxZTtbHpGY8VGgmNaCS4qf
	 ouow9SWYsnnRQYV4o+3UAUntM8d4V7aitC5VfWhhQNDJ0pFCb6eQBygekqwGN51mpF
	 jfZi7SSdpf2iZfqB6xRoKMZTyEku553+ycWwDPuYMm2RNVamlrkxyNadVfMU8ocypt
	 FtqKXt5yq/xYQCpOexc845/3trFwtsS/vbTVF910pV/DO/9cOaHxRH6o2f1jDfFkIF
	 PFgmOAmNsvViLmHDrnOdKoyKQCVLJ/6AJCAY91ILaOJj2R1bt7e94EXFn6xSERVMkg
	 epB+aNp7XqZnA==
Date: Tue, 9 Sep 2025 13:51:34 +0100
From: Simon Horman <horms@kernel.org>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/3] net: ethernet: renesas: rcar_gen4_ptp: Hide register
 layout
Message-ID: <20250909125134.GG14415@horms.kernel.org>
References: <20250908154426.3062861-1-niklas.soderlund+renesas@ragnatech.se>
 <20250908154426.3062861-3-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250908154426.3062861-3-niklas.soderlund+renesas@ragnatech.se>

On Mon, Sep 08, 2025 at 05:44:25PM +0200, Niklas Söderlund wrote:
> With the support for multiple register layout removed all support
> structures can be removed from the header file. Covert to a simpler
> structure using defines for the register offsets.
> 
> There is no functional change, only switching from looking up offsets at
> runtime to compile time.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Simon Horman <horms@kernel.org>


