Return-Path: <linux-renesas-soc+bounces-14782-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22098A6E171
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Mar 2025 18:49:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D7A5316E7C5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Mar 2025 17:46:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66C598460;
	Mon, 24 Mar 2025 17:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oDA+tX6H"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D36C26461A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Mar 2025 17:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742837774; cv=none; b=pcUZXzuywUEYz+PMe9Zg28rVEcoDLxjM21l7T6Ws6vY6Bkep9vlg+I34s8Ncfz6jjTy8twqobcH23JObQrUo1SRCcCjQoy27jj2akmMjKCHZprx6duffLNQFglaf9SxxotnS6wSmsL2+w/IthueFWYkPCahwiVYoLUYeXOfUHzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742837774; c=relaxed/simple;
	bh=xp/mYAZ5gqhGD9OWZTBxPKEU2bLqN7FiRjLIC0aFwts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TNCCzxa151STtrYmB6u1vCQdMGyKcb4AjyxENOWKwOCoy5gMlcSkABRi9yi8l7fRkHD8chM1FwqhakSl3aC5pfV2l70vamniL8RESjdyBa159MFjmyvDNy8lyExQ+2G5vkA2uII4l3hzBSTl63i8fxKi5xnHvNxhG/3/WCsAp/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oDA+tX6H; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-549b159c84cso5247042e87.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Mar 2025 10:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1742837765; x=1743442565; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xp/mYAZ5gqhGD9OWZTBxPKEU2bLqN7FiRjLIC0aFwts=;
        b=oDA+tX6HLvb9QK1bAtrG30Pj2OUxh/4cb2PimsWoN/1FzZAInTQzbm1PWOKq6FdLIB
         QtVsj2QOatNU4epvtZbIOxdBAgjuct+rzCK8288OCqJYwbDyudcuGYJsT0nG00F0DISU
         jVNUfFzBVb0zk8BaSR058WuS2ZBQwOQjxM8aA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742837765; x=1743442565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xp/mYAZ5gqhGD9OWZTBxPKEU2bLqN7FiRjLIC0aFwts=;
        b=fu7FYlX4S0mPhGJvTS0BtNGR7jGlvKivjJwOCxvaVtrIByjl5Kpjum52Z8BMpCSVtt
         R40dhsZLV4qGWBQtQbmY2kugkcT6GKFTuXCvIrjT4e0Pt7oEjB1e/kC59w/eQvrpB44X
         hLXCvqF8V4MMDuNgxjLm98S8PrJ8F2lwyTVTVbuS4ZO7qFnm4Mbs+nIy6xRAeP9ZZn33
         pvcYULZi+E2dpchZmAWuH5jAd2+LKvteICUoomFEO5ILTSpBQ/YQNDboL3y/p2ycdswA
         3xd0xwGoJUc9uJOpsG3U99v+6x939fiYKqygB+KdfSd0EBVsSh0JLX0Jv0uVg0eqZn5G
         3p9A==
X-Forwarded-Encrypted: i=1; AJvYcCUyo5pGXQM0KmDq9oxFEEdM0qrQThdg/5asusvhM7/j+nH9od+cJuWE9N5G0VkwcWzzI6//4ZHp3ModyEAch3QDyQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwyAC0szqh2IH5BedAly+TG0VQkK0CQ7qeA4dE35V3DW7TflcaC
	BEkxCiWpLdHStWGLCQDcygb6QhuMqRMoizlx496ZnHTAOqhF1pFDteBkx75b2lBmUZE0BFhhCil
	b8t/w
X-Gm-Gg: ASbGnctu07WGMQ5zZyPx9Bp57MA++y+0XPVafENUk2IlLnhdEarNTnPySE+Ruk73mFK
	9fq6R+xmnRiy54AqOpMqIQ+owj25Ck+8v2Ta900OQtKIsXLEXPWIFmOnY6QCEZnwDkTS8ZbbViR
	ir7+t6/F8QInNFxt/JY7cA5xUA6O/ChoP6nZcIxThi+U1QXwBf4hUqIvANdvM6pFKjqp/GruTIf
	JMiYBqK0kNJFfJKMyLN8qTSFR0THonLrJwH+3QTa9/W4YBQ/ZGXaXeD2yJDy3QWeG0odCWSOXNo
	XzR1rFJS34Oql/ravxm4AM1rf0xGGtFtlmGspVkpP6brCJnUdAv0eyaI7EGc39hqUYL5SWr+g4B
	UL1xPUHHURqyHgL+61zhjt1s=
X-Google-Smtp-Source: AGHT+IHXdtil4Baf2HxVnF1fwdeSyeWx5dr8rUDwMshXi4kgztY2myqXTXzaJJtxGkv+MabTbVH6hA==
X-Received: by 2002:a05:6512:33ce:b0:549:7354:e4d1 with SMTP id 2adb3069b0e04-54ad64f5a99mr4365327e87.38.1742837765514;
        Mon, 24 Mar 2025 10:36:05 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad6468a04sm1212088e87.23.2025.03.24.10.35.59
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 10:36:03 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30bf7d0c15eso47708461fa.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Mar 2025 10:35:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU5bnAMqcHw+OdEwxn0ZCXnuNvP5G7MSHJp7Q2gKCFNdeRFCcSg/43DVOQwNRrDvSrmpmUPnYWfBf2t/BIxQMP21w==@vger.kernel.org
X-Received: by 2002:a05:651c:231d:b0:309:1fee:378d with SMTP id
 38308e7fff4ca-30d7e2398admr41507831fa.19.1742837759121; Mon, 24 Mar 2025
 10:35:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250318155549.19625-2-wsa+renesas@sang-engineering.com>
 <20250318204133.GC22890@pendragon.ideasonboard.com> <Z9ne78KhxfKYgnh_@ninjato>
 <20250324164025.GK5113@pendragon.ideasonboard.com> <CAD=FV=Umc0aAvDrQhoZoaaOHjn8B2u0BTtgqeS3oEcH+mtAgwA@mail.gmail.com>
 <20250324173055.GA18359@pendragon.ideasonboard.com>
In-Reply-To: <20250324173055.GA18359@pendragon.ideasonboard.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 24 Mar 2025 10:35:47 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X=P76a8VbncXjELERSDmRgGJfNR8y0wU-9cPRSDt+rFA@mail.gmail.com>
X-Gm-Features: AQ5f1JqxLmxOXE4XNtbYSEesCJwFtkmCixq6z4UHEEUD3xY2NjRuZrRvnk3IDZA
Message-ID: <CAD=FV=X=P76a8VbncXjELERSDmRgGJfNR8y0wU-9cPRSDt+rFA@mail.gmail.com>
Subject: Re: [PATCH v3] drm/bridge: ti-sn65dsi86: Check bridge connection failure
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-renesas-soc@vger.kernel.org, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Mar 24, 2025 at 10:31=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Mon, Mar 24, 2025 at 10:17:05AM -0700, Doug Anderson wrote:
> > On Mon, Mar 24, 2025 at 9:40=E2=80=AFAM Laurent Pinchart wrote:
> > > On Tue, Mar 18, 2025 at 10:00:31PM +0100, Wolfram Sang wrote:
> > > > Hi Laurent,
> > > >
> > > > > > Read out and check the ID registers, so we can bail out if I2C
> > > > > > communication does not work or if the device is unknown.
> > > > >
> > > > > What's the advantage of that, what are you trying to guard agains=
t ?
> > > >
> > > > That a random chip at address 0x2c will be used.
> > >
> > > Is that really a problem ? That would only occur with a broken DT, is=
 it
> > > worth guarding against a development-time issue with a runtime check
> > > that will increase boot time for every user ?
> >
> > FWIW, this can also happen simply due to broken / damaged hardware. If
> > a board gets stressed and causes a pin to become disconnected or if a
> > regulator ages and stops providing power then we can also end up in
> > this state. Getting a nice obvious error at probe when the device
> > isn't responding at all can make problems like this much easier to
> > debug.
>
> I'm not fully convinced it's worth it, compared to an error at runtime,
> and especially given that there are way more pins than supplies or
> SCL/SDA that could suffer from a similar issue. I won't block the patch,
> but I think it's overkill.

FWIW, Wolfram's previous patch [1] did check it at runtime without a
dedicated i2c transfer. The problem was that it only handled one of
the sub-AUX-devices and left the other sub-AUX-devices dangling. Many
of the sub-AUX-devices didn't need to talk to the chip at probe time
so there wasn't a good way to make the "probe" fail for them. ...so in
this situation you'd end up with every GPIO operation or PWM operation
failing and the device would still exist. It didn't seem ideal to
me...

[1] http://lore.kernel.org/r/20250314224202.13128-2-wsa+renesas@sang-engine=
ering.com

