Return-Path: <linux-renesas-soc+bounces-28896-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Ev4A+SbqWnGAwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28896-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 16:06:12 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A4C214272
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 16:06:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B534301691F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Mar 2026 15:02:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7E19257851;
	Thu,  5 Mar 2026 15:02:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2FE39A7F4
	for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Mar 2026 15:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772722975; cv=none; b=KCS3H3/wcvj9RTt6j24nPr0Pg/b63jYU8m329Y6wEQUrQk/PQmxOTZv6YT6MlIeCZSip8gyhOMndRt0xbehC4L9dULkhY4qZaK3Z0S4E8ZU08PvytfqB09i1Hlw6FW/RQyvW2r51uDWAqN0XX4/27KLSuZGkuP/NZ9f2nk/8uEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772722975; c=relaxed/simple;
	bh=6Zl9vIVHwDZNJgCLDsx4wsUdqs3E2UhAw3VMBoNQa2Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eXGrS0toNsLKUsB+qQczuwUol7tO53cDjImYbB929IOfVojHYAiw5T9mOS4mhgsk59aLIXA5VEK7NfY4AEZv22HoXPic2JpZueL3QkEb/63N6780RQ2QwAXxgNRc/9hzFbkaW+QBEeIz9fGEPAgf9aylr2iMomecSQOuyyk52tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56af73db66bso266716e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 Mar 2026 07:02:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772722973; x=1773327773;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1FearIthSgJQYQK6tZ23YX42zEHQn30eVQGcgND2I70=;
        b=CaTjfv+4s75q1LUZpQ2uGlmwdz/0Ou8WGPGlNQce4QShheIfdsQGseJx4qlmnvfcRT
         rlx0Pe7htTWspok6g/Si+J4AR/vIf6/+g3krvAwzhf//wEcPOrEDaMU2gYyKKk9APKjI
         MSr/46arMzG8voMzak22BwBOWkowZ0X9XBRQrQPBAM3TQ2uWAd+jZJDIXdiMze/h5yS0
         i+hr8o60FEOznazsFhloqa4E6kQnw7DXkpx2TuKQe8/VAzmpzG14Z0fzH3KKBYVTH+eT
         LT1RAcSScAvheUeWNWhu/NpQRJr228lesKrRRHgPiGHpLcp2qJKCfktNj+8gyogEmhzh
         AQwA==
X-Forwarded-Encrypted: i=1; AJvYcCVHHsmOCZxbsr1nuQQrNsukhyEX/fLz+mZUsUREZoHcocuL/OA+TrDaMZ0BkUIbTVsa1uzlBWwhOVDJJ4fgVQxPfg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXOJZp8eX6bIje5CyKfFFIJB7LzEmkOaeLfBtJrXoXTfHgVDT2
	xFEG5ZBLbPEkv4owmcQ46ydHuz61UZ2mCyyPv3cwqauE8pIbmmex5Oo0s5q72ygnfwI=
X-Gm-Gg: ATEYQzwnXBX6HBjWpOcuODdS9Pz8F1kDnRaTSxchhO8awtiTYY7/J7YvDaGVhz2nDqF
	DP8lsBuz4AI4sXaQ3++aubhzao78CJitZjEAQ4PYgiDv0m3zWMxhe2PLqtE7B8nvgSUlkJJXe3a
	AeB684nGx/zlhhZJ1mdRaiG1gvUcouQWyRYjLNpBpT54Qmn7v4z2TvljRT7QOtiLQcCZFnhqhix
	zpzJeqCfIJb01YY2hrZZfjgkS081k/QsWk+06i+8UTA7Be8k8sdizuI016ZlZBr+9Rc4BEA8pyG
	ZKqDk6FjOHto7XDfvVMTCi2+3A+Ywyg1ofFkBoh7R+3GSokFHTUrAMFrEhmVx9trlknQzsvRM4D
	P1a2EJTz4McTvHGWSrERB7Q3omkeOXg3pG3eshnQnnfqcRjyUXn4m8Vyku/1SYF9aPWJm/e9hiM
	zknIROMC2DT0Q9QhmTPWLLh40YZmIIuErqa9eLHdg5+swl5cXjijDfXRjLhLqn9Bf3u1TJIVhjK
	zA=
X-Received: by 2002:a05:6122:e193:b0:56a:fb7b:752f with SMTP id 71dfb90a1353d-56afb7b784dmr476445e0c.16.1772722973435;
        Thu, 05 Mar 2026 07:02:53 -0800 (PST)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56ae7d37498sm6067593e0c.9.2026.03.05.07.02.52
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 07:02:52 -0800 (PST)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56adf76631cso1141323e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 Mar 2026 07:02:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUse1AOPc5un3PaaBNcijIugazxALWaZVrsGIf8RAH1LX+/+Z9T0JtH9CF6w5nJ4W1kqwIel3lGxFK1QzXw1lDiUA==@vger.kernel.org
X-Received: by 2002:a05:6122:a13:b0:55b:74ac:72cf with SMTP id
 71dfb90a1353d-56ae77f888bmr2794961e0c.17.1772722945046; Thu, 05 Mar 2026
 07:02:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203103031.247435-1-biju.das.jz@bp.renesas.com> <20260203103031.247435-11-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260203103031.247435-11-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Mar 2026 16:02:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUuJyXesYV6mXNN7nw=VOpFYgWsogAoCf63pi+yBvp1+A@mail.gmail.com>
X-Gm-Features: AaiRm52vG2BAZUBL0eamCi9HbjtrvzGtwKA_siM63_vNfp8vlUDLn3A9WpQIE8w
Message-ID: <CAMuHMdUuJyXesYV6mXNN7nw=VOpFYgWsogAoCf63pi+yBvp1+A@mail.gmail.com>
Subject: Re: [PATCH v3 10/10] arm64: dts: renesas: Add initial device tree for
 RZ/G3L SMARC EVK board
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 34A4C214272
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,bp.renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-28896-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.500];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,glider.be:email,linux-m68k.org:email]
X-Rspamd-Action: no action

On Tue, 3 Feb 2026 at 11:30, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add the initial device tree for the Renesas RZ/G3L SMARC EVK board.
>
> Added placeholders to avoid compilation error with the common code in
> renesas-smarc2.dtsi.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

