Return-Path: <linux-renesas-soc+bounces-19799-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0836AB16A6F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Jul 2025 04:31:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D3333A480B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Jul 2025 02:31:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6245786353;
	Thu, 31 Jul 2025 02:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="jpD8b/DV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC268F6C;
	Thu, 31 Jul 2025 02:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753929110; cv=none; b=JQHC7wUeaWaA5UP507xf0hfucpRXuvOD3CAZlX/SjEKUD9gUMnx7A5KJs2BpCI+8BeHivfBjiZeqpf2wUsGSp4iJNxR8U4+hk+Q32qgOl/2Y3+/vaFrKg8qSpwBeVMZ4GkZ3cxjHb9no96jgr5yBJb+jwTLlT0YL97rxKM7WtdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753929110; c=relaxed/simple;
	bh=qC/E2RADJBe2o2pvqCk2KKHQRYH+IEmQwtHFwnr5iwU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=c1YOaDk9uqDqpkferWmN3H5UJN91ZfVsCXfsVESsmxjjt8rYjUSUo4+4iqb/yqO3vnFJqnE9sZP2g/Ds/EPeRGLly/PuixbP2jGJIG5odn0dlFzdEQqoufjfuQSYNXX9Zr5zGkEh79K1FHyX+kGT39cuiKCfQ54KxlJCm5+bP7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=jpD8b/DV; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1753929106;
	bh=qC/E2RADJBe2o2pvqCk2KKHQRYH+IEmQwtHFwnr5iwU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=jpD8b/DVVAgtp1h122tIwK3VBpNmdsv89LZTDZPmo+lBU1vvD7FA7xo8vscY3HnAZ
	 wPyUojKTq1SkOUCMsVL14wfeezHkuKYrn71CFo9cv0zvNRDkjEHlRIDCcMsPcJOEgN
	 9+xLwAnXXn83RsRds870LwdRtVD5B6FYTqNeJsRgfsGgHneTO8BiL6PfIWNQq+ULNc
	 R6mz2k721/+5GkM/yk8Atl9oQ4pfUxOjLr4e5BzMBRY1tmmGF8V9x4ze3FcUc8LpwY
	 BnN7bD3R2pW4Rim37im6TErL1U4Vue8mzKnvi/Cpm5RijGnpWr88w+gNzxOwT7u/62
	 KNHsGWSPtOC7w==
Received: from [192.168.68.112] (unknown [180.150.112.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 6242A69374;
	Thu, 31 Jul 2025 10:31:45 +0800 (AWST)
Message-ID: <6f4b31063bb83a8b8c876ac6ebfdf7d1efc50987.camel@codeconstruct.com.au>
Subject: Re: [PATCH v9 3/3] ARM: dts: aspeed: clemente: add NCSI3 and NCSI4
 pinctrl nodes
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Leo Wang <leo.jt.wang@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Kees Cook
 <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,  "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus
 Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	leo.jt.wang@fii-foxconn.com, george.kw.lee@fii-foxconn.com, 
	bruce.jy.hung@fii-foxconn.com
Date: Thu, 31 Jul 2025 12:01:44 +0930
In-Reply-To: <20250723-add-support-for-meta-clemente-bmc-v9-3-b76e7de4d6c8@fii-foxconn.com>
References: 
	<20250723-add-support-for-meta-clemente-bmc-v9-0-b76e7de4d6c8@fii-foxconn.com>
	 <20250723-add-support-for-meta-clemente-bmc-v9-3-b76e7de4d6c8@fii-foxconn.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-07-23 at 11:42 +0800, Leo Wang wrote:
> Add pinctrl nodes for NCSI3 and NCSI4 to the AST2600 pinctrl
> description, enabling support for RMII3 and RMII4 interfaces.
>=20
> Signed-off-by: Leo Wang <leo.jt.wang@fii-foxconn.com>
> ---
> =C2=A0arch/arm/boot/dts/aspeed/aspeed-g6-pinctrl.dtsi | 10 ++++++++++
> =C2=A01 file changed, 10 insertions(+)

This patch should be ordered before the patch adding the devicetree
that relies on it.

Andrew

