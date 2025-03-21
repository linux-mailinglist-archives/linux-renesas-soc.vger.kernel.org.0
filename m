Return-Path: <linux-renesas-soc+bounces-14723-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D62FA6BF1E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Mar 2025 17:07:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ACF2A7A8ABA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Mar 2025 16:05:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2403B1E00B4;
	Fri, 21 Mar 2025 16:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ndIteDHz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E919B1DB366;
	Fri, 21 Mar 2025 16:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742573174; cv=none; b=QyujTLO+ltlhg1kOZceRZeKGt6FPZV+sKOcoLdje9YsYShCnrREKMxQKCNoMsbM+HkBcu5lmmSzGlKtlnFDQp23BDlcwzSXQjNKnGWpB3ww11Mi8HG9XL0v7thQCCn9eDUPRlIVGHFGCNO0IrwrvvPcXicAz22wbKzyCRyDs4Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742573174; c=relaxed/simple;
	bh=9MuxfE/JFtH6p1F3cORnk3klNFQ636CEuD19fG4yBZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PNH2YArXweE6GOadx2aCoRFN6Z7+x6Ihhtm3u1cfmtgYZ8i48Yk8X/QKhffCS/3inRa/2T5lELhLXpbCdspg3Q2fDdt4+ceu32K6k5lcGhTvZW41BdvzVQnDSw+oNeKVsDsSbVV1nR3vGz3qPJGVdkOYPjcnnspO9FoE7qXBG1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ndIteDHz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10624C4CEE3;
	Fri, 21 Mar 2025 16:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742573173;
	bh=9MuxfE/JFtH6p1F3cORnk3klNFQ636CEuD19fG4yBZs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ndIteDHzNuKNYW6lT0NTbNV0nMtqdJ1tAwTksfWcgwhJAxzcL89Ru/h0uwu4wLrG7
	 WHDLz2E8IKNjWowAse10SYQidO6WDgRqF88/IrpT+4J94glAFBQQh/4a3qXKAxlzrF
	 eFpe5gYmnsgviwUvm2n1fTlsKq/KzmKkW25gDwNydbCcWKrtiCbyVjFw6w5As6to3Y
	 vzgBhcaTShTVO9ED+l7aG/vz6mr/N5sfLT6gjjBZfOn4EJrZhP+3Q/D8SP4xM660Ed
	 0SmB8S9bxpy6fHuTpf6LauOmuItHmvgLDmcj5AXOkgG+VM6hoqLY/cpJ6l51oM+QFx
	 63zkaJk8A+t3g==
Date: Fri, 21 Mar 2025 11:06:11 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
	Jiri Slaby <jirislaby@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-renesas-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-serial@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: serial: snps-dw-apb-uart: document RZ/N1
 binding without DMA
Message-ID: <174257317145.3454952.6503237697790282139.robh@kernel.org>
References: <20250318085353.18990-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318085353.18990-2-wsa+renesas@sang-engineering.com>


On Tue, 18 Mar 2025 09:53:53 +0100, Wolfram Sang wrote:
> Renesas RZ/N1D has this UART with and without DMA support. Currently,
> only the binding with DMA support is described. Add the missing one
> without DMA support which can fallback even more.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  .../bindings/serial/snps-dw-apb-uart.yaml     | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


