Return-Path: <linux-renesas-soc+bounces-12384-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 87620A1A255
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 11:59:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D22B0188E621
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 10:59:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45A9020E006;
	Thu, 23 Jan 2025 10:58:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BB220E01C;
	Thu, 23 Jan 2025 10:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737629896; cv=none; b=aEmSp+r/OCkmWvD/Ov+cXUixk7QxMQU9KaeDpjKepuPGdmr5epMRB2pHaKWs1Kn25Yd4CX8gzEQT1jufvZj8Hx0HOXSa0lCya0ZMr9HKsJEBBQNax1JFeyXAeulEqqUsjNKQimng9eNmfourzFG49xwxLzh6V46iX3RA8zYNXi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737629896; c=relaxed/simple;
	bh=AXkXDm04aJrnHMIYe6Z7R6UnyqZsbrxovvQ8cnCwObM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I3AMvQc5PrnhBegkEUdGkQnMk9XRL+rC1rPP8hmMFtd7Cn9CXh3m1YMwYohpgAbi3ay/64efwQIbSkASINHZiKya91CX0+/Zi1i4n/IGjiDd+WfLcj/s5dbI3lWsatT0R7Et48G622aAA2Uj0ebxSVVoVtvrp1VhHNrxrhHEINw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4b24bc0cc65so525390137.2;
        Thu, 23 Jan 2025 02:58:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737629892; x=1738234692;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u4lUeTcZvVxMIoOGYfuxtXTH1NmXCFUN3QN1yYp/mo8=;
        b=ixzCpBKZJ0C0pqtZL6jBiuT8nVsfgc0o7q0lUNvC0Q4BsR2xKl+rrb/A6AcgIIXVMU
         W4oHIOeg69aWZmyuthbg1JePGT7bFwTMyXQtCR9Nr0tcF9wOilnGR+/420ag8YN5IB0o
         rdvCzF6vSJ37MSvOn7e/tkd+LcrgfU3fVxH2uw3Ufjfqin42AgginCX32XrwGd2uOTYQ
         L0r0kt70u14D9P9yecxjaHpcFH8vJceO8uK233bsBCJyYtNIl8C8eqF4isJUDnwi4DEK
         0Eynp02RaHV/AHQ4n0lIzoFC6dru90swDCNCRPDgFIgfGA7DzWNlD8xCVNYmy298SJJa
         eAoQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6wzDkJDdICXniM5AMJIvo9V2kdhwAyjxCu6fbUaZEJaltPP5YQgAb1qlUnPV/u2WmcC7ycJXSSRfeFiM8l1KK9mI=@vger.kernel.org, AJvYcCW8YifMDFwTeq9cSF5bdkhNOA8eo76sodt8fEm2tqs5bQG5M+dbQx+QtR5UHKWtRfDoyoNRE2hgB10G@vger.kernel.org, AJvYcCWhoRuwr9M9i4qFfKeZvAUBcIbeBeh9805iXXbtFZp22t9V/yR34E029BDitkIrwiqVsyYQU/QMxrPC6uea@vger.kernel.org
X-Gm-Message-State: AOJu0YxUtQ2mdRSGLftRjb5oCmT+hdUGCBjX2GP3KH7pk3R/HbhLkkin
	8bc5LlARG1v3RV/t33QC6qv2DH629XbpcvrXLHR+AACYZllQTMAYee1cBdCY
X-Gm-Gg: ASbGncvgvUBTT36g7wwsBqyA4nGu2qfs24d4LEKvNp64Pl2Mkb0AM3tnCBWGTLVQL7Q
	dUuaBRrv7qiz3Oo0UAjwaBZ5v6XtJNt/LOix66+GdQxH5z6qDhLeQ/GzJz7aC6vVL1DTFgNs5g5
	RXz3TfElHUlcOWkTicexbAY+8wvFnM0rkcM7pjBHhDerIHNcfV49F4flrlqu6j5EhGolqye9f9Q
	trnaJr5qqv8s5qJAY/7TLNsUzcreSHQ++ZEpDQ5bc/WyaQTMMncmDUhGRDL7G/HVVcOR+TomP0g
	6ASwVup343sEU6rZrSm6IMWI0tI1HqulsdNmPiKfz6RLmCUlOZnSRg==
X-Google-Smtp-Source: AGHT+IFFWBdYQ49xOKdgj+tG+kVQxFcaCHnJA+dVDF3iVVmCHfcF5PjfPT6xWFnYd326p4oZ4dHvng==
X-Received: by 2002:a05:6102:dd2:b0:4af:f49a:ad76 with SMTP id ada2fe7eead31-4b690ce55f5mr21476527137.23.1737629892113;
        Thu, 23 Jan 2025 02:58:12 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b68a3182besm3102409137.24.2025.01.23.02.58.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 02:58:11 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-85c5a913cffso511026241.0;
        Thu, 23 Jan 2025 02:58:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVYk3rSmGSWXnJkKAsQWnkFlM4x3SoVX9Qy+sF8HAn/8UZEZVcVDbNUspKQpmFQ8EbQyz++xDuSeVWZtJkAVjvLtys=@vger.kernel.org, AJvYcCWAyrrp0D+KLxfs3umo0NOiFESrO8sncSe9D/o0UJx+H8ED0q1atdGl7Z7Y+gk3tH3pCzFJskvd5ETlY4v5@vger.kernel.org, AJvYcCWoXrJFwHOXBQp+dCaR7F9TaIQpVItggguz8T/1fClxk8rs0ti+mc6VxIzhuVlG6weOvR++K78ZaHMu@vger.kernel.org
X-Received: by 2002:a05:6102:801b:b0:4b1:f3e:882f with SMTP id
 ada2fe7eead31-4b690b7c5c6mr22938380137.1.1737629891824; Thu, 23 Jan 2025
 02:58:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250116144752.1738574-1-iwamatsu@nigauri.org> <20250116144752.1738574-3-iwamatsu@nigauri.org>
In-Reply-To: <20250116144752.1738574-3-iwamatsu@nigauri.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Jan 2025 11:57:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXwdMA2j8cRf55mKZqe0JRUuopRgEi5Sq6e8AYJvvNn3g@mail.gmail.com>
X-Gm-Features: AWEUYZn3wuukNeals1c7p0_-5mUaXGxT_KmWTtvuSyUG_N9JuBjo2tS2ziFLHMo
Message-ID: <CAMuHMdXwdMA2j8cRf55mKZqe0JRUuopRgEi5Sq6e8AYJvvNn3g@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: vendor-prefixes: Add Yuridenki-Shokai
 Co. Ltd.
To: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Masato Kiuchi <kiuchi_masato@yuridenki.co.jp>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 16, 2025 at 3:48=E2=80=AFPM Nobuhiro Iwamatsu <iwamatsu@nigauri=
.org> wrote:
> Add entry for Yuridenki-Shokai Co. Ltd. (https://www.yuridenki.co.jp)
>
> Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.15.

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

