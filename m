Return-Path: <linux-renesas-soc+bounces-11303-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B5B9F120B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2024 17:27:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 00D40188D47F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2024 16:25:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F76E1E3DD7;
	Fri, 13 Dec 2024 16:25:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D421E0B75;
	Fri, 13 Dec 2024 16:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734107145; cv=none; b=Ip4PbMI+XNPF0Bd0nH62d5AlVX0snZ0/uv33y8lIuJcLB7R7bQYDT/RQn4/RitjKWI2VblmYPw2ED7Md79p2C3UF+izjiPHh3o5Blz9UVu/LPIO5ZoUKTpy7MSG6HvSzEFdsJhsjpSnJ1zhwA3n+jXwdeX3Mjye1IeMM08GpATg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734107145; c=relaxed/simple;
	bh=rrTTmrkXdWW9Vfhi3DVIjDYMSlESWh8Fl8G0ERBSHDI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iErcb8eHCyXD5TvrAEs3i5IpT4IdZwGZYA1ThlJAH8QiggXBwSWSbddm9rXcPonZp+vUqvx9NzYT2SrtE7O7UvnTxAqLhT/x94xZcWKgXiK1XUe5zdMJcg8pSdPDaYYhn6AgJcJELh7SomoVRUCBj+rK5ml+yfEylSNiGU1vG6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-4afdfefc6c1so446240137.0;
        Fri, 13 Dec 2024 08:25:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734107141; x=1734711941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AfQUGbGu5Ly/s3c0co1Q92nJFlMbfpSu1uFfH0m0/rc=;
        b=RFaJnmsuOi35BhwthRBKIhrKdVam25b+tQqUNztd4d5YRxBdH+OOtA+TorXKYHRw6J
         q6m55ne8kYHk6eSQbc9v+2f0nB5GfIbeonX/YlREEJptchUYsEGUVM+PImW0SCohAtcv
         YS4rz2FM4BWVQdevI5wQCsbl0CCIspQSPI6eVIo4Wp01gfMY3G2DesBq3xhCiKrubbwJ
         UtS4q3KsleBO8UZt9VEirJQiGI+Po3bxRlnYHheR1yIVrDJZ4Vp5+iMFrfbkWaZJYA2S
         BjyNWD3OMHk1yurioVYfELTYRKll1QJXY8egBCwzov/OpQw9s+F+8RWZv0gAQ1A2OkbX
         9Jpg==
X-Forwarded-Encrypted: i=1; AJvYcCXDDax6/kqAjXN464WXc2hRHjkvYqGBfSoeMYDMrEZaDGYqlUZsDAi21WeVufrvBUNYOsyHIEwhv+m2/2q9@vger.kernel.org, AJvYcCXYTANU2+UqDfxErdseXPmMnQrirHzh6COvWC1YNJ5e5w5J4u3/8Dd2GSZY2KiWk4oe3EWjspSvCZrYYlQy/b62a0g=@vger.kernel.org, AJvYcCXhf/vd+X24AzLu+CXAnbVWI+805S7v+iMgWqN69JRSfUXriUo75Xy4X7wd7wJdOoVKi8mPtAJl3yim@vger.kernel.org
X-Gm-Message-State: AOJu0YwfTobuaJUpH6bXD/DPNNLgWK1nHzZwnTJ+X9eSjlhedW0S+Cxk
	vaVGJwMInYy2mAMsEUIPROZdeIyS8TXfU+jofszujZAilpOdYOVK5lHsqWnY
X-Gm-Gg: ASbGncvvBs6itxOXzHEiSaJLGflcLdLYjC7WUBblMwh6TxuZGGJ6mvmqMoDqWl1ZtZ/
	hlhxhguuCxhX/2qVuxICPmACK7Fi8ps1r+td+FGkfQa6VH0+pB2KWP+N0kyMsXvoQsAzqNaJMVq
	55dcZc2YQitIkJvWZViOxZ/K93gnzR5fYJCoZMW+SfENouQE+P978KUw3CbPQguNaldXDdT+wQE
	ZbOPo4zBP6yRowNQLgqAaS/oJXGSuyllIyTn+8E0vatZWeyJEG7KeNP7bP9mvGzAeJoH+7AV4sj
	0+4VK7/HxJsMxwEBZzw=
X-Google-Smtp-Source: AGHT+IHc+yNqrhXB1BH/QOSSOnGCb/mAl42oiWZnNCyQY6I150tPJ+imguIwcrbOkvodpuRzW+ahbA==
X-Received: by 2002:a05:6102:32d4:b0:4b2:5d65:6f0 with SMTP id ada2fe7eead31-4b25db2a96fmr3956543137.19.1734107141502;
        Fri, 13 Dec 2024 08:25:41 -0800 (PST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-85c66b1ee44sm1813214241.11.2024.12.13.08.25.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 08:25:41 -0800 (PST)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4aff5b3845eso541744137.2;
        Fri, 13 Dec 2024 08:25:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUikTmkmFSyIUbuDFA8YFL8dHj5OvkzIdM7L3HCpGILNTGV0NfL1EJ96psoAvGiQlMbDZ+1meUPzPbp@vger.kernel.org, AJvYcCWYdMy1n5M1JfdCWxX1jztzVvi4nE18G69rmfQNMplx2Ijs0251yrri/Esc6/Z97rtdRMNr+aCkHopTGAmHmV8QKA4=@vger.kernel.org, AJvYcCX/a1Nn8uUyKFOgOMZd+DLQTOq1i6sZvwklf82X2BLs4PCu1Kcan6y6lz1lQZUi6QYIDDONrHGrfMLppY4b@vger.kernel.org
X-Received: by 2002:a05:6102:dc8:b0:4b1:24c0:4274 with SMTP id
 ada2fe7eead31-4b25db8af04mr3966780137.26.1734107140816; Fri, 13 Dec 2024
 08:25:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241206212559.192705-1-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20241206212559.192705-1-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Dec 2024 17:25:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUBWWmtcL98Roz3kaJvTUk_gwLGT0GVZRHqn2=FRhj-Aw@mail.gmail.com>
Message-ID: <CAMuHMdUBWWmtcL98Roz3kaJvTUk_gwLGT0GVZRHqn2=FRhj-Aw@mail.gmail.com>
Subject: Re: [PATCH 0/5] soc: renesas: Add system controller support for
 RZ/G3E SoC
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	john.madieu@gmail.com, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi John,

On Fri, Dec 6, 2024 at 10:26=E2=80=AFPM John Madieu
<john.madieu.xa@bp.renesas.com> wrote:
> This patch series adds support for the RZ/G3E system controller and exten=
ds
> the existing RZ/V2H(P) system controller to support syscon. The RZ/G3E
> system controller allows detecting various SoC features like core count,
> NPU availability, and CA55 PLL configuration.
>
> Key features:
> - Syscon support for both RZ/V2H and RZ/G3E system controllers
> - Detection of quad/dual core configuration
> - Detection of Ethos-U55 NPU presence
> - Validation of CA55 PLL frequency setting
> - SoC-specific extended identification through callbacks

Thanks for your series!

> This patch series depends upon [1] and [2].
>
> Tested:
> - Example of SoC detection:
> [    0.065608] renesas-rz-sysc 10430000.system-controller: Detected Renes=
as Quad Core RZ/G3E r9a09g047 Rev 0  with Ethos-U55
> - Example of PLL misconfiguration warning:
>  [    0.065616] renesas-rz-sysc 10430000.system-controller: CA55 PLL is n=
ot set to 1.7GHz
>
> [1] https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=
=3D914097
> [2] https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=
=3D912697

The latter points to an already-applied unrelated series.  I assume you
meant "[PATCH v2 00/15] Add initial USB support for the Renesas RZ/G3S
SoC"[3]?

[3] https://lore.kernel.org/all/20241126092050.1825607-1-claudiu.beznea.uj@=
bp.renesas.com/


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

