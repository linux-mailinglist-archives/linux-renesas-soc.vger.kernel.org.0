Return-Path: <linux-renesas-soc+bounces-14157-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C09FA573D6
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Mar 2025 22:41:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5389E3AD125
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Mar 2025 21:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE32925A2AB;
	Fri,  7 Mar 2025 21:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DCEAdOiA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793E32580EE;
	Fri,  7 Mar 2025 21:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741383654; cv=none; b=nz3XZH/edWub6KQZ6w8miqj5U1M0yyvqrE+Z+XvYuQZn+q0Jj9h99zq8vmhR2TVKitU2Auw1UzEjXd9kl4tRAYStMSVaAh5YYDIw5sBMS+6M8akMnnaOdwZVcOeeQK5ueiaN6CfKzvn+VfjCiQ35XBZ1lvKsdSbCrkqI+aznc6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741383654; c=relaxed/simple;
	bh=PzNWcb8Mub4NMavKBHTOtAd9oSLMD6xBTvJJq/TbOZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C5PuHYKx2B6W09Xb4rkypyvArhJFNCioyX5ifHbNdeOb76oD0Aokr3X01PTnsXY8KbGt+FVGH5N/JQ1sjd3lNDpLYyx1ZVbhe6gLkPg5/9vfGr/feQP8WpzVPbbhupZBc/uSnwLOtLfoSnuFufLQm/alnooA02CuxkmklgYDg0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DCEAdOiA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5254C4CEE7;
	Fri,  7 Mar 2025 21:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741383653;
	bh=PzNWcb8Mub4NMavKBHTOtAd9oSLMD6xBTvJJq/TbOZk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DCEAdOiA+OC2H+ZEP0tuXDyuLCMzcAt4uXPlawNYIL9/AFTkJoojpp86kNi1gLD2t
	 WMo+FIPHYDRUKOKWmMBv5kBqq/TSBIPmTSm6TWVd2SdfUasN8ooJ1MRRws1opbEbkI
	 cdIOzoLLkbeZv3th94tO8sf+8+JLFsqEeWcX6mbvBEhmuS+Fcc8z1X8RLG94eOZP9G
	 nmvuCMKY/uJtxfQXuXhB0lfWraxOaGFNijw7jKVoVhjrS/2Y5cXES1XV38p2pFy03l
	 ya6DL2gZSuMlL+OakyXd98rhDukc6A0ByJkWMsRisF1AVSLguCQkDbYB3BljVH3Dcw
	 Hy+ymJjejXZtw==
Date: Fri, 7 Mar 2025 15:40:51 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: thierry.bultel@linatsea.fr, devicetree@vger.kernel.org,
	geert@linux-m68k.org, linux-renesas-soc@vger.kernel.org,
	paul.barker.ct@bp.renesas.com, linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v4 01/13] dt-bindings: soc: Add Renesas RZ/T2H
 (R9A09G077) SoC
Message-ID: <174138365154.655126.16627903928978693973.robh@kernel.org>
References: <20250306152451.2356762-1-thierry.bultel.yh@bp.renesas.com>
 <20250306152451.2356762-2-thierry.bultel.yh@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306152451.2356762-2-thierry.bultel.yh@bp.renesas.com>


On Thu, 06 Mar 2025 16:24:35 +0100, Thierry Bultel wrote:
> Add RZ/T2H (R9A09G077), its variants, and the rt2h-evk evaluation board in
> documentation.
> 
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> ---
> Changes v3->v4: none
> ---
>  .../devicetree/bindings/soc/renesas/renesas.yaml       | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


