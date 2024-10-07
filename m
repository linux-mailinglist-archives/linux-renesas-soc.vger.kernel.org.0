Return-Path: <linux-renesas-soc+bounces-9518-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8FA992B34
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 14:12:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A34828437D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 12:12:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A54181D271D;
	Mon,  7 Oct 2024 12:12:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304401D2780;
	Mon,  7 Oct 2024 12:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728303159; cv=none; b=W3sZC7lsCFb1SH1po87KB+vXiEZcyCRmaFLpVC4fQX9RXJpMhpe7ltuF1HsrSl3pEZkRFbXcy1ufqcpu6bnBi+7c/hEIgNTcBjOVqguI+kNEAOtYOtjaaMtHYnNFNK+g6YQJhWDmZAAMAuqovJxS1ewvrEM4wZVQAM3pAX/bJww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728303159; c=relaxed/simple;
	bh=5CWRHOcA5GnHmwmmTZmhgwtmRoH6Ai/9PSwiwW3+DrU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sQE6ir1Nh+3WPlCbPTIz7OtUAaeiEh1ma6LXJOPBMTz/HxRAny+iJDyEJkeFOhpYBER+KVmO2HUPZSRrJ1qyv1dvHNp6S7hpjABuEL2/TFIT4TCxg/uxM1Xy6gYCLPeZBEOaB7nGlV5FaWbr9S79y0qVL1MpCqV0f6NyiUxhQSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6e2e427b07dso10613677b3.1;
        Mon, 07 Oct 2024 05:12:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728303156; x=1728907956;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O548x7LkOCXxr5pNpsbDgoxFwvLLqt54LEaho96jSVo=;
        b=K3QTmBNOumeuecXcwNAkWQGxhS/44AsnBqOXlfqY0413/aZ/DmOkhAdA8Gk07wCF10
         rAeET7zdkZ0oJcxAXH2PkA0P8ozc6jfGIMYsSzug4HgSBtb/9MxUbQEEhZMjV2jHe10q
         qvWLHZ1rasIKH3rIuKDLBdvyDHrOdzlMfGPPt9iaQ08RUjFipIJRLzdWXNbVhUPDDSZk
         u75ZDujhfQbXI1mkUcBiUSWcEJCi1oyV4GpEk0exRswLy1btsC8r/W8BaBMCijw9JSiY
         Y4VCGTua+EIKzCdQa7cXqOq/7/jCNnVYQ3itJM1o+WXJezDR/sjECXctbqnMRsx9S9xY
         H/0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVFOXTQZ9VGc4LJzjxVNlDjYdlL0iP2yl0XJoWLNnfQiVxSdl35qPrfwcuJYjy8+Szu921IPZMnEp1+MCO4Spa11Bs=@vger.kernel.org, AJvYcCW5MBe3T+hdMxq/hGNrCnox5KujN0E3UX2OtruHB+nTrm43L4iPU9sJn6OCiw680NmN6A/+oWKRlldw@vger.kernel.org, AJvYcCW66cRuf7jcy9tXVHC+ZmC1hgB8ydcXKWb7936oygscEysUCuO8FRtewB0kEVsUgkqkBi1L8M6ypBcsUdHb@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4DNQLvBPkmE7Jfc5bzCasmnmwm44YvH4qBx+opTOYiRCWlx1f
	yVDeiyYrb2dpiyh3BhotvbQstAXDhIVcBNCU9dBvPJpPX4rfH3LvBkTF7Y1D
X-Google-Smtp-Source: AGHT+IEX5Ls0q5pYCyK+g6xhG532ioajJMYILGYKkrEaHqqf3ZQRa3KPvLRl0UTJhKBU1JGChQVpzg==
X-Received: by 2002:a05:690c:fc3:b0:6e2:937:8ebb with SMTP id 00721157ae682-6e2ecb69b3bmr27275987b3.3.1728303156504;
        Mon, 07 Oct 2024 05:12:36 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e2d9388d7dsm10161267b3.73.2024.10.07.05.12.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 05:12:36 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6e2e4d16c2fso10679487b3.3;
        Mon, 07 Oct 2024 05:12:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVmGbq+vjIDfJCSVYXJrpR+m4FaeonOpYhlEGZtZ19jcxAIcEeVp1phpSr7lISXiwQsn5LGXBf0qvzhh9OxaDMG4WE=@vger.kernel.org, AJvYcCVwU4CtYvLknDAS8y0hmkBVKWQZkiXPX556N1GNroD8rxD2an59laERrG7+sqrLqg9UVp+a0BqM4MpN@vger.kernel.org, AJvYcCXqDg/ClGMxo46Ou4UAE9TZecQ8UwXp3Udl3Q8aGGCsMkmzIzrafZsrH+UwE7BTp0j0bm/7cIFQc4bHIr7T@vger.kernel.org
X-Received: by 2002:a05:690c:2913:b0:6dd:c474:9cd8 with SMTP id
 00721157ae682-6e2c703c070mr69189967b3.18.1728303155811; Mon, 07 Oct 2024
 05:12:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240927201313.624762-1-sean.anderson@linux.dev> <20240927201313.624762-4-sean.anderson@linux.dev>
In-Reply-To: <20240927201313.624762-4-sean.anderson@linux.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Oct 2024 14:12:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXKujnF2kC+rXkE9aVN6rgVMgg+hefGV-3DQad7TsDmEA@mail.gmail.com>
Message-ID: <CAMuHMdXKujnF2kC+rXkE9aVN6rgVMgg+hefGV-3DQad7TsDmEA@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: beacon: Add SD/OE pin properties
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Adam Ford <aford173@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2024 at 10:13=E2=80=AFPM Sean Anderson <sean.anderson@linux=
.dev> wrote:
> Add SD/OE pin properties to the devicetree so that Linux can configure
> the pin without relying on the OTP. This matches the register
> configuration reported by Adam [1] as well as his analysis of the
> schematic.
>
> [1] https://lore.kernel.org/linux-arm-kernel/CAHCN7x+tcvih1-kmUs8tVLCAk0G=
nj11t0yEZLPWk3UBNyad7Jg@mail.gmail.com/
>
> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.13.

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

