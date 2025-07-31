Return-Path: <linux-renesas-soc+bounces-19810-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00839B17945
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Aug 2025 01:09:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1B254E823A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Jul 2025 23:09:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C958279DC3;
	Thu, 31 Jul 2025 23:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ptKjn9zj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A9A183CB0;
	Thu, 31 Jul 2025 23:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754003359; cv=none; b=gwZSpfGsZKDuMD6i4NqNaYKARFQ/ZqS0u8RFL0JEP77MLsBrLcv9qiHSJdY1e8pnNYaCuoAIYKSZK8l4brIo9RYnME11+9e8alCvf5Ya99G8/rJpVLRJIVfIlTEfcEKPTjwT63Q1YxnlstYkfErBKlrQU9R4tPrZVD4UrfMeCPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754003359; c=relaxed/simple;
	bh=B3ROR5tO4OBJxfkDAp2gcF6HEJnnFKiEDSb7Rt9LJG0=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=KesaC7Wco0EZA7/uNtNjZUac+VZwOsjvG8GUloXW/u/7qzQnAyHqYLTYtInsF5CapqaPwTrj3K54iNDcAPknsanGgjv8yBKneVfn3Qy2992W51v1atyqKIiufrNTwIEifF/uN6cKcX0Rlo9H//8tO9cVALdsTluIHtbfnI/utCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ptKjn9zj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F29D7C4CEEF;
	Thu, 31 Jul 2025 23:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754003358;
	bh=B3ROR5tO4OBJxfkDAp2gcF6HEJnnFKiEDSb7Rt9LJG0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ptKjn9zjJH6dDCCYL9J0eblOjqZMzGtSIkqpxkzin8qQqwifclUjqarR2wxvZqV78
	 x10zd5Fx1xUGdli33R8DGoDBqdwmM0128YTu1NfjATNVnnLc9FI1/89MsF1SImsohX
	 tWEvB5SVPmD7zPxVCnxND762XPajFOpyMeQ8BQ6ww42/zNpSOlwIE2chJowpWnmJva
	 jyJbXWoJ6P3AKmtwPVbfdOIkKXhc6J3DM3ZO01w6IcUaPjHdQKi7UsZ+GJfS5i49dJ
	 XzIvLyT/zQlS9MObk9tDD7QTG6FebX644WQjmrgDljqn9yM8bdpmO79Eydqh7UWzvs
	 CzGTyTAQLiYwQ==
Date: Thu, 31 Jul 2025 18:09:17 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-renesas-soc@vger.kernel.org, 
 Biju Das <biju.das.jz@bp.renesas.com>, Conor Dooley <conor+dt@kernel.org>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju <biju.das.au@gmail.com>
In-Reply-To: <20250731125109.147422-1-biju.das.jz@bp.renesas.com>
References: <20250731125109.147422-1-biju.das.jz@bp.renesas.com>
Message-Id: <175400322360.2681539.15202602980558623689.robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: renesas: rzg2lc-smarc: Fix typo for
 deleting node


On Thu, 31 Jul 2025 13:51:06 +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Fix typo for deleting node 'channel@0'->'channel0'.
> 
> Fixes: 46da632734a5 ("arm64: dts: renesas: rzg2lc-smarc: Enable CANFD channel 1")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/next-20250729 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/renesas/' for 20250731125109.147422-1-biju.das.jz@bp.renesas.com:

arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dtb: can@10050000 (renesas,r9a07g044-canfd): 'channel0' is a required property
	from schema $id: http://devicetree.org/schemas/net/can/renesas,rcar-canfd.yaml#






