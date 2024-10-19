Return-Path: <linux-renesas-soc+bounces-9912-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5259A504D
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 19 Oct 2024 20:22:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 41ABDB263B9
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 19 Oct 2024 18:22:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBA3419005D;
	Sat, 19 Oct 2024 18:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EVH2VriC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08A2224CF
	for <linux-renesas-soc@vger.kernel.org>; Sat, 19 Oct 2024 18:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729362126; cv=none; b=NCRbaRIcHL8SpJvcXhfqCSme1bqShiYd6BOkw18/X6eONX6DZM7SI5vQg/c3pZfFFOjF0zbXerHtqQsky2aUur2vBc66hrz/Vb4WGbVjQ75j/Oj6vNJotZWjShG3SpqNrrPgAHIVFH9AXNQrLDVTRWcXPjPyzkRUxG9WAOf98ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729362126; c=relaxed/simple;
	bh=SoXVUCDnZHOHDl0yAjwiY+C9f+qwM4EE5fVc8drlwwA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uGRvLu+RSXWQ4z4XzoinUTY57yjfGkRp83EUjvZhTBAosXxg1eXqaNFyFRcGPqbX32oZyG/yhdGXjnX/N5xO8+vxhT6E3+e+YKGHxVroOvB7Tb/yolgnSSup0sTt9Lx9v9bAWfv1myG2dMo7Jz/kwJ9qZBPZCDIrhjcjdLt+AAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EVH2VriC; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539e6c754bdso3160276e87.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 19 Oct 2024 11:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729362122; x=1729966922; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d3vHOJUfq81Rbqx2e+mPXsky+2qXsdJBbCUk9Mrtq8g=;
        b=EVH2VriClJ2HBKzG0KWHxgywT9o9lbvsnhJk4APNv8LCBLOzbjmSxU5vzM1sTOU0iW
         1oipB8VKUMPZn30dj7d4SHfJ3CJuSZXSO6Cs6mO4vl//QLWox7k7mU7xOoBTB4N3pgRQ
         IgJwiIPxJblhtbDfngayeJU95Jfptx0R2BHTRPBun8HOVT+hJjUAzGe+q88VvnRaO1tK
         K6+Hi4koGZuZIM7HIALr7PvNicfLgdxeJwZay7J51jz7rUlah/2aE1+7HxR0UiS5ulLX
         3PQekIehuZEoM5G7QEQagbgPIQxC8/gOqw0PPxjXVKMXMY0TulY+n6jIUuQ0GgvbRyPF
         DnwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729362122; x=1729966922;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d3vHOJUfq81Rbqx2e+mPXsky+2qXsdJBbCUk9Mrtq8g=;
        b=n8P0KiWB3csJUOnyBbsxVZQHnGAmcocrlSTtRdOmocp+WTjdD/G4xsdIZEeBcoynmv
         FiPUV8FzwMgdX691USKigeal7AddZg2b8KtFTFQjY0QFEBf7ejLWxObPaalEstq0zOZX
         /CRNgfsZn9Psuk5afPoytV8XEW4ScRsZR8c33l8IUPZ76zJXUo9P4jF70GAU9pTFvwJc
         lOg40DavJxsikbGvajTXxV59qjnL52shtLPauQxf/hhJz//pv38Yhqp7A7qXM0btZxiY
         DGRsHLWmCD8yJXOkrdQcKg11e5zeTTq839IT3XiEMRYK7misNGNepvlN97Xa63zd5GaF
         6dKw==
X-Forwarded-Encrypted: i=1; AJvYcCWZkhRqLB9340PHWkjz64MKwctcweVvpZhMoSvoFFpNL81XTPGUHnhbaWR1YrlRrcow27EDa68r1kaZYOREm8F0zw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwG8uzdK5bL+Cn3aUAV8c5pm4Ai7TnEBPKOet8RB5pLYjYSgUNn
	rv05gGfeFZRnzjPaGXnM6/4IF5zk3KBdx+byuNdYcb+TlX1Ihilc6edViCEn29ciSid3vuzVBfh
	s3HK1E/vb4pXSCk1KtnYzt+wlpsZQJ9GTbNf1eQ==
X-Google-Smtp-Source: AGHT+IHvz18eqroQAt1gsqF0yINuU0ZL2Fi8sYutKrFzDIZXBs0v3mz9SJVaFryRy40ku4fDu9F/kuTJqtJcZCvo1k8=
X-Received: by 2002:a05:6512:33d3:b0:533:4689:973c with SMTP id
 2adb3069b0e04-53a15497022mr2837628e87.23.1729362121884; Sat, 19 Oct 2024
 11:22:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241017113942.139712-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20241017113942.139712-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20241017113942.139712-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 19 Oct 2024 20:21:51 +0200
Message-ID: <CACRpkdYAynE2k6LEYrmcvJcO1gJW+NH4wv-S7F_xa-SvsueDZQ@mail.gmail.com>
Subject: Re: [PATCH 6/7] pinctrl: pinmux: Introduce API to check if a pin is requested
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 17, 2024 at 1:39=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:

> @@ -100,6 +101,10 @@ static inline void pinmux_disable_setting(const stru=
ct pinctrl_setting *setting)
>  {
>  }
>
> +bool pin_requested(struct pinctrl_dev *pctldev, int pin)
> +{
> +       return false;
> +}
>  #endif

You need "static inline" in front of the stub, that's why the robot is
complaining.

Yours,
Linus Walleij

