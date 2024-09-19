Return-Path: <linux-renesas-soc+bounces-9001-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7B597C4D4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Sep 2024 09:27:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DDFCC281F3E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Sep 2024 07:27:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FF5F193418;
	Thu, 19 Sep 2024 07:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ftx0U6wP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644B522098;
	Thu, 19 Sep 2024 07:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726730839; cv=none; b=U0Srhq4D3LkxjxTR/EGGrJriqPZGJm7n6ttD79//FVuyj4O8epGOKOi4mg/tzJWDSyFYR5jmV91ijs37oVxH4BLi/k1KVFdPpevwLHBVtW0Jf2G4QWklIiitwe9du3w5OTzrzbqerxul3IKK67TANtK0DA11AIyTqYE87VLBKfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726730839; c=relaxed/simple;
	bh=WJqfm7c8gJmqB5YgrrlqPrtjeHOw9gyDOslnoXjy1uE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V/oI/Gcjz9FMSvuvhOTPKAxEc1aMBGpXC8QRMeX74ituz90GsE+3QtFnx5tP6Ov+bn0KB/FnU71J525uavUsNT4gC/ztDfNbh6GtrzXuqViHFBbbk26BbHui+TURQjJbDF8CR7UtoMPHpnZ0YMIGemYCet0bG4I8A+F3iKm8bLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ftx0U6wP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4912FC4CEC4;
	Thu, 19 Sep 2024 07:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726730839;
	bh=WJqfm7c8gJmqB5YgrrlqPrtjeHOw9gyDOslnoXjy1uE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ftx0U6wPCITkW2j1Xzs9EeunObyWmKsmDos/HSxVHFfp7mRb333GBsw27wZAbASNd
	 1dHStVpL3C7Qq9MVrOAStbBE8yzwtSYsqnf22DFf0ICWm2SzdepQs/Oov0i1hiDKBM
	 laNjHY7gpVJyFm4F343wYTxXOaX1esjJqXIleZHVUqWHCbu2ohxiZmnfwF1vfBb9J5
	 1rUur/zT+405n4bRclhrPUcb+/QZEo/NPr3dO13Pb68rPrZK2aiMUDI3Qc+A1YepwQ
	 oK18nJ5hIpdjz3wCBSqIu3lTJdb3GRGeXzk1fGZ/Q73HvNNgRmEI/WUjtT95GUrMNe
	 Dd8HuPFbcOqFQ==
Date: Thu, 19 Sep 2024 08:27:12 +0100
From: Simon Horman <horms@kernel.org>
To: Paul Barker <paul.barker.ct@bp.renesas.com>
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Andrew Lunn <andrew@lunn.ch>, Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Mitsuhiro Kimura <mitsuhiro.kimura.kc@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [net PATCH v3 2/2] net: ravb: Fix R-Car RX frame size limit
Message-ID: <20240919072712.GD1044577@kernel.org>
References: <20240918081839.259-1-paul.barker.ct@bp.renesas.com>
 <20240918081839.259-3-paul.barker.ct@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240918081839.259-3-paul.barker.ct@bp.renesas.com>

On Wed, Sep 18, 2024 at 09:18:39AM +0100, Paul Barker wrote:
> The RX frame size limit should not be based on the current MTU setting.
> Instead it should be based on the hardware capabilities.
> 
> While we're here, improve the description of the receive frame length
> setting as suggested by Niklas.
> 
> Fixes: c156633f1353 ("Renesas Ethernet AVB driver proper")
> Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>

Reviewed-by: Simon Horman <horms@kernel.org>


