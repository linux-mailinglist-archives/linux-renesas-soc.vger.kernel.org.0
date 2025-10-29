Return-Path: <linux-renesas-soc+bounces-23872-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF43C1B759
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 15:56:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BD57134A4F4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 14:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10E0F2C0261;
	Wed, 29 Oct 2025 14:52:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738FB2620D2
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 14:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761749573; cv=none; b=Np0+DxQk64QN1Sq03KWw2krxdYHpjApCuoGs/50AmTL4kjJBD2oc4tyLeEKIMdGLQ4l83MUo9T9NLaeiJE9C4AsJfx9Y3Wg/id/DzjBC6JhBQagtIURhrmYJ2W4OaPoMMPt86OTBkT3bVB85RvBV2w2CyaUNtKYJllAOGSvchiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761749573; c=relaxed/simple;
	bh=9zqV6jhB56NFXTaKlUcgOIVmNv3vcWwq2ciUZhAwPaA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hOv04mTBSBgugh9z1DYK5ncCaXKS1VCQy2Mfl2IXr87TTU9Bh3xNDxAl0WSgSoIgH+ilPc8PgIsFDFPFlIVZbnWg93q0zVZRopWSRITAlaAiW1Q+Wp9DJw8L8eNJv+/eTFrJd/q6A/lyGD2CjM75FhkV3f4LpxcOi5PYSADDMiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-89018ea5625so3067408241.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 07:52:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761749571; x=1762354371;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iQvv7exwOArMoYZGDke0hdGiWbyAHG9S2KTmO/d6Kf0=;
        b=pi0Y7f0LfhyfAbJMFL7lYrlMB2x4tkpORiL7RJYToNAiZugZgmXA1HF6U1cVatzan8
         KhQb/HJN/CeypHEZjyzR7EiLQ5r4Uyry8uGsDG6L4npKs+bRriwFOPJ3KgOjvFbrsC3k
         2LTSLuKDTVxFkBeCAKv+UOHYPA80EUBDn3UhkqV0TVscKhGxcB90AhwKIbNkcAQVCjda
         rL+6mW3zyNLrCLQw6u7u/PwH3h1Qh202mcQu9WDKG3tHNSRFaJ9hFaLfXbjesP6druqH
         KRL2LzI6+jESdqV9OxFTRfwwMOkXeOMCo1W3NfvVFJTAbQURq5A8lOLSH0d5jo3yNoGK
         Ea7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXVPDRqfzFeYevKINX8ICgvn6ekh7hhtWjvLBrxvn0tpwuqmDJO+npSrTZT/CDDbLmTzPY3gJCwn8AyBzs0Q9vAgA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4UTYo01ax5xF+eTwPJnxukZz+cbHooXV3py3l19mQoE1JOmhC
	2bdxFlLNZizzNGuPY15AnEjaey63wKwxJyA5j4ExFFKMuZ9mBlmcOMfWLnySkaag
X-Gm-Gg: ASbGncvvv5XIs5/MPsTUE4vT2kB+r7e1OufgumfnW4wRJVU7qYweub3+qwE4pJ1TxUW
	AQ1w5D6WbpsrkWGVJbgpRpbeHgmWI3w12T8NuJbuGoU4Xx0qxC1wM04Q6wIcq5TRjtyq7A1KCRE
	2i+PHR6T4b2Pn0kpTPV4+TQZyACoepCUvT0TaBveandsmvZLwmjsbNaaKLGJt0jRW25jikbC1Gy
	uuwMnBojtLkuCAxSth8Kg81E8qjE+BLsZ6hUUCBAbzjH4u5K6OpPLJg3OvgswwhNnibmvrUzwR7
	EG0z09N0vWk8YApNM6EMPH0hODBO9yLfnB6jMBZUEsAuc44K+qfoiqdIYSkQHmGI3qYK5JsxKz9
	zrqs3TDWl3WUE7Gh1S8t1N5q++hjG1X4fwPAzKJv2ph0bDCtJogEixGrWGyhKjm2XGZ4IqG0fUC
	sU6ENVQ/B55uRjoi59J4V/v9UjezkdyEQgr9YVHe9G3B5YFzb+EVGS2mOJSAJsDVM=
X-Google-Smtp-Source: AGHT+IGAGda6XH4skLOTtHzXgoDqKdG+5T5zC11gNexlFw5JpKjBu6Uw2x4PWV6HtJ8N6Jv8v3+IsA==
X-Received: by 2002:a05:6122:311e:b0:549:f04a:6ea8 with SMTP id 71dfb90a1353d-558141a45d0mr1009265e0c.9.1761749571074;
        Wed, 29 Oct 2025 07:52:51 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-557ddb33507sm5276507e0c.14.2025.10.29.07.52.49
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 07:52:50 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5db39d2ce9fso3475924137.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 07:52:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUgSwhQRCgdAQ5VQ3Q5viDWDu/dEvCW9Cl14zf1KEPYqlvz/8fSEyuClABNCojfLAFSTlpiYQ4tjZWYsi03KxSgqg==@vger.kernel.org
X-Received: by 2002:a05:6102:1624:b0:5d5:d1ba:439b with SMTP id
 ada2fe7eead31-5db905d8f89mr990736137.11.1761749569699; Wed, 29 Oct 2025
 07:52:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251027211249.95826-1-marek.vasut+renesas@mailbox.org> <20251027211249.95826-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251027211249.95826-3-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Oct 2025 15:52:38 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV_9nSn1M8MA3K_trWW2niB21Tj3+VSQgg0zrNOd166iA@mail.gmail.com>
X-Gm-Features: AWmQ_bmu-VsyNsgrWByxIwZ6BxxZOq0ku33A5vZwj4heK_7OuwvDxVVNAt1ifsw
Message-ID: <CAMuHMdV_9nSn1M8MA3K_trWW2niB21Tj3+VSQgg0zrNOd166iA@mail.gmail.com>
Subject: Re: [PATCH 3/5] arm64: dts: renesas: r8a77960-salvator-xs: Enable GPU support
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Oct 2025 at 22:13, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Enable GPU on Salvator-X 2nd version with R-Car M3-W.
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

