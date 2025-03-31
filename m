Return-Path: <linux-renesas-soc+bounces-15107-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FD0A7612F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 10:17:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2A813A5FA9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 08:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 258551D516F;
	Mon, 31 Mar 2025 08:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PKZ9WLOI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4891537C8;
	Mon, 31 Mar 2025 08:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743409030; cv=none; b=XpIiiObCOMagNS9nE0FPeHxYoaD+kgpCBxh0/mZ/Iv+dyvESZDmWDEp3jspK2LZXaaOrI3GwnNXPbGvAPj+yWA3mRicieXYONB9qp0A2O30nRnMMkMNiRf7zNjPH9vWSQGGjA9xIJ0AXYaxLeNtLhZiOR0w8TUdTaO2x54Co3G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743409030; c=relaxed/simple;
	bh=SfzKmBFWQ3kxOKjW2mvjOvt8bJIQNsNfG5QQqF206v0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h9TFtk4ttwCZQLsTx6NrtIfRKt1/ut2JI+1tkUiF6RXgDit61ZOoy0Vaxqk84VXVzThPByr6rtTfMn9pa89WUCljoeKiwHnVYourefIYDHpXGjEZEP/XxR2Zny34hJmuMH7gsGRKhvU0I4PfuawY3bRHQ2/v2cfsqWVMNKAoF4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PKZ9WLOI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A5DDC4CEE3;
	Mon, 31 Mar 2025 08:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743409029;
	bh=SfzKmBFWQ3kxOKjW2mvjOvt8bJIQNsNfG5QQqF206v0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PKZ9WLOI9kQ87StxoYLmLkWED3DkITsNbTD2m8P67V3Z0cip/u0vmXRButJ8mErH+
	 YnOgFDOPjheQ1vtzN6u1rCd5dNE9OXz3PKWQ88CgOPZw0evOnGtRxh+0ztV4g87r96
	 xkOxNwPDGAtlY4uFdDmvQZJVMoi3Yoos64D4FjuuCQeI2A40TVh5IY1m6b/FN93iKI
	 7Vm0F5pe9cSIneZRXuhznBhujefsDJUwbLbMFFmYi91tDge8Nbd2LMQ6Wtf4pFhAxR
	 NIQ+GDt1Ew5w4kxiAjs44SPeZa4E9eDKyrGUzjD407IIVIeOep2YhbwS4RPoYaNP4K
	 F76bh+CMxWmpw==
Date: Mon, 31 Mar 2025 10:17:05 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 4/6] dt-bindings: clock: renesas,r9a09g057-cpg: Add USB2
 PHY and GBETH PTP core clocks
Message-ID: <20250331-radical-hyena-of-atheism-e9ba72@krzk-bin>
References: <20250328200105.176129-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250328200105.176129-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250328200105.176129-5-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Fri, Mar 28, 2025 at 08:01:03PM +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add definitions for USB2 PHY core clocks and Gigabit Ethernet PTP
> reference core clocks in the R9A09G057 CPG bindings header file.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


