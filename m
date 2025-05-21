Return-Path: <linux-renesas-soc+bounces-17291-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C65AFABF154
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 May 2025 12:18:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DA153AA0F8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 May 2025 10:18:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C410125A62E;
	Wed, 21 May 2025 10:18:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B02238140;
	Wed, 21 May 2025 10:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747822732; cv=none; b=U1rX3w+C6CfIfYedmfDJ68N5xIvA4ce2VW2oFDQi1OFyebkmnZ0JZDI0pBPKSu8d2Uy5JQHiBOc1B43vhxYr1s4ZffuLOaU0Nm0WxXxkDwanDbCo39dQ7WUHfhUuj8Qb1qijCtCrOo71CW6i05kw+p0uYm6j0f75+3BtjM0CEm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747822732; c=relaxed/simple;
	bh=r9CoflAUxYXDUOO2JEUNsB/MUEXt8MfFYuegXB/j8iE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C/xsMd8vCzmS81qL4cWsyC1t6tBaqNdWkLwc3bzPE9QKc0Wux51dcLoyFofUoFJQVAbyjdaVvZZO1PDlLeU+OmzHGVPsilqJAx1kF8G+99i/cgjPdbCSKDJx3LJhreZWOsCZ+RzIfyJU3nP1Hb/srySO2RcKazXsPV3TakzRXAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-86d6fd581f4so4692857241.1;
        Wed, 21 May 2025 03:18:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747822729; x=1748427529;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Ytsy7YtbepdeG6e77NZ/+LuqX7Z5ZuWk/DMa8Qolio=;
        b=rNE6MR9pf7gbsb3uz1eOSkjYtGSwzWLvydDN1mmlvsZQ+ldzlNDs0rK/HictnXL03V
         UcUcYqGeYD++TSDQ5MWRwaapGjzyW/OF0D1Cci68pzqIKZYGM61+JfST8dkrtc23RTsM
         ha6wQUYE9ANWb0gDnWZjQHFzJIac8cLHwKDw9oRHiKCRUod6Imn0aUvRfoLismaZ7FF4
         fpOE1SulHmGzI6ZmipPBuhoa2yUjK95ZN+8d0asugGcm7hiBDDGpwRbYm+Wa9GhG3wKJ
         oSN5RN4K50vUPHmH95qaMc9SGWIFsedEBftWmLzVE1/I6CkAtr5Yqt7NviHBpoBjgDWT
         HstA==
X-Forwarded-Encrypted: i=1; AJvYcCVA6DoH/E5XCCvi4YKRo0vyW763+KxbAdSHCtrgDKSOtxd2LeDnkBXoYIAjX4pbFCY/Idc3tdrhd8cY@vger.kernel.org, AJvYcCWaEJPYYOwqaarEgE2hoeNYJDu4vamxuiifH16zDhH7n1h5C4AlccDgbil8gyLsBLm9MdFUlJ9Uf4e/pnLK@vger.kernel.org, AJvYcCXwkQJfX80x0rN68pu874zZRxKeBvGBgq2AmYxqqTEnG50ti9jU6z495hgJm90FN0kTShQGK5Z4CljoO/OE5mHa1rw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSHBk+iQafntPDC5Z6ZCtaoYan3ChFtydB4h6eLFv4/KOxJM5S
	jDY4Ooffuh4cFircTn/bbuqMsdne0cJUwWwzhuyZVE+JPsjgq3zc9ZOszML4+hJq
X-Gm-Gg: ASbGncsw1rnVX8TgR7dHPUH8A/jJ6710M8ENbMmRjYh2q20OqpyLPmFXRZLj63DKuUO
	8I+kYACODYmbjNWfWluaFxRfWFxPPIo+kimI9SzRXJkdFJcRl6Wg8HIXbsd1xM8VPHFxZQ5R5ps
	EKUi/REll/sk2aHicDwRaK9pE0KmLPzfshSa5zlVWOOyI4OZGyMh8Y9WNw2NIidbZcgdd0cAIXi
	HdwwfnfSWGnTZ3VnGEs1SGKPXx9KdYrGiwLlY5BNeIpnAasaY0lGI4Hx76lMb4Uq5FMhnroGJGY
	ornoiYsZZbV7TU0C7Gd7lfEXs8jYR6KzMp1RRnI3AYhWfaq0TAuPX96aTU7JqebRv7ArvzoFgBd
	0yXsJzyW8r8TdzoY8XQ==
X-Google-Smtp-Source: AGHT+IFdkIuzTbGT5FjT0LAFeisANUAtwLB5nMO9IaKUvdYZvLp2usyCO9bFJhamt4S5V+6UeEYusw==
X-Received: by 2002:a05:6102:4194:b0:4da:fd05:ab54 with SMTP id ada2fe7eead31-4dfc30f2f59mr21173658137.10.1747822728861;
        Wed, 21 May 2025 03:18:48 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4dfa669860asm9511245137.2.2025.05.21.03.18.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 03:18:48 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-52dbcd398f9so3548747e0c.0;
        Wed, 21 May 2025 03:18:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU7zpQLkgisQ4IQoi6FAwBDvuW6mtQ5/1hbjKYKYKnvCnAEsjTv2xOkh+bTHVuxel5ayQlYBbRWcyiCS6xj8bOfSYs=@vger.kernel.org, AJvYcCUIoaJjinGiQ4UO7mBDWgLmuxWfWC01Hr3rONcoCyBT46eC5H7tI7Iq+5TZFoHqAJ3dyvdH/TSfDmIl@vger.kernel.org, AJvYcCWPHtaVB5WcKkip70VzvBShZIhSXqEMy5F+kD9ciH/wqoipcRftaUOfZe+IUAatVuVaeHhudcfZsBKoxiej@vger.kernel.org
X-Received: by 2002:a05:6122:208d:b0:52d:f0c2:6cf9 with SMTP id
 71dfb90a1353d-52df0c26d50mr8816727e0c.4.1747822728220; Wed, 21 May 2025
 03:18:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513131412.253091-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250513131412.253091-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250513131412.253091-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 21 May 2025 12:18:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUBOADZHuHR3GNgson4O+ka9YrHVKt=qFgB8uYY5F8f5g@mail.gmail.com>
X-Gm-Features: AX0GCFvATDOWCVQPAFr4aEdpERXt91V8WqV6B1CA_r4dJ2GLM8NK4g0Oa7Bsf0w
Message-ID: <CAMuHMdUBOADZHuHR3GNgson4O+ka9YrHVKt=qFgB8uYY5F8f5g@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: renesas: r9a09g057h44-rzv2h-evk:
 Enable GBETH
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 May 2025 at 15:14, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable the GBETH nodes on the RZ/V2H Evaluation Kit.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2->v3:
> - Split adding the PHY nodes into the mdio0/1 nodes.
> - Added Reviewed-by tag from Geert.

Thanks, will queue in renesas-devel for v6.17.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

