Return-Path: <linux-renesas-soc+bounces-10943-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 427DE9E50D1
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2024 10:11:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E780C28AF69
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2024 09:11:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7CAE1D5AB5;
	Thu,  5 Dec 2024 09:07:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1104F1DDC38;
	Thu,  5 Dec 2024 09:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733389674; cv=none; b=VOzY0cxl890A+KLndogBypz3ztctBLxwUpZSg9veJ1fBi9hPrgkrzMVuKqPHahW5XrHnk6jzKDSNAKiPfwMIlMqtAd9OVfdPlOJlfzMVO7g+UJJxQv1yBHcm7FCLf2dKu/UFao6aQkDVAzn22In+Zoqo/Gjww47axFhm6W50yfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733389674; c=relaxed/simple;
	bh=tBoYwuyv0Rw3qoDo2khojgs9z9YYHbWS/JpvQQnfCzk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mTzgBqIV9k3C3PWH5V2Eu7MAdlp0fEntWMVVnBy22b8msAtc2ueMOfPUMjli8YcOdsI1I0vfu9bCKBcVo3CycxCFeNkiUVWw4ENuPk3QdMNBgthmFX48beCl6vsyleCuaLXGiCCiEcyxjfEFPSdQWwbRzKl2hHZMaY7s8KG67po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-85b9c456f46so151085241.3;
        Thu, 05 Dec 2024 01:07:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733389670; x=1733994470;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l/1+AiVhiUv+sExiwJYXTkMxRtDVn8b9sUGT3Jo3lP4=;
        b=NgfihAfy+Nt/mD8dGyq5q53iNYuYkPUvL3L9wdGqEiB5E9UW9vqvEe1qDzc5X2/+oe
         R4FAl2mVvOy91ypyHZz/AltAnnujc72aHfPLTPbLb1DCdhBsTs8Y3a/crx9owEjbLhaz
         Xg6EzdTZxFtec4cj/XK99HxxevK1bTYWPnsAOl2eVTf6kCIdOWKQKe8mnAwwgg/wmbzt
         f7GyTq6d90XtRhLEvZI0Gg3MmUIcVSVhQ4Ii+eZq5Jyt6XvBbdL6K/8ldksVIdGsJHzu
         GKJCk11N+4bZ+oKkC9kR+aT9YLXnIaKebkael7YeV+rUp+AjI1jArMSpLMjSqIYsM5P4
         5kHA==
X-Forwarded-Encrypted: i=1; AJvYcCVBMHQ0SvrEVPZ+TwdtqqUDlZMzVuhVveCbtIWhnFv9el6VgYx6HwbUqzD4SkqQAj4PAPNsAl5Tadpp@vger.kernel.org, AJvYcCWAT6N100mClWbfLzpITKDy9JiR2yDlXRBXM8IateUI/1GKEQRX8WJJKAshSTGuiQxU/6ivlyv7/ui0sP13wDrkPto=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7iEtTEKeUnnTnhuLk78fvBGdN5V7QMD6Wj6xyQgy7pVnLMQ7Z
	pElt3PzrIslT7XGOmfpMVzLN0tUw+5FgmYTG3a7FSDw4fE9o4ah5/M2XU1c5
X-Gm-Gg: ASbGncvvtXN/oxjRzYY3ATUEOZXKDwJJxarmqqhtbsVtmCEYzQvQ/Ztl2AgKq2IoVY+
	xdR3q+NPBVvRnsG/Kh/vxIlHS/trzyuRUi0xHa+h1erzagi4bh0BC4/Bol2FMmO0FVivwKkImSl
	foNWhndAASaK8E4UpqTcLPeFTZorDUHDRnz9uKra5LCcEb8l2ShDOHHYxWriBIP/ms0N7EUHYYF
	51e7b5haccoBdguSTGqmT+u0RZD+C/mx+UViyAK0VsVv9vQqJki9HEgB2SSYFJpB7cviqKgpPxC
	dwCe8X6FU29k
X-Google-Smtp-Source: AGHT+IFuQ3dT0cZFHibOLttb6Ee5O1kPCgBNCuXk2gOFGQ3kU8atUisKZkOOOlgDpc4GQPUeLE7Kig==
X-Received: by 2002:a05:6102:26d5:b0:4af:3fc1:e02 with SMTP id ada2fe7eead31-4af973825d7mr11093344137.27.1733389669896;
        Thu, 05 Dec 2024 01:07:49 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-85c2b9f796fsm131206241.10.2024.12.05.01.07.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 01:07:49 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-85b95896cefso151415241.2;
        Thu, 05 Dec 2024 01:07:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUIh7nW7unVWMAW3figKU9WCRhWAKchcJLd9B2HwvlvpEndUmI3K5GHppm//cz6rN/TV0vRZ6ISdIJm5Lpyyjg74RQ=@vger.kernel.org, AJvYcCWvTu5j6CTmISPwyO8ZX7cq6r9G7+mt70TBuudOzRt7TRQ1Vp3jiP7B7JMpDJm9iLjTGD8OI3Nl6cN7@vger.kernel.org
X-Received: by 2002:a05:6102:3707:b0:4af:ae02:d3ba with SMTP id
 ada2fe7eead31-4afae02d7d0mr5814131137.16.1733389669526; Thu, 05 Dec 2024
 01:07:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1733156661.git.geert+renesas@glider.be> <87jzcg1d2f.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87jzcg1d2f.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Dec 2024 10:07:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWF7NcmKYzvF4Dfjh3S5MccbJrpSphK5BhxXNnhxgtmYQ@mail.gmail.com>
Message-ID: <CAMuHMdWF7NcmKYzvF4Dfjh3S5MccbJrpSphK5BhxXNnhxgtmYQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] arm64: renesas: Add R8A779G3 White Hawk Single support
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Morimoto-san,

On Wed, Dec 4, 2024 at 1:56=E2=80=AFAM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> > This patch series adds support for the Renesas R-Car V4H ES3.0 (R8A779G=
3)
> > SoC on the Renesas White Hawk Single board.  R-Car V4H ES3.0 (R8A779G3)
> > is an updated version of R-Car V4H (R8A779G0).
> >
> > I intend to queue these in renesas-devel for v6.14.
> > Thanks for your comments!
>
> Thank you for the patch-set. For all patches
>
> Reviewed-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> But small nitpick is that R8A779G2 is not only for ES2.0 but for ES2.x

I didn't add any occurrences of "ES2.0" in this series ;-)

I did consider adding comments to the SoC-specific compatible values
in Documentation/devicetree/bindings/soc/renesas/renesas.yaml

-              - renesas,r8a779g2
-              - renesas,r8a779g3
+              - renesas,r8a779g2 # ES2.x
+              - renesas,r8a779g3 # ES3.0

but decided against doing so, as "ES3.0" would become stale as soon
as Renesas releases "ES3.1". Alternatively, I could use "ES3.x"
immediately.

What do you think?
Thanks!

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

