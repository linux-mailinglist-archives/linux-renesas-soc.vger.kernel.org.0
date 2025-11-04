Return-Path: <linux-renesas-soc+bounces-24059-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E1AC302C3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 04 Nov 2025 10:09:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 13A8834D1A9
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Nov 2025 09:09:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8AF12BE658;
	Tue,  4 Nov 2025 09:09:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DD42FDC57
	for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Nov 2025 09:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762247360; cv=none; b=LNEBJ3wGb3uQk9OrRgyCAVWjK2vsj/v7CvoHA5ViKMJPQdUxQffpXYLcrm1SWK6YeOVJJWE+QUEYJtqwT/4uYcMZIfer6nDXxBvXH57tVqwwkXk3wxsNdi4+j4XIXSQm1otk+rY9pqFuEEUUzRhv+Izg57rGB0pjI90wiQKOkrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762247360; c=relaxed/simple;
	bh=Bs6qu82kza3J6Kn5aAW34CDe1TfQ63KLMwuu3FVhd1k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sK1qug4Q91ANA8IyA1Fj4ATqkfn2i9Y8UzShubUA+2Cc0RM7DsdI+31jE4nUpccNVO4FwdMwgyz5v0mC+MqOuVXPlB06j0/PDWd5WW6uVS9/6jaQGz0jlh3I0Uy8+tjTInE1osVHDInuVpmO7HiuKPthHvS4mIVe6sIVxxJxxGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-3c9c379af8aso3591803fac.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 04 Nov 2025 01:09:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762247357; x=1762852157;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H67jLGC2+nP+gJvVX0MRHo5Sws7Lcd+OKCPJPF9TIMI=;
        b=IbzGSv+U2zvc/jMvuS1fbZ4t/qVvxvB6Klaz2DXGFnKMgTyEd8MK3TRkB7WW8hetM8
         +fqr6dxNUKVF2aRR7gchHZp7PztykM1Qyuf0zteiOtyF3xaD7wBahelJo0+gOd2sC2mx
         XCe0PL3ey0lWhsl/l2WCZcMqVuuv6uhTjmGLsrOSWI3+VeLjG+Kp3Pm+eMzR/IszFMJX
         ekT7v6OZf39UUK8wQS6tSqr4wSJ4z8KZC2Sj9M+cAtHy4zrZrfGF1ayssVvp+HtQsTN/
         1wngFAkT8AOv6qQ1zlN0/dOBKQfel21R6eLOqjTEYX7VYxIxWfM03j3QZYOUokA2FolN
         hkgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYNYduDGSSCS28Bovoz47r23VWypHJubjg0ScgCXA27sBPsd8Ztc5LiDa39UkPfmvt1koE6WowhcUQxHIvdTYprw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJBb40uDInZZ6vI/9mdntxcSaADTokqBRZY5pvRZ1wvqwIG82w
	XN+Aib6iYtsaqBKIQ8E0ittidpslwSWoH3Lrk5u/KOYR7iJtpf2pd5mAtkMHOstV
X-Gm-Gg: ASbGnctWw7rUMx+6WajtMZ+8AmoZScSK19pVADMxcoTkPXSJ5/3AemoQD6jvPON1IDk
	olKKaE5EDIW1eeBK6eJHk4hCnM1thyjFjj82rIayJ4YLtClOCepgWtpUSqXMNLYpXqkU42ojJWO
	R16/OZDhsSB4qSiT28bjyhtNxUuhS6LT3WK7y+F5S/QuKEO9S17N1goBTmEcAdpG5ICJjNwVZBp
	xxRASj0J8wbgCO5ozobX1v+elkaQx77o8NTIY5ReP3SoWEqEVSslkRNThJo7xQghmj0Hdhg9pm7
	7V1HPslOrDcwHZ76JsJbwH97WKmtw7CBwQzLrAmTFTwuQg6AlAwQtPldoxvF7yd8pPil627lPKP
	dfFVLvXQeGmquC1FTycwiNB9GmgowZ6Rd7w8G1Gq2G4RTW/VWXQADidj1wI5ckm8FQMDxt8L+oq
	akGCErCPy07jV4YVR5k52nvfSdccAbsVf6xdHWaw==
X-Google-Smtp-Source: AGHT+IGTeESCTZgZ2GQ/eiPJwsPEM73vVqqBp60aOpD/G6BU5X2vyCRVxxoc821P7IAAXgkYzKBiiQ==
X-Received: by 2002:a05:6871:8908:b0:3c9:a286:fb1c with SMTP id 586e51a60fabf-3e03c7ce8fdmr1619740fac.24.1762247357363;
        Tue, 04 Nov 2025 01:09:17 -0800 (PST)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com. [209.85.160.53])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3dff46fa604sm895115fac.2.2025.11.04.01.09.16
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 01:09:16 -0800 (PST)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-3d47192e99bso3806769fac.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 04 Nov 2025 01:09:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVGaDx39oS+H17BHa9xU6oV1iL6RZLo1fnvqVyKnxIs4lk33d/Y1fKODiAOMnbtLOzdLUtBnI16EfzIrOGzjCDxnw==@vger.kernel.org
X-Received: by 2002:a05:6102:442c:b0:5b8:e08f:eb38 with SMTP id
 ada2fe7eead31-5dbf7d63c3bmr753205137.14.1762246928045; Tue, 04 Nov 2025
 01:02:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251103200800.173440-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251103200800.173440-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Nov 2025 10:01:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUoVrMCcN0yY6BNrgXxFFPP-uJSAssZVrSWBSPtTr9DwQ@mail.gmail.com>
X-Gm-Features: AWmQ_bnnwTsbga4_ceAKrw3IqMNP5c9B4ptZmLIuqnx7fLogJkKsw0-FT6vmR8I
Message-ID: <CAMuHMdUoVrMCcN0yY6BNrgXxFFPP-uJSAssZVrSWBSPtTr9DwQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpu: img,powervr-rogue: Document GE7800
 GPU in Renesas R-Car M3-N
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, Frank Binns <frank.binns@imgtec.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Matt Coster <matt.coster@imgtec.com>, 
	Maxime Ripard <mripard@kernel.org>, =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 3 Nov 2025 at 21:08, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Document Imagination Technologies PowerVR Rogue GE7800 BNVC 15.5.1.64
> present in Renesas R-Car R8A77965 M3-N SoC.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

