Return-Path: <linux-renesas-soc+bounces-3475-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED3B87224E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Mar 2024 16:02:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D3D0C1F232B3
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Mar 2024 15:02:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A74D126F1C;
	Tue,  5 Mar 2024 15:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pn9a+Qkl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE251DFF8;
	Tue,  5 Mar 2024 15:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709650921; cv=none; b=Wzuhu9rBOzNqmkZpFRkBUaVo0ha6pmgFYi0R3sLTEm2k7LeHtZRrdCaVDe147bOHC6rL2o+md3mTo7y9y0Ob/zFMZdGf8oHemIi1NwOFYC4b+IZKZ+Z6Jyx66M5NXEO6wiPM+YjNNBJ9mFOhD+lSxONJREZOb4e3yWVLtd3wjC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709650921; c=relaxed/simple;
	bh=EOcdUGttj2pgJNSAtD+H2tt3Qg/SJJYakNmgC0yArb0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ba5h+NMNrb8hGiR/oftmiM/3iuc+yBR7yz0As9r0x8CQocdavkIcj8KoenBjpb9t5qQjQkFecyIevu5U1PWz15RWbRHeTPMwTGYGDoClQxV1SjDiP4fChnh7QiMSR2xA5PBX6aocX70UwUpC2TOfj8ErlD3gdjEj3uTiVhs7jTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pn9a+Qkl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE193C433F1;
	Tue,  5 Mar 2024 15:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709650920;
	bh=EOcdUGttj2pgJNSAtD+H2tt3Qg/SJJYakNmgC0yArb0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pn9a+Qkl5P1TvXEHFckUSQdDz7QYx0j2N3jzMrZomlUrXn5AsHBt85zRUTRYJVZdj
	 EO4TgOzvtmGztZrvL0XRtuUjqqFtbsvJO4smPnGu8GtIsCwsIUR3q8SiW9/dGiOADI
	 /np9F3t8kHYTSVJrJIOHGTFsYM7EiKagUgFCQJUk3ULiY/LJXbqKjmt1+ymXjv37Mj
	 9/aQCL5TK98jSJ71T+Ck+A60v6BqO0yOpUdXmoG01xU9aInEMU2+rso/m/ESA330b+
	 IIJbzWdodclTqKKwRIde5GFpeiO65p+5xs39wt4r/h7d+z0kboA1m7ztOJxIXOkLAQ
	 OzZFEADT8awbw==
Date: Tue, 5 Mar 2024 09:01:58 -0600
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	Eric Dumazet <edumazet@google.com>,
	linux-renesas-soc@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paolo Abeni <pabeni@redhat.com>, Conor Dooley <conor+dt@kernel.org>,
	Thanh Quan <thanh.quan.xn@renesas.com>, devicetree@vger.kernel.org,
	Sergei Shtylyov <sergei.shtylyov@gmail.com>
Subject: Re: [PATCH net-next] dt-bindings: net: renesas,etheravb: Add support
 for R-Car V4M
Message-ID: <170965091827.3351332.2111894188384464471.robh@kernel.org>
References: <0212b57ba1005bb9b5a922f8f25cc67a7bc15f30.1709631152.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0212b57ba1005bb9b5a922f8f25cc67a7bc15f30.1709631152.git.geert+renesas@glider.be>


On Tue, 05 Mar 2024 10:37:18 +0100, Geert Uytterhoeven wrote:
> From: Thanh Quan <thanh.quan.xn@renesas.com>
> 
> Document support for the Renesas Ethernet AVB (EtherAVB-IF) block in the
> Renesas R-Car V4M (R8A779H0) SoC.
> 
> Signed-off-by: Thanh Quan <thanh.quan.xn@renesas.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/net/renesas,etheravb.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>


