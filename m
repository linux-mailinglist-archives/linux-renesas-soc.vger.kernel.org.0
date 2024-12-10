Return-Path: <linux-renesas-soc+bounces-11163-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D279EB509
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 16:31:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27C6A167338
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 15:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FECD1A3056;
	Tue, 10 Dec 2024 15:31:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CB0282ED;
	Tue, 10 Dec 2024 15:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733844698; cv=none; b=Ld01/9uF5o0z+pVqAYoZfTB4zMtG5R0LL72gdrd92gZfd9kRr4tAvCvd6/mev53MKtvZGkCfTIJ5CGLkKLRZ6hQdsBc+0b807ZrlwjLECuQDiSVjOKHHsFEw6Kh91wLaj7fMI/IjE1nT+fHmcx3TDtckTX2EGeGQITFYKCKZYwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733844698; c=relaxed/simple;
	bh=VVgqv6FkmSnI+RO2vFqJXLoC8vvYFCGEx4TZsUvSsZw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U1v3G3hg5zxFleiyZ1YmEqXuHQsFnjIGVXU5RR5iiJAgp+5VnjTRtEZ33aUOaO7VWPJmdKNXCwNyD/3I3oV/7NUFtdsivKdLpQPKmlzBwE5XpA524IN5tks41xSNp1AU07MDGa81vsJ+wwN05D149JH0sNbCMSIrXAsptTBLAnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-467631f3ae3so14672971cf.0;
        Tue, 10 Dec 2024 07:31:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733844693; x=1734449493;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bvkDKTKiNoo1ealOS02lkDBKr/zdbL5bowKhEQIzcag=;
        b=lZNjeADijaZ4vFdWrT3mAwyyPrOYZ2j8MQNubXNQhYsRG0y/jarPczxPWc9yWSivS0
         W5bY6+mLr50wDCQIm59VsUQFYIGbF3nCubQkcLRU8LYqUE1PRGvajHW8i2Xa1s3bhryM
         lfv9ay67tTbFdu+2kC3F3rw18jqXbIP0zTNobZtUT3TQsAFt4yFSTl3e4Fa3SLE73+cZ
         6p6gwwND+hv0BHCtVrgCHthUeHWJlU/IeNWg+rtvb55KzqFRnvr+eiIy+Vp3sBpS/cAB
         qePdeUf2J2nSXByPJuZINAsTPlWvoBzIi9y+gE6irEsAcHaLZ0DbpvYFrejrM4xeavIM
         uPrg==
X-Forwarded-Encrypted: i=1; AJvYcCU72qsVs6osOYPAdWGLjZJIKQXGcEQR8M0ZkYx7tQuzmWgP57MJXH7xQT49wmP6oqlZWrdh1+K8r+PWEzYR@vger.kernel.org, AJvYcCUTMl9uNbIjfV5bJnjgL4b1Sz5DWcwCC68l8ZSd8tqUZlYxatMzXPQdudTxqoF1G96xDPwNTIkjZHvsmmvZFFTcuMY=@vger.kernel.org, AJvYcCVX8/d0AX+/luOSHZ/m2dtFcCBM4JPgPTiHOSqg/LjBSVaXW7hDG1qGY5QGprcfl+G7+Xu/K9CZPedd@vger.kernel.org, AJvYcCVcXNUMDhUk9m5UPhKaPXu0EzFyU5TMsFnvk6SemuYlrmRbHv7/npp0FK73X6jH/gWNjwtv02QNL/hj@vger.kernel.org
X-Gm-Message-State: AOJu0YxefZ9UNXoS0WYfLVGiY4QdactfESQwmwCOaeNIUbMZB5A+SM3i
	MIlwwSzp/qd23ODry/rIhMuLRjkD9gFRDS2VwnqGb3ykcJ0Cb8jMPA3U+GZv
X-Gm-Gg: ASbGncslgzRFY08tojKMtCpivLM8q7VGJeyvMe1bvV/GeIU+qDyi5CzlBymJK16KdlO
	ZAMt+4FrFG+Ko1WiZw8smjWTc0gDiqV+VMumAl3aVE+NIdQ+WsOjacFYDRsR3dCp7UvAJTQk+E1
	err1LK2Ns5WT/Dq5YEMBqJ7R9m+R7poxvdfBRN77AsiJbLbLs34V8/Oj+IiohPJGbT7QM00EcIc
	vW9JpLPPs6fKdOUCQT9M3F4xLQ66bO2b3VnJEqDd4iP61uCDDC7RG2ef1l/05iVj8/O1+IhnimX
	Vi7uNkcKDIugAF1Z/ufG
X-Google-Smtp-Source: AGHT+IEktidqbq0PT9EFy/m/p+2IFKYLgPVlfFfsQVe5CG6vHlWz+6hEYKsvqZs/gG2ZCEqK2Zae6A==
X-Received: by 2002:a05:622a:1a9a:b0:464:c8d3:30c0 with SMTP id d75a77b69052e-46734f76d97mr275261591cf.35.1733844693112;
        Tue, 10 Dec 2024 07:31:33 -0800 (PST)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com. [209.85.222.176])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4675f92098dsm26136661cf.67.2024.12.10.07.31.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 07:31:32 -0800 (PST)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7b6c8b11407so157326985a.0;
        Tue, 10 Dec 2024 07:31:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUQwj3sHctJYC4uh6Yxtb6IiwYG+URgbL0ROIPau8et1rUvqmC9E5C1wjIzOBV7JKZeKpo2QtNR2H5Z@vger.kernel.org, AJvYcCV6G9GDoH0CK3Dpp0JURdgs5RPjqypm76tXrTJSARn/YjYtr6nyPwNDlWU/H+UmVkPJRb1YT9jYaI7NcScH@vger.kernel.org, AJvYcCVJtnILVIujexlw/Qu3B90adCT8CQ35lPyy++ET2JWKUOzcXZu160Vg7EiKmd9U7iGDOyTXhlfb9ygS@vger.kernel.org, AJvYcCXFDz+ulM+eUs5DO0A14iWLbB6zxA0nADjH4xdIc3sQDfbqFMQIHe8K897A4q/WIPcuLJ8Tb/SyG6gqV08VP7ODcYY=@vger.kernel.org
X-Received: by 2002:a05:620a:29d6:b0:7b6:d273:9b44 with SMTP id
 af79cd13be357-7b6d2739e80mr1380681885a.18.1733844691902; Tue, 10 Dec 2024
 07:31:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241126092050.1825607-1-claudiu.beznea.uj@bp.renesas.com> <20241126092050.1825607-14-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241126092050.1825607-14-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Dec 2024 16:31:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXv3=pEfx9YiXqh1nFfa0jVD-TRoaxfije8KuzkA4A_dA@mail.gmail.com>
Message-ID: <CAMuHMdXv3=pEfx9YiXqh1nFfa0jVD-TRoaxfije8KuzkA4A_dA@mail.gmail.com>
Subject: Re: [PATCH v2 13/15] arm64: dts: renesas: r9a08g045: Enable the
 system controller
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, p.zabel@pengutronix.de, geert+renesas@glider.be, 
	magnus.damm@gmail.com, gregkh@linuxfoundation.org, 
	yoshihiro.shimoda.uh@renesas.com, christophe.jaillet@wanadoo.fr, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-usb@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Claudiu,

On Tue, Nov 26, 2024 at 10:21=E2=80=AFAM Claudiu <claudiu.beznea@tuxon.dev>=
 wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Enable the system controller. It is needed for USB and SoC
> identification.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
> @@ -207,7 +207,6 @@ sysc: system-controller@11020000 {
>                         interrupt-names =3D "lpm_int", "ca55stbydone_int"=
,
>                                           "cm33stbyr_int", "ca55_deny";
>                         #renesas,sysc-signal-cells =3D <2>;
> -                       status =3D "disabled";
>                 };

Please enable it on all members of the RZ/G2L family, and combine
this with "[PATCH v2 12/15]".

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

