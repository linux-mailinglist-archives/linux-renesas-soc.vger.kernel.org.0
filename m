Return-Path: <linux-renesas-soc+bounces-4653-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7004E8A6E75
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Apr 2024 16:36:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A69B3B2608D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Apr 2024 14:35:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C46351311B7;
	Tue, 16 Apr 2024 14:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hrqv4mjP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B60A1E871;
	Tue, 16 Apr 2024 14:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713278034; cv=none; b=eZOutbggIMfqPk0HpaZnZ5dWxH295xznaNgj5grXekCntAGnBRXOTAdw4tUqmiL30Qx+KvCHen88L1BtsUQ6dJJG6ITKZEl1U31Xn3NdJ13S9s3R5YDLusyuDTSv8uVo+LKOIOOLKqHgbiNwVA2Etba5vAShtwOBDXBxcPSWB0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713278034; c=relaxed/simple;
	bh=P9TEN91S9OsDLEik2ocnZfo8gjiyP0GBJ9gzUPVNrCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LN67wBqKb2fwVhy0qAj8J+/0hvn4J13blemh3VvDR1wYgayRHnqm8TG4ZWDNPpalXc6tG41X9R24UYYHpXziYeUWXaBVDELft4l0sQ661AWVXEjPkmMQ+HDZceOi2UvtBAf/2lFYs78HgVLKEQQhcyah8RKQ+sNrHsSgSeSlBDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hrqv4mjP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2BB1C4AF07;
	Tue, 16 Apr 2024 14:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713278034;
	bh=P9TEN91S9OsDLEik2ocnZfo8gjiyP0GBJ9gzUPVNrCc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hrqv4mjPPf+ejBTfvRTU5ZuD5NSlrnq1RDxjqe4ogXhhyxt5/Uwgf7IasFk+WAIFa
	 cb8H4AJWqV3VYw/suhNGgniW0rc4cOrMWpnMMQMkICFMZMPRf6fHhvEt2WxW2A1/oO
	 FPQdvRlPD5255ABT6L/sm5ycqXQlLnxuc1bbRiT6BNTTgmsWeS/paZgHtvSJKD2owB
	 1vyrrsLJMDqOA6VyklHHsFfOG7ZXu/GBOOB6oHLT9IIbO1/IVJH/ijRzjG/QfO1ONI
	 12Cg8DfGzX5eTK4eNBnnDK9qExB2KwQES6xu0uxxfhZb1bwHlmrmdeyFehtedzaEAB
	 RKWZgOqcHETSA==
Date: Tue, 16 Apr 2024 09:33:51 -0500
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH] dt-bindings: timer: renesas,tmu: Add R-Car V4M support
Message-ID: <171327802944.2258253.16105089685467889251.robh@kernel.org>
References: <8a39386b1a33db6e83e852b3b365bc1adeb25242.1712068574.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a39386b1a33db6e83e852b3b365bc1adeb25242.1712068574.git.geert+renesas@glider.be>


On Tue, 02 Apr 2024 16:37:02 +0200, Geert Uytterhoeven wrote:
> Document support for the Timer Unit (TMU) in the Renesas R-Car V4M
> (R8A779H0) SoC.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/timer/renesas,tmu.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks!


