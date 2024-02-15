Return-Path: <linux-renesas-soc+bounces-2858-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 11005856A48
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Feb 2024 17:58:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B26C91F2214C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Feb 2024 16:58:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA2FD1386B5;
	Thu, 15 Feb 2024 16:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MXWLoHsU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E631386A2
	for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Feb 2024 16:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708016138; cv=none; b=jiyNSv7TSLN0JFR/B6dT/kSPD3NxXc+yyFffVTh2diQbCUygtqiphIZ06TYBo2l18Aibs7H1PqolS98XhMbUToPLd+Gd7H8IV4e/Fa4f/dDIqtLOqmCKwIU7wzflpaYnq858Q/6g0aSvp6Tt1JdFoDdPFZwhbSBoef/S7sKiQos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708016138; c=relaxed/simple;
	bh=T2n/4szixuLGXvgOOUzbiM5pm5IPW+9TOhwcsXEbR5I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LM/cQOyUGNiWSPj9AeW+r6yKzo4n0cwyoqPKb3UZxw/HhLk/l6IhOxcvkqDPFWTK6iI5tCxQJo+8qKCmj5rQFdz1HenfgGYOFdaNQSVPLzFsSmdu42QOeFW0ib+xS+1z3XJtErHqHD+imw05tm78jKccFIGNbZQzsuTtAyhQtM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MXWLoHsU; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-607a84acf6aso10421277b3.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Feb 2024 08:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708016136; x=1708620936; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=poZheT8LMONbwbXG36LCp2KJuCiXKMOv0XD+rp8kofA=;
        b=MXWLoHsUzbZOipRQqvHODtlCF2KUMWTOjeTYURysSEaWzYRYRDbzyyOx0XpTK7Y3b1
         Eoq0/p3KIzN18HWNHmmei1JxOSN6HZys3TifDBabMcRFzHjP8aVjSSbAwjtvrDB8qoxB
         RlQDxOC3AXySlH+bLX3Q+TCd6UzndUGgHLfJ1x+TMU04idm+Wc4S0kEj0Xm93CLDv7mz
         kXMmZUbXBzGGro7KtGgMcuQIhV+C04j2OzGdNQagzjLA5Xe5k4rQMPlQtf7EC2NXVm3J
         y+Okcsj5kYQZVR8QkpVn2QIsldDajLWpnzoUuCdg4dG4zWMPUAwrHi+2LSSnLly4ubIP
         Ztiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708016136; x=1708620936;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=poZheT8LMONbwbXG36LCp2KJuCiXKMOv0XD+rp8kofA=;
        b=tanC+qwXWNToXOOo56LQz6KK2YCKpeQoraAISW1Xh7yG5ewo9BHhEB4lc6HCwXbUWr
         ky85xUNYxdN0I8b5wiIFnZIECX9CFIMUJEobpGLmhQrtV4JbYyRU9YySYTKXp5amX3o0
         6KzwukZBEtPqx/y87crTf75VpHkyG2pU1z1+X8aNPqcYgdBeOvD5JZC/rU3zZddYEoEd
         mRGEFaTY+IHOqtiDtyii7DRthn8xLUFeTYANbrKBzkUZdUIi04aiOSPm81FfY4uHoBCT
         HuQwgY8DGfMXfxxa7WKeQdbNpyBkb9I8NS6wFSy7GALb1zwXVcOf3Nl8x5wF1XWef39h
         CClA==
X-Forwarded-Encrypted: i=1; AJvYcCUU31L+Kz6laT5FlxJsjhis3ybo/h0TM9xYaJ+LQpR9m1bqWo5M47FJdoF5BS07RjYsg+SQLKnvc2c6yiRcuXPhZK0hRFpCmlp/E4ShmQJNAHU=
X-Gm-Message-State: AOJu0YzZCqiBzZKwKYyC3X771xyFM9MF0Z52cGBQnayAAAtK8VZb3M+2
	ytiY/fqZKixLu15MpcowtJth+l5lXpXf45+5x0WG2c5dQwkDYPz+coC722lHPAPLQw2Al5GzCun
	PMcFQaFEo+bM3uuBkws2aqkNEhJPPv78zB8R9Tg==
X-Google-Smtp-Source: AGHT+IEpJGNu8IMFSpuSTsiV8rNUurQsbhlaADMNqmbysfbAkAFNijtgAVbyd6vcEq1kI+aXaqyzELrondiqZuik5WE=
X-Received: by 2002:a81:7c55:0:b0:604:9322:9d56 with SMTP id
 x82-20020a817c55000000b0060493229d56mr2291098ywc.38.1708016136169; Thu, 15
 Feb 2024 08:55:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <fffc5a0a73c4cc8e8d7c5d93679531cc24e006ca.1707915511.git.geert+renesas@glider.be>
In-Reply-To: <fffc5a0a73c4cc8e8d7c5d93679531cc24e006ca.1707915511.git.geert+renesas@glider.be>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 15 Feb 2024 17:55:00 +0100
Message-ID: <CAPDyKFotPHiAWux8mhjFPMG7kwqaq6u-YZ957-6_=gKnVkDh6Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mmc: renesas,sdhi: Document R-Car V4M support
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Feb 2024 at 14:00, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Document support for the SD Card/MMC Interface in the Renesas R-Car V4M
> (R8A779H0) SoC.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> index f7a4c6bc70f6cade..29f2400247ebc674 100644
> --- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> +++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> @@ -67,6 +67,7 @@ properties:
>                - renesas,sdhi-r8a779a0  # R-Car V3U
>                - renesas,sdhi-r8a779f0  # R-Car S4-8
>                - renesas,sdhi-r8a779g0  # R-Car V4H
> +              - renesas,sdhi-r8a779h0  # R-Car V4M
>            - const: renesas,rcar-gen4-sdhi # R-Car Gen4
>
>    reg:
> --
> 2.34.1
>

