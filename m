Return-Path: <linux-renesas-soc+bounces-20761-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BD7B2DBCD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 13:54:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94B701884D45
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 11:54:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1CBE2E5423;
	Wed, 20 Aug 2025 11:54:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7EB1ACED7;
	Wed, 20 Aug 2025 11:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755690841; cv=none; b=AlLCcSAD/1QZCH/i1YsqF5DZWikjxM56GoXsi9CMapZtvFIwhxRw9MLIdHvTCpSU1+KnpLM1O+/04QA5T44+AMf0DtlJb0U5Hnr0yUA9PWj58rKC/9gEJ2HhQXMvp21KfdLGD/kse8xBSGeOC1Z2jKfvel5hMyhlGIn4S5DIGJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755690841; c=relaxed/simple;
	bh=QB2MQQNMFoetjcWtVJa01/TbjbCGv33M0NSGAkUVdDY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jdz1BJqUuMhFK1ndMiJcvHaH84UItnDgoWIBJdOXsVykrBmJpeYU9un8Hr5+3wVKCutSN79ifozjTEjisOw3uwh7ephzPrSB4KvFwVQEjGe0QaO4D8pFooNHCamdtA4gEg4BLDELQUeh+/JCRpkZ80gAkq2NWxXync8oPwGVQaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-53b175498beso2038322e0c.3;
        Wed, 20 Aug 2025 04:53:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755690838; x=1756295638;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m3cC7wTIi41/+V4NnXvdgtBZ4b3AkkW1EoT+UJ7kYNI=;
        b=jb5c2RRAUAiMdPfW1mQCsh7t9Hhu3zAPnYd5lIZ+aZfKUTnpEAhqMVy/6Idf2qvo+U
         htONKwsPzUAyTRN0Y+Sn/XCck8c5Zwf3HUia0ShVu7nhsmDMjdCCU+wXM7fZnRDHCaIp
         iOYqBfGL8hVPZSRFFS7MJ5pBVwIyNVzkZshWfVM8Dq9K7SQMSQyfiRXbLivmrXrIrxCV
         JWIhPzY3rpfw3MNeBqbqmgpYW5jQBv4Siu4IXCGP0AerUJbT4k9TQGdnSV64bkO2X3DL
         FF/50JelLcPFHEbEmKGQP+n+PgWCWrdj9x1iyVv7fNqWlgOzDAHPpccWB/4+HO+8Cf8S
         jdPg==
X-Forwarded-Encrypted: i=1; AJvYcCV0capFRkvrRYQaMzUfMSmaoCUWtW4TXSVYl3EghOaT440sSHmbPGvup2bB7CCDWxikEmj+Zn89vHHc@vger.kernel.org, AJvYcCVNb6p7rTgIjBTAvHMbh9cfsB8kWTwPq3IMoaNMQSPt9qBuit5UYnaILgd7oOahfX6hj6xxwuJoFtYCd3/HLQopu4E=@vger.kernel.org, AJvYcCWx4FKcAPGxVvAliakvlvp5LjTTE8mNuXOBWTDlTcm1zhzyRrklLtCvTZ0YGMoR64x1npgCqh+3Pj0z3ws=@vger.kernel.org
X-Gm-Message-State: AOJu0YxR2hYS4jT9VokknkP64QxxR6mhAJsqQguhkLz7zalU3muydomX
	hkVl3ra1ogV5H9yFtrOMOXnF0buEiWLYVh306/qn19Ky2G6lPJiF4WnTN/2ywvk6
X-Gm-Gg: ASbGncs8PD7AgLn8YHjOtGbIeWq2J1j9iPIvXrSl/gLP5Cej3MJy2ZkEOJN81yykcxF
	K1kPe98dfWbYuFmI7s/COPphNHVAPj/0OB6XsgohHZ4TxX6f3hsMmWzuysLIUPXJs8xEq/ZS9KO
	Atq8BBcDBsE2CiZaAlDYsB6NDFOntRMdkuCLZ7qtNlTLyqyn4cEVZtuMpvvueUuPeptR7Huak2U
	ShZPmBtb0e4sos2O2gC04Gip1yrkKzcFGbVF2BnGIQZZa+d7hJlcHQVjZ1HqSXlC3pop5ovT9p6
	pSsLRDROl/EXZu7bcVCrF0pC14bgk8yU15yceILKeA/JmwOLIt/5LolykJ9j+y6iP0w2VjkLC4P
	C6Kt30RgTSHpKnZhtSG36LDausHJ15FW1fRuAXz5yGQhFoVM5fqDZM3eFGG4y
X-Google-Smtp-Source: AGHT+IHMJyUY1FE8eduW+KGDPzAoJndiJKgiMe2Q9+9Q34rmkDoRgfPsZ5ToKmlm1zIOjhnzBBZBWA==
X-Received: by 2002:a05:6122:319f:b0:539:3b3c:617a with SMTP id 71dfb90a1353d-53c6d60edacmr747604e0c.8.1755690837665;
        Wed, 20 Aug 2025 04:53:57 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53b2beff365sm3141144e0c.23.2025.08.20.04.53.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Aug 2025 04:53:57 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-50f88cd722bso1909834137.1;
        Wed, 20 Aug 2025 04:53:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV2XVIVI6ERWjLAIyFhAD9TqTQ0/rg93LwfViwYDxMm4nKjAtT4RVw0vzjvkuEd8HgddilPzpxH2xQpIPM=@vger.kernel.org, AJvYcCWvCaUBAJXjD0UV06ig8Mw0ozFrYai/wlDqSFWKtIKYvRfgGSySLGVj+fQ2moCouM1BazgT5uBnq8MCqmG4k/dBkic=@vger.kernel.org, AJvYcCXXM/CyBpNRWP5hjcLbNDr+YCrMHGS55XmWZ3zSnEDleBCmy83nSGYwbDMOf1G6JS2vLc00oNHY2LZ+@vger.kernel.org
X-Received: by 2002:a05:6102:290e:b0:518:9c6a:2c03 with SMTP id
 ada2fe7eead31-51a52a18e04mr605179137.30.1755690836961; Wed, 20 Aug 2025
 04:53:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250820104808.94562-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250820104808.94562-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 20 Aug 2025 13:53:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWeB2z6eax8gm2oO_X35Qm0+cg8NjoFutWMdfHKW-1DBQ@mail.gmail.com>
X-Gm-Features: Ac12FXy_1UNUF7-0Y5wL5N-u8MrFdhGcL9qUsuwrmyT27ZsRX-Q_yUiNcVYzW1o
Message-ID: <CAMuHMdWeB2z6eax8gm2oO_X35Qm0+cg8NjoFutWMdfHKW-1DBQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: host: renesas_sdhi: Replace magic number '0xff' in renesas_sdhi_set_clock()
To: Biju <biju.das.au@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-mmc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 20 Aug 2025 at 12:48, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Replace the magic number '0xff' with CLK_CTL_DIV_MASK macro for finding
> actual clock in renesas_sdhi_set_clock().
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

