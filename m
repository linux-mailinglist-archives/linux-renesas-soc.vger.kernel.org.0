Return-Path: <linux-renesas-soc+bounces-17009-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3D5AB4442
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 21:05:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 39E937A22F7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 19:04:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE7CA296D37;
	Mon, 12 May 2025 19:05:27 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2009E246788;
	Mon, 12 May 2025 19:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747076727; cv=none; b=ikWx8i6+vkUf0LChp5ntuGLNcHGTDotpZ0frjdjo0qFlCEk1o3LSsY/AMYE/jyyzzzQlPVsJUI3wNOP0RwPgxZau5OPTRz57uI9kEK1sGcnfWp1mn7bXx26U4Y8DJ6H1VmK0gHljvaL6PgBI/BsQB2HnQTFFln98z3smQ6+mR6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747076727; c=relaxed/simple;
	bh=1ZSZ7d40EjM6PfGtNNzgCiWaN1/tS5p7HVYONGN2Dj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C3vKokaxpLjyFsbWrNzKgONHkYYeWcAnba7VXzaKfOljk7ZyqE+4vTJ4rgMNUz861RD5Q99FUlpeYs6uhhObBdOO9B/u4a/84LPzt+Nm+xtAS7F0E5nRZuvD+OGRPW4vuZ14MZCvhN//RrgaKMas88OLSVZa/l2tj+SQYjw1kWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-47663aeff1bso51908501cf.0;
        Mon, 12 May 2025 12:05:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747076724; x=1747681524;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d3MF6Gdr8jf4kveAGsiH58pOxAm/4f3V90GsWQvlGwk=;
        b=sAVOzYyIz1hmU4mTQOI9iLh0G+cEhbe6hIVDv2ubsvbzaDiSbPxU8khtAlYPV3njUy
         EI6O5LcTInVQh1A/9izEbCM/cp8FqfxgBAocXHok3VXdSpGgM56h4Bs3+OIwXseAciLn
         LGeHKExOJ8FTXYx5s14ulB+A9jgl16GN2RoClG20zs8MwC/0t9nUhKCr9H6bsm6xMXgx
         0iB03bV5FS3ysaQevIXKQu5FBKnmQwnHzE0bIW6UidrbU6Ah5m9/X+yctM67+xdhRSOD
         VztQrsdml1bZ7P/wtMzdPZAY3RRIOWtY1WkBI/7mzNuyR6aREg4plY8QJhbk7V3SWO0M
         LTTQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9bXYkeuDTsoHNAIPvSu1YH75wZjUySAGp99q1S1eYk1O+I9SXSXF7oJJVspZSKME7k/5x5YrrTR+IVFOmvfxKHXo=@vger.kernel.org, AJvYcCXL2bCz8vEpw4jTqjYe1lUkNCKhEIVx3pe+AZAMDETvyZWiDXUolgTmtPdEEm2tRCPwumQyHO07aRLQ@vger.kernel.org, AJvYcCXtpsBhFfidBaLpYOlJz6rlA7SJI9W+Vu0lyyG7nG3dQIZP4j2Pq0wO3lDedG1pou5ZattU+43NTC7k06z2@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9l1NDqQZ/SiNyH1h3uAq16Z+5oIXNUWfh8F+fXf9ijxt1LE9U
	CJhYngKkPZWha+6cTd2LfE5d9etCwjt12IhYBuMQh8Vc8O/I/7eBygN97t+r
X-Gm-Gg: ASbGnctn+LyhOz7uNOIKDQEIOCZ/bgWZ0VlS2PpiHCOyAHnR2lw1Od28yaxmJB/fQ07
	Cfu1CgfMb/Se/JU0voG1UmGYaQq8TEEQGnE+k/VQf9kXshKXfcOwMYheId8C3Bf0z3YZM6Pvo1T
	tc5FIMFl8ZfveyVCytqIBEFqJUgpKEV4wp6B5Ehgy+H25I8K6vSlrdH+nqP3hZxnRU0Zo0snSxQ
	XDxg8v5GZ81aboln0J42gXVf/hVvmj6fFUNp8mw3+QZvnKiANupsyBZ6zJKSD2xYt3T6gum0A7W
	4nypMMJuNnWd9WmVL+nM8lgZKgWpEpCRZNhz628g+JICZE2WWLDE9CHTS+zqfbwyN0HTqUFz6yh
	W3cJXeHglGwx6/4OfMQ==
X-Google-Smtp-Source: AGHT+IGstQiLdDGDu9maHppC/iabqbA5QXQmg8mpHV7U9Tqs/EcOZcOoeOb0kjqYGdqfIm0J1wUE/Q==
X-Received: by 2002:ac8:5a4b:0:b0:48e:1c13:ecaf with SMTP id d75a77b69052e-4945273c570mr229066781cf.16.1747076724062;
        Mon, 12 May 2025 12:05:24 -0700 (PDT)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com. [209.85.222.171])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4945259e590sm54065441cf.73.2025.05.12.12.05.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 12:05:23 -0700 (PDT)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7c542ffec37so574814985a.2;
        Mon, 12 May 2025 12:05:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV3QqpLqFTVf0zYXFFOIQ0/svFgUNnjmr90jlPj5aIZOAVMdjaR++asn8CdXzLQhJ61jB+Tyy306U872WseQg6XqGY=@vger.kernel.org, AJvYcCWE59ePz78McCXCZ6kRh5OVLV0MysWxvQkRqLYOK4FdOH4XOJFBqYrcOLhuTKXKZEqGfxV1qqa8064Kb/yG@vger.kernel.org, AJvYcCWzSjSV9ZMznRvrHcFHbD7lSbNms+tenWvwA4Yz2m4n7PddM64hAKFtp0MmmVLGTtZOja+Q5BCZUgmV@vger.kernel.org
X-Received: by 2002:a05:620a:8e16:b0:7cc:fd28:8c6d with SMTP id
 af79cd13be357-7cd01115c75mr1718978285a.30.1747076723435; Mon, 12 May 2025
 12:05:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509153559.326603-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250509153559.326603-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250509153559.326603-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 May 2025 21:05:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWnaujCjK+gu8RFfrZ4a2axf=xffEOAdwsjFMvUHcfw1w@mail.gmail.com>
X-Gm-Features: AX0GCFs1qqVunPFP6HjVL2vSxCh34k-gq5vGbef1mspomelrG6kKVz1s8JOeHg0
Message-ID: <CAMuHMdWnaujCjK+gu8RFfrZ4a2axf=xffEOAdwsjFMvUHcfw1w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: renesas: r9a09g057h44-rzv2h-evk:
 Enable GBETH
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Fri, 9 May 2025 at 17:36, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable the GBETH nodes on the RZ/V2H Evaluation Kit.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
> @@ -78,6 +80,68 @@ &audio_extal_clk {
>         clock-frequency = <22579200>;
>  };
>
> +&eth0 {
> +       pinctrl-0 = <&eth0_pins>;
> +       pinctrl-names = "default";
> +       phy-handle = <&phy0>;
> +       phy-mode = "rgmii-id";
> +       status = "okay";
> +
> +       mdio {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               compatible = "snps,dwmac-mdio";

I am just wondering if the above parts of the mdio subnodes should be
moved to the SoC-specific .dtsi instead, as it is part of the SoC and
fairly static?

Both approaches seem to be popular: e.g. rk3568.dtsi[1] has the mdio
subnode in the SoC part, and rk3568-nanopi-r5s.dts[2] extends the
subnode, while rk3399-orangepi.dts[3] has the full subnode in the
board part.

[1] arch/arm64/boot/dts/rockchip/rk3568.dtsi
[2] arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts
[3] arch/arm64/boot/dts/rockchip/rk3399-orangepi.dts

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

