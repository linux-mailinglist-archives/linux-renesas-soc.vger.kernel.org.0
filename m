Return-Path: <linux-renesas-soc+bounces-11158-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDED9EB42E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 16:01:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DAF21886211
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 15:01:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C373019D065;
	Tue, 10 Dec 2024 15:01:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FD62594;
	Tue, 10 Dec 2024 15:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733842874; cv=none; b=floDrbMU5cEE8YQ8rPfPUFmkIby9BE9ib8h0mjF4iu++AvfPPl+FFkO9/O8mDaLc9DEk4vMzzHDg7DFzbJfP/770FfXt3iYCVts05vrGmIxuWrMQSpR3vFBI2xmEsHVHLHPjno0Wg1DgaFPSZ/pcihx6RECCCsne5SVVz7NuJBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733842874; c=relaxed/simple;
	bh=Gbrs4HMREk++bBNvRKFa9obhcsJ8EL4dFjyddT1oPpo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lfNH3X9lB1ynoRfHVZIQPPZve/hH5LZE9vzbRYDLmdofnD+QsY3g/B0ZpfKgrF84DSYrC0oUCWzBH1g8PmbTaZwB7RCCHO4G1SU947+qkhGFLfBBDbPwySZ1v039RRKW6Ft0PxElulfqkAzGbfT3D9hKV++JjkgiiMqRh8Two5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6d884e8341bso40430526d6.0;
        Tue, 10 Dec 2024 07:01:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733842871; x=1734447671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=su4ECPmlI/KJGGcBixaQRsa9uITkLBdQfjVXoqcpzmA=;
        b=Bml+ZaUEkYM9eh3g+B8gV5mQb/sz5a+BV6QSPR2aMiHZN0S8GAv5akX31SFKqeGkm4
         CrkBAfs3Ljumu7nVME5Gjl2QbZHoJbJR4DG+Q3zKBN4MpwX7nLonhu0B4lR6ouyRR5tu
         frgLj3lqTuWO+CT64ZG03u7ZxMm7Z13xTc0M1rdkMsXk3Nk6i8IpQdf3F+wjArqrFUXY
         xmwQXwMCSufE2FqH/yrmmU91qAplnlforultVv1Ne8lKk1ey/LynRIzQWB6nrFNRN3Ts
         1uW3czU89MEhTPN/cB2Ygpvt4FVG5/PR5bB+oAAtYozjOmTkkFHQ2Z23CLr0WvdnoGRh
         HGyQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9n++7MRpkgoYDmbIGxpkHyn6Tz1LV36mpX/S1avQD8lURD4MGnnWql1gxnullaP8dvQ5Pnty0JRXT@vger.kernel.org, AJvYcCUmhGIMijiJELg5G16ikJ+5subamhTpQ+UvlRje/oSrOiYlz4uAek6QTlIkuQl3vLJwDogK0dmrffZM@vger.kernel.org, AJvYcCWvFeuTCJKP+3gAabkTYx9C3xMksSJ0t5bnRAOf7Vq3aHDdFuzIS+4ry3VYlkVIMbulI819KLnxDpl+zNXE1Nfi95U=@vger.kernel.org, AJvYcCXki350NZE241+rkKM7Hb39ZddTCqfn1HCUWMBTKB1g3TAUB7hpDvsJai+O/6Qrd4nX1sFyj2h7K+Mn12NL@vger.kernel.org
X-Gm-Message-State: AOJu0YyKEg5r793pgTEdj0j1nzFSzGUCAPSg1CU/HjiWBP5Pah1v0RLw
	ciplyejmHYrI79CoNurOF0yeXzaWdTboSpsXJqqRLMkbbSIDYo017NsMZ7fe
X-Gm-Gg: ASbGncvmrbLh5Gnmy0J2Z7H7JyJjw+ycakovtZkBzlY12zgvUNSj02UrlwvI63NRqDR
	PeRiBm8IjCWQiBvml8X7HRgCantxc0cyQFSmszoAEzHk8Ii5gWvbU0xU6ywTPGH1dBlyrL25feO
	vKKHub7fowXrpbN6Z5W2PvaaBYGGmhfvgZEekyJsRtioBbyC0KTxa9E5c4roMV6SB0nMxJJ/Srb
	bN4ERff3CX1CUn5t9bHvn8A9YMd7fsxpv6BW0iJUw2J4adrzuYiOBC25fb8t1IcLOVroTDuj/CP
	lBjjMTxK6fX4dnTm1dR3
X-Google-Smtp-Source: AGHT+IHoyFkZy7UZupaT3LlsvFJUaHaTkvU9XdPmCESzW72IHeVg2w3a7l9Ac4PR7jUghfdAzSm06g==
X-Received: by 2002:ad4:5d6c:0:b0:6d8:821d:7370 with SMTP id 6a1803df08f44-6d8e72065aamr224079966d6.49.1733842870842;
        Tue, 10 Dec 2024 07:01:10 -0800 (PST)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com. [209.85.222.180])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d8fd5b9e89sm35553776d6.127.2024.12.10.07.01.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 07:01:10 -0800 (PST)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7b6e8814842so33294985a.0;
        Tue, 10 Dec 2024 07:01:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVXg9CwntAdOeTASnDGqL369CONDiyqWatPPcLqbHSqcZXvtxTp/JG97+rHMB6IGZP+C/NrpdKYWJRS@vger.kernel.org, AJvYcCVXsrYpKICmXPRN/506wQHp0Nq+epRWgVvCyUezkC4yPmSkSzyxpuXCNjtN5T1RqekiyrlYcP0qYVSz@vger.kernel.org, AJvYcCVwRSYFbCzD6d0JlbveYowxFjIjJzs8FJnkj8vRX1v47/pVWuadt2fH8KC0XGKNjuAcb42lrQS9Z5OaZRdGInd6e2g=@vger.kernel.org, AJvYcCX+U+iyd9NA2QIF86Rig/yhsNgAj89wSrWid+UZio4EKPt6DpTPZE2ToyDuT1KEfsG/aEYhaCzZUoijYq4h@vger.kernel.org
X-Received: by 2002:a05:6102:2909:b0:4af:4945:9a1c with SMTP id
 ada2fe7eead31-4afcaac87abmr16665622137.19.1733842859094; Tue, 10 Dec 2024
 07:00:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241126092050.1825607-1-claudiu.beznea.uj@bp.renesas.com> <20241126092050.1825607-6-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241126092050.1825607-6-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Dec 2024 16:00:47 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVmceCBgp4XAJTKQcpiGHEgnuT9jEfrqQLBCtAZxZvB6A@mail.gmail.com>
Message-ID: <CAMuHMdVmceCBgp4XAJTKQcpiGHEgnuT9jEfrqQLBCtAZxZvB6A@mail.gmail.com>
Subject: Re: [PATCH v2 05/15] soc: renesas: rz-sysc: Move RZ/G3S SoC detection
 to the SYSC driver
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, p.zabel@pengutronix.de, magnus.damm@gmail.com, 
	gregkh@linuxfoundation.org, yoshihiro.shimoda.uh@renesas.com, 
	christophe.jaillet@wanadoo.fr, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-usb@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 26, 2024 at 10:21=E2=80=AFAM Claudiu <claudiu.beznea@tuxon.dev>=
 wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Now that we have SoC detection in the RZ SYSC driver, move the RZ/G3S
> SoC detection to it. The SYSC provides SoC ID in its own registers.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v2:
> - this was handled though patch 05/16 in v1
> - provide SoC specific init data through the SoC specific driver

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

