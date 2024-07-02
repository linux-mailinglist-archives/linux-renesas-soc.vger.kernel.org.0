Return-Path: <linux-renesas-soc+bounces-6982-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CF69A923C5B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jul 2024 13:27:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 870351F215B4
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jul 2024 11:27:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CCAC15B10B;
	Tue,  2 Jul 2024 11:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="czqfXp6T"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703C015218A;
	Tue,  2 Jul 2024 11:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719919648; cv=none; b=pbXeTVQwvuN8oXl2jJgXTrPcJt/0vAAkutiSYCVsCOKDzfPEwSmrT015h+3w//9nCYJO4d7pmEArksOWEK2e+zW/OgZk7qnqTZKOtBX7RWfIn+UNLhX9POhstjdHgzSV5oqBFHYlOLwf7g853neXQkWscoOPEunNQpfkOKWz+h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719919648; c=relaxed/simple;
	bh=J1aGWYIK3dI8RIBmHO1WHSAht7+unjWyxWImHlH5rhM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G/EKFp/a38fqnptq+963a852TtH1INcZGmLgFBVTC+XjCfTGabjVszei2FM36BrKz0t8OKL+aXUAKhQsHW8ilALPGZSqtC6FH1lOc7h95aLXc7xDjcISKbuvmV17hQgxbGzPLVKEvi98WxqWKgR1RKHkK6R3cJhQrohZeKmms6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=czqfXp6T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 683F5C116B1;
	Tue,  2 Jul 2024 11:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719919647;
	bh=J1aGWYIK3dI8RIBmHO1WHSAht7+unjWyxWImHlH5rhM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=czqfXp6TB2fdguQW+IH+1cQjsVqxPhoqAVL4U0+xdcNSlfxqLcHjb3MAqNTr+NnNB
	 o6aADD0U6DupD+pvX8G8IhdoWNkF9c/2SRhJDCn2wdmB0Qt6+gyTEjrnWvbwYmjK1x
	 bGxFt/RRjlr9WYuigGZYKkzLcW8Y4KuKTDYYD+iRVXEei3XPGrGCfVzbgOT1JvMXly
	 TJPM7KrH5wrRI3YtgtmUcnjqlykDZlAhDltqtW8BdMEpuJhIUf9lVjrQbPf9at+yFv
	 bNhUlxGX3dycZRBYiQWGJVZsOr5CkmelPidTfSH/nCTQnqqbglX57j+SHuiusiF7sw
	 Il8/T2DsCa9XA==
Date: Tue, 2 Jul 2024 16:57:24 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH v4 5/6] phy: renesas: phy-rcar-gen3-usb2: Control VBUS
 for RZ/G2L SoCs
Message-ID: <ZoPkHNYyy2E_ONRB@matsya>
References: <20240616105402.45211-1-biju.das.jz@bp.renesas.com>
 <20240616105402.45211-6-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240616105402.45211-6-biju.das.jz@bp.renesas.com>

On 16-06-24, 11:53, Biju Das wrote:
> Use regulator_hardware_enable() for controlling VBUS enable for
> RZ/G2L alike SoCs in interrupt context.

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod

