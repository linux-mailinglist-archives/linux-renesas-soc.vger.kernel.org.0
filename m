Return-Path: <linux-renesas-soc+bounces-23723-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BC21AC13B0D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 10:06:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6247E352711
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 09:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 485512E8E1F;
	Tue, 28 Oct 2025 09:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="aT2C+Ax/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA842E7BAA;
	Tue, 28 Oct 2025 09:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761642330; cv=none; b=AXI9OGr2AFWreTrERMpArLJCT7QimzS9xtXTX0btAMqxIx95GFmkQBxN2V2mpYKDlWRRrHMqc2NxYp/RLbNFH896oCR1vLK6yo7bX+DZB7Orb7wkkvTrOIxQEr/t2G6PphND1Txh/OqqHejEkjlqvm3gamnRbf0zDfEsgExMmJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761642330; c=relaxed/simple;
	bh=AxY0tSnCaVW2n4iwgB10SOXl90OPu0zpMbU0+cMxtY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ljlnuR0MLgzW6NqC03IavhyIS/fYIYcipAcxyrM8zO5bYJBIUD4G0JrNmU/YTTKr1CP5o9MhYIEVN/acxHFhD8yVC2KxlwGOzDxbb4uSM6X5wMAOs2BRbS6wle1VyFUQaiR0AvNo+v96is5OOak+k5TeKkJp6Vs8UX2gsQsBCtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=aT2C+Ax/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0B77C116B1;
	Tue, 28 Oct 2025 09:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1761642329;
	bh=AxY0tSnCaVW2n4iwgB10SOXl90OPu0zpMbU0+cMxtY8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aT2C+Ax/x44DrlPnYLCdU1J1535bmJteBOWHNMFtVyJC4mYq3MmFtQXnurdJOuTRY
	 hNZvD7npCqpn9IgjPgugIrdbKiMQb7mXgnWOw2qTthmCrTvYOkNQxWy24IYFPowcqe
	 u5Yf0OvpBKYxfN1rbR0LA/5yfhxG9i72vjARw04U=
Date: Tue, 28 Oct 2025 09:41:31 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Nam Cao <namcao@linutronix.de>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 00/19] Add RZ/G3E RSCI support
Message-ID: <2025102802-clay-turbine-9562@gregkh>
References: <20251027154615.115759-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027154615.115759-1-biju.das.jz@bp.renesas.com>

On Mon, Oct 27, 2025 at 03:45:47PM +0000, Biju Das wrote:
> Add RZ/G3E RSCI support for FIFO and non-FIFO mode. RSCI IP found on
> RZ/G3E SoC is similar to one on RZ/T2H, but has 32-stage fifo. RZ/G3E has
> 5 module clocks compared to 2 on RZ/T2H, and it has multiple resets.
> Add support for hardware flow control.
> 
> Biju Das (19):
>   clk: renesas: r9a09g047: Add RSCI clocks/resets

Why is a clk patch part of a serial series?  How are we supposed to
merge this thing?

thanks,

greg k-h

