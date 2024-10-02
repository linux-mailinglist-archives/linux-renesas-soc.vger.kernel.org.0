Return-Path: <linux-renesas-soc+bounces-9292-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B8998CD51
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Oct 2024 08:46:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 25176B2142B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Oct 2024 06:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86D88823AF;
	Wed,  2 Oct 2024 06:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XVrHOdX/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD6E2F34;
	Wed,  2 Oct 2024 06:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727851598; cv=none; b=VE0nMlV8YmNuN64STV8oUWwc5/b1esVW+yb/Yy0jdC8f4p9Ld4FuL1BaMspCMG4uWKnSWpn89FQdtRg+BxJDDhIQZnp6iduyMoYua6/ZIIrVYXSfO0kTJ5D/0pKE9PG/Ua2oAAAJJhQIXdF2ODsLLwgn0Ez5k7CBilmkPXccKAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727851598; c=relaxed/simple;
	bh=wctSq/XRfN6c/zY3pYT7Ab32oqXQYI/ll9PioD5Zq6U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RInNmHenCmERLUElTgMRhEH8ryMqwhsVUKYx9Pj5D7fMjVVnkCMv/k/Y5Nki0lBqHdDK8bWIhU4NMXD7kfAv9bh4mNh1DSBovL/Xaw3uLlBJC89Ycry5PIwWYPsaAtmlxaJbhx1DtgzUR5CitGnG1lNYpKPXa0wUZ8aEU1LDUmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XVrHOdX/; arc=none smtp.client-ip=209.85.218.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f68.google.com with SMTP id a640c23a62f3a-a90349aa7e5so917144166b.0;
        Tue, 01 Oct 2024 23:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727851595; x=1728456395; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wctSq/XRfN6c/zY3pYT7Ab32oqXQYI/ll9PioD5Zq6U=;
        b=XVrHOdX/BJbVNFuH03fA7j1CbrP+yAO29zHuUtEufmj4szD6RlK3LiSkpupXPS2j5r
         tGzGZrhMa+Eb/9KC0v6mEFIcpRYUNG0u4TNsVH5TWzwbY792JhmZGJGXMSLluaT2F/Ep
         EaOqmJhm8MVz3mKWtw6z74f+cane6FSEVODeymIQrta8QYVqXJVzhZVqLmQxg4yOXgq5
         JHEWgsQTiRjU2iT0nEDjUFDcZ8r/pxu+68eKdmREzZEaB6AHmxk01sWTHefgyMz1aMiX
         JzR2KtuRCbcEal97I9u2jEINLsaOOzI5EmjDbMUAi6dCAMx0173S705LLXuPUxiE1VxC
         ZmTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727851595; x=1728456395;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wctSq/XRfN6c/zY3pYT7Ab32oqXQYI/ll9PioD5Zq6U=;
        b=RQCsuIy44Lpd/dnXdhmSchaxD+RuYwQw4VvlV37NOKDIuS6O0MR/C47BFRJRM7Yi+d
         opI5ISJQOc/aTPdDPSpJHPsKpcds4MBMaRk0ndGeT88N0tJ8+Vp/vFw1e81inEkgq/3X
         Ke2D278nKDYJKaNAuxr7ylzw4dWJg7cu+cPy2L5LYwP1Fsjj+Ig2Bi54i3baeODYP2bP
         37P9Tge6zd8E7HtQmxHugozHroKQbhl9+MunGN3wC8X9RR6IRYYv9pykRCx4qIS307fQ
         K2h6B2HE4d4+f7l6bg4CN7ySVCxhsFgrl5M4/4H2ljzAkGmt36VMGzbnfFG9DYIL2F8P
         6nyQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1IMJeqkoSzlDnkhQaLZPC/4/e9B28e3ZzcLXoS+vLu5Ftk9X93GSztQ5jjnrlfLo2W61ABecSxS2N7cUdOWCIQak=@vger.kernel.org, AJvYcCVkZ+3Nk+46762zg1fRXP2asLcxehFT2cynHEUzXiyoSBgBC44cl/bq7EqGoeIu5w3xhmh6Ul95YZgjcAU=@vger.kernel.org, AJvYcCW0sXz5epCAT4zYuQENhioy9y3zSzwkldDifKRFqQsK2Kw3WypQdO07gHkv7BBxU/B7IhzIpeFSevHd@vger.kernel.org, AJvYcCWnNfJhW+CLxp3MN8EwIEgPupAOX4ktD1dcrLLSOOtud9rMJ9TcdgHMUilwelUzjsth9FqA3VucXDJn5BgS@vger.kernel.org, AJvYcCXaZ4MXCORA607OV3X/3wLtz9euniaUI98qmhmqng+am1vaYl8GHdFlZGGpxhtK3PFxSsVBHxbw6b8C@vger.kernel.org
X-Gm-Message-State: AOJu0YzJyPwMRfKb78OVL7a92jg5UYePH9SCTxG477PcMRuZu0+krHJO
	Q+2N82/YO0iWwL2CyAehDzRC4VgR8+71NyvnYxKg27leWNZK8pbCuYpKNjt1fojU1lt0oC8c3W4
	Cq91nrZkNQRBCMuAYbpXeoaig5M4=
X-Google-Smtp-Source: AGHT+IEiXtMz4rxzDMKRte0sJHDSAHpnwg21JUAp8+Jm5ixZyVfSZu7RM1C4x8lbGrZJKdcSr7C/6bSq33X6fCnhhTQ=
X-Received: by 2002:a17:906:7949:b0:a8d:2faf:d33d with SMTP id
 a640c23a62f3a-a98f820092bmr187121566b.9.1727851594983; Tue, 01 Oct 2024
 23:46:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240925031131.14645-1-yikai.tsai.wiwynn@gmail.com>
 <20240925031131.14645-2-yikai.tsai.wiwynn@gmail.com> <5r43dvdywunpottd3uuobjzrzfn4w6xgy2vug46niufih6v6vy@jsix2hkc2dg7>
In-Reply-To: <5r43dvdywunpottd3uuobjzrzfn4w6xgy2vug46niufih6v6vy@jsix2hkc2dg7>
From: Yikai Tsai <yikai.tsai.wiwynn@gmail.com>
Date: Wed, 2 Oct 2024 14:46:24 +0800
Message-ID: <CAL5-g4VcV61gNinezs_1ZPmvAeeDdTEM2NAVywxMfW2_bjsUQA@mail.gmail.com>
Subject: Re: [PATCH v7 1/2] dt-bindings: hwmon: add renesas,isl28022
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: patrick@stwcx.xyz, =?UTF-8?Q?Carsten_Spie=C3=9F?= <mail@carsten-spiess.de>, 
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

Thank you for your reminder. I'm really sorry.
Probably I deleted it by mistake. It will be corrected.


Best regards,
Yikai


Krzysztof Kozlowski <krzk@kernel.org> =E6=96=BC 2024=E5=B9=B49=E6=9C=8825=
=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=883:37=E5=AF=AB=E9=81=93=EF=BC=
=9A


>
> On Wed, Sep 25, 2024 at 11:11:27AM +0800, Yikai Tsai wrote:
> > Add dt-bindings for Renesas ISL28022 power monitor.
> >
> > Signed-off-by: Carsten Spie=C3=9F <mail@carsten-spiess.de>
> > Signed-off-by: Yikai Tsai <yikai.tsai.wiwynn@gmail.com>
>
> ??? What happened here? So you are going to ignoreo silently our
> reviews?
>
> Best regards,
> Krzysztof
>

