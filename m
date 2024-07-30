Return-Path: <linux-renesas-soc+bounces-7638-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8123A9416E1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jul 2024 18:05:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3712C1F22387
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jul 2024 16:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84EAF189B86;
	Tue, 30 Jul 2024 16:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pY9O13SA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56126187FEC;
	Tue, 30 Jul 2024 16:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722355466; cv=none; b=grV4S2XdiHGHOCYDJuJQrWU//LjIVN9lZfvKX8XdIHQru+BSrsieANY/pOqwMqfZZ8dcgkKyzzKHGF3i9VZ55a+jZTra1cU/9PAF354XE+BdWjbUMpJMHPFJ7JSRH5pslYZ8DQvPEzs6HHHH7z7CNP/WQk8dW3uNO6JoYrXOkbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722355466; c=relaxed/simple;
	bh=MtiVUMtFVd2OGmF/TSl1VmAVdy/N7C8CI+ZANhR0ETw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t+5w++mKiHpTglYjxXZBjRs7Scv76T27v01K8CNfzMmnhuZYzSaciQfPl38J7MdPpRuiggbmKiZzvMSvO0DNOpfSDhIDZEoyNNYfWDSunMQBoqx1tzJXH66n71kkCNdhR1eK+/rIjlYZRs3hAFmmbauaEcIe94KUqLNZUzhhQbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pY9O13SA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6A01C4AF0A;
	Tue, 30 Jul 2024 16:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722355466;
	bh=MtiVUMtFVd2OGmF/TSl1VmAVdy/N7C8CI+ZANhR0ETw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pY9O13SAZQSHX+6vB3M6dCsKam1tBmg1WOnmngE8Qk4xX1DqCAGVU77V9acpyOC0q
	 VzgjZk52jDvBOo+DTMIocAPe5wMR60n0uLvmRxqMXmpsiNNKyiit9OS5Fhn/lpiorV
	 EVgxCBfQX5QnjQa07/2x4OHvscOKDaoSUMtmqbUx3aVjHg4e2AXlQUiPn+Qz4ITreA
	 hnOpOcUZ3FYHIwmikTY/V1K8diMeGKaN6YLao2SSvBc4kc//g4JKhCroYv/zm+bGiM
	 i2NOY9LXz56McQ3wWrt7Tpf02Vn3lkZamTYui/a/d3oXeW4W9Z1WPMAjYarPFvzlXj
	 yswRnX6w3zDTg==
Date: Tue, 30 Jul 2024 10:04:24 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Oliver Rhodes <oliver.rhodes.aj@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-clk@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH V2 3/6] dt-bindings: clock: renesas: Document RZ/G2M v3.0
 (r8a774a3) clock
Message-ID: <172235546381.1347447.3727697749151141038.robh@kernel.org>
References: <20240725100534.5374-1-oliver.rhodes.aj@renesas.com>
 <20240725100534.5374-4-oliver.rhodes.aj@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240725100534.5374-4-oliver.rhodes.aj@renesas.com>


On Thu, 25 Jul 2024 11:05:31 +0100, Oliver Rhodes wrote:
> Add binding documentation for Renesas RZ/G2M v3.0 (a.k.a r8a774a3) Clock
> Pulse Generator driver. The r8a774a3 cpg is similar to the r8a774a1 cpg
> however, it lacks some modules such as the FCPCI.
> 
> Signed-off-by: Oliver Rhodes <oliver.rhodes.aj@renesas.com>
> ---
> v2->v2 resend:
> * Updated the patch description.
> v1 resend->v2:
> * Updated the commit description detailing the difference between the
>   r8a774a3 cpg and the r8a774a1 cpg.
> v1->v1 resend:
> * No change.
> ---
>  Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


