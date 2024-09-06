Return-Path: <linux-renesas-soc+bounces-8795-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E40C96EC24
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 09:38:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF852285CF0
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 07:38:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E72A14AD3A;
	Fri,  6 Sep 2024 07:38:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504413C463;
	Fri,  6 Sep 2024 07:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725608332; cv=none; b=QUFOEBdJIBBdXdIPm5aUiKesZV0N+ygPGtYrVlSPXFgm8Ot9xAO9diHsAmmzjzFEcibRl7hWM9mcdoGQBbiMxrw/a06O5xJSpl0nGhuuWGj743nwUskkEuVgJ+QIld08go4QxUnXZwwqxHn41Ng7NDTXNtPHP7HOaAph9kQ0ouc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725608332; c=relaxed/simple;
	bh=17vV4XT+Tb87qz9Q8+49bqyZVzluW1wc+r77diwYROc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bFEx2Gr2r8JKgWsJM5mEjcsWbtD8TN1VXtW5T0JpP6bLfLuJRiMXvXxhRTbWueZIXmiiPGDMFqfvewGKgDYptnetNPSOSLKFVXRPxLnYXfjO2vG2gQ0NUIAm+b1sz58ih6x4+gZEOQxjTMqEJkiCYFdjBdRH5xfScfUCbcTZVJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6d3f4218081so17434517b3.1;
        Fri, 06 Sep 2024 00:38:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725608328; x=1726213128;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d/xQhV42ZUI1fcy9JagOpFtn+8aZjojJQpKnD2zOZrA=;
        b=VViJ65koaAIOD1Ps7l5sUC062WpRHS1UyV5p+m/+tNqK341ReG2X9sv2FzR+hM8w8z
         5Ek+ZAax6dv/Q/Ha2Ox6d6Dj/31/qMARy58ryfGBd7DahZ53fHR99i6RPYyIv25mNYgN
         GAZ53HEjjLMtGSwRUi+8u47znxP0m6B/bMPff9HOHSYk1QzxVxG6zukOYq3RezkANQog
         GW4i6IZIz9LzkRYX7zailjSsZeMqd3EMDQcWHsiP/rA1Z1xtAHslxKb9N0TA2IEPtYGS
         7I6WeVPyeQ4UrkvUBqLPhkN9FwyRD+hWthgLNIy2zpq+lErHCEI9fTmn604JzEImCdjG
         oHvg==
X-Forwarded-Encrypted: i=1; AJvYcCUbD7cs9x43KevVqEuyfTkOzK9HSrfOsFPosUd3o0WZu3aFOYHZouNMv/7u8eUrhjb7foHijmZ4nbhITxz8@vger.kernel.org, AJvYcCWIV16dK2tfqm8Zo4ygSg8PcjE/rolMEFF85t2+XkC+sCXMg8XKizVxevK70i+cPmF9ADCW8da8pT5niPw677/Bj08=@vger.kernel.org, AJvYcCWNeGwSZZzBKck3eASO2eYHLBu3QLa69C4IqnWTtMEho/ABOydYbk+yP+C+iaZ0dOVghF96qVslpwNr@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx1kpNMg14zCF+OqKCHqEUd8Tp6c/07NhFbROTJDFuJorGedz6
	RkKx9edPu4xjhQnGuPmfmtW9mNaHhFH2EVVlRdsgpaYTkrYV964FAN/krlDr
X-Google-Smtp-Source: AGHT+IGZsITvPNN1h+7elDt2YGmacncoBdkeSIPya3WnEilaBwrUHFdGK2X4wDk84AoSIBVwG2b4Vg==
X-Received: by 2002:a05:690c:fd2:b0:6af:8f7a:28b2 with SMTP id 00721157ae682-6db44d68731mr18747617b3.8.1725608328398;
        Fri, 06 Sep 2024 00:38:48 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6d40f24aafcsm27853817b3.89.2024.09.06.00.38.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Sep 2024 00:38:48 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6b6b9867faaso15234187b3.2;
        Fri, 06 Sep 2024 00:38:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUUxREXAM3IEF6qtIYp5uqjKy/3QLfX5ZJkc37cOovC54PeWmTOChK7BgwSkGL8WLzOCBH824H3XfzQ@vger.kernel.org, AJvYcCVBqu/tqeiPLP5nKaSssZp3quPVDsgfHhii3XLcNE8gsinffXifQRC+ztAwpVxGBAqqlsl9qYxtsa45QcDOxYVstzw=@vger.kernel.org, AJvYcCWYSyifIleGgEOqz5SANeHhGWxpUrex5O6iE5IDXuZmO5YHFzoJBg1UwvQE3fDYlpTrPnoWIBXRtDSYy0+c@vger.kernel.org
X-Received: by 2002:a05:690c:3384:b0:6db:34ef:95cc with SMTP id
 00721157ae682-6db451649ecmr18327937b3.43.1725608327988; Fri, 06 Sep 2024
 00:38:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240906062701.37088-1-Delphine_CC_Chiu@wiwynn.com> <20240906062701.37088-31-Delphine_CC_Chiu@wiwynn.com>
In-Reply-To: <20240906062701.37088-31-Delphine_CC_Chiu@wiwynn.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Sep 2024 09:38:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV80pF+rVhRWeeZy3tyZCr5y=qRWYm1Z655t3ULZJO=yA@mail.gmail.com>
Message-ID: <CAMuHMdV80pF+rVhRWeeZy3tyZCr5y=qRWYm1Z655t3ULZJO=yA@mail.gmail.com>
Subject: Re: [PATCH v15 30/32] ARM: dts: aspeed: yosemite4: add SQ52205 support
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

Thanks for your patch!

On Fri, Sep 6, 2024 at 8:35=E2=80=AFAM Delphine CC Chiu
<Delphine_CC_Chiu@wiwynn.com> wrote:
> Add SQ52205 in yosemite4 DTS.

Please explain.

> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>


> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
> @@ -1245,35 +1245,35 @@ adc@37 {
>         };
>
>         power-sensor@40 {
> -               compatible =3D "ti,ina233", "richtek,rtq6056";
> +               compatible =3D "ti,ina233", "richtek,rtq6056", "silergy,s=
q52205";

At first sight, this looks wrong.
However, these three all seem to be functionally equivalent power monitors.
Are they software compatible too?
There are also no DT bindings to guide us, except for the rtq6056 part.

>                 reg =3D <0x40>;
>                 resistor-calibration =3D /bits/ 16 <0x0400>;
>                 current-lsb=3D /bits/ 16 <0x0001>;
>         };

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

