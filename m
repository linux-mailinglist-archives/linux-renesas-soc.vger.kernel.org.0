Return-Path: <linux-renesas-soc+bounces-17768-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6462EACAA28
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Jun 2025 09:55:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 932C51896E9D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Jun 2025 07:55:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DE2B1BE86E;
	Mon,  2 Jun 2025 07:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pPNnLfuq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6F22C3255;
	Mon,  2 Jun 2025 07:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748850940; cv=none; b=sCd1D9neU2DbEBr4ovyGpB1Osd/cDwDYg7torfvYkLp+r1FRzbuG2YO7umG6+yy+jjwlUR8//njXJ6aED3pbariqPfPGoHn2wGRiOonpHI/7n35soyMNyre+PLzumClAKw0QkmAbwUMIfu9+XROzW7BhHDu+S0R3d0j/HV8Si0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748850940; c=relaxed/simple;
	bh=vwKZcs1C6yEncVvS5kE7dcFpNl1BI7JiVnonDdJR4bE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=clRYw+/N+dlfYg3Hi3+VwF4yN4bCtBHLbBEaIphWoeXyXCEDKFkOWmR4tqiF+gHWapBHam8o6S+J+hSsD611t6Jy3O4/71VC0pcQMCQVN3HPcNKspNevuxrRXih2upn+lar4E4JTUIMhieJQylAPJ4dCYDAFHQMtyEnidczMdew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pPNnLfuq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C856C4CEED;
	Mon,  2 Jun 2025 07:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748850939;
	bh=vwKZcs1C6yEncVvS5kE7dcFpNl1BI7JiVnonDdJR4bE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pPNnLfuq2rQGrFzdg3ii4IMMrY2DePvgtINGiBjyjeBmc1lIwVZAhnWVYzFjzdoLQ
	 JCEXvjwaoHDxOICRt8He2Qd4a7KEtUYlBCUNVFvnVI/H7P23+nqB6fMVTCxo9NljoL
	 h/7ygDq4FRwR4tMBeIXW++adPulEbxRoKm/Er7zLMcfmGSEdCZgscXEO8p1aUk6oW7
	 zQQLY+lHiJmDRjTxdx1tMtDOhwzSNOjxgwjRdbC0d4k6/ZvyRw+uyU+TvfNFYi6y7L
	 Q7ozZasjExml+/0qBp8DXsqB9M9SCjRhyzwy35Nf2wXeF9Dw1f5nQ9oR0cDcODRgdv
	 QvXBb8KeawSqQ==
Date: Mon, 2 Jun 2025 09:55:37 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chiang Brian <chiang.brian@inventec.com>
Cc: jdelvare@suse.com, linux@roeck-us.net, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be, 
	grant.peltier.jg@renesas.com, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 2/2] hwmon: (pmbus/isl68137) Add support for RAA229621
Message-ID: <20250602-elated-aspiring-squid-d27ee4@kuoka>
References: <20250602050415.848112-1-chiang.brian@inventec.com>
 <20250602050415.848112-3-chiang.brian@inventec.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250602050415.848112-3-chiang.brian@inventec.com>

On Mon, Jun 02, 2025 at 01:04:15PM GMT, Chiang Brian wrote:
> The RAA229621 is a digital dual output multiphase
> (X+Y <= 8) PWM controller designed to be compliant
> with AMD SVI3 specifications, targeting
> VDDCR_CPU and VDDCR_SOC rails.
> Add support for it to the isl68137 driver.

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

> 
> this patch depends on patch:
> dt-bindings: hwmon: (pmbus/isl68137) Add RAA229621 support

No, it does not, please drop this sentence.

Best regards,
Krzysztof


