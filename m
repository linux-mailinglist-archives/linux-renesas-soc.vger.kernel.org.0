Return-Path: <linux-renesas-soc+bounces-15872-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 369B3A864B3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Apr 2025 19:28:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EEE588C0EA2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Apr 2025 17:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D538230BF0;
	Fri, 11 Apr 2025 17:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cf3mNQtN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC53123099C;
	Fri, 11 Apr 2025 17:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744392193; cv=none; b=fGhSdKbyv+Q4mOGy5G+JtMgkbqA7ddUIuM5gk/IJAnLkwpTeqqoWLKLZOsVW6ZEOf3b+bH9KHwgtSRY3TfUV9HDaP0nIYOSH3NbJlNq6xrjSj/W+g1PqtymhkXJYGVu8cYq8yDsmeHAMY1L4aHoKKJSCaTJfTT/iOGqHwuc11GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744392193; c=relaxed/simple;
	bh=ERyjsQ1M3EAxug/PGHbTwXHaDvmCVIXQyTsmFurqmpA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c8sAWtSfod+GQuzBoVQ9Qq0u1AgF0D+LaoNb90as4JdI7ltIChvYesmDx1OcsFVfxTmXkcJLM7mtehATcdVcBDtDC3uDUQJtHm8FPPipiqPYUBUq3o+eqYrwrYMjtS+ecwqfm0HYB/Jc7UBCkXRUPx2gncESz7AS5gkbgjAL0E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cf3mNQtN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DA98C4CEE2;
	Fri, 11 Apr 2025 17:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744392193;
	bh=ERyjsQ1M3EAxug/PGHbTwXHaDvmCVIXQyTsmFurqmpA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cf3mNQtN08zoE7uYbz6GM/u+v7lAUYuMaNs+cjAnWU2xMJLFv6MUJb8oIFdf0wyBe
	 7JcXyavUkEtAoD3o+CVqkz+0F800vaaLV/opXa0wZ+80G6lWL+XOMd0pxAuV3gMWPJ
	 Rl3ZvPftQ8o9kOLb8ENLeJQNsTgP1LOFvk/uyMCkAMIx1a9tUhvH37hYIzrCKSc0mT
	 XXyP9dzq62FdZpbHKN4Vy4PkS3nVPjHgLhx/b9dNUV5NSedDK8HcoFHli1gejLZ/g8
	 HnydNNNWHynNIrQ5dSj59byLnjaNYqeyvMBS4ckBL/NGl/eShzqXsDalHjfnNDol2r
	 29Ke4xFNO6GKQ==
Date: Fri, 11 Apr 2025 12:23:12 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: imx@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Sascha Hauer <s.hauer@pengutronix.de>, linux@ew.tq-group.com,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt: bindings: arm: add bindings for TQMa95xxSA
Message-ID: <174439219157.3544865.14100579453477378929.robh@kernel.org>
References: <20250410113107.2057426-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410113107.2057426-1-alexander.stein@ew.tq-group.com>


On Thu, 10 Apr 2025 13:31:02 +0200, Alexander Stein wrote:
> TQMa95xxSA is a SOM using NXP i.MX95 CPU. MB-SMARC-2 is a carrier
> reference design.
> 
> [1] https://www.tq-group.com/en/products/tq-embedded/arm-architecture/tqma95xxsa/
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


