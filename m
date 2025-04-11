Return-Path: <linux-renesas-soc+bounces-15845-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 773C8A85F6B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Apr 2025 15:45:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D34E71756BF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Apr 2025 13:39:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D2401AA786;
	Fri, 11 Apr 2025 13:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KR7juRuj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFDB175D48;
	Fri, 11 Apr 2025 13:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744378751; cv=none; b=Gu2/gyanEaznxrs3DyhBj+fbLtugq2npX9+OLie5XPLS7rcYC7jm0peBj30ADb0Yq5xPYbiwA6reu96CZZI0K7gDgGjZd06hzpwWYnrBgk263+zWUgNYYBTOSKDwWDt1GiRkLoOb0zbHmuSfo1fZAAck3723NIb6V7TZHbWEn6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744378751; c=relaxed/simple;
	bh=nwdw56JvXHxd/zyJ5QMPwv3wEfR0/2J7KHJPwESoXas=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CDbKNKGAOZohh3VR1iRV3Y9BuO4PTCt1vM1xZWd2FTVJEQpk0mbwROyO8TngMe+Pn9/63NqFLGq5vQ0+mbWhNbOdWAXcKrSnS/oGbfCHYHdovW0EoLTcIuVSPC48Az7uGLdBXDydBMf4E8X6sz2iNRf1asesFnsESdcdm346qNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KR7juRuj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD11DC4AF09;
	Fri, 11 Apr 2025 13:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744378750;
	bh=nwdw56JvXHxd/zyJ5QMPwv3wEfR0/2J7KHJPwESoXas=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KR7juRuj9MZJ9pcgTM2h3rgU+KL90sGz8OEoTnqllin0xCOyQu0PszNrnOaBlmBuT
	 vXfaOhXKOOU9We9V77f4h+JG3/UbqcnyOJp4sTbJV2UIdGMD4kLX3u9bXtk4JNCI4i
	 IXfWHUqEawG23PZSGX4PcHUmRKgzNjLe31ldRbjqHOE1N6jUWrSvSHr8JaSQoJL6iw
	 HVIwPdNdk3o0xEmi6UemXb/2R9o5nE5jOq/cnZUNIQCrEqVhiwCtAyMt0U/Dbbp7di
	 /+/BMlWncKEc7oQVsPi6q24OqHmLS0Hh+rEoZAw3MvbO8rfO5u81m1XjeP6xMUn2HU
	 bSDQoJek50Kqg==
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e61375c108so2537554a12.1;
        Fri, 11 Apr 2025 06:39:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUbzlDhTKyDN4yJOPhfT5hX1gYf/oJWgG9hRIHjSKlbjKO2EYvvJjWNEeJ+tcai5dpJ61AGk2k6ZmAnQqF4bO73EY0=@vger.kernel.org, AJvYcCW7uMwlXIuSyP1azrpS+ecnt+k00iJaBIm46agcBPlPuzvypjQTILTkZOl8EgiJJ7KyHSv/Kxdy6Egj0gVa@vger.kernel.org, AJvYcCX28l2DOjed0HuzOvdRZUP6pQ7cL0blx03JZFw4v26B844T4XC46U1/PSZUrYox/Ro8OMWhQsFGSKNZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5VU8A2zo5kV4+pqL+qt5edsI+cUeHrTvzktmnUHstdf8un0rt
	zZjiAi0irXvhUk4BCcKUwHdjRMCWOxnCr7ci9hwGx7OmqqF5fXwV+3CoiMBvyjXiXRCAz+lBlQE
	nw0NatTByHtkLchb7PfIXc8hrIg==
X-Google-Smtp-Source: AGHT+IHCBx9FNpODXurEkVL3DDwzD+pb0yTTZbqh9zO6eHhczvr3O47/vPCgZHqPnrj67KfN0qDwmMDySBH/2uDmTHY=
X-Received: by 2002:a05:6402:42c4:b0:5ed:44e7:dcf with SMTP id
 4fb4d7f45d1cf-5f36fdc4e16mr1982670a12.24.1744378749321; Fri, 11 Apr 2025
 06:39:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <90c7aa143beb6a28255b24e8ef8c96180d869cbb.1744271974.git.geert+renesas@glider.be>
In-Reply-To: <90c7aa143beb6a28255b24e8ef8c96180d869cbb.1744271974.git.geert+renesas@glider.be>
From: Rob Herring <robh@kernel.org>
Date: Fri, 11 Apr 2025 08:38:58 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+sCDEO_n_TLmyNBfhc71NNWWe2UQ21jh8+AdHH=G+KAw@mail.gmail.com>
X-Gm-Features: ATxdqUEE-nGBS4emLkvKhAKcjF2FPzYUzyKn1zR4cfJ-MPI-ZqJeSBygBc5-d-w
Message-ID: <CAL_Jsq+sCDEO_n_TLmyNBfhc71NNWWe2UQ21jh8+AdHH=G+KAw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: serial: snps-dw-apb-uart: Simplify DMA-less
 RZ/N1 rule
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-serial@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 10, 2025 at 3:23=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> There is no need to repeat all SoC-specific compatible values in the
> rule for DMA-less RZ/N1 variants.  Use wildcard "{}" instead, to ease
> maintenance.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../devicetree/bindings/serial/snps-dw-apb-uart.yaml          | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

