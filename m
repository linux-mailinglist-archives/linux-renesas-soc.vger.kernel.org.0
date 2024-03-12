Return-Path: <linux-renesas-soc+bounces-3698-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 172A9878DD5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Mar 2024 05:29:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0835282252
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Mar 2024 04:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3340FBE48;
	Tue, 12 Mar 2024 04:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E2/Kniwq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C46BA46;
	Tue, 12 Mar 2024 04:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710217762; cv=none; b=bMdgdzVJCeeN71iIr5vnqf6qHpeYwZpBzKQeWiZSaK0nT64DKhhAyZ4sBSpkTSxh+9/dlgC17Ya/neJow/CE2YPn5IsF9kkAmM0j3pM2ulUQu8wlTjH1Na/23HCXz2E3ZESKu60W8030u+aQ3nFvvPr8flpyZgXPpU0eNbY2B00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710217762; c=relaxed/simple;
	bh=WWdC0LJwPBXV0hfUXRSiFQg9azud55KsoRsuptaNqlY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YGlhFWdQ+skby9QGfRameG6yTnSWvWKdcryezEz2UlQUKg0qSQx4PlAG8dtFep89WDlhXHCWRru/5Qy3SZX2Kf1b/cE7kBOmSKGI+kw0/3WfsHpus9sLI+X9kv3LXlWoQDSdzxnX2nbGbULmm48HraxxszeRNeXuN6JofTaSUhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E2/Kniwq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AE2EC433F1;
	Tue, 12 Mar 2024 04:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710217761;
	bh=WWdC0LJwPBXV0hfUXRSiFQg9azud55KsoRsuptaNqlY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=E2/KniwqT+rcN54cDk8SZNomEk3YXTnoyrtHjjdJqT5X8shv8v6A2cllAoMdoRT6H
	 woI+Y3lImaOD/3u+UXJtdBcvpX0UovrblDfFh5Bt2EjO/BfeQl81ju2JeEtt6E9OMo
	 sYXFpMAjFMeK9/cvTgXQWC9jxvoKZj9xij3yvV9lVi9ArmMQhsVE7r/MTGdHAYFNMv
	 uuRUIPOCRN2thRqaEh09ZYN0S2m56cgY1vCvlqeiSxdxRDXE4as9PyGmA4JEVfOqhm
	 kJOIwaG5xv5HYKvrpAHqnNPdrAZ3xcnCA8X5lEg/udh1iS2yp86mWEnA5zmP0BSF9L
	 Dn9DCJbUBVvvQ==
Date: Mon, 11 Mar 2024 21:29:20 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Niklas =?UTF-8?B?U8O2ZGVybHVuZA==?=
 <niklas.soderlund+renesas@ragnatech.se>
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next] dt-bindings: net: renesas,ethertsn: Create
 child-node for MDIO bus
Message-ID: <20240311212920.17e689bc@kernel.org>
In-Reply-To: <20240311143507.3239566-1-niklas.soderlund+renesas@ragnatech.se>
References: <20240311143507.3239566-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 11 Mar 2024 15:35:07 +0100 Niklas S=C3=B6derlund wrote:
> The design for this driver followed that of other Renesas Ethernet
> drivers and thus did not force a child-node for the MDIO bus. As there
> are no upstream drivers or users of this binding yet take the
> opportunity to correct this and force the usage of a child-node for the
> MDIO bus.

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

