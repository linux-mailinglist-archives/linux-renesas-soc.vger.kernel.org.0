Return-Path: <linux-renesas-soc+bounces-9943-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6C69A67B4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Oct 2024 14:13:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E3171C215BF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Oct 2024 12:13:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E92DA1F12EC;
	Mon, 21 Oct 2024 12:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cas+vdo7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06671DA314;
	Mon, 21 Oct 2024 12:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729512820; cv=none; b=YAU4pbrxkqH3Hb1nIMC/CiZdo0MK+EHzzKCvHIXmbga0SFtbTpk4FEQrg8YEQTkaFVPuIsAyMUJ2yTeVmIabx6xKO/P1VcF9Zn77Ym97RacGAyZL8kO8RgWCh4gd1ZBAQQXSnSv61EBRFKWLcx8LHrdfga/XRn9qU0Pn+9cE7xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729512820; c=relaxed/simple;
	bh=SPJORoXMm6uQpdXvW0Ah1+v97I3+rNx2RapMTpuGGcM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mkrL0m3lxrDfKczt7uB20Kh4dmEp3/HPPh8Cu5cg4zl2NPdcp0W8Trc/gkmMcAzAVpwNLBS2VYT1ggkkW7D/QlD2yvaGMpoOECkfXj6E0SdHXOyCs3nLbfu2BqMyl9vppSfzvRKuqnHx0tYEX+chQ2UfbGV5crqDDR5ITV+earE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=cas+vdo7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEDAEC4CEC3;
	Mon, 21 Oct 2024 12:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1729512820;
	bh=SPJORoXMm6uQpdXvW0Ah1+v97I3+rNx2RapMTpuGGcM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cas+vdo7E3cS3ZwSR/iLbMksBIDfWi40eQDEMsCCh0VEDsq5ZtgS6w/t286oAk4al
	 QSLYuVQ+7it+klkY+o9VfRwfg+5W3wDlXU4hYESW/9lW6zaLi07D7x/5ZKSHiqcpGB
	 0K1W7GBdqkyHDtOub4pskEOrm1npAJgjA8sx1clE=
Date: Mon, 21 Oct 2024 14:13:37 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Paul Barker <paul.barker.ct@bp.renesas.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH/RFC] MAINTAINERS: Re-add cancelled Renesas driver sections
Message-ID: <2024102128-overthrow-sulk-4260@gregkh>
References: <0a189e2c4090a1b308e18005d2552e335bac354f.1729511337.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0a189e2c4090a1b308e18005d2552e335bac354f.1729511337.git.geert+renesas@glider.be>

On Mon, Oct 21, 2024 at 01:56:51PM +0200, Geert Uytterhoeven wrote:
> Removing full driver sections also removed mailing list entries, causing
> submitters of future patches to forget CCing these mailing lists.
> 
> Fixes: 6e90b675cf942e50 ("MAINTAINERS: Remove some entries due to various compliance requirements.")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

