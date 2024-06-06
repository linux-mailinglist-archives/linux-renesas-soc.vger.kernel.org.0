Return-Path: <linux-renesas-soc+bounces-5926-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 440128FEAEF
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2024 16:22:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF6A7280DB3
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2024 14:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E4BB1A255B;
	Thu,  6 Jun 2024 14:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JBTa+1/+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD5C1A254F;
	Thu,  6 Jun 2024 14:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717683192; cv=none; b=ZDJc5jI8uaeOoUbsZgArsHGz+1FzXaaOJTzP9sHPvSgxgmbqIXgCjC0dtI2SnAejhpY0UANoVw+EZQ+V9DqCvec4SeRKKBJ3ZFdwgcmjRQq1/EcXdYZRX09MJdd9PjTGDVJPFzq3epuZZn/MuXkoQ7Zaefif8D/HbTEM32CsRnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717683192; c=relaxed/simple;
	bh=rRQ3jNDRpm7FOp0E37GOIvxo9WdqaMWWaKCaRg4WA5o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ak1a09e6n0jyfSy2kmykROpxzaKy2i94pQDGCACuK26G51Kvi4MSBmLCX/R1hW+QO1TIw2v5lF6CroTPiNWDIbNth/PwA+hPzmvJ9p+Dth/uJEY89tRi00OeXIXZWFdaub5cCpfH8/kMWGqvQW/Iqh1O+3Ttkjp8N06fRKwMp8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JBTa+1/+; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6f8e7b6c5dfso369081a34.1;
        Thu, 06 Jun 2024 07:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717683189; x=1718287989; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DSL3V94nwMBNbfDW+Rmoc+9OI1jw7v5BXyHyBpJCRfs=;
        b=JBTa+1/+Sd61QiC9QqBmkdmmSBbZFSJKskECspfJDAhj0xqu28PHla3CoUdKZpcTJH
         HB2vl0Gw40nmFAdqYlL5Ueqbg/U6bdpeyfENdCnx50Z92d1iGQHBBtWrr6pGWVuYekeM
         FCZiCcpTsXx6Wr2i8cie0TywyrFcjbDC0Bi3a8/VR9CbDPi8Xupyd0mRl7WkY5VA96gl
         ltOFb62v8+dTVHQLbaCUJrfLg/Uz6LwNRm2gNf+YW2/8rlGdsFoBAVC6uC5kfuiGQxiV
         dvuWGU8N5JTqa1hFirY3cJbQIMf1x6ocStRHJe4PInUGo/lzucEkpBSi0VbqgjHywRmw
         rYMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717683189; x=1718287989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DSL3V94nwMBNbfDW+Rmoc+9OI1jw7v5BXyHyBpJCRfs=;
        b=mJnkJYED1+0JK77G8vCMMJkQ8mEdlfgNvYIPEY+Vvu3vISoh8Jn7zZPqfpw6EVxWHH
         Ty7pl+EPutx61LOpOBBsND6NuPFc+MK5RRTNydNexMXtb8tu7U75KwvWKHJiig6iJdlq
         noMJ6NfWjTqbsLLJf3wQAfAY3JnFyFdCvfww3dq4BoTAhLNfLN5m/wyWkdfwZgw4QiVT
         uifvOzCqkiHy1Dji7fW/oqo++RU+wUd7xoaA/3c1QpNiIrHg1CFRl2IakHglC1zOJpVw
         595e/WoJm/hUsE0EWMuvVJsfWmJPJ+gHujHzJECvNsa1YzEFk+IIZWzyuEDENbBJnIrH
         lEbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeaGmEA44eTzq2xkT/oD+qDBXkvCMy2mAlmqRCb7Ld4+PWg0SJWPm7I9SD4vg9Ofj1gualBqCMUbnQLeQ01PVxBpyfLogqUfbtSTY1ArpjYw2K2/tyNs1+3xZCf0MFRSLkr2l3Rx/LNREMogKlgYu3j0+h8lNItj15XRJ2L+Gby+hbEnF73dhCVJBWPS2/R+noqGLL8xTzdljbHfgXd8GMcUSvg4Uq
X-Gm-Message-State: AOJu0YzvwbYzynreTFKCM9KWC3ex0G814P8XMWPLJdv7ORBdQ9zy4xHc
	lW/riIGAIi75hOQtiyykzWyO8IaWoBxWKJ6oO/rf0LDg/xu5EjbjWPdPrl/6OcDDzP3y5jNJ/07
	usQ4fFrOt4j3XSp7SzwC6bgPThJk=
X-Google-Smtp-Source: AGHT+IHdJrybow0vXUpJ0Jea1nDFSyIH7eIo2AC4cOCRdrEHsi5K/3ryvxAqAUrS0ivYlUev4Jw+a83pgXZ7FODqx6g=
X-Received: by 2002:a05:6870:d10f:b0:24c:b0ca:9650 with SMTP id
 586e51a60fabf-25121c7e02fmr6232772fac.1.1717683188863; Thu, 06 Jun 2024
 07:13:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240605074936.578687-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240605074936.578687-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <22664e29-4c7a-4544-ad32-25c3d7e342e9@sirena.org.uk>
In-Reply-To: <22664e29-4c7a-4544-ad32-25c3d7e342e9@sirena.org.uk>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 6 Jun 2024 15:12:42 +0100
Message-ID: <CA+V-a8vStea7RZWNXjJLbuibz+-53KT9=5g-P9N4fUrbqjj91A@mail.gmail.com>
Subject: Re: [RFC PATCH 1/4] regulator: core: Ensure the cached state matches
 the hardware state in regulator_set_voltage_unlocked()
To: Mark Brown <broonie@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On Thu, Jun 6, 2024 at 1:05=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Wed, Jun 05, 2024 at 08:49:33AM +0100, Prabhakar wrote:
>
> > Driver code flow:
> > 1> set regulator to 1.8V (BIT0 =3D 1)
> > 2> Regulator cached state now will be 1.8V
> > 3> Now for some reason driver issues a reset to the IP block
> >    which resets the registers to default value. In this process
> >    the regulator is set to 3.3V (BIT0 =3D 0)
> > 4> Now the driver requests the regulator core to set 1.8V
>
> If something is resetting the regulator like this that's a problem in
> general, we need to either have the driver notify the core when that
> happens so it can reconfigure the regulator or have it reapply
> configuration directly.  Obviously it's not great to have that happen at
> all...
>
Currently I am seeing this problem with SDHI driver. For the voltage
switch operation the MMC core requests the driver to do the change and
similarly the MMC core requests the reset operation.

> Having the core driver notify the core when that happens so it can reconf=
igure the regulator or have it reapply configuration directly.
Again doing this would be a problem as MMC core also maintains the IOS
states, reconfiguring the regulator would cause conflicts between the
states.

Ulf/Wolfram - please correct me if I'm wrong here.

Cheers,
Prabhakar

