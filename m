Return-Path: <linux-renesas-soc+bounces-11925-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F324A04122
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jan 2025 14:47:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 54DB17A238F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jan 2025 13:47:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E34C1F03C3;
	Tue,  7 Jan 2025 13:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="CAuHcqGN";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Gp8ECD2a"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A1B1E0DED;
	Tue,  7 Jan 2025 13:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736257671; cv=none; b=Hdw33S3QojFMSjDhizcpdYp9C+tRYViMS2yPzzCSJaxe2VQxeusOy1atSzsszcqGZzHotO/VUi9GDfITF1+5jBVTYm6ecf6Tqm2lXNccXz1Vmum8CJgoXz6146Ukbq94BmsMbqBI+7n7hvqj3CJytgdxgFfE5ZSM/0y2yMUfaeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736257671; c=relaxed/simple;
	bh=bCMttcWQirNicytx6ykU0QZpRRftXACwB5o3zdvB5x8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UGD10H9o5Yp66T8Eoe/5tjQvEdKwoWi/h5UHsxXBZ5Sp0qNMCoq7bR+qVxNZ/eR7aceq9/eavPGr28tmu9WTenN3sFctucJXsnZcuC+3zRlFNxChPKmUGKxOTt3VYzxkF5D4J5l1Bj4kVGf03GJ5WCm8b+bDowSCAGdqforo5U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=CAuHcqGN; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Gp8ECD2a reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1736257666; x=1767793666;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=H2JiFyCh/Tl5YOwhVHC+9/o2zm1iU1FIoUS3LVDCVQM=;
  b=CAuHcqGNaufqPWJp7fGS5bsTGqRC6pb794W+/8MZkaL4uQn4ahO/wePn
   01mgAosms7/ZUOmDZc/ERincOyBSOjdWKUkOxj5LnogmDG1mUVk+3B1XX
   BYtZr2E1Ab19/sZnGhznkJczMBek3d5bqAi4nmxgCyWPusMbPpEPxRu3h
   koDUZg0L1EQKMdiA8un2Z9BMpE79iq45Av0wRaYuNEuShC+yDH3HBrBtY
   WKvJ+5+H6PIyjzJPHDwckFPUbGZzJ1hJh8NihF87savy7co0jdrYx6L2Y
   1BBe9RC4nz3+yaZel5x/ha4mjhXNucttajc4sQIVuNJTOh81aHr2FTNsv
   A==;
X-CSE-ConnectionGUID: OVZasUpRQum1PZsDd73xFw==
X-CSE-MsgGUID: mYpmTubRRzSDooSbu505XQ==
X-IronPort-AV: E=Sophos;i="6.12,295,1728943200"; 
   d="scan'208";a="40895891"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Jan 2025 14:47:43 +0100
X-CheckPoint: {677D307F-16-3C670366-E45AD810}
X-MAIL-CPID: D9326B8D606E51C9C554D2FC41D37A2A_4
X-Control-Analysis: str=0001.0A682F28.677D307F.00A7,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 12BB0164990;
	Tue,  7 Jan 2025 14:47:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1736257658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H2JiFyCh/Tl5YOwhVHC+9/o2zm1iU1FIoUS3LVDCVQM=;
	b=Gp8ECD2aEaJ2EoPlQW15Ikeq6rQoBFt/xYZHffSmoaiTRcEt3DyE1007ghx7QUsh6rWleF
	lVKVhAGrvYWx+CEhDIzb+u3GFfHUIrNePQeY7nizrT961wk3aoCy86jbq9k1WGCr1X2RnA
	ooMJ7bMSMZAzRbH4f4WwI+NhT3Gr9T1Q7ZZihIWPpiYe4ojX3SOqQh+a2FQ3vSheOrwhcX
	F5L14kcteB5aHapjOda7uYt6BTq6MW8VaLetOMmY5he1vQAsX4D0qjLcLXWBDFl5WpEvRR
	JInTk5xg/jzac1LcmHiQQC7oyqGly+SMY4vt8KxMP12YKK3wIRlQbd7PMldfJg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Justin Chen <justin.chen@broadcom.com>, Al Cooper <alcooperx@gmail.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Florian Fainelli <f.fainelli@gmail.com>, Benjamin Bara <benjamin.bara@skidata.com>, Bjorn Andersson <andersson@kernel.org>, Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>, Del Regno <angelogioacchino.delregno@collabora.com>, Tianping Fang <tianping.fang@mediatek.com>, Jassi Brar <jaswinder.singh@linaro.org>, Biju Das <biju.das.jz@bp.renesas.com>, Yoshihiro Shimoda <yoshihiro.shimod
 a.uh@renesas.com>, Francesco Dolcini <francesco.dolcini@toradex.com>, Macpaul Lin <macpaul.lin@mediatek.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] dt-bindings: usb: Correct indentation and style in DTS example
Date: Tue, 07 Jan 2025 14:47:27 +0100
Message-ID: <10618962.nUPlyArG6x@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250107131015.246461-1-krzysztof.kozlowski@linaro.org>
References: <20250107131015.246461-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Am Dienstag, 7. Januar 2025, 14:10:13 CET schrieb Krzysztof Kozlowski:

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
>=20
> [snip]
> diff --git a/Documentation/devicetree/bindings/usb/ti,usb8041.yaml b/Docu=
mentation/devicetree/bindings/usb/ti,usb8041.yaml
> index c2e29bd61e11..bce730a5e237 100644
> --- a/Documentation/devicetree/bindings/usb/ti,usb8041.yaml
> +++ b/Documentation/devicetree/bindings/usb/ti,usb8041.yaml
> @@ -51,17 +51,17 @@ examples:
> =20
>          /* 2.0 hub on port 1 */
>          hub_2_0: hub@1 {
> -          compatible =3D "usb451,8142";
> -          reg =3D <1>;
> -          peer-hub =3D <&hub_3_0>;
> -          reset-gpios =3D <&gpio1 11 GPIO_ACTIVE_LOW>;
> +            compatible =3D "usb451,8142";
> +            reg =3D <1>;
> +            peer-hub =3D <&hub_3_0>;
> +            reset-gpios =3D <&gpio1 11 GPIO_ACTIVE_LOW>;
>          };
> =20
>          /* 3.0 hub on port 2 */
>          hub_3_0: hub@2 {
> -          compatible =3D "usb451,8140";
> -          reg =3D <2>;
> -          peer-hub =3D <&hub_2_0>;
> -          reset-gpios =3D <&gpio1 11 GPIO_ACTIVE_LOW>;
> +            compatible =3D "usb451,8140";
> +            reg =3D <2>;
> +            peer-hub =3D <&hub_2_0>;
> +            reset-gpios =3D <&gpio1 11 GPIO_ACTIVE_LOW>;
>          };
>      };
>=20

=46or ti,usb8041.yaml:
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



