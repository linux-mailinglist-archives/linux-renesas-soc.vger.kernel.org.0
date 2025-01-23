Return-Path: <linux-renesas-soc+bounces-12435-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E3CA1ABB3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 22:11:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E799F188E47A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 21:11:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF9A01C5F07;
	Thu, 23 Jan 2025 21:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="txLNZqar"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787B01C3BE6;
	Thu, 23 Jan 2025 21:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737666679; cv=none; b=V3LIv6ivSLxmboPnJK7zcHUsUV2L7rgKRzcApVeHJaKdtamN3p0JkgCXQ0Pmc9kV+uNBaCCh9pqig9TRyv5TZKh+IECAAJ8BbSPfjA+xFhj1eh9uL3+cUOHJTTHVZT5N6dkIH65YgeXlD28/qxVF2mGby7VKolJkMR09mtMREdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737666679; c=relaxed/simple;
	bh=IQhvNoww/zQ0SkvP01IHh1ffmGSc1Awplj7X6QyKyD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uoxRqFk3OPrICfY4VX326k2wKSm9Gg/J4T4/zLK9FpniEzAZMpnXW9TYh9EpHtr0NPChwOtsoWt7WnRGXo2Ztj5zK09lFM1GswrGUA6T89bnIIeTD7Br8+Xw/4onYL0bOEod/0gmFBkLLi6Ji/WYnkm29mR6FtkZvHVcbPe0TXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=txLNZqar; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98CABC4CEDF;
	Thu, 23 Jan 2025 21:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737666678;
	bh=IQhvNoww/zQ0SkvP01IHh1ffmGSc1Awplj7X6QyKyD8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=txLNZqar3c6JVfjRfeE0aOHAA8Yrnv/cVeiKwkCxrlrlY89xxdDc2y82OXbiIY0FL
	 lz4t+1x3P+0KO1aFAfe4PuyueHj6xSJ6YSobFCzb3JnY57ThhKj+HieReUSviNuicW
	 Uk7r/ziyQy5Q06LjugpD8oDFUZxoQp7nn/GDqaEY0qLelVAikeXcwwDF5q3Zl97whb
	 6KBT+ZXtswh6i/wU80+Ad9hUBVReT47F0pppcgypIXnUOMRrgxGgZ/4lgXYgRAtttb
	 lBDYm4WGESdNy7NaZcki/tL5ezOXgfKUDN1FAMTPzwbDO1LeW1uuDkFagixclANJfZ
	 iEonjKB1DWcgQ==
Date: Thu, 23 Jan 2025 15:11:17 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bart Van Assche <bvanassche@acm.org>,
	Avri Altman <avri.altman@wdc.com>, linux-scsi@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [PATCH] dt-bindings: ufs: Correct indentation and style in DTS
 example
Message-ID: <173766667168.303412.17397912225491913488.robh@kernel.org>
References: <20250107131019.246517-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107131019.246517-1-krzysztof.kozlowski@linaro.org>


On Tue, 07 Jan 2025 14:10:19 +0100, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
> 
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/ufs/renesas,ufs.yaml  | 16 +++++------
>  .../bindings/ufs/samsung,exynos-ufs.yaml      | 28 +++++++++----------
>  2 files changed, 22 insertions(+), 22 deletions(-)
> 

Applied, thanks!


