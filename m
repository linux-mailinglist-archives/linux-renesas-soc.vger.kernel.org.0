Return-Path: <linux-renesas-soc+bounces-3107-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F9785FB49
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Feb 2024 15:32:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 79AA61F24608
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Feb 2024 14:32:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B94743AC1;
	Thu, 22 Feb 2024 14:32:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B60B3F8D0;
	Thu, 22 Feb 2024 14:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708612366; cv=none; b=fkmnBzw/VHkbcov8RbEx7Sci5LBdkR7aX+PrTjfcGGw7tuEdGHtgu/gFlt7Omf6eeuzP9nmE4SrhOhCC4wz1rRELvvJC+k8XoJlL0TMRjzzOtDqWcK5g+2qd4oRNrP80nB8K1Ynqer8Jh+atiu9/m1Vfjt6lC7gyNPYQCWCncYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708612366; c=relaxed/simple;
	bh=LZHDN+CsRP+drHIzWcPwzkzGhgWExE0txMHPI86FeWg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OqHzPZh0+CarNfF5BLA2Jgur0KZN8YlvcHlvT6uRkQxNXCVaRgzSwGzehVVA4VlHYGW5mCcmNPAEZ97z1GBMOL2nPdVGVJQW0h2LdcSllYBEa+sCBl32x2HHMRCp0rkiUJ/jp83Z/obUDxMPFv1+UG19LP4SKXq9RCZijmL0BNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-60853ad17f9so43029047b3.0;
        Thu, 22 Feb 2024 06:32:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708612363; x=1709217163;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TRroxZP7R3yxxPUiepuBbi7r16wL47S6mTJMGmYkUsI=;
        b=qHy88arV1Gk13mrO88VprueVFiomSSMJx4Y0Qj2ejEd2XyodmJccn6FLIQ4nCqxbgA
         tlU9J5Nt2zOz8hf+ItUDBQ4mqiFNtL83yFBzIUZCF+aoxFLzGr0/YFeKXhibJ0OpAMt2
         3ZI8M1EaT3ZAGYx7vp5qYzE1Oef2IpUSiulUBm8sJESwY1QdYtbkDXIqYW5zhCA+in63
         umn7zDB/wIqB6Nv1y37R1DWya8qJ0nPi/UzklyfALXkU3nLXJw5PUfTZaViE9zoghynE
         8sdp9GM8uI0fw+ZQqsfrDppO6X6ampDYx4mzGo1eQkYsotSMZUp4Okcgcf8CklkdzAhA
         vnCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPRSNSVLzM3EisYyows/nBuWzhABpsrEZc7N965/0kGzPNha9Yi+SoYDY4ROFBh6qKAyGadDLMLPHbOkitTSFdgycpUcJN9XkgcfJcWR2GgudXCd30n7dsWaRiu9lGZBrM4oZ5rxi0rGaxCdN9
X-Gm-Message-State: AOJu0YxOmb+1EojjFG7KPUsEwCCk+fj4jbX2ctfG5xUPBSQfmQooF5GP
	2acI8ZOn0cOZHh00+h/fquZOTjic3qO5Sn6AkZx1LoGqkvJFPUI1JBw/+4gg56c=
X-Google-Smtp-Source: AGHT+IE5iQLtLrPLuy7Bh5WNBdItBjJnT/emr8o+W87WhcQxo9kL6pzK8nmpfZrRMoWQ+CAc+iIzow==
X-Received: by 2002:a0d:e60f:0:b0:607:7e50:1a11 with SMTP id p15-20020a0de60f000000b006077e501a11mr18322476ywe.19.1708612363255;
        Thu, 22 Feb 2024 06:32:43 -0800 (PST)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id a125-20020a818a83000000b006040f198d3esm3065994ywg.142.2024.02.22.06.32.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Feb 2024 06:32:43 -0800 (PST)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6085b652fc8so36198757b3.2;
        Thu, 22 Feb 2024 06:32:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVQIq7bMpfhYarll7ENQ3BQRaPlI1fEU49FjW8WpuqFH1eT2Zj4q/oMBgka8xfRn0+Rt98zf0/CpX+gT6bu4pbB7aCigWqBXCJ8JuSwSzEVCnWpZZ27KzBH7zUXmUkJZODvm0ivEpRkMEm8wQIz
X-Received: by 2002:a81:7184:0:b0:607:75e7:80db with SMTP id
 m126-20020a817184000000b0060775e780dbmr20648117ywc.13.1708612361737; Thu, 22
 Feb 2024 06:32:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240222132117.137729-1-biju.das.jz@bp.renesas.com> <20240222132117.137729-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240222132117.137729-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 Feb 2024 15:32:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUTDnVR6ALCxdTAW22CvfR2R4Rixo3i7RfVP1f3HKE+FQ@mail.gmail.com>
Message-ID: <CAMuHMdUTDnVR6ALCxdTAW22CvfR2R4Rixo3i7RfVP1f3HKE+FQ@mail.gmail.com>
Subject: Re: [PATCH v9 3/3] arm64: dts: renesas: rzg2l-smarc: Enable DU and
 link with DSI
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Thu, Feb 22, 2024 at 2:21=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Enable DU and link with DSI on RZ/{G2L,G2LC,V2L} SMARC EVK.
>
> Move DSI port properties from board dtsi to SoC dtsi and then link with D=
U
> and after that enable DU on the board dtsi.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v8->v9:
>  * Moved port properties from board dtsi to SoC dtsi
>  * Linked DU with DSI in SoC dtsi
>  * Enabled DU on the board dtsi.

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue this in renesas-devel for v6.9 tomorrow, unless
anyone objects.

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

