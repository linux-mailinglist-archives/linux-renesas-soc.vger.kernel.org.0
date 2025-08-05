Return-Path: <linux-renesas-soc+bounces-19988-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 22576B1AF22
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Aug 2025 09:05:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D75573A6BB1
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Aug 2025 07:05:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ED41221FDC;
	Tue,  5 Aug 2025 07:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iG3fw0EY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC0D3D544;
	Tue,  5 Aug 2025 07:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754377525; cv=none; b=pWYiL/ANFTpkITq8Klh8qJRooQiR+MtcQYP5Y/jRUKcs7jDN2X3lNLILr37RvcENBcVQpAnrtNjwWVRt2naRYAgBemG/P4LzsdZTZedCW+km32FOdgc27UUdPLLS89ShlB9Nm6LQJp+ssNgR68VUOvK0xdC0mw0uvyGbU2KtZeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754377525; c=relaxed/simple;
	bh=PdnFFcknINSrwtpaVT3PHvf4ko6XoWUxywuCG71tctk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P+pr1agVhtTGCZSyzWNOMvww3lIGQVXbHAeUm+m8q6OYPE7P+Y1dHxaQ+nU27x5yf2iI2KAmQ4Q4kM4ui6vAzXk61Ehp5E5Mk+CWVtwvB3RJp+/xvYHncRWQlvo5UqYSS7arMyYIYg94YA5phk1mheSmWArJ45HikqjdmFum8DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iG3fw0EY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DC91C4CEF4;
	Tue,  5 Aug 2025 07:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754377524;
	bh=PdnFFcknINSrwtpaVT3PHvf4ko6XoWUxywuCG71tctk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iG3fw0EYOzx1/4w11sWZrpqU7c2d0QQjjW5G8bOoESooxLZEN6dg987NGX+kabxFx
	 V86TFf01NHUxopJmcxi10pdK4W49eLrbQgWdiOB5+e0GGE/5tpqU19pltT8qIHbtMO
	 GdxHk2qu542vBYLpiCOLQoMsrUE2Am2U6sxpmB6rVw6AqKggcucOk14zvG9q18lJdP
	 2VHbZ7MsIwKVurrBHAw9yfqOrud85LxP9Cry9sNP2tpSxS9x9jMbdUUnzsp82PuxJ+
	 MDLifwDvzJt1Ui4P7FGwUvKp7YvAXyHGz01We6iWTW0DKuE2fCxHAAMm1FYsX6+Ot/
	 IhIFe/57d1MBg==
Date: Tue, 5 Aug 2025 09:05:22 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 1/2] dt-bindings: clock: renesas,r9a09g077/87: Add
 USB_CLK clock ID
Message-ID: <20250805-conscious-enigmatic-crow-9b250b@kuoka>
References: <20250804202643.3967484-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250804202643.3967484-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250804202643.3967484-2-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Mon, Aug 04, 2025 at 09:26:42PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add USB clock (USB_CLK) definition for the Renesas RZ/T2H (R9A09G077)
> and RZ/N2H (R9A09G087) SoCs. USB_CLK is used as the reference clock for
> USB PHY layer.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h | 1 +
>  include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h | 1 +
>  2 files changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


