Return-Path: <linux-renesas-soc+bounces-12678-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A67BA20CD4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 16:20:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B9875167733
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 15:20:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD4BC1CDA0B;
	Tue, 28 Jan 2025 15:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Hvl2r6Jn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB64E1B041F;
	Tue, 28 Jan 2025 15:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738077604; cv=none; b=WwJAJ1cahGB/EJ1dPpnyR6KZpSb7xbpXxr0+4XPBSgeS4hQfffibU462AdmTlZWKQ1m1MoG+AfnNoXYVxoT8hx0Hri8p77Hba5w86Okt70X+8ktTXWOYRULh5eCUsQdISk67RjOrvJ3zDfjbZXztgicuwhivKTyq5/2wxSRr1dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738077604; c=relaxed/simple;
	bh=/M3sluiHSQ79DO/JWZhFhxH1LzXYMDwMfYXtk623IT4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fUzXZ5nKyEftSzCUTy4PZ8KqR8Rb9lSS+EzVUTzTEudnE2l8nyZ1yRpijrAzv3Skwb4eJ6NSEHOEdJIlqlL9G3stNw2IpxV2mVScxiT19MFabf93APurw5KHasL2zgvC7k68oF3/ZcooNXr6iBd2bZ6ElZg8KICfkVp3oXuPpEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Hvl2r6Jn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0C3A8496;
	Tue, 28 Jan 2025 16:18:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1738077518;
	bh=/M3sluiHSQ79DO/JWZhFhxH1LzXYMDwMfYXtk623IT4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Hvl2r6JnjxPhpXspXDdU9PxgZ7CvA31J5qb3ox9CyPTBKy3uXjcvmHdturEqWO/Uh
	 2jKJJU1/3pzNqNu62vUnfcsoznWxhlJt6FMyoOsgM6gNCLpMQtHcnOj+Tjj0/2UfTm
	 b+NS4+rmEqSwXw+ez/wyx9ktZ9PG+uLGp10r46KI=
Message-ID: <b03dc27c-4bc8-4faf-b60d-b7ca5f1c5d18@ideasonboard.com>
Date: Tue, 28 Jan 2025 17:19:38 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: display: renesas,du: narrow
 interrupts and resets per variants
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Conor Dooley <conor.dooley@microchip.com>
References: <20250128094719.63776-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <20250128094719.63776-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 28/01/2025 11:47, Krzysztof Kozlowski wrote:
> Each variable-length property like interrupts or resets must have fixed
> constraints on number of items for given variant in binding.  The
> clauses in "if:then:" block should define both limits: upper and lower.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> This was sent already in August 2024 (!) and still not picked up. Thus
> some other people started doing similar in December.
> 
> Can this be finally merged?
> https://lore.kernel.org/all/20240818173003.122025-1-krzysztof.kozlowski@linaro.org/
> 
> Changes in v2:
> 1. Add Ack
> 2. Rebase
> ---
>   .../devicetree/bindings/display/renesas,du.yaml      | 12 ++++++++++++
>   1 file changed, 12 insertions(+)

The series looks good to me.

Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

I'll push to drm-misc-next.

  Tomi


