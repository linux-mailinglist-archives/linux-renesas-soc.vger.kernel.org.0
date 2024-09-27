Return-Path: <linux-renesas-soc+bounces-9119-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2414D98851F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Sep 2024 14:38:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 545FE1C20C03
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Sep 2024 12:38:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 523A918C026;
	Fri, 27 Sep 2024 12:38:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6BE189BBF;
	Fri, 27 Sep 2024 12:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727440708; cv=none; b=HpuaSnloTCKUIBL1aCuGbp78DAf2bQDu+IAaRIq55xVx6vJUIqWc3xa4njdwn/Rm/zN+a2akYB3HMbvXbiVzup4Urn5XO6lnU6UCuCVjC92bm2q2aInUL4B+5E1oXsz6oRNuH0til6wJ7yTB6RCeFEEfIY/fFmifUV2sEFWop30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727440708; c=relaxed/simple;
	bh=mRrA4Ra+keaAGaFRVwiO99FRpqypJbOHY7A5IlTwqQ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f/UPd8l63FyxY0DiuMWaMvDtEyC+Av088a2KUaiMQXq/AGRmKSOnELT7SWnVM84NhJjBhMdDAhL9AJSIfSc4+LInIoS6hoB9LAvAf3H7lR9L7ETYUr6fGwhA1uFFFQg2VOq0XyJh5h9m2SUm/JpXWl8eBNNu+O0L931bdwU/od0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6e2326896cbso14203727b3.3;
        Fri, 27 Sep 2024 05:38:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727440704; x=1728045504;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TqFBH+5HsFabcWzieETwGKzU8RIL4xGNtRxP80P6Whg=;
        b=Y5IjKDr8dp8K81kcjn5wK6iv7ho5JGDX0BZL0159pPm0n1Bywbd6k0lrhILSa7flAu
         1R/4rLwHrv2gMdDhGoX1u4SUM8smdKta+t9bIVHJObATF6xQRhmRoRCLQzoNTsSMZum5
         nL1xdAn1D32QVerLQ1XTzCn86/TdEecfAh5AMTd9NQxrZAm9SpGevcsG4hSMlBaHLThY
         GLy4yAeb/fFoUXS/LUWDtNuF4pOd8iEiky1e9dEBASgl1Os5VWb4BsrEFFwTMxvDWXo5
         D82WohoOfj7eBVZmKadjrJ8gt31SPiwUDLrn+Wdey8qBUHLgAnOXrRd2sYBfITWutWRY
         xTjA==
X-Forwarded-Encrypted: i=1; AJvYcCVC0SEMnI3+/vr5GdIc0ha3dj2akanOsommPjaL+0bUlX2MPaIiwGoILvA2CuKV1HYqB0wio+UCV+yrb08b@vger.kernel.org, AJvYcCWMQQgXfmRBZ0nRlU/9iteOhc9aJrG6EAqAkdKiruwuBK9l+fSnY0H6ljPETT7ZbkvRTFOawo0c1pOgeeMQoEmtWTg=@vger.kernel.org, AJvYcCWcu6UFVKhUPeXDXW0NJODn0gn3JZucKtlo1GiDumtvWiNrnNNbYigJsOqLSo7+S3fQiE7fqJe4g0XF@vger.kernel.org
X-Gm-Message-State: AOJu0YzJcO/m3hAie29VfHOs2E6N8JP5PHlkTGSXPTVj8IArc8PuKuOz
	uUudeOTXQSAkKbVyuJedu3OTREpe5zDb7Exk2nYNEPeMhyl+GgYSWCNa6tbb
X-Google-Smtp-Source: AGHT+IE3Ghih593VjUZ2wTl961rqWVRU6zauO5LW4WB2We3JDJ+z3RXrvrDhhXERb1p+UiVqfKxw1A==
X-Received: by 2002:a05:690c:dca:b0:6af:fc23:178e with SMTP id 00721157ae682-6e2474d8d1emr25646447b3.1.1727440704080;
        Fri, 27 Sep 2024 05:38:24 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e24549d250sm2843977b3.131.2024.09.27.05.38.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Sep 2024 05:38:23 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e25d405f238so1522043276.3;
        Fri, 27 Sep 2024 05:38:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX/Mcxr9dA5KpYhSZ/QISYpKpECTdmTzEchzk3GKXvhhZ+oqDjMh/YS/pXafLJ735/dsiBzA394yAve@vger.kernel.org, AJvYcCX76rLAb1EGpk5r+5kg06fIqAafcfV7rOTrsLwDlxVQ2bfWXAMMdJ73LqCoT/g7CdGB2upYq1AYK2VoxzTChpLkRHU=@vger.kernel.org, AJvYcCXrQ4yBJg4kg19TTiIxE4CG6jNc+umQuK1Uv9CZxSKcAbWkVrbjobOvNfNNoSWRgjoS7XfGKiklCiu50695@vger.kernel.org
X-Received: by 2002:a05:690c:5084:b0:6dd:c0eb:dd99 with SMTP id
 00721157ae682-6e24750b56amr20281677b3.13.1727440703190; Fri, 27 Sep 2024
 05:38:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240926180903.479895-1-sean.anderson@linux.dev>
 <cb716925-f6c0-4a00-8cfd-b30aed132fd1@linux.dev> <CAHCN7x+tcvih1-kmUs8tVLCAk0Gnj11t0yEZLPWk3UBNyad7Jg@mail.gmail.com>
In-Reply-To: <CAHCN7x+tcvih1-kmUs8tVLCAk0Gnj11t0yEZLPWk3UBNyad7Jg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Sep 2024 14:38:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW3Lnu+fLm6tsWvtysOGmvKJ-utNYGJRUpRXtRmOXpQiw@mail.gmail.com>
Message-ID: <CAMuHMdW3Lnu+fLm6tsWvtysOGmvKJ-utNYGJRUpRXtRmOXpQiw@mail.gmail.com>
Subject: Re: [PATCH 0/2] arm64: dts: renesas: Add SD/OE pin properties
To: Adam Ford <aford173@gmail.com>
Cc: Sean Anderson <sean.anderson@linux.dev>, linux-arm-kernel@lists.infradead.org, 
	Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>, 
	Biju Das <biju.das@bp.renesas.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Adam,

On Fri, Sep 27, 2024 at 2:20=E2=80=AFPM Adam Ford <aford173@gmail.com> wrot=
e:
> On Thu, Sep 26, 2024 at 1:24=E2=80=AFPM Sean Anderson <sean.anderson@linu=
x.dev> wrote:
> > > - Inspect (or send me) the schematic to determine the state of the SD=
/OE
> > >   pin during normal operation.
>
> The SD/OE pins on the Beacon boards are not tied high by default.
> They have an optional pull-up resistor, but it is not populated by
> default.

Whoops, this "np" suffix is really tiny! I had completely missed it :-(

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

