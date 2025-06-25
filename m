Return-Path: <linux-renesas-soc+bounces-18697-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B8CAE7ABB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jun 2025 10:48:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A2098166EDB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jun 2025 08:48:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E83F228980E;
	Wed, 25 Jun 2025 08:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dV5HAFvz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8E5285CBC;
	Wed, 25 Jun 2025 08:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750841228; cv=none; b=qLVrF7CJThM3QgUrFUSHzSG3EdmRxS88XV0d+N3fSGTFIL11TUbkAvmuadFLkUjZtSPZ3+i2CejhF960lNlY3/KMTY+LMO9NmOU31cCHP7md/VKcyV01nudNZ+M5TypKcIYjWEP38lU8i+huKfeztWP435BrRrEvOxKA+WWBldI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750841228; c=relaxed/simple;
	bh=lDA2+D4K8jLzcqWHyNUWKnoO1uZ3+NKKkE0bfDP7PF0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W4KQkud+D03U+3UEgho4O2IwSevxZbg1E4aWVeRAgAaRinB6gq9+ll5UbGERtkSTf9ZSd54u536KBq6bmpZ6EbUVFJbKHphdQ5y2u7/E2konx9kNyIJF8XxOuVIrEbXnHDOx2nlaobhoTYuABCymrO8UL6BTutv4wq1nCWxGxpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dV5HAFvz; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a6e8b1fa37so1553127f8f.2;
        Wed, 25 Jun 2025 01:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750841225; x=1751446025; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aiq9kMFH9F7vJnvGPd+O1hgKLbEQsqIi3Mrcnkf+nZA=;
        b=dV5HAFvzM3RVLrldFx0l5VSQ9tjlkD3iHut57qObmqtkKtd4OLMsaixknnDVTew9Ai
         90QuWgLIpRcB7ANPHYf1aYd5K3NnnviNKOjoNH/xpvA3Bubi1mnsCKkPGu1OmZM43PnF
         tkQcjhboIi4MCnipz3+5NPCBIAs/M5+TxL2dVpov7gVD39GWcVuU1uBDuUSZboMXKKjZ
         gUvhJZR3z3AqgMjoFsRHSGEfcSbB+hXGH6mIgMhb1Pntue0KkOy2xo47KCLtk0m3i4fx
         05XMCtiGVVmjwmhpzxl3iODeb7dwqUzz6K4L0xCPSYCFObuFc7qP7ITJ494KI4tZc31S
         UhJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750841225; x=1751446025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aiq9kMFH9F7vJnvGPd+O1hgKLbEQsqIi3Mrcnkf+nZA=;
        b=M8CCMpQMSyYtz3SYo4kT1FPvF6uApx9g5Xn8C0TmxSjDzmWlKyDlat6Yz6ZskeFYwK
         mvkp0gqWGmsfF2jv6/3jFuuzcYnW5feCPIC3MgxngQrlnbLMszmFwoLv2HPHwX5ijuKw
         vsPgQOBUbMRjw8dLVVim8mWN4EvqSIRy2750MbXFoYo84caGEqCcl0mXabPRGxfsq2FL
         LgIwFshLPTCCBBfDeCimjV5u+D99YLzJrv4HmM9IzVF0Pyl8UVyrOxmOBeYcu04I29GM
         k6itXdyMGJY1NiW6/R2URwHIh87B2VgSpL75obFlcFe5rsBK66IyKO63l3hlTPwjbtci
         RLrg==
X-Forwarded-Encrypted: i=1; AJvYcCU/6tlNdLh9Ts8IB2KdzePYYOFAOzVVG/4LqvRNY+ZYCDf0J969cD45d3mGMKUazwNxCrDnl1vJIeKo@vger.kernel.org, AJvYcCWTV1QhZWOiDkUTA9xQVIpDgjrRH9jcPaYXCGLxTWklUHKpBoNxykQiA9yhlwhXIBsF4AfQijVjFtSlM9LmNv++Ad4=@vger.kernel.org, AJvYcCWjSGk6bcuXPAurq55CXDIDlOioF7mkP37Z2BH1bNLZ9U6R7i34CDW1+MNJWgFydpiXUsbhSBy1@vger.kernel.org
X-Gm-Message-State: AOJu0YyfnEfzeI24XWE7E00BYyQ6izW6iXolClknZKIY01zPMTRoGEbF
	uIy1axr2H73CrvCxhDZMioXJQcEiR9kqNwQCJ3bBmM++zf2mrm4a6rlFA2PtQDaznpXIAAYsCne
	RkBJa+SrhJoBeqMkKpDgUbR3k6n0RRKc=
X-Gm-Gg: ASbGncuiTY57QAUllPlJWOOq/H8huvF6DSjvmqhGdgV0Xdhnu3Sd5fsqwZRIMapq+SM
	lQwKuGTtwtQsiXZNRgQihcgu6xO55nqPPAoqRRPSwotcbM/e9KouW4hjiCtVjGbmDbX5yIg3VCI
	9Q2Kg+aMQZvN+A20b46OPKZgelYr4LpvlMhCkpZRbsXhgdQg==
X-Google-Smtp-Source: AGHT+IFChcgu3Oo7mLs5bbOfibDzsRiAxGriJGS52bXullFp8cPPdshfQTKjsMrNP8w1Na4ld5d5MyRAGXEBmCASjVQ=
X-Received: by 2002:a05:6000:26d2:b0:3a5:2cf3:d6ab with SMTP id
 ffacd0b85a97d-3a6ed6464d7mr1623447f8f.39.1750841225180; Wed, 25 Jun 2025
 01:47:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <721f6e0e09777e0842ecaca4578bc50c953d2428.1750838954.git.geert+renesas@glider.be>
In-Reply-To: <721f6e0e09777e0842ecaca4578bc50c953d2428.1750838954.git.geert+renesas@glider.be>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 25 Jun 2025 09:46:36 +0100
X-Gm-Features: Ac12FXwGDD0wK9R16XQVBpAwEzQWjUk-oPFNtpG5nL9WzdpZiuFF_pkYBSIMwKI
Message-ID: <CA+V-a8sj0cVc2y6HbQjfPWxH9GRaDootusg+NARQdOv1DKxV1g@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: net: Rename renesas,r9a09g057-gbeth.yaml
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2025 at 9:11=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> The DT bindings file "renesas,r9a09g057-gbeth.yaml" applies to a whole
> family of SoCs, and uses "renesas,rzv2h-gbeth" as a fallback compatible
> value.  Hence rename it to the more generic "renesas,rzv2h-gbeth.yaml".
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../{renesas,r9a09g057-gbeth.yaml =3D> renesas,rzv2h-gbeth.yaml}  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename Documentation/devicetree/bindings/net/{renesas,r9a09g057-gbeth.ya=
ml =3D> renesas,rzv2h-gbeth.yaml} (98%)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/Documentation/devicetree/bindings/net/renesas,r9a09g057-gbet=
h.yaml b/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
> similarity index 98%
> rename from Documentation/devicetree/bindings/net/renesas,r9a09g057-gbeth=
.yaml
> rename to Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
> index 9961253d1d411bd0..23e39bcea96b31db 100644
> --- a/Documentation/devicetree/bindings/net/renesas,r9a09g057-gbeth.yaml
> +++ b/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>  %YAML 1.2
>  ---
> -$id: http://devicetree.org/schemas/net/renesas,r9a09g057-gbeth.yaml#
> +$id: http://devicetree.org/schemas/net/renesas,rzv2h-gbeth.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>
>  title: GBETH glue layer for Renesas RZ/V2H(P) (and similar SoCs)
> --
> 2.43.0
>
>

