Return-Path: <linux-renesas-soc+bounces-33590-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QeasFCR1IWoJGwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33590-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Jun 2026 14:52:52 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D1573640114
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Jun 2026 14:52:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33590-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33590-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3BDF43010933
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Jun 2026 12:52:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A20C477987;
	Thu,  4 Jun 2026 12:52:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7AFB37C90F
	for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Jun 2026 12:52:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780577569; cv=none; b=bRSXHrA19DpKn+rYugvteyDPhEMJkpIlQkuI8N1FRVQ/P5xtj+C10pywXdCAQF5HRdMvw7l64LdRmhz31CWJtww8zp1NUoEQCWJNZi4xI2eM+1tKm38ACrI9hxVZM6V9Ohvq3U+8Q4HB1zUKHDyPMfpvXwiXH5gyTRN0eSn0yKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780577569; c=relaxed/simple;
	bh=F0H/JIu6WwpY+LO191dCAhs5J7RgdWFdFx8hx4gjIq0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tfSpHWSxzOJ2cAB1DPrnZQxOShOeoydaeLe8qP8axI6zuviRZ8h0hqWCGH/ML2qXMiYGsW28Xvz3wE2gVkdHUNNhFU3TTQLGLC99LCb9BUyFOCV43tjioGdJlqL5g0MaAtACSoAxBv6hdMALItejwJipkn31VARmBLwDFJMat7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-59c9b666822so443603e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Jun 2026 05:52:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780577568; x=1781182368;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wr/oQEZrL0uaIXTGgTvdG9moKLTIwXi/eGUwIMlITgs=;
        b=doWGlF7ai6D0r/dLWdtshJUogP08Z3kYEkX2F/g1HxDICf614KNfZO4zsibES4zxiD
         wsNNuoBoSVCJgUzu4KO5AX0C81XeAI+/0irKa9wwxkClyJkflm8L8KQekk0cb1LWGX2w
         aZZ13PVyrPYmwY15UijYSBRxGN4JktnAnlE1VMq56uni6kCWo4nFGBBjPYB0EQwsibPu
         GIBiuxKjPd+PO3BA6+mINGmlOcbmNdEEbsoOqkXnQRchRw9etTKtcJIEzFPla+C86TfS
         UWDGmw7aRVWhLzcA1ZX54Wy7m5lbL4RBxyn6yjMI7hEqTlXaTbXMfBR/f6QnpNz+esz7
         lM7w==
X-Forwarded-Encrypted: i=1; AFNElJ/nofVIMElhIcBiDGh9iD4Bfyu8EUKjhp0iMRIxCy2QGk0ivcmGzdOPcYc8PbeQ2oC+YkLbawvERURupcLg01FFxA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlUvVIMdGsenwiK/3smmkREsZMtlwgq6TzOQ+0BM8gjfg48TOV
	QNECpLN6ZnuD6dzL3AZ++7exXM4htcGHpqE0P2AGV0Ph26fdap6nHwWX8cGTHtSbHJ8=
X-Gm-Gg: Acq92OEXhxcZI28UJR/anfHwjM93iS17Z+0X0G0jfvC/yqmbE6Y0yTP6K+6MscPG08/
	dB37B4jm/QrsRlcmZdK6LzazfLoGN8qpkoHoepUOJEqOKX7aLkNa7ZQs/yWBTIsL+CY7AaOipbF
	KeS8Lbf2yZGUDTrsPGOpZS6r6hwmNRrXSVSkN5ZMLC5W+YXjsKtrN2D1GnoqlTXmcDYNXxik5/7
	1MaHu+zIOjCEAxNua/KMfiFSIYOJzXV2cycFXqg5tHN5DXZvnBxxO+eK4Pi3gVgYadjB73b7h1A
	sg8QhZxSRho8TxB7cXwg8jvdqK2YaPGULfpb/2Kn9++w80mheWo136iiZi3E6+XrVyCg4iGh9N7
	Jp3sIqJBSogwa9MvzXfQtOIvXe+duBlV2VoopOor/cmsvD+Grt/oFuJIr0WbtV90tsIcrU4tqNG
	Aswd4repnva+5FTM6oLhVR1c1cGhNGQXvUqHt16uzG+QRSb31LfAD7R0FuJsuwGh8MCVaRRFQ=
X-Received: by 2002:a05:6122:6609:b0:5a5:3eea:4513 with SMTP id 71dfb90a1353d-5a6e93c8044mr5037973e0c.12.1780577567730;
        Thu, 04 Jun 2026 05:52:47 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5a6ddacc48bsm5104157e0c.18.2026.06.04.05.52.47
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 05:52:47 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-963b8b4382dso530895241.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Jun 2026 05:52:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9shNMAsGJyaaAuU/Ebn8A+ThITgT3KrtLBV/VSBs2sgASjDGh3P7/WD2ifu/LV8UAnszOflZsp6nVwthlkn9IQug==@vger.kernel.org
X-Received: by 2002:a05:6102:41a8:b0:6d8:f538:f01e with SMTP id
 ada2fe7eead31-6ec49a5f392mr4492688137.24.1780577567222; Thu, 04 Jun 2026
 05:52:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603143340.162457-1-biju.das.jz@bp.renesas.com> <20260603143340.162457-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260603143340.162457-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 4 Jun 2026 14:52:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUyuk5ZbRHz71wfBQXYgfM_ho3XCzfCuGTpBKK87fmEmw@mail.gmail.com>
X-Gm-Features: AVVi8CfIPij-f4v2F1TSD8hUDQNK2etj7Jm7kYJCbVCpune6nMN8quSLSlZVSyE
Message-ID: <CAMuHMdUyuk5ZbRHz71wfBQXYgfM_ho3XCzfCuGTpBKK87fmEmw@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a09g047e57-smarc: Drop
 SW_SER0_PMOD condition for rsci4
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,bp.renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-33590-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS(0.00)[m:biju.das.au@gmail.com,m:magnus.damm@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:biju.das.jz@bp.renesas.com,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:bijudasau@gmail.com,m:magnusdamm@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email,vger.kernel.org:from_smtp,mail.gmail.com:mid,glider.be:email,linux-m68k.org:from_mime,linux-m68k.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D1573640114

On Wed, 3 Jun 2026 at 16:33, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> rsci4 is routed to either the PMOD connector or the M.2 connector
> depending on the SW_SER0_PMOD switch state. In both cases, rsci4 is
> available for use, so there is no need to guard it with SW_SER0_PMOD.
>
> Drop the SW_SER0_PMOD condition and retain only the SW_LCD_EN check,
> as rsci4 is unavailable only when the LCD is enabled.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

