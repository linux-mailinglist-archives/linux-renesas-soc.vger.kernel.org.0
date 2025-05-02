Return-Path: <linux-renesas-soc+bounces-16648-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ED41FAA7580
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 May 2025 17:03:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DA1C1B60B0B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 May 2025 15:03:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84E132561D6;
	Fri,  2 May 2025 15:03:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4C6255F25;
	Fri,  2 May 2025 15:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746198187; cv=none; b=qaZdizA+JHv3zh8iXRivXEXkO5J5THeYt2QAXdRu9WRkpPxqk4gQN3hGgYKRFpsqKK3kIhIykujmU385yCMPuvgnn516qxjVHExddS+G39QQoQvrU5ETKcUEKQZaxg524Ju6u5GZuC9HOgoeeNVIAKI3SQMf/j/rw3o01beksHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746198187; c=relaxed/simple;
	bh=PqF/BzN5s8knN0oEpWSFpYFeGnQ7MSyAMTmd6TMH3cA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ijOoHUUihdSnmgGeFHAG1VOV18M9BIPYzry7QUCKcTIV7ZNoy6QkN+5IyfZcSRhe0pm71VqbSwfKrcJEgXNrGed0ruTzvrwmt+UJw9jprH3GZUonV5c+tGIiJwVIhNwr0OZ+zoCxXXt678mwcAlt3DS6k0h4doCEEw/RfTH+oKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6ecfbf8fa76so30183046d6.0;
        Fri, 02 May 2025 08:03:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746198184; x=1746802984;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FfHiT403b3FuEoKB3p3EUr4vRETN1k1ZvqINP3I8ArY=;
        b=GeKup0edVtS6FHJ8hkcExOaQNYdxqz2f7SmYslkpQ5HaBUKsbpMLT/8P4r5C9nDqfN
         +GiYhjedcIOZcid/UcAJX2QwFaIUTLzJg21azpMDO1A/naLd1TAGbMuEaJ/6pYKBzE4J
         jGxcx93zrcfHSaSBkaJJv7Bhbofecs/5+mkBcM8nqoDuHmZLK9eHDRocBFP8jBLFGr1t
         j7KrXN/ZoDomR7p8dUme/6/pgEH9phg08OaaQaMoUnX4PLWffqCijBYKfwGPFluGFAfK
         AZWdwKpFUosOzUjE5wfC6r2lZAQP+NTaxffyWcpXZpIJgpXTKxXycATPVgATrKfgRdKh
         lQfg==
X-Forwarded-Encrypted: i=1; AJvYcCV8Fo6vkpjTOfIm8985feRKiOIPXUAfq+vVnFzti2zO6shw05O1HqaSZLBUgqbDtguluCRb9HD9hIMo@vger.kernel.org, AJvYcCVq96qG7alk0LgajtGZobhIl8kur/+8+IRc6oYHraeRTvS0oU7lfiGb4B9lS7a/qJGC3Atdq5lm2Iac86X3IbDRzz4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlEtzgF1YXtXqO4aM6zdyL3xe7IaJPvwLB84o5/Gcip3rQ/FgB
	ZLAWvzavw37O1lhRFpxaiwMnWJxaQxLEz+bD0UUioLguyKhK6j+UczZ4QjVL
X-Gm-Gg: ASbGncsNXqWrnnp/jSxbBQ4pBjXv8VSwrmU9A155V5pbB97KqOACWXUeY0Frvv4mzPU
	y3gdY0fJt57nnBRk401Cm9W0kXgoNcjLTtUwVkroEqYz1g3fToVF86XlDNR5nVyqMgURLA8dG2A
	CfwbX4HlIaN69IuO5Ucey8RxsZNW0zl1BQKy5mKIdjjYdE6B/fV6uLy6b2eonWQsigK+95TwzDo
	euez1/i+kxQ6N/dJ1u0EniMPCnire9+yYXCGrqqIBDVVJdV8O+M6tFGOPXMeUyImO1bJUSCyvtn
	1KYmU3AAeOw2s0xJUPIFIw4O5bUVP7/62sIYj3dK4OMn1OBWvs4gQ0g8dkszboLFdFDdashF9AG
	fQeKc+bU=
X-Google-Smtp-Source: AGHT+IFkJKpWdnXBm33hCzQvoTCaEfgRqgq2GzU1Wj2lGoD3qMQlutLUVzZi0Ls9GnfYmStgGK9wMQ==
X-Received: by 2002:a05:6214:d03:b0:6ef:cc6:953a with SMTP id 6a1803df08f44-6f515276d71mr50792296d6.12.1746198183773;
        Fri, 02 May 2025 08:03:03 -0700 (PDT)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com. [209.85.222.173])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f50f44f5bfsm18967396d6.87.2025.05.02.08.03.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 08:03:03 -0700 (PDT)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7c5ba363f1aso335668485a.0;
        Fri, 02 May 2025 08:03:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW0CXVkLwBVWnFZJeTCMfGv8pd5IH3jfaqeA9Q0QWbUsEUiZ6HSQiuH+h44i22c/hLmETE+ZAVyUALoUnnc+RVG2kE=@vger.kernel.org, AJvYcCWy7GxWZr7hAJ0UunxGbudei8m0Mbq/WIwcNo8ziWG9MtJlVP0iSQovbgF018W7Q6nqJ4Q+xGsZn0Bu@vger.kernel.org
X-Received: by 2002:a05:620a:298c:b0:7c5:49e8:993b with SMTP id
 af79cd13be357-7cad5ba6366mr480281485a.56.1746198183142; Fri, 02 May 2025
 08:03:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424054050.28310-1-biju.das.jz@bp.renesas.com> <20250424054050.28310-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250424054050.28310-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 2 May 2025 17:02:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU=pD42DJwdahVbY77JZm_k49o4yDtgw9d2+bQbB6ZOAg@mail.gmail.com>
X-Gm-Features: ATxdqUFlh0G9IUGMSiK-OpNyJo1rGFMut3W16SOONDm3LW18zPGiDLw7hsgaDng
Message-ID: <CAMuHMdU=pD42DJwdahVbY77JZm_k49o4yDtgw9d2+bQbB6ZOAg@mail.gmail.com>
Subject: Re: [PATCH 2/4] arm64: dts: renesas: r9a07g054: Add GPT support
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 24 Apr 2025 at 07:41, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add GPT support by adding pwm node to RZ/V2L SoC DTSI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

