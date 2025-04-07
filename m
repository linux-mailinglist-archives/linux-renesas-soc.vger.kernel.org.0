Return-Path: <linux-renesas-soc+bounces-15448-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40322A7DF58
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 15:33:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D35AB188CFDC
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 13:31:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EA2222F19;
	Mon,  7 Apr 2025 13:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B7f+HMOg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5838440C;
	Mon,  7 Apr 2025 13:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744032700; cv=none; b=QPoqf0CUS/H8ywNYBk0uTjfCRvOGmz28sb8YRTcaM/l8uo2xvzk2ZHAgt9fEq+5ufHlE/75JykcyZgIc9mPSuTAnDeVo7kpgIS77208+yzAKcXwVyQiQ9aDxpzOvTamy9SFL2GDJQKubAXwm/IDAU0ErAWktAvBaepjwQcpkbms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744032700; c=relaxed/simple;
	bh=X89Nx0mUkmAYD9gmyxNqdrkKNgo5nM0xiJ+ZWX+HdA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r6LqZOtKlDlEUZzqU673mYcGGkObYurOLYf3wCqt3WOfQQ5/CkXCJLFgbP0ZnQUExWb+9MZrLUq3cWROA+DNAt7xX90V6fxq3xBd0xnpaShbeGF/BFmSlb4NLhgiDTSRBQkWSYBBsxWotnXCytLQPAcNNT0akLqFF3ocsq/XWDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B7f+HMOg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A601C4CEDD;
	Mon,  7 Apr 2025 13:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744032699;
	bh=X89Nx0mUkmAYD9gmyxNqdrkKNgo5nM0xiJ+ZWX+HdA0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B7f+HMOgost95uXfDRCNOzyRhGriU8Vk7lhihDAnk9qySR0O2QhAV6zMrhCrnEUZt
	 GluWxFUmwOkBhv1ufcgyTzjGiAh09lyLCcWc+A5F4YcrjfulbRG7IQRD3UaaL9xWtN
	 OJB3m62oLdo+jDXvEviDjCW6NUqSEGPMDb2qEe642fH7smmVuSMLgv8A8IXM/1amn0
	 m8Ix7219/nENdelqeXz9wPaZPdOgHfTsKvWC6VHNSMc8KwAuZKxaJKMZwMkKRxuLWU
	 /KrjiGggtZG0GDwMRb1czYDkAGxAevNmyhWJixBZVzuCkyWN9CrFSvIcHqK3OikRob
	 9yy8VpldbaQng==
Date: Mon, 7 Apr 2025 08:31:38 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v3] dt-bindings: mmc: arasan,sdhci: Add Renesas RZ/N1D
Message-ID: <174403269795.2022787.15208655034611583413.robh@kernel.org>
References: <20250405173631.13564-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250405173631.13564-2-wsa+renesas@sang-engineering.com>


On Sat, 05 Apr 2025 19:35:26 +0200, Wolfram Sang wrote:
> This instance has a wakeup irq defined. It is currently not used by the
> driver.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Change since v2: - rename "wkup" to "wakeup"
> 
>  .../devicetree/bindings/mmc/arasan,sdhci.yaml | 22 ++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


