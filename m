Return-Path: <linux-renesas-soc+bounces-10752-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 062879DB51D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Nov 2024 10:54:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AFEBF167D39
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Nov 2024 09:54:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3E4F157469;
	Thu, 28 Nov 2024 09:54:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0403155C83;
	Thu, 28 Nov 2024 09:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732787652; cv=none; b=tKYIUBX7zY35kx2BaDETTE4WdWUdNmImXzn8pkykhg3FxtoB53e4TnMx7SKBZqSo9RJGHY/5ODAeV6N1frPLO7SCYGGFQUZfGd7mbFNQlZJ7EK7cnStDYA/eDWpeCAKXKgAdGe2BsokiejS129MnOMGbgbVO1sywOqxOhDLRxJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732787652; c=relaxed/simple;
	bh=7u1W1NV/6pSQKjhccIEKGxfWEa2O5YmGGjGlnGQ9/H0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IDSrcqZIhTEj6oi3/XXfc+Zua/0iUFheoIt3QWstE02OYkYDFA4vJ08RN5AMWzD96qk0z3OST+9tEdUmspg1p4JdDiYhqGpS3ODOeVGz5Tw6/HpHU7Wda6+ioDwAhNf6+bRA2mC6XmDx6zNTaonFAMWa8I6jie21Itl1T9/qTg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5152685aa0dso197301e0c.0;
        Thu, 28 Nov 2024 01:54:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732787648; x=1733392448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wcVG07Z3nPkY15vWPWh2ijL/dM63xYTNYAZpP6vQUfk=;
        b=ola4eEytgm7RtyDYjcM6FLFKSMdFWu/6vnHDrQAzKX8YILTTaHW8pkxhavyHtoitJw
         L7xxteR1KxQ16pnp3b/3qr01t72twxMXP8+0eFd466A0zZOTmh03OKo4W9/8zVB4FBx9
         hVdVFtkxp+AeZT9k45pF+CI24allDjSqRXvOJAxKfZ5ZCmFcOzfd+ceFAhr+U+TQkNDW
         VXAKOo+E5PNaqaOSvEVCFYEpOKQ5ISf9ZQRk9FEvKEU1j/4NCkgew8LAllpKMBITjwP9
         kv2yMZJXLe+22ivIryNe1gk7d5Oi10JmAm+7WfvVLswfjqyuKSVmt8+RHeEs2uJPbn5I
         0vMg==
X-Forwarded-Encrypted: i=1; AJvYcCUUg3n003a7lQBmCPWj/VB6lnogFOMf72MNY2lPEPKN1P+uRSiV9VQRphBSlL2MjL3DPQH+6vJEm8VT@vger.kernel.org, AJvYcCX5ZYQCTKAkDcTcS4jnxi1PUKruDXVwhW2AlvOP/ByCG7GLvvLynEaDCjVY30+3lhOYuzCGUEbu1dg9hFAQkKXFOuQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWBY827GLmWcU6fIJodhrQn8Ed62dI+GWT9hQk1xxxrGJnac2H
	UzQbJliEQuF3XJz6jwXq2CCpmfkJEoFAoLxZAf0wmpPDw/JWhr4ECcfBQtNqRQg=
X-Gm-Gg: ASbGncunHtFwt+uAqhGlJhF1Rjs+Zkn+OfXBfwHZf47u7Z9Tvtd/t8ctC8FriPx87u4
	Z0QwlRR3m1N/C2m5E/ulcj7cmYn1vDSzrbqeWdlmbfUQ8mQfzcB+SpwaDOGVbNv7T7Db20RT06I
	RCQM0g2TuA9uTzYqvyl9EmZmyMfsw1uiSbkQcK1silm3/sOnwoUGBU2Iwqifn3PSQ0vnDuBHJdA
	U93sa+YieahQn0FqvAx2XArZHQQPBDGvjWn058+adfsc5+9eFOtOdmg0ZNexCF7N7xIJrzuiY1R
	KDyrMUaHIbgg
X-Google-Smtp-Source: AGHT+IHhRwe1I7H2cMuky9YeUmjmU1njht/3tplSQTVfXNptB5htAgiOzHPs94gBrFRNXCtMOyCkbg==
X-Received: by 2002:a05:6122:169f:b0:50c:99da:4f70 with SMTP id 71dfb90a1353d-515569aa0f0mr7850347e0c.2.1732787648465;
        Thu, 28 Nov 2024 01:54:08 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5156d0f8bf7sm102118e0c.52.2024.11.28.01.54.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2024 01:54:08 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4af4575ec4cso238807137.2;
        Thu, 28 Nov 2024 01:54:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVXGHHcHPWfvY3hu5D85WGnRThD/0/ncYyDG7nk9iuBar3ZSkdaX0XPBH/W+HNKcgdE6yM3dzoj+ZF4iLWizJsHywM=@vger.kernel.org, AJvYcCWnlG2dJowDK6zGQxTSX2ewwgYoph2B5iei25Lt3A0ExiMTr7cMt6YWbjEyLstYfJjg63hJXUxlmIA2@vger.kernel.org
X-Received: by 2002:a05:6102:1899:b0:4af:469b:d3b8 with SMTP id
 ada2fe7eead31-4af469bd4d8mr5405240137.25.1732787647989; Thu, 28 Nov 2024
 01:54:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241105133824.788688-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20241105133824.788688-1-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 28 Nov 2024 10:53:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUKiZUszBwJq_o_RpbgicGgAUDFg9j8zyHmiWYmNCncrQ@mail.gmail.com>
Message-ID: <CAMuHMdUKiZUszBwJq_o_RpbgicGgAUDFg9j8zyHmiWYmNCncrQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] arm64: dts: renesas: gray-hawk: Wire up MAX96724
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Tue, Nov 5, 2024 at 2:39=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> This series wires up the MAX96724 on Gray-Hawk. All dependencies in
> bindings and drivers are now in the media next tree.
>
> This targets the single board schematics but I opted to keep this in a
> separate DTSI file as we do have a ID eeprom similar to what we have
> setups where multiple boards. If you truly dislike this I can move it
> into the 8a779h0-gray-hawk-single.dts. In that case would you prefers me
> to drop the ID eeprom?

I would say only use a separate file if you can (eventually) merge\
the White and Gray Hawk CSI/DSI .dtsi files.  But given White Hawk
uses MAX96712s and C-PHYs, while Gray Hawk uses MAX9724s and D-PHYs,
I guess that is no longer an option to consider?

Differences:
  - C vs. D-PHY,
  - data-lanes,
  - remote-endpoint (could be handled by using the same name),
  - compatible value,
  - (multiple unit-addresses) and reg values.
which is a bit too much to handle through #defines.

The ID EEPROM is present on both quad and single boards, so please
keep it.

Does that make sense? Thanks!

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

