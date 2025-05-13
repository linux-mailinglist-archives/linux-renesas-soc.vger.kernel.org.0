Return-Path: <linux-renesas-soc+bounces-17034-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F63AB5010
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 11:40:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 993EE16E264
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 09:40:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 738C0238C26;
	Tue, 13 May 2025 09:40:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47051E570D;
	Tue, 13 May 2025 09:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747129230; cv=none; b=K9VTNvtiFESNhh/D4YYm0PD92tNzk9gCtIc6/2ebNfQH6pY9C3gx2fCtVcPmK7gHjfGVjcfwpv22dPCjx0iGNFCE/GMzp1VT3m+WreR0P8JUQX7/9H7eHFJigxU/DCuau7/Yme0IYhxg4n2V14JX28UrWDuR19A/L1HL0hTQ5y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747129230; c=relaxed/simple;
	bh=1wIIwHD8c+CPmX9U6aGb2yK2udHw+4iA68GBonq3u8Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WVow3SYiR06dFy/92Aqs0RM2pX9a/YC2LxV54Ozh+Sc195+lbpE6jMOQvVG9PfSM7ATOJY/xyN9PhJgK1UYY7xXsHWlE6eEzTiLuoGOPoTMk+rcKx6yuUPyGy9gsVIw9EisVfomutMR/09Av+eDH0ucQ1v72Q3KoS6/uHGJ22Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-878427f091eso1487001241.3;
        Tue, 13 May 2025 02:40:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747129226; x=1747734026;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OLVlgbGY6C4NmUHQLVUAYE7yGL5LTr+dlKy+YPb+qSA=;
        b=sJ0s32thJHSnsEAESTlHZrGbGBKypJu9ex9EqPPDJZgTJSMerD8xxv33x+LKou+fgD
         V0mB5TwDu+gcpownkh0baokiNPziEnum+vVCx4EHV5KakCj/5KokUK9AYbjxMH37wbki
         ++vC9GsOgGlE+Mym8c1rnQ2NH+QDsZvQdOHQ4eEzt2zWkgoYgmwFSQFkvxHyEQYxo8Yf
         KojFpb/VyaxEgX4GMtd3w6X3z4N2zUCLdyiexUqYVOpa1fJINNzEhkIKcMMdbhl3OZEQ
         DDfmR7A4NwtN7LB08ua+URU2BhAlAxgHOc8ggy9S6/CNnKinbEecLbYQ/RXV3CBcs+Wp
         ed7g==
X-Forwarded-Encrypted: i=1; AJvYcCU/i5aTP4xrPnmx+tO6BN0UrEIHho71WH5nlsgKrqas2LFZ/BKdt6AfeubmPs5aCClJPrA90vqENgloU7iJ@vger.kernel.org, AJvYcCW1Ax0Iaqg/b8Jcn5EDUxS+2sMwuDklMRfGj97jkasF1slF2Dv3CCxMieMOvX7NJ6hu8cKXR2DwZOcC@vger.kernel.org, AJvYcCWmIl/fKiueg1LGwhG4ESX9wtKv0m2F7EfSlHZsJWFaxSHQaQDyx1J8h4figiUOlQt2WbTD4tnHvCKAOH2ePORLgHk=@vger.kernel.org, AJvYcCXwFp/FKH2W2jRa6OiukzXbWq56PnxOcEVf8PibYF5WEiwbyAc9so1IliB/oEmw4DqcZHHrrMJZHo+dl3vP@vger.kernel.org
X-Gm-Message-State: AOJu0YxzA4FbOqXbguzZD9OFRyeIiS25/m8zB2/jSK3BriS+vjNFv1uf
	Xr9vIfM8pI4S6jD947bO3SoHcKjPKUAiE7tQlDJ2eyRFQLkH+MKPg2EjdsGu
X-Gm-Gg: ASbGncv3l5Z5mWuyk6OAC96ak0XVuOlu3FRrmx9YkktmCcI8NqLVkKP1fzGBEO7XptN
	Wq/d2f17E5ypIkxRHDSedCh286t3Sqr7HtZgFXIUEaoHAM5usLjHzfRxP2MLBJwngkJxamWHm3/
	7jwqQxSHKu8S5mi41G+SJwN5ypx34g8nrnkYnM48s4y1ZvvskLEQgCZdrbzyBeyereJ8vB1obhE
	7qVQA8le55KzV2eqTSOWWlnYQsrbNQiZTkiFrz2VreWrrQXdmH0yxGRlIr+WAe6X3sfI7t+XhA7
	N6ld7e4WPJyxX4oNwfZs+3+kkCY9ZGbPMcs8WIbTpeNLj9XaGWdAJqG3WcrCFwj7dCyeSAE802T
	cI9pMV66NdNI47Q==
X-Google-Smtp-Source: AGHT+IE3B47kPtK8UhqwT/tACvgvfC0ea5Y6FSrSPPQcx0GYHA1fSNMO5tJpBQ8T6/RG72IV5Gu0Bw==
X-Received: by 2002:a05:6102:3c9f:b0:4dc:81c9:13b1 with SMTP id ada2fe7eead31-4deed227f12mr14340536137.0.1747129226568;
        Tue, 13 May 2025 02:40:26 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52c565cc6d9sm6903223e0c.5.2025.05.13.02.40.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 02:40:26 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-87843d9d40bso1416458241.2;
        Tue, 13 May 2025 02:40:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUFiX+I2UryBDfV3ADIRhZPl5jf8QwltmhpIqnZ2WwmCagXg5It/OgFQTWgiwIRKABjwBai0wWi54A2Dqpl@vger.kernel.org, AJvYcCUMvGh3DFVfZg8EWbgraosHGbUvOZXqBD3UwIPsBD1D4gU27gWxBIrWRfg4LgBz/M9elgfITtYXoFVa@vger.kernel.org, AJvYcCUccVMbPGoJVG1OUl1UB9W+ds59DKhT+WD6hI7K2KhTQmPeYnSBdpXzHMYubdF8VNpvSvQ5fbAjfMjBy7JQBl1t0lY=@vger.kernel.org, AJvYcCUl7VsP4vYrWbj9LHkHd2lmNlNM0jssXV8RwcStpjSqdosiGj4T0FiCl6/ptz6FsRydoDDV7+i/2arK+9a4@vger.kernel.org
X-Received: by 2002:a05:6102:2c02:b0:4de:81a:7d49 with SMTP id
 ada2fe7eead31-4deed351e14mr13783445137.8.1747129226114; Tue, 13 May 2025
 02:40:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429081956.3804621-1-thierry.bultel.yh@bp.renesas.com>
 <20250429081956.3804621-2-thierry.bultel.yh@bp.renesas.com> <20250509185858.GA3933854-robh@kernel.org>
In-Reply-To: <20250509185858.GA3933854-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 May 2025 11:40:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUBo98nA4=VVVe2YDeFTKFx+ynuDox_tV17cmGw2acLAg@mail.gmail.com>
X-Gm-Features: AX0GCFtDW9XhFJSnWBy8wJPJMO9llEfB3d8gRYXObtTzIaElJDfhlG-xRp6Jb2A
Message-ID: <CAMuHMdUBo98nA4=VVVe2YDeFTKFx+ynuDox_tV17cmGw2acLAg@mail.gmail.com>
Subject: Re: [PATCH v8 01/11] dt-bindings: serial: Added secondary clock for
 RZ/T2H RSCI
To: Rob Herring <robh@kernel.org>
Cc: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>, thierry.bultel@linatsea.fr, 
	linux-renesas-soc@vger.kernel.org, paul.barker.ct@bp.renesas.com, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Rob,

On Fri, 9 May 2025 at 20:59, Rob Herring <robh@kernel.org> wrote:
> On Tue, Apr 29, 2025 at 10:19:43AM +0200, Thierry Bultel wrote:
> > At boot, the default clock is the PCLKM core lock (synchronous
> > clock, which is enabled by the bootloader).
> > For different baudrates, the asynchronous clock input must be used.
> > Clock selection is made by an internal register of RCSI.
> >
> > Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> > ---
> >  .../bindings/serial/renesas,rsci.yaml          | 18 +++++++++---------
> >  1 file changed, 9 insertions(+), 9 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
> > index ea879db5f485..aa2428837a2f 100644
> > --- a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
> > +++ b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
> > @@ -35,10 +35,14 @@ properties:
> >        - const: tei
> >
> >    clocks:
> > -    maxItems: 1
> > +    items:
> > +      - description: serial functional clock
> > +      - description: default core clock
> >
> >    clock-names:
> > -    const: fck # UART functional clock
> > +    items:
> > +      - const: async
> > +      - const: bus
>
> This is an ABI change. You can't just drop 'fck' without good reasons.

This is fine, as there are no users yet.
The initial DT bindings were written based on a limited understanding of
the device.  Let's hope our current understanding is less limited ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

