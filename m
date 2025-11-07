Return-Path: <linux-renesas-soc+bounces-24300-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D866FC3F03F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 07 Nov 2025 09:47:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 853144ECB7A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Nov 2025 08:46:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 796582C324F;
	Fri,  7 Nov 2025 08:46:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61942741AB
	for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Nov 2025 08:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762505179; cv=none; b=PzA8qIR9GN46WukFFP6cthRiM4E1+vQLUxJFHWSIvHRWeDapamY3RK7CLKzOoQLXu+LKjEJ5CydztGvTJ6VoPBExEdvqDemsfF5lZU1flpgDPKvq8QxUtXARlAShAKxLVXxLXNwl24yeNUQzjpb6eSJeVdEfMpld3yJ7jAUySLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762505179; c=relaxed/simple;
	bh=cbPm17O09V6lsegfM3GqXO19rmFeKE2vaUONa3e/JVs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ml9IvYgQDsWUQfLXEvUx92MbWX+//Wdawc7ArwTHO1MI/+BgZ4YfHJQl39qVfyVABZ3vgpLXC0wbCTDpJb9DC6L+zKYbfcRck0ObJlDWhwoAQHaEFodb1cIxHLrmQJnyesVcNr7Izhe05uQGJpwp+ePjHC7y2ggxUwPkfRD8VtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5598c430b75so284311e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Nov 2025 00:46:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762505176; x=1763109976;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RYljhwrU4HN65eQaadjk2lYVAnTSHmWGyK5wHOBjG5Q=;
        b=N4XqEC7TChPLIahbhITwl7a+ocsY6B0JVX9y6dNIu08zlCBwkBSDF+OiTeDsNxdT21
         G7Mts16i3RtmiLo7eEx/iOHzsoo9ZXTLPZHTKifPBEu6YmC3Ep1cj2FqhoAKVZcOD8lM
         B+Pwf/WL7ZbB1Gp44oRrHwhEMjJ49hF91xa2nSpIg+6BmNFntraEAbUss2z4E1ZT6qZi
         ma6JIFq3YCALrAOYbXJFWuyng7c4JeXBt9M8m3c1l9ruZYAXjgR747wWRUEYWAHNx6ak
         eaW1WHkfNrpNc/HoB/Xbw7lMKg5hwFbeA1qqwQApz83IpQZi0JBWkbyb39lRs5VUC+T1
         8heQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvpTbRhposVrkiir13eUXnbZaeZSAa2jGX7HC3sqleoD6PwYUYAOTHndj9OvoWXjyW+2MOhTV9ojs1nI+Q3t+5bQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywso5eDvT8Gawzx67Q6rWqYs2WVhsVYpqEyllPd5UtRpcSFiibJ
	CoAE2IBMyKFZ6M5CeQlQKfA61B4DkfhFAzTpLgOctPLEwN5vWn3V+p7xYS+zCOPGfFM=
X-Gm-Gg: ASbGnct0CvzWoe3fJtDpihia6x9UfPA7myUqYvbMvusXUp3zGgzxKe32CZVJIh7GJlb
	wz8yq/IFnQjdWP4xR1juO+IbFzSWYxFqIi28s8j0oFUgnXTHz1fxT4TefcfCmbm4rgjPQi8kCz4
	RE34B/D1XGnuKlppSmk7/GZTfQtSgblIS696Mog1Oe0rn8AOP0sCS9q8Hb8t2lVx8Ptvi1TJ2Jv
	hBmDAihO4IDZwrdNdjLd4JblwTlG6fJMnVpOzt3Ss9F+4/08WvExoEXIu1nC8LGZ4PBHKdQ6uNF
	k8E8DAo+NVUXLkliKmr1DF7ywPjXmcaDHAB7iq+mH7Z57ZnuZ33gBuWbhJ3vGIWd3c63vlee/TF
	6wetaY0WlFjX13q/kbslzXg6hdjN8BMlo9Q52vKXg5eOETRCBPAlT9safbrBcr6tSfDK4oIyMIf
	l/Z/Hj73zIv2Qdne2xcqo4FD8LNbsYXBj/0I/drg==
X-Google-Smtp-Source: AGHT+IHD4hvemLMBCoOTwFGtLNhjDoFeItIvYqe1aF4peaMuItGK1Ks8YhQIkh4/xbsrpa6doZD/4g==
X-Received: by 2002:a05:6122:1d8a:b0:559:6868:b214 with SMTP id 71dfb90a1353d-559a3acbc8dmr920127e0c.4.1762505176464;
        Fri, 07 Nov 2025 00:46:16 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-559954c878bsm2811194e0c.0.2025.11.07.00.46.12
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 00:46:14 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5db2a0661e0so325001137.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Nov 2025 00:46:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVDxe7eLudStdO1Ds6wyvm3duboefl0Us35mKczlX215MIhnFeTUfIhQB74nf/r5IdxiEpkEfRLjSpD85zxCIio7g==@vger.kernel.org
X-Received: by 2002:a05:6102:944:b0:5dd:89af:9074 with SMTP id
 ada2fe7eead31-5ddb2123781mr755368137.12.1762505172519; Fri, 07 Nov 2025
 00:46:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251106211604.2766465-1-niklas.soderlund+renesas@ragnatech.se> <20251106211604.2766465-3-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20251106211604.2766465-3-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 7 Nov 2025 09:46:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX64H3aT8KsPwu9SHwc4SxMEF8SNSEXJ-7okwBc_sKFyg@mail.gmail.com>
X-Gm-Features: AWmQ_bmeaZjB-Ll7mOxuADG2wKALQswRSm6S846VNNGBx0Mi3BhWOLgXGbSo5Ho
Message-ID: <CAMuHMdX64H3aT8KsPwu9SHwc4SxMEF8SNSEXJ-7okwBc_sKFyg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] clk: renesas: rcar-gen4: Add support for clocks
 dividers in FRQCRB
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

Thanks for your patch!

On Thu, 6 Nov 2025 at 22:16, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> The FRQCRB register on R-Car V3U, V4H and V4M do in addition to the
> already supported KICK bit contain settings for the frequency division
> ratios for the clocks ZTR, ZT, ZS and ZG. It is however not possible to
> use the later when registering a Z clock with the DEF_GEN4_Z() macro.

latter

>
> This change adds support for that by extending the existing practice of
> treating the bit field offsets at multiples of 32 to map to a different
> register. With this new mapping in palace
>
>     bit offset  0 - 31 maps to FRQCRC0
>     bit offset 32 - 63 maps to FRQCRC1
>     bit offset 64 - 95 maps to FRQCRB
>
> The change also adds an error condition to return an error if an unknown
> offset is used.
>
> The KICK bit defined in FRQCRB and already supported covers all three
> registers and no addition to how it is handled are needed.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.19.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

