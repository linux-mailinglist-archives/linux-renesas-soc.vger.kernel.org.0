Return-Path: <linux-renesas-soc+bounces-23212-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05ABDBE7DB4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Oct 2025 11:44:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 076A33B3115
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Oct 2025 09:38:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9289C2D239B;
	Fri, 17 Oct 2025 09:35:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F2E30FC01
	for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Oct 2025 09:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760693722; cv=none; b=uEcoE0taueID0RWtlxCLz7601UzkphzfdJCV3c9Vhemg8WqcBLUVGOz9MTE2qKTZsTZK26EHmRxxVb8yqA52cEKAcgschM+DXVkJrijZJRiJwJwsCvX4kl95PcL4ZtiAkIacxFlHSGLBHoFmHs5yDJNxK/lmQWIsrR6gprSwAPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760693722; c=relaxed/simple;
	bh=F2V1zjpLQKIIpoDk23tJ7MF7xrrIVymjNlg3Q6rhwC0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NyyeLstM1B1zxumx6sZ4rg/F8hdZ4VI1ItX8oX1vwoPs5H71dtM3Exd9LTAU5Czn4iNYAr9qo8JlhzqKLag+D41ves42U+upbNB5ZSZ6VrlQv9UMZ0B2EF5k2K9fLSGjGsHTBQ2vjSuhw42VLKIGkP7gUZ3Bcdq1T4bjQ+vYxR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v9gri-00057L-Qg; Fri, 17 Oct 2025 11:35:14 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v9gri-0042MX-1u;
	Fri, 17 Oct 2025 11:35:14 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v9gri-000000003Kt-2DVO;
	Fri, 17 Oct 2025 11:35:14 +0200
Message-ID: <0a347beb6d3b6adea2f9c78721d33732b8e85724.camel@pengutronix.de>
Subject: Re: [PATCH v2 2/2] reset: always include RESET_GPIO driver if
 possible
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-renesas-soc@vger.kernel.org
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Krzysztof
 Kozlowski	 <krzysztof.kozlowski@linaro.org>, linux-kernel@vger.kernel.org
Date: Fri, 17 Oct 2025 11:35:14 +0200
In-Reply-To: <20251015205919.12678-6-wsa+renesas@sang-engineering.com>
References: <20251015205919.12678-4-wsa+renesas@sang-engineering.com>
	 <20251015205919.12678-6-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-renesas-soc@vger.kernel.org

On Mi, 2025-10-15 at 22:59 +0200, Wolfram Sang wrote:
> Reset core uses the reset_gpio driver for a fallback mechanism. So,
> include it always once its dependencies are met to enable the fallback
> mechanism whenever possible. This avoids regressions when drivers remove
> open coded solutions in favor of this fallback.
>=20
> Reported-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Closes: https://lore.kernel.org/r/87a51um1y1.wl-kuninori.morimoto.gx@rene=
sas.com
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>=20
> Changes since RFC v1:
> * new patch
>=20
>  drivers/reset/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index 78b7078478d4..7319bcd251dc 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -5,6 +5,7 @@ config ARCH_HAS_RESET_CONTROLLER
>  menuconfig RESET_CONTROLLER
>  	bool "Reset Controller Support"
>  	default y if ARCH_HAS_RESET_CONTROLLER
> +	select RESET_GPIO if GPIOLIB

Thank you, what was the reason to go with this instead of

	default y if GPIOLIB

?

regards
Philipp

