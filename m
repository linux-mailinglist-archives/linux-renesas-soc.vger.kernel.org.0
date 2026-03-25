Return-Path: <linux-renesas-soc+bounces-30254-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QIMTAZDxw2lZvAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30254-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 15:30:40 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B829326C9A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 15:30:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B00D13038F7A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 14:24:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50CD43DFC9A;
	Wed, 25 Mar 2026 14:24:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FFB3B8D4F
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 14:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774448650; cv=none; b=lclqWAPXNSOieXp0X/joG6pNtPj69Z6shGbijAroV67JF+CaK2eOj+6IqU2esfIW7uSCLsme3q6eKK+WbQvEuMQWpsTbNdctgrWjRcgOjKextkm+XHo2nJLQJor796lzUaZr/qFh+i5q4kQuXS696YD3w8DMzBb2AslWCmWgaD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774448650; c=relaxed/simple;
	bh=rNqNBC0tV1vIvoQTGjAS+aB4LTfalkbiJ7TIivz6JhM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z8jEF7KCxRMddBuoObm2NRc9PEjnI9W8vEz6e6C5cqXkt/Jp0Nn8YVbr0mK2uRFc563rfAxZ4IPLp62Q0HxYwGyD+qPcxzeXnuw97IiFvrKFO0AxQiHL0hdNq/x7gpr4DY3cjAXKJ9JhN8K/xVZv9/oHPXJ9bjAvNbRoogUDa50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-56cd71a7630so2193042e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 07:24:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774448648; x=1775053448;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tcbIQYAOh9cDG6sNZOxVKtvVxUHP1WsG0mtWehRBwvI=;
        b=Rx8siEvhjZXoG/WMwdTQ4Xf5265qi6i056maYKxuiK4SE5s3iJDWnLz/AFiuUJ3rgS
         B9qRs9wBQmc+oXbPWBizxZZWAlJjxjeH+pwDaH0HpyVDpZKr4DBYXR4FILJx070mZqGf
         OdwKYkBCMRhnoecY5P53gXuMDI/wO8VE05GlwbnLPtBLC3hm5QgIe9E/B3adny2IaUg2
         Yae8m1WNIojfvT7TrUZYu3KU/7yjmhY6XmugPImix2mSu4bbhJW0ZaOMlBqQDYfB0Y95
         W7MOTrda4X5tVdZAjiGxMdJKckn1Yzw0K+i/mpADfYK2r9eZvHVCAOA6d4eY6azVRYtS
         zD6w==
X-Forwarded-Encrypted: i=1; AJvYcCVLmtUj6O7kXFYR2Lrxe+mQG5SweQ2uH2+XcXX31md+wldSqxgL1S4vOV4l3m8uW+CZq/NJhM0Gsl2BW2TbOVmeOg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3c6PIfF5rRc/R4DQMBA50vFR5AjgofdyS04Yi+c5ZKuZQr8Nz
	WIS40ddqKHT0Fm5EChGobD2omKwYK/TMI8Oq2OBljYdGUjKxjrTsgoiLMsTWNYQMG5Q=
X-Gm-Gg: ATEYQzzbaJrk7wEMCoP+eWOa2sZhEp/h53Q0JOCDnLZnZtTTTHNbpRWlSwf/EcFKyAw
	ocey8iTj1ok/NM2YixLhyZI1J8nuQJIqJDfgm6NRCIKqXIxCBErBgr/m0Hjg1VZr9QAhpByfBgH
	CBI8XSO3JB9Ry3h7mupqouS+8chrHDjEnYv82Ns49oFZMLq2+VJoiFWpWdTLKXVzl6uyoHd8/BL
	9AKeLoafX+a4IujvXqCFQNHDNK9NqiNkywkMSCY3wGS4fIhVTj9F1rQChA1IAekSJhTwPGwc3vB
	y7KY6GnwQUV6fP3/UQvSMqtQ1DVkc3w0FnfNa7LRdNR5exL96g/72mt3njmGwA7TbArRIJJyJA8
	xU6dBZZt+vGDx+G2xIHv54wUBcoiF0nQn7MPBUwTbNvxRziEcRQKX2v0eL8y9AVNzy2osEuUVYe
	rJnVYMi6QBozFdWcd0LdR/m+Umtxv0rHN91Wc46ardZUb223dQAitwG9z/T0Om
X-Received: by 2002:a05:6122:6c15:b0:56b:a673:27bb with SMTP id 71dfb90a1353d-56d21f6b25dmr1661419e0c.8.1774448647966;
        Wed, 25 Mar 2026 07:24:07 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56cddc7f750sm21446331e0c.11.2026.03.25.07.24.06
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 07:24:07 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-950b77942deso1780317241.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 07:24:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUbpcJvlKot5tICwLlhoAy2LZXj0JsQ5zbR8MJtLBIF5nH4CvSTHwiw+gyiyc55zU/97UGTFlrfLTGLZRjwNtsS7A==@vger.kernel.org
X-Received: by 2002:a05:6102:5694:b0:5ff:cee8:6620 with SMTP id
 ada2fe7eead31-603870ce0dfmr1803350137.11.1774448646696; Wed, 25 Mar 2026
 07:24:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313164008.40933-1-marek.vasut+renesas@mailbox.org> <20260313164008.40933-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260313164008.40933-4-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Mar 2026 15:23:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXfRS7GNfjap74h5rUx1v4btr87vWyMRON2-5FMUVwMzw@mail.gmail.com>
X-Gm-Features: AQROBzBQrP8z2Gc4Hd7jXaA3HaJVzjYUVvRTvP9CWmOYpIcArfN0qWHYtAQ_lAg
Message-ID: <CAMuHMdXfRS7GNfjap74h5rUx1v4btr87vWyMRON2-5FMUVwMzw@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: renesas: Drop KSZ9131 PHY C22 compatible string
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,bp.renesas.com,kernel.org,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-30254-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,linux-m68k.org:email,glider.be:email,mailbox.org:email]
X-Rspamd-Queue-Id: 9B829326C9A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 13 Mar 2026 at 17:40, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Microchip KSZ9131 PHY schema indicates that compatible string
> "ethernet-phy-id0022.1640" must not be followed by any other
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

