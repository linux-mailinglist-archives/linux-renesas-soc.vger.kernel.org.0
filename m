Return-Path: <linux-renesas-soc+bounces-18574-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F203AE143E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Jun 2025 08:52:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF2784A0A90
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Jun 2025 06:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02116224AE1;
	Fri, 20 Jun 2025 06:52:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765632040BF;
	Fri, 20 Jun 2025 06:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750402328; cv=none; b=RXtcZik/i/dSOCRKQeFgrRapbN47G3lRPT4k+AIfv1Yo/TklfjDp5WdSaoCkwuAAw0tDeKfpov0yEle8+jxIDfZO5SVRJn4R5GWRWWxJeP5dbEi4iXVYR0ErDYSzG+art43ti0qkTyvdLgaGNVrubiHP7LbtRlsvpEnPLtr1X/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750402328; c=relaxed/simple;
	bh=HB1KeGkbb/QhHANGhyuWh124ndLIMrXdNp6irGgvQ68=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A8gzxrtykY42sSmRvREooNICCUVdja6AQEXxl8zsHbwcNs8eiYPGshS7b0H3USUujep2I0cFHyAnqAm1xSj5S6z+W1C4Tk/YfR6MYO5gZ6yZemFyS91wM5jnUqZtVZ/HMOjFH/p1+79sWdHDKWve9ZM08GT4PZi2LpKkjiRCBlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-87f4c8e9cdcso369896241.2;
        Thu, 19 Jun 2025 23:52:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750402325; x=1751007125;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gEssu/NXd3Hla7QRE6d+TVGXP6/YrFjxNAC/07Z4Nvk=;
        b=OsFfmSy7jOXi9ySpRfuzjbvxAUA1JLQEacn9FGa7n0YB6Xb9Irp782wq+mp0mRTX4f
         QdHXAJlVWe3hM0A3Wvb7WfVxOXg2gm+6VLgmM8yNn58xGUIznrYfsSW9lcXtfK3zgj4o
         WozSjE7X34VKKhOVfQ331TeBWdi6Q0QiiIM8riI/TAFi8Mq3HRWQ6gQ+LdMx0yIvh5al
         qEPs1wksYQe7cDC98amgGB2Sowh81mTvN714V6LWsZLYZS5/Ikez1T0xIy/RRziHQLBz
         KlyU2ffjMnIzWxaJi7myq07TaGnXjZmWkVPmnnRxuOAUViF9EL2c1HtDaZkGznRZcb0U
         hvzA==
X-Forwarded-Encrypted: i=1; AJvYcCUy0vCBjE463EUB7F2HFh+89o2YKwT25y9QfdmzZKb7lI4vG9Ma3DmzJbb7mpCmL+FeP6FW4qg9paW2HLCk8qj/@vger.kernel.org, AJvYcCV4ZHx8y4fobtT9dmEJzgJo1CqR1wGe4+iQXddPqVaXlxZvTpUFlHMDGqK8/4HO6t5dIRMLlabkXVlwJSmt@vger.kernel.org, AJvYcCWQM5V2g/oW36lXAu4HquFo0AmbNUPkeYKivqPckEOrB+/gbn0jzled5/mxleAUAtFVB0HHtZockqPp+4Rht6inG+k=@vger.kernel.org, AJvYcCXzqSqgr28ut4UmQf7gIhsh9Kh1Lpsy42xyPt/0r3dgyyxG8ul36L4fiePqCpIJjo60SgSf8CJiaGrd@vger.kernel.org
X-Gm-Message-State: AOJu0YwHVs94+UPd587ua/vzPTNhMbkhwmavcKmB1Y8cvFMk2lBOFUAE
	p+VbXG94PkXHmN/ntv0F26pTOgS/78OEVo7C909UTewc0J9V1P7GZ4y0ZwF7p72N
X-Gm-Gg: ASbGncvW533sPXyZZHqy/M8MBXiEBfnZBlJxHQwMpATCvkGbC/Aqs/NoGLRR7F16oec
	itNXqxG9gwGDlU8yzzp77/LKkOJ3aFNIYDmkiwNKfnLcT86237JOyUHj9a59HEs0i7MKxRvyyXd
	dMskfps9Ufnr4hErF28cc3s6bSvKv7Z3o1dqvlvL26Jo3ShMkgadSPjVBUE+GVNjZvhIXWVirKL
	bNO/d8qL+rKW6wJSNQwHyRslVctxJSMOLRJUTBU1h6D1f64d9tTva2gCqj7BB5UE/Eqj65Ikvi5
	6GfAZQ2xH9DQThzj+otbnCgyWvvWQg3OivzcAV/eMnmmG9C1ZZrkN2dYZxGPO1n5On64QeN2SAj
	FSGEkNGq3cmTJbJjqTf3UWzyi
X-Google-Smtp-Source: AGHT+IExxhTLyhj7nqVGH+vczWDqpMJsCNyhgEwTit9Z4iSYj83dLwV8DA7NNa9t27C2U79EfK5e9w==
X-Received: by 2002:a05:6102:94e:b0:4e5:a67d:92a6 with SMTP id ada2fe7eead31-4e9c29785d1mr731165137.14.1750402324574;
        Thu, 19 Jun 2025 23:52:04 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4e9c30b5f8esm183747137.30.2025.06.19.23.52.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 23:52:04 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-87f4c8e9cdcso369887241.2;
        Thu, 19 Jun 2025 23:52:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV/cxs3otlI8PuDxLvveNVZNjXeIyj8bWq0zZNLG1/CFzWr0JRweezYZjSA9HBH8wV/38X+xQkRnLbVNflgcYOx@vger.kernel.org, AJvYcCV2hdQT1xOlSZ1YOA0ny3tZ1SakUVhGGKQyGG3HHvKrFo2hnNoIaeZdFzeRMjvMWi0aOZ2xxt060dfqJ8+jYafaQf0=@vger.kernel.org, AJvYcCV4ua0g4DJyQ7td7NKatHxa5G2+XJ3uFmlFYQxcX4+DTUu0VYqT2C9+35B/eqjczbNr3Vnhjn8XjZeaHn1E@vger.kernel.org, AJvYcCW07RhspsMl8Rcm6cFzl1wfwQuMYAqjW+9tnTeqfvNVPqvWHJ9tNYCoNFZDuuyhJII6KimoIZ/sfiKv@vger.kernel.org
X-Received: by 2002:a05:6102:c4f:b0:4df:8259:eab with SMTP id
 ada2fe7eead31-4e9c2a018f3mr788689137.19.1750402324049; Thu, 19 Jun 2025
 23:52:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250618-add-support-for-meta-clemente-bmc-v1-0-e5ca669ee47b@fii-foxconn.com>
 <20250618-add-support-for-meta-clemente-bmc-v1-1-e5ca669ee47b@fii-foxconn.com>
 <93c91bda-9c2a-4a23-bc35-a46587077621@kernel.org>
In-Reply-To: <93c91bda-9c2a-4a23-bc35-a46587077621@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Jun 2025 08:51:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWDbp+d=o8F4o7Bw+0am7hBFcKsFNjithgZtHx2bvpMHQ@mail.gmail.com>
X-Gm-Features: Ac12FXzy1twp29mefSPbzAxxpzkqUQya2cqJCrjgKLlCdSDLERYoEPvlqbB8GoA
Message-ID: <CAMuHMdWDbp+d=o8F4o7Bw+0am7hBFcKsFNjithgZtHx2bvpMHQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Leo Wang <leo.jt.wang@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Kees Cook <kees@kernel.org>, 
	Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	bruce.jy.hung@fii-foxconn.com, george.kw.lee@fii-foxconn.com, 
	Leo Wang <leo.jt.wang@fii-foxconn.com>, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 20 Jun 2025 at 08:37, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 18/06/2025 11:40, Leo Wang wrote:
> > Document the new compatibles used on Meta Clemente.
> >
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> How v1 with such subject could have been acked?

The "real" v1 looked better ;-)

> Please provide lore links.

https://lore.kernel.org/all/68240d47.170a0220.ba589.0feb@mx.google.com

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

