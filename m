Return-Path: <linux-renesas-soc+bounces-22823-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7D1BC927E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Oct 2025 15:00:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D06FD3B38BE
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Oct 2025 13:00:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 125441339A4;
	Thu,  9 Oct 2025 13:00:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43BFB34BA2A
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Oct 2025 13:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760014834; cv=none; b=DP55LGmyTh+IcrL9cnavYQ24v4CL2IkO+GCXw+ZPWKGRrGPy8MpNQkrvsk+MuCe5V9EQ+mWrTgxW8MljtAU0vQHK5Hiad40PPnn2CiyBIjxsYYmDyns+9FIiQd2WY/zde+9GmSXfx9+wqDc41/BBII+3uuLllHiGqQ55K+Mf/Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760014834; c=relaxed/simple;
	bh=6u3hExo8BaFPYnHeuKnQj7DLSLZp25d6G7VihlvHxCc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iOehA8Lsf86dq4X/6ooxinu6Aaau2ewJr/JY5sp94AUWr3UmpLmh9lTt71Iyb7IwK8mQvs0GaHABYC48p+zqFuz0KtMyq0MIV0TfRq8qtzEMJhKTACk8cyHGZ4QCuNgmHcY77GuQ7Jr14eFzO22BNP52wILBpiamlqEmxUW8Q8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5aa6b7c085aso1175246137.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Oct 2025 06:00:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760014831; x=1760619631;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eotha7xWzuEbV2GrcE4HgLJOI5Q7DNyYVipBin0aoCQ=;
        b=LLlxG7i3VucpTWdVda1m52a9VO3sbmxptGgZVJRlyRgxdBZgYJKdbktnn10PSNo8SB
         /E9EtiJVrJGLnuc5PUMJe7zYdZruIRA3U946cSYVzwDN46hxYNzCV7jEF+VSZAbl3Hsi
         GuvyXSquU9Wv0OfcmXi99u50qQjIaZ0evPTAV843KAtRFIirDmMQCK/CKG3v8S1BoSFb
         9xT6VVh7bHzcXnnX2dgfS3l6V7ez/cPo2WgvIBA0zpB2sNI5j7KdEaZuM5J/8mNZwO0a
         V39aHHo79uMtlT0lYZkbbkcif9YInxrAmbFJMdlrXjn5PmuSIWmRp09Dc3bjTq61ODZ9
         IBjw==
X-Gm-Message-State: AOJu0YxKTcDe7pUw/V8d6ONqFxIIOIMXLuHbfwXumCNl+tcrp+QLpqnR
	cNnr8T9skSobkXTOnQnJs0MNNDu5DdSH2kLKBW0lR5BYFQQb7GqfwAfk5f3NXp0G
X-Gm-Gg: ASbGnct1qKgBv8DYL8snecfs50PO9FtLSu77X+NNndmCDEkRzHjUl9TAV4yZX+W+0AW
	NrWU83eVr6msRXb1hckRHQcjfkko0sTvvdfFzkpBeQJyP6H83I14bkdYnAkWjklrLQFkAWj0scd
	KoKs6U6z7kwdF6RD/TREMSlMT4uLM17cDe0hfmzOyE6akRWubqe1MP3XfinNNESKquy0XEXl1lX
	MooU1SDqKDsmWHQuxWAMzJqPV16rgLRYlaaOAfZv+NdEWvFMMWKkHn7OutKddPT5/wpJKmvVDGU
	0AFIsQxAng+MkqWlca2/Elqx7c9PNacPsRnh5+y8sr8Q2mfFK6BY+N7tIV7hL97ukbVo4PKJvrv
	6+1Xv8NlcvEvLmne+MxyAY4x+f0eLNFgPBSjk9zFIgMQVa6ijbGMI9JKjcNRko5jYa9RaOtUwnh
	pgj7/Uio0N
X-Google-Smtp-Source: AGHT+IEdMnDMCQSCOAt2SBRM7gOwDO1cdkzhevVtjfkygkY8bN+3tFe4Q0LWmHFPnElHZ4OSVJxAeQ==
X-Received: by 2002:a05:6102:6442:b0:533:ff66:696d with SMTP id ada2fe7eead31-5d5e23ad825mr3517312137.23.1760014830624;
        Thu, 09 Oct 2025 06:00:30 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5523ce69923sm5285942e0c.11.2025.10.09.06.00.29
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 06:00:29 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5c7fda918feso1125424137.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Oct 2025 06:00:29 -0700 (PDT)
X-Received: by 2002:a05:6102:5ccc:b0:5b2:d28a:8937 with SMTP id
 ada2fe7eead31-5d5e226ab38mr3410054137.12.1760014827953; Thu, 09 Oct 2025
 06:00:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251009104500.69787-7-wsa+renesas@sang-engineering.com> <20251009104500.69787-11-wsa+renesas@sang-engineering.com>
In-Reply-To: <20251009104500.69787-11-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 9 Oct 2025 15:00:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWa275FOXW0esEPo40wXxy379XZfvv8DZ1Djj15v5BYsw@mail.gmail.com>
X-Gm-Features: AS18NWCp4Dgt694yDYCJKQXwRm4FIe-wfRRX6CYajTay2WubO0THp0YFg2rjuFQ
Message-ID: <CAMuHMdWa275FOXW0esEPo40wXxy379XZfvv8DZ1Djj15v5BYsw@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] dt-bindings: watchdog: factor out RZ/V2H(P) watchdog
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"Rob Herring (Arm)" <robh@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 9 Oct 2025 at 12:45, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Renesas created different watchdog IPs but they are all handled in the
> same binding documentation. This leads to a lot of conditional handling
> which makes it unnecessarily hard to add new items. Factor out the
> RZ/V2H(P) watchdog to make handling easier.
>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Changes since v3:
> * added tags from Rob (Thanks!)
> * merged the two if-conditions (Geert)

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

