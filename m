Return-Path: <linux-renesas-soc+bounces-9944-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B863B9A6A9A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Oct 2024 15:41:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 656941F23F8B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Oct 2024 13:41:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C80D21F429E;
	Mon, 21 Oct 2024 13:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WptIpH63"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAD8193427;
	Mon, 21 Oct 2024 13:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729518049; cv=none; b=DF98TD08tKsSazVCGIxtswFqcpviz2ufy4tQwcmQGOnkdo01oKarCit/I2rZL/obu5T8/uNlkp9iLuXH0UFq3VerQ1sSAW6kEfnqbpPROtj78sl6lMtlVsGZFczfBeJtWFlfc4wLomE2O21iQhK4ZtoZiyQBSQAQ8+zKnPfkHhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729518049; c=relaxed/simple;
	bh=//TuR2vpQb/x+53X9SqEKAr6hKvU49CnnUVsXV92/a0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TbQrVzVp/JwnET/uOcoyeegdDRkAg989yfCVz4+6bJHKEoksz+yFZa+2Dy2wDpYayiv0Fg6QoXbt48LxFL6EPZ/8886B6Rxfr8X/TJU2Wc0yPan3yby7mJHBvud2nKxqFvg1vIkhgSQyV9xc3f+1EMKgsvtbZ1F6CBfhFvhtiPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WptIpH63; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE076C4CEC3;
	Mon, 21 Oct 2024 13:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729518049;
	bh=//TuR2vpQb/x+53X9SqEKAr6hKvU49CnnUVsXV92/a0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WptIpH63WTgdNfwWrAxEoEKr6/OClNVz0YvpB4l3PMREqCWKxzk7DHmvC9DsEbuSs
	 eQdNp8ho9IJQpgOhdlTIRdRtir5nNjqGy0ElIlEX+LNBj2g2cMgICpnAoqzBhoSSRL
	 TSPCv0cOc1vRk7C+gmcMSYqwep3zxGXjwiyNOw67AAR6xz70t/VM3JNIUiTCsnFNdn
	 r9K2L74wj2ivu3nGKITGeeM9tyduPkkL0kzrafudFr2O0U0scFYe9blEh6wy2Bq+mD
	 0iBvwpbOVAON89Hd627HumTN0yE6Zh/clPzYBoiSBHhh6M9fcWjZzKav6OjY2+hlzs
	 In3wipGli9R7A==
Date: Mon, 21 Oct 2024 14:40:44 +0100
From: Simon Horman <horms@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Paul Barker <paul.barker.ct@bp.renesas.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH/RFC] MAINTAINERS: Re-add cancelled Renesas driver sections
Message-ID: <20241021134044.GJ402847@kernel.org>
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

Reviewed-by: Simon Horman <horms@kernel.org>


