Return-Path: <linux-renesas-soc+bounces-11967-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7C0A06234
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jan 2025 17:41:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 098671889B44
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jan 2025 16:41:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B59991FF609;
	Wed,  8 Jan 2025 16:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yye6XYiL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4022594BC;
	Wed,  8 Jan 2025 16:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736354309; cv=none; b=bW39zTzNupHO1QnTJMTOyz/O5tFpgbOecwM50V9ObXpam3AlWxdOpHAkZ9hGoNaSk1YSfxPbjukJbILY3IW/ErXSmq3QYgjR/H0ynTyE3h2c/12CyFrZZRja36aL5nSv/srcCey1KCVFZNDsTay64GNShvYtoW46pct1Uz5LT+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736354309; c=relaxed/simple;
	bh=1PTvZkB7v2l5pzhBkf42/i+DDfV/d369bK2eZRiNNuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QiSUQSkAUe7oSJeLZL4tyIcme8sK0HJSCsE33DX7IUwtI3XT3LPqM1+dLroDRl7rWnoyxiaoAc8JVwomqWX1Wmv6Y/SpSSDih7evnwjHgJ3dcX1afFwZOLOX03l8i5y4CE9X3IFT66XDcbmOaBaJBVn3It8Jyt1Kntx/hxV4mr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yye6XYiL; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-436249df846so113015e9.3;
        Wed, 08 Jan 2025 08:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736354304; x=1736959104; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4cuSrltjvkzxAoQOtMu4WRHfXq6bp8x92iDHnihbR3k=;
        b=Yye6XYiLoPl2jU5/AvsRFLfNGPBqA9P6JtTJw7Gfv9kQ+o9W2NlZa+4WpWqD9qVFoo
         G0vTq4FXSVfOFTpLQouSlimPjAPi5o2Tfc7b6/k6h4sz5E4DbnZEZMFKFSbkceigfJn1
         QEOMnT8vq5vu3ozDrxSXWaCRvHJW5wp9sDs1dOqway1G5sOPtJZAhQiwMpRCzyKXTscU
         o20j4LqN1QhCq52NwxRbMuw0nvdjyIKAhtH0yobJ1xvTyDsNOM608jEDshJL7zB52FvO
         QyQRv9iHj2tzLruhfcI9GvhlhAEExioCWQI9J7oYvHf4uWeS/DQOIeXMrzRTO442OAmu
         49SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736354304; x=1736959104;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4cuSrltjvkzxAoQOtMu4WRHfXq6bp8x92iDHnihbR3k=;
        b=PYLzYEyBnZP67nkFpfjdG7kgoBmgwSHQtD3auCRkDFV/ieG35y7dWiBw5SV+lI+2q6
         jxdSbmJuX21+yFGEjkWAFbjYXVIqheuI/q3NxEyw3g0mUoHaSxQzCfcQ4cMsK850fE4H
         gH7S9sNJ60XpgYdpIUSESzqFW+UJJmZoACxReW0pZXcmN6fg9u4gtpuFkH9ZCoMIYBc7
         ZYAL0D/mR0JpiWGntBK3CJvoGN+xgBvPHkLGIFLguCg2xZAEA1ov+2C2R5NAJdXWH926
         FqS0SSFerTug8SJ4+wwohEYc1w9/Gw2PROoMbnpFPFeasJr8ve8Bcqkso3lqNw9i0/6y
         BTUA==
X-Forwarded-Encrypted: i=1; AJvYcCVh2PW40r0bJDCPqqczgvbtNI3bsOBz0eNMM04TmJyIwLMiqO0Hf1TdiQqZVXd3mcg9YjsFFj0pzU0Vkj4=@vger.kernel.org, AJvYcCWHLmoTZQYVgQZyZ0KsmCSnnkL4NUKuoMtD5geUqbQd+hS1wQguw1igCXtMlbnST0YOBiS5+xyjTSaJDWHPLsjzD7o=@vger.kernel.org, AJvYcCX937NuJKwI4+TpK0yl2ElvuV+U+nw5xe8bpx/Q7p9C3Gu9zFOh3XWhW9Pt1uEhcrqZutufiXYHkEGmo2lP@vger.kernel.org, AJvYcCXWz263V2MI1BNVOrp2NhHTCTlLGj2l99yv002dtOX4I7UV/vSPuUWZgq/lgrxluRGznPd+e6IuxxPM@vger.kernel.org, AJvYcCXrDvzTLLNN0Q4x0yaBP5Skf8OKgpFqiAlL7WTxSa/ynTQTmxxG3TCU1QdSl9zIyLD01QlVeTEqBBiF@vger.kernel.org
X-Gm-Message-State: AOJu0YwzE9jx6dKg6qCzXQbNzwNVfiM+9pUXyyWv2Gq/5f5oFjnakVJF
	o9Ov3AtTTtvwNdj+Pyp01edVCn586tSNSrNwWwwK3RiD20u87mwZ
X-Gm-Gg: ASbGncveqgEUcH6pXxTUggLeWe2ss7tbtJg8m1Vup1Sd1F4UVNgoImoIcL3GVuWCfDR
	xcH/ulgApJlmO4G5E2JcCsU4/vLnyLCA/03gLaSsCb8JIULzFdO4PKUuoIfSfz+TLMjywnoL588
	Ek3frgh8wlV1dh52BKVXqm6MOLoLw+TWAA7jZwVwHVRZ6q3FHFLBV8gb43zOIxLgPeFDRol5fBt
	QcAOzQkPPUQafD6zd+IvaF4Ld4TszByDdf91jescP0t2HlA/DcguARUqsIi4WZCrzOy996RZQjt
	8DKLS8NOq5EvDXRAX8SqNQapnKN/EnC2MzBnspm12SA=
X-Google-Smtp-Source: AGHT+IGp1cgCy8Xm3K9YW0ye3mjPWJQZ9C81gUBXymA3f6FFEe37p3slvzHvRuRGSFy39baH4a7Gig==
X-Received: by 2002:a05:6000:184e:b0:385:f560:7911 with SMTP id ffacd0b85a97d-38a872c93e3mr2679293f8f.10.1736354303999;
        Wed, 08 Jan 2025 08:38:23 -0800 (PST)
Received: from orome (p200300e41f281900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2e22767sm25890945e9.39.2025.01.08.08.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 08:38:23 -0800 (PST)
Date: Wed, 8 Jan 2025 17:38:20 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Justin Chen <justin.chen@broadcom.com>, 
	Al Cooper <alcooperx@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, Florian Fainelli <f.fainelli@gmail.com>, 
	Benjamin Bara <benjamin.bara@skidata.com>, Bjorn Andersson <andersson@kernel.org>, 
	Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>, Del Regno <angelogioacchino.delregno@collabora.com>, 
	Tianping Fang <tianping.fang@mediatek.com>, Jassi Brar <jaswinder.singh@linaro.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: usb: Correct indentation and style in DTS
 example
Message-ID: <uyld4j6frger6oe332c4i32lkk5ue7ifrhu3565lrcn2xwc5xc@hgfyaryobqz2>
References: <20250107131015.246461-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5borij4dhzmoodud"
Content-Disposition: inline
In-Reply-To: <20250107131015.246461-1-krzysztof.kozlowski@linaro.org>


--5borij4dhzmoodud
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] dt-bindings: usb: Correct indentation and style in DTS
 example
MIME-Version: 1.0

On Tue, Jan 07, 2025 at 02:10:13PM +0100, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
>=20
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/usb/aspeed,usb-vhub.yaml         | 40 +++++++++----------
>  .../devicetree/bindings/usb/brcm,bdc.yaml     | 14 +++----
>  .../devicetree/bindings/usb/cypress,hx3.yaml  | 24 +++++------
>  .../devicetree/bindings/usb/dwc2.yaml         |  4 +-
>  .../devicetree/bindings/usb/fcs,fsa4480.yaml  | 20 +++++-----
>  .../bindings/usb/intel,keembay-dwc3.yaml      | 30 +++++++-------
>  .../devicetree/bindings/usb/ite,it5205.yaml   | 18 ++++-----
>  .../bindings/usb/maxim,max3420-udc.yaml       | 28 ++++++-------
>  .../bindings/usb/nvidia,tegra210-xusb.yaml    |  4 +-
>  .../bindings/usb/renesas,rzv2m-usb3drd.yaml   | 36 ++++++++---------
>  .../bindings/usb/renesas,usb3-peri.yaml       | 24 +++++------
>  .../devicetree/bindings/usb/ti,hd3ss3220.yaml | 38 +++++++++---------
>  .../bindings/usb/ti,tusb73x0-pci.yaml         |  6 +--
>  .../devicetree/bindings/usb/ti,usb8020b.yaml  | 20 +++++-----
>  .../devicetree/bindings/usb/ti,usb8041.yaml   | 16 ++++----
>  15 files changed, 161 insertions(+), 161 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--5borij4dhzmoodud
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmd+qfwACgkQ3SOs138+
s6Er4Q//VZl8qzubU2vGD+vYdws9AIeAPkYgq0YF3ngrrr5mGTubUKQ7Zz8JK///
i/3WJevwDy2USeH86kJMNE9iNo4IreDdz2QsYaZzAb8lArTFezDCTHJrqyBDniQM
OCCNB7QNsWqaUe9H6g4NpfD75Bwmhe114ywlB7hj3WzOVa/KTYF3TtE/Ktp4JdQg
MSVpkv9wmN3RIY09OVtpmgIjbJ+te1tQHALu405trlrtG6HtjSmcVGAdrA1U+A8Q
x+miGhfUBdnoXQehPW7PVLzMCqo92ToQPmsjhRgKVMNixRqDJlLHhTICIuaNgtFB
KnO3meD4Z9Tz5H+ZXdRwIL6/HkCr5ofoqKll8Q0ihoDsq02auv7O50m078coyQv5
kyLOjhVr8e1BxNv/gQ1msux6UH3R7oOeB2Dz+tkzgheVbE4sbgsrxc0qA9smcB7X
G57z8Kau0/nZiUEKKsnleEhEtyNMfOFE+Jw1evYNp24D4OzykGpuaJfzOlG1Lse2
jGaqgnw5EqRNF85hVVOHXqVzZVVFQzw5gRoBBbbcsXnC9iYXdvmRWSMZzdBUEVto
vwTMpeMD4fFfQbxub/u81Q8800zwF8jow8+ivNd8cPJrzWznKDQRubvPOoTl+HZU
ODkzlPRv8vnNYUHt+Ug3/L00O6fTOdZ/+MtCX7hFZNA4Rde2Ewk=
=DdZu
-----END PGP SIGNATURE-----

--5borij4dhzmoodud--

