Return-Path: <linux-renesas-soc+bounces-17288-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 310F8ABF038
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 May 2025 11:41:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 459EE3A4499
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 May 2025 09:41:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8010D25394D;
	Wed, 21 May 2025 09:41:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9A923D2A8;
	Wed, 21 May 2025 09:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747820484; cv=none; b=hnfNgzjuQTTOxmAwPojOSoFJTJsjhj3DCznga1UD71AiOClE7jf/lQpJCTM14uBscsljiK0LfCYgf/cZpZ8HwaUo4kbpAsNDNvFPJlbkOXvSoFM2DWRTM76kvfW42u1y8lW6Kk0+LELzh4mRDVuUPsgpevnIzH1kMjKWGHA8SSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747820484; c=relaxed/simple;
	bh=nieQH9oLHk8dbTgLW6wAMm5xYLGLk02T5lwV0Rucwik=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HHUrRwwa7hLBR4Wvl4ViW9t6ZMlZS1yXupYPJIPdpgGzoN9zBDbVWjhLKO+EPct53UhPsUg+WpRtyZbubrCVDnea6/wTL6kdsckTUX7/T6lFXacd0i0ueU8r6NWluNrJtLMWT7KWg/cG0tuTWwy6O6LsDtZnz1LrRMZPSnosNzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-52f036ef186so168081e0c.1;
        Wed, 21 May 2025 02:41:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747820477; x=1748425277;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OaB0IA3+zr2wERNr7EmrktYj7ghphvpxqGOA1ysTqRA=;
        b=BrJcfdf+Y6cbboWx9mBApBNOTmqQmOUH8wdJb83Cn4LDhg0BnM9Qioqj1gUuIHTDX+
         vV7OLrPIHKMzvBKOyyHP+rTgM91rU37CYoA7v7IfRH5V569BXc55HpQQwChlLXgjq5Bc
         MVjgcE4rN1IeHC2+Ot04NCSfVsfYolhsU2VdPe+ijPiUXh74SV9Wj4Wqlo563rt+Sp+G
         bLuypRHRfY00Z/ba1PzDU/f9EN2LWifJo7xL8nd3QSugKtqu6DYEGE6oockzCwTBbXFQ
         pvPQO9BAiS3cNrGOQ2ecE934hLw7dH0TThVhmi5n4+MvWOgg7rh0gUB8jlxQ1jEs1A+X
         FF2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVrpqkL26GAc1FMIH/88zVgLNr7AeS1d5cDbfeweUCZlI8qzyJQ+tEldCcpnt7lu84AX9XoL/GIQFD/omHPX8mRdBY=@vger.kernel.org, AJvYcCXZYI3ATLfaGsT5LTwKti68yM+u2KZ+y9cLg49bJZMSFaz68ns3MwW6YAAnSxm0j6P8QNHtZ9K/sTbs@vger.kernel.org
X-Gm-Message-State: AOJu0YyTl/M0H4CdPfxPFiBxU/d0XX5a+rmzLKpU9ec00ComVxq+W3BB
	xxj4uzRKPCng9A/Wgqk4Pa+plmvu280McZKYOWn5WA9UTwj53Uz/refo8E63DJlJ
X-Gm-Gg: ASbGncsA/kioBY0E+JOiNCn5tkgXVRk1KyGeFei0ah5nJd63A0vxBNQw2A9dzRDceV9
	xpTTu8qSqJ0bnHS/EmM02wgSz/1cIripTBKsU1l1C/vkHZGs1+vxC+lGvcem7cV52Xbi8lL+LcP
	PrUzuancGKdmFYRJnB1Lxn7WW7kTgRQYszj5Eu4sjCxZVqCFFDjnk3PV8iT3C/d7UH5e3EK8Juv
	c1vlN2yhYfm37d2q7OR9u+yIQ42CFRw/XYXvmTFxt8YRBmQmeM1SimukYrSpj10CdzJCny6Nglf
	VymcslI7E50CEJEyLPo95HnaQpTfZXkelLLxF/mMvEaczEoQYnOfHSTQAHQYH02jpdnlOBDl/DL
	88S+buMVXL73l6Q==
X-Google-Smtp-Source: AGHT+IHP+JG1neiHbOauwHW4g9EnCOkDV06s2QZ9Z+61evwgmGQl/wAyk/sNJflHzOytzRCX60+uOw==
X-Received: by 2002:a05:6122:1ac8:b0:52a:78ab:12ad with SMTP id 71dfb90a1353d-52dba65a4afmr15832680e0c.0.1747820477601;
        Wed, 21 May 2025 02:41:17 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52dba91072dsm9873444e0c.8.2025.05.21.02.41.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 02:41:17 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-87bfe95866fso1149335241.1;
        Wed, 21 May 2025 02:41:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWKw/T8NYU6jw1pZXkE0sXjy6Sv7FnXysUcxhCYVMhOAZJNV2EvwjE46ZG6+zGEXdZsJHzbWZnqy0l8@vger.kernel.org, AJvYcCWO1gZFDonhp7+3s7dI586pWht501LdQtaMPhjgRcT2Y3kTCnnO4G29rpASJxHzj0xoIN4y18+4OFIOZvUa66/RwB4=@vger.kernel.org
X-Received: by 2002:a05:6102:504b:b0:4dd:adb6:2a6e with SMTP id
 ada2fe7eead31-4dfa6b8e932mr18395490137.10.1747820476646; Wed, 21 May 2025
 02:41:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250508183109.137721-1-biju.das.jz@bp.renesas.com> <20250508183109.137721-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250508183109.137721-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 21 May 2025 11:41:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW9JyqpmbD0=tQUSJvbD5cvr8vwDEkm7KYbLaHTQZmR8Q@mail.gmail.com>
X-Gm-Features: AX0GCFuDUVuBwI5oMY4VxicgefcSppDD4h1O_8UBCY-4uO4PvyBAacOtDWPF55I
Message-ID: <CAMuHMdW9JyqpmbD0=tQUSJvbD5cvr8vwDEkm7KYbLaHTQZmR8Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a09g047: Add XSPI node
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 8 May 2025 at 20:31, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add xspi node to RZ/G3E ("R9A09G047") SoC DTSI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.17.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

