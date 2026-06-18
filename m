Return-Path: <linux-renesas-soc+bounces-34188-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 76vIOdesM2rDEwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34188-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 10:31:19 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5191569E777
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 10:31:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34188-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34188-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B7FAF3017086
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 08:31:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A44DC3B14BE;
	Thu, 18 Jun 2026 08:31:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648023A4F26
	for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Jun 2026 08:31:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781771477; cv=none; b=kqn3PGji8sEBFDJZ24mst/BSLSyDkb3SG1A9PYMy1C6xMjABsWg7O5J50m14jlot9TwWUy+e4mSA5FZBJcBi50UN4uQ/GU/mi97A0zkAOUdzpT6xw6o7/O9PZhkbBt7eYosD8tvguenDtwVevYMkYfa0TkNNXHeyMvhlMk7xcLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781771477; c=relaxed/simple;
	bh=BkJEkp9s/SL76jUUgDOhTi9+9CfgU4sbWGNUCazQo00=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QPmHvK9tjU5zJgH9L8hT8QiFbt4DAbA3UlnFnkOL2YeGC9QEsteSHGyxUNYlbzrKz5oiuqT1F/1oGOjYNxo293W44uGUvEOx/vBWGyGNHhOzW1jYdim1wWFHKhQ238gEu+xNYhtru9LiCDIYOGy9nHFQeno5AETheJ2Z6JC+uOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-963b04fd87aso203741241.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Jun 2026 01:31:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781771475; x=1782376275;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/GI9UJOxr1l6gPfMPiF/zMOYu67uY0OJOk4A0kyzg9U=;
        b=I2xvftu7HJ/mUx1O1Rb2/TM+hWWWqXEJYy1ip4amSNkVdq1LfA73iuEqz7Vqy+1jei
         zwdrnmD0StmqR0AbUR0/5zNRi3xXcsumlh+n+/A/AP6UYe1W9LL0TGUMXX1LTSPNG0rz
         TVuAorMMLWdC3/xX9PZdy0oJuV6d2/lYP7PahBYyp1Gpa0GZwwDkq3t6It3knE20py6Y
         H9Ez3wjZbkWOoENcSNv6E/q99qZdnYYJZfXDHZov7EJk/PvZ6hZTN3gXEdYx9Ycj0wgf
         gJaZse60UPjEfoYzfTojR8t0XxLFivhFaXlBTtmhwAScShvnSCDmk7Cqf/Wi1fy0Vh+g
         rRGQ==
X-Forwarded-Encrypted: i=1; AFNElJ+9O4c9kWWasKZj9etzS2skIN85U2LMvyy0QhL2kWCR5sENYYWgUnAn7mx3c0bSiAU2WmVnmHuEu16qamUesQn10A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1ZX0bsD09fE0Wu2E5XQDV3JOw0+SGIOeBTQTBhwQkJ8jEK7RQ
	Uw1lg3tuz9FGhFQQmSfwX+0ilQV9s2P3vTcpymywmM3mmvje8hvuqfpBvXV/KmjM
X-Gm-Gg: AfdE7cmpg87IVlqz2PiPJ5etah8xWhf7PLNUlzhuZwJKU1Hpit++amftkiTCAepqvaz
	ixvBCIaxqIvPptZrXYPQDs9hC9Sd+5dyTUnqOS0oEpU/kOr7J0LLgZtPr3G07CYCi7HNGEAavco
	lp0GePLz/s8u3v8VsrEKv2VsW/G9ZzqUuE8EyB/WRDUMR66E7W1hnTcLHLdzioOd/8lxRZ4avoq
	5O7zmm/nXJGI7U0JbckYMfQSNqU8dzeXIS2AwFxNzS4KZzPaJzSqVKak7F0lzo1HNpqwyahaikH
	IYcKpENAu6yhqEbMm2GG5X9aAMMtQWVOhfT124e5nlKLOR6/XmjRg3b/jg0aeT13KDii+SCW1ep
	9pHmsA9TBUoFoX57myzP0l4nlyuDs/d/W8tiUlm2AkV9rlIyWd4EpzkN9aL7TprRj69hXPtMnYT
	FtIaq4rlaGOAHdMtCzwfmEqW2s8O5unD3LdaKtGsXGHyiQ5v9zw7e2Pw==
X-Received: by 2002:a05:6102:c93:b0:6c6:74d:e090 with SMTP id ada2fe7eead31-72927ad8388mr489110137.9.1781771475231;
        Thu, 18 Jun 2026 01:31:15 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7208737508dsm9233472137.9.2026.06.18.01.31.14
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 01:31:15 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-59dc1714d44so230589e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Jun 2026 01:31:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8J77KzrGn5+e2dAtEFO9xqeVRTzkBmEQKHrPZa0JU3i/ecHA2HQANxaro7OdS+F/zBBqcCud9DYgKPQ40tjmeDlA==@vger.kernel.org
X-Received: by 2002:a05:6102:5086:b0:6f0:3c5c:76a with SMTP id
 ada2fe7eead31-7292459b54emr359324137.0.1781771474579; Thu, 18 Jun 2026
 01:31:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618081932.172168-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260618081932.172168-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 18 Jun 2026 10:31:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVucx+_gRxc8jS+CGiqQV+U_G=6evTa_1suMEK+Mue=8A@mail.gmail.com>
X-Gm-Features: AVVi8CenwmJWTOn6QdfCagxiHKEqb10IWStknccc3zA4qu-_YEn9e8Db00cjLcw
Message-ID: <CAMuHMdVucx+_gRxc8jS+CGiqQV+U_G=6evTa_1suMEK+Mue=8A@mail.gmail.com>
Subject: Re: [PATCH] spi: rpc-if: Use correct device for hardware
 reinitialization on resume
To: Biju <biju.das.au@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Quang Nguyen <quang.nguyen.wx@renesas.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-spi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-34188-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS(0.00)[m:biju.das.au@gmail.com,m:broonie@kernel.org,m:quang.nguyen.wx@renesas.com,m:biju.das.jz@bp.renesas.com,m:linux-spi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert+renesas@glider.be,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:linux-renesas-soc@vger.kernel.org,m:bijudasau@gmail.com,m:geert@glider.be,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:from_mime,linux-m68k.org:email,mail.gmail.com:mid,renesas.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5191569E777

On Thu, 18 Jun 2026 at 10:19, Biju <biju.das.au@gmail.com> wrote:
> From: Quang Nguyen <quang.nguyen.wx@renesas.com>
>
> rpcif_spi_resume() currently passes the SPI controller device to
> rpcif_hw_init(), but the function should be called with the RPC
> interface device.
>
> Retrieve the rpcif private data from the SPI controller and pass
> rpc->dev instead. Also propagate the return value of rpcif_hw_init() so
> that a failure during resume is properly reported rather than silently
> ignored.
>
> Fixes: ad4728740bd6 ("spi: rpc-if: Add resume support for RZ/G3E")
> Signed-off-by: Quang Nguyen <quang.nguyen.wx@renesas.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

