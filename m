Return-Path: <linux-renesas-soc+bounces-22695-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A987BBD85D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Oct 2025 11:54:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EF10E4EA50E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Oct 2025 09:54:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C6932153C1;
	Mon,  6 Oct 2025 09:54:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC24621423C
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Oct 2025 09:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759744485; cv=none; b=Ab0MYE+zqvmJtoU477silh+/eE8YWCm8FHKWjETi4jtu6oHzL6fa+FwvvG5Pr1Bt4eMrwbHwPh74nXfZ4XZUEZbyUtIAoAlYf69Zbp8/3KioAki+WQuxurIfzjqJkrzbkTflF/04A9CdZfFPOuiJ6v3PFwPjeDkxvyiy9jxAWqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759744485; c=relaxed/simple;
	bh=9a0d7PJR05hcZ7JqZ/w9T5K6n1BhXnk/sufH+H791Z0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ap6kAAAS/mbmZDjGxY+P2m09MjDiq14u0MyD425KP6x8JEaFy1GD3+dihjW8bQNeTWpKQ3cKsDIjfKIEndZ2nJT2xbcybyCiONrci++kx0tBxRPXYeo7isCXrnPoonp7URvOMT/1o4dsdilpk0dvlxGNfby53T0/qptkV9Eqbp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-54bc08ef45dso1822255e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Oct 2025 02:54:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759744482; x=1760349282;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=02SeAVrxKSeRuZFXg8bu7j1SPQaB8goga81E4fHjiT0=;
        b=UXjWUgnEHZu1LqdyfkWM6iYS54WVaWHoEK1XjiM2m/Mg+P1zr37NMd7YVdpxUVmC87
         JvCJuxIfaC19uoWnAU14K0bXDLHT1LNnjqE+7te6zUTbM2VppLV3GlOKMR/HoRiXxf/V
         5cq0bs00TECH5hGgVYfJZknd+xldv0pF4gE/yMxIcZJ3KjiZW4T35KUhA1B+Nl1Ca7W6
         hcd9DiO178G4vzTqMsjT/+kkOwANaA+CC+5kmKF5QtLbLKOfvJOt/HwlzDWY7YazVjdN
         RYcb0i6yYQxL//cNdsmEcWm97oE8SMREerbgzss9ooLo++8eg5K8wlXvlRQ3Usy5QXxq
         QAFA==
X-Forwarded-Encrypted: i=1; AJvYcCX6z7scWh97DDEH0iST6mfuyVatqfBBxaAJfyMJzBP69u8HsouGaiUtnua5efqD5BOokE7vxtQRBbvBlhQoPKdJCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwK1gjNay+yvnIpUG2Ncp3y0fb85EZK4h86ai1aoTLEnG7/iDm8
	+xpyQZaIUhlfK1+nKg0c2db9bq1z7Oz/JcN3haapRLabuOWIdLMiayn+KjjUE5S9
X-Gm-Gg: ASbGnct6+/3v2TMXp0i8qoB5+uHdeixzPe9opJKGfV1pU+lIVbA2+7Jz2KRaZvgycMX
	fBlb+FfB1wtVBKk2a1uSJwRN/LweTUEf93A+8vI2U/KClVbCNNM8wXOgdKHfjid7HJYNJ9KLBGF
	Xa8Gy3T9F1Qm0xjRuw50k4pGyCXBWeFDASHWiEFSFUzAUdGPrUD8R21WBgo8qBJyhQE1ZZkEHTL
	+7hSSnDN0N4v5ZcOYZjMpGK4pqp5FU+6m3QAclLByld2d5RlxuYL1aVdkSYt7Ivzr/gUMoiWY6P
	4yfo50UBDmmRG/tOEmM5NQsbo9PyfHR81yNZ889qUYUlRVBTjVjWaZi+7NcRDS4OwlQuX5WtO+h
	zc9kWZQMtZzLdOSEv1XIeDB1CcRp9ILZ5nhk2u/EwD0p5dkc3T4GwE3aAgRmEVj0PmsbUxI+m+F
	u3yfhsgFe/+iVotwf96cNJf6dtNPPhDw==
X-Google-Smtp-Source: AGHT+IG+myXGoRTc+NGaoEBbVfJDsDJAY5IdXmfigGuqdy3LCasMI0Z+qcErwr5KcVRmbUW7bcqO7A==
X-Received: by 2002:a05:6122:201c:b0:544:71fb:f49b with SMTP id 71dfb90a1353d-5524ea11448mr3974828e0c.10.1759744482398;
        Mon, 06 Oct 2025 02:54:42 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5523ce1c31dsm2889766e0c.1.2025.10.06.02.54.41
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 02:54:41 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-8e364003538so3411952241.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Oct 2025 02:54:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXmybMLnEwOBBzOijX5od+ecBVQZ0O5DObe/VmRWnz3ZBman6mj59p5182OmYOkTKWQRZ+eZaPeBjYZvTBBkiikMg==@vger.kernel.org
X-Received: by 2002:a05:6102:390c:b0:524:c767:f541 with SMTP id
 ada2fe7eead31-5d41d17e99amr4486616137.35.1759744481269; Mon, 06 Oct 2025
 02:54:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251005144416.3699-6-wsa+renesas@sang-engineering.com>
 <20251005144416.3699-10-wsa+renesas@sang-engineering.com> <TY3PR01MB11346E3690F0E74C5E1AF9B7586E2A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <aOKajKzRlrQD7plt@shikoro> <TY3PR01MB113460EB1918AD06D8F2ADD0C86E3A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <aONh89-5-llFZWue@shikoro> <CAMuHMdVUbENsdjCCqrn7e9=mWbs+J1kcat6LYU6vAcrBHzawBw@mail.gmail.com>
 <aOOPMG_bW_q8iM7C@shikoro>
In-Reply-To: <aOOPMG_bW_q8iM7C@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Oct 2025 11:54:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW9ibqQ-r9HsL6oZ152pan8un2xTYcgeXAzZ-hqQQ7q8w@mail.gmail.com>
X-Gm-Features: AS18NWD4s_p_0gq0J5HyiXTg6GlGkZfHS9UmalB-R7l-fnnGUHsR4vB2071olW8
Message-ID: <CAMuHMdW9ibqQ-r9HsL6oZ152pan8un2xTYcgeXAzZ-hqQQ7q8w@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] dt-bindings: watchdog: factor out RZ/V2H(P) watchdog
To: "wsa+renesas" <wsa+renesas@sang-engineering.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, "magnus.damm" <magnus.damm@gmail.com>, 
	"linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Mon, 6 Oct 2025 at 11:43, wsa+renesas
<wsa+renesas@sang-engineering.com> wrote:
> > We do have "fallback" comments in other places, and I think they do
> > help in understanding compatible naming schemes.
>
> Still, dunno...
>
> > Would it be possible to handle this in dt-schema?
> > Currently we have to write:
> >
> >       - const: vendor,soc1-ip
> >
> >       - items:
> >           - enum:
> >               - vendor,soc2-ip
> >               - vendor,soc3-ip
> >           - const: vendor,soc1-ip       # fallback
>
> ... I think '- items' makes it clear that later entries are fallback
> entries. I am by no means a YAML master but this knowledge should/could
> be expected? If peolpe don't know that...
>
> What really is confusing, I'd say, is a mixture of entries with
> fallbacks and without. One can overlook this easily. So, they should be
> grouped IMHO. That's my previous suggestion.
>
> > If dt-schema would automatically drop duplicates of the fallback,
> > we could just write:
> >
> >       - items:
> >           - enum:
> >               - vendor,soc1-ip
> >               - vendor,soc2-ip
> >               - vendor,soc3-ip
> >           - const: vendor,soc1-ip       # fallback
> >
> > What do you think?
>
> (soc1 should be omitted from the enum)

If you omit it, how do you know it is valid to only specify the
fallback compatible value in DTS? We do have (non-SoC, but family or
(ugh) generic) fallbacks that must not be used on their own.

> Do you mean "# fallback" indicates that the fallback entry should be
> created? Or just the const item?

The "# fallback" is just a comment.
The new dt-schema magic would be ignoring the first enum, because it
is identical to the fallback after that.

> Well, this is ultimately DT maintainers call, but my gut feeling says it
> is better to be explicit than implicit. I do understand that the more
> compact binding documentation would be a gain, though.

OK.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

