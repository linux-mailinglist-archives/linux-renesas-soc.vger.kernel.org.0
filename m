Return-Path: <linux-renesas-soc+bounces-23420-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE471BFB483
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Oct 2025 12:03:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5FEA03BDE1E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Oct 2025 10:03:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2207D3164AF;
	Wed, 22 Oct 2025 10:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BVFUV85U"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A6E316183;
	Wed, 22 Oct 2025 10:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761127416; cv=none; b=hUEEBinvF1cN1v7RPb1d8D0m/LbDhWOgKmOdz6gQo9nxrZ31KOeMhw8ennpUN5hyt3UClxxrDjiOWrOcyMo2pwxtcwx6sBpZXHS0D7K+aXyTsfnfZwCx40Dj6jSAQEa3iovuVFnQJpS9ir7gCEi6w6v0YgeE6V59GBjmHZJaOHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761127416; c=relaxed/simple;
	bh=L1+j8RX7kL4RDrHxpt668Gkr4PjDEjHbhO5EJyaRbTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iPlHu6ucvTCvB/8uiqHhc/mexDt1uz+Fe+kDXDTw0WYmgcrK2p3syUKZXpkCLRJ3+yby7rCCuUla8jIUxpupJ4KdR6qLnx+/44Yz9SirWgmPEa5xMLgZbmMjoDQXHWLgmMd+u8KGUryodG0vQ9564tdLWQ3sPkMvWfXIVgvhUsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BVFUV85U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9C8FC4CEE7;
	Wed, 22 Oct 2025 10:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1761127415;
	bh=L1+j8RX7kL4RDrHxpt668Gkr4PjDEjHbhO5EJyaRbTE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BVFUV85UotPXx7J96BhPo8ADZu/FoAhlMWMsluuyrlKbAzEjQ3o1CTuGxfuueJCmk
	 d0NcMLMmxKxlSXXwDKFzGunvr28rco66pZGgr126O+EdKo4QlES6OCd/QHc8d/hADv
	 wDzsUfwibDe5U+Jv+JPFyGgtmhzAGm9jn3zaAKFM=
Date: Wed, 22 Oct 2025 12:03:32 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] serial: sh-sci: Merge sh-sci.h into sh-sci.c
Message-ID: <2025102218-blinker-babbling-5fcb@gregkh>
References: <20250923115120.75685-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923115120.75685-1-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Tue, Sep 23, 2025 at 12:51:20PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Inline the contents of sh-sci.h into sh-sci.c and remove the
> header file. The header only contained register definitions
> and macros used exclusively by the sh-sci driver, making the
> separate header unnecessary.
> 
> While at it, sort the includes in alphabetical order.

That's two different things, should be two different patches :)

thanks,

greg k-h

