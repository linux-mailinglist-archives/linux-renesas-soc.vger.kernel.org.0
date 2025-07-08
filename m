Return-Path: <linux-renesas-soc+bounces-19380-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D41DFAFCA5B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jul 2025 14:25:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3688317D466
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jul 2025 12:25:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4603D2D9ED4;
	Tue,  8 Jul 2025 12:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C0TOiXxv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CFB35959;
	Tue,  8 Jul 2025 12:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751977524; cv=none; b=KGz0Yue+lkmx0ECx7EO3uDzrNqZvwV63EmHNsTAVJFXL/sY0J9FagpLgvkdEmeSXRZZf44sXbMgGtHASbR6WfvR5XYn9R+7amfH1RFRo8XJnEAFBf8mBDhBUmb3xU12ORjhv0BJlQJHXpynvDWJ5MECTCS9VHxuXSrasTtc1Qgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751977524; c=relaxed/simple;
	bh=cBKfOlm0o5tbUS+WeNcyTFJHeZh0VC1N9WvCHLT15mI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=POKsRbvnzxYoBvqUn9/PrIzAtZkapQAS8TV7BOloLMItYV1XAsxi7AoXckRDO99XX5/jpnBCWqPeRDuhChyclleQPnYbocj6eiG1il2GoAV8/MOQ2VoIZhHXeJbvQpdr1Z6xLVYx74FRqtpr4rkrfG0YVE4ccKgO+n8cws5l0cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C0TOiXxv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70947C4CEED;
	Tue,  8 Jul 2025 12:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751977523;
	bh=cBKfOlm0o5tbUS+WeNcyTFJHeZh0VC1N9WvCHLT15mI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C0TOiXxvwLSU8dr4137SUIxZfFSq0bwxl4KnbJ/7QuXl0xLguO7lPlYRni6oBFBDE
	 hiMW8NUpZfLdCdHXl7bhc8fLhYFy+fS1iZDw5+cDmP6dNDa2uNkhjxA7dyJVbOlXMi
	 8LHjCb4XsEaoBupu/dt82pmoXwwtlbB4KNb469TIDOOMFeIQNk0DrHQQCxjVhHU+yw
	 p38HSukHG2+hMUoctkdLCXPsFC17zS90K/pdBfdMT5bGEkqgY8ZUavIVQ32VbgnT/f
	 Hn7mFHLD8WNY2AUiyQlS/jz9p/sryOx08NslPN4U09qQKGztf2KPhv7Ro/hDbDcwsb
	 6c8g/ZoE2fldw==
Date: Tue, 8 Jul 2025 07:25:22 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Leo Wang <leo.jt.wang@gmail.com>
Cc: linux-hardening@vger.kernel.org, Joel Stanley <joel@jms.id.au>,
	Kees Cook <kees@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org, Tony Luck <tony.luck@intel.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
	Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: arm: aspeed: add Meta Clemente board
Message-ID: <175197750014.297501.9917698963252838372.robh@kernel.org>
References: <20250708-add-support-for-meta-clemente-bmc-v6-0-7f3e57bd0336@fii-foxconn.com>
 <20250708-add-support-for-meta-clemente-bmc-v6-1-7f3e57bd0336@fii-foxconn.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250708-add-support-for-meta-clemente-bmc-v6-1-7f3e57bd0336@fii-foxconn.com>


On Tue, 08 Jul 2025 18:18:00 +0800, Leo Wang wrote:
> From: Leo Wang <leo.jt.wang@gmail.com>
> 
> Document the new compatibles used on Meta Clemente.
> 
> Signed-off-by: Leo Wang <leo.jt.wang@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

Missing tags:

Acked-by: Conor Dooley <conor.dooley@microchip.com>




