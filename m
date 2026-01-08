Return-Path: <linux-renesas-soc+bounces-26407-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A99D03264
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 08 Jan 2026 14:50:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 03DAA30F6562
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jan 2026 13:41:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E4B43A1E94;
	Thu,  8 Jan 2026 10:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JWjrjKbu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5737A3ECBC4;
	Thu,  8 Jan 2026 10:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767868673; cv=none; b=IwEXifM0+StmUQ+su/Do29RNnIXHU5lxBv9vI2P9F7aZu90GQZCWN2HuClhgxOxh6HJw6MEe+VanCDy1sk6bVkCrIyZMusyAn0xMlptDLf6nyaDL9RlZSAPvQowHCDqqNdBV1V52CGJukvMjPfhXSD07ceDr38Et79sgS2jkiPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767868673; c=relaxed/simple;
	bh=c4wiA7YvyvJfca2qi0XKmfUhdsKw9OEBKcoZcx9DyzA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MfwtS3kXWtkTXvCZ/hHYjw3j+lBcyEeEGZ2mStisMGOdxes6xitaBVcmDduzFTQFyuwtDOFaHrgyrSskF+brQFfrZnrB11yLKqmlVUKjN9UPen4lftwCz4cPtBsGSdNeQnM1LkGLlnOXyRsa5VSEBN/juzX7RG81ndqoTAQhoDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JWjrjKbu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E29C4C19421;
	Thu,  8 Jan 2026 10:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767868672;
	bh=c4wiA7YvyvJfca2qi0XKmfUhdsKw9OEBKcoZcx9DyzA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JWjrjKbuEeSrVTy8Mrw88yHSbVgYxx8g5vfae0Ovx+mVaJ59vVw4eJAaeb4Wn42e3
	 Scc0aJNV897PZjQos1IrvuSVCLeFeOu6EQnJvP6I9q1c18st4mIBgNeYgzmNYCanXO
	 f44GpTWT1sC4ee7SfKrQml82HJkdDBdrwadh29muPIApMyESb1SvyhIRu0+bVsOaSC
	 6a9BEs93msz++EyljmlK1FqxxG5EQkjbV9Ei4W8NQWse/jFJg3tlY8GSMVcJRO2XiZ
	 Wc6PGNqZJa72bbDE7AngM7vZ7evfVq9umJwKsFp+tS70sMqF27FXnoY97WU75UOgLV
	 U0Ikwa7idzfTg==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org
In-Reply-To: <7b9a4a355c5da3fe812ead663285d05b64b84857.1764320964.git.geert+renesas@glider.be>
References: <7b9a4a355c5da3fe812ead663285d05b64b84857.1764320964.git.geert+renesas@glider.be>
Subject: Re: (subset) [PATCH] mfd: core: Improve compile coverage of
 mfd_match_of_node_to_dev()
Message-Id: <176786867064.838936.14785742732975202808.b4-ty@kernel.org>
Date: Thu, 08 Jan 2026 10:37:50 +0000
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38

On Fri, 28 Nov 2025 10:11:27 +0100, Geert Uytterhoeven wrote:
> As of commit c7fe3bbfd622b5ee ('mfd: core: Use of_property_read_reg() to
> parse "reg"'), all code in mfd_match_of_node_to_dev() compiles fine when
> CONFIG_OF is disabled.  As the sole caller of this function is
> protected by IS_ENABLED(CONFIG_OF), the #ifdef inside the function can
> be removed to increase build coverage, without impacting code size.
> 
> 
> [...]

Applied, thanks!

[1/1] mfd: core: Improve compile coverage of mfd_match_of_node_to_dev()
      commit: d0e9990ba058b25a3d8cf31ab0bb25571515ed34

--
Lee Jones [李琼斯]


