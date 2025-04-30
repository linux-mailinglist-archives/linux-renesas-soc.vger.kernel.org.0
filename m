Return-Path: <linux-renesas-soc+bounces-16533-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD29AA55A0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Apr 2025 22:37:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0158B4C00FB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Apr 2025 20:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AA6D29952E;
	Wed, 30 Apr 2025 20:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FiEKCVxv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71AF6283FD7;
	Wed, 30 Apr 2025 20:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746045459; cv=none; b=PMOVtPK1xK92L03sHhpqULUu4xnXNVGI4TcYT8Q7XpH5m8DUonGPR1VAEQ7mZiRYhqXTvz1fNLoIOLFE+PxNl0G7utldW4HPBl0vDnUuHcSCV/oA4T3Posp3uLavs9IgEz0c1fKXT+tnZpcwlutev5npmyWYkxY2g6LMinod/Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746045459; c=relaxed/simple;
	bh=GsovpquVxxvyAV+Zvr34QrYMsuTYQ2FlQWLHGhDnEdE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VXoxRrhSghAQKyvn6RSKbuC9v0jx9mjVWcYGuv9ymPmTbFrBtinWbibKmfRjFa7XFxGZSvxx0N0elkxWEjFh6XBZ1eTs2roxXr5wZaHy8WEB4mcX7Mrqr6RiUgHKRF5HYGz9Zi2i3UPufvOXhBB6wD7g/G+i55wqSS2ieK8aEP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FiEKCVxv; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39c0dfba946so161404f8f.3;
        Wed, 30 Apr 2025 13:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746045456; x=1746650256; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gq2pzDYaQuPaeBvQUvPUR+RhjlKe1qrt7xuK/8qXLTA=;
        b=FiEKCVxvZgx0yjo7Nx5H/tQcNMF3cr7KRZlc1LssIne2oPHWen+SedxZ4fIcktWDj8
         z7wBGBpEjFUf1KVYbe28sSMziwjg+eIHOEac/+SsJkhErW9yRDl3sZoMZy81Gpe6m6qZ
         Fni26asPkLTuFe4Wv8jhLRhzVtKqQQBXfrKElenBuFxFQ1LNrCWG2/Ugtjs4/GE/YYI0
         m5lBa/+WQAifNGI72G0uv0nR1sep41kWjPXNTCFTM8gGZZsMeG0/5fqUymGJWzmzpnF1
         I0HeLbalbttg+8x58cmGUgrgSJVs0czly2G/XSswIBLuIU+Tnimor6ZwpieUMkX7CnVA
         gb0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746045456; x=1746650256;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gq2pzDYaQuPaeBvQUvPUR+RhjlKe1qrt7xuK/8qXLTA=;
        b=jsbrst5rOPYxbbMYUNH00K+mVeAd2wIXcFovCItFf3NitoHEtXaPqZnDo/zfdlvB8h
         kTmNxKxL7o89sYua4RmekWgsEfXvM4iyVnhB+rItST7QLs7aq2HS0kfMznUJH4vgHXNP
         mHJAHyo2mKX/d1KUZEKY+M2uBkERtEcyKbJFPK40rXMGouZQ5IJVx2owNLaZlLMtxHk6
         WbxF5aQh0NZpBK4GF7nOT7y+v/I7MAYlDcbh1gdqDu98y3Y+iZpZKhb+qdAat5mhPnfT
         phURfxNLJtuKl0ixcVYu5NL3Y8hnwaSsoyKM4tz11IeJ9FEKA4a2zHTsXlWZHw/EsQMh
         8Txw==
X-Forwarded-Encrypted: i=1; AJvYcCUd4szu8W/U/SE7eo2pb8iDswxIh4UWz608EyXUF8HQ5+aRHdr8NZXVydUHOvHpaXhCNH1Okd9GWkcvvjJK@vger.kernel.org, AJvYcCVrAta2uw42WJsQmR3VoNDc0vYg8t6ir5NcS2bSghdLxrmqB9duxy07uGauMZyrqHPoeVn75kHBu/dg@vger.kernel.org
X-Gm-Message-State: AOJu0YwyUBMPpuC+9m2cCOz026m92YQX7UTtXxwTqZkTIdPqrLAbc4NX
	7w+Lhkpc3Fu7sYKvy0Dg25BBpJKa19VcuiOn90iQpPvf6Abb6wKoj3/klea4vYdJhjHDV+uUsRw
	gFaZ+P4nrslI4+EvFtzng1yPI7V0=
X-Gm-Gg: ASbGnctmsBOJ/7xq2YNnzQtdKirvE9Nl5DYgIvtsYIcxWcME8RLePt8AJQyYQL5BbKu
	gNomyKy2WpM/eMFy6I8du0FDZDGTHvGBPm2rdcIxbeNccieDb/OV08iA6UCv8NRUS9sciyU043W
	5IHzmKPAREF57N2VofYH3uKg==
X-Google-Smtp-Source: AGHT+IHQylK9tC7uixYQXN3q0QkkbVkLBp5RxRAGaWF4oL2rBi2DtA/+AkTMvTva7X2p0TM7Hm+arj9RLuMaB1XVvoo=
X-Received: by 2002:a05:6000:430c:b0:397:8f09:5f6 with SMTP id
 ffacd0b85a97d-3a08ff50ad1mr3833933f8f.47.1746045455602; Wed, 30 Apr 2025
 13:37:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250415195131.281060-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250415195131.281060-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 30 Apr 2025 21:37:09 +0100
X-Gm-Features: ATxdqUHN4UqVHRvL2ltcAb34qGEYqVxTGvRfaMtKeCOqPh5lk9uOHn1js3jbwGI
Message-ID: <CA+V-a8trb7Kxg0FeuvpJCnbqGaR5FMPdTd-CaHorMDvSM3Wy7A@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] Add USB2PHY Port Reset Control driver for Renesas
 RZ/V2H(P) SoC
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Philipp,

On Tue, Apr 15, 2025 at 8:51=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Hi All,
>
> This patch series adds support for the USB2PHY Port Reset control driver
> for the Renesas RZ/V2H(P) SoC. The changes include documenting the USB2PH=
Y
> Port Reset control bindings and adding the driver.
>
> v4->v5
> - Added Reviewed-by tag from Biju Das for patch 2/3
> - Dropped NULL check for of_device_get_match_data() in probe()
> - Dropped dev_set_drvdata() in probe()
>
> v3->v4
> - Added Reviewed-by tag from Krzysztof Kozlowski for patch 1/3
> - Updated commit message for patch 1/3 as per review comments
>
> v2->v3
> - Dropped Acks from Conor and Fabrizio, due to below changes
> - Renamed binding renesas,rzv2h-usb2phy-ctrl.yaml to
>   renesas,rzv2h-usb2phy-reset.yaml
> - Renamed node name in example to reset-controller
> - Renamed function names in reset-rzv2h-usb2phy.c
> - Kept the reset line in asserted state during probe
> - Added comment for rzv2h_init_vals[]
> - Added entry in MAINTAINERS file
>
> v1->v2
> - Dropped binding postfix in subject line for patch 1/2
> - Moved acquiring the ctrl2 pin in deassert callback
> - Updated ctrl_status_bits
>
> Cheers,
> Prabhakar
>
> Lad Prabhakar (3):
>   dt-bindings: reset: Document RZ/V2H(P) USB2PHY reset
>   reset: Add USB2PHY port reset driver for Renesas RZ/V2H(P)
>   MAINTAINERS: Add entry for Renesas RZ/V2H(P) USB2PHY Port Reset driver
>
>  .../reset/renesas,rzv2h-usb2phy-reset.yaml    |  56 +++++
>  MAINTAINERS                                   |   8 +
>  drivers/reset/Kconfig                         |   7 +
>  drivers/reset/Makefile                        |   1 +
>  drivers/reset/reset-rzv2h-usb2phy.c           | 236 ++++++++++++++++++
>  5 files changed, 308 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/renesas,rzv2h=
-usb2phy-reset.yaml
>  create mode 100644 drivers/reset/reset-rzv2h-usb2phy.c
>
Gentle ping for review.

Cheers,
Prabhakar

