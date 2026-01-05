Return-Path: <linux-renesas-soc+bounces-26269-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2149BCF26D2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 05 Jan 2026 09:31:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7476C3001945
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Jan 2026 08:31:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1EE933437B;
	Mon,  5 Jan 2026 08:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m0zpWZGk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859F533372B;
	Mon,  5 Jan 2026 08:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767601888; cv=none; b=o+UBsfqa03mVUVPjiq8NCafLyk3zq2TjSpQrGYrRi8MT4m9yrKnR+MK/xF8vq920UN1VDjVmrJNZen/Yo5JrwQnFUyZwweFqw5eqOvBwZf1mM5nxG05/j8PjAH3IUHC6TqPb0jo0dKlHdHYJq7iruxRiO67j3V32Gz7wXku1ejs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767601888; c=relaxed/simple;
	bh=6xuz8o/gb6QERQ6+/8fZLHtPXBEmYMHI7qqP90dZeLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m9WF0ySLsCS7hYyM9AyvPO84e0tft2A9rvPAQl7ou04dqNxgiT/X7kut6fyDOD9Pjj4KKFi5ok738dlWO9qVtyro+CZbBzaz/KVY6eycjKv/J1/qhZDm161Hsg7REFT49zzehcD/lQ0R70OoO+DEgSUSJWsh3FbLWocdA7UDO0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m0zpWZGk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8A45C116D0;
	Mon,  5 Jan 2026 08:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767601888;
	bh=6xuz8o/gb6QERQ6+/8fZLHtPXBEmYMHI7qqP90dZeLA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m0zpWZGkSxVKTdN7HrCPz92ypNhbN1w1zDeqrAcx+9MbI1vYYo5498R4h8MI/W6g2
	 PyvVQOdHvv0o5j7nlvbKS8pHWejn3KRycnkXCFdqiMZrN/JvOSMDGb1VJw1rZlsT+U
	 qhzGWN4Uu6QytU/wTFo/uAXDtvsgAUUWsgLuOX/J1cQtxOFz0RaiQtRYLV3O8YBhag
	 RGI1i4u+JJSD8zwn1eJ6wrXdJmStDe4zPsW2C8AZOE01DiTfpVxXDhkZntQyXSrhoj
	 aXP0Cpv+MuLtsqirs5652iBBvRBYGeV9odoBrMw4pKwCm+27QIkCYu1kJWWVHWygtu
	 In4RvTE8Gf4yA==
Date: Mon, 5 Jan 2026 09:31:25 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 01/11] dt-bindings: phy: renesas: usb3-phy: add r8a77990
 support
Message-ID: <20260105-beneficial-seal-of-swiftness-1c5eeb@quoll>
References: <20260101203938.159161-1-marek.vasut+renesas@mailbox.org>
 <20260101203938.159161-2-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260101203938.159161-2-marek.vasut+renesas@mailbox.org>

On Thu, Jan 01, 2026 at 09:35:48PM +0100, Marek Vasut wrote:
> This patch adds support for r8a77990 (R-Car E3).

Please do not use "This commit/patch/change", but imperative mood. See
longer explanation here:
https://elixir.bootlin.com/linux/v6.16/source/Documentation/process/submitting-patches.rst#L94

Also, you cannot add support in bindings. You either document hardware
or you add bindings for or simply you add hardware.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


