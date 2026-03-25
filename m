Return-Path: <linux-renesas-soc+bounces-30253-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CSXGmDxw2lZvAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30253-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 15:29:52 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 05516326C82
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 15:29:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EC4CA303F9AE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 14:23:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C84283A3E64;
	Wed, 25 Mar 2026 14:23:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966D32459C9
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 14:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774448614; cv=none; b=T6MoQBdjXw6b97nd+f640x+riRA2V56YYkKDBspWhcEa4J876U1I5/d7XeV7fluucU0YIulKNmL9FP+uSzHAowrihPoM4PeuZ8pRlmjnmUKkDipb3NOfLBsBgkZdjXIpcdZZ7D3bWOFqzAwd1v/yK2q86mu4NeNiYwSvRMNSPbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774448614; c=relaxed/simple;
	bh=JObBwXeLxUDs8F4FozMvFfqlMMxM8IgJ671ugIszdQU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ctE08zdQHUwjKrSaNbnJzPZN8D4ohr5L0qTRvM14j8kudAlsq3FTIpYR3m6Tarz8rTuyTicbTinpnCB9rYNpd6stwp/N1lw8PNfmY7HM+zTiJbbXdE0BflToV0hgHoLetQbMbqDxqWFm02+LL0mc4qmVPIMo7O8mVmzBXRJ3b+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5fff18d44fbso3911569137.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 07:23:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774448612; x=1775053412;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uPfKdW44wibRLb8oNCfuNh010t8RCFkKs8K3Sdc1EX0=;
        b=IanOi8klXjORCwxXyEd5dw0SE6xRgNuC5XBvCnM+1QyCWkPZqPibjN+SLEB8neVYUw
         xWcYTTxPXvMscnH8ieW5b3kfFMuXPOOg3nSH1UIaRI0kk4ZVaPxOJ7kbqtFoFi1q+RC6
         zTcQqPRk2XfDMZve+q/VVwivxeMopafb6doi8j2hvLuw2VGPc9Nd6DuX+qqh4nkiUoP9
         m7tAHkvyU/5BXKE4wqXogMPckOILDPl2sHcpu4ob4cy0uw6S5b9m1UnWRuquhEjeJBqp
         /7DSiRCrXPHVQpXm/XlU67CMZWfdKCqVtc3Eoimm5ua7aTb0YEwyqeMtXc5NjMw51wur
         KX7w==
X-Forwarded-Encrypted: i=1; AJvYcCWe1fdZHQeQcEe6gUtWouMumATMIiu2Kr5qlTEOEuRdYSYuen2Sn1aOBscEQ560V15Ui3tJKgK3OS0hdwN9YSzrsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUvt2khmsD6G49G4c31eGkyDnd7Lvq2nZA4Zzs44zrNUXmxrLy
	sCCevt2QD4xXJjiW78PcaV8nSEwO90eJs6eMVGZ/OHJHmDF7wUrk55WZzSj2uwQhjck=
X-Gm-Gg: ATEYQzwx9TFejbbOTNJzBjDDq+C0kY8C6dVC2B2XYVE9wXJECoFCaCF4KQ5iL53/7Uv
	kx8+PL+5OkStt7MSvZoM9QZdu38fzhQfKF0Ozrlo4+XgG/ATBwNKd/85ESMh0N7zTYbakG00aw5
	Xz6HmyLgdW5rGKT6dCapUPBRU7k/b9buO0Z+zutuB6ryj3tkZxSOeg6IdFkEKwNcPkXihwIWKn8
	IfYii0jdeAdksnXt8Iq69rWcG4qCdnKVlv1tZU1zpZF+79BYGBY2Akt/1co8RhRCYq8P2a9ky7f
	dbgq6Q2u3JKF+FFBu26LjH1U1csgI/D76r36rZpWdNSe2FNK+onY8fubMnoLsly3iafVtyUKd9E
	2eWykESFEWEaRr9kl9t1aI4ALzHdZe/zrYiY4PQWpYnjImk4j17u89gAUR8PWLl2EBBL3rnZn6v
	qMfKGeRVF66L9L9Hr6TYWlViMc1kfam7/xUFqc4HZjfRnhMGKlO2UrwnPOgIJD
X-Received: by 2002:a05:6102:9d8:b0:5e5:6eee:8adb with SMTP id ada2fe7eead31-60378fe5955mr1796651137.4.1774448612514;
        Wed, 25 Mar 2026 07:23:32 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-951be1065ffsm118694241.2.2026.03.25.07.23.31
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 07:23:31 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5ffa277c115so4351964137.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 07:23:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWSHcaNV/xjKQ+TGHO2EbMmblbBxousjBAZbhGx+bQ7GizJ7jWzVI/up7nEdjPe6szUhyYUXIQFiYZBlGYm8jN01A==@vger.kernel.org
X-Received: by 2002:a05:6102:2c83:b0:602:9977:a4fe with SMTP id
 ada2fe7eead31-6038723803fmr1660070137.19.1774448611693; Wed, 25 Mar 2026
 07:23:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313164008.40933-1-marek.vasut+renesas@mailbox.org> <20260313164008.40933-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260313164008.40933-3-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Mar 2026 15:23:18 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUtkSWb7nr6R3XEBtzzoXOEOqE3uAAGSfmxXA3eyaUVOw@mail.gmail.com>
X-Gm-Features: AQROBzC97DFZqc_tdbslxD1CrTlsZtSsIxK87YaGhcNdw9L7AipBy4NtEWpck64
Message-ID: <CAMuHMdUtkSWb7nr6R3XEBtzzoXOEOqE3uAAGSfmxXA3eyaUVOw@mail.gmail.com>
Subject: Re: [PATCH 2/4] arm64: dts: renesas: Drop RTL8211F PHY C22 compatible string
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,bp.renesas.com,kernel.org,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-30253-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,linux-m68k.org:email,glider.be:email,mailbox.org:email]
X-Rspamd-Queue-Id: 05516326C82
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 13 Mar 2026 at 17:40, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Realtek RTL8211F PHY schema indicates that compatible string
> "ethernet-phy-id001c.c916" must not be followed by any other
> compatible string. Drop trailing "ethernet-phy-ieee802.3-c22"
> to match the schema.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

