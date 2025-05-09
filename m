Return-Path: <linux-renesas-soc+bounces-16859-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3DEAB1439
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 15:01:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB135189158D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 13:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9062D28EA40;
	Fri,  9 May 2025 13:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="b4Qbd4mF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237CA28EA45;
	Fri,  9 May 2025 13:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746795665; cv=none; b=VZ6ducTcmqZztxCP4E+8L5YDNnYjsMWDqimtqT2Gs5n4ZEknw+hzJCUnLWLCRsdo+BYeRpFKdowCVUe/Z0Mk8QgyJkcjdhweoa/UbWSWUcbyJkOQOi2OgZ+RNmvvAc7neDvdKJtvKCy7mruOXW+cXtSXW+GoxI6msjcg3PWQ4vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746795665; c=relaxed/simple;
	bh=4golUNbzkJaW4FGVhyb62ZVAkVMJaWk67Gx8S8QZnKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bIGI6nqEBYg3Rnu83dpCYOR7TPaNlwjOvBwa5y+ZRVDao01Rx+k0GDVW1Mw5uNni3MwJ/EmEblpHIHuHTd2ngN9jK1PNbPXnpslLHZEZb7LT5Uu3USMAzQh+FNcpknFnoS7HHfkKV3hFvE6qBsFuHdXisT7kudgSHUO6u1j9yiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=b4Qbd4mF; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=AfEelIj+BBvQA3qNO9D9UmBF4ba/BqaL4KcD9NEPvFk=; b=b4Qbd4mFlKccaQ6pTjFzKmIxvJ
	7UxlLabbpE8L6hNRiAZYvKuJCdyW7pRWF2sUuETLFxviVxZ3x8ELYu7ZHKYUCaev5kVwGpcwxtfR0
	WEwO3aOlmgx1as/vK5eSKGBJSE+3BiN8PPtG/Lr74jl+Xd9s2wsOV7G4JuNEiJFGQRQU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uDNL9-00C70E-Uz; Fri, 09 May 2025 15:00:35 +0200
Date: Fri, 9 May 2025 15:00:35 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: leo.jt.wang@gmail.com
Cc: robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
	keescook@chromium.org, tony.luck@intel.com, gpiccoli@igalia.com,
	geert+renesas@glider.be, magnus.damm@gmail.com,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, george.kw.lee@fii-foxconn.com,
	leo.jt.wang@fii-foxconn.com
Subject: Re: [PATCH] ASPEED: bmc: Add device tree for Meta(Facebook) Clemente
 compute-tray.
Message-ID: <d8e561ec-e600-4b51-b901-6fd125eef8cc@lunn.ch>
References: <681dc3eb.170a0220.1fd80.c9ce@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <681dc3eb.170a0220.1fd80.c9ce@mx.google.com>

> +&mac0 {
> +	status = "okay";
> +	phy-mode = "rgmii-rxid";

Please see:

https://patchwork.kernel.org/project/netdevbpf/patch/20250430-v6-15-rc3-net-rgmii-delays-v2-1-099ae651d5e5@lunn.ch/

Aspeed are supposed to be fixing their MAC driver, which is currently
broken. You might want to apply some pressure to them to get the fixed
merge. Until then, you should drop this broken node.

	Andrew

