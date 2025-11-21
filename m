Return-Path: <linux-renesas-soc+bounces-24911-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B88C7883E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 11:29:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 96F763677EB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 10:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 236D734214C;
	Fri, 21 Nov 2025 10:23:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5F22D9784
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 10:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763720635; cv=none; b=NGnLstBsWCzC/LEExAZ06qBNfEsvo/h8CE4FpFQCkxSTPMKzSBr43DXfEAeGi5kd9M5MUWVxjyOqfOYYnP+hEMz6pv0iceAcOF0t/4Ghb8nKpXVQYLnv2VogzdfsFDGXIM3h11556EDsphXvFqTH4+qjNAlrNpwsSWCnppa8H9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763720635; c=relaxed/simple;
	bh=GhsZ8Fz5ea+FMGpetIKZCr5jsiGsbQaOmhnoafKaWMs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bZPB6x8NaHONRbe+L/zrt+4LsTMTDMSP2g3HcJqlWEUenneAOdhQYDdvDtS4sQTFkEEQAgtO71dKNBQ0HyRGdExawkDkjaznnpfomSommV+T8xwsU4yITMGc92I8awcL0eKP6Y4TUNeXjrx8cptX417z3YJZgwK5JnM8zbD46fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5dd6fbe5091so807248137.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 02:23:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763720632; x=1764325432;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SZ2SskaUkurTKzbLrvgmf6JMHc+39Llze+CWyN92u4Y=;
        b=RYdtjeNaYG3nXSqi9XFiT8vfYFkvo79eQwKZIZiFdnRtmaT4eJquQ6HbjyG2WNfSkI
         FO7H19L+Bg2m0D0p2IRMVcsCOlk2WdkxizFw903XMV+VMMtTHJhXXXWm8y/a4U/uUyti
         FGX0qbngmb2oG/YuDWXHmEa3+c4QaQ9XTxNp5d8/Fyg0znw3fetjgdkLF49h4oL/CHFZ
         fIfz9Jp1Ur0y9KNpN19n0JJHFXs7WsliU2ITZznP54pS/783kzxMhCk0Swf+yLFVxRnu
         t/UccXszNX/lJ966OczgUhqc5enXdUsUg9l8ftOrKJYfY7ifD5ODZqQyxlLrjpk8vAhK
         FHJA==
X-Forwarded-Encrypted: i=1; AJvYcCUNPe/souMacjHDeXn8aynAL9IiLz2CeRRCZxlbbrzqT4G2zyGvPZlOgB4GEnO9zTajkIBE6rumxf9MbsfVIKtFWw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyslODBX2vyFajZE4ISmFcmfWaAemOrJ7pNSn+qK6l9ApC+ldti
	iKN+RCabwqGX+6DJI3MDZ6+fJhfLpmqoWd07GqIgAVY/VfT9KOi/NrHHazqvyQZ0
X-Gm-Gg: ASbGnctcrLopGClZ7yPxzRXgRK7p1lQT+58dU0ZNNkkZcKawd/UWNF8rtF50rysGP+m
	GKDlmJdGBebIIFmuVxBdahNoOGl4CLo1OSRkFzpds+NTZPhN4awElhS7wUHeOnQSWiQOgd6H5eu
	LZNM+IyF+wfdl4xLNLmQkEDLSmbBexKGeEYn7KjcY5bHkOq60uVTLzvY1Bpu68bakLceWzUTSq7
	Ecmo/45kEGfFyqsvYYbqq9X6ozrDDauZRqXVfeP4Dgw7mfnlNvUW3tg/15iB1oC3KGRs4cd+S63
	yPCvOaNi9C+1qWrjcO2mZiAJf2IwkeHWAk6/A0e9mwNd33WFFKHZcB1f7yTv8BDv0aQHMm15rNE
	1jbKSDNtwcKa5Ys0zUR65AzZMCTtuDTohuDrQkIl53+/t9fodroC2u4BuE6z9nXbzr95Is5fuQY
	fMqM9G0yAQu9Sg86TJ6EDPPbgwiHJqLekl1LFhC8ounEPV8v36
X-Google-Smtp-Source: AGHT+IEprlKUNaM7CSp+l/blNJHQvyux4r1eoAGnYkcuHIcYYq/iYgvHoWztqdml6yTmrCZafZVEcQ==
X-Received: by 2002:a05:6102:1629:b0:5df:b81d:b738 with SMTP id ada2fe7eead31-5e1de4bd6b1mr352145137.42.1763720632071;
        Fri, 21 Nov 2025 02:23:52 -0800 (PST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-93c564c8261sm2168985241.10.2025.11.21.02.23.51
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 02:23:51 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-5dd6fbe5091so807236137.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 02:23:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV1S8u2jQWaKZ84PfrbPRWIqOE9rpwhj6l0SFXrsJRaaF4gQt8eOPUU+lBfqg8/iLGPNX1Pt4FVzZcJosq3rzEwhw==@vger.kernel.org
X-Received: by 2002:a05:6102:2ac3:b0:5db:e6bf:c4d7 with SMTP id
 ada2fe7eead31-5e1de3c5ce1mr331446137.21.1763720630690; Fri, 21 Nov 2025
 02:23:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251022073141.1989762-1-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251022073141.1989762-1-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 21 Nov 2025 11:23:39 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWoum=tVskjVnjJJNc-BnZKxYT4K8zSpSHxY+sP-9xGNA@mail.gmail.com>
X-Gm-Features: AWmQ_blI9MFBWBRM3FNQ52s5pXAABz8leVBOE5KgISRyHCZpTNLJR85pAdtOY1I
Message-ID: <CAMuHMdWoum=tVskjVnjJJNc-BnZKxYT4K8zSpSHxY+sP-9xGNA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: rzt2h/rzn2h-evk: add note about SD1
 1.8V modes
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Oct 2025 at 09:32, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> 1.8V operation of SD1 requires the jumper to be placed on the correct
> pins of a connector on these Evaluation Kits. 1.8V is needed to achieve
> the higher rated speeds like SDR104. Add a note about it to make sure no
> one else spends too much time figuring this out.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

