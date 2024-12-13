Return-Path: <linux-renesas-soc+bounces-11298-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6F89F110C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2024 16:34:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 24F4F1882474
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2024 15:34:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFBB31E0E01;
	Fri, 13 Dec 2024 15:34:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2FF1DFDB8;
	Fri, 13 Dec 2024 15:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734104065; cv=none; b=ZyxnnpgfpmwGCZup7rvcdM/YsHA81pOD/7HHY3FS+Lx05Pe41okkBeBv4+jZANCltENLt/PogrxpNYpLlDbK3cgmE01gnEFVFLfpCQ/ZKRwG1X+DolQCXkwaJ2DXq+e65P0rMuV+oxh+szNVfjlbtdV/k50QkK8PRXHQcu6FEVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734104065; c=relaxed/simple;
	bh=I1cJOaZjxKYyMOm5tCTy96QV79jQ+wyWiN2BTgcAOo0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rEaGNwqaka8p53VhZjKc6LToKmtVp1dnGs7KQPDMsB9EPnffKgO+zpH1ccm2EtL2L/ydd8qJqH18qqdMP5luNKeE48IULseN/w3N4e8W+JxtBD0aHpbqQGpNJyFEpDYwEHfKM6rVuxDVWvXbK2cU0PLO4SYTT4EKTVTBlaN2tn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4679ea3b13bso11750601cf.1;
        Fri, 13 Dec 2024 07:34:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734104062; x=1734708862;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wYQD7Y038QWG3QSWn5m3SGLn0h9q1zA7lUzCE5go1s4=;
        b=jjxITFvSYiwxxPhCKSRDsGGh2hAiA+K7HU3n1Zl0xebgT9HJp8jMGndrd5sw23xjcK
         eckY59IXRtW9LcJubItSQY8OzfumUWqLwIXMPCUjiqrIHI8iHEkb281aOiQLsIFStEOr
         LxQqYcgS/NFPuaMQ2oOWBUrdjjQ/qrr7QmcBrBmBpFeRdcwyunk65txriX8Puojk1TVL
         //0aFeh6b6Nlr8vEMb7t55iNrdQokB1DtuL11IsjqpLfCOIJsYeAxSV5OQ73llZXT2Ik
         DhpuN0wea9Ea+JmwRYNlO+9N7NW212wD+6uThzjSLngC7HKNjHhOHUqon20u7z1erHeY
         /Icw==
X-Forwarded-Encrypted: i=1; AJvYcCVxS9mQ2MIxGdK2XCQ9UAjka2Xhrw3npxoJISrzxJ5WJnQtjbK6Raab+FlxDb1prBgg7butMAjB+6orDFwwoPHCDHU=@vger.kernel.org, AJvYcCWuy/kuOK27yLEkySddbs8eYwQi8UAmCDYit9F9vxUjAdWZ7P6QTjwDWN8NGi/zUMEhMXLu0Q1CNmZt@vger.kernel.org
X-Gm-Message-State: AOJu0YzeDlJWlR3MqzS/IW7W6IVujo+OQYSIdfSQHtzjDzb0llpIW6d7
	SxNaI9kWu0wKZt5do7VyZf9FL+aDY36OyPlBrlQ+gGB8GuMgTfJ95CqtZksd
X-Gm-Gg: ASbGncs4CbapTwxQHnzMN9aseefvP+HULjon8F8cEPUw37RQOVVd6D4VzmrIZZ0irYd
	NqKoZWXwWf6zgNGGr99rS6TTydqOF87+tUPfydM8qu9tBZ7yU5WgeCWGpBK5g7mK3C3Lyc/SOMz
	F8CFIt9siJhNeKfJhO/JUkqf3vj+EveKmFrDx3LRvIOMAo1fegH/61kgrDJXkSsvhsbORMQa05a
	dG7nR9RrhlEwFFpqLI6LWbzTPb6up+biYhcfGS91pYOdVOMvQTjk7ky4vCdpJFMtcbD/Z+WNUD3
	UHcvBljItj/xjMfQtndCKz4=
X-Google-Smtp-Source: AGHT+IG/hrIRsa4bQ64dyZOj2ixadgqxGhlYX1OPG/4ayFnI4zpStVR0F+SK7ZroOODqoswBH4GWGw==
X-Received: by 2002:a05:622a:251:b0:466:b2c9:fb00 with SMTP id d75a77b69052e-467a5719488mr47944301cf.3.1734104061928;
        Fri, 13 Dec 2024 07:34:21 -0800 (PST)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com. [209.85.222.178])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4678d59b867sm28258401cf.58.2024.12.13.07.34.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 07:34:21 -0800 (PST)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7b6e9586b82so140076885a.1;
        Fri, 13 Dec 2024 07:34:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUFOOWTVUqsIPjEEmN48eOn3Z7q4h7YdGYtT4Mm2c1zU8sqgRBUUxKhQxhoi7SPOhlu706S0X5GocZd@vger.kernel.org, AJvYcCVG1Ol+E96iC8v+j1o51Cn7hwpyBCa0PGFq092I+pe0de2bLzSDXg4TwOdIl4K9Fsx3/NgpRl5DDW5Zi1guaGUMpC0=@vger.kernel.org
X-Received: by 2002:a05:620a:1aa3:b0:7b6:f219:a7a8 with SMTP id
 af79cd13be357-7b6fbf3c37dmr352020085a.49.1734104061207; Fri, 13 Dec 2024
 07:34:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241206102327.8737-1-biju.das.jz@bp.renesas.com> <20241206102327.8737-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20241206102327.8737-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Dec 2024 16:34:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX9QK-w1XTD_wR_1LP-bh3j1QkL+z+374bVhgk4bEP_hQ@mail.gmail.com>
Message-ID: <CAMuHMdX9QK-w1XTD_wR_1LP-bh3j1QkL+z+374bVhgk4bEP_hQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] arm64: dts: renesas: r9a09g047: Add pincontrol node
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 6, 2024 at 11:23=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Add pincontrol node to RZ/G3E ("R9A09G047") SoC DTSI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

(assuming the current bindings, which may change)
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

