Return-Path: <linux-renesas-soc+bounces-22138-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D52CFB90773
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 13:44:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C25C6189FD1A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 11:45:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1383E76026;
	Mon, 22 Sep 2025 11:44:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F00E2877D5
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Sep 2025 11:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758541474; cv=none; b=UbUwpiNSuiSfCYEETmHslghOUaOoKm4j8N0vr5PSkEgxlp82uUqMSvPcYVTGAOa/UoubZRLP93tBbA+tiHSd8dJV5isurr4rcmyV6b0uYQu5InvASo9n3p87Dc6IpAvuDG1LWSsLiuoycrdK3WfKX1SeMjNQ979DXw9fgdSXlgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758541474; c=relaxed/simple;
	bh=mEWclQOnLh8wG0OpIAmPeQffuxDxP77/P84ROBKBguc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YVQw06DwpqkXqUlu+5kghy5ofiiXHTN2h9BkCXQEb/beBk2gSUC17mltLINUF1Mjv2SLxXi2DsNWpMv1AzQwybAT/bQiW17Qh+Y7vAWOh35W+2YV3Qoz7crBN55N79VdgKMramVfOrasoFzX1zY6rOBpKSzwFXEvvmrnjGL/54c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-8e3db8cd756so1504968241.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Sep 2025 04:44:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758541471; x=1759146271;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OI2Mb5YSlGneegkZfRI1AezQr0Bceg+Ogs08hlYWuUQ=;
        b=WVkW/FJsc2mFYnndYPCQQEZzOmxENUBh1ZK+mKXj/eSJe+x0//uZ19Xjm/O6qbmsfl
         yN3huNa2WPDuJ6/nK7SCcOmbupFCaGyMv+XaOk/fK73MObhIXE8th3QY4Y03Zxpaddxv
         yDomckifEib4fKJR4f0WlBR1Zr6TK5z+7muTR51vfOYMaaIEsoxJDRammDpp7L9cIIEc
         CAwY4ZOY/O3+0N3uxaFwbYGy4tPGdN4WLPLDWscfaGV6bO9u2SRzGmfjKzQYDKDC2V+6
         0sXQ8ui0kBMmhEm1naSNKa8ok10uPxM/M6io/7/NewpgxxgL9n+4xOagQyVxhP6fI+BZ
         6PGw==
X-Forwarded-Encrypted: i=1; AJvYcCWkRFyY9FUiiYn0ne23ld71fb4TpBMT674UH3NBI8qq/KsckVOaz03+eUZk2zVg091uuA0PN/ZyKvsccXeApPWv2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrOtIZor8hIy9PuLU5vFM0OvTdkaWzxCfISa5ZvcIapC4PTHBx
	W8Qug4GwJUqjy4Js9fRP0jxK6zP0lyfU6r5vk5ZX2IeB6Sm+xYJ2ySeS3Xr7IZU2
X-Gm-Gg: ASbGncs8wDbOgTx2MUn4VtoS295wV1VxkxAEYWOT3gDX0+4hDb8ScXG2NWmG4hUKtz8
	G9MvHTZUdm4p6ASHX6RD/cUBCQxWAgan/us4tC8FHKkX8Vl8OiK0m/eluY+z8o+PwBOhtAt3c3l
	m71nZZeHanGJW7M23WoUpg8Uvh7q0aRX/aYrfktKar7NOye6HbOhwCvCDyh1O2zLm5ECfnW9zxv
	7eJ1aOZ3Ip7mLDfGWiJIG9n8UAEcnHSmunDJFyLpwTUhLPHrL448x764qpCH9PhzvA2i+k0z0ow
	3kxaDn5sCeoIrYxv7o1ywnD7ct+GNZYGzo+89DQvNCNrdTXELfBLaMprCIR86p7UutjhuvSzDjS
	K7iWFg9JninP/XHF1j2BiJPsnpXsY12CGaV1sVWB2dQR4rY1vggCjtE8h4L39bJjsm5KxKWk=
X-Google-Smtp-Source: AGHT+IFvfNwS03aTGlkuZLvXWUVnD0PlUYF5z2eaplfF2vV29BQW6nBoC01m+yYp0Xb6rYDD3RGRnw==
X-Received: by 2002:a05:6122:c81:b0:54a:a782:47cf with SMTP id 71dfb90a1353d-54aa7824d05mr844242e0c.16.1758541471312;
        Mon, 22 Sep 2025 04:44:31 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54a72974b68sm2587293e0c.16.2025.09.22.04.44.30
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 04:44:31 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-59dff155dc6so818399137.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Sep 2025 04:44:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUg99g20d3EpOIvcPMckCUm4YPIzEg4G84tkLN2wxVa3ireqSn7EodvNN8sno0K1qS0Psx0EVbnC+L6qhYJ2CTF8A==@vger.kernel.org
X-Received: by 2002:a05:6102:c0b:b0:57d:9305:63db with SMTP id
 ada2fe7eead31-588dada3a4fmr3176649137.15.1758541470493; Mon, 22 Sep 2025
 04:44:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918200409.37284-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250918200409.37284-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Sep 2025 13:44:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUiz1=TzOUgSwxTOP__rJEHsADDwzQmkvFYq7T8WzR5og@mail.gmail.com>
X-Gm-Features: AS18NWBa53IKi-WhxYHxbxmTIi82Kncl83cZ6WOELioWigxIPDxeDI4bC4T4Zk0
Message-ID: <CAMuHMdUiz1=TzOUgSwxTOP__rJEHsADDwzQmkvFYq7T8WzR5og@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: Drop duplicate newlines
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-gpio@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 18 Sept 2025 at 22:04, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Remove duplicate newlines. No functional change.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Yeah, why not?
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

