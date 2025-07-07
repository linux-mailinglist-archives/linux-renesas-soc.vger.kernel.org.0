Return-Path: <linux-renesas-soc+bounces-19293-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E44AFAB64
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 08:01:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3194B3A5657
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 06:01:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34887214A8B;
	Mon,  7 Jul 2025 06:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="TTo2znUC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C71F3597A;
	Mon,  7 Jul 2025 06:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751868092; cv=none; b=TQpUKbpc5PSwv0NyDLCyFbOI3QFLVmCWmhd/qaadZLSCl3oUDO2NeWW1CL7TX0D0Eiz9b5ypwE5mwYQz+ibgi+HWR1rgvr7MuO98kakvaBVuZheZFh23dNDgxnPn1nsBHxWWyI2H/G/X3WNr7KILPSvQ1pkvjTJF63sP1c//umQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751868092; c=relaxed/simple;
	bh=CRlyrRUbGylFP7Dzr2WFkdgGT7QGpSw/wY2SKY47u7o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tvk9g7Jm3dgqgj3Yf6eu0NbcYjyIsmscMe3Bxl68RSc0Ihi0RGC/kfeGvOj5uHWPuJEyFppwh+YsrlQG2gG/C4rjYSiD3lrBdk7DON5RA83Ej0pBeK9aJRdAjXFPD5xitpBuQntbBtdzi67WzknpouTKkz3XSxPax+V+aJyw42Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=TTo2znUC; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=fKFpE5qupet+0Nh/FoTBhF5j2fJsUh2F3voPRFf8ozE=; b=TTo2znUCwpBCHOrF4sjWOrjHRv
	+1f9s1EsMj8jMeDPkDK5TXAsR6eZEW4bv6IpiiFWZ9jPjdXdW7WE0cuQ+yMVgPl6ZcHylrs5OYMqr
	O2zntqGlKTHSr1ax0Dguy6eYwgzzytz2RCDIn9YtpDIPBExHvxOMUAceAaIz5lsr/+nU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uYeuo-000gIZ-Mt; Mon, 07 Jul 2025 08:01:22 +0200
Date: Mon, 7 Jul 2025 08:01:22 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Rosen Penev <rosenp@gmail.com>
Cc: netdev@vger.kernel.org, Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:RENESAS RZ/N1 A5PSW SWITCH DRIVER" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 1/2] net: dsa: rzn1_a5psw: add COMPILE_TEST
Message-ID: <4f851fba-3765-4d97-94b4-d03d90bb9089@lunn.ch>
References: <20250707003918.21607-1-rosenp@gmail.com>
 <20250707003918.21607-2-rosenp@gmail.com>
 <08324803-3039-4814-b93e-12b863bbadd1@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <08324803-3039-4814-b93e-12b863bbadd1@lunn.ch>

On Mon, Jul 07, 2025 at 07:55:21AM +0200, Andrew Lunn wrote:
> On Sun, Jul 06, 2025 at 05:39:17PM -0700, Rosen Penev wrote:
> > There's no architecture specific requirement for it to compile. Allows
> > the bots to test compilation properly.
> > 
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>

Lets try that again...

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

