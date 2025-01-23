Return-Path: <linux-renesas-soc+bounces-12402-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 923FAA1A71F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 16:31:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B6F83A195E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 15:31:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52DDA26296;
	Thu, 23 Jan 2025 15:31:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8910F4F1;
	Thu, 23 Jan 2025 15:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737646291; cv=none; b=hj3dwBkaPwuaUUGklf67YrdD4C3nmSCzhFDzoixsEAcmTgyO0sbZ+89uXvROv1StfwMo1H+tfqb3iE7ICfELvwRu4WJCzA5BmwxxxE9VqGSldWareg8W6vFYUIQmmk9cQB2C3a2Ur042bBL1eiog2LA7/sT58bMCbKen2Dx3ICM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737646291; c=relaxed/simple;
	bh=aUHqA3qVM4oyESyuzgwA2vDk09wsxFGkh+egtjkSTws=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BQ5QUeZZ5IBhCN4lAmQJ837XmmulmLl/DGbGtXISCzfDdEt/3uhZpWEMaqRoQ01qjlPiZzEEdnPLRi96SDcNZ+8u3vTE1PNDrQpF6u0AuVmIX9fygWwMoKSVLqiF9f1LMs88oJZWJYzU+ttAJso/G8YvPzqoUrqkHfdBMD28gb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-46e28597955so10093851cf.0;
        Thu, 23 Jan 2025 07:31:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737646288; x=1738251088;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mZUI524BMDsbhp2lZJc1Rdx4zR0WktzD1HMi2A/r9Eg=;
        b=HZazOXTleVjENDBNKoM7NZr2+mZZNa3gERHtGJcylYLvZwZm4GBIw+H4ILBcpWHUPf
         bWoOzGMiAFJq6Ho3bu4CptKOnZz5QNKvCk0RQCHESdY82mcqoedj0eYLCBAm6pT7Gyd+
         D7/oy8K0keUyFFhWS5kCf2IVXlYt6rOWwMth59WCs7J21a8Anpe7G+B8lJIWRPebGgAI
         Xo4S85p9Uak4hoRByxTkvNEQHwEQ6TWAk4q1pp57odl7wXhCS6sRR+QjZ4jpBXtenujD
         Xq19mlQaNJdZ/sr/E9/0Q2JHiVU3YbN7TwVdiHXmvX52KaHzn8PoITttsOL551GVK3Ou
         bgrA==
X-Forwarded-Encrypted: i=1; AJvYcCVTeS0mdj31SyZqvLUc60qsx+/r3txkWafwXwiydDcAWHzW6lYYjyZCYlfBIyQNUNPFNTOYyarSrzPB@vger.kernel.org, AJvYcCVuUDNrCfufui0fQbIMuGCkp6fWOeehF7dgvr0osTQM7BVBiZNUkWz3rhCetg2Wckm8t0DteYL9iM+evp6lHTEeQnI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2eC1e8UiO9GPCaTRH0zxyuKtPMQRSr3IJrzzP81GdqrYm8MzB
	/8TnazQzJUeSspX2Owt3+GBHj0IKlmy88dPALqHFK2IYKGiURzwPLe1Pv3OP
X-Gm-Gg: ASbGncv1sz2O6OIW7GWY+hK2oQ8SAcT6DBKROrcc5+W18c37vUkAaplUv8UBrMFv8/d
	P/7M5vF+w00CpFMNU5TW/Ene37nbJGlap4JApJNu4+QAvDqQY5Y68DFiX7A2WMR4FyRh+dfvXCC
	1c4w93JpOnSgCEFtg30V2/gted6lOv0nYnfnvnt6mm8XdarFEKGYoRdNEdZxL6AklBuHr5vP4dU
	8FOanzrBYgVNylymoVPXf8+IIYi9iZjPKnhG3EPWl4U+cNsLUn4DFjWNoMd+UCkcKACGZAL4Pqb
	MJDWBfv5iljV37NFIb/wE350akVLR1d6vNUU+a3DFfjJqyM=
X-Google-Smtp-Source: AGHT+IFRFls2nh8ekz93qdV5owi9w8fU+ugQak6PxW99o4Eenn2c457a/3JQ8GivOIJUb43byWTq4A==
X-Received: by 2002:a05:622a:1496:b0:467:5e1c:1ab6 with SMTP id d75a77b69052e-46e12a96f4emr279927221cf.24.1737646288322;
        Thu, 23 Jan 2025 07:31:28 -0800 (PST)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com. [209.85.160.172])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46e102ec6cfsm75817251cf.3.2025.01.23.07.31.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 07:31:28 -0800 (PST)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4678664e22fso8993721cf.2;
        Thu, 23 Jan 2025 07:31:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU8ORiT5MCIj0v+BwlBUptV3giWeTO8djtZqLZDKsVxVXJGhIiRpWg/t630wzhrr5pyu3wOMFTg/IfD@vger.kernel.org, AJvYcCUswYcvI1SfsWO9EycJ82MMEKGc74TB8Swy4F6xfEPULFD4CHLDsBE3jHq2vYy4gszRos5kTAiMBc+iYaFVUeQlhnE=@vger.kernel.org
X-Received: by 2002:ac8:5a53:0:b0:467:4fc5:9d72 with SMTP id
 d75a77b69052e-46e12b6895dmr364176431cf.36.1737646287889; Thu, 23 Jan 2025
 07:31:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250118111344.361617-1-marek.vasut+renesas@mailbox.org> <20250118111344.361617-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250118111344.361617-5-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Jan 2025 16:31:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV_H-BqZDQt5ZRnbWBZGAaMsgqjT_FM545yx1U=CozHRQ@mail.gmail.com>
X-Gm-Features: AWEUYZlLlmIIKqicmA67WvcT46tS9dqaX8h6RS73T-ArCQYC0Th4xFZmrNVXGh0
Message-ID: <CAMuHMdV_H-BqZDQt5ZRnbWBZGAaMsgqjT_FM545yx1U=CozHRQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] arm64: dts: renesas: s4sk: Fix ethernet0 alias for rswitch
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 18, 2025 at 12:14=E2=80=AFPM Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Each rswitch port TSNn has a dedicated MAC address assigned to it,
> so does AVB MAC. The MAC addresses for each rswitch port and AVB,
> four in total, are stored in the FPGA populated on the board and
> can be read out via I2C from bus i2c@e66e0000 address 0x70 offsets
> 0x58 for AVB and 0x60, 0x68, 0x70 for TSNn .
>
> There is no single MAC address assigned to the rswitch itself, there
> are three of them, one for each rswitch port. Instead of ethernet0
> alias for rswitch itself, describe alias ethernet0, ethernet1 for
> each enabled rswitch port. This allows U-Boot to insert MAC addresses
> from its environment variables ethaddr/eth1addr/eth2addr into each
> rswitch port nodes, so Linux can read and use one unique MAC address
> for each rswitch port.
>
> Note that it is unlikely this would break existing rswitch driver
> operation in the Linux kernel, because as of right now, the rswitch
> driver already calls of_get_ethdev_address() for each port to read
> out the MAC address out of each rswitch port DT node, and if that is
> missing, it falls back to MAC address settings read from the hardware
> itself, and if that also fails, it uses random MAC address.
>
> Fixes: 412f2224b3b6 ("arm64: dts: renesas: s4sk: Fix ethernet0 alias")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.15.

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

