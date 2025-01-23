Return-Path: <linux-renesas-soc+bounces-12398-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D82AA1A6F7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 16:25:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6FE5E3A531F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 15:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93B2F211A2A;
	Thu, 23 Jan 2025 15:25:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A77211712;
	Thu, 23 Jan 2025 15:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737645918; cv=none; b=qGKxVgVWUtqxReZbKJNWVEV3Ez0DPPapvWU/+hMP26Ck29TLw0RCwmvHL3OboTNJZK3Y1vPYR6e7UPH2SMWM6//j1tKe3Mp2BMCUQHsB3X2O+V6X1j2JH+E598g8sovOeEnBv8akjWLP9sKx/q1pIzDY1bYohOQtV/kS4xwDwcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737645918; c=relaxed/simple;
	bh=5BoPTxzcOl+DEgiIHc0pExrbC2vR94EHPLMbwHPe5ZY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A83c8i1RNMKFu/9hd2Ek08sWifRDSGGAMFPH+koaDDLlYSCbRORkviSMWqUtr2nfw43rdZhqM4fupyTBSZ8F1PI4yLikiAvn54sr4QeA6xdn6ygFQEewPO+hDOTCMHa5oJy4h3ugjeWakNH8H3V6LtuDeQjV20Hra897mddP15w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-85c4d855fafso222842241.2;
        Thu, 23 Jan 2025 07:25:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737645914; x=1738250714;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t9b8B/1KhmA8Zn74X54gjZWQdCBq0YTpDGkeuzPv3Wg=;
        b=fVMKmWZkly/0e0yjl6bljxDN8DL71u99EvYjvygGbe9AQNCTdfd/GyuP8BIuLreSbn
         ZelqM/gFiTSjgmvtaNthF3str/gSR1QFwMX8BObsi2MEo5ArKiA8kv0hUcA8Q43ve8SY
         +ahxpeAmNxs4g0qQWkQ/gB79x/9ecnVt7hCxNN3kZG9rWU2AAmeRhqPVP+a1Uu5xe8SU
         VnFH0cNWaYwZTH6RqEzRT59dtyLLQeYsPgDXAp3/+I3qVr2VzSaF6vMjtjw8NHR8A70A
         DCvHkG4yJBHELaYpPtGiXNWLjgXn2IkqTtZoGJHruncNeIClm5SXac3gy3ORLxlAHRDH
         4MiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmiCs2XdHPL6TtgmOFssSaQSw5UjZ4WDzetZEGjHOGhp4Lqnf602bu8VHdNpGg5FipPvNfU57Wq3xC@vger.kernel.org, AJvYcCVzbcB5Nx9SDwhzBYitH/TmT4jUD/9CPkGMvguPAsCZwzJXoflAHX1uEvPK2Cr+gQhW5atRyiMLpOzZ4wIcx/zpqsI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcTL0CA1rT42MqSJfuRqtXESOOQDJe3NJ2nYwTDFC8aF41Ea2d
	B3gVcIWn4PngeDyDtAjPmLZpP19qQQrIQIGzUojiVeE7wRGM6w1OWH47PyYJ
X-Gm-Gg: ASbGnctmzS12Wak/MNkRoIP+KprycDaK1UV44a3is4ShIovfnLpVze7zECND+Ov/JAC
	h/sQrBw7wMlHyy2htIVS1SKpNtbKJ5u2jqnuOLdOVilJ6gzNu6fKVqpoxNy7vs4o4r6MWIVQR0X
	JCE7z7B+HZjK17s0xDvM+Df2dGrSgOZUx27xJ2J8+AsYUpM9iQKdkU6UQXsQvxCGgSW2jvf5S8G
	+DL+FGK2caBIqByYoDt6VkTy9iYQWCD9L9P3e0wS+pVL0AG5lj+mrMmd4QpEkC3fJUNxsO4dkp1
	4bhiixP8dzM4kufRVDkMQzgaUVd3g02bZSyWE4wsq/w=
X-Google-Smtp-Source: AGHT+IG2Fnd1xIeHQImSWq035zOsbQHCGq0nTpOGAFM63rA6K0ro66FnmQHQj4LZHEFFqQbp7RM6jQ==
X-Received: by 2002:a05:6102:390e:b0:4b2:5c0a:98c1 with SMTP id ada2fe7eead31-4b690cb5750mr21575581137.22.1737645914329;
        Thu, 23 Jan 2025 07:25:14 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b68a20cbffsm3166874137.12.2025.01.23.07.25.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 07:25:14 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4b10dd44c8bso292982137.3;
        Thu, 23 Jan 2025 07:25:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVJ8r4OpE2gbo9ZLtfjaLK7gKHSZzTsxTjeD0UVsoYnFHkD+OxAJEbg7giQCVTkdgGRGP7RcNtv2WeG@vger.kernel.org, AJvYcCVzuhT+e0xSHWsO1rNvvoRoiZ2UweykYxxkwmXr4uU/0swCwb9LUzwibwHGwXXOUA0pce2KIzbHP4k1kiPTcX+wzR0=@vger.kernel.org
X-Received: by 2002:a05:6102:a53:b0:4b2:5c4b:55e7 with SMTP id
 ada2fe7eead31-4b690cde3a2mr20737457137.25.1737645913456; Thu, 23 Jan 2025
 07:25:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250118111344.361617-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250118111344.361617-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Jan 2025 16:25:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUTQ=4K8P_TgTp_b=NDdimgXJgW_nhO1ZJa11C846Bubw@mail.gmail.com>
X-Gm-Features: AWEUYZlPykv4QH7LgkEQDPD8UQk0TXIl7OZNblAPbfwNmuapfG6Le-FqWDaZUzw
Message-ID: <CAMuHMdUTQ=4K8P_TgTp_b=NDdimgXJgW_nhO1ZJa11C846Bubw@mail.gmail.com>
Subject: Re: [PATCH 1/5] arm64: dts: renesas: r8a779f0: Add labels for rswitch ports
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marek,

On Sat, Jan 18, 2025 at 12:14=E2=80=AFPM Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Introduce labels for each rswitch port in the form 'rswitchportN'.
> Those can be used to access rswitch port nodes directly, which is
> going to be useful in reducing DT indentation slightly as well as
> in DT /aliases node to reference the rswitch ports as ethernetN
> interfaces. No functional change.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.15.

> --- a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
> @@ -974,15 +974,15 @@ ethernet-ports {
>                                 #address-cells =3D <1>;
>                                 #size-cells =3D <0>;
>
> -                               port@0 {
> +                               rswitchport0: port@0 {
>                                         reg =3D <0>;
>                                         phys =3D <&eth_serdes 0>;
>                                 };
> -                               port@1 {
> +                               rswitchport1: port@1 {
>                                         reg =3D <1>;
>                                         phys =3D <&eth_serdes 1>;
>                                 };
> -                               port@2 {
> +                               rswitchport2: port@2 {
>                                         reg =3D <2>;
>                                         phys =3D <&eth_serdes 2>;
>                                 };

Would you mind if I would change all rswitchportN to rswitch_portN
while applying, for consistency with other Renesas DTS files?

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

