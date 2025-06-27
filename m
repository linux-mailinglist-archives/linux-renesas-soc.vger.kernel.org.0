Return-Path: <linux-renesas-soc+bounces-18846-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F691AEBA1A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 16:42:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 797391C466DA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 14:42:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A8632E7177;
	Fri, 27 Jun 2025 14:42:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59192E3B01;
	Fri, 27 Jun 2025 14:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751035332; cv=none; b=L8uLjTBtOs5xHnes3jFf24JSbRiQ8Yi2s6ltiLdtB+Eijw2FiRpLl/uDc2+kFrr4cv92KGJHRFJiG1YXmPpWl0mLScs6V/cMZByUxMOOs0blBD9KvvDWqJxAYjzD6M5zckekhKK2IXoTSLi9ggGXSWzgyqynZfCPSF1D8xVfLqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751035332; c=relaxed/simple;
	bh=e3BHHBVZlq/S67/tR0+2qQvPKQqHZzH10SKFYIUWKGY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U6hXpoTUWr1JscjPyNa8B8tTZ3T7iSqd3jwvaj9fy2UsHFMEoyXOg8vDxU57vG9sDCBPFYqRSgygU3ml1OwC6ytmlarH8MLJ7JOcwDbbRr+B4hwqqe9JDpQDYiYci1eciWg0MA3eco9m+8LcjbcyHNyS4HTuMASGeXg6hnF9vK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-531acaddd5eso561105e0c.2;
        Fri, 27 Jun 2025 07:42:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751035328; x=1751640128;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3aBTCInNVurYWF8TPzTAt3dAlN0/OaNFB23Z5/H8BJU=;
        b=m2V1ArQr+6sZCycEDa52iB3cZhYLdon4SQLmgWa/viAbdJ2Nb1yErBuHOVpeqj/7DV
         gkR5+W6kHWlLFMRZuX0Ucr4PE4GtwXOsHDA9gX3Wh1wlBJHlX9Ki6xrIGvroLr2kOvhC
         VXaZtksaRNWqr3o8qs3UV6vcjnyxIZZ9WdacOuG4Paycs44dmZnyKLKhG6O3/p2IC9xb
         dlHTDnngxJmdfHhN06vkO0stPiK4DItXdrjOSHaI/4jboMqz2c407MViGfaP+56ZLQOg
         MSWhH2BRCvOPy4Tx8OsvMTAYym+ReoDFLVsOcoPUZfGAw7odl7//nnGbpopkKJaMkQpJ
         HBcg==
X-Forwarded-Encrypted: i=1; AJvYcCU6BGXlExMFNQro5bBVp6VgzcHEL0K/iCos12SKkoLylr1tH6WnNMR5hEum7y7jsywskcYtGDDKEi2RSXdLCEs=@vger.kernel.org, AJvYcCVl6emYTF+FwHB3flStImzvzNOEccbWZ/IvX3urlBk1Hl2u+GLNc0kRLRJNsFlvDztAPmB2xCXEUJ8MHP4J8WxOAYY=@vger.kernel.org, AJvYcCWEIwJT2U6hS86Cms6WCpLKJc7ucwMPlv9fH31c969vHGWAIsBfETHIvnTwIkwsv3rgxSXKg77a5eqTV9MY@vger.kernel.org, AJvYcCXcQmQPfM8o92R8iTq/ZL2WcK2cNkXMxRld0f7rA+7X3tmqQvP91Fu5ISUfCuHig65F5wLQxBVj@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc/l9hOncHUFg79HTmYFzzQ3RLe89FQRGNxBnXeHmilcZc6FWK
	sWy354ga2McXCT0fD5uPjV5w1PFOtzhJ4ebGEDAIVMw3TFCj/jXMDHoULjVRVOQB
X-Gm-Gg: ASbGnctXD23OTEn1brEjad7YoSxVPV6PjXhXHEAV3rtXQnLBi85xfX7mtPjAwU/C5Ci
	hiQ6lyjm9qweGmg1w6e2KypruZcpG2Do2U5KTXm9qs9SLrDtvmPAIx7Rxe6EqiScRZFQwGb7KxD
	WV4i6ePv2HWZy1evSxPL2083ZDhmbkpMV/iJuJhi7a6ZfrapcpFttnOayGJj2+mcOvmwrha3X5A
	XqaxNrnWHorxZqsRsEwdWbe+5QHyU/X0tBLOcrh7GhmVTAI0MRebDQ5kcVeClVFfYStVX5iWeW+
	vklbZO3E+weQ2XwwpdbsQ8dQpzq56r6rPb0gRI5WGJCfgVoy9oRrLdth/5k1dgAzpm1hNpT5dwc
	2N87x8L6HjOJgLYy2KrF+ehL5
X-Google-Smtp-Source: AGHT+IEbESGZjr8sjBHrKLN3ubjxE9Swd3JdDLqDgrCkyxsGfiz5Iy4rtAAAIgDdk6GI4feRV2KkLw==
X-Received: by 2002:a05:6122:8f05:b0:530:6538:cb12 with SMTP id 71dfb90a1353d-5330c0ef44cmr2599229e0c.11.1751035327998;
        Fri, 27 Jun 2025 07:42:07 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-884d1c458c2sm627337241.13.2025.06.27.07.42.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 07:42:07 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4e8135adfccso532629137.1;
        Fri, 27 Jun 2025 07:42:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUcm3Nd7D4tct9Mp0CGcGeqouaOeN7PrFM0BLKu7AE4pLgTYxLrN1RlRTecbMY00xjCGlLWwhKd0px3qtEc5zegCRc=@vger.kernel.org, AJvYcCVsgnBIN5pUyT45+RRygpEEooVcSY4lwYAowLWyfHVV2Bo3fedHWh3blHyhNK0Dx8YLw1cqDW4xK7qLWTiG@vger.kernel.org, AJvYcCX6g3QD5Jp3hG8oD3Q4yhs3eaTgBVFreohj3bwa43KB13hecqR6l/CVtGF+Jq+FOtpK2z827y2u@vger.kernel.org, AJvYcCXMTJPufnBsbQgYSTUAYihBMgt9XLs3i+cogb+woxNEnngdQ22QB2b4BJzMSgZDIMc5kKrxK/z5wcs5egxigps=@vger.kernel.org
X-Received: by 2002:a05:6102:509f:b0:4e6:fb90:1e21 with SMTP id
 ada2fe7eead31-4ee4f4e4416mr3041505137.2.1751035326779; Fri, 27 Jun 2025
 07:42:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627134453.51780-1-lukas.bulwahn@redhat.com>
In-Reply-To: <20250627134453.51780-1-lukas.bulwahn@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Jun 2025 16:41:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWag5S38D5dqKy+0+5rrhyJPc+KMdi6SipXwJ04k_K4zQ@mail.gmail.com>
X-Gm-Features: Ac12FXwrVS3MEt_q-Oqh9tZ8p7AjJm9MhCNyBt5kUT4GenaWkJM3yHEHUeQa49Y
Message-ID: <CAMuHMdWag5S38D5dqKy+0+5rrhyJPc+KMdi6SipXwJ04k_K4zQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: adjust file entry after renaming rzv2h-gbeth dtb
To: Lukas Bulwahn <lbulwahn@redhat.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Content-Type: text/plain; charset="UTF-8"

Hi Lukas,

Thanks for your patch!

On Fri, 27 Jun 2025 at 15:45, Lukas Bulwahn <lbulwahn@redhat.com> wrote:
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
>
> Commit d53320aeef18 ("dt-bindings: net: Rename
> renesas,r9a09g057-gbeth.yaml") renames the net devicetree binding
> renesas,r9a09g057-gbeth.yaml to renesas,rzv2h-gbeth.yaml, but misses to
> adjust the file entry in the RENESAS RZ/V2H(P) DWMAC GBETH GLUE LAYER
> DRIVER section in MAINTAINERS.

Doh...

> Adjust the file entry after this file renaming.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21271,7 +21271,7 @@ M:      Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>  L:     netdev@vger.kernel.org
>  L:     linux-renesas-soc@vger.kernel.org
>  S:     Maintained
> -F:     Documentation/devicetree/bindings/net/renesas,r9a09g057-gbeth.yaml
> +F:     Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml

Alternatively, just remove the entry?
Prabhakar is listed as the maintainer inside the file.

>  F:     drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
>
>  RENESAS RZ/V2H(P) USB2PHY PORT RESET DRIVER
> --

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

