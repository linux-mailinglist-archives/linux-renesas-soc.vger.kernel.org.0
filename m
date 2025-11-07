Return-Path: <linux-renesas-soc+bounces-24296-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DB9C3ED79
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 07 Nov 2025 09:00:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3134188AA05
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Nov 2025 08:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E293F30F7EE;
	Fri,  7 Nov 2025 08:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qWi+qyBd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21DD26F29F;
	Fri,  7 Nov 2025 08:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762502417; cv=none; b=Er5iPLMOtBo1Z7hC7tMTB12m4Utxb0YnIzItZCTx0BJsbO+axoXJDoVY+8rqJe8Wd0RfR6mQFlOaJCdSTdMUYDNZtMacYAjMT7zjbkIePHL94ebwbgTcSOiwGWkFQeHG2J1yI9vK8jP1RR/BLGAiEdHrgX4bf7hhM66uGMTHA1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762502417; c=relaxed/simple;
	bh=woTbj8MC4cB2KVfqxJsPDXydNbKs/tT1pE3GnVh3z4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VwPmo3pKDqkD9YeYdbNIguK88iks+yG8oP0O5ABA1PHFkRhllIZCkcQ4m0gTrQAMBeuZ2TuSmOCHWtvvyQ8/uWBrHw82uVXQHB1wCSw/hPwR4Zkq8ZWnrRqb/4aIK0sfaBZR2sDJ8aq6RZdnQBSb2lB17lTknFjzMh4A6lKCZSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qWi+qyBd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03B87C116C6;
	Fri,  7 Nov 2025 08:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762502417;
	bh=woTbj8MC4cB2KVfqxJsPDXydNbKs/tT1pE3GnVh3z4s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qWi+qyBdt/ViOk43Xt8kcxzdGjo7tr8VhLjX20ivUJCv2V9rHvf68ONmrfuqxBs7l
	 Cq4vbAkvUTdgJMb18EXZChiBjH5RlvJrD10f6EdHc0RdM/n/Brocdlo7xBrhbj97FR
	 asOJzpbd5wftbqnBbYda+zVlxCletNQt8z2um0VehgCgJ0Fzx7Z5pLOdsvBf7azg0B
	 WScy+fB38UjiYZMvJ8F1aDyaBRlyDzKJd3b6T/TYo/+gVZK2/+EANMvj8DJNlYOvGF
	 Lyo+zPZLYoilNYQpKnkO1DaUmKHalcFEpKQRFIAYN80ONyZ1trXqmORENrKY//36rE
	 llPhQTvXgxCkw==
Date: Fri, 7 Nov 2025 09:00:15 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: r8a779a0: Add ZG core clock
Message-ID: <20251107-dangerous-porpoise-of-expression-6a9d68@kuoka>
References: <20251106211604.2766465-1-niklas.soderlund+renesas@ragnatech.se>
 <20251106211604.2766465-2-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251106211604.2766465-2-niklas.soderlund+renesas@ragnatech.se>

On Thu, Nov 06, 2025 at 10:16:01PM +0100, Niklas S=C3=B6derlund wrote:
> Add the core clock used by the GPU on the Renesas R-Car V3U
> (R8A779A0) SoC.
>=20
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> ---
>  include/dt-bindings/clock/r8a779a0-cpg-mssr.h | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


