Return-Path: <linux-renesas-soc+bounces-12628-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8738DA20896
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 11:32:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA2821883397
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 10:32:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4A7119D065;
	Tue, 28 Jan 2025 10:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IAKt2a66"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D1319CD01;
	Tue, 28 Jan 2025 10:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738060352; cv=none; b=hwLVG7uNK0iHA7KcZBd0XkLaLqKAxXuaBkwEagIlidXEuz7YRWhVJFQIV1tq7TGdnq9poFHx8IVvNdeZuNdusUzcIsB/S0UQXS3tbFlJoifup5b0Ty5T+5e92u3GxdKnagYkQR+fwQ4QFeSjCyDe+W9NOckaCjCCUbUQRIBLdPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738060352; c=relaxed/simple;
	bh=WnDBMq69K4jQoUM/h8kbi6BhIl8V+e3PP/oTZpu4AUo=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=tofRjxoDNes+0IKQW7JclNszacZXpO2kjW4tGcxQ4Pmow0RgDWxCdhLZlyOonqg4rxNKWFk252Euu/QfbhNieMD0gCyEW76IhSNBcgY7FqvuuEWS8K+4m7xl3ZX7KUnozvBS5AZQQCINfBOFj4kWutmx+ru63VogV46Jy0elUZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IAKt2a66; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C6D4F6DF;
	Tue, 28 Jan 2025 11:31:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1738060282;
	bh=WnDBMq69K4jQoUM/h8kbi6BhIl8V+e3PP/oTZpu4AUo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=IAKt2a66XpBCNjHmAVgNst9/d3eDZLwjsnHN8sVN7qo7GcesioJbdWqhM9HWrLKNL
	 RemqsXdY7nGrHLdWJjqeuhEzMYu8YFhlGfRYHRk7AKXx4hWTZ92u4xvb4gTXgkHv1G
	 uq0BFpOfqve9EiAzlL9X9IujvTNxXyOOTuLwPTWI=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250128-rcar-du-maintainers-v1-1-c429ca421c52@ideasonboard.com>
References: <20250128-rcar-du-maintainers-v1-1-c429ca421c52@ideasonboard.com>
Subject: Re: [PATCH] MAINTAINERS: Update drm/rcar-du maintainers
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: linux-kernel@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Krzysztof Kozlowski <krzk@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Date: Tue, 28 Jan 2025 10:32:26 +0000
Message-ID: <173806034678.3771432.6102717886527607170@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Tomi Valkeinen (2025-01-28 10:28:48)
> Add myself as drm/rcar-du maintainer. Switch Kieran from a maintainer to
> reviewer.
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  MAINTAINERS | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ed86d884ee0d..5b1bf5fd56fd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7760,7 +7760,8 @@ F:        include/uapi/drm/tegra_drm.h
> =20
>  DRM DRIVERS FOR RENESAS R-CAR
>  M:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> -M:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Acked-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> +M:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> +R:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>  L:     dri-devel@lists.freedesktop.org
>  L:     linux-renesas-soc@vger.kernel.org
>  S:     Supported
>=20
> ---
> base-commit: e2a81c0cd7de6cb063058be304b18f200c64802b
> change-id: 20250128-rcar-du-maintainers-34ee66948f04
>=20
> Best regards,
> --=20
> Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>

