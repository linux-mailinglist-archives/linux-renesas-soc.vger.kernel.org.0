Return-Path: <linux-renesas-soc+bounces-21652-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A6936B4FB6B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 14:39:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 039C816D20F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 12:39:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67451337684;
	Tue,  9 Sep 2025 12:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="qHN+z7Az"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CB03314B8;
	Tue,  9 Sep 2025 12:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757421550; cv=none; b=KNzAleggCPBtk/rGtj53YugX4GdNoVMmwEyPD39wAIeHxhonXd+QAHCccvuVdafDqqH2yyWUhAXmELuZ0jbIoDwBbbJX3AsE8LB5mwKjalBoKFqz7p5aZou96VbQq1sOrNIFnzuzMrwVOoYGex5ihZ9EGz0pSoXbUfhGe8rAjAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757421550; c=relaxed/simple;
	bh=vMzK8CPR/tUptOIXoiOuEf2OVuZnW43bmdjto6nXF2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OrYf6wyAsYv4zevqReB3QsAnBIjRjFOUt5/mBYFsHzh/XVm9usnxSj9SjJ6itado89OPc7+efvWWhg73hzjqF3WHpRp4djsujIjTVpU+WY78zNs1ZkMdibKRqHcKGuLw3CTUvEFmVdvbCi/3gIN1+FP/l7l2mAZbu+LdUjcyrYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=qHN+z7Az; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=uBkIL1j1cxq6Asp/+j02Bb7AFS96SweAJmrEXgfx4IQ=; b=qH
	N+z7AzCLCuhRxYSAZgdnKxa4sX2AfPzlKxy6KUMrvYEjlQoN4XxmizX7iQtmb8UB/9NhC9nHcwPqO
	w0WXWvHrZSI9+zzb42zDvhEBIWOSrTMsdWO3DcWoap5h0AFWJO17Dn2ZIXBn0HgBR6D5QKnphYH3G
	F3r9zxdG/QkifCE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uvxci-007nSU-0p; Tue, 09 Sep 2025 14:39:00 +0200
Date: Tue, 9 Sep 2025 14:39:00 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next] net: sh_eth: Disable WoL if system can not suspend
Message-ID: <337a3aa0-c49d-432f-928c-b8976109201d@lunn.ch>
References: <20250909085849.3808169-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250909085849.3808169-1-niklas.soderlund+renesas@ragnatech.se>

On Tue, Sep 09, 2025 at 10:58:49AM +0200, Niklas Söderlund wrote:
> The MAC can't facilitate WoL if the system can't go to sleep. Gate the
> WoL support callbacks in ethtool at compile time using CONFIG_PM_SLEEP.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Thanks for doing this.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

