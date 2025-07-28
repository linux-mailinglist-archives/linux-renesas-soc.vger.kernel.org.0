Return-Path: <linux-renesas-soc+bounces-19721-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CACF2B142FF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Jul 2025 22:28:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B1A827AF3AB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Jul 2025 20:27:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7747E279DB0;
	Mon, 28 Jul 2025 20:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MkR8mSwi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B148D248F70;
	Mon, 28 Jul 2025 20:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753734490; cv=none; b=Ecm+UHxS2ZnTFoEN7NYYvjHDKzg2HfPP5eoLEEubuKe+LXttXa8h5IFmGP1R4lUuHl7cjDlpTX5Am1lB3xgg+VaOuTKnsANXo38W4MHZL/czYpG2Fp1kctRSKZCUSRsfukeOjGMbbj14bH0U9XTZGlFGDDPtdvmJ6G8EF3DYtNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753734490; c=relaxed/simple;
	bh=3p7uNtOcYKX9AeLZxdOrba2Sw841/DoiWzWyyL7dQNI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NUoQhnI55TUeuqhsWDVByi7JqZp1I/IB7k4uqHeUla8hBo0s8Y1tDRCYPc+oP9nsGbdKp89ADOaJHovy5M857+/tOCvYdRzdRS9Mpo9aPi3ESS1yNlUAOBIy6hzSC5WASFyH1v2NRN3TxuSRHnDuSq9EecMbJRAYuPClQ7xZIA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MkR8mSwi; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3b7892609a5so753759f8f.1;
        Mon, 28 Jul 2025 13:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753734487; x=1754339287; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3p7uNtOcYKX9AeLZxdOrba2Sw841/DoiWzWyyL7dQNI=;
        b=MkR8mSwic7uFuolVwEdh9l5Z3Ke+RWCX7955C/6qvGY5Mc/Gy0jetIBFxuhU62O3Is
         ArVljuBkbyP7QNfRgCZZq913DqSowaT63U9ZgVmf+0IRux86VWfuZOY6GY3egjUNpSzU
         eDS22/dwFcelKch4FyS5vqKU9YLsXq8JFcvuPSyrwsx650ZmlKf4YImUbXzgqq40I3WC
         4byEFAFy9CcBmJo3AuDWvS9rO0GBWKpGUpklMMhRmd7syEbwbAg1UJmInqvvchSG99Z+
         hUvqCTizAj7l+l0o95g17mEWGFF8nIWQjRIReLefNKG8894Qz84r4kcf3YHHAKtvBJwu
         qDbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753734487; x=1754339287;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3p7uNtOcYKX9AeLZxdOrba2Sw841/DoiWzWyyL7dQNI=;
        b=uwc8kHUlpwSqvlr2dxxGr0TVfnA5IkvZpSuEnDa+OY1GGua3p/nHcadeyJkiTy0u9E
         YMOtHpencEyex3sDLspMfXQklfAjeo+Uzx2zHrtwpU0weV4xybTNTUFJ8dG6zzfT5x+D
         mHMgYXlAB5kvKLLZLglOJ1ITyAgFfozkwNwHPhm9/a9jjeR5YXxsSqLBxm5taOCYtQJa
         aq7m3laL8xeCK94spEKRyQoiuWGXIRurEupRI1V7TbIVXe6c/+yAWZz6ENxUhC4yxDHK
         XGz24lLNMSw0B4CbdNHcKvT1V3twMhgw+oJ51I4H9KFPzRpG20cX6XioGTbJYM0zHtF8
         lG+A==
X-Forwarded-Encrypted: i=1; AJvYcCUZLrRDKoT5NPLmPpMB56LzXFebfKedY2/adVZfNMFHdSf7ppfKYg5hayqqEVu1ARvaPzTjMlzSmZmujVqLgWPrl7U=@vger.kernel.org, AJvYcCWYVESHsbh0U1KA0B4RNQoJ0If2hqskQn5L7mfB+tkX+KoW98PNGa6YXoYqrdIDQ47cwsua/5z6C8AY@vger.kernel.org, AJvYcCX5L9FiEXNm+7+Nf105pqChdaK7mEj2/5Yw3fTzZxnCFw/t2niSCk6mK/Bcn5Fik0NaNsKHQEbAgyBDE7od@vger.kernel.org, AJvYcCXyzMLdeQM0gs6ZFYw71dLhiuhbbsY455iSk5Pvav9IUIyHIYiC4njWHtC/nn/Z7hq+CIdQfEWz0lh1@vger.kernel.org
X-Gm-Message-State: AOJu0YxFG9Wgx4pbUB8/J28f3f1ZJaRMxGD/RQyuh//XCGcd8n+7mqkD
	eHkcYnw2GLIPBwAntXM7jnBOX7kGbgCsVTteWTkFB81S/zkpoewMrBpn/qlInEEFWjiTiQJMNTq
	zgLZ+l5Q0NDQTEPcyx/83hUUIW+a7uXU=
X-Gm-Gg: ASbGncubfpli44DelKc55wahuGrhq2or8Z9UJIthcQeW3HdC5cOrXdu4YEK48/exrKJ
	HOU0o+fNf3/QxCZ2lwt64AbToinHtq7fewHg3zqQXwiHaMXXLvQMWT5I9V3sYqjDwOhAHPrxPTH
	tIDMC7gXDGEhTuS/ab/hSdbkQA3yqCueir3IJZ78IZ9Ikt+LmfF0xrFAGNNs9fSYMzaRhL0bAMn
	d3+0g9V
X-Google-Smtp-Source: AGHT+IG+tkX084ob9BPVH1wtp96BCaHvXOaWH/vJW6Hx67Y885Vfn0RXp7T9tAucn/9SDqLbh3dP5wGLiKEFiQ7iBaQ=
X-Received: by 2002:a5d:588e:0:b0:3a4:d9fa:f1ed with SMTP id
 ffacd0b85a97d-3b776728f9dmr8247114f8f.13.1753734486875; Mon, 28 Jul 2025
 13:28:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250728201435.3505594-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250728201435.3505594-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250728201435.3505594-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 28 Jul 2025 21:27:39 +0100
X-Gm-Features: Ac12FXzC9Bz7YbuCg4MGPdK7g0FCBbcgsYDYVglx3jjRJspjbkFCpGAuDcBuHBM
Message-ID: <CA+V-a8ujMaFFOv8Jd-5=fKHUEfVji1Xt5y_h4uwtR96TBz4VNA@mail.gmail.com>
Subject: Re: [PATCH v7 4/6] dt-bindings: display: bridge: renesas,dsi:
 Document RZ/V2H(P) and RZ/V2N
To: Geert Uytterhoeven <geert+renesas@glider.be>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi All,

On Mon, Jul 28, 2025 at 9:14=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add the compatible string "renesas,r9a09g057-mipi-dsi" for the Renesas
> RZ/V2H(P) (R9A09G057) SoC. While the MIPI DSI LINK registers are shared
> with the RZ/G2L SoC, the D-PHY register layout differs. Additionally, the
> RZ/V2H(P) uses only two resets compared to three on RZ/G2L, and requires
> five clocks instead of six.
>
> To reflect these hardware differences, update the binding schema to
> support the reduced clock and reset requirements for RZ/V2H(P).
>
> Since the RZ/V2N (R9A09G056) SoC integrates an identical DSI IP to
> RZ/V2H(P), the same "renesas,r9a09g057-mipi-dsi" compatible string is
> reused for RZ/V2N.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v6->v7:
> - Renamed pllclk to pllrefclk
> - Preserved the reviewed by tag from Geert and Krzysztof
>
- Included support for RZ/V2N in the same patch
- Updated commit description.

I missed mentioning the above.

Cheers,
Prabhakar

