Return-Path: <linux-renesas-soc+bounces-7517-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F7E93C30E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 15:31:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B9DC1F211EA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 13:31:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38A2E19B3FF;
	Thu, 25 Jul 2024 13:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XYEWS4jC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C48E19B3ED;
	Thu, 25 Jul 2024 13:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721914141; cv=none; b=qeY4XCVUGRhPSU+LodpEkutArtZnqBERgxUXSZP/RxzUzgiH+PGlnLMZO1YkdAtilCW32LkHbeZaxSgcwVXRZFXQycID53u2yO9rpfprRsvxmWV0QLnLm6KzQtEvxDBVJ8Bh6SMHb6ZURBVZUhyOQRgUZSHaqpIPWkJQc0wwSzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721914141; c=relaxed/simple;
	bh=B9CiMqUY4/aqnqxuh+fJHJ1eA4Qr3qFcO8FOzPa8F0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rnySQDPmcxrx/OPheu7VvJgW7KS80vHnR+UJXaFYMFIRRoK+I3uiW2LPj0BmxLeZG+kVaR6+g3QCBiO2fXypRjQDd1T7JBe+QQORmRRgyIMsh2QhAcDbLorKNpJBD3li+X4R0zAy4pTeDA57Y56v52qlHhf4BIlk/zVKObIClmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XYEWS4jC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61FD7C4AF0A;
	Thu, 25 Jul 2024 13:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721914140;
	bh=B9CiMqUY4/aqnqxuh+fJHJ1eA4Qr3qFcO8FOzPa8F0w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XYEWS4jC/34HR83DdGSg+UAaCUDk46SmkvrRgJTTV1Mf3U64UsYTYAwu1Mz1OYYQn
	 QzDO35f6AB30X8SWtppSBGfE0s8kH2J78Wi7Bk58pUUEKw7shL3YbCG23TnPqFeayS
	 sequePISzFnA7zZY1YsOLHaymRHNrVwRTZ7RjxwgJu3Y5NtWpGah4XciimF+Kfidpd
	 UX1YWfTkcOdFyIKQKv36fzgmnB28LdHoauT0Yh0mv/PDrwDr2KCIyx/VDwUswHBXbj
	 65d7/bE7PiqiKn+qa70vmaxg+4sDdNZt1cMM6WzSMSIurPjGbKJoqkdt2fuTYtCypC
	 /5Mr9RRKobLeQ==
Date: Thu, 25 Jul 2024 08:28:58 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	devicetree@vger.kernel.org,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: soc: renesas: Document RZ/V2H GP-EVK
 board
Message-ID: <172191413781.1725520.9808711878710206779.robh@kernel.org>
References: <20240724094707.569596-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240724094707.569596-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240724094707.569596-2-prabhakar.mahadev-lad.rj@bp.renesas.com>


On Wed, 24 Jul 2024 10:47:06 +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add "renesas,gp-evk" which targets the Renesas RZ/V2H ("R9A09G057")
> GP-EVK board.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/soc/renesas/renesas.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


