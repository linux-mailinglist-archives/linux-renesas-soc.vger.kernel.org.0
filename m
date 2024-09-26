Return-Path: <linux-renesas-soc+bounces-9081-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28AA198733D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2024 14:08:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 573D11C247D2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2024 12:07:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC15315B97B;
	Thu, 26 Sep 2024 12:07:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12B01714B3;
	Thu, 26 Sep 2024 12:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727352476; cv=none; b=hGXPu65XxnFu+SLQ6U21NKgmrZPo1RYJE/wDqsYnWRtCAobawFOUZTqoYcZ1NISzC3oit4jxEg3QkWzqOo9n/TnJ2daimTHObxdDaDFkM7WTJrwVQ0ItQ3VQlFZg3Wff9knfIcm35oC1qY6DqNtM+gVQiMlBF+ywUVssaq9MSxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727352476; c=relaxed/simple;
	bh=4xw4K78qODtWhaZhEVlwWdlmpI1QnWO0VvTCjIdtJBo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=E4LVyDyJRohpMfXFifQu9GHywA5zVzl+ZtAv8AOrVBE4acAAJ3vvjRCn1DIhfslMUQw03FaAr9RFQjITqW3xk5s2zDH+qkM2YFzsXMKjf4S3b8UG1odcVJw10ml6cdQrEpTNIMT0Qmt04klgCX55wSUxfc+A7UW1UGLTWDgFJIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e25d57072dcso189673276.0;
        Thu, 26 Sep 2024 05:07:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727352473; x=1727957273;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=++47/xo61TfSftrU3f+ZvLrlJE1y5svoSfKCEjGz33c=;
        b=AHVZp0l3rCb1XWEo1ZNfIiB8MOiPHAUUYD6WpMLfkxsy1hsunyG9BHM0RbVMhcLSa4
         z+zr8o+rrFep4VNfcjEAThH1RgRmWSSleP8lYCSBrTArtMQB0sMXNXt8uB3eUvLPBmw7
         d7KgaO0HIgsH/BZPr/aWxJt0K2MRM/e+bt7TJiHHe6uFYgbWJ4F0zcnDePO6kyLHs7/U
         x/baFUtth8siKyx4B2QUHHUfqHKkydtOV6YIhWpJ+wba/m4dNvYVcwVsGDplFxXFVReG
         R4wRCC1B5yIUDDM5sDgnpR0y59+wxrm6xJale59HgAj6f5N1o80WAKvOT5tu5zJW7ySH
         X1ng==
X-Forwarded-Encrypted: i=1; AJvYcCUgUvG0vuIJTHC9/YXE9DsDH01U6c7UwZUARgd1d4DkR6bK2uhuZvgWbzp9tGR2ijV/up70mLa96ju3oiE9lrz36lo=@vger.kernel.org, AJvYcCUry0wEQj37IOhHitl/+m900tCIbACsmFS6BHjmlRfvDNF8KeoYiRmgM2lFJe7FVO/2XVU8Y7jWrRt1@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr3kHecFpyj/iSCQAqLYTzxoXtHjnvy6ohK1Q7E+xSYPbk7Ru3
	5+xTkBiihCybXl3/Vwi/O73GE+TvjStNhOkKxf3yQV7nuSh4S3SKM2oyR9q2
X-Google-Smtp-Source: AGHT+IHgfCzpkYcUxeABYxid+9qfQtQWuESEJ7IJbmeFx28MRhfJlY0eNRogAmbkFj1TEeEuA5IZSg==
X-Received: by 2002:a05:690c:3242:b0:63b:d055:6a7f with SMTP id 00721157ae682-6e21d9e3f38mr43193807b3.38.1727352473350;
        Thu, 26 Sep 2024 05:07:53 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e20d06bbf8sm9393567b3.60.2024.09.26.05.07.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Sep 2024 05:07:53 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6e22cb0b19aso8283607b3.1;
        Thu, 26 Sep 2024 05:07:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUMfkQzn523Ho/Hyx4Q6CIk/nw6009JWSvi0pC9vr0pVXMCrALTar23LXmuG7G5ToSHt0xhn+w3KdIm@vger.kernel.org, AJvYcCVGrvYNA7Efcm5DeWKX6qaIsS2SdBqagXMheVAfdbU/KbK0KpAGTtwdQVm9ZQ5sPrOHx8CX3uqd/VmiB8J9X6xXZCc=@vger.kernel.org
X-Received: by 2002:a05:690c:7183:b0:6dc:569d:aa57 with SMTP id
 00721157ae682-6e21d84a9d8mr41483717b3.26.1727352472863; Thu, 26 Sep 2024
 05:07:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240914182948.94031-2-wsa+renesas@sang-engineering.com> <ZuXd963lKqwqEmEo@shikoro>
In-Reply-To: <ZuXd963lKqwqEmEo@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Sep 2024 14:07:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXY+G8uzqaNQ146t5+fbvw4DjS80MsDMFo_uUbwtT5Q5w@mail.gmail.com>
Message-ID: <CAMuHMdXY+G8uzqaNQ146t5+fbvw4DjS80MsDMFo_uUbwtT5Q5w@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: renesas: genmai: Fix partition size for QSPI
 NOR Flash
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-renesas-soc@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 14, 2024 at 9:03=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> On Sat, Sep 14, 2024 at 08:28:44PM +0200, Wolfram Sang wrote:
> > Second partition was too large, looks like two digits got mixed up.
> > Fixes:
>
> Hmm, maybe this "Fixes:" is ambiguous... perhaps we should leave it out.

I like Fixes: ;-)

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.13.

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

