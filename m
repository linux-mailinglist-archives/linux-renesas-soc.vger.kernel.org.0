Return-Path: <linux-renesas-soc+bounces-17352-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F330AC084E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 11:16:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46C053AE498
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 09:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D68AE1E0DE3;
	Thu, 22 May 2025 09:16:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBAAC2EF;
	Thu, 22 May 2025 09:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747905406; cv=none; b=aYyNrre98B3l+e7ms2Qan+gVI4GuJFiG/97EQwHWdubP+QN8ylU7Zs1lAxlN52egQwiavhoSyysdYoWySzcfZv/ILtW26rKuW5M2Is++e1Z77ipHhrgO8Am8pp3CWOgpshFrApy1jLi8lgykTu/oenmfix5lIGCRHGnUroAKq8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747905406; c=relaxed/simple;
	bh=f2eIgSzEwuYzSA+vJKXDPZGO/VSCfw1OOoEgGm1rq/w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=orkkE1C1qTxI2ZaOmp/WUDPUUSAeI6XZUhvO2Ne7jr2q7rY2WXrZ3pEz07/HZKWFlprrSE0H74LDX3eF41SyeswiHHRL3DhZuswIvt/Bh96Pq8ac2cAhpqqDgSvl5T6KgxOLG5cMl90eXpdLL3G7fTVPF4oXFYwdmhJBvsmMr58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-52dc131419cso1729163e0c.2;
        Thu, 22 May 2025 02:16:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747905403; x=1748510203;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OSe7s6xt5K8/QWVzcZ7GenJrUuinS12GC0gJUhp9QMM=;
        b=N7ec6Snofc4ps8QrvxmGe+AYN9B08HOZRBVNFyXRMSRCSMKvPH4FyBSDGwL5gnF+dp
         JWOqNBwX5DqR/HcEoaR0nOpxzXjKOY33JKZN7OuotrN7V+b0Zfnszzk2mbbSatNACx6g
         eysCKKxop9Qj0UjW5OhXkNlb9C+3jNImSD5Flq3+tNnaMyknbpuZ9trPSZXfI9BYESPz
         SLXq0LqdQStMlRFzMq7l6fqQdQBlrER3HQB/Wkpc7HPfT8uCzWJiLlukHa/PLJYWIkax
         vgYd73phYRE65BVC6SUvaD9/M8iSWMWN7QGfz6kBToNh8uPwG3Xuxok+4NQvavIdHnjA
         Qldw==
X-Forwarded-Encrypted: i=1; AJvYcCUHpEOUDdri1P1U/e7tby1lbf3eZzl/jjMGUieayV0/esw1ebAO1E6TqPeTzl4FO17pGyZOxztjwANFF9ze8vRbzqI=@vger.kernel.org, AJvYcCUIRek9Rbb9TUpphyvQA00CehdUqlExB7i/7KtdVp3ochBtSIZYKOJ2KOs4eHeI26OAOFXT1ceu6aTpLXPm@vger.kernel.org, AJvYcCWdEavvgKoZBREZpWioIiu+JPW1Bs5BuRRtCx/sNAiA0cScvZeTgdjRarmikI7KxtqD6KO9Vd7kRUzh@vger.kernel.org
X-Gm-Message-State: AOJu0YzE+orMze8x0PJb16bTKID1jwlcA6vmPo9NgOfc3FDRWgu+4RSb
	HJ9hDyqb0HHuU9ynJBJ1o2+SMJKqiZ18XxVTdPX4wSA+nwBHNGTJLQNNv+JSNKp4
X-Gm-Gg: ASbGncuMENdtXmxLLUHW2HZEOy2xBp9ahxRFqMOQH4q/nEvU6o2Gqymxo9QzuG8NWWC
	3CDBvmG0kcJMSIA8QcvM+C/hYoeeFkNwHn+1DnGPduyYf867lvQ4ESwt1uVt4ZvCCLE63LH/HH6
	YxZN2foQCnGkQUTt9tn775SGeawODllnAiVVhMh4KsRAhdpKY6LaXpb4X2PT6y1C+cpmfqPXNQ+
	gMUSeyLYW/Ghma5iLmXwODku5hBS7Y6mutyibNy7bMQ7u3mVmZZfXF6+jQB8r1kSNYcKYeCduXI
	mGaa14F3JZBXBtMOIB+0SkhZ/7oU16O5OrehyIm6ufwq8XILfz/whTH36QHhgIqYPdiyZKrGass
	3deC7QR9WzYghyQ==
X-Google-Smtp-Source: AGHT+IE594Wk6W/5olc5PDuQjx01U4EoXNNhv4Pq7+/pnlLHrELGnzlX/6TNIlqO36L0r1cHzcpPPA==
X-Received: by 2002:a05:6122:a1f:b0:527:8771:2d39 with SMTP id 71dfb90a1353d-52dbcd6d66dmr19824975e0c.7.1747905403230;
        Thu, 22 May 2025 02:16:43 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52dbab4ebddsm11448377e0c.33.2025.05.22.02.16.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 02:16:42 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-87c04aeef0fso1141500241.1;
        Thu, 22 May 2025 02:16:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCULzBnRVoUsswoeYNtOjWIFbJt4oOUuIuDW5GArn1NV4+4uzqFiviaYNZF9bB0PzN4UZ9obmKNQ4Azt@vger.kernel.org, AJvYcCVC4/n7jdK2TYMPEm2v13b8uD4rigBCdWmkfvE7cHvhP6yDE8C6ovgQY4/57XTy7vv+zkPx9b0rF1+ofLxh@vger.kernel.org, AJvYcCVbJfDF2To4vaD510kiiUeRkuMIYDYsSY/oiYJEG7fHpvj5XOCN6aFf6QyALPW0v0rV9OXfB1AwYiqkn09s3pIoc2M=@vger.kernel.org
X-Received: by 2002:a05:6102:b06:b0:4e2:aafe:1bb7 with SMTP id
 ada2fe7eead31-4e2aafe1e8dmr8135523137.15.1747905402635; Thu, 22 May 2025
 02:16:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514101528.41663-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250514101528.41663-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250514101528.41663-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 May 2025 11:16:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVGcjWnEEb8oCSCmi3eGOkZBMmNvsq+tu2FcjcpJGRc6Q@mail.gmail.com>
X-Gm-Features: AX0GCFvXG5Awa1vlCUPjiuMI4UIJjluAp_IrRziekNQqTvZQGnGuAKP65rKmwG8
Message-ID: <CAMuHMdVGcjWnEEb8oCSCmi3eGOkZBMmNvsq+tu2FcjcpJGRc6Q@mail.gmail.com>
Subject: Re: [PATCH 03/10] arm64: dts: renesas: r9a09g056: Add OSTM0-OSTM7 nodes
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 May 2025 at 12:15, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add OSTM0-OSTM7 nodes to RZ/V2N ("R9A09G056") SoC DTSI.
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

