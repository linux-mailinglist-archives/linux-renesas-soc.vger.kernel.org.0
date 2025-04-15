Return-Path: <linux-renesas-soc+bounces-16039-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C790A8AB5F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Apr 2025 00:42:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D278189FEFE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 22:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A76729DB6B;
	Tue, 15 Apr 2025 22:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="guDi4TW8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1577C236431;
	Tue, 15 Apr 2025 22:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744756932; cv=none; b=bUKTv33Q0OQrIHTqE7T542TSYdBr1h8FfpZ0EHVJTrwIFg99BUSvIS2pK97Jgt+5gbfGktaSBgoOicRIftrrvdK4kB+PvZdxZBxfyyH1u97lEeLfINuBvjTGWsJIim1CtJ+1FOLTlBbNF1vS1wXFsRZ5pLe5TbxNzqHiWdO+7ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744756932; c=relaxed/simple;
	bh=qOKLD7q9ex3GH5aDziterb4sOHsnOsxOn0hgFmLapug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ql8SLPmwale7zSPlU0rJOU+CiV62vpRpoZFCBWN0QOnXJtCOcVDcNc6pYYH4VIq+lC//+Be5Laz3t1uGQpCqY/M0KVdo+tQrWZSmzZHgaIy1GSe7VDqmN1Q3CfDfL3eb4fq/y4mawpgWYvj0q9pBcaPABniwyJOWYFh7Oc23Gek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=guDi4TW8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A74CC4CEE7;
	Tue, 15 Apr 2025 22:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744756931;
	bh=qOKLD7q9ex3GH5aDziterb4sOHsnOsxOn0hgFmLapug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=guDi4TW8KZBuCAaCqE617xSkzoPp19jWcDvS6UJoiMkaZI32RKRmk599Hsh5z2m2n
	 ZYu1aBpbSus4/YAHtE8s7OOGR5wa+hwlW/ArCJJnMRGphcuFpNDJ3dr32g3KGpzQYN
	 6o8y3lpCIwn0Rs/BEV8hi4lQGeIwRSG2jFzVrHYuYXgPiatmjcoXjX8wnrHfeRN5Hg
	 lQ3pORJ4KQdBBZSmOBuUtWR0uUgMbecF5l3GpJuzVq2niIAsBM7u9KbBoE7lYaRX/u
	 oaWvTJNLZXv68QQP0A9JFa6Mig1JXRw0EYI/YR/FmOkJ+26t2ZcKVwL6fp3Q8dil7X
	 t2ZCGxzrGD2ww==
Date: Tue, 15 Apr 2025 17:42:09 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH] dt-bindings: usb: renesas,usbhs: Add RZ/V2H(P) SoC
 support
Message-ID: <174475692895.956159.3663942929236229677.robh@kernel.org>
References: <20250414165201.362262-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414165201.362262-1-prabhakar.mahadev-lad.rj@bp.renesas.com>


On Mon, 14 Apr 2025 17:52:01 +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Document the Renesas USBHS controller found on the Renesas RZ/V2H(P) SoC.
> The USBHS block on RZ/V2H(P) is functionally identical to the one on the
> RZ/G2L family, so no driver changes are needed. The existing
> "renesas,rzg2l-usbhs" fallback compatible will continue to be used for
> handling this IP.
> 
> In addition, update the schema validation logic by replacing the enum list
> of SoC-specific compatibles with a const "renesas,rzg2l-usbhs" as all
> listed SoCs share identical USBHS hardware and already include the fallback
> compatible. This will help to simplify the schema and avoid redundancy.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/usb/renesas,usbhs.yaml | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


