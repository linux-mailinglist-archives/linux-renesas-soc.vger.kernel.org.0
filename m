Return-Path: <linux-renesas-soc+bounces-16772-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF5DAAE79B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 May 2025 19:18:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B19D43AD4C2
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 May 2025 17:17:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3445A28C2B3;
	Wed,  7 May 2025 17:18:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C661DF728;
	Wed,  7 May 2025 17:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746638281; cv=none; b=KJusaf+Bkd+hXTunRPq/EXi58KdIsLFgTEpW3J68RGvugvubaJ1/epdwpxYWikUE0XF04QbglSO3L80QtZ4CXHnQRleU3ByrXqEf4C9/VJd9F6vapnJ3FEwSThiHQDX2ccqCKPPSISii+OF5q8kSkSSQeF5WlbIKjGE9icmm9Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746638281; c=relaxed/simple;
	bh=To4Nka6PcTnjY/W40o5KRZA+FJVBH94/uqD+QUvAcg8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L9N47GnuWZPzFqIcVckyDPSSXYJrFKgFIeaGrwSsXuVzzTLio1GmZTBHQn/dZ8kj0h56wAxoutCQt1yZZoO1+WPQdXvLsZPXsNkVQ2h5oGjIwBvLRj4HOXdkiHTHfYPzOfwJKTQV7eEjHwLD3a1WdYU9AELXgfSdR/n5v4KyDVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4c4fa0bfca2so25056137.0;
        Wed, 07 May 2025 10:17:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746638276; x=1747243076;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8VFgCHIP/JVV/sPKyqeBY+tuXtoeeARuomTCXRay2l4=;
        b=AtVbCimd/FcSBbf4KpCj5dTLxnf6XwUn4/M/VS0dVncKfF9mv+zcAb0/H1COnzwlcX
         8p3QSyIEPFiCJ65YFM8iah6+tbsoQ0IrxJ22cXVu8hZdVj8d+kLypXA192W16r5Jpc9T
         CCLvbT9fDfLGrXfciOXB5Lhendq4yU4gwuENHR0AJByEq84bx4sNwZz0zJYYEAd0ndj/
         vkczlf2sg9U6S0lFrWj15ZwMa4PyUAR2bOdveD2g5QJUZ0HsPr4aQmFXmah1RfNmtmk2
         dzIuv7aQIa+yMfFmcaoa0217PzGiuwIgUXWCZ3b0u7bffKPeWCaRYQs5uaJrY1pCxGb1
         +AMQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/Bt41zx372WVSpoEGK+5gShvTT/vU/HxZe8Uh1DYljEyh6um77e9EGulgOPCVGvKdvT6xhLylY1keWg0T@vger.kernel.org, AJvYcCVBdqTlU5FC92BTcaD3ipP6Fy5WdgCHAVO4EFsiBT0Ia+NXix/2S2Avsjx23gEdjVlDFzQWv6MdyBmp@vger.kernel.org, AJvYcCVioFPW58LDey+DD5gq8n2aiAPyUpUL7QoHk6gTJofwSkO421BP0Z4TgRxjL+CYVNl2S8PRQm+hvjCW@vger.kernel.org, AJvYcCWTpao7T1qXI1qWc37rb/z3Oj6oRNnRqKkq21jc67VaeudtHOj1Rwd2X2+36DcpvB/m9+cN1GsAumwHbUln7pS+7fo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4ktBsbkjQTDJdYi4kdqNCGhCI6kIx1K3PNx4A66C7Zdw6idFc
	miUZ1ooA9/opgdT2o8soQBNm+qzxcvVVMJl27wjYlExFmi+xueG4XvcEVeTs
X-Gm-Gg: ASbGncvRTYCi/Dm2YFtMwn4HQTqq/pmNUJS/u0hWTByMO+XFgFz+XhG+3J1TFGoC/B9
	F1nr9P1erQw7d/xi4caRVRkrXd2KOPS1nXn0dYxd8B9tdxQtpkevR0/ufubW4I+/8d/2LUcCMxC
	LbQflbFwlL1Sfy/B5NEcjjUd0KJsV0Nw+w4gJSLQFTZ4sLNlDKDslo1ItGzdxEMyr2001IZsTmD
	OnE0S/EcvpzdwhHwsul8iYlFihHQ+FDx+6MNDrWsAU/Gnmkdid1WidgMfoifJ81/oo5zfEIADIx
	uK6lySC1pyx/jFDeBk34BJmNnPhP/WfgWGvcwGx46o7/wIh1wdhWbLUX4Nrpvag7CIekPnkxH0o
	+4X4=
X-Google-Smtp-Source: AGHT+IHPIXcDpBrKDJs8gxDAM7Nj25eRQ9ltApOmLsB34EAC7YxZQicy1/D/ZLz0J/n81OW+F3/KZA==
X-Received: by 2002:a05:6102:8015:b0:4c3:6393:843f with SMTP id ada2fe7eead31-4ddacf2e38emr336533137.5.1746638276398;
        Wed, 07 May 2025 10:17:56 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4db1c605c57sm1391200137.13.2025.05.07.10.17.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 10:17:55 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-86d5e3ddb66so30088241.2;
        Wed, 07 May 2025 10:17:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV6dt+FEoCl0Hxi7JRP/DrJ1jCHehKgy0gZNKTniE2uNynPOSXlCppXJ4O4pTtWzgLNfJMGJeSdQbVnIQvI@vger.kernel.org, AJvYcCWO/FLJEUGeC/JuQ41HbzqeBgUpFQNlG4SM/dLFw01uWrqv7Ba0p/xOx3/f1GBJSfYy9Fv7U4yb/V89@vger.kernel.org, AJvYcCWWwTONuIAxaM5EHASdZFXg37fJ2JqNd+t2Mh2i8EkkwXm8MPv+l2iJoegWMedSovcbnTf7kkGXCIuJ@vger.kernel.org, AJvYcCWjT0c2d4rbKZmDovEkAqr8Z+ctJwVGg8MdZ/t5jvYlUh/yJDIdE6vMe0QYix4r+J17rHdrcqpjbhzdkp9TjYHVSPw=@vger.kernel.org
X-Received: by 2002:a05:6102:5247:b0:4c3:6568:3e18 with SMTP id
 ada2fe7eead31-4ddacfc3838mr302535137.15.1746638275342; Wed, 07 May 2025
 10:17:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410140628.4124896-1-claudiu.beznea.uj@bp.renesas.com> <20250410140628.4124896-7-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250410140628.4124896-7-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 7 May 2025 19:17:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV4OgiQBU0HbzpdB2Dj1i8CFdw_4RTeJTk4nKiypvar=w@mail.gmail.com>
X-Gm-Features: ATxdqUGj-wUJNPIxE39nb_-uJRxFLq7Nslb_bmFxGktZdIK8uRzxScDRTKEfXQw
Message-ID: <CAMuHMdV4OgiQBU0HbzpdB2Dj1i8CFdw_4RTeJTk4nKiypvar=w@mail.gmail.com>
Subject: Re: [PATCH 6/7] dt-bindings: clock: rzg2l-cpg: Drop power domain IDs
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 10 Apr 2025 at 16:06, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Since the configuration order between the individual MSTOP and CLKON bits
> cannot be preserved with the power domain abstraction, drop the power
> domain IDs. The corresponding code has also been removed. Currently, there
> are no device tree users for these IDs.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

