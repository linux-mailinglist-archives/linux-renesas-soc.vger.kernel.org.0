Return-Path: <linux-renesas-soc+bounces-11531-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B71299F64CF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 12:25:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB43D1881B1E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 11:24:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4215619CC0E;
	Wed, 18 Dec 2024 11:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n8LatgqE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148581990D6;
	Wed, 18 Dec 2024 11:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734521090; cv=none; b=auczg5/X+CFCQtytpjRWULPefDJNPLxKM0+Xl1yCxQhSiQCnAlPmvbQDfc+W+ZuCwt6hko2lV4OhHpfQ5suhvl1or+WpC2XCHv1Z1d1KvAzYj3dK6xdPtAx7YKZGcFEWyreX7uotr510bVxj0p4fujvI1XzstTTAozyChvwZkfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734521090; c=relaxed/simple;
	bh=alMpVk9mqfPCfgOquRJuNapFs6tSDlAEdyueZl/2N1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IoewOSilep1ALvdW+7pXswZ7YlNse9XF5qS+K+b7TtyWg/pS9ugZk/7IQ1ekqabEGWi0mMl54G25NzBl6AneVigwu4OuVXUPjMov3b4XCWA1V9P+e0GAtZpYQZHnXG/3thc/Xwar65C1NbB2nYPv/hzlY/P/CZUbYRnmYkDYeEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n8LatgqE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD27AC4CECE;
	Wed, 18 Dec 2024 11:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734521089;
	bh=alMpVk9mqfPCfgOquRJuNapFs6tSDlAEdyueZl/2N1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n8LatgqEUPU3CQRCSI2zzmrW8ioOCPikUhennOAT4cz3n5AwPsCzQuiOpqxTyy00Z
	 /g9LJ2seYXByblK3db8B7QWR6J9mz6FCYh2S/nB7YyXFtrN9MI1SLNaB9g+04QZsXH
	 AJXrg7P3KRWiGwoouoZEttxUFFd9hnYLsDH1MWQyz88BIPUTCKrQcMrRJyLRYmMJXl
	 DnC3rUf4dks/GORvUvoAwj7u4zmrYtrGRuiuEQdzf0Z1yGyu0TJP9CDherl20lQqI8
	 Dc9RZlm83IqMhkFqP1/bO09b/8VEF4rvh2WUc5PuB5aA7zGZT4PBTHXCtCcmzCW7pE
	 g+rMSDWCWG07Q==
Date: Wed, 18 Dec 2024 12:24:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: hwmon: lm75: Add NXP P3T1755
Message-ID: <lbxkztqfy2oxrilnby77xw443iwklgn3snvoqkprfdxypl2ncl@nbim5igcrkge>
References: <20241218074131.4351-5-wsa+renesas@sang-engineering.com>
 <20241218074131.4351-6-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241218074131.4351-6-wsa+renesas@sang-engineering.com>

On Wed, Dec 18, 2024 at 08:41:32AM +0100, Wolfram Sang wrote:
> Add this LM75 compatible sensor which needs a separate entry because of
> its default sampling time and SMBusAlert handling.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Change since v1: added patch description

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


