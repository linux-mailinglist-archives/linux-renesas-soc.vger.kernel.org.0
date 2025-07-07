Return-Path: <linux-renesas-soc+bounces-19313-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 16107AFB28B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 13:47:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D6EB1760C1
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 11:47:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A288E289358;
	Mon,  7 Jul 2025 11:47:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF4B1F790F;
	Mon,  7 Jul 2025 11:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751888868; cv=none; b=aei54W2PjxgpfksqvzzUFVOUd0Zr66Ylvh+xF2k4G7rpEHg58AeVj/d2bYdQLNudhi+lHqyfrzKRhYB92McJxQhJhE7Utdgo4dPTQKTC0Fv7ObABT4JCTWe70Ycl4lQA0qUsiwu6QDADmAzfnnLQ4owaENVmCPloAL5vw9x3dfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751888868; c=relaxed/simple;
	bh=pqtGbvFe50dzIt/ozQzefWcUhX7Nvfv+KWvzIkd/5Ic=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WaltMFaeoGYeT2fHVuqAYUvFS0bYy52TDLSAs5EIu/6aYNNcBFE9DxMqX4/nxpEERR8WBkOODwTUO+3tymuSDwu7r3rrM1sx/wxMXK7IjVidfsOXyqYKr+GdKlB33SwWh3kJJZB6hELpSmrtVZaGgEuER4QFH4IF1o1TX8wmkOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5290be1aedcso3185905e0c.1;
        Mon, 07 Jul 2025 04:47:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751888864; x=1752493664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vqz6ail9a2lZl2f2rkeZnHcwFj2PeKZLl8yrU9geXlU=;
        b=CbfB93wfVeM7tdBnT87eRLgpJIGQ+2OMk7C2ym1JPYfmvCbG9Ws01R7FZjmhivtxOC
         Gix+J1/2ZoznX7ekS6RON0FuUKmTwn55cql3bJqvHpIDrISFFjCiFreilKYIzS7vCszR
         mJpVqSAo4K1K1ffSEVHlIRqZFoHh/bE3gCbTSgWdcvxIF1qaDHKbn8yeMgL0Ny0Mug3y
         MZjIP6E35D3cFMlJPISWYClwvF8IK279rPT4N/GeQjobEKxe99kS4eiNma7ri2I7FBpi
         1MZR55LGBg0/y5zoHipsyfkxu+xqZ04Fe0HPv+KHTKyVAo1wFo8JR7Q3ZdSLrFDrANr2
         iItA==
X-Forwarded-Encrypted: i=1; AJvYcCWlQ+deATy6y3wQ0LtX0SsIXW6LDIwYwqYr3/Kp2QZ1QWu088/FRe8wcl8qCbsTUyIFMkk+rs2sHB/h3MjbBUEnV+8=@vger.kernel.org, AJvYcCXpvXx0HdO/XQYiqvm7l5ytSltHKGtgicdVAgjdqsdJDYfDlfuWALm3F48Z13ijrafPz12/jRPusl3D@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy12L1jErABM+m+fyZ7SNawW82POUFh1bSO8/C8nI4xWVtp7U9
	KqU/0O5Yj0mgGluqUIy/n7BePPv9BBhh61pIkoDiyfZwW45V8WDgHfledT4cTL4N
X-Gm-Gg: ASbGncuUAGeEEDWg+/D5DEMEdkeM8QnGjNQ0EdOGst/NiKOwtgMW4DxErwUb3Kd4GYZ
	dvXg+24iJ8kkYACJzh/ipfL2Xo1W8S8g70XUkXqa1p/bWS+Ozyy/bXmQvxE+v7tvL7zb7ZNb3O5
	snGHDDb7nxXU/pcO5hMIYKdH3lAgEhlfWQEAlM/zcvORVsXpwPYDE7mCe5FH2vu4BXo2mKAflQw
	hFNWeNpEVtkzBW7a6wMxyAoTL2h9zAYcboGAD9ooVx72ku/zGb3Iony8smMN1WlyyQbOik5lAj0
	qmPvKLBGagNCB/vwaMrLZA6m3d21BK6ZeD8r1j9aSol5m5eM7v3o2y33myUNgB+nPh8HWdT/r6Q
	HiOYJcNA8CxnZ+5ybKCIdL4IkxOURfleeVVnNQ4c=
X-Google-Smtp-Source: AGHT+IGqoWZS8c5Ut+BJIVJ/L7KFv5Mckf+0XXR6VfTyT8n983rIQ69d4O+/IEwlYhdQVVZs4ggLUw==
X-Received: by 2002:a05:6102:144d:20b0:4ed:e307:adc4 with SMTP id ada2fe7eead31-4f2ec76b702mr5378963137.7.1751888864421;
        Mon, 07 Jul 2025 04:47:44 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-886e922e896sm1435265241.6.2025.07.07.04.47.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 04:47:44 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5290be1aedcso3185862e0c.1;
        Mon, 07 Jul 2025 04:47:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVFHtvSHNRPrC2ixeRB8QWCkGA5h5vwmeE74f2Ge5WxbMv/GE6qnjoLCj2YJ6F5SQg5nuf5SZeDkPAaSbV/TTeDV/g=@vger.kernel.org, AJvYcCXjz/DOw5DjB2FRh+VYmm3paUIJiyyAy/SYA20MiPUZRGM/fys1R3JaeE9G3Rdkrb92qixywh0TSEUG@vger.kernel.org
X-Received: by 2002:a05:6122:3548:b0:535:3125:9b00 with SMTP id
 71dfb90a1353d-5353125a066mr3949373e0c.4.1751888863597; Mon, 07 Jul 2025
 04:47:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250704100734.3387856-1-niklas.soderlund+renesas@ragnatech.se> <20250704100734.3387856-3-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20250704100734.3387856-3-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Jul 2025 13:47:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX-1KJ4yrNeNT1SYqvfrn+XEjWuMxQkNTKJ5j9+fxgDdw@mail.gmail.com>
X-Gm-Features: Ac12FXxwjRnPTKitAeyZYlbuSaKiGGcYbp2iBh_Sana_txh4dTsvcCrw2Olnd2Q
Message-ID: <CAMuHMdX-1KJ4yrNeNT1SYqvfrn+XEjWuMxQkNTKJ5j9+fxgDdw@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] arm64: dts: renesas: sparrow-hawk: Add overlay for
 IMX219 on J1
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Fri, 4 Jul 2025 at 12:08, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Add an overlay to connect an IMX219 camera sensor to the J1 connector.
> The IMX219 utilizes 2 CSI-2 D-PHY lanes. This enables the video capture
> pipeline behind the CSI40 Rx to be enabled to process images from the
> sensor.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx219.=
dtso

> +/* Page 29 / CSI_IF_CN */
> +&csi40 {
> +       status =3D "okay";
> +
> +       ports {
> +               port {

The base arch/arm64/boot/dts/renesas/r8a779g0.dtsi has "port@0".
Still, this is applied to the correct node?

    $ dtx_diff --color
arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk{,-camera-j1-imx219}.dtb
    [...]

                                    port@0 {
                                            reg =3D <0x00>;
    +
    +                                       endpoint {
    +                                               bus-type =3D <0x04>;
    +                                               clock-lanes =3D <0x00>;
    +                                               data-lanes =3D <0x01 0x=
02>;
    +                                               phandle =3D <0xf2>;
    +                                               remote-endpoint =3D <0x=
f3>;
    +                                       };
                                    };

                                    port@1 {
    [...]

> +                       csi40_in: endpoint {
> +                               bus-type =3D <MEDIA_BUS_TYPE_CSI2_DPHY>;
> +                               clock-lanes =3D <0>;
> +                               data-lanes =3D <1 2>;
> +                               remote-endpoint =3D <&imx219_j1_out>;
> +                       };
> +               };
> +       };
> +};

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

