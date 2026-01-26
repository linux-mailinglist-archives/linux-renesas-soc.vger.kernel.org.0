Return-Path: <linux-renesas-soc+bounces-27441-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qB17Ht+Od2m9hgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27441-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 16:57:19 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C908F8A649
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 16:57:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BA887301C5AC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 15:57:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C367B34105C;
	Mon, 26 Jan 2026 15:57:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79136340A59
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jan 2026 15:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769443028; cv=none; b=PN6xoW4YN+PoGXG92I8bvjtjbTNCxW6RbBtlCdBKstNvmbX4/X7gSAP3ZA+vzqOmM6zcxc6MHzkmxVBrzrLKjQADkanrzlkfAlZXALYxQjjSIYAcTywNfVOiOH8Z1JuNZLEGL2muKUPNqLHYl4fBEl66b04aLtpq4lGP1AyzaNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769443028; c=relaxed/simple;
	bh=YLtBt7Yt1uOj6O5aaTFlwAQnG8l5W6SfahAW/Yz+oGA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b2ULQaRL7qWzFtd2WyZnNqbGo6bNVBNsIiC32uVuxpUEHFv3YhwiHfM9f0G02IJJbVTg0tVS+CBRSmTE8Cy9+Z/uaWGrX03irvuFVy4QBg4VERrfbkBg8Oyj1LnpovE/F3AaSEgjNyhkVp1WmqqdW6F6MvVXy73QxXbtpz/3nt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5637886c92aso1125675e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jan 2026 07:57:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769443026; x=1770047826;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gdijfS0+OQ3FioX0VO8ULn53/vOnmf0w3wcm1RiEZQk=;
        b=u0CrcQWUR9k7QWI8O5zWcQJO9MqV4Qr/xufsWTlJC2uhFEam5wSNlQnYVtz5ZEPyMv
         QUpTaCfVLw3VWowx52urN/PJsrprRu8oNiUMi0oakSux+Z6K7EnkirUDmFbLVYIoH9Ne
         84FapebRDzoTlLg21yMyRiY3CwgqLuY7/l5p+8fK+FmiVdlzm3+oGEKWVNmF1N5fUbZz
         mFFT9FPGOnRrYppTOTPvLVfai93u13mHjvYItPzVyKVVSWCFhUoThrX9q8LYhfqGEVb9
         HSqqj/ibr/P6Lo2+pgimUDuUXciYGqs1HyY8Z1RFli74OIneKzbAIpPRFiYvYkLvc8aj
         HuvA==
X-Forwarded-Encrypted: i=1; AJvYcCWLghSvZrFLbhZhqjDEWh2LH9KV3RgXEZD/AlJcQeUx7uSr6tg5oCjKPf9autOe7RHVOwRcNq74B2l+Q2XJSyTQVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7O4+4dTbfzB+/i6ShU6Mnu2SHTMmIsh+1mesQp9Yf47szjxhb
	uG20/l3E3t9UNeoAgSHn3DmXWl1K9x+2lY5DRZ2RA92kCL3UwRpaz+S71EClzD0V
X-Gm-Gg: AZuq6aLENBmYAF3vJT0aZjeX00dJ9bFj1Wp5dpUN21SElyDfboXER63ExU/OzWHizTi
	k2kB94oSAlFY1U/wAxqyC80AsQLyM90017cAAdpS8mHi2sXi7UAU0Zk6+E2xhMJtH3TI+uvxI7O
	oseXhoarbux6bJ3huLgW5L601fSONgyOI4Xd6ncdMNv3hd8S7/ZuTk0HvF7p81mf6I/qTC6mH96
	6BXONklNX/BVHGbwrH2QfFxlIoLIxd67TsgeWDG+QwWm4BFTIj8+FZaO121A/dYZgWR/W0RPIaH
	OkyE+RGk6LqcCuADbQat5Gd0sRXYH0OOesL3GIHcNMX+NFZ3TztGGDgbvA52QXGAPtoaTabv0Wb
	u0dPLutFUCWw6Rl0DR+DPlLYIbW4ES9KS2ioqNgLs5BQrvS+XYtMtasmfAKreNySPaLOhwQlWWI
	4S6G4l39oZ99Zq/OxhmpCfJv9Y0yYFEXchpoDt/KPqLVP4BbCjCNf6
X-Received: by 2002:a05:6122:3c55:b0:55f:c318:1afa with SMTP id 71dfb90a1353d-5665c959de0mr1155722e0c.6.1769443026246;
        Mon, 26 Jan 2026 07:57:06 -0800 (PST)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5663fa7d527sm2066925e0c.7.2026.01.26.07.57.05
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 07:57:05 -0800 (PST)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-55b0af02ddeso802941e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jan 2026 07:57:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVFO7kv23egS2PRZfJJjHSdHrFEZo1yZQ307OgdWqyddF551UOz3YMxplpQ4/it8BHzpfJGzPin53OpT754Ha/nqA==@vger.kernel.org
X-Received: by 2002:a05:6122:3a13:b0:563:6767:217f with SMTP id
 71dfb90a1353d-5665c93bc8fmr1333184e0c.1.1769443025008; Mon, 26 Jan 2026
 07:57:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260125192706.27099-1-ovidiu.panait.rb@renesas.com> <20260125192706.27099-5-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20260125192706.27099-5-ovidiu.panait.rb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Jan 2026 16:56:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWkXFvOOcZ07seJ6M5f=6ENEkCnoj29ueimdOJg3MRaUQ@mail.gmail.com>
X-Gm-Features: AZwV_Qih8gRGOzcPfHBZgLb81bZR1XZJrEB5kRB8S9RRMk4gAayWM-Q1oPZZvjI
Message-ID: <CAMuHMdWkXFvOOcZ07seJ6M5f=6ENEkCnoj29ueimdOJg3MRaUQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] arm64: dts: renesas: r9a09g056: Add RTC node
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: claudiu.beznea.uj@bp.renesas.com, alexandre.belloni@bootlin.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, linux-rtc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,bootlin.com,kernel.org,gmail.com,baylibre.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-27441-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,glider.be:email]
X-Rspamd-Queue-Id: C908F8A649
X-Rspamd-Action: no action

On Sun, 25 Jan 2026 at 20:27, Ovidiu Panait
<ovidiu.panait.rb@renesas.com> wrote:
> Add RTC node to Renesas RZ/V2N ("R9A09G056") SoC DTSI.
>
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.21.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

