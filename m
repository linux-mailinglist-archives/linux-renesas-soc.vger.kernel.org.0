Return-Path: <linux-renesas-soc+bounces-21919-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 81165B5963C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 14:31:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2368B1BC0911
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 12:32:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E54030CDA4;
	Tue, 16 Sep 2025 12:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="0jjv41uM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD81154425;
	Tue, 16 Sep 2025 12:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758025903; cv=none; b=C3u+0bxUg6jQrDzHxpivhyeUwPHj3lCCvryefTSu2pj6cUO8ncqWf3zakZFW1SL9ZcuOjvNxxM8x9uD6HcR57HjrgsomtBUQffRnmvuxZU/vktVF8k3teonnw2T0M34W9Qz45nSw/uW23RxcoET4fLGJmJHRcYsmnq8naBIpqRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758025903; c=relaxed/simple;
	bh=+MBZ/pO4RT3VegSc90Xes8dzozEB1fyK40YcnFY0swg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TJpqJb5OaGGMzR2gYt4w361fK83zkvQK4VLaflgSIZvdoxzVJcTDTAvva6TUuTh0KUyp3u0dKVtwvyBPNMRRkHsK4BELTHIx6nlbv1itfn/A8F6vW9xgXQLJ/i7dQsfG1WW6vY9tAwAozQEQ1GCISdsfN4REbjU/4NFpRSbmhOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=0jjv41uM; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=xvhTJsGRhbbIkl3VpXrIpLKA5wH6cb1SeRRnxpvOh3w=; b=0jjv41uMIyDlY/T+rMZ7ZucmSi
	m/gwH03vopX5tISw50kb505tqeIZ8RB3wOSl0tJSnnwM8qePPG/HDELkCHF1s0evxcjk6q1NEYGFS
	4iIDg9SxdQs9X/RFedVXxQUnEIj9l3Ujz6VbT7C1cV5ZZCeS1s1mMQ2upNAQDbaSwicc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uyUqH-008YjA-RM; Tue, 16 Sep 2025 14:31:29 +0200
Date: Tue, 16 Sep 2025 14:31:29 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Paul Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next 3/6] net: rswitch: Use common defines for time
 stamping control
Message-ID: <610436b7-ab28-4a76-b702-772b5756b17c@lunn.ch>
References: <20250916101055.740518-1-niklas.soderlund+renesas@ragnatech.se>
 <20250916101055.740518-4-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916101055.740518-4-niklas.soderlund+renesas@ragnatech.se>

> -		get_ts = rdev->priv->tstamp_rx_ctrl & RCAR_GEN4_RXTSTAMP_TYPE_V2_L2_EVENT;
> +		get_ts = rdev->priv->tstamp_rx_ctrl != HWTSTAMP_FILTER_NONE;

That is not an obvious transformation. The first looks like a specific
subset of events, while the second looks like any sort. It might be
worth commenting about this in the commit message.

    Andrew

---
pw-bot: cr

