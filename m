Return-Path: <linux-renesas-soc+bounces-23203-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 0945FBE6F92
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Oct 2025 09:41:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A9C9F35B15D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Oct 2025 07:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE331242D80;
	Fri, 17 Oct 2025 07:40:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1527623BD06
	for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Oct 2025 07:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760686858; cv=none; b=PX31f9kZNRJZOC34MvUIo6Rd88/Ql/RtfosQyYkpRN7BjoEbnX4OGw7QgxmTfW/NH3dQlX8OIFJp82GxMRgA2M8oMOiWATDVY/7zbS0ijN7QrUTQfF12nlZz+ZEzeXCNnYz059/QYUWmqjo9xurr0fzSx998RGqMnLeiNwPn4VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760686858; c=relaxed/simple;
	bh=cLKqVn8Z2TBqSDRqJdQ7TokPZf5KyC181WbIfaA6di8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q7GwXXsZCniYXD+bXneYEO6LYbpkJf2VbViuSVZFPVddOGTNtOCl92gvBLlBWuNTqonswY3uLg5qRtARvLfneA1Rnf/MIl0oONlPJ+3rxmaQL1UQ4kmjN/ioXv8YOKqhB1Gc3eUGpeiF2fi33/hW9bX1XwSGFJm8jlXry5SXKJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5563c36f5dfso635716e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Oct 2025 00:40:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760686855; x=1761291655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FsO/hn7ZxXSEVqf0RwtjiX3Woc/Jh2yXP3yIe9HcSiA=;
        b=MIWiXTrMHCeA4ThmJBcorcwVfa27bPnxiY5PG56rSadmWvrp0mUF2UG/Wb0oxlfKCz
         FO3eTH0DgyzQ/S4SS5Qshnxl6D6QutIOMXX2LJdx+iFwk2mRVpnzzc+426doz09o0KbY
         Qzf+qZgwRkQ+n9XQnC1D34WRWLnQA7PQZKwHa+tE3bnqQ3dWtBJU6CGBibXcSpne+1+u
         iPTQZnxxrdEqGnea2dNmzqqsYtKoQYdfWHDJLccagvCXysaFbSzU+qj98YzygZHvJqOp
         ZbXXeXIqaw1TvhxKhYINNVmXQdbu4n3I5wVIaRrRbgY2Q3NYQaBXFEClCIsE3j13U54R
         XfZA==
X-Forwarded-Encrypted: i=1; AJvYcCVE63GzTTCVRdeHzbEi3lf9YSV8w70dGuSyKmPpZt0oS2365G3OAv+KHqveNBDurU6dQLjLOkMLF63ORLSh4OMgfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YySJWw4+doQR2GdyvgKo4jl6Q18XM0lBKWBOZsjBnc7y7QaVLoW
	M/+2LQQyMt2rtpeJvmOz6fqbV0InhTpD+qwIvCbF0dts1i0P8Bsrf/3SOfZDSKKV
X-Gm-Gg: ASbGnctoG9o7YVkX3js6h0LYzW3FRYMqD0ytEs+wpNJQFzBOfLvb6l66dTY8IdAANIy
	B/X6ubhFm/qrVNTsmgDJS/BbQx19Tyw5b20Qau2eob9EMtIKVj4PhP3PgNmahHjUFqKtWCP0rlg
	sNljsCsi7/Krgpadl+sx0oMoPt0d8POHVghGOx31F/YNSPfR6sB9ybFR9ZUEsWuJrIjaVkd1WTc
	R+paU6+2DXKAsv+fELPIhWgMw8PYLkvIk6KYGd5B2KolXwXNB6HqcwUoOSmU3ozh+8DALX1byV2
	GCX2XNUgYo04Yc7CF0NNiHkvqF5NwEaFS+vtSQA5xeowKJ2duedcpx5wSqiSvbvAJS8r5eQLt4B
	INzMAie7uXy7syrAhCVKwooZfd1OhVfvog4ElPRCS0nRh8fWpcWx0nk+x9Hi2eGwO0PSXSI7AxX
	cdQD4VbtILRPblYPZ7Q1EQfMz8pYimPZgvSVh1JzSfiw==
X-Google-Smtp-Source: AGHT+IGXpo41vuiQVgU372VsJMqnzOk66T2WHNlxdK3eveKwPSr9sGmukStzTjJWLV8CWRlD6U7GlQ==
X-Received: by 2002:a05:6122:8295:b0:54a:a782:47cf with SMTP id 71dfb90a1353d-5564efde769mr1153424e0c.16.1760686855420;
        Fri, 17 Oct 2025 00:40:55 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-554d80fddecsm6740783e0c.23.2025.10.17.00.40.53
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 00:40:53 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-54bbaca0ee5so598659e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Oct 2025 00:40:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWwf4FYxQmLSQVn/QvRUOYFpFA/565kPDbyhWOm5Hdg59+yjhD+kq7QWdcPe760Ro7sjoaGSiz8Iu71lyPW08jrCA==@vger.kernel.org
X-Received: by 2002:a05:6102:3a13:b0:523:712d:4499 with SMTP id
 ada2fe7eead31-5d7dd6a442emr1096341137.26.1760686853648; Fri, 17 Oct 2025
 00:40:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015142816.1274605-1-herve.codina@bootlin.com>
 <20251015142816.1274605-3-herve.codina@bootlin.com> <aPHiAObA61OVf8mY@ninjato>
 <20251017093649.2d5549e4@bootlin.com>
In-Reply-To: <20251017093649.2d5549e4@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 17 Oct 2025 09:40:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV0As4XKG0P0y+pJpTT82Bq8qpq2rHufeX4_q0j-eOPPA@mail.gmail.com>
X-Gm-Features: AS18NWADsUKWogewe8kUaA0j69ci3ZpGRe2zEccgQpiOEHAKGQSGuqQNAabIlZg
Message-ID: <CAMuHMdV0As4XKG0P0y+pJpTT82Bq8qpq2rHufeX4_q0j-eOPPA@mail.gmail.com>
Subject: Re: [PATCH 2/4] iio: adc: Add support for the Renesas RZ/N1 ADC
To: Herve Codina <herve.codina@bootlin.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Herv=C3=A9,

On Fri, 17 Oct 2025 at 09:37, Herve Codina <herve.codina@bootlin.com> wrote=
:
> Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:
> > On Wed, Oct 15, 2025 at 04:28:14PM +0200, Herve Codina (Schneider Elect=
ric) wrote:
> > > +static void rzn1_adc_vc_setup_conversion(struct rzn1_adc *rzn1_adc, =
u32 ch,
> > > +                                    int adc1_ch, int adc2_ch)
> > > +{
> > > +   u32 vc =3D 0;
> > > +
> > > +   if (adc1_ch !=3D -1)
> > > +           vc |=3D RZN1_ADC_VC_ADC1_ENABLE | RZN1_ADC_VC_ADC1_CHANNE=
L_SEL(adc1_ch);
> > > +
> > > +   if (adc2_ch !=3D -1)
> > > +           vc |=3D RZN1_ADC_VC_ADC2_ENABLE | RZN1_ADC_VC_ADC2_CHANNE=
L_SEL(adc2_ch);
> >
> > Are you open to either use an errno (maybe EACCES) or define something
> > custom (maybe RZN1_ADC_NO_CHANNEL) instead of hardcoded -1? I think I
> > like the latter a tad more.
>
> I prefer RZN1_ADC_NO_CHANNEL too instead of an error code and I will use
> that instead of -1 in the next iteration.

Or just -ENODEV or -ENOENT, and change the checks above to
"if (adc1_ch >=3D 0)"?

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

