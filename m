Return-Path: <linux-renesas-soc+bounces-18813-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7D2AEAA37
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 01:09:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81EF61882907
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jun 2025 23:10:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 067CF225390;
	Thu, 26 Jun 2025 23:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lYMjO/OP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94012248B3;
	Thu, 26 Jun 2025 23:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750979381; cv=none; b=AA9ViqrKtwsqZoYjxROVph/7/OTABIDpV+PUny0l25k8C3uQpimrFhi9RkY+Hpvn57tU9ifgHitRHx6IcGJSZqPdO9UsSFkXbAQExBZnU/6S0nk4K8Bmy424hmz7bdIr4tfviTqmlVPJ6hBof536xNH/oXh2tTm5wtRgQ8eStSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750979381; c=relaxed/simple;
	bh=QWH4pxTEgncL6DAqMVzz0kKQZzAwd3ujWUCCA+RtVQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UoFgfR0RrSNDQdhB0t0QNl98VVRSfZsKy/3OghOkkLz6nsZRhU+iGBUatFGHSxQsJPjIGpem6V+pL09+tM3VAXEGMwSpRmtEdIr+4djfuL3QwRL4eOMZDLVLrR8pbefoe+rwL8neEVOpK/Zw8SsNHj9TtYDgYPEWIp9/Cxj1TKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lYMjO/OP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37AD5C4CEEB;
	Thu, 26 Jun 2025 23:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750979381;
	bh=QWH4pxTEgncL6DAqMVzz0kKQZzAwd3ujWUCCA+RtVQE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lYMjO/OPkM4oShBjK75o0glbqAp0g1d7Eoy/U3UTedHYmJ+MtUxv6ZjgfYLnrjxRm
	 jak7POzg4amgAB4nZL3q0C10fpaL1gL/VEgNKTO5NwtzSELjNkXwp1k65ZfF3iFSaH
	 tkelN0EVst1Ib4hdqu2hMReclePB2PwE2Tk9i6VyE3HP/2KgKY+AiHt8akV5eKL7YA
	 d1Qb78LsBeKD/JdDN+9C7FDMuO2kuGKqlyRcvdlCFZ9+0V+NE25A2csIIAuu81ap+y
	 y8wIYlqTBcqWOEwfWio3iCwwXc2Px2VXnjXschMfOuYcUjarWI7StrTk/DwX5LKr+A
	 IEVy6XDvlvkEg==
Date: Thu, 26 Jun 2025 18:09:40 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>, linux-kernel@vger.kernel.org,
	Jiri Slaby <jirislaby@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-serial@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v12 2/7] dt-bindings: serial: rsci: Update maintainer
 entry
Message-ID: <175097937956.1362465.5042902153110786227.robh@kernel.org>
References: <20250617134504.126313-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250617134504.126313-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617134504.126313-3-prabhakar.mahadev-lad.rj@bp.renesas.com>


On Tue, 17 Jun 2025 14:44:59 +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add myself as the maintainer for the Renesas RSCI device tree binding,
> as Thierry Bultel no longer works for Renesas.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/serial/renesas,rsci.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


