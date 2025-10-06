Return-Path: <linux-renesas-soc+bounces-22710-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BA2BBE797
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Oct 2025 17:21:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id F0915349A48
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Oct 2025 15:21:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7677E273FD;
	Mon,  6 Oct 2025 15:21:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61EE541C71
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Oct 2025 15:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759764083; cv=none; b=g0TU4XDeWmOe9D9h4Mh5RuJL6HHjz+in8OIJZ8DmjBgzDzicDbwu07qWFwTK1uNPDn6UrEfzb75wIRV/GZ9qG4HbBUEnF0pPeNVSmfKi6JV/iTcCW/ker47oWfrpwXUojOsqBr6eqL97jvm0ioJiiosOIqzuLuOWeEal4svW7sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759764083; c=relaxed/simple;
	bh=+TxXf/N99lUUoSpZ0iZnXZCYXsV81alNcfP3eMqdfWI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gFHqHd/t3oEISf4MOXsUgANTQ/xOpnoJMSXHZoAW+cnrzdOCPrrsVyeXoULGHSba1PC9iUW8szrNza74WW3l3gn+wK5ikCk3/2oMz/CqSmPUbGJWTEt+Us0ekjNJqwF6HzkiCOtDWfV+VW5WT+K8uBeWzu+C2enHqss3/Zg8f/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5b59694136bso3315988137.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Oct 2025 08:21:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759764080; x=1760368880;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qNjjZf/jMJo3i+vgImT43DMbs4x4vUK4An39lZ8V464=;
        b=c+9vV/ghhxzulLZodt/rR4casIkCqJwPwQSu2VdTrmDPSD7i62zHrK2Vv/Z029lkFa
         UZkhOrZ+qr0j8Wgsb9ZgyMjfp+zFXxlBShQgyrvHWsMcaKpjU0NW98I3yuQmiS03oldq
         NywgwaM/aqYrJkOwAdMGg6ihGXRnN6VWhqs0wn41KwfYUbWYPQMWJE5UIB77PId8CeXc
         /JQ8WNz3VKd/7JH9mFsa5BnoKkeE056MtYaeUqhfelsNHiOAFcgVIDeXkFi7H1c5+C3p
         c/ZhAgRLCnWk/iCsUnWs6BuJlwUCp5B1Yu9/kBjyXUeD0Hvlbk25j58At3ybK8kZINmb
         AvZA==
X-Gm-Message-State: AOJu0YxxxSZ87pjdBfroVV1EvbTfwpFthgkfgLumZv1h4j1/OGi8Y2Kv
	Na38+jAFo0J42RNfZIDMnh6flF0+VLjlrvmPZ9XOMJ3JZcASk7G2n0KVSFkU83fq
X-Gm-Gg: ASbGncsjkJ1inQ5uLXZozgvzpF6PmRk3L09ss0MxvAHhVyaIgqw/Yu3TeQ2NIJXlUdJ
	kyMzjlmZWbAkqE5IFpooPb5CrCnkl5sf+2qXVGdzAEhUWUM+fs/IToNYGFfzplaV6cZRjFArysh
	NVxXeUtxn1CWRJPjKRfw47u7vNOcyu3N3j9NkNg4vuAJJmivc+2dHXaoaW8EczNFbt+wRdonr6g
	Ke17T3Nsav87a/IDZCaLEmWivfyv6wApMlnEMc4EPoJSZ/S/2oZV62ecUhO+DpjjX1ro1NXZUF1
	pxiI+mZAcNacM5ucVwhBNGRRxBYfDJB+kiePc46N41FQ+Sqqu3RCGF19H8TNmnWdpnEsM09PixQ
	iCioxLOGuRj/3P5IAs3+PkZv0n9TFsjUlAWMe4Wawjg0UD//23dv0I3rKzDQw3T8AzI4Miw4tHs
	0xvKVivKnhJ7v2uiUmj1o=
X-Google-Smtp-Source: AGHT+IF47Q3B6eUiZM0xaMu52Y2S4T1lMb3bvM5fQVW3M0mCQT52LklDYlFXyTlVRFYlKUxi7uejVA==
X-Received: by 2002:a05:6102:4189:b0:5d3:fecd:83c7 with SMTP id ada2fe7eead31-5d41d001667mr4351036137.5.1759764079921;
        Mon, 06 Oct 2025 08:21:19 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5d5d39adafbsm65142137.11.2025.10.06.08.21.19
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 08:21:19 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-59f64abbb61so2501666137.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Oct 2025 08:21:19 -0700 (PDT)
X-Received: by 2002:a05:6102:e0b:b0:52a:ef9a:cbef with SMTP id
 ada2fe7eead31-5d41d16b894mr4797547137.35.1759764079488; Mon, 06 Oct 2025
 08:21:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251006082520.10570-11-wsa+renesas@sang-engineering.com> <20251006082520.10570-17-wsa+renesas@sang-engineering.com>
In-Reply-To: <20251006082520.10570-17-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Oct 2025 17:21:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVervDygy7Q8fRWUdmRw+Ru_0=LnmwPuUCLwV5SfwvYAg@mail.gmail.com>
X-Gm-Features: AS18NWBTxF4Vo9s4f4CcOmTGKFC0-eU9peD2h6OENdQsJDK4QlfG4uoEwiMYzY8
Message-ID: <CAMuHMdVervDygy7Q8fRWUdmRw+Ru_0=LnmwPuUCLwV5SfwvYAg@mail.gmail.com>
Subject: Re: [PATCH 6/9] arm64: dts: renesas: white-hawk: Enable RWDT watchdog timer
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Mon, 6 Oct 2025 at 10:29, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi
> @@ -12,3 +12,8 @@ / {
>         model = "Renesas White Hawk CPU board";
>         compatible = "renesas,white-hawk-cpu", "renesas,r8a779g0";
>  };
> +
> +&rwdt {
> +       timeout-sec = <60>;
> +       status = "okay";
> +};

Rwdt is already enabled in white-hawk-cpu-common.dtsi, so this patch
can be dropped.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

