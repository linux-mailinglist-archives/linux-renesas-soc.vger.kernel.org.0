Return-Path: <linux-renesas-soc+bounces-16811-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BABAAAFC95
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 16:14:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 796A2189FF34
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 14:13:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30A9C2686A0;
	Thu,  8 May 2025 14:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WBk8BTtK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023AC26868E;
	Thu,  8 May 2025 14:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746713502; cv=none; b=IFEU8DXBxS+LVMEzpaIc1Dg5PYmC+DvbO54UeMGvrvbq2eWEMxEISYS0yRXVy259fTuQP6MX3V6uS4GvwogbJ2aTztoyVP6okEEtO3UzKn6Do9P85V24Sjk58PERpagAcu2vzFsJZdx+7SbVTg5sR0Brt5IflvMwN+ZoJ9R3VFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746713502; c=relaxed/simple;
	bh=XGz7CN8xky35QV4MItpPqWXXsHZx6uiwV0aRCv3dPCU=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ELXz6wW4j1/CMMLHQO3+DMSKSEAjAcs2W7dFcxM30k7fLFrBF0qJa0eljA8nvqeLkyUiepKHD4bwX6skECTThvitnBCpvHbKgJFXT5MaSvscGkPXxZn6UQHmaWjALHVfcNQ+hvMD0VNM7QysEjRHAKqQqEL8WSNdQn1zWJsnBL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WBk8BTtK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BBD4C4CEE9;
	Thu,  8 May 2025 14:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746713500;
	bh=XGz7CN8xky35QV4MItpPqWXXsHZx6uiwV0aRCv3dPCU=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=WBk8BTtKO02TgGWcYPcv1mlySZz9Q5dKoCAuVLl5R+aQh9TN4vOv3n6Ja/vfwVjW+
	 HiP242sFjU87vRNFVidYM7gOx9oWEPZS963ZsH7Kju7s+TTvdTsJ7o/lZnIdSnxKRy
	 Bf1OXf6qEkZzrF2eFMlJIv42wOEgcrAHSD0E3QZ5WdbBCumD0JoJcyIgVmPRiKTwnF
	 mhUv6b0HqbNau8j7i7/K70ak+NQxNS08S544TSROHK9hSYzEUysStWe/lN/qErOIL+
	 2my3xpgeDr3aYGe0C8htcfSB0SwvkjtWSc/Nln3AyQpyChdREiaJknIOFZR3dRCAB+
	 19qOcV9wyRlDA==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Colin Foster <colin.foster@in-advantage.com>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Marek Vasut <marek.vasut+renesas@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jeff LaBundy <jeff@labundy.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250501145125.59952-3-krzysztof.kozlowski@linaro.org>
References: <20250501145125.59952-3-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: mfd: Drop unrelated nodes from DTS
 example
Message-Id: <174671349784.2457426.16761659932735162963.b4-ty@kernel.org>
Date: Thu, 08 May 2025 15:11:37 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-39345

On Thu, 01 May 2025 16:51:26 +0200, Krzysztof Kozlowski wrote:
> Binding example should not contain other nodes, e.g. consumers of
> resource providers, because this is completely redundant and adds
> unnecessary bloat.
> 
> 

Applied, thanks!

[1/2] dt-bindings: mfd: Drop unrelated nodes from DTS example
      commit: a67c891b8e7da2afedb29ee3da68c52aa5e6902a
[2/2] dt-bindings: mfd: Correct indentation and style in DTS example
      commit: c3ddcd91220220c417850ede7303a9f37e222408

--
Lee Jones [李琼斯]


