Return-Path: <linux-renesas-soc+bounces-20634-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFE2B2AAC7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 16:36:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B454B1B66E57
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 14:28:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC5F832277C;
	Mon, 18 Aug 2025 14:19:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DD2183CC3;
	Mon, 18 Aug 2025 14:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755526778; cv=none; b=WSgO2jBbUYKQJXiD2RP9DKoHCJyvYTG/5hN5tiD2drEo7i92do+WsRIdT4e4tB0o/en4jMheuztFQorTDJitpFI1b9PWYJ5u5jyjFKexEM52DBxagXuLEKr1uIz+5MSsmB54QG56uXcZlpAiE7d2wOaAwZb5UOomAd7BWT4LFhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755526778; c=relaxed/simple;
	bh=ESrBPqxtSvV3SYSH5nYTlamKrrdru6Kbea3SG+txnjw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JD6qe5yvK7+xeUTF89/6LGDZ56wcGveLhM4AVz2Xux8sVGZlEKpYSmlyACh4RO97Ps9Uz1BudBDZ+YLquiXbRTyhhoyaO0rY56MCBRUgJT0gCAHxEqzFhRDp2QdKeptvlWx6kNFDs/dQijgS/ulCs1KJZbGj3uGihnPiR+fEN2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-89018fa6f6dso1233710241.1;
        Mon, 18 Aug 2025 07:19:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755526776; x=1756131576;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TSSjmqhZWaZj/G7djCVPw3nP+4ngxEQSa1i85bdz9R8=;
        b=Vpq5kZSmJM8aCo2NmUl6ohQC+6kgRm7QC3IdjU1TKJWBoj91n27xNriwf5hkFBwp0J
         QHeBTv+wu67q8kVF28UZXzXOallBs2EC87MFojIQbGUhQIA5U4oOhZ2ZcyCeWVGwlwlE
         SeKJGDKhckz6EhjrA734caHkXZysSmZ1XZXswDg0E683fRTUSyRNHPOE3xbNXNlumMnl
         k2gJpHch4VOx4e1bOENGqCOyWk6dSqOvzuP//EQlEVDmCfvBeT1UskzLp4GY1Qbtn5ug
         4MS4ykAzvlxWskoA3GWdEYGk0QiouT6PPrgAZyEzJB3iVaLlefH+i3Wp6xbQIp/G3PNH
         udoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUl0yrEIYsizcS5AlaKTdo9zp2Gi7mdtDCY2YYAmtuKtbFHP5W6B35J076r+xSsZ2GTv8vtcF3mfmhxbuetY11bWzg=@vger.kernel.org, AJvYcCW9v9kvos19dQvyGzSIc0Oi+IVGDXaVvz0zsnDLp74a5S0sqzpupKtrv5WocOPVkLeTBBnIrdlGuVOpp6to@vger.kernel.org, AJvYcCX4EUUuX2WTo6nxIdTxwcLzfX4vpltGgWY+28+yiT8p6FLCSM/PlkE5GE+OZX7lX6NEhY//n4RbzwVc@vger.kernel.org
X-Gm-Message-State: AOJu0YyjtNe5DCRgdfFTSDHfVsJ3nfzILAjOXV8si3uj4O95oCAa9Jog
	HZRL6ELkUWoJs9CPuiCYX9KJ5Kw6l2qcXSN0Rc3kc1qSWF83uxbvsPgxVEPmOn0m
X-Gm-Gg: ASbGncsyuagYhZqDZbg/OEve42hvuJPeXJIlsV9gFOSpWdbPcBoWVTTQ3XKGxzkK8d9
	IB6cgLVlwcnitxehAZyQfUUtPOiSqP4iYaaWVbWwPjqXFg7Ku/KRxoGiWhW/pPA9KfrSdAcJLX2
	mUVR3EZY53bc/jVzbmlJoDyk0SOw+ryWXN67yRxNZp7jtbRzVh2/JZks9CxIdiTV1Wk3FgOOK+s
	OwkG7B4DiJBPjfO5l2p8x7VK/rnZaIBeAV9AIj5sbIWhwmDV2a00PRdgyvh1FgnhEvDr2eTAJxU
	he09GaPrQYaRVjx3G0qbMCHXNjs2L+y8dOvAjRdVt2A8GchSHs0BHQNpCFVauWEJtMLJ61ts6UQ
	inXuDbeM2fG7N4JDyh7SyFDIfEuYUSZ+IPE41wrZBXZdt/mI8AloIMmIU8wNO
X-Google-Smtp-Source: AGHT+IE9BHl2rKS2Qzff3xIjEtPATZDLKZY6sdzJzwOn9G59UnJVFLP0/bEwIVgcYONPbMfOijpBEw==
X-Received: by 2002:a05:6102:2596:10b0:4e9:91b2:c74c with SMTP id ada2fe7eead31-5126cd3ab6amr2686465137.14.1755526775906;
        Mon, 18 Aug 2025 07:19:35 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5127cff4717sm2148124137.1.2025.08.18.07.19.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 07:19:35 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-50f88cd722bso1199700137.1;
        Mon, 18 Aug 2025 07:19:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVO0YU/96XFv16/R/iJX8xoQLRSXGYKdK2yMWkAQoPAKqlwzvekC5++VdMED/WBlDCczYpEUMiR5YJD+I8N@vger.kernel.org, AJvYcCVPbqDOs/NqaEgmiTwmata1HpvogYnJHRSpv/Vq9M0/CbTlw8QCOVMTBKgIN7YiXZsgbACBDXsIsKGA87emBN7V0e0=@vger.kernel.org, AJvYcCX41s8+OcsvAELP9Rn0OaPpLYu/CFFIg0Mi+xFjMP59JARYneYJqxRq8WuTw/a5FiqaUd5eYVbKWIN/@vger.kernel.org
X-Received: by 2002:a05:6102:9d6:b0:4f7:d553:3cfa with SMTP id
 ada2fe7eead31-5126b30079amr4376506137.12.1755526775104; Mon, 18 Aug 2025
 07:19:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812200344.3253781-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250812200344.3253781-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250812200344.3253781-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 Aug 2025 16:19:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUqG5-NJG8+8ZjftFxV8axSL=TYnJFE=tS+66XomF7dXQ@mail.gmail.com>
X-Gm-Features: Ac12FXyQnAlM1L7t2_q4FrDfxXQvHY6ysD0DN55y2OOE673c9acoHzcOZNEQsmU
Message-ID: <CAMuHMdUqG5-NJG8+8ZjftFxV8axSL=TYnJFE=tS+66XomF7dXQ@mail.gmail.com>
Subject: Re: [PATCH 10/13] arm64: dts: renesas: rzt2h-evk-common: Enable
 EEPROM on I2C0
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 Aug 2025 at 22:03, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable support for the R1EX24016 EEPROM connected to I2C0 on the
> Renesas RZ/T2H and RZ/N2H Evaluation Kits.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

