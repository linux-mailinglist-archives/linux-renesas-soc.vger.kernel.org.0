Return-Path: <linux-renesas-soc+bounces-18180-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DF7AD70B6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jun 2025 14:46:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F45A18858EC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jun 2025 12:47:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFE721A315C;
	Thu, 12 Jun 2025 12:46:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29E6A55;
	Thu, 12 Jun 2025 12:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749732401; cv=none; b=IZSwGtDnd3KJsL3d2vXR+pNJx21+vX0EMOR4TPf5t2qb22eMaQ6ryY+bpDOuxSHqpHMnOXOty/QYQ1O69WHVQVOMv0xSYqrbb3X1g+RGpjXvZ9vU+M2A5XtLDCeMEHZAD9IYtdJ6YxgZGyNgjD7edct15Er0aexfGjrJSDJ4GeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749732401; c=relaxed/simple;
	bh=UEHGNT8OkyV40JRRhSs1RS3iCq1KdL1KzjJCQb2gnEU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dmFfRguUgeHcNn5/Zs3KM7KaUZePXJlAcIRh81Z810uQhCzrd14kQa7SCUQ0TJ+jlum79Pw+r5h/aKFKfqOGlV8ZqJ+Ds56bDBW4OA+a4pJk2vK0YzbgAZJExNe+ruKOz9c9sN4yUaCaNkGpK+Vs9RNQW6WVfaaJ9IQr/l7UAVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4e79dde8511so221495137.0;
        Thu, 12 Jun 2025 05:46:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749732398; x=1750337198;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8vSAoUstgikUUqDKzXknlBDKU/sYkHZcvI32J0wZveY=;
        b=uL9+BhKrb7Pjq1gwja1AP+Rkr/iE8ZmbrnZDnOO9srM3cGGgPaJliCw4L22Ddhq+4I
         FDleCRVWoa8M2NJTktfPRGvKlO73Q50lz9Iwq/fv1qn5PYkrTkeLSnHEtwHb7lh8iuv/
         PwFJahVCN6uFdVx2w8JT7xRfjh4vv+84A9lrAZfDEPNyJAnXaE/X5ZVe0TchnaWITl7E
         FhGjmalyem8WYtezoPMlD0xRxf6fCjWmco7wl0BiQVkHrb/b4GBe2wUefdC5ioEtFMew
         Eq/dz+u9GTs5MpBJ3yUh7uDrfeycadBTUutK3wrqkpHLFhBEhwNuTqsyOBn4NsID/KTF
         oOZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUltaUdmULy3tE2rjDDSCHBPwFqngTqZhFw/KOjRnK1VsDbaATmCFnBJttEg7LLr3Wys5/6xvWmhLPodSy@vger.kernel.org, AJvYcCVxoUtd5WuS1PHLkbDGa/DR7VvVD65sC0cOODcCOs0knJ6EXp40i5oSuBZta9J9N1tUeAkNHp4lhSYo@vger.kernel.org, AJvYcCW7abg7JZeof7dRJEZXT4S0gU9LjKs6244WxRzHt6Hmukt0rPcbQYLQ1asVfRn+owGe6iipXSDvO4NDARoYmQUqBYI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpT3plPgrCa3aqmKJKtPykMeJD2KWu3EjVOozTuPQ0SnCBO9Q1
	AXRgz2oH3bit1NJ1sbWh2TxXg6RbuF3nrJce+WWrnm97X7EjU2ipTYxMDNjJyvMU
X-Gm-Gg: ASbGnctSLV+OzQkvYyddkWacaM3R4rU1g70qefDQChvjtmVpfOxo3so68Jn+90m3p+W
	P4jbGCk4iEVRsMooyst84y7DZXRwlf6mnqk8s+eIGotRJf8RLHo5ssCYPrXFUtzhIFv2GCdBEPF
	eKu9QRQmwGRZkK+TgCIEcHzw6fPpIeZZb97tfXAP33jmCfcLqI5tBg8+h9ob4ukDNyugdsf2/m3
	vKr+UXlF0wSx1H/ohucW2rGAQvecl/9GBVp09TUFnyl8byVYbP+iNxw5gZaqqjGVpgE7zUQu+tj
	RkySjcE0bwuvirc5sQa6B84wQcwTzEJI7AsMBI4ZaZ1lOzbT957kuae5Wzat9yLqVOcPGUFqEGx
	AwFgSHraxp8fvNB/TLUunChJZ
X-Google-Smtp-Source: AGHT+IExtcISPJB/Z1NN8upup1Nmo+XdMxTbnI7RpcquENYOUiQ9fcXAXS5sB20FuvJTq+okYxfq7g==
X-Received: by 2002:a05:6102:c52:b0:4e5:a83a:3cee with SMTP id ada2fe7eead31-4e7ce96d112mr1956877137.14.1749732397875;
        Thu, 12 Jun 2025 05:46:37 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4e7d0907f4dsm221602137.14.2025.06.12.05.46.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 05:46:37 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-86f9c719d63so212969241.1;
        Thu, 12 Jun 2025 05:46:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUONZRMuXsMqi3iiLnjeP7ZlByABW5Hde0f0wT1Ti28Yw1z6JNWbf0WIjOBD642pndjpmJ38eVvUNMeowUl@vger.kernel.org, AJvYcCWDEk3ckl+n+hkgNQmh/2uM481QyjXay5TsvKnkWrNRf13/E2tIeoUvRIRV+SEAKwSgaZ+A43guzrGNPVROiCLTZqo=@vger.kernel.org, AJvYcCWTZ6UScguQQjBux+9wo7wDVRurijx7Jp7e+pjN38HmqwNKNB/wscNc+ZzlUijT8LIUJqDxhPty+4iY@vger.kernel.org
X-Received: by 2002:a05:6102:441e:b0:4da:fc9d:f00 with SMTP id
 ada2fe7eead31-4e7ce96d107mr2142848137.13.1749732397116; Thu, 12 Jun 2025
 05:46:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528140453.181851-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250528140453.181851-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250528140453.181851-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Jun 2025 14:46:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWeXc1zqOgwRPjJ8RLL_oVFUtEAz5Ka_XssBBatXtEtmw@mail.gmail.com>
X-Gm-Features: AX0GCFs-ouPmndvanqwNIxMC9hDtu7_aRuCPeAypWbiKcZT-yN-JH5KflfL3yXM
Message-ID: <CAMuHMdWeXc1zqOgwRPjJ8RLL_oVFUtEAz5Ka_XssBBatXtEtmw@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a09g056: Add USB2.0 support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 28 May 2025 at 16:05, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The Renesas RZ/V2N (R9A09G056) SoC features a single-channel USB2.0
> interface with host and peripheral (function) support.
>
> Add the ECHI, OHCI, USB2.0 PHY and reset control nodes for USB2.0
> channel in R9A09G056 SoC DTSI.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.17.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

