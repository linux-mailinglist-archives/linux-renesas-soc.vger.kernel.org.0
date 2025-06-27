Return-Path: <linux-renesas-soc+bounces-18857-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 043DFAEC09D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 22:06:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 23D4D565765
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 20:06:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 466C82EE270;
	Fri, 27 Jun 2025 20:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JIiqxOJj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198AA2ED156;
	Fri, 27 Jun 2025 20:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751054766; cv=none; b=szt7Jh+VhP0a/6VxvH6K1HC636CLaJwqr0l3FwsD5z9drRCtQRSoXDGOEmm53JEPozFfLBY3bGLwAUKDWWvmg8DgJvET+p33q7U1xER11wiw3eAYEEKBmbmWdsFvHPRT2xFqB1R2YxV7LF7HmnRP+yQAK+GJJNcCDVpDfSH/Jq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751054766; c=relaxed/simple;
	bh=xt+sPA3McDF8nj4nAc9sQO77sEGlMr35aTxGAMLLbcI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=niaeULGcNre2moXJ8w1XX5at/0Khi11fVYNO6XkSLDfi3gt2tYCO3dBOZBUx0xB5khezQQ7gn6RiOFhjkJ0HCK/Wklow5MrN7g8eGzAzqNyQO0myh+7PJd3YvWScbbhAzreC+uO1dDQtpOZfufe2zxf3AkoWU7GAb6lFoc6/Omc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JIiqxOJj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35345C4CEE3;
	Fri, 27 Jun 2025 20:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751054765;
	bh=xt+sPA3McDF8nj4nAc9sQO77sEGlMr35aTxGAMLLbcI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JIiqxOJjW8e0EbxHP33GonhpPoPsyZvm8fh5UVszngCN5snxDMySGjw+XX/ITyJB2
	 XCr7JKE2ibIbdaq0jV36c0rMUPZb6vaVOrfdweUBQCGxv+yFXppiMRtI5hh52NoH5w
	 ABgQCyEOf4oGaXZ1f4Nx4W3f19e+SS0KJIhJJyPWdsoIwm8+8pU9KAvaG/HP+h0ys3
	 IKjHFOtaDmr8YClW6BrsvIvGOL+j6WFXlxmrO3f5uunAeX7tmHvyl5uDUGOYoyAcAK
	 a2Y+Smx+jGbggmsw+JUJK3xBElxccLRqu2WvuOnwaz7gEY1pj8MHwCltc1qr6fFdna
	 kXxOui47m6y3w==
Date: Fri, 27 Jun 2025 21:06:01 +0100
From: Simon Horman <horms@kernel.org>
To: Lukas Bulwahn <lbulwahn@redhat.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: adjust file entry after renaming
 rzv2h-gbeth dtb
Message-ID: <20250627200601.GG1776@horms.kernel.org>
References: <20250627134453.51780-1-lukas.bulwahn@redhat.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627134453.51780-1-lukas.bulwahn@redhat.com>

On Fri, Jun 27, 2025 at 03:44:53PM +0200, Lukas Bulwahn wrote:
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> 
> Commit d53320aeef18 ("dt-bindings: net: Rename
> renesas,r9a09g057-gbeth.yaml") renames the net devicetree binding
> renesas,r9a09g057-gbeth.yaml to renesas,rzv2h-gbeth.yaml, but misses to
> adjust the file entry in the RENESAS RZ/V2H(P) DWMAC GBETH GLUE LAYER
> DRIVER section in MAINTAINERS.
> 
> Adjust the file entry after this file renaming.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Thanks, and sorry for missing this.

Reviewed-by: Simon Horman <horms@kernel.org>

