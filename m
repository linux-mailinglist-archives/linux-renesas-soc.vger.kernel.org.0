Return-Path: <linux-renesas-soc+bounces-18974-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E776AEF8D7
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 14:40:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 385E8482B67
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jul 2025 12:39:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92E992741BC;
	Tue,  1 Jul 2025 12:39:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8D0273D98;
	Tue,  1 Jul 2025 12:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751373574; cv=none; b=LrWeShF0RLESehmHLuf48tA4tahcWmz1sjwQWojHWs6xEdVyo+zmpvzKDIDVFfUzmVb2NctWIEeOpxDXHZRrObGudnCXpIt2j+lowLEJBkE9FG6B97lqTU1uMi5krHzJB49zLDdi/vE8P0y4NxgJ+nNEdrQ8lE4Q//M3AY4SA9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751373574; c=relaxed/simple;
	bh=WnkpxqJlREwalU2kiyF/pRQ2yr/YG9Wcammx70WmMJo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IhB22ShzswbHw7Qnjhwl6f6ubEDA/178dkw9RIDSLGGKyaSiesTKI9QJov1nrfiBFGqs0JgXbobrIRyDN3tKOxL9niNQXc32o2c8ALniAApJnJFUmzGwVuNfEo6miBfv0kEbaHjJf4dMpfrChj2ProwLenXp/fWA7rpRt4US5yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5331f409ed2so938241e0c.2;
        Tue, 01 Jul 2025 05:39:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751373569; x=1751978369;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Huq13UwLgaodxR/+WGRy3SjFc14hPFMLTnsMQNvPPbo=;
        b=da3HlgQzWmZkFTgmaTNk2eKWjU7UUYZ3DWYxMJfgY3EC+HHpZbMEJYXKa+VFrbLlzA
         FdIMB0XC8ZtvYeCvtEukoB22R+USUGzR6O0JsmMAubtWvYz1u6Atpc8laa7ACf7o5jYt
         W0a+V7K9rsaMZW2JErihXuyK2Ct76loXESK2lKZCV2V8mR04Y0wpPwSzQoVNvikrB3Od
         dmaTY3bfA36MsctG10B2L/39Yd/dT7aQqJuofSRGnD9YYcJ8GL0hSV6wCnfOF1PLhDEt
         x8wQGW9cHfcrmJG6QPPpZmyZe823F/SJZ5PX6JKazN0LbzijgkaWokmwpmJmkYrO/BLR
         ujWg==
X-Forwarded-Encrypted: i=1; AJvYcCVpsx2F+Nl4k0bm21F7zs3oFTSrjq5fqim8i1w7clscTt71tXyMBA9MxJvtt0nGa7p6e1BjLjN05wym@vger.kernel.org, AJvYcCXKQHTxlpBu93Su5h8rLQF3QfDk0rMRkSajcSJNjC2CoQLoKhhv2lcLdsDa6+Och20EGO8p+ZPgv3ji6UrZDPsGdrQ=@vger.kernel.org, AJvYcCXdjJQrEIONzDlrNDReno25I8MOAWRgQioA+lKt8vkM+kjq1pEGBXIvGbjKxuNYY+7LxZS3yw15uUpo@vger.kernel.org, AJvYcCXtaj2pSvQU+fTAb0uq5vclr8zqtdQrk5wFiFOfNAS70zV3aET9hlCMTDe7u6KKWnfkZTo/W3mJDzseDS1O@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj03Q4k/ml74Bn6HFLGBuoDbmCBAa59QOrR2ncCaqF28rEDkQW
	AI2mgMo9BWMMvcZccGEodarCaDgYGn/eCD70FTTzuMdt+9IyOieVrXXqs2lKLpBJ
X-Gm-Gg: ASbGncsCVBZS1//ucAIcBsrCFXeAPXPseVD1t5/xsWaRd254AnAlD1e09Z07TFYcvda
	1BQCKb0DwYCs/tJGvL4yQutzQ9ogz/5+bagdOOncCAxmspYxzqc9fLaj/isK+v96XHJ1iMy7DEw
	yYn9p4ynDyPUx7VJuCoYnDIMe8xaWrjxblJ2FI3TESi2eu+J264yij6C/y7dKZCV1sPje2ydej8
	YLOkCCbYoAaBfcaLTqXwoJmN1cX3aqrgQkmQvnxpoCVlu/x4jWG/kuJyIuTGXbQMD2P4ZJkVWf/
	Xeiatu4FUDy6/FbQZKKHax7nmrdE2e6Utg8a+W1uQpUODyvl2obNaITr2g8vrvgJiDZYD5YvCX0
	JzMT2Ugr4nj3Hi0p9ZSkgf3HYOZWe9SdhyTw=
X-Google-Smtp-Source: AGHT+IFNMV0FCDUTA0DvRZQKdipU5w7p+1nVRdGuF5LED+1LYPMSd1kZtMRDGDXEZhsOAdCW+WQAGg==
X-Received: by 2002:a05:6122:200d:b0:520:af9c:c058 with SMTP id 71dfb90a1353d-5330beae9f4mr10520098e0c.5.1751373568599;
        Tue, 01 Jul 2025 05:39:28 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-533091bb60fsm1695342e0c.30.2025.07.01.05.39.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 05:39:28 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-881114808e4so1578106241.3;
        Tue, 01 Jul 2025 05:39:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUM6JiPVe0iHLBUWqnhG28tDPxEWslZ3ZvQQSrDxbtvXhc4mNJAZbHtn7SqrVgtEtmI/tf21zxGP8z52goenov9O9o=@vger.kernel.org, AJvYcCUrr2O6hgFi66xomylteceLhJdjvkzc5JWGUvb8GN2cbx/l7Rr8hh/2FK8d7xaXxexc/2ZSmKBbzXpQ0Moo@vger.kernel.org, AJvYcCVQcJJ1rzVFJBbqzUXxlSsMx/FITxzEYtnOY8aykG+Hfs55IOg56P4F/y477nz7HUCBjcOrGhFK3ymw@vger.kernel.org, AJvYcCWg0/m0yKiWU7cIhFyCCUyic1+dWZL1bUpJ+xo8aELLPlJ6E0Y74H3hGVBPQvbyfm4Eb7Wx3Sp16nrJ@vger.kernel.org
X-Received: by 2002:a05:6102:358d:b0:4df:93e0:fb3 with SMTP id
 ada2fe7eead31-4ee4f82af62mr10256479137.20.1751373567571; Tue, 01 Jul 2025
 05:39:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627204237.214635-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250627204237.214635-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250627204237.214635-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 1 Jul 2025 14:39:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXLzY6Nf2WQ_hrn+m6XOUgDnnFd=-Vyc_UNJYam9aUhFQ@mail.gmail.com>
X-Gm-Features: Ac12FXwu2nPahCRxWcciW4i5WN2yp337r4Z1FywRdBlRnqoGLaDLm9pIIT8nQMU
Message-ID: <CAMuHMdXLzY6Nf2WQ_hrn+m6XOUgDnnFd=-Vyc_UNJYam9aUhFQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] clk: renesas: r9a09g056: Add support for xspi mux
 and divider
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 27 Jun 2025 at 22:42, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> The mux smux2_xspi_clk{0,1} used for selecting spi and spix2 clocks and
> pllcm33_xspi divider to select different clock rates. Add support for
> both.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.17.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

