Return-Path: <linux-renesas-soc+bounces-3697-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57132878DD1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Mar 2024 05:29:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DCBE6282182
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Mar 2024 04:29:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ACF5BA39;
	Tue, 12 Mar 2024 04:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qANS5R5T"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CACABE48;
	Tue, 12 Mar 2024 04:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710217747; cv=none; b=RYI8arJgQWdyC8Uya3QNDO59wEyJo28u0yfMQR9HlLdseiscBWrAZnkRQ/oAqP14IJEVWEiapmzlrifbI3R0nX5s7pn/yZtRXyMpJunZ/Um5lGQxvnuRY8bb4pLV8WHEP7ozhvIAQVgek5zLtwvcFePDDkakUOBeA3EYvp1nbIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710217747; c=relaxed/simple;
	bh=k61fo2wR3z0u2dawsbdLIvvwE0ZlSfpIbX6jH3td0i0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YJ2JzCycJyY1PtzMh5wmBhgFoJmDCMONYjw8coL723+nDLoUYfw0DtibPF+g30dFGXl2TJYXi5P2jb4xrfiOTm950inSNxX3Igqj2unSGot8HiT3DjC1c9SdQh7fIwvSfM7YxCn95zOhTe8TPWYktT4BcaqHbvBVhFPW/G26QFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qANS5R5T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9922C433F1;
	Tue, 12 Mar 2024 04:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710217746;
	bh=k61fo2wR3z0u2dawsbdLIvvwE0ZlSfpIbX6jH3td0i0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qANS5R5TcLY3Ahl9qQRsptT4rvC544/dlsbciXZFciPT0IpUB1iRSd33qJu9mrbxS
	 JuVkGmTAUNRryCJiRkQ3xU8hNVujs9Oarzp9TYqLDNE/mVlto4lE7L4jD2gzaF7kir
	 ev/zJmhtayl2crld/lXpY+LKyDdpdqV9A9qGenYc1JQG9oL6y80AQtTFYlnPVM/HT1
	 rcej53J1zo8N+UrZyvj2orZiU2epKyzW668zJe6UaI6AF4C+yE+yXGomOD6Bwu0sBz
	 jKdKteIwz/Z7kdAk7B+Y2mpWzOA5JoKU3rmLHHI5UqIY0oNM8cz7lGJtMRSP9Ba3Vw
	 doDtYuoHYZuew==
Date: Mon, 11 Mar 2024 21:29:05 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Niklas =?UTF-8?B?U8O2ZGVybHVuZA==?=
 <niklas.soderlund+renesas@ragnatech.se>
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Claudiu Beznea
 <claudiu.beznea.uj@bp.renesas.com>, Yoshihiro Shimoda
 <yoshihiro.shimoda.uh@renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next,v3 0/2] ravb: Support describing the MDIO bus
Message-ID: <20240311212905.0f4c1a13@kernel.org>
In-Reply-To: <20240311141106.3200743-1-niklas.soderlund+renesas@ragnatech.se>
References: <20240311141106.3200743-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 11 Mar 2024 15:11:04 +0100 Niklas S=C3=B6derlund wrote:
> This series adds support to the binding and driver of the Renesas
> Ethernet AVB to described the MDIO bus. Currently the driver uses the OF
> node of the device itself when registering the MDIO bus. This forces any
> MDIO bus properties the MDIO core should react on to be set on the
> device OF node. This is confusing and non of the MDIO bus properties are
> described in the Ethernet AVB bindings.

## Form letter - net-next-closed

The merge window for v6.9 has begun and we have already posted our pull
request. Therefore net-next is closed for new drivers, features, code
refactoring and optimizations. We are currently accepting bug fixes only.

Please repost when net-next reopens after March 25th.

RFC patches sent for review only are obviously welcome at any time.

See: https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#de=
velopment-cycle
--=20
pw-bot: defer

