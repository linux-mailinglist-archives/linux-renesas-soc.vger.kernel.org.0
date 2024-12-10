Return-Path: <linux-renesas-soc+bounces-11156-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 657339EB3A8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 15:42:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9DCDC18897D4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 14:42:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C915D1B0F12;
	Tue, 10 Dec 2024 14:42:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BC81B394E;
	Tue, 10 Dec 2024 14:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733841722; cv=none; b=ocsx7YGLkHcreYxSbAzT1iG/SkD1/795NPIIXucKFgNyipZiGqb+gskdJxFBA/KqW+9gKsrWa48px/Dr/5kpgMbpIR8LW7cpVB+0UHESEtV0sD3VqhqpL+qjVBqOcAsK9tKC9wNSWkP8rOtO4nYjoOTnF5Ur2MdZ1jhgM/fX4lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733841722; c=relaxed/simple;
	bh=zF3aOE1qhKSMRnq/y0n1k9zWj237rQ3rpoCWa9+1JVY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g+4Tr1UXjo/9wqRn6pyUY9aZMLQrTvjc++WSkhdDh/oNMo6YajBjUGV8L4Zm2Z00aC2DTX7wnLvGWowL9AZAGtOftcZRM8Tn7S1QsRaQgvzLK/Xc6NH5OLmBHcXhwPi2DRAoeHx1GidpUlxl2pjtTqEySiCpZg/y+g6veqxqdqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-51878cf85a7so655581e0c.0;
        Tue, 10 Dec 2024 06:42:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733841718; x=1734446518;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sEeS7eW3dOMIbCnO2yWME8t863RN9RbwOU3IJRVX0qU=;
        b=rNDKx3hQIXBPSvlR3UlPBZr5Z6mn/S+gL/x2wEqVk3OCbZKZ6kpgLknmkqrmfo2/Qk
         FnU/N9IViQuSCPmfCi3rCsdoEu5l7ZDBzBZGW5Parf635/HMjzk9TM9r2+V3bPVuCk0+
         TkZBXH93ywfg7FUAc/KouUyAKfaYZaa5kX9zFRagQ+LrZKgv6V+cWvkFg158OpXq0Ix8
         8n+UaBxX8rquD+tYMs0CiQEdMge7cFcODxzw5+LG/22jJtQxQliJlijMUMz/z9wfNj8g
         29mGoa/L89nHPPqvaLzg68HsBCHPYxvgyp/5GplOF612IL0d/4W89qUAgAzRMBsdHgch
         EgpA==
X-Forwarded-Encrypted: i=1; AJvYcCUZfZGSJNOkj9WUjH94i12iyS0SQOz1sxFaPDgHIQOfyAAqemWniduUXC+PGEnW3gDsPIYbXh1At+In@vger.kernel.org, AJvYcCV2DXd8yICH/QssrhlGAaUQoVtJxlAGaqivbZi3TG61NMJRky9acurplxEns9dRcPZQ5P5ilSwOR28P@vger.kernel.org, AJvYcCVaxI5MTozbQzTCZwkdlDwG7BSTq/CL42Tb5oLHq6XhchvJQdk4gY3EfqO9TZ0aM0Hcf2lLRhh7MkB35Lsp2lLbgfw=@vger.kernel.org, AJvYcCXgxQlF/8UJ2QoZCBTW7/ydm9dehyC6+NJCq4/X2FZVTlstM6wDwujKP3yhKHedSpabnL70YXt6eTG8stqG@vger.kernel.org
X-Gm-Message-State: AOJu0Yw55u+ExcE2EIo4mfwaf/HTod3jbm9VnPuxdZBjY8816MCShYwt
	dRTzdV+I5h5vaq40g+Z2GUYUuXFQbU6FgIgYYdKQiR0xQXFYohcerqyVIt3i
X-Gm-Gg: ASbGncszLQgXAR0TbJJlHRr9cwU49hez7a5TTzAxUO+wydr24Znw5ym8kRiV5p41cCT
	15WJC9Q9Cj1+gqRreNNpyfvIunRVNY2aTa0aWNfhZ/59kqYhZxdG/J8Ii+fUnSEqEI7eK02B/XP
	iO3N7JknXOh4HTzxto5ExLzEgXJEDYv1TeIO8xprpk3L7vE8wQ7oLGFsJnxsXbZosPS5KKxYw7S
	SglhH2WdEavjDDM1w4V4pmGJuB8HBuAXYgSwXrYTdyfQuSEB7GYb4WTIKf0sco++MBWAolJIKnC
	Bw6KVEae5ZzLlkY+
X-Google-Smtp-Source: AGHT+IFeFae9WjSBSYnTv5iCaRYYZyAQuApIUWMeI9o4EZOXys6cNzh7eCBzlNSPl72AW2TtBNeTiA==
X-Received: by 2002:a05:6122:829d:b0:516:1582:f72e with SMTP id 71dfb90a1353d-5161582f8e1mr10713330e0c.2.1733841717579;
        Tue, 10 Dec 2024 06:41:57 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-518837c8955sm237672e0c.17.2024.12.10.06.41.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 06:41:56 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-85c4b4cf73aso909923241.2;
        Tue, 10 Dec 2024 06:41:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU0tXVkXMLhNru09tHw+5etQf4H/rHiKVX0DdUQAoUPQFQ8qL5UBbP5hIMLvJFnXAb7U+aRa7tRW/WLBNqa@vger.kernel.org, AJvYcCUkntAFtTIau+T/aQMssfl/sidfSkU+LedOzC0+EhEf080R29Sw57Ak12dgJ243OwtKmd1EQk+wGSPS@vger.kernel.org, AJvYcCVNlsNMNJdLrFIT2eNrvBhCTcR7GsBsGeVSXunPnF5YPvIs4US6BeOVvQ2cEy71BqHVmMZnzBnKS0c3@vger.kernel.org, AJvYcCVoIaA4rvUMCP2cFtpjdmhUA9+B449V2WDC6lU2Qjgx0Zp2vJVRr7CzeUpmr3DKkgJACDqhnrfh2BFsyr2Neeak0Us=@vger.kernel.org
X-Received: by 2002:a05:6122:169d:b0:518:97c2:f21a with SMTP id
 71dfb90a1353d-51897c2f7dcmr1218484e0c.6.1733841716153; Tue, 10 Dec 2024
 06:41:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241126092050.1825607-1-claudiu.beznea.uj@bp.renesas.com> <20241126092050.1825607-4-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241126092050.1825607-4-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Dec 2024 15:41:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUWUw-cAkZ612J0o+0uJ2B8BqC87Q9SjWxay126xqxeDQ@mail.gmail.com>
Message-ID: <CAMuHMdUWUw-cAkZ612J0o+0uJ2B8BqC87Q9SjWxay126xqxeDQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/15] soc: renesas: rz-sysc: Enable SYSC driver for RZ/G3S
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, p.zabel@pengutronix.de, geert+renesas@glider.be, 
	magnus.damm@gmail.com, gregkh@linuxfoundation.org, 
	yoshihiro.shimoda.uh@renesas.com, christophe.jaillet@wanadoo.fr, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-usb@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 26, 2024 at 10:21=E2=80=AFAM Claudiu <claudiu.beznea@tuxon.dev>=
 wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Enable SYSC driver for RZ/G3S. This is necessary for USB support.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

