Return-Path: <linux-renesas-soc+bounces-19405-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F2037AFDA3F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jul 2025 23:57:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D64A91AA7BB9
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jul 2025 21:57:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 681C12459DA;
	Tue,  8 Jul 2025 21:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="hDRYfFSx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4621C5F13;
	Tue,  8 Jul 2025 21:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752011818; cv=none; b=Iu/Dheih4+QSIVv7fI5gnq1cgZ9cO/LaAs3d9NASq7CLK04+Z08ZvwD3PdTCuyjwGHCLnUtFMuzweVmPXkycYDSw2WKgpkk4wumFy7fsUZyAYyiTsUntCRdfGlPSNAfcY7XyJFkIjNQPMDphWd/FpL4UGLNUZfq49w4v5xT+cZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752011818; c=relaxed/simple;
	bh=mMYM0UqMMuLwofB6yHEOfU/Sj/tijRtxSclWHwv8EYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jiyA9vWvsb0n78d0oPdknQ9zHyvYgHCHpuJ3k+UlCEnHEs1sbQnfHHhVX885aCYo+pCXkhWOjnAX1AJreVPXCabQNnnmVaSu4TMY73zkFitopbiGyU4BpfvbhVtszEqOSAgEXBtOJSe2fORtyTVNb1kQUUJyZgN6Y1TIOWY1llk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=hDRYfFSx; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=I2MNnurOuYs7GBps2jgmtMeQcUhEOvCBlbZC40vudRY=; b=hDRYfFSxrH4iT03pWeDD2npYwC
	jKY8mOLJ9j+wDlgQDoRVHojeuTOBwagjozsoFwba0LUnTIoshwGKpkaZuEh27HHTX7J6JHU/1cRWw
	IAkfTPE6yjIoee960pDTbIosU/MDb0cW6Y7+9H48/261LnJrpZ7baAIGeeNZV3mzbI2o=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uZGIv-000sFX-Pz; Tue, 08 Jul 2025 23:56:45 +0200
Date: Tue, 8 Jul 2025 23:56:45 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Michael Dege <michael.dege@renesas.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Paul Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: Re: [PATCH v2 2/4] net: renesas: rswitch: configure default ageing
 time
Message-ID: <26784e9d-a660-498a-ae32-4493d463a23a@lunn.ch>
References: <20250708-add_l2_switching-v2-0-f91f5556617a@renesas.com>
 <20250708-add_l2_switching-v2-2-f91f5556617a@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250708-add_l2_switching-v2-2-f91f5556617a@renesas.com>

> +	/* Configure MAC table aging */
> +	rswitch_modify(priv->addr, FWMACAGUSPC, FWMACAGUSPC_MACAGUSP,
> +		       FIELD_PREP(FWMACAGUSPC_MACAGUSP, 0x140));

Could you replace this 0x140 magic number with a #define explaining
what it means?

	Andrew

