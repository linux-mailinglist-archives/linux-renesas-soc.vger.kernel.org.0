Return-Path: <linux-renesas-soc+bounces-10790-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8FE9E1481
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 08:43:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9000B280D82
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 07:43:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A7D4192B81;
	Tue,  3 Dec 2024 07:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kfy/CgZU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3227E17BB25;
	Tue,  3 Dec 2024 07:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733211792; cv=none; b=SGizwlv+XmOULZOgGulMAUp23DyGt4iCx8HkehKatfwfXKa/wyU2GMNtXj3k6UCha//LUXI8nfHMPffIdYliEzoJtGB2sLBUwu2gQAjQbj4iLNVUcmwXfTobN8HoqCsFRNtl/Hsg6ZgGV823Yc/24o6HluJ1v4eLKdxWhsZHQws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733211792; c=relaxed/simple;
	bh=BTi7Ze0w8np2takrcrnHHLRkx1VFTz7ASEWWSxolVFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ELJHTjjR4HurkASqgeKLrLAHiwQ4MMGVUo0Cd3sEIgKC90VJmXT+cK3vFA5HfQK71oSNPnApZMOIhsrGr2NoD9uVeb9RrVuLYw9R997yFI4cAXQGMWayzWmq9mvXOcVaaK2uc8MQ3YRWHhZCHmcevkIWDh/SQ9UsOqzAV4yUKvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kfy/CgZU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2450C4CECF;
	Tue,  3 Dec 2024 07:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733211791;
	bh=BTi7Ze0w8np2takrcrnHHLRkx1VFTz7ASEWWSxolVFc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kfy/CgZU5fDOl0dZmjjB6FDZNtNmb3RybN6OmTPWQD7x5/R8E3qRAdRtbPeHCkQEt
	 dwwXLPIJ+uU1Xs6uVimyriBFO2lGQreDY4/r+vbqmc0obhlGBgu7HrB3fn6HRDiSvy
	 tYxjytFS7ktxmQtLInOGhZ2VvYzoeGFkqKU4wDq2H3DLiftGKugeAd043UYYBKXMZj
	 2XcLbhxGgO8Q4KJRmVMIM5jDbmR9hK7apNi7yaeDceCS98Wqsb9GmLwJ1Gp8M5ba7s
	 7oAr85tQycBAHNeGT8CW/bZdQqQEgeXjzhM/ureln3wzoogOEQXgTlZBQFQos+/ogc
	 5VpZvf5+XXu6Q==
Date: Tue, 3 Dec 2024 08:43:08 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: soc: renesas: Move R8A779G0 White Hawk
 up
Message-ID: <kqwisxsh64am76mmb5b4cxp7nhmsxafadvnkckadeywsvz6iqj@iyeo5sztpdrf>
References: <cover.1733156661.git.geert+renesas@glider.be>
 <d553ef4b1f969f72e384f274d42ac7a62fe45fd4.1733156661.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d553ef4b1f969f72e384f274d42ac7a62fe45fd4.1733156661.git.geert+renesas@glider.be>

On Mon, Dec 02, 2024 at 05:30:07PM +0100, Geert Uytterhoeven wrote:
> Move the R8A779G0-only White Hawk board stack section up, just below the
> R8A779G0-only White Hawk CPU section, to improve sort order.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../devicetree/bindings/soc/renesas/renesas.yaml     | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


