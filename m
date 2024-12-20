Return-Path: <linux-renesas-soc+bounces-11608-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C329F8E2E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 09:48:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 16F7B1885AC5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 08:48:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF6BA1A3AB8;
	Fri, 20 Dec 2024 08:48:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35D319D88B;
	Fri, 20 Dec 2024 08:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734684522; cv=none; b=Lr8enUJj7hOCoWZK76GhEIXQb7no/OGPorkjz6aqBK3w63hSQH4yjP3zVrGiQZXhR2mk3iMFCRmVIoLlH5jR40aTFbV7uH2anQyw6YnM8a7F8F/1iIEt4bzFn/v1irTgj7x3ToqbFEJ5e1plc3Raa/8OShTUd3OSgPlC/HBzAmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734684522; c=relaxed/simple;
	bh=x8GfAgxfxUHkjZK4h5V52W3/asdPotRyUEwVmNnBXjY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S+olG5L23BKfX06F5qFx+4dR9YStZWErTPY5yGysBeVRT9SfMqU/aTfB+gL9hn8NSu3ZAJ68GYpNl2exzjH9wbSy1SJSWLTpOxDP02buxiNTV5avWD51zjWB7MU+vtjAqsv21OALhuusbNhxwOjp5vFw7xktHRdnNkdAmZSr70U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4afdf300d07so928778137.3;
        Fri, 20 Dec 2024 00:48:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734684518; x=1735289318;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r2OwJGAqe5QSdmKGrTZ5Ugmdv3eNC2G6WtZenIiuyzs=;
        b=G52LtzqWFFE+jU05ilrhAdgUf3PSNs4cYI5wfw0Cc7FOkoF7nwKdxNZtqgXHJAtU6G
         yMhQ9nNCRq4zAmsOTJqU/WOEtNTpKy/4rtKLoCFkmIYpMCjklL+/pnw7cyzPRvFgdRCd
         VbHhWZzRPqwrtoulTa6Lp6qGZfMj5w5m17kTYINBiYowZCLr2tolO+OYdGL+u3Wgg6Za
         8oVhXfnwEialyBKQdBbegiP8I0QhhP0hIJ0H+ALaBv1rbO5gqnFgkPAcuFYQ/Adrq3gj
         l1zATaCjwjB+C4Z9liwa+po2UcG54j6HiSYGyYudQ4KjUnr25VvxfRy9VmJjG22Wsmq3
         VDqg==
X-Forwarded-Encrypted: i=1; AJvYcCU/VhNxB2ZFNv/61XUS+ULzO2ATrpt3RNWm3K9ZVdoMrLjER8mv9+gQjnHPAXZBqQ82VRarJDl0vkNRRg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp0+7W04EiCrvmox8QFFZmPPpz2u6HBPrjQ8wUxIfcGKr8+n2D
	xhGESk3EHZGpwrkkyIHNzza3go6rZxtgg+UrQN6u3yTslM1s9OqQKy+7DnEA
X-Gm-Gg: ASbGnct36Je2OAhoZLpCBrd5OaaH+okF6rVXaxApVZ2oJlmw1xXjmr0dyybEWTH5oWy
	7gVw9PhemJtvrKNx87wjScFAi6jyP7rI7UckeNR1qgb7NrZ95XQ8Kc6BwIV04+0Np8+T9il2EnG
	pjQ3ceFQ8zGTDuXCjDIIGYOfUEIdrkKbnDHbNVoJUes0DoMIdO9Sc0rfd+V3vEOQEmFFem3TGA0
	eWnDGun3cKUu/lVVwlggg7opjaXfyR7zYcu0fH3ZcPGfcWqCChyrzOQhx0GqZZk2hpGvJx1KjS5
	5EBPIAU9syE6LVHD3ok=
X-Google-Smtp-Source: AGHT+IG4DYkGs/hRyU7qmFV41VbODN+7NDCbXzrZfJPkwG7eyGnWpJTDQ5k2p+FgkXoEaa1tnyNkVQ==
X-Received: by 2002:a05:6102:4427:b0:4af:f49a:ad76 with SMTP id ada2fe7eead31-4b2cc47ebf1mr2234061137.23.1734684518242;
        Fri, 20 Dec 2024 00:48:38 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b2bf9c8994sm484109137.17.2024.12.20.00.48.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 00:48:37 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-85c5a913cffso713519241.0;
        Fri, 20 Dec 2024 00:48:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWNVw8d+WPnTZyFPWAIwelAzeVI7IAIbRQXX1BxNBJKFbqVWaoBNWAYtWPkxtjgB2BRLoiFzcAQy6zhNg==@vger.kernel.org
X-Received: by 2002:a05:6102:5092:b0:4b1:1a11:9628 with SMTP id
 ada2fe7eead31-4b2cc488ba3mr2140016137.24.1734684517580; Fri, 20 Dec 2024
 00:48:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241219225522.3490-7-wsa+renesas@sang-engineering.com> <20241219225522.3490-8-wsa+renesas@sang-engineering.com>
In-Reply-To: <20241219225522.3490-8-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Dec 2024 09:48:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWzNeWhYKksiBs8TQXL6RLXVUM5aQS31=eLc8eCuXBpXQ@mail.gmail.com>
Message-ID: <CAMuHMdWzNeWhYKksiBs8TQXL6RLXVUM5aQS31=eLc8eCuXBpXQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/5] hwmon: (lm75) simplify lm75_write_config()
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 19, 2024 at 11:55=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> After previous refactoring, it is now possible to make
> lm75_write_config() a simple inline function.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

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

