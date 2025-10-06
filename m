Return-Path: <linux-renesas-soc+bounces-22699-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 53293BBDF12
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Oct 2025 13:59:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 407A74E19BB
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Oct 2025 11:59:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8661276020;
	Mon,  6 Oct 2025 11:59:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED0D17E4
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Oct 2025 11:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759751942; cv=none; b=lTnW1anPfzKKq+O6bV2tfD+8EXxq+Vv4uATDnxEskBN/wvonEFbrwuklWmrsSdu0zVash1rl4WKietGJeMTFX2anVtd+DbmAWJrw30f2KYY+yqEFMy+xL3r4PzQAJRP9XvDF/iLSzzcrylcLaJktPdsyj3FMpn+YxOtXaNG75Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759751942; c=relaxed/simple;
	bh=I5uC25b6no/Mhl16rMoemx2zfef6d8aMW4nTPRFe6XY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RYKjxhFuWH4diNhPaMmkpG6zhY842TFepE0E72geYpAJdC4tyl4tRxUY4GL03RPk4VDxrzmMVW6Lfv9tS89uTeKMh1u2vpfCPkbvnDRY36VoWQZK0aA57MGg3GgtH13KBLaCL7IOAxjICi+AguJeihrA9HZAP3LAqg/9cmarpiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-58de3ab1831so4682407137.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Oct 2025 04:58:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759751939; x=1760356739;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tpORwolC+qpTMCC12M1JZ1HTJyn7uuoBh2byX7KsERo=;
        b=Hz08BPFfJQo6Uyc+Sfq3wrBOQw2C8VBTvRUE/t1EsvlgvXd3xAG8RzzVH71gaDNrUf
         YKp/egtgq8cCQZs2xwv8EbFjUkRLtGPMUE9hst6nW4lHl4nu7nYC2iOc7eWG3owMjqAg
         7jgI3jlRgs75NdVLYi68A+/Zdz8Gp1RTGvf5xac3VKiLz9jFZhewyFK7t7H98qVJlBQm
         tGvAVp7M8gWzl0ydS/44NXdCZ0bJ75l+HulHi6XpD+Uo15AbqQkkI8MsOJoxyNvpsCTj
         nGJD/n4DMMiDQ+s/52Sm02D+hnRLQUCcKUcso5LpL3Xaj1MwgzMz+Q1kNmAyiKACvoNv
         pItA==
X-Gm-Message-State: AOJu0Ywp3LmBjtELGeN3p6XUvPbduBNnfmwDMGQ8FiVCTO/wai6ynEg6
	TskDpEA7bg1ey367k5dOEimdTOlGWMPuOy4T2Aw1KJAYOxQEh6r5uJVEJUSAAEly
X-Gm-Gg: ASbGncv/rXeVX1edzHrQhNo5dkYFyYxt6+5PZPO5AuoWhhQ12eubx/DupnJIC6xIv1a
	wNfMWPmq/GvSdMdcCOG6EJAy+ICCpRjhmsML0itzi0gya4GO/nb2F5BoBboIxM1NmVol4YZHObO
	U+vgid6EN95MkFb/niFjQ0xbvcGIOeFO+Zf73h/DeP6cXVrUgCf4c5KiuZlmsxRx0W8Q6cGeB94
	fo0OPXjaqsemJ0c5sk8Latn8RBoxTtrfEPnPtVWOX/E96Amj3d4648J0tiq83gWw8SNEhhriGKI
	DQZCOonrzluDLbkbebqzdfCQfp8PneyMZ8nygHNN4jWKJYgSyZddQrApXXucmKlygOU+dvtA7Ln
	uOXkUlpj/AH3HlTg8BeYSpyZzDdoa4OZTrMu581wbsjg6mPeZ4ZgL8QmH6fuSnCAIWQmF3cEif+
	AyM1fc4XadLQDpV+sODM8=
X-Google-Smtp-Source: AGHT+IGIKOOMC9/DGFIKTOfMSj4XOMnZaXaoUgX3+FVBj9vKw1VG16FQln8WLSl3bq3NAuRYJGb5gg==
X-Received: by 2002:a05:6102:512c:b0:59d:2396:18fb with SMTP id ada2fe7eead31-5d41d0fd79bmr4462887137.25.1759751938802;
        Mon, 06 Oct 2025 04:58:58 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5d40c4eb7bcsm3267891137.3.2025.10.06.04.58.58
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 04:58:58 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-8e0c90cac25so2855398241.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Oct 2025 04:58:58 -0700 (PDT)
X-Received: by 2002:a05:6102:291f:b0:5a2:668d:f20b with SMTP id
 ada2fe7eead31-5d41d0dd17bmr5163622137.16.1759751938259; Mon, 06 Oct 2025
 04:58:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250917185651.12428-1-wsa+renesas@sang-engineering.com> <20250917185651.12428-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250917185651.12428-3-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Oct 2025 13:58:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUoo1vm1oz8HfC4UVj3X7+e8N0_cNWPX0BJeQcYZ0eCTw@mail.gmail.com>
X-Gm-Features: AS18NWABWM_T7RTrVAKGX5mAsBLfBVSPuYOM2tFdhqiGNbYaoJRqZ-R_pXAbaSY
Message-ID: <CAMuHMdUoo1vm1oz8HfC4UVj3X7+e8N0_cNWPX0BJeQcYZ0eCTw@mail.gmail.com>
Subject: Re: [PATCH 2/2] watchdog: renesas_wwdt: add driver
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Wed, 17 Sept 2025 at 20:57, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> This driver adds support for the Renesas Window Watchdog Timer (WWDT).
> Because it can only be setup once after boot and we cannot know if this
> already happened, it is mandated that the firmware configures the
> watchdog. Linux then adapts according to the given config.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

I didn't get to reviewing this driver yet, so here's just the initial comment
from scripts/checkpatch.pl:

> --- /dev/null
> +++ b/drivers/watchdog/renesas_wwdt.c

> +MODULE_DESCRIPTION("Renesas Window Watchdog (WWDT) Driver");
> +MODULE_LICENSE("GPL v2");

WARNING: Prefer "GPL" over "GPL v2" - see commit bf7fbeeae6db
("module: Cure the MODULE_LICENSE "GPL" vs. "GPL v2" bogosity")


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

