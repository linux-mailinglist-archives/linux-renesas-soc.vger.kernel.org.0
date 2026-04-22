Return-Path: <linux-renesas-soc+bounces-31504-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WOptMTe76GkHPgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31504-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 14:12:39 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BF7445BEA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 14:12:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C442B300D4EE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 12:12:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCBA134DCE4;
	Wed, 22 Apr 2026 12:12:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BC13D1CB0
	for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Apr 2026 12:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776859952; cv=none; b=qtMccRsgbBkCZcZzyyfKMp+YS7RtRcjB8UxEinLOEtSRu9Di3wWW+O4A7L3P/wFAXVdLaxTnc4Q3R+3SnjTJn63CDFfae7bVb5RGH9NyeOuAfFXe2KkzvLgQCvheP82/8hAU++WFkeZTWgD1uAAsrFNAVRiCceXXyqmRP38vYfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776859952; c=relaxed/simple;
	bh=8PqFZBia2ZivjvvpkYELmP6SfKnY0ajZy53S2M9zNlM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X+N6C1z8UXwOA34IqewGdcbVsLxgcqhj9PjhKNH6NlUGnfNPJSzq9fLH2PUlicNg0DjpeLWNKEHgTb31zIayyv7vOJltyB5mKyNJLzMFUpETZ3Sdqkyk5OdY7GH2xHWs64obwkWvbWeNrgFoyVJPiavHgQD2SZ3PFC5QhZ7PlTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-56a86f0a23bso5300258e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Apr 2026 05:12:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776859950; x=1777464750;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MiyXdSSlACEmeBaCPp973Ky0zZSmXstCPqpCLLSPPJs=;
        b=M9E7UtoGhX+jJOMMK7PNCR5MQdeCL/6kmH27AUi8jgQslK8hPQkCnY3mthMOSQcHko
         ypROEhbSj1xgdQEIaTBm0QYLgj6H71WVXlNMPIQLbY1dqP/a+kJIhy24jKJbnD1sz/jw
         i2j5FvWYXsyV2wWGAOlAQUpRRLrMSeIl5QLs70ekbdi7H79xgzXQ6Kscychtqt5UqN4l
         40x1lyEGLRZmEiTo+VQb2dDonS7KLANP/Zn+We8DMHXilDtkFbON4SKhUeZ06ODuOFT4
         vbAbTvc+/MeZ3YgdrTWRmLc8gmLNf0oZOo9H3oxTPbopvP41xQI/Ah85ucB5eOy48gMY
         wHcA==
X-Forwarded-Encrypted: i=1; AFNElJ+bIykYEvEslcY5lBihJOIzynT/SkpP4yrR8nlEjJbFE2HvSLEf/5dx0riIub0UEw0W9ImgYwahCVY8tMet1am9hA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPOd9r/qItxoay4PzAQFgCoNhpZ8BllBV0hSurXUxOuDbsgLkh
	BuOvEUO+2p6IP2nwwadSb/obRXPMPnOqGOeSoDw/QxKsTEoDHNWH8rpqCL80jAQUfQk=
X-Gm-Gg: AeBDiesRZWP9CPi+glRAIZvkG0MCJI21eOk6ZWv8/QX75oKFnNP+pSSrAXEy/8DKCnB
	6ThMXz6uXDjv7Mh6z0dJ7ISod3opl7GqEWVNgszIs2wiAJDVuElbuuDhHHvX9Kg4ScL21a9Wqc5
	DrN8jngFiIn4IGRdGSERkRKqq78o12T+XSkvfE+D8LEuBLxm5/XLNb1/+R8Uq5oAwBQQvGltbhP
	9oQl16SsxqGNVf4KHEb27zkXtu6a7G29dwHabHQPL1P78qa/pOls7HS4AntQRYv2z//3BTYvP00
	uCwgxqFBBTbCLvApfcOfvUBbJa3vlGjeDK0q78wc0JAKO6xrMfN2vng6hyk4ERSK1+p04+ylAld
	KRGXx+ayAwcHjdAlVjkculntEAqepQZdHz0xEgS9vSTZ38a2ZVjrMJtBbeanLzd1HyIPIJb9Whx
	/8ERchQe4Wg9fMombkqXcXyAM4/98/gVuwNYwPO2c4AU07JC/jlgPDVgCwi8/uEweeA6JnCC8mC
	Wg=
X-Received: by 2002:a05:6122:1da2:b0:56c:860b:c34e with SMTP id 71dfb90a1353d-56fa58fe3fbmr10578706e0c.8.1776859950493;
        Wed, 22 Apr 2026 05:12:30 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56fa933a54dsm9460982e0c.16.2026.04.22.05.12.28
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 05:12:29 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-56db1b3626bso3498597e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Apr 2026 05:12:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+cryXCR8zppphrRUBt3C/hkBWPjnSf7h2Li3jqtIOdL2qhs1fSjVwBigurUdtSOq0VgduCiPO/3Dm44V7uz4dXYA==@vger.kernel.org
X-Received: by 2002:a05:6122:225:b0:56d:8bdb:fa50 with SMTP id
 71dfb90a1353d-56fa5a4281dmr11876524e0c.13.1776859948160; Wed, 22 Apr 2026
 05:12:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413182456.811543-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260413182456.811543-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260413182456.811543-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Apr 2026 14:12:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXwRCYrD509kvvE0ELi_SgDsk6=LAnWgmm0S98AeX0bZw@mail.gmail.com>
X-Gm-Features: AQROBzDDxJei3oI9Q6xisBco42VyXJLrw3MeYqs0ZnjxL9rp3R9BYj_6htdars4
Message-ID: <CAMuHMdXwRCYrD509kvvE0ELi_SgDsk6=LAnWgmm0S98AeX0bZw@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] pinctrl: renesas: rzg2l: Add NOD register cache
 for PM suspend/resume
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31504-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linux-m68k.org:email,glider.be:email,renesas.com:email]
X-Rspamd-Queue-Id: C3BF7445BEA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 13 Apr 2026 at 20:25, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Include the NOD (N-ch Open Drain) register in the PM suspend/resume
> register cache.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.2.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

