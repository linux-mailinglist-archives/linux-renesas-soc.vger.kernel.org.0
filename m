Return-Path: <linux-renesas-soc+bounces-30252-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJFJGhvxw2lZvAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30252-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 15:28:43 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E26326C46
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 15:28:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6B8D6303445C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 14:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2F223DFC7B;
	Wed, 25 Mar 2026 14:22:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03C030B509
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 14:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774448577; cv=none; b=fp5oKckwdhEUjUHAArgJVKNzYWO1BrWdw/L6OJOWuY6hi7E3nWyYVtjQ6jZwReWOzWi7r+AxSWtyQGnWe4/HlDlPcyDgO+RGIpM/Lyj3Hhpr0K3k8lqzYeMrTjbJQl12xNWnK+tLZJbxhamTZ5/ccW7tu1PtthHIU9j5VOdaEnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774448577; c=relaxed/simple;
	bh=rZThx79frx4t18+PPTsDrfdxpWxT5AnHxRbdBz5eNgU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sESl+kXOlnw0wl+L7Q5TFiS5v6B+6cxsG//ZrzpejiCIXQSYC3ZDaT4I/+Cspt+Zp+GPnAU2R7DJ9Kcjf8VqAPRFDfGOtlVtsHKRRMxgf9yN7kxvhe6NiD5kAm9eT3PCqXNtDlRkrg3J4matZPl8+vuor17QIcikUIvyovXrzg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-951afc6741bso171126241.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 07:22:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774448574; x=1775053374;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yon6PYtk4fOFlVLRxERqANp3qEld/pf3TJ4Zh1FRxts=;
        b=TljOjfRVKR9KcLKBNPTZfZjt48BYV1FE0rS+6oXPocI1B2eDlmd6AokDcjQapJQAsW
         RgcyCY9St3aTneUbI0XARDdZn1aJdPHgUHeVM6fo626tnO1awX55NzvMoeo2y6cw6iPC
         DFES4eNXvbA0ffTpQV+aE1qZEtCGEmofqgvQr1yBUwGsxwPiZgPrXLdAYus+vNvTnGsF
         nry6xbxDZk/kXwJ9wPSbbxZKgWMWPNwVDfBdAXpx+45hwj3mTo2UwtcCatQGSCxLidYX
         cc9NoQ5OlfY/Nql4J4cYi/fnfVaFYKoXiaIN4RRlAvC+syQrd1NvKl/PLqazMUHzvstw
         6Gtg==
X-Forwarded-Encrypted: i=1; AJvYcCU5o7yREfE9a3dcfHPMS4uYec1yDcZtTQU+kWXLNbkkXNzBcU2qneXpTHkFUy1PZufFaBPDYhRIrDHhJgwGLaSLow==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHRFyKIMrNpncf4HNJf2DiBp6RKPpOiuj8FnB9WN6u3k/6dWnm
	5Yr5MgoIFxKlSWcfUfEIFl1gvpGsd09sJMcZ9Kyjmt1dR+pkIDmrGF9vTylwt90dLr8=
X-Gm-Gg: ATEYQzy5JQYx99vL+Ymryv9eXzxosTu0mYx8YzuEisHUnQBFrU1X+Ecy6C3IBb62ho/
	V+5WQoM0V3cmJMhbS5s6Jcif2Zr8cn+ScHLqhZRfVRv4RHPWCFFeSmnmZoCk2cbX+yw39xhIoTT
	OQgHBWJ0FzxjTE0pKoug3ElKnCTgAKbawXN2PTdoTogcHqalFzQrt7ddrM9C8J/+HMDp3URy1L/
	Nj/bMu7wvBTsYjU5r71mLiS0AqYeu+qwgi+N/WFhZ8IgD1IKVI5jhd2IsHiuoCyFLsTcQc1rhfY
	B0W/RtdXMi+QozYX4kFO4xw9chI/HZYg6nq74goS9EAr6s8zCJT18pQmTljJA66JCe85oJ99jks
	eYUeBhYQHFbm1Xw5GCnnCyrkC69/Mnjn6MwrjAOV/aR2czqkGnbyHS8vWrmLrEtvUAMVYzLcsBA
	/n5ox27zHbr1/KnO/faJw1DwbViUadwqrQcNPzFLyj07RNMVyCvmUY20RwLBYAjncMpfWawgw=
X-Received: by 2002:a05:6102:6f08:b0:5ff:be25:8933 with SMTP id ada2fe7eead31-60378ff9e67mr1455587137.4.1774448574447;
        Wed, 25 Mar 2026 07:22:54 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-951be5afc43sm51454241.13.2026.03.25.07.22.53
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 07:22:53 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-951afc6741bso171107241.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 07:22:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWyDScTYF0cdIIYxLbs0LemaBoqeF2GcXEhQUykzndCaHcsZhl1D9wB3x2AsFVDi+rJOWMCu6nCqLnT1JRKmddDig==@vger.kernel.org
X-Received: by 2002:a05:6102:442a:b0:602:9a1b:ce47 with SMTP id
 ada2fe7eead31-60378ff9e88mr1928806137.5.1774448572910; Wed, 25 Mar 2026
 07:22:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313164008.40933-1-marek.vasut+renesas@mailbox.org> <20260313164008.40933-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260313164008.40933-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Mar 2026 15:22:41 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWLNk+WHsk=x0gcxPW9BwmVu0vvCsD2Qh9jwBx9KYP3Ww@mail.gmail.com>
X-Gm-Features: AQROBzCiHDWFWS4-xaGWn3qrV2TIjofyDBjJd04Uike4JhA4L7_5MYxpr4TAhvY
Message-ID: <CAMuHMdWLNk+WHsk=x0gcxPW9BwmVu0vvCsD2Qh9jwBx9KYP3Ww@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: renesas: Drop RTL8211E PHY C22 compatible string
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,bp.renesas.com,kernel.org,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-30252-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,glider.be:email,mailbox.org:email,mail.gmail.com:mid,linux-m68k.org:email]
X-Rspamd-Queue-Id: D0E26326C46
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 13 Mar 2026 at 17:40, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Realtek RTL8211E PHY schema indicates that compatible string
> "ethernet-phy-id001c.c915" must not be followed by any other
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

