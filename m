Return-Path: <linux-renesas-soc+bounces-24198-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 159B7C39A25
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 06 Nov 2025 09:48:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 344803BBC95
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Nov 2025 08:47:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D05113090D6;
	Thu,  6 Nov 2025 08:47:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481B026E718
	for <linux-renesas-soc@vger.kernel.org>; Thu,  6 Nov 2025 08:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762418863; cv=none; b=GPECOirwW5fJIxKBi30IxJ+gujNz+9T1ZZ4RjBhe5TMYgC/9/J2QBPqLzf5qtpJaeZxdtgDbF84cqrC/8Y0+EgBEHf7zu1x3/JZuuH0GQjbqjnrMWOb3aNvAjU7xvz6f2ZgM8a0W4MWhzkI+7rRNCybQprSErxR8LGjPCPq84mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762418863; c=relaxed/simple;
	bh=r4WI112XNVPvAwbD+KTwJYuTD4uzGIUEVqXtqMZFfmI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DkXIdHsfH9ACyZFyOA9fKzhpOVs7hMocSxJ8G1i2apXgmJzrDilWQiuKq2WXDE1Kb4LSL3EgGHMSv52KTZzQZ+L3hF7A+Nfb3uefgzGNlIBT7ugssWPGoaRQ9KBpOPCebZi4dKrzX7ryIjIgj9PPCuoPKXtSwiVjHMwTMrmtEgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-5dbde7f4341so1519216137.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Nov 2025 00:47:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762418861; x=1763023661;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zdhdbS5PtOsV4kjxfjLI8puwF2f4n5VCEZc3tH68S6k=;
        b=X/Q/QV2r26HolpG8n2u4v/JlnJcdZgHV15btzUw44Eo70b3zrD8cBcmql88chuHqXU
         kg8taTloHbwcBAod1ebfamiyFPw7UpH14jjuTS4Dz4YBqaJUMEhI96UfOfEqH7uyB4uo
         /E6sKT/vriqZlqWMo4+9ccj9cGCX5B3dCAvR/V62rW3qeDsltg9MqOt7Za2SZH0Bct5q
         xlcNV4ktL/v4I1atAkNwBrr2MT+Q355TfJTsTglnL73McmjYCWFpkliULUlFAEY4cId/
         iHHBGounJi+lMCFBL/X63rSjvPGRVmphQKBbxHuNG4Usv4GF73BgBf8jPs8wMAGENKga
         9Z6A==
X-Forwarded-Encrypted: i=1; AJvYcCWbndvlgjm2rNBglVD7LExjguqEEPzsbQ+Qvtmbk3gG29akMJ9qYkoBGeBDT06dI8CW7I2YQCVWVozwRiXuOswobw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDKzfu3m3fFvVSgvDZGE7MCL/i6KUY/V6fRYaSsSJYQkMSkBgB
	FFuW6b1wHw7thvddCtaJUhhA7wUIbTLMV8Rq41e6YV5ZAu9KKvu54qdaTDTdVgn5
X-Gm-Gg: ASbGncu+zxuKxonlvFbSRQ4RBaW1yj0mKrM6vwgHMq37St7kp25e7oHTWOm3SjTxAWS
	3MzCAF3nQCh4iVScZzfeocWbnxrQ4CZSQCxFBaMzcYwv6o0JmtFENG+iKDk7XYdk3FgejlFHfgZ
	HErSPPwlNSQMp3NAMfx5PmWO6vtKp4M/SZa5SYJ0CJZw0samSIOFabL4p/pYh+QILH+qKElsO/z
	6vz966PUeeRLhQP52LPUWtpXeqL9NaHZuNCKYNFAzh1Je7Ct8DLPlUqMWyJEkg1pDVhjWE//VuN
	Uo/TXfkTuUxOJtzINWWhcw0TM9IHq2ngTnhrYHeCwaNRceiICR2myD3eNRIN/YEPXHgCu5ZtsAc
	cMyBoADmcLlPPSJNHHCNOKmRxVaAs/4f7rGFBs2sbfeX0QnTodpa3S8Oh1HvnSiDiMZllxIkbv1
	mblOX5G9l4m5JVVqa/srNOZUd8lSDm0Z+bbDkEvgum2fMRSTDpyZ+iMhz0fmM=
X-Google-Smtp-Source: AGHT+IGbki40PMGLwNNuJJpUGRAd5nNSFsSjd5U+QFofbYN/gGmvIkeDmkq5ck7JbncplZo8ui9f5w==
X-Received: by 2002:a05:6102:6d0:b0:5dd:37a3:c389 with SMTP id ada2fe7eead31-5dd9fcb309dmr1007677137.2.1762418861015;
        Thu, 06 Nov 2025 00:47:41 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-93708969b1fsm778701241.11.2025.11.06.00.47.39
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 00:47:40 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-9354847e338so433434241.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Nov 2025 00:47:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUK2myIXrTNWlEfDR9aSTsu/H3ba695Mufkriy3rIpuYtHqTyXsXZfiAK4FslXnbH3TMAOTSg1yq2dNn46ONPRSWw==@vger.kernel.org
X-Received: by 2002:a05:6102:3053:b0:5db:e179:1c2f with SMTP id
 ada2fe7eead31-5dd9feef219mr849186137.18.1762418859485; Thu, 06 Nov 2025
 00:47:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251021080705.18116-1-ovidiu.panait.rb@renesas.com> <20251021080705.18116-3-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20251021080705.18116-3-ovidiu.panait.rb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Nov 2025 09:47:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUR=_5Ex57gvgFXyxhSDkqdd0DjcTqV0m59tquxKzQnNg@mail.gmail.com>
X-Gm-Features: AWmQ_bkMn9K93ASfX-CEwYoeGvJMeNWd5c5VED4d6zuDLnmC2ge-cRo7TaazeRI
Message-ID: <CAMuHMdUR=_5Ex57gvgFXyxhSDkqdd0DjcTqV0m59tquxKzQnNg@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] dt-bindings: rtc: renesas,rz-rtca3: Add RZ/V2H support
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: claudiu.beznea.uj@bp.renesas.com, alexandre.belloni@bootlin.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, 
	p.zabel@pengutronix.de, linux-rtc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Ovidiu,

Sorry, I still had outstanding review comments I hadn't sent yet, as
I hadn't finished my review yet.

On Tue, 21 Oct 2025 at 10:07, Ovidiu Panait
<ovidiu.panait.rb@renesas.com> wrote:
> The Renesas RZ/V2H RTC IP is based on the same RTCA3 IP as RZ/G3S
> (r9a08g045), with the following differences:
> - It lacks the time capture functionality
> - The maximum supported periodic interrupt frequency is 128Hz instead
>   of 256Hz
> - It requires two reset lines instead of one
>
> Add new compatible string "renesas,r9a09g057-rtca3" for RZ/V2H and update
> the binding accordingly:
> - Allow "resets" to contain one or two entries depending on the SoC.
> - Add "reset-names" property, but make it required only for RZ/V2H.
>
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> ---
> v2 changes:
> - Added "reset-names" property and made it required for RZ/V2H.

Thanks for the update!

> --- a/Documentation/devicetree/bindings/rtc/renesas,rz-rtca3.yaml
> +++ b/Documentation/devicetree/bindings/rtc/renesas,rz-rtca3.yaml

> @@ -61,6 +63,39 @@ required:
>    - power-domains
>    - resets
>
> +allOf:
> +  - $ref: rtc.yaml#
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a08g045-rtca3
> +    then:
> +      properties:
> +        resets:
> +          items:
> +            - description: VBATTB module reset
> +        reset-names:
> +          const: vbattb

Please add this property to the example at the bottom, too.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

