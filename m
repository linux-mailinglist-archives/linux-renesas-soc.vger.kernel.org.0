Return-Path: <linux-renesas-soc+bounces-13219-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D8DA38414
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Feb 2025 14:11:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ECB957A2A36
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Feb 2025 13:10:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB07A21B8E1;
	Mon, 17 Feb 2025 13:04:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E314193084;
	Mon, 17 Feb 2025 13:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739797470; cv=none; b=MqcR5g1g1Tjckgb9gnODt2PZZT+9h02t0gXJlrxvaIpYj9ybRs6/h4E2BrBCisjWPuZrdvewhGWeaomPdzyGfj/GmnZpKBeUkU01hdcNMYRB2ndsE7j62ZkGXQ00h2o5AjmvjoweJXLfhuDPTC19aQ3h+KJy8pfxnAmOmof9snI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739797470; c=relaxed/simple;
	bh=ImoCxT3ef00TVwjopMq1kk3VvBm4+wZMZKfvJPiBm/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=shumlsmwYXt4rN3zb5KJ+8reBfkU+ku+QMSrWa4F23+8SnEBJ5Uf/Obbtq7VQvTfy+k824ubuo+pCyMAjKYOPS4B9pMWr+RZUP8NW+cwY8oBrGVgs1kx2HzQnTlR1oLAJDrP47XQyGIPOe3X/FgmW557ywERiyWS9lpEFb5qy9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54524740032so3475293e87.3;
        Mon, 17 Feb 2025 05:04:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739797466; x=1740402266;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IbNZMRDRB5avwVQTUJWOUANTwDCO7FRFfT8F93z4Rus=;
        b=gY9rPXGAsWPXccytr4bx6dGNTMHkMZA0BVTvxEwI7vGCZpLAeK9ircczbJxSHSs7kg
         i/Hn0bxDOeW5x5loXUjgFnSciRkwRk3x7n15SbE7mzX4TopX4tkF7wczJ7kO2HQTlCd6
         xIkBsN/c73iEPgv/o2qYNgcxNjWTn/Y6QWMuRJAyJoIc6gEfXm4GRY5c/VttmN2qhrLg
         FtcbeWpVRrcobCSWnaWeUv9MrpI5A4wY+kqAZachJMAOpVvflDZAoU8zZFzQ40ThSVpR
         MGeDwxlTFXf43i9YjzsBIDjs6zAxpiSjVlwBNjvaND8AjMTkB3MlPGBJ8kHj/NLu+6a3
         2boA==
X-Forwarded-Encrypted: i=1; AJvYcCUXtLqQAniZF5S6DeCCjG0PsTo3tqG6bOBvnaa9KuY6B4pre5G3X85rjn+/nRJS0kA/ofkCrdixgXw2ILb7@vger.kernel.org, AJvYcCWQnJ7HkzoI6qt/khKa2KEOgBrCrjlJwuOgifhZoV8DNen0IbWiOU8B7dc44GlpCrJoe5qRcKIbsERb1Ai6n0s9UUA=@vger.kernel.org, AJvYcCXuFhGEnwQ1ClbcWh2ZdgYFp2nd83xG8uGDsiL1Md8AbdUIs2Yb8ZbSFuRsrOQMbRypJv7xNW6Cmy5y@vger.kernel.org
X-Gm-Message-State: AOJu0YxqFn/UPIGfAOMno51AVvVGiNhlzMpPdWAemABCUkpKNpuFIa3e
	K2c+rwabaTbkOLI9rgpBKK2151R1GmelO8mL5JZKqeZ7CpTDt+iUlIafgFrqaHI=
X-Gm-Gg: ASbGncure8QfVQ8Z8yGqL2/VqjLInUQsnHaVNhUvGDmSYfjjONcqrXHetgp9SbT7n1b
	A+Wv8PmJUvQWjDsAKbYVg4KNllIVqq1vL8T1fmVqw0cGzvi3fcP86rZ0WH39sG5ulSwc8SJdPx/
	bzI125xMUwCAx5dVGD3KJQNM/xmt6glneZg+CYSWbzlJ5nEDNewZbSPuR9N1ZjQQAq348UUkpgD
	GgHKKxPHUNcLyeu/ERrFtpNT2QbrtCNFK4MDT3QvL6PG0A3RDrrfc3TFFxLgfTDsvkYxnh1IYbY
	h6L9gqsou+iG0CbglqISgEO/EEajqGmWSarf7ETBaj+rb4fTLsohJ3yyGA==
X-Google-Smtp-Source: AGHT+IHATyA60twHSITAhUuVK8CkYi74RJzn0DdWzKDtBVl1l/9sN8bB8xazutJhF0wi/KT1fePgXA==
X-Received: by 2002:a05:6512:1194:b0:545:2f94:78d4 with SMTP id 2adb3069b0e04-5452fe2e4b9mr2395141e87.11.1739797465514;
        Mon, 17 Feb 2025 05:04:25 -0800 (PST)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5452f03b72bsm1060882e87.121.2025.02.17.05.04.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 05:04:24 -0800 (PST)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30761be8fa8so46585001fa.2;
        Mon, 17 Feb 2025 05:04:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUS9vBvTPUDrt5tHEpkTyB4sC3nGGLAR/G70ihTam/Xldo9G38mHdTYKapYMQRW5pEuXZnEpEJxktOw@vger.kernel.org, AJvYcCV2Sf0LyFf9000b+xbI/OwHUcYNDSiK0IoMnqkqdvLk5fN+B0MwKpNnO2GVd5y1qdut0LKtzxy3ZMC4wVBh@vger.kernel.org, AJvYcCXGtiome/SvNnmGEf1I+V9sYRnu/RH+edbRoj5xueW40U9oqlhfUpN+vbqhVSmRDIO+O6Lp6bFmIA1duQUKAinvjSY=@vger.kernel.org
X-Received: by 2002:a05:6000:1f87:b0:38d:dea5:4e9a with SMTP id
 ffacd0b85a97d-38f33f34bf3mr9560327f8f.26.1739797446415; Mon, 17 Feb 2025
 05:04:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250217105354.551788-1-thierry.bultel.yh@bp.renesas.com> <20250217105354.551788-2-thierry.bultel.yh@bp.renesas.com>
In-Reply-To: <20250217105354.551788-2-thierry.bultel.yh@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Feb 2025 14:03:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVuyTL1gQdiz64W_-f406GmCgaN3xgNmwTeUUik2dzqtA@mail.gmail.com>
X-Gm-Features: AWEUYZlDYrZsUQS75eHtuBg9kEGfhPOV_cbgGE7g0T55rkPu5tl72irPaSLGDgU
Message-ID: <CAMuHMdVuyTL1gQdiz64W_-f406GmCgaN3xgNmwTeUUik2dzqtA@mail.gmail.com>
Subject: Re: [PATCH v2 01/13] dt-bindings: soc: Add Renesas RZ/T2H (R9A09G077) SoC
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: thierry.bultel@linatsea.fr, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 17 Feb 2025 at 11:54, Thierry Bultel
<thierry.bultel.yh@bp.renesas.com> wrote:
> Add RZ/T2H (R9A09G077), its variants, and the rt2h-evk evaluation board in
> documentation.
>
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>

> --- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> +++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> @@ -535,6 +535,16 @@ properties:
>                - renesas,r9a09g057h44 # RZ/V2HP with Mali-G31 + Mali-C55 support
>            - const: renesas,r9a09g057
>
> +      - description: RZ/T2H (R9A09G077)
> +        items:
> +          - enum:
> +              - renesas,r9a9g077m44-rzt2h-evk # RZ/T2H Evaluation Board

renesas,rzt2h-evk

> +          - enum:
> +              - renesas,r9a09g077 # RZ/T2H with Quad Cortex-A55 + Dual Cortex-R52
> +              - renesas,r9a09g077m04 # RZ/T2H with Single Cortex-A55 + Dual Cortex-R52 - no security
> +              - renesas,r9a09g077m24 # RZ/T2H with Dual Cortex-A55 + Dual Cortex-R52 - no security
> +              - renesas,r9a09g077m44 # RZ/T2H with Quad Cortex-A55 + Dual Cortex-R52 - no security
> +
>  additionalProperties: true

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

