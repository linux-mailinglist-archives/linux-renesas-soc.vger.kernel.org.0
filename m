Return-Path: <linux-renesas-soc+bounces-5352-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A768C4A6D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 May 2024 02:24:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B2F8284B78
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 May 2024 00:24:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C99A37B;
	Tue, 14 May 2024 00:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FUTByTDR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E251C20;
	Tue, 14 May 2024 00:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715646265; cv=none; b=Kjg2wPQc+vHoaZLMey4Qwlk8O37M8Q99Efp2fNnw/XaXnLSjEuy82rksjPCtTEqiBzkdESuT7JBWT0A2Gb+cKYzNB1yHauof4V6R7030+aO4cqsbwGXtLt1/gahjrKx6dVU5RovopkbIjRualOoiCvyTXj+iz89qd9L5FphBaUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715646265; c=relaxed/simple;
	bh=A7Plmx1hi7FN0erRws0eJ5j+s2dPPXRAeZTYL40TeCc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kxLYA0+EI/ORj5zJXxKI8ZoHDeiHr60Mj15l1TGuE46Qezc2VcnEWj1gkd6VohJlV8r6erPCa8B0d/BncJxPbWj8gcHKJvI0RxbCxEP6tPB1jWU4cAGwVilXXyK71EeL7NVT55kK2ONLOy4rUpnI1hiDpJG29P2RdlP3BImw3DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FUTByTDR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 730A5C113CC;
	Tue, 14 May 2024 00:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715646263;
	bh=A7Plmx1hi7FN0erRws0eJ5j+s2dPPXRAeZTYL40TeCc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FUTByTDR38k/n/01oUKEUD0VI/Zfi1UTUv6ToQy8CnXsbQBFEdgGszz/8P459yZb7
	 bP9hxd4DYLlIKsgGn5lt3jihVnp+9qUDAg90JnEmMrhqabVhv9zgyv8d/ykMqgjHhY
	 DB1ULA1A5tA3+UVROK3IGeAwpbtOHyOWTfRmougu5Xhuc6i3bYDZikVWLV5J4QSC7C
	 8mD56Z4rBiif1URvBURFIR+NPY1sDMZmsp+Zj1w5KQffgkfDJmVnc5lJuVsrVz1OdK
	 SjbRZzd7OW+FnbWvycwXM7dzgsGRSn2U2+KhXVv6ckylsLKAYjRwlYjCLyA/rQyGAg
	 OsUp/8ntnq9vw==
Date: Mon, 13 May 2024 17:24:22 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Niklas =?UTF-8?B?U8O2ZGVybHVuZA==?=
 <niklas.soderlund+renesas@ragnatech.se>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next,v5] net: ethernet: rtsn: Add support for Renesas
 Ethernet-TSN
Message-ID: <20240513172422.47dc34a5@kernel.org>
In-Reply-To: <20240509210903.3738334-1-niklas.soderlund+renesas@ragnatech.se>
References: <20240509210903.3738334-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu,  9 May 2024 23:09:03 +0200 Niklas S=C3=B6derlund wrote:
> Add initial support for Renesas Ethernet-TSN End-station device of R-Car
> V4H. The Ethernet End-station can connect to an Ethernet network using a
> 10 Mbps, 100 Mbps, or 1 Gbps full-duplex link via MII/GMII/RMII/RGMII.
> Depending on the connected PHY.
>=20
> The driver supports Rx checksum and offload and hardware timestamps.
>=20
> While full power management and suspend/resume is not yet supported the
> driver enables runtime PM in order to enable the module clock. While
> explicit clock management using clk_enable() would suffice for the
> supported SoC, the module could be reused on SoCs where the module is
> part of a power domain.

I need to close net-next today, and I'm not sure if the discussion
is fully concluded. So unfortunately this will have to wait for 6.11.
If someone disagrees please shout.
--=20
pw-bot: defer

