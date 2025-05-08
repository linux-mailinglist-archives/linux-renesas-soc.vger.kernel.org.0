Return-Path: <linux-renesas-soc+bounces-16786-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DC6AAF4E0
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 09:43:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 349E84E104B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 07:43:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 782CB221D85;
	Thu,  8 May 2025 07:43:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA8B195FE8;
	Thu,  8 May 2025 07:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746690201; cv=none; b=WAAGZahRxMcmRsZv1ONGp4fn88DEP8lBfMZ8le7RGpSB5pvW+a2c07uhegnk3hx/UWDMwqYVhhXbai8GVXqWxK2MFR4F4yPqNuK3r8AL2KlylHjrmZCeFjT7K2p/OwA3583WlfBgpJBWOckVH/nT7TBIu5cZwY1Fl0VKphS8BUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746690201; c=relaxed/simple;
	bh=Ym+Lkz4dVd8U8c1KC8lpqlMzy5nIzSo6HU+Kw5o5UVU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dsKV56W8PebpGUD3qUHz/gNN/AUoouZOUeejFBrzgecTm0Bo9Vqnn4nFrXFL8e6Dse4Ui30N4UY8zDWczhEvWpxdQmgBCTI1EhfkCeVh+aov8+EwUujfQF/Rga66SCF2hgV26i/ubZy1SPeHGoe2EsD5b3tgk7jChREh8qEwclY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-523ffbe0dbcso594546e0c.0;
        Thu, 08 May 2025 00:43:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746690197; x=1747294997;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D1mZPJi/TC7bkF9tYWR7m5qAV1sln0wgKCmrPsKpu/U=;
        b=FpHc6Chxj4HflWa9YozHX6jsauPO9ADfXJNNUeq7xmvU5ebZ+WHPGcGljjWzj63b6r
         yIgbS0PKMMUlTpZkqWdEKiaGucMQJYyTmh21A3vSgAwdgkn1j/OFdxMJwPAiSfAMW7AM
         I9yLokxeNN0PD6MJXeYmr0m5Hr0CS0K0wMth+TqDrpo7p0Mfj2ZEr+R5ADINTkOUxqRD
         5uBsj1PDwnolIZ5zvI3P0qQg6FkU51NWQPAwc+Fh6SH4PSOSZn7XnQMztpwRhciFDsvK
         z0gRJVfbOa8ii0v162q9wXyvEyBS+Q0fkvbH6L149NSD+KEqTV/uoH679E2FbO2JEo2I
         yF3g==
X-Forwarded-Encrypted: i=1; AJvYcCUSwoAF70fb2/j9pSVzn0W2epYP14S38rUd5T9wZrcTSZzIhK8tFB3TOxwQ7B7QeG9g17WXW1TWVn8YWLck@vger.kernel.org, AJvYcCUwyRQXTH0ZKRHW9p3ToRHYCiLVml21OVvyNb/bclBtXHnGi6ZeR/U9XXY40vgBMisQl34VGwBB@vger.kernel.org, AJvYcCV6C16ubE3QFM8L1ezR9P751hF7QE5+zX9Q4L5OTBTgiMwXglJzAl9VIDaz3lMe8scZg5jjrYwa5iMIoUanUJXhBOI=@vger.kernel.org, AJvYcCVeb2+q4JUpwJKYXUS1gcRcXi6bheV9zTxgo27LaKHyAb7F9CbCUaISM/JjW1dPPHKZN8jiMRB9hUJN@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2yxIWzGHUzhAbg0jY2GdBtpKtmsBw0TZ+QXbMjDl+BgHCTJmk
	lJmQgnOAdhF5hc878zjo69U91ku2dVLWuXZNG9FSikzB/3bPnQzuFw/YDM9T
X-Gm-Gg: ASbGncsJfUkNFq0ZdjQm0x3r6blxmRByNhDLRAIumifH915WzjpikR4P7gfYdBzv06e
	7mb+prBNvHSVgOuygM1uRDdZq+KFSnzQ0REpsTbzoKFAcsAIKz7h5zXLvsnWcWYJIgaPds9MmxG
	kW2wHickaKXNbWEI655oQVL9qUpGuu7Mq3G+G4wkT2H63dFDm+8tPTdASxlzACQEk82C/CIVABJ
	aEMSTFtyQVdBUhF2GcSvU/11Wnhzjh6bcTT6uxBzJx8GUgrIctKXwnXTpta4CCrhgU6pRaG9fV/
	+YjKihvpWgTBollNrN1wiCFIiUBNbNmJUL9Fxi5a9lTtN2VEr5+LvLJ7HTD4iS0kNHFX5RNx2Rf
	jL1E=
X-Google-Smtp-Source: AGHT+IFuNabeBCcYQ+k8DwvRGbG1CP7k3GBFsUA8uOozojZOERjbyOPYyKnT9LNty+fvxibMuH7RuA==
X-Received: by 2002:a05:6122:3290:b0:523:e2bd:b937 with SMTP id 71dfb90a1353d-52c379c81efmr5047428e0c.3.1746690196861;
        Thu, 08 May 2025 00:43:16 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52ae401eecasm2886570e0c.19.2025.05.08.00.43.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 00:43:16 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-879467794efso382550241.3;
        Thu, 08 May 2025 00:43:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU7Vz1XAGrQv1uJDBQmuiC+8a4zmH2UIM5iYRqAiqSmgjG//hIGjrNJlDTlG8VPIxugygkNC55c4Fzc@vger.kernel.org, AJvYcCUCrZGYzpLmeT1xCqoxvrLsHzxOfFQiZ+KQwnb5n/7cS4afQuYDsrZP/aYboouZW+xLNo67KLzoWA5eN3pj@vger.kernel.org, AJvYcCWRWTNNKXwJqoadXi1otI7kHhGGXQQsaJf8SkBKePL7r0YwUmoincc6uslhG9RtFVsZqq1VVI1k@vger.kernel.org, AJvYcCXVHv3uje+4W2k0V0UDdXM5FiCvEMmwCny94d5HH5EdgNFUQxpzKuYksAifTbkKwYXtEWWgVjiDfP1A5J9Q4t+psU4=@vger.kernel.org
X-Received: by 2002:a05:6102:334e:b0:4bb:623:e1f7 with SMTP id
 ada2fe7eead31-4dc738955famr4431871137.16.1746690195810; Thu, 08 May 2025
 00:43:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507173551.100280-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250507173551.100280-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 May 2025 09:43:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXDZhmo3n69rOxffkBfBTv4LCK+kSrxHsEPNXwvK4qWYQ@mail.gmail.com>
X-Gm-Features: ATxdqUFoas8aJgrUByAlkGW74O02u3sZ5ocQGbHP-j-KPDbz6l1iLg3pGEPVMKU
Message-ID: <CAMuHMdXDZhmo3n69rOxffkBfBTv4LCK+kSrxHsEPNXwvK4qWYQ@mail.gmail.com>
Subject: Re: [PATCH net-next] dt-bindings: net: renesas-gbeth: Add support for
 RZ/V2N (R9A09G056) SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 7 May 2025 at 19:35, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Document support for the GBETH IP found on the Renesas RZ/V2N (R9A09G056)
> SoC. The GBETH controller on the RZ/V2N SoC is functionally identical to
> the one found on the RZ/V2H(P) (R9A09G057) SoC, so `renesas,rzv2h-gbeth`
> will be used as a fallback compatible.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

LGTM (limited info in the hardware docs due to censoring)
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

