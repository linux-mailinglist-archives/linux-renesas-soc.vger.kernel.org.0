Return-Path: <linux-renesas-soc+bounces-8796-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C8396EC3B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 09:42:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5C6CBB21332
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 07:42:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9093714C5B5;
	Fri,  6 Sep 2024 07:42:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72EE3C463;
	Fri,  6 Sep 2024 07:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725608537; cv=none; b=dt5377THOQUptdJtJUnpSslHsd4Apnu8SLkS4Fhri6ZKPjH5ImB+Whqr1oieobOI6f5dkPW23X2puWUYSxVGIinqksJgWGUZqDHYQBIiphuaitql4+qLDlLTqsiBE+6e8qII/KOShcNDDuQoTXmZMqRC1+3UU7SyARw7OpsC7s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725608537; c=relaxed/simple;
	bh=UnsJeMKQ8zYPnMw0YAhLPztdm/yfm7bPGAI9ZWv+jNY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ciQnXfDiBpfMSv1TYu+6tltIAB7jOyC8e39d2gf6O1teE5P4zyRjeuaW54t2z9rjNnjGmYLYGetTEKOepDwNt1ihPJGbYyLoqomg7S4WzpLnxOlidL2rXAtm6fon+QWz4El04kSPXaas50La0M7BmacGGdpFU2KBM+2nhmkeqX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6b747f2e2b7so15865607b3.3;
        Fri, 06 Sep 2024 00:42:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725608534; x=1726213334;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HOu0qyAEJ6R+fXCEatl02fSOu2FCjiv0QYlkkw1DK6Y=;
        b=oNYvuKz1/WHCrmM8c06zqE32nqjJsn4t4OMdssZs8OEHA1ZNQE9PvpiYgjrEN1Ts94
         O6UQMRa21Dd6AoN9vR3yD1Tq2rnutaOAFC8ed0UklWJQ1nQy+BlPrd08o6/KZjhqstyb
         qCz33gR7b7Y3uO1el0PORW7wsJCKBAfbuTUNFu+8+imlm+P2IhaEj/QkVREXQoP6sCzl
         Dq5x/p9qrQOX1x0UXAuuxzLcM6s0Revk1KUs3nIKKXEI/vEDXfftBnv0zT7cjeQJIjb9
         +w0kzPRJHnvw94fKO4RvZBBx04nafQ7Phf1gTM5dVeVz0dQAkNMlnTXBwS1Woh2xt8KT
         78Fw==
X-Forwarded-Encrypted: i=1; AJvYcCVG2NgSSs2a9EKimyj2MqweKzZ6IUJOLzn+l/Q3S7wd279dhkF+IVjxgMZZBWVu+SvNCAxHIfyKKeURPVrG@vger.kernel.org, AJvYcCWfU3NFHYGHTs76xxYtOwpn1yHbqqFVVOokxo730zDA6WMOl114MccUD3UYVt/JQc/pZumYGmw5Zz6C@vger.kernel.org, AJvYcCWy36jlSKQu93INDD+tA6IFgjsc8OYuVg26ovp5Ry9eFcvjxGsnxOtGL2QSBzNnFSMpm7oYKAcz/XUbbOmty9KOQ7Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEoeBuhOYD/0kUAgs7Cr6k7Vng07fp5pBCoEUS6KuUFfknnYNI
	DZ2ZweEvSr+wkmNA1RRc13sKlvMX5IIFHh6ESLCqGTmBvT5Gz12qVXJcUD4P
X-Google-Smtp-Source: AGHT+IGFPAezqwsOd1VO6Xth+zrnQgUHzLbjWQFVQzzbyDQyGk8xrgSIdqqhVXkCbx36HWbcBA7dpg==
X-Received: by 2002:a05:690c:6202:b0:6ad:9550:7617 with SMTP id 00721157ae682-6db4516c9c0mr23053827b3.32.1725608534170;
        Fri, 06 Sep 2024 00:42:14 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6da7a132071sm15950907b3.141.2024.09.06.00.42.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Sep 2024 00:42:13 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6d4f1d9951fso16071297b3.1;
        Fri, 06 Sep 2024 00:42:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU39+QvwJa11xJoh5uyaycVuj7fXxI51TyT/RTeic0i6LCvCcwahypDgPxwQRj1FssrMNxaum/fDZYgviBa@vger.kernel.org, AJvYcCUnNyfV7AnHrB4Cp5LkVE9e/QPQXZ6Bc13gCtcsdsPs4bcHQLRM/rF0QhllHDMZYBy3Ml5KGmoAClcLZIuUiJcs3rE=@vger.kernel.org, AJvYcCWshryPN3dpUljVKLapZNa4HYr0bFzVZkO/4a+yfydUXiDJyZOV5hNsXgP+OCofsGSEj21CftC7R0bJ@vger.kernel.org
X-Received: by 2002:a05:690c:d1a:b0:6db:2753:cd9c with SMTP id
 00721157ae682-6db45273f36mr19818387b3.44.1725608533743; Fri, 06 Sep 2024
 00:42:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240906062701.37088-1-Delphine_CC_Chiu@wiwynn.com> <20240906062701.37088-23-Delphine_CC_Chiu@wiwynn.com>
In-Reply-To: <20240906062701.37088-23-Delphine_CC_Chiu@wiwynn.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Sep 2024 09:42:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXFC-TMNdJryq4MBh+QQOntxdHYJrfP2kLqxJk7LKgb9Q@mail.gmail.com>
Message-ID: <CAMuHMdXFC-TMNdJryq4MBh+QQOntxdHYJrfP2kLqxJk7LKgb9Q@mail.gmail.com>
Subject: Re: [PATCH v15 22/32] ARM: dts: aspeed: yosemite4: Revise i2c duty-cycle
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
Cc: patrick@stwcx.xyz, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Delphine,

On Fri, Sep 6, 2024 at 8:28=E2=80=AFAM Delphine CC Chiu
<Delphine_CC_Chiu@wiwynn.com> wrote:
> Revise duty cycle SMB11 and SMB16 to high: 40%, low: 60%,
> to meet 400kHz-i2c clock low time spec (> 1.3 us) from EE request
>
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>

Thanks for your patch!

> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> @@ -761,6 +761,7 @@ eeprom@54 {
>  &i2c10 {
>         status =3D "okay";
>         bus-frequency =3D <400000>;
> +       i2c-clk-high-min-percent =3D <40>;

This property is documented nowhere, except for a not-yet-accepted
patch submission in 2022. It looks like you've been told before, multiple
times...

>         i2c-mux@74 {
>                 compatible =3D "nxp,pca9544";
>                 i2c-mux-idle-disconnect;

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

