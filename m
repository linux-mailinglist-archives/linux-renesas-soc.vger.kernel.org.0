Return-Path: <linux-renesas-soc+bounces-31503-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGgMO+q76GkHPgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31503-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 14:15:38 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 51277445C6B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 14:15:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 292B93041486
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 12:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 155563D1CAA;
	Wed, 22 Apr 2026 12:12:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3243D170B
	for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Apr 2026 12:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776859944; cv=none; b=qTcL1O/2t2fSvvc/UrcnNg7g1IbraoeC0OLRkuGhF98UTAhssAJ7R5+d7FV3XJrHwOS5HTuBU1BH/sE+zOl0e8LqCUPNtgdwD/eO93AXKSXL/uI1BCVrH0qK6Rj+1PYjgBTfse+4oGSgoep0qrjM8brCWqw/PPSbAt/8O5hA6eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776859944; c=relaxed/simple;
	bh=y7nK94MKwadyPsFq4rD1/+x38bFty730UgyeZ1vY/is=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iLIWineJYlK8MwDv/zCsjZeqPK+EcckGF0VzVjCS2+rr19anzRbW00wxmwzr7wdrWUBcexEhAv3MwbDzNvlGhElgsXYrs0GQ4zwhFBhKm/xNdHLfqByoythRq5bFWdQC52UOQBGGXOs6z8oEfrG9I1+f3CfdVMm7Yu9uSHAAvxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-95673f7b5baso1136003241.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Apr 2026 05:12:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776859942; x=1777464742;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lz785d68ZXoyG99dEwRjJ5z22aX2tdId1z5IMlTUmbY=;
        b=VJZ0S1omz3lwn/cY02juJfQffEk55qjGNOYlLcjArfh6lTQWGieecziSH2Rp57wqYK
         ppV9etK0S5SHY46oT7Tvgb2B2c6KRax84KhU4A7aBSIwRxe/0YpwqsGYOQXuSLDGgHiA
         GZ8L6NKkoX5yQ/b6y3ksCpeOFCmtg3OswBQx6LfVfqtKBGEi3lJ55OUil2H9xQbpQ4Es
         5oYJ2Ebzyi4ioorjDuKzOsuCmPHga5qNIVAvs758EhZe26J4HISTr0VFT83v4R9fHWag
         8AcH+d8AyV8Mg38ucdopoDgVnbxydhLsQ4HPOa012sTxEeDLPg/R1a3V/fCQ9nQ5cSbe
         yFQA==
X-Forwarded-Encrypted: i=1; AFNElJ/5Z+Vk3QxcusALag2oFKdGCgjGZC96ZR47KqM3czCU3/VrH4p8y7j4sShgwWaoe5hceF329u/RZv6wqbsJRIxDmw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHyKIOOjMwM69s7FIXhcohW4V4oOeW+X3hKfsSfL5i7AbXuK/q
	7kk1GmII60tMIWdmaL0o9lPL31e6t7ipMIh7MYlxx8Lf6njaMK+J+w9SnUAtnDgWplk=
X-Gm-Gg: AeBDiesN69WLnGMxZQLBmFVcHrqN3PRpqMv6EePQIEUC/RAZlfSMBS6I/sWiWOnH86H
	X58b85Fy5zaU3teVIsvZHBgSZeULsI1ol1KF2O6WGEWHfAkXE9h4sSR4Jc9T+FThu5vzSk6rCT9
	GwV+uYsaLnt3Il/8ZNlKy0WnOZlzqN1/hA4XsfS9dXdbQ9X4nyRQSLBMaevIjwFW/bz6D+i77fg
	uajv6R8LAZSatpC+ru0hGwZ1qIzZdj683qGgbxbNsR4j7l8K6CTU9HlKZ5r1kKR2GI0QcDpqrNq
	OQ3ADu0xeEA+4A/r6NXV2mIR21NZ3MJTHd3RPr48cG1Y6gW6vYr1dSrxIbh6vJ7R6claHeU8huN
	k4tSd5DTGkgcMTwjpdwTQl4FlMva6UtxSdbSFnOVXygJvLLARD58Cz8VEEygaUr1kKqaXxn5oh0
	+AJg5KcYO3Ac24YAGy04IClcJprv5vikJ4+vMtUU1P1zzFOvx43aCTUO6jxmhbIqq+GGviNWOOh
	PI8DvMrP44d2Q==
X-Received: by 2002:a05:6102:148f:b0:607:4fde:1921 with SMTP id ada2fe7eead31-616f74fbf9amr9503183137.24.1776859941831;
        Wed, 22 Apr 2026 05:12:21 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-617482b199csm7863213137.11.2026.04.22.05.12.19
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 05:12:19 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56a9076813bso2174770e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Apr 2026 05:12:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+H5cnNC5xgEI0Wr/xIoiN2Bigsgn6ZYH6TJLTTIPiOWK+Gzsvm6JxcBFNI/YFoLicFCWhK60JZJDhFBa80LW2xRA==@vger.kernel.org
X-Received: by 2002:a05:6122:2981:b0:56c:d623:896e with SMTP id
 71dfb90a1353d-56fa59fea24mr9997610e0c.14.1776859938717; Wed, 22 Apr 2026
 05:12:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413182456.811543-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260413182456.811543-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260413182456.811543-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Apr 2026 14:12:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVxRmQ55ZbZSyTBqmjMw2j53sSQPf7MfXs58C8aC7v44g@mail.gmail.com>
X-Gm-Features: AQROBzCfRT7N4FieEnS-vjpMR2JGC2u2T2Z27uwPtWW_UDbm329VNcxnEY6Y8uY
Message-ID: <CAMuHMdVxRmQ55ZbZSyTBqmjMw2j53sSQPf7MfXs58C8aC7v44g@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] pinctrl: renesas: rzg2l: Add SR register cache for
 PM suspend/resume
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31503-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,linux-m68k.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,glider.be:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 51277445C6B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 13 Apr 2026 at 20:25, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Include the SR (Slew Rate) register in the PM suspend/resume register
> cache.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> - Added dedicated cache for SR registers.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.2.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

