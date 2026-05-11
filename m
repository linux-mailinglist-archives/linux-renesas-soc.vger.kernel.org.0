Return-Path: <linux-renesas-soc+bounces-32381-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AIj1BCnaAWrPlQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32381-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 15:31:21 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5476B50EF74
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 15:31:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E4FE23058092
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 13:24:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4138C3A1A2F;
	Mon, 11 May 2026 13:24:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE053BB9F8
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 13:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778505874; cv=none; b=ogWa9kES0I+q/zdKXxJj8K5YXhNaFaVMEnB/qR7xauJIv45fd2mIukwUFh6ozwC58b+qczoEYCzWQRzlI2ZBlv+x/6HKx+XPiVUYpMPzWWu2gfXLPOTZQhb3FbMbJN1SmGicbhqHtz5aXoi9g5UHiFZoKzKj7BRrCaA6Cy/xma8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778505874; c=relaxed/simple;
	bh=YfKRsoMpcmlRfc2xnButWGYPrfkohycR20/XxXRIfqE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BNkPtarGUufn2E33puUXdR+gj+GEEvgYzTr4YIDv6ZD8ytqk8n7YFN9TnP0SE+hcBr6VV+Z7QOuJnTCrewIdY2ZNw0wCc/J6lkALsgx1d1UoHHOUAISNgZVR6Qcz0phIcMoAsE93djqvB0KiH8Epg5H5BMb/+6OshcKpMqOkrp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-6314a0eefb1so762436137.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 06:24:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778505872; x=1779110672;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=law7pV0kaAFlrOEy6awjJWyzbjCOdnKqodHrGvaGQIk=;
        b=NxfG2b5KexWj0aZUYkVkzxYwWHA7zhTtUHkTauy7ZVAaBQvx8vIsP15xLTDhFqJp/N
         jd3FWowSxWontFQcO2wCMUkb1Y1kvK4qGazRyH5cYAOwpIgHkr1mwfuR4GcQjadzr0pF
         pVq8oFCxNTQnFNcgZO5SqEn69AxP2INS0fU94JXmOFExtDZRSJoGCnJdYhp+bRYaCV4J
         QhmX3RCDdCujhVD58C2FyQ28A8LGcGzMqDJnyOpKvorDR+VikqAJh6sVhHmk5TY7SHO2
         JM9WBwb7nDAspTOTICwF0jFN4dXwLovpiiFRNVgIx71RbeOQy7+4Z8W+ZeIAQCWjlCur
         Zy/A==
X-Forwarded-Encrypted: i=1; AFNElJ+isThPfVaOsRB0RN36L8bZ/7QTRK+SHrX5TdkEMUW0lqUCCPjsSDWbJwsNns2P/USN8ubDKq7ee1W+E2XUsOt0BA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGqd5WWCl87PaHCb5P+JJNwrYGrM3XwutQSf2btIM2NAQQDy7i
	LpZ5SQgtjHavZIoMoYW3tq5vI/koYmhPrWFU/UWibqnOcHlVbCBjJlRqAne++vaA
X-Gm-Gg: Acq92OE7hj85w8fz8Sn+QXkf4b9NwaOdrgGWuMKYlNI0SfgpdACLyrPWf/ioxGDfXjp
	r336KB1DjOeSMai4WYiUDbdzbb1Kg5MU0B+DDVI5LUEMVJWR9jHKLXICOee7dOlAuzyEuVnGgAf
	qCVjNBaGyOSdNpkBkk7ijp7CnUE3Hb10jJD11HACyy6HOHTkMQ898cxY2uZ9SQE/DFzzPxuksyp
	CcQ/1hOOJtcBsXitiEHWcpA8lIBx3hcKJAn5hL3Ahs+l/FFNgAdxXyiTzwToT6qcGtQ+HekiLaz
	YT5PQ1IRRDZ2UjEw8fJdwf7pJ4sWhSVnzuyyGiuebhgtuEWKHwqF0NX/DEZrHHQFnAU4RURPJVb
	SKNrd5pOdhpSThdosRbP7UeagDrAODFTII1yL0MAIZ3IvbbOho5L3BcAbccbqrPGBJaEEp49wTi
	sKlJHAz2GEs4azz2JlXXZzPw63NGHYKq60DtlZqevniP6eoaOV3U9NSMXxtBjAfqc7Lt4Akbdbd
	R4=
X-Received: by 2002:a05:6102:4499:b0:632:3bb5:95f1 with SMTP id ada2fe7eead31-6323bb5cd8cmr2684918137.27.1778505871650;
        Mon, 11 May 2026 06:24:31 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95f21b50247sm5332423241.9.2026.05.11.06.24.30
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 06:24:30 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5752b279662so1284795e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 May 2026 06:24:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8htGXlHAogM12aGmEo6aBzOR/CJqbvzH0JTAZlhq/DmaXDhybSB+K3j1jtwymGE3F+LWqfNSpagcho/k5L89e2Ng==@vger.kernel.org
X-Received: by 2002:a05:6122:a07:b0:56e:f071:d4ef with SMTP id
 71dfb90a1353d-575595be49amr10895995e0c.8.1778505870316; Mon, 11 May 2026
 06:24:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251027211249.95826-1-marek.vasut+renesas@mailbox.org> <CAMuHMdVwXjE0Bq1KjENkN4m2h0_nN0F2S=CC8mW3B92NdpN2_g@mail.gmail.com>
In-Reply-To: <CAMuHMdVwXjE0Bq1KjENkN4m2h0_nN0F2S=CC8mW3B92NdpN2_g@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 May 2026 15:24:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVmpxtMno3Tt5LbiUHH1etGD2aq0c2rjde1kcs5e4Acsw@mail.gmail.com>
X-Gm-Features: AVHnY4KM_QK8CB2bNfMDHhNxtA1NDb0fdW8Zso7UqyzZiddKho5PeDYIcKub3kQ
Message-ID: <CAMuHMdVmpxtMno3Tt5LbiUHH1etGD2aq0c2rjde1kcs5e4Acsw@mail.gmail.com>
Subject: Re: [PATCH 1/5] arm64: dts: renesas: r8a77960-ulcb: Enable GPU support
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 5476B50EF74
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-32381-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mailbox.org:email]
X-Rspamd-Action: no action

On Wed, 29 Oct 2025 at 15:51, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Mon, 27 Oct 2025 at 22:13, Marek Vasut
> <marek.vasut+renesas@mailbox.org> wrote:
> > Enable GPU on M3ULCB with R-Car M3-W.
> >
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Now the crash in case of missing firmware is fixed by commit
26735dfdd8930d9e ("pmdomain: core: Fix detach procedure for virtual
devices in genpd") in v7.1-rc3, I will queue this and the other patches
in this anonymous series in renesas-devel for v7.2,

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

