Return-Path: <linux-renesas-soc+bounces-10778-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 914959E0A81
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Dec 2024 18:57:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DE5B3B2FB54
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Dec 2024 15:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11AB51304BA;
	Mon,  2 Dec 2024 15:49:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1FC7DA87
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Dec 2024 15:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733154557; cv=none; b=AEHH3gQ92ppPqwavHqSiBt9YwR1oMDCXuOrNQa3WeVXBDNK+lWb53pZCG89QBJYjdtWlBlDTBiD7361ei+OejQgE/ofVpLwjHS1nqoJhghUPf9X4PdSshOasUfQqmtp14d9ozlXmrlAtoXE6yKv+dhh6YWQqgIoNRlOwJ8nhJRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733154557; c=relaxed/simple;
	bh=mgyHCLEjF9RtnbsmkKNhqg2TRs27CtlsbVASJsYOLng=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S3r7wcACLGJ8JbIeTNWQd3n16VZBAZBdNYqtfjHtbhhyQKhe5KS4o0m/sTefF3PLv4Cvn7jhXS2w67/XISI2Zoza6vrVEYWd9UHpk6F3bt8XH4xLTUcUU132tXT42Ba7VyqzEVCPem/njDUfAvCfx8pQ8T4Y3qYl8wAjiOTF/tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3ea427001c5so2287329b6e.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Dec 2024 07:49:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733154553; x=1733759353;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xTp4g4VRNCG7oohqIoTb4BN+LBRl4zZrMDqw/w4OdvI=;
        b=OYqi47BJkytrkofNf0MXjCglIQvZugIQFlj7/Kfnyt0Lnu7iBcF2IP+rMqJ5K975xM
         WGPwhcpkznpI2pxfh+96cX/3KwWxr7b7ediInSShCpbmJkhjmduQz6j5/WqfSmbiZL04
         jU5X37Xq62wKAdobV6YzS5e3GIw668neIoVkrzgIMmk5o2E54XwDe8JyWjfu4T3CyPam
         oSn+7hDPAHrxtmv9HyTHogZYqCq87zryBcdTQe52GWN/E1ToNqEXaDYRNaWhEZZLiCQr
         AWN6obN3THFdONgtt35rCfBkK7WzDjDwfRCWtIPr/IiuQSXaWTV+E+MtHH2VuAb1U2PU
         DymA==
X-Gm-Message-State: AOJu0YwefgRQHb743QpnWud0Sh3TvlkwjNt992Tdu0LjiiuwBw455CX2
	qwlzFeqlrxvlWaYZ5sMXi6qXUJZnPdhYXSFX95kIDgw3XHlmNiKFfVL+9W7V
X-Gm-Gg: ASbGncvjhKdPOLJShG2Y9kn1bQzch1ZliwN4L2CCppO8tyOmO7jrqokn4i0SQ+3AosZ
	jXL5Kt0Ki1OjX8aQP5oB+7esVzxRP48a9K1jYuSMoJhgOU5PF2epHoKpRcsWbzd7MACSK9Cxqrf
	0w9JCbCdS4sA+0PED+xPzjSuOwtyXqbnfyuTWfzLGIFiCCOvmeiYBR2rLaa3EZS3VVx8icofqIg
	WJI0V2g+7Uqnb81BmKHVSt9vUP0WarX2dxyRVqgLHSQyMhi6hiNKEFhp3SJySuPgMN1NFNFIByW
	Mc2Hc9DpothP
X-Google-Smtp-Source: AGHT+IE90ADP8CCj/ipHIeQrSf3OTqmUiA2TBt69mVyLASSPrPSKi6CzXKo8EJul2qxt5N2izBREaQ==
X-Received: by 2002:a05:6808:2f07:b0:3e3:ee40:204d with SMTP id 5614622812f47-3ea6dbd61cbmr16760001b6e.14.1733154552963;
        Mon, 02 Dec 2024 07:49:12 -0800 (PST)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com. [209.85.161.43])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3ea86037c6fsm2342802b6e.5.2024.12.02.07.49.12
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 07:49:12 -0800 (PST)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5f1d3e74ea4so1803318eaf.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Dec 2024 07:49:12 -0800 (PST)
X-Received: by 2002:a05:6358:6f18:b0:1ca:a296:f6fe with SMTP id
 e5c5f4694b2df-1cab15cff10mr919477055d.6.1733154551856; Mon, 02 Dec 2024
 07:49:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1729240989.git.geert+renesas@glider.be>
In-Reply-To: <cover.1729240989.git.geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Dec 2024 16:49:00 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXok5W7d5XBOCrUY3gqd5_xKXrOmqOC33re0-OiZjOH6w@mail.gmail.com>
Message-ID: <CAMuHMdXok5W7d5XBOCrUY3gqd5_xKXrOmqOC33re0-OiZjOH6w@mail.gmail.com>
Subject: Re: [PATCH/RFC 0/1] arm64: dts: renesas: white-hawk: Add mini-DP
 output support
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 18, 2024 at 11:32=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> As I had to test Tomi's WIP patches to add mini-DP output support to
> Gray Hawk Single, I moved my (old and new) DisplayPort gear to my board
> farm, and thought this was a good opportunity to test mini-DP output on
> White Hawk as a baseline (CN5), and add support for the second mini-DP
> output on the White Hawk BreakOut board (CN15).
>
> For testing, I used the following hardware:
>   (A) BenQ BL2420PT desktop display (2560x1440),
>   (B) Joy-It Joy-View 15 portable display (1920x1080),
>   (C) Lindy DisplayPort to 2 Port HDMI MST Hub,
>   (D) Passive mini-DP to HDMI cable,
>   (E) LogiLink Mini DisplayPort to VGA Converter.
>
> (A)-(C) are known to work with my Intel desktop.
> (D)-(E) are known to work with an old Dell XPS13.
>
> Software-wise, I used the frame buffer text console, "modetest -M
> rcar-du -s 86:1920x1080@XR24" or "modetest -M rcar-du -s
> 86:2560x1440@XR24", and fbtest.
>
> White Hawk CN5
> --------------
>
>   1. Mini-DP to (A) DP:
>        - 2560x1440 works but flickers (flickering shifts image
>          horizontally; perhaps a cable issue, as 2 below does work?)
>        - 1920x1080 is stable

While I don't have a second Mini-DP-to-DP-M cable, I tried a few
other combos (now on Gray Hawk Single):
  7. (D) + HDMI-F-F adapter + passive HDMI-F-to-DP-cable to (A) DP,
  8. Mini-DP-to-DP-F cable (=3DX) + plain DP cable (=3DY) to (A) DP,
unfortunately with the same results.  Note that (X) is the same cable
as used in scenario 2 below, and (Y) works fine with my Intel desktop.

However, the maximum cable length for eDP seems to be 30 cm, so that
may explain why 2 below is the only wiring that works at 2560x1440
(despite cable (X) being 1m, i.e. still too long)?

>   2. Mini-DP to (C) to (A) HDMI:
>        - 2560x1440 OK
>        - 1920x1080 OK

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

