Return-Path: <linux-renesas-soc+bounces-21235-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C91AB4173B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 09:51:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1EE27189F5E5
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 07:52:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3ED82E0915;
	Wed,  3 Sep 2025 07:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Yb+FWuiZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1242DC330;
	Wed,  3 Sep 2025 07:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756885904; cv=none; b=BiTVv470nk1Wl/zrAZ3niyS4F5m6KVieEfIcjr8e+3HlTlX+KUidKs6cczKJzp/wYUEWTpcKOS7/SvnssoqHUHhZPY4L3sjoZMo0U1dN85fKcWl3gcE2m5125CrD1EIZrAhO8bnGCBqUKOwwRTy2m639s+UfShhSP5aMpsPqgCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756885904; c=relaxed/simple;
	bh=mV0ZuCfcATBvbQ0xkVmvRYkhtyi+VD/NilHQnisIkfQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gMLct94gcSSd8FY+SBNodtEhYGxgonV6ldSKDIIgnWJqY6d/pQ07jP0k3AMK+lQyi2WfvoCo89QDWRHwWfvJhhXkhquCS3HM5jELAGheKrLxaOa88ItGbrnbhpOcW+O0TpRts0nVDp9BTEYDXNzu1bf5dhOeFbdOPbByiTFp8qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Yb+FWuiZ; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 21AB9443C6;
	Wed,  3 Sep 2025 07:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1756885897;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1CocstRRSzAohJcoaTSBgtYSwdX5wTjwztL33/hiTn8=;
	b=Yb+FWuiZlCkgr2nRaszUaQz4ELaVNBGTsxOosPE6Q6tYRI2SXHtayquSFRCfbiBJUrFHLq
	tNZFqqRZ8jmTNiI45G2qnZGjzKLjr6QVWOyIjW3yg5kip6htopHu2w+YZIpmKfYhLTarKZ
	6e8bdKV5SKGu8EbftKNbuPw+yKbrHYR4KJCuPm08jPQpIKCOWCY0F/Fm8bHKxkdFBZyln+
	juU/jrxerJxET4fr7aRgfOZ4woEULhwE3jH96u7HJGQaeZn7qJhcyU9C+YuKwEVmpQblNS
	lvO96WpzRTURd+mAWHaSgRFK8NptcEBOCOAgMSqapLxrqUeYV+xYPQ1rMhCV9Q==
From: Romain Gantois <romain.gantois@bootlin.com>
To: Matthew Gerlach <matthew.gerlach@altera.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject:
 Re: [PATCH v2 2/2] dt-bindings: net: renesas,rzn1-gmac: Constrain interrupts
Date: Wed, 03 Sep 2025 09:51:26 +0200
Message-ID: <13032782.O9o76ZdvQC@fw-rgant>
In-Reply-To: <20250902154051.263156-4-krzysztof.kozlowski@linaro.org>
References:
 <20250902154051.263156-3-krzysztof.kozlowski@linaro.org>
 <20250902154051.263156-4-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart6217165.DvuYhMxLoT";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvheekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkfgjfhggtgesghdtreertddtjeenucfhrhhomheptfhomhgrihhnucfirghnthhoihhsuceorhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeikeekffdvuefgkeejgeefhfdvteeuhfdtleeiudehieeludelvdetleeggfffffenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghlohepfhifqdhrghgrnhhtrdhlohgtrghlnhgvthdpmhgrihhlfhhrohhmpehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddupdhrtghpthhtohepmhgrthhthhgvfidrghgvrhhlrggthhesrghlthgvrhgrrdgtohhmpdhrtghpthhtoheprghnughrvgifodhnvghtuggvvheslhhunhhnrdgthhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrt
 ghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: romain.gantois@bootlin.com

--nextPart6217165.DvuYhMxLoT
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Wed, 03 Sep 2025 09:51:26 +0200
Message-ID: <13032782.O9o76ZdvQC@fw-rgant>
In-Reply-To: <20250902154051.263156-4-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0

Hi Krzysztof,

On Tuesday, 2 September 2025 17:40:53 CEST Krzysztof Kozlowski wrote:
> Renesas RZN1 GMAC uses three interrupts in in-kernel DTS and common
> snps,dwmac.yaml binding is flexible, so define precise constraint for
> this device.
> 
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v2:
> 1. Minor typo in commit msg.
> 2. one->three interrupts in commit msg
> 3. Rb tag
> ---
>  .../devicetree/bindings/net/renesas,rzn1-gmac.yaml       | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.yaml
> b/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.yaml index
> d9a8d586e260..16dd7a2631ab 100644
> --- a/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.yaml
> +++ b/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.yaml
> @@ -30,6 +30,15 @@ properties:
>        - const: renesas,rzn1-gmac
>        - const: snps,dwmac
> 
> +  interrupts:
> +    maxItems: 3
> +
> +  interrupt-names:
> +    items:
> +      - const: macirq
> +      - const: eth_wake_irq
> +      - const: eth_lpi
> +
>    pcs-handle:
>      description:
>        phandle pointing to a PCS sub-node compatible with


LGTM.

Reviewed-by: Romain Gantois <romain.gantois@bootlin.com>


--nextPart6217165.DvuYhMxLoT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEIcCsAScRrtr7W0x0KCYAIARzeA4FAmi3834ACgkQKCYAIARz
eA7RNg//V4dk6mgmH97uD+XYikoAmRYpNxcP1tF4TPEBmM8inft958wcps+BK+oj
rBOtT+EpaiI13HpLUFzOX6TSgY6L0DacsWoAJAbFJr7OuS/MuJjignny1UCNEm9R
ZFFCzMr0E3AlyPQ8WxgksOvop/ZzRKIodKsUMq4u0v6Y7inbV+UVJre1egV+ReDf
YSGjgS4HibKWrUbZCF4HjD8qglzueQ35C6eCpcDBU2+4mTBnVKwH32ZEg2ehJ+Cd
ohKKI9Jtg13/QqWZZsccjzdMNaOqMtRyhs9qFrHk9+ddgoGtD2ANJ2Ka56OQwvb0
Y02hNnji+IPla0tiioZf9ARG/yfV/zH02o4JAEXAbMXpv7ZPRa9ektGDDImYPahL
i7+NyCgDSOA0R6b0m0bToaZyIFf/VWPkoo8Z8AmrgiQo2d6flhfd5ce71GuIPQfC
WfhDHjQYDmB0wonkXg/HcSOc1R2WL/nf33jEVvr2q8lvikohEbYQHi848DEhZX4N
4LcIzz28RC/hiDRhKBhxkHGHjYoBcTsNjeD3Xk0IIqr2bEenInwNPnhFuSzlo1Zc
u616y3AZbqeu0tQHPDeMtBGP4/omxeVR7WalyXS5WdhrOJDsQdWJm5jmoodDCAeQ
1Zogcm8As8XDF5BZ91YvI/W5ojzJ/5gIJ8UcJZxheHO5i4bppU0=
=22P1
-----END PGP SIGNATURE-----

--nextPart6217165.DvuYhMxLoT--




