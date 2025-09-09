Return-Path: <linux-renesas-soc+bounces-21657-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CD255B4FBD1
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 14:52:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D74D0168811
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 12:51:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A20A33A01F;
	Tue,  9 Sep 2025 12:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AnLs9Ee0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2095C3203A7;
	Tue,  9 Sep 2025 12:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757422313; cv=none; b=G5S0lv6qZ7eYZTfGGkIxsNgeR9ZUqj7eyZfAS+qc2PW6TzWi/6zH9uTAivQOWU8xPqJ31dR+iNSxJiVmzGwBF43CIUkITWnp0HWxKoB/JdGLClqPnuPxpYOwMQk1MTmpG7yJP4FSxvYA/MtfOYR/cskU7FD+20su0vbkSNPZZM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757422313; c=relaxed/simple;
	bh=zajlGVhEwyY85tWtB/aQbljBsQiHKjoUFceCAVWfzno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZDw5gkhfRpfUuzbOr0McjVUGjkF0FLDeZjiSuFTJmfqiInaSxok9l8fJm+4T+89FNRi5P/dTriKeL6OEu60HfWcK/X8zUpwCcn6LzqwlPtrxC5Iwi8Wg/mlA5A2R/St4rMXuKk4BTYQMSZOuF1n/lmCAA2i/ABo5U2OhRugyjyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AnLs9Ee0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B06BDC4CEF4;
	Tue,  9 Sep 2025 12:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757422312;
	bh=zajlGVhEwyY85tWtB/aQbljBsQiHKjoUFceCAVWfzno=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AnLs9Ee0wRFU6pBkl52vS/y8ckXHvDDWnZPNKtcL1rEHGyApCQ3f4JMZtJhMLKkrM
	 ZBW4poAefnVmNxpys6BHNvhjyM4CTTDcPyUcMLmmjSwUtTunZvJT1ITzK4fKFQZAU5
	 VKQSyCotJR0nfGbtUe/C+Ta5Wn1iuZ+cnl7BF3EyR3fdDBHWDN6r+MrHCpXAnlGySs
	 Rv9wAW5JHLi4oXUknQE8axH9XYQJOG7GOUCxY49K72maJl4MrcYhqa3GNbJqOXxwOz
	 NH4RqoozSL3D/8gKo1Bv8H8Eo57DA0TWYszPA1UyFg6FJxUq/2yzr55CFMHWr0ueOF
	 XSgXw1MEuCzWw==
Date: Tue, 9 Sep 2025 13:51:48 +0100
From: Simon Horman <horms@kernel.org>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/3] net: ethernet: renesas: rcar_gen4_ptp: Use lockdep
 to verify internal usage
Message-ID: <20250909125148.GH14415@horms.kernel.org>
References: <20250908154426.3062861-1-niklas.soderlund+renesas@ragnatech.se>
 <20250908154426.3062861-4-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250908154426.3062861-4-niklas.soderlund+renesas@ragnatech.se>

On Mon, Sep 08, 2025 at 05:44:26PM +0200, Niklas Söderlund wrote:
> Instead of a having a comment that the lock must be held when calling
> the internal helper add a lockdep check to enforce it.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Simon Horman <horms@kernel.org>


