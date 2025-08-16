Return-Path: <linux-renesas-soc+bounces-20572-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D87B2892B
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 16 Aug 2025 02:18:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A3DF5A0CF1
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 16 Aug 2025 00:18:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBFB11FC3;
	Sat, 16 Aug 2025 00:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JCY3poE4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C338F15A8;
	Sat, 16 Aug 2025 00:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755303521; cv=none; b=gq2RfqQhG0hlXVFzUH65bGRuRCf7sVEWiRmYjGQrwAD8tzwwZnkVN26/X1w7GyAWKJA062Bs6ct46LJjQ1ukJEAKNmvMgGfD8r9KSUixlrEfGaB5I18ZpBrVgfdGFWB/tmMYpdq5WKigcqNdhjevTqj3eIrQqp3rk9sLGwzMse0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755303521; c=relaxed/simple;
	bh=DVcKU2qFe9QJZAWioazcUWE3klHb3B0EQgwVVyw/unM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CosAU8kDv1QNeNdj6QuCFyYC8Wd+MlG2Ur0C13quSsGQrmRLqKozqXjxbaFRWmMsKJWjSnyXTe56pltTkJxLHyl8Cb+76n7xMpyEPRoAUQwra2JJWSWbXvz+kCR8saD+il2lH5qWowHXJRGq2jlC4DCULQveYDiGsjQPnwVGhis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JCY3poE4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5697AC4CEF4;
	Sat, 16 Aug 2025 00:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755303521;
	bh=DVcKU2qFe9QJZAWioazcUWE3klHb3B0EQgwVVyw/unM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JCY3poE4ogqQSbcy/7fW4lWVMjoQvuwzd/6PXbh+pLdEoqhEHxpNKjO1nGHu+Yu5A
	 EyX2rSeYJyeffuFw1gYwou9A6C6cJyG9LsFWVt7SVUjksw/Vs5hX/2usP8pKzdtBJK
	 zo5k7/UNy7yygGdffJ54tfGyaa7dManJY/vxY3VHIu2wvqvVva2BXJsuNAUtIMIPNd
	 jfP3fgmwXZgIhHgrkU3ZrEPGNaKl3PazcIh/ZVcRH/GjHi3MWFhrA1lO5WXJJgL36v
	 csTn7oEnBYFY8a5F+DTORlJRjriVH6/q2GeDX3Rn4R0TInlRzF4oWV1znsxXTSfeMB
	 Vue2emldXXH1A==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-afcb7a16441so364832266b.2;
        Fri, 15 Aug 2025 17:18:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUiF2W5QnsuDjM3z3/pc07vyOGG4QnNO7knO+On2pIvr26rDUL1pgazvr16jlN19fST6lEaPtxqJtfYUMyHAnRONbk=@vger.kernel.org, AJvYcCWqdBUha90fHZpAdAiwALiiizzJaYwk6mzus7VvXQobSQuca0xRdoEtkHLa42SoBxDiHCMdbUvnm2NXSToEJN38Ow5R@vger.kernel.org
X-Gm-Message-State: AOJu0YwF3e7yBH/aE5lYxyTRABKqC2mcUnuCRsBPZ0tcoNI3PbE2dqmV
	SGcSYdSOxQmsyed3BnnwlXN8378Toh7GM8jRUzUemXDSX//W4wCNDJi2bQwbZbkFaQgHPn85vfA
	YOlvbkTxAQzgWTZp0fK1v4iBiVOmkjg==
X-Google-Smtp-Source: AGHT+IE/amCxy+fH2foRpQm6Lm1J6r6bierbnBCNjXitZHojv+Wz+NCKfrPSn+ZGcqfhtRohrT+rqqH3SZs9AYoeJSM=
X-Received: by 2002:a17:907:d78a:b0:af9:8c20:145b with SMTP id
 a640c23a62f3a-afcdc2098famr338807466b.10.1755303519918; Fri, 15 Aug 2025
 17:18:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812165122.313382-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20250812165122.313382-1-niklas.soderlund+renesas@ragnatech.se>
From: Rob Herring <robh@kernel.org>
Date: Fri, 15 Aug 2025 19:18:28 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKjuixHo1q7B1ydD4g3wptYXNmPf+VxbyJeZqgX8COrAQ@mail.gmail.com>
X-Gm-Features: Ac12FXw06fq5jXe_4_G1AQSJuTRVI5iicOUf_yiLKbaBi-NxPHAUCgLafX4HOFo
Message-ID: <CAL_JsqKjuixHo1q7B1ydD4g3wptYXNmPf+VxbyJeZqgX8COrAQ@mail.gmail.com>
Subject: Re: [PATCH v2] checks: Remove check for graph child addresses
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: David Gibson <david@gibson.dropbear.id.au>, Saravana Kannan <saravanak@google.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, devicetree-compiler@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2025 at 11:51=E2=80=AFAM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
>
> The dtc graph_child_address check can't distinguish between bindings
> where there can only be a single endpoint, and cases where there can be
> multiple endpoints.
>
> In cases where the bindings allow for multiple endpoints but only one is
> described false warnings about unnecessary #address-cells/#size-cells
> can be generated, but only if the endpoint described have an address of
> 0 (A), for single endpoints with a non-zero address (B) no warnings are
> generated.
>
> A)
>     ports {
>         #address-cells =3D <1>;
>         #size-cells =3D <0>;
>
>         port@0 {
>             #address-cells =3D <1>;
>             #size-cells =3D <0>;
>
>             sourceA: endpoint@0 {
>                 reg =3D <0>
>             };
>         };
>     };
>
> B)
>     ports {
>         #address-cells =3D <1>;
>         #size-cells =3D <0>;
>
>         port@0 {
>             #address-cells =3D <1>;
>             #size-cells =3D <0>;
>
>             sourceB: endpoint@1 {
>                 reg =3D <1>
>             };
>         };
>     };
>
> Remove the check as it is somewhat redundant now that we can use schemas
> to validate the full node.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> ---
> Changes since v2
> - Rebase after 6.17-rc1 merge window closed.
> ---
>  checks.c | 27 +--------------------------
>  1 file changed, 1 insertion(+), 26 deletions(-)

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

