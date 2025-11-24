Return-Path: <linux-renesas-soc+bounces-25073-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 70126C80D50
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 14:45:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 254953A359E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 13:45:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ED78309DA8;
	Mon, 24 Nov 2025 13:45:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9997574C14
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Nov 2025 13:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763991942; cv=none; b=ePVpxHEf4H00dpWDSm7W/61AeUcnaf7Ucb+S1Xo3BNG4g627A7hVclM37QtOapD0v5r6A6lQBnFfZ9f7aa0WA4SKyaEfdW44Md0gZsTrNB2IyVkhNpoCAalK0NNQCYD+ESEp4bT1hgfSIksQkOb3SgKfV9MD3Ke1fC9TPEQsXmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763991942; c=relaxed/simple;
	bh=pGwjEOungeheGFb7JOaHZHRCSnn6bJ6yIDISOpRWkF0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gIan/dJ6PGt4lCm1psQ5vx3uX3cnU5bMOe+giWbQfQAqHvwqf3srk0DiqjTt2QWtuxAnO/h2+VRj/AJqmt9Sd0j3xxDuTyQynvr7rFd5EVjQkjJEAm5OvX4JyP7yHyFCQe+O07OKMtuWkSLJbJUfDraMwIbrhK/9czZQrbf5PeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-932e6d498b2so2622663241.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Nov 2025 05:45:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763991939; x=1764596739;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JzF6CGFzYEv/qypghK1+w9eJ/Y2c6REJMBluTWTXczY=;
        b=helbjotZrXEJWhpLsA8wRP6ET2IctOdLE00L/brj8fGMYEo8HDdR2MVWBtRw2kEQtA
         fazB0lY+gBJFM7FYPJmHSRh0pRErCP4XMESHiFTVp97KLt16JXAeZ13UOzMhjSj0XDQz
         IbcU1fQQ3bpC1PjP5ro+zx+nk1yVRYcrqqWwwg76D/4bacn7HOLuHXnByUHbmGaauuxo
         k1yDlPH5ZzPKen534UvEPDZQc3f2NSOBaizk8hFj1tPPeTuFqDZaEUsTINfZBN3eMmqh
         QDxGuFVAgsY+UujClYnfV/rezvQ/3VBLUdvMxvEXVkUmaCp81ABv6aIpa3lYKjP91qW9
         5Zuw==
X-Forwarded-Encrypted: i=1; AJvYcCV/Nwu/Z8HDuf+L9W+1iFn9dGe/7b5Tesi4dJLw4aTbgGsXO8pbYTGmRiM0cJSRNKXP1BAe9ltuI5lnuwvR586tVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRrMKvPxekh97Kov26TqYO/eo1mkL11jlAHCJKismrpbzZbAp5
	2rQhp9+ezXGko6+PrK8iwXvpbbBKZB5s/zG1utrHxqWED++NZlCA7h1d4XosJewV
X-Gm-Gg: ASbGncvyH/Kqwr3uoS1a6tuwSaI2WkEEQYo7Fr90Xo7c9z9m7d481agShIGRJAw3BYi
	Drl1fbowe05hCK24tzAfhtbmIGiDc2O2hnYmZ+GHULPZetiQpsfWAW45flXgtvHp5vj+565Xj+F
	lzDXbJ1ClN17fC+sZf3WmY6nwKhTFWzb3g8rIYTQW5PeYQtAQP4CrGK7nvK/vxoHMr7nyNdAY16
	m0eIfHNBKFLfltYp0HKyny/NTFSkTL3xNjlNrX0RuIy8swOPadbLtsKDrJb9Z3rNfRtTOQ5nOi0
	xr/q72kimjX4qDVjUhpDSIZ/4dHjRs56kMW3TrnnAxF8f5LnLPv/UECxp0rk727ANmpOIidr5Sp
	aLPR+e0rti+8+I3YD3/Ezq0naD/Rx0NFGr8XtSMeomi94btofABlKylTy+EglM+4qu+0fGMtLjp
	frpF6Q6DGFzafNo5fgmRfq8+rxV7fuFblJrslmJznqH1dr9VZu7B8uFMP3y2aamlI=
X-Google-Smtp-Source: AGHT+IESqIJsdapt4Eol3CrIMHbKH9FvbFA1Y8dE3aqBN79vwVkG473oXF/uE73PcNcN7NtwZyHeJg==
X-Received: by 2002:a05:6102:5a8d:b0:5d5:f766:75f1 with SMTP id ada2fe7eead31-5e1de1c1434mr3913720137.11.1763991939398;
        Mon, 24 Nov 2025 05:45:39 -0800 (PST)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5e1bdd27f74sm5463088137.10.2025.11.24.05.45.39
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 05:45:39 -0800 (PST)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5598b58d816so3231771e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Nov 2025 05:45:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXQznLFWeh2tAqULUsRca9sA/ndaTFoxCPbE1GBaRAnwrrX1yi2SFHdh99cicUH6WotA/r+5aAZXer3hya2sT0xgA==@vger.kernel.org
X-Received: by 2002:a05:6102:4b84:b0:5db:d60a:6b2f with SMTP id
 ada2fe7eead31-5e1ddd3b9camr4128126137.0.1763991938983; Mon, 24 Nov 2025
 05:45:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251101042440.648321-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251101042440.648321-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Nov 2025 14:45:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWm2=4hgdUzS7c2gDEOikbW--HdhDLkOFAzk3K6LP5=5A@mail.gmail.com>
X-Gm-Features: AWmQ_bl9iCRqQApt_0NUXCaJN4jP56qxhVOoLl31Dhsfo_UxI7Dbre_KQS3oejc
Message-ID: <CAMuHMdWm2=4hgdUzS7c2gDEOikbW--HdhDLkOFAzk3K6LP5=5A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: usb: renesas,rzg3e-xhci: Add RZ/V2H(P) and
 RZ/V2N support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, 1 Nov 2025 at 05:24, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add device tree binding support for the USB3.2 Gen2 controller on Renesas
> RZ/V2H(P) and RZ/V2N SoCs. The USB3.2 IP on these SoCs is identical to
> that found on the RZ/G3E SoC.
>
> Add new compatible strings "renesas,r9a09g056-xhci" for RZ/V2N and
> "renesas,r9a09g057-xhci" for RZ/V2H(P). Both variants use
> "renesas,r9a09g047-xhci" as a fallback compatible to indicate hardware
> compatibility with the RZ/G3E implementation.
>
> Update the title to be more generic as it now covers multiple SoC
> families beyond just RZ/G3E.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

