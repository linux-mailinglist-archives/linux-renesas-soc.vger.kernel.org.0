Return-Path: <linux-renesas-soc+bounces-7956-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9889995860E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Aug 2024 13:50:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C78FB1C2442D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Aug 2024 11:50:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8569918E740;
	Tue, 20 Aug 2024 11:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KCGi1SFi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE2E18EFE8
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Aug 2024 11:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724154624; cv=none; b=Mi73KZjP+hHpQKUp5BkUIYsjORUcY3WxB0Vm15Wu1zr0ggTnCLUjO5JSQeNf6h9EJB1FzZqVm4EhtdoLdKFIPkQFoFoKaPr9uT/boJmv+YkWCNamPqAuXkIKWabBMD1cnJ2Sb5p6uIrVT6Zo5loULGg497kzrw44haA1i6587qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724154624; c=relaxed/simple;
	bh=IcBYd0In6vCgACRZeqarugL/3ETP63zXXDTjjizj93c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PEpYEYtUiwliZeFqbsOVbrryo8RJ6upY6e8tUZJY08mT/kvXDoy4lMiWC9fjfqWq0Pr7Iz141pcZY9rixu0DZ8rYtSP2GOeAdFs0IxXXkN6bzxQ2xOM0NN+YIyACrDEjiuBGbwftFQEy/AyhQNYlySQmC61O1enf3OOymGjLr4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KCGi1SFi; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e11693fbebaso6089728276.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Aug 2024 04:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724154622; x=1724759422; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iriHVArMljQdLri/Yu9Nfjv59wYq9jCnrGoMZhIUOa0=;
        b=KCGi1SFiJ+3w1MLpuIhbz5lmHKZL+HNiVtKiGg4tm/da3N6F+sg10bCogMd88YJomD
         0OtbyAdwUwGWVXciNS7P2P97+MuHHbAFWHWkYskIPtk2Yl0qV2l5bViuBqKxC8QbtfP3
         dArWs5lo6OQ3wL36dDJL57DnPtROUIudoSBwvUoLAI4UmoiKYBNZxFGXsRaZDfvABliT
         +918bA4t/NOaW/GEHno87+yKIwU1kEpIm8OnCpkMIgsnhOp+RFvqCm3gtjiz+TZP1Zm4
         idkoT1Moib1AWWZFCjnUjRFbIjNOoLxHKTqeFTGV/B0AqPjig+h1BaN9YQhoNGzK83HM
         EVdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724154622; x=1724759422;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iriHVArMljQdLri/Yu9Nfjv59wYq9jCnrGoMZhIUOa0=;
        b=BuhzLVSvgxR4CHQ/PuVsN+SubE3HH4GF6KfrwpSxoEFLPOCZcLMqwSXcsfs8Fen9Bm
         sFysagxQm3BZkAcyuxcDbkDp4esC2WPOxafzHeOQmM149en+xAf6l3oKDcymUNlYTh9j
         6XryuAXSWczefG/q90H3p3SH3Q+J8LvcaMaMTvwIoE2IkwhOuspxQUERrVfQ1fJfhvNz
         tXds4w9B0ym0PbtNcukj4B7CDFCOGEI3uwWSBZTmk/tn6CjSVj1ckmy61mhKpd+4tiRv
         z+NwAMu+KcWonG9S50iIs+OQKjOSyl9pBLXXhXA8Lizcuhz0S59HmuKDgmqVi01MjX8W
         Vkfw==
X-Forwarded-Encrypted: i=1; AJvYcCVGu5REynYTc+RhmS9usOzqhGOlSHDKu8VThqs5ptlPuWQqulymntSEzWWaHZZs2UMU33xG+V3/V1MWxqs/KoYE/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwywzKNRokDM2hTgWpGGYsTU41gDrsakEk7Lc+d49mBV3Qs1HMe
	8mTZlWOVZwQWK0gCb2OP2izMTfakC3Mw6Bs5J0Cqi87yxHjCJnZjKrDlCAz4fvvM4iGZY4iW70H
	4z3E4pIfkRCQsQ1v+0bjZfDEA6yPj5Yzw5CAkRw==
X-Google-Smtp-Source: AGHT+IHILDmUK5uFVRkWb7tEwNy3ZYRn0EpoNsn7I5jbZKxJiXulmWZhkFYJDUbPgBs4x/qBekzrkEKkNeDXT0K8pi0=
X-Received: by 2002:a05:6902:2b8b:b0:e03:a227:6476 with SMTP id
 3f1490d57ef6-e1180eb123amr15095660276.17.1724154621761; Tue, 20 Aug 2024
 04:50:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240805211257.61099-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240805211257.61099-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 20 Aug 2024 13:49:46 +0200
Message-ID: <CAPDyKFqdv=Gb=JMDvUD8Cy99B-uyo6gdRwpupmhddb6Fi=7SjQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mmc: renesas,sdhi: Remove duplicate
 compatible and add clock checks
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 5 Aug 2024 at 23:13, Prabhakar <prabhakar.csengg@gmail.com> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Remove the duplicate compatible entry `renesas,sdhi-r9a09g057` and add a
> restriction for clocks and clock-names for the RZ/V2H(P) SoC, which has
> four clocks similar to the RZ/G2L SoC.
>
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Fixes: 32842af74abc ("dt-bindings: mmc: renesas,sdhi: Document RZ/V2H(P) support")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> index 1155b1d79df5..92622d65f12f 100644
> --- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> +++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> @@ -67,7 +67,6 @@ properties:
>                - renesas,sdhi-r9a07g054 # RZ/V2L
>                - renesas,sdhi-r9a08g045 # RZ/G3S
>                - renesas,sdhi-r9a09g011 # RZ/V2M
> -              - renesas,sdhi-r9a09g057 # RZ/V2H(P)
>            - const: renesas,rzg2l-sdhi
>
>    reg:
> @@ -120,7 +119,9 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: renesas,rzg2l-sdhi
> +            enum:
> +              - renesas,sdhi-r9a09g057
> +              - renesas,rzg2l-sdhi
>      then:
>        properties:
>          clocks:
> --
> 2.34.1
>

