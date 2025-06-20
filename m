Return-Path: <linux-renesas-soc+bounces-18577-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA8FAE167B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Jun 2025 10:42:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF70B17B2AE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Jun 2025 08:41:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BF35236442;
	Fri, 20 Jun 2025 08:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GI5vBH6a"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9244E218EBF;
	Fri, 20 Jun 2025 08:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750408660; cv=none; b=PerLl/JPjZJd925DkNes1GTjsKf5mTWOwrU88VRIwShinSObAt1FwW+NceLqxOCltAtBMaV2CUuOH1ojmJoJHp8SB6D6oh14O4blJB6lKdv0LQ5IkZonuBFmEoxiBhI39PNnrRHr/gJntpOni0GESDazzzwItulwxlp76nlDbYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750408660; c=relaxed/simple;
	bh=B98CFS4nw8P44kWvPzhcglPGCieASk0aylbTF3UEGJc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hlhMfaa3GgHjio0x/sDqzgxKienotDXUL9rwxmT5x/XGRmbJRF1y++Hyyi5xKWBV1w3gaFoNUQe1IAw038qeYVT/Yh6CIRuizVxeUXdFYgl+sT1G8zhe0G00fWdvjuYAxsQZyW40wxBuB8RzDO/h/4ukS/DNyHpqT0sJ9+m/9vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GI5vBH6a; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-453608ed113so14897065e9.0;
        Fri, 20 Jun 2025 01:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750408657; x=1751013457; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tkZMdMJtiCI1godzM9JRbQDVZvxgUYM0ZUn00XDblK4=;
        b=GI5vBH6aO3WEeIV5ey9oAv1XSrHRsKuwi+rrDD+BKYCxhqkivu/ajq+nJEg3fffNY8
         +7thQOhSkvK//lR6CyY629mZOqnwQao5VFLrmYPoGOXm6HZRudfXgb5qrPLi6naCgLw8
         R2O/X3BVf5olf9jvNtWmuxYWD3x+yWr3v+TnHrzVqQ6zH4xtZ7s5DVt3ecuoEtKCZsC2
         K2sYih5M62vFKOwbhso+zDiHm+2I6jOrUormQme1BS13yXeRCPk9DLCwgjo4zPKWxMwr
         OmpqmIWkR2k7LRSY+a61kei5t2qn4HFpnoVpPK9+o5mmxYbclqSv+TD/RLtLhVBP9Jhq
         JCaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750408657; x=1751013457;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tkZMdMJtiCI1godzM9JRbQDVZvxgUYM0ZUn00XDblK4=;
        b=jWVIPESEuSHGC+OhqrYyHXOWcdnOXL3qPierSRqGdXTt3yMSU5F1lhP+wC+N8KU8YN
         0e91AWj+U08NHBiZQFRO01Ahf2QdkEW0QzYKgqZ/qb4YojrYRD9gZpKL+IxvwYuu4O3H
         B6iOpvFLfVmsQUzF/HRhKqOwm4W29i7OkBvDVG308RZiPuV7n+mMATD+OkHOQEu8q0Mm
         kMP/IR5zxtLpOebRGHPqjiByN619hn6y7s37fWSLGNJHL7G3hCHt9AiNU/Ove2AA0AAZ
         Gm3vz70S2pWDnuAsVocQPuMVaBdEwm/6mB8LKWDuneg12Wb64wGAGSFDGD25S0dkZvaV
         1AsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAtv98rjzD0JtKjsYcZlSgDSKw1IqeOOHLTUYqb1uagKZj8S2E8FaTtL8ykwwmMqXwGSJ7AyAqXFTh@vger.kernel.org, AJvYcCXWkqsKFs6v1/IF8nqmLChNMutnv+pPF3hXDsz+i9fP8XQZL9o7Szt5wMXWTuLGXCfBVDPeUyBvu7iO87O6jesuWbM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzzjz3kKuBYOkr13kVjUFPCwdNVIrNVXFLtjlgI9e+Fm4TtJTW2
	p4i6aLijhj1vfg9plDOk43PfCgKgAdfDfjzxso28h1uJGFPgex/Q1bW/umPE/6+ohzxRtYgO0E4
	Usxl5KfWJDvVeu1hEcOGaWwrB1hokGBo=
X-Gm-Gg: ASbGncvePz9xYki6yj0M/fIm/zpHsXSHeFwf44ZglSlJlc5OPpK/VmdNC4Acuo+HMkt
	9UVh44nswruk7yJ7mAq16JM8gsXoA/4c82jEa0N6+bAJ2pDSzCOLRaZQ8iEixo9W5dpL8XRJRFU
	IYn0oWP3qQpJaVuziccXA4bNYcxFZNEnKtFyS7QD6KPwkPEQ==
X-Google-Smtp-Source: AGHT+IH91L09rKl1WvHHN6miWU42yNno2KuBsV5zEbCXDsnr6stucdm+5+kVbuTet4qP0eO2vIMK3isuHSCFs9idYtY=
X-Received: by 2002:a05:600c:4fc5:b0:453:2066:4a26 with SMTP id
 5b1f17b1804b1-453659ee9famr16883665e9.16.1750408656499; Fri, 20 Jun 2025
 01:37:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0703ecbc355164e35b90a9fe088438c821f13cd3.1749741263.git.geert+renesas@glider.be>
In-Reply-To: <0703ecbc355164e35b90a9fe088438c821f13cd3.1749741263.git.geert+renesas@glider.be>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 20 Jun 2025 09:37:08 +0100
X-Gm-Features: Ac12FXwoHC5okYTQfQ1hd3pLbVxnrfdeiudtMlvvUAqtZogtU5CVCeKmChDP3KY
Message-ID: <CA+V-a8ticxRyDrtAMOLjULWhU-iXNhgQNEYx0JQvc0qKHRSf+A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: soc: renesas: Document RZ/T2H Evaluation
 Board part number
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 4:39=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be queued in renesas-devel for v6.17.
>
>  Documentation/devicetree/bindings/soc/renesas/renesas.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml b=
/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> index aac7af605de24f99..c25f12642061b6eb 100644
> --- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> +++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> @@ -595,7 +595,7 @@ properties:
>        - description: RZ/T2H (R9A09G077)
>          items:
>            - enum:
> -              - renesas,rzt2h-evk # RZ/T2H Evaluation Board
> +              - renesas,rzt2h-evk # RZ/T2H Evaluation Board (RTK9RZT2H0S=
00000BJ)
>            - enum:
>                - renesas,r9a09g077m04 # RZ/T2H with Single Cortex-A55 + D=
ual Cortex-R52 - no security
>                - renesas,r9a09g077m24 # RZ/T2H with Dual Cortex-A55 + Dua=
l Cortex-R52 - no security
> --
> 2.43.0
>
>

