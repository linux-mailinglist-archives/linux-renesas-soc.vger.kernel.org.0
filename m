Return-Path: <linux-renesas-soc+bounces-18879-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50724AEC6FA
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Jun 2025 14:05:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5DE7A4A3A81
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Jun 2025 12:05:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7984A246770;
	Sat, 28 Jun 2025 12:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jlBSfVn4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDF51799F;
	Sat, 28 Jun 2025 12:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751112338; cv=none; b=aTuTSMSd6MjmmjyLWQBzU9QacMTGUHU8eR21fOLEr7Nd+eocVZjBuNx322WGAoAEcM0/izNKrna4DQfi/z5uZmkOTPNv6Kv2GkJzoDLKWnKNa2LmSvrlTIChAwLcMmY0JzyN0TTGG9wThgzr9IYpV8AeFZTWqtZjj+XOdeciBnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751112338; c=relaxed/simple;
	bh=DttSR+loL/+XwutcRtElHNrAyAfQKYpKcvL9oh1brpk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UjYuzLq66IMxzxsVV2Ppcgemc99VojYg8A0c4ZUoowFxHDB4ur1oS/3wTFEBBpZQ4tKSfKXLPBFOUL7m60gPuC3kd2f8ciWdBMIkvApR/g6cMUzZge+uWNJO3anfnUnN01b6csex9elTYBMZnv02rPDqGl2qYjBW8yVcsL7D27A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jlBSfVn4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D23FCC4CEEA;
	Sat, 28 Jun 2025 12:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751112335;
	bh=DttSR+loL/+XwutcRtElHNrAyAfQKYpKcvL9oh1brpk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jlBSfVn4ePgI4Y+1FPzDgHJ46C9P1SILP9iSnzYGnpProm9sYoW/Yfz0dZEYBNbLG
	 7xgr7rsmMVS1iP7E41jLMCefzSJ3nU5xYHvsMiVAIDmXlJ6IB9hwW22YNfTPHErpDP
	 a32lkyHkTYoUfFxN8z8ahdTMvan7bAzFaCBh/CKxLsRX2kMdzQc22oBpkWFauji0SX
	 Pk33L/NS4Euj4O3DueYOGBFQrudskK+xJEIFuu31f0F0J1pLc3x+o1KNtlEySNB2FN
	 xyc6ouX96CcQfC+WsPLz3B4jZTht0jN6ZaEoZ0TLzlJkJ2T00KQGK+JNVPEgUUlfdt
	 AJ/oKPUIY/nug==
Date: Sat, 28 Jun 2025 14:05:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Leo Wang <leo.jt.wang@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, bruce.jy.hung@fii-foxconn.com, george.kw.lee@fii-foxconn.com, 
	Leo Wang <leo.jt.wang@fii-foxconn.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: aspeed: add Meta Clemente board
Message-ID: <ojyrhi2stm7q6kcd7yl3je36cccbzypsepmc4fvl7venynyu5g@52rs6bntmnwl>
References: <20250627-add-support-for-meta-clemente-bmc-v4-0-ce7ff23460c4@fii-foxconn.com>
 <20250627-add-support-for-meta-clemente-bmc-v4-1-ce7ff23460c4@fii-foxconn.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250627-add-support-for-meta-clemente-bmc-v4-1-ce7ff23460c4@fii-foxconn.com>

On Fri, Jun 27, 2025 at 10:59:02AM +0800, Leo Wang wrote:
> From: Leo Wang <leo.jt.wang@gmail.com>
> 
> Document the new compatibles used on Meta Clemente.
> 
> Signed-off-by: Leo Wang <leo.jt.wang@fii-foxconn.com>

Checkpatch warnings.

Best regards,
Krzysztof


