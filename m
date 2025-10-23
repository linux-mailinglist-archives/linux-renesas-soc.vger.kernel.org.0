Return-Path: <linux-renesas-soc+bounces-23503-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA2AC01427
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 15:07:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DEADE4E70A1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 13:07:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1727314A90;
	Thu, 23 Oct 2025 13:07:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C85313544
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 13:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761224845; cv=none; b=SGLlJbNYcwcX2WkRygoz6gVGxQBSKrBlU7YBWzDlFIlOTQvb5/pXA2uh94D+agCADZC3CFRLgch9zRXdrZJbc0/8LT4VrXxPxn7V+aqoGxXHWaYB6kn3ZQ6N8DRf4I1MlujXHBZQAjJGZEDWFHR5xnLWj4FtEeMGwro86bGij5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761224845; c=relaxed/simple;
	bh=1g9sL1pNrDVYwOAiQV7CDpxqC258lm15lCus2uSGOV0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o+6L+wUYn8U6AvXPr8SsgnJddpz41S7qwnGdyD5S/TgK2yU0vUJ0Y2O5rVa026TNKZg5QAoWTAMmSVn1WakX8awZfgMjMD5D5M+q1jtKXJMlUkPdSCTtGLPo+dBrQoZ3SjoU3xefZcP5/ey3Hv2TTdZapMivBL7snpg8C/RxVtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-54aa4b86b09so370495e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 06:07:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761224843; x=1761829643;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lIIdZrvjerU9TUToExl2D/WzzHrGb42zkKRg3dbolEQ=;
        b=gbxCmZyExKYW58Eg4Kvbko6Zl1lXrVsp3UhsfJrohR65KxAViY7p7mqWDwgcqGHxoE
         3Ng/ZzY2b+fCC0y7gMXnEMkTjf1rKJd/OM9BbeXaiSmKZEcnN3dM0GRfzmMyYUTp9uZ1
         5QfOGny6N+bdDvRPRlvZZJjx5OiQ4Mf7zWDiuo1KOTrCch/XCmqOLq96ZC3HCaEhzM20
         +0bsseHRz+DfLW40j97bBWRvi/EpVEehE9StLp4PWghGtldSgLbfea/ImqmR06ADse1Y
         DnUiiWb1jz/L8F6cyvGhgic9XoUCJ8dMjmFeefofos172sV2spT3WSynd5pvcQtwdeKF
         HzLw==
X-Forwarded-Encrypted: i=1; AJvYcCXnyAC/Hqlh/uRorz32Bvt0o5dJQWHi9l4mmZhXWj1P4Sng+6odOWbf8RWwVJZ2gLT+WFivOLot3gtLl8dOHUFcIA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNbgsMwi/FewOdhb2vmMn+SvYWDT1lWfU62vXUU1ZyzI3cv4A9
	a+Tqutlv9lYBjlo4lkPjXdeXg5/A53PB3UBYCVmI4shf+Of9XUF3VKYIXXfBvOml
X-Gm-Gg: ASbGncsrVF8hLRshiTnR+tvtOj9eAajk6l4viEOXj4q/O1WGPSuaOi/R4670VycMero
	8LdHlIhh4Bjzi+YKvlbLSNunc/bu1g3q/CaHeMt5rRySOLl8FSJ2rFFOtgVFmtrYGeVQ240rQAJ
	MkboqoSquK45Kz0jUTsZNirPPgzKe0TxFDGeh/itu673Te1pSbALUBNGHxg0Ww6e5Z7eyWg0Pw5
	H3hSEth/bPRh+j+GonL6vwcIF32RlsQ0doEH5u/T0ZkuYSNA/EO76/wUmFzC9sHy62prO3jbmc5
	4E7TeB18cEwFjfvH1oBe/7hmGWGSGTq9CZ6dLhB4/tQuXPakkbZuRd19iMsuGoHo5LuoJsqLYNY
	wD1b5PntENhcgMBnFiBQGzmWH9x/t4AqBZ6jzOTloDhHREeyZ+8pgmMWKoNFoZWnjL4v2kwoV1s
	SeqN44HRw66fZoRWFnSKFAF+vwLSbisbVj1vOYsJIonEg4svcO
X-Google-Smtp-Source: AGHT+IGeAw0Evlsl29uMjWxP6HiLj1Ge2ub1r+guWXX3MNDE3WVyZyakG+8qpZOZnKrEzg0ILHA4cg==
X-Received: by 2002:a05:6122:3183:b0:54a:87d3:2f09 with SMTP id 71dfb90a1353d-5564ed88757mr7982599e0c.2.1761224842679;
        Thu, 23 Oct 2025 06:07:22 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-557bd8bd3f7sm718836e0c.6.2025.10.23.06.07.20
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 06:07:20 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5db37a935f1so120986137.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 06:07:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXEINaClnPeeKGbyiRytw08zfXS5G2lf/3O6zQwGccIUXIAadF9TLPFlTi+iehnRvpoA9SmTUA5cOX8wS9UKvQJrw==@vger.kernel.org
X-Received: by 2002:a05:6102:304a:b0:5d6:18cc:6087 with SMTP id
 ada2fe7eead31-5d7dd6d67e3mr6298079137.30.1761224839798; Thu, 23 Oct 2025
 06:07:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251023123644.8730-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251023123644.8730-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Oct 2025 15:07:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXq=4zb421MnwFvhFT_0K0HM=-LhWKueCHnfaEcGEgSLw@mail.gmail.com>
X-Gm-Features: AWmQ_bk40KChNfSwzFv_aBWco4C4_I0K0e8reqSSxWUwprZ1XtIdssKPgaWL4cw
Message-ID: <CAMuHMdXq=4zb421MnwFvhFT_0K0HM=-LhWKueCHnfaEcGEgSLw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: firmware: arm,scmi: Document
 arm,poll-transport property
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: arm-scmi@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Thu, 23 Oct 2025 at 14:37, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Document new property arm,poll-transport, which sets all SCMI operation into
> poll mode. This is meant to work around uncooperative SCP implementations,
> which do not generate completion interrupts. This applies primarily on mbox
> based implementations, but does also cover SMC and VirtIO ones.
>
> With this property set, such implementations which do not generate interrupts
> can be interacted with, until they are fixed to generate interrupts properly.
>
> Note that, because the original base protocol exchange also requires some
> sort of completion mechanism, it is not possible to query SCMI itself for
> this property and it must be described in DT. While this does look a bit
> like policy, the SCMI provider is part of the hardware, hence DT.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> +++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> @@ -146,6 +146,13 @@ properties:
>        this platform. If set, the value should be non-zero.
>      minimum: 1
>
> +  arm,poll-transport:
> +    type: boolean
> +    description:
> +      An optional property which unconditionally forces polling in all transports.
> +      This is mainly mean to work around uncooperative SCP, which does not generate

meant

> +      completion interrupts.
> +
>    arm,smc-id:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description:

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

