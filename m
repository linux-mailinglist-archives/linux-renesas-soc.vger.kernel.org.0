Return-Path: <linux-renesas-soc+bounces-21552-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFCFB48906
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Sep 2025 11:49:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B8153AB912
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Sep 2025 09:49:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7E582EDD41;
	Mon,  8 Sep 2025 09:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="PkcdiBC0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406742E371F
	for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Sep 2025 09:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757324934; cv=none; b=Pt8BxUmcQ+uNhhsM0VUdjH3K87OlUHP7Ow+47T/RQHmvZceTxXYIEwNXBng51EYY85+solWCiOvJSuLkWRtdVKUYt1I0GmyMxVK7ST4zftxWvscoe+iHsjdGhMsW1W0YpGCJQqq9aAIZESfs3AqVPqovUpNCgoSIVfuZyl8W64w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757324934; c=relaxed/simple;
	bh=viGQPeZMM9v7tCRE2AArWz0qJbEDnVio5sMx06Y5T5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VLKbeV4LhC+A9m+R1b5Keoqdi2HM8QVpAAgvISsgYvop1ijuB/J9h9dUk+uigcPl57LlU4S0XAYGmAEIBlHnCE3edratOtLn1nmCY5owJwbW1pgPRkfBYqI7PV8rT2lPyStuytsaXLI6Airy3Z8TGgUkmgOxqzorBVE+jq+c2BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=PkcdiBC0; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=W2is
	/B86XOzKSq4WSKL4Bv/G+KLrAqqioep1TTWBCXU=; b=PkcdiBC01IbDmXEoUIWt
	7wbjjEaPM3YICYaPuexAWAM/AsgzOJzSN8OraOH1otDoImid2phVc3+QeJgU7FZi
	GiAR1X6IPQUUiHsWFnljx65mJdmCKyq/tU5bDR7OweIseEv8na0ZaiPkZDbA9tew
	D7C2R12+W3eAHAsFQuLlQQtWT5hYscMWAIRad+BB6eAQ5ZZtqEImhtkDCF7HkHwX
	uY60ptxtJgGqRlasnlxrvt6vsxF4lkgPCTaMITB/4YxrKCrwztCyaqm/fIhgERPR
	P3gpafLQpXJJebX552ZMrfooksMXIx8GhiUqYbKPY3z8+qxVTgfUjYf0AzKfURbv
	Ow==
Received: (qmail 780016 invoked from network); 8 Sep 2025 11:42:08 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Sep 2025 11:42:08 +0200
X-UD-Smtp-Session: l3s3148p1@1fI+AEc+ls0gAwDPXyerAKQ7QDbxBzog
Date: Mon, 8 Sep 2025 11:42:07 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2] dt-bindings: i3c: renesas,i3c: Add RZ/V2H(P) and
 RZ/V2N support
Message-ID: <aL6k73TBfBcrW2J9@shikoro>
References: <20250908093930.12591-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908093930.12591-1-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Mon, Sep 08, 2025 at 10:39:30AM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add device tree binding support for the I3C Bus Interface on Renesas
> RZ/V2H(P) and RZ/V2N SoCs. The I3C IP on these SoCs is identical to
> that found on the RZ/G3E SoC.
> 
> Add new compatible strings "renesas,r9a09g056-i3c" for RZ/V2N and
> "renesas,r9a09g057-i3c" for RZ/V2H(P). Both variants use
> "renesas,r9a09g047-i3c" as a fallback compatible to indicate hardware
> compatibility with the RZ/G3E implementation.
> 
> Update the title to be more generic as it now covers multiple SoC
> families beyond just RZ/G3S and RZ/G3E.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


