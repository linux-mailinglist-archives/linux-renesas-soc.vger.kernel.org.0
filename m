Return-Path: <linux-renesas-soc+bounces-22851-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E13BCA951
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Oct 2025 20:37:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 230354EB9B7
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Oct 2025 18:37:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CFB623D7CF;
	Thu,  9 Oct 2025 18:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Kx7NX9AR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615E71BFE00
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Oct 2025 18:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760035046; cv=none; b=SElk+/UC6IWd44RO0wMcROeUGg0rCrHkYwmNw0yBXxARaNd+3aZe3p7j3vLwLzX35WFkkbgiyWZogCdIA2S8kj4PqFMfwbARummBN17LPAa3a/BxNY07Ctq0AWdXKSKJiluUM1rWC+gTwFihhs8Tx79+63T707bJtj8MYNIAXIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760035046; c=relaxed/simple;
	bh=tcSJaZ2PlKirw820jhMAFsXm8vgWlwz7OJayEOZD/34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JQz0Pwdup05Vwml9KLAddatXSbN6UqDmrv0VtWWVmBuBAfIs3K7im3mhus4Egl9y2KCsckfo05b61iA1TsHh992KzKXfYrJSA2/WxmpCfH68EbhU8FMrKb/9P+REYp/2iqcPpZ7IpCLFFfZF4HHiaDz6ylNRqA/09K+VOvQGBQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Kx7NX9AR; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=hbh8
	TMXYf+etZgUAQPjpPZ7XfLQwYq9N1IeDlkqaRKc=; b=Kx7NX9ARTd1R4rOgttHw
	1k8S6rIbd6gCkSWYKa5sgtH7eBb8+YK9ZBEgD5XxvFx/zZvAcQomuo9GO55GfuC6
	6FXAcoi7w9B70fGipy2hbfE5pf9eSnVTGDNu0f2hexfWdMUwMkOW2W4fxqB0aDp5
	p6Ol5K09JVC/XLwwVdG2GgOGk87LiGaHSRn9wkXFKiwj8yLDYok/F0xHQYtwpz+z
	KVqE7tLqId/xm6NNea1uclzKcUjJSmbNZJVmDoderElAMX6R68GB0be80g4wfiyR
	ThEgE5T9QHF+9LSHjCA36T7LNQmUk4dBHZ0B9QkeURGtAaiyYRMPzQkF1sKhWBlw
	9A==
Received: (qmail 1186063 invoked from network); 9 Oct 2025 20:37:22 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Oct 2025 20:37:22 +0200
X-UD-Smtp-Session: l3s3148p1@bx15F75Ajq0ujnv2
Date: Thu, 9 Oct 2025 20:37:21 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] dt-bindings: bus: allwinner,sun50i-a64-de2: don't check
 node names
Message-ID: <aOgA4UnDDaTBR7Nw@shikoro>
References: <20251009111500.75198-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009111500.75198-2-wsa+renesas@sang-engineering.com>


>  patternProperties:
>    # All other properties should be child nodes with unit-address and 'reg'
> -  "^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+$":
> +  "^.*@[0-9a-fA-F]+$":

'^.*' can go, too.


