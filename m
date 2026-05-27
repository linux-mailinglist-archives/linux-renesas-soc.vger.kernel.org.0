Return-Path: <linux-renesas-soc+bounces-33199-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGH7AjrCFmrOqgcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33199-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 12:06:50 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 721945E25E8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 12:06:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E56BA3109912
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 10:01:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ADA63BD657;
	Wed, 27 May 2026 10:01:04 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C856C3C2BA8
	for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 10:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779876064; cv=none; b=OHfW41rBydkBtQxp/OMdJvzZIu+pBJsA6Y97a/8a2sMvAzbJmw8IkUTuoytsEDdkAty68Gvfqt32wkHEzvEKgXf6aDqu5SYSuW0u5nMZ15yKWYYHehkDdU3305pOqSAjyDHGPrRr/hgUAyK8u6WJItIRW2e3pU/OxdhrZx2JRR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779876064; c=relaxed/simple;
	bh=l8H4k73O2pOjYutLyeYJycSAhLBBzMhi9Qswbw/Ph40=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T/LH4xXRuWc7IhmtqdUeYRxQg18y2zf/JglfXKJxHyXtUD4gsoVNXWpAZwyR8lYTNHFhfTj2vliIM654D1hw/9FiOLoQJsV5jKBp0mQIRRhLeoPUyHdZ3bX0NxQN6tLznYm/iXZaXzMq9+C6aniZvvRMNI2+Nzzca+hh5KmDGe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-960ae134040so2150960241.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 03:01:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779876062; x=1780480862;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9feKelBTkp+QS+4izy3Tl0/MY1ZR80J8OJvA2byIoJU=;
        b=ARNmdA3hDLXUJFAe9ihA6kiNBjWmWckOLfX0RwxVyrwLk8YJUErrW511z9wi+HHkYq
         kQso9F0uestskgQqEsZujghRbQRJL1CxDq97zfLA/G51peibQ+vg3BJfxP3TmC6GbPmU
         dAU60ZndpTwsKxLIBRegS0Sq0oZvntXMrB33ZLd1MSCoxlUTXHFtEdqgkvxEB1urPns3
         BynvULayglUFMAH1yBr01b1j0eA7h0X4j8Q+jOE6oOd98+vQwKHgbTXFfMMrRpD7v5uR
         UKbGcqM7EnLXy9ZNaTsrtVnccmXYwSRYUXEUEy9SOpadrXrAmWtrD5PuqSk32Q09PvWs
         wEuw==
X-Forwarded-Encrypted: i=1; AFNElJ/0HuV1LpIQ0aokvPI2t5fFVBeAwcPoEg1d5mnckDnJUQOsfWGDk7nHwF2Ug9K0XzM74Y+4w1O+bcc9q1a0Ukkmqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyjWs5iwGWRqpChRclrx08AemHb0mOlLai3Gyy2kzbaPC8FyDn
	j43mr0skSiz+mOQh4ZT/djGgoY7lKzu/kClFkhy9Bltoh1x1lOOHnjjMz9TW+Vfo1Sg=
X-Gm-Gg: Acq92OEIwNejbk+tI9VzWG7GHAdV46QEMUYg73HQh9lDAegthmQnFVmAgen3Dg4Ewua
	3Bn5fGRnpljGxbOY6YWGNOh+eu41PhoJZHjX+N4JMNeinlSqaQBkt63GNsWGdezy8rN0THF778G
	ltdHl9Gp4M7O7MNBKCdIvYUtsfS9zwtL8QUSWUyZ6vd5wa4TbgOqLNGN4p26K1l/b1DwUDXQMuF
	cJkOhpflbnGhPIFKOYvEGkZyfA0bFonuSI6tIp1e/JUl0Obl8v70DvtZFvYa2OZ9D6o2mRqMXYg
	9nWw3ZtbWb6BovTJdaKt0iN6Wcc2FlZai8DPAqkdXft7Xdf9xVi1DqQerTfJdChMxQ/tMh1BBTp
	zkguHpi2I5j9E0bur0CoRbgDSOL56E+d3rYHocKBewDkGxDGn/DVx4ARlvQJMyykMaXLb7LAZyF
	tZ3DqtbP/5I+f4uOIB7gRL5fWVFpbQn9xC0ODibnNn1inGqVYWkC3jkL4tEAdUEe7MZCWMAFbwG
	mTfX6maTQ==
X-Received: by 2002:a05:6102:1494:b0:636:c0c:4d91 with SMTP id ada2fe7eead31-67c829422b1mr11129356137.28.1779876061814;
        Wed, 27 May 2026 03:01:01 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-67ff5f07e05sm15796689137.10.2026.05.27.03.01.01
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 03:01:01 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-6314cc192a4so3522310137.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 03:01:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/3SQeGYVoHouSz8ljFyBBBiwXB5TGQZnNdjA1iLyxeDC/Skfqk1d63hryJgkj8DMwbpqDiXakCP407syjdmT906g==@vger.kernel.org
X-Received: by 2002:a05:6102:424a:b0:631:28c1:154c with SMTP id
 ada2fe7eead31-67c72e1e92bmr10995566137.9.1779876060754; Wed, 27 May 2026
 03:01:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260514210220.7616-1-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20260514210220.7616-1-fabrizio.castro.jz@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 12:00:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVmHEBS5QJdLu04JK5V4M-MqqUU-8t0Fdnfd=ePamen9g@mail.gmail.com>
X-Gm-Features: AVHnY4JkqSxhC5YyoKkd_ndz5pmy6SIDfrMDg3YX8RAadkBcYP0uacSHOyYNwBs
Message-ID: <CAMuHMdVmHEBS5QJdLu04JK5V4M-MqqUU-8t0Fdnfd=ePamen9g@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: rzt2h-n2h-evk: Configure
 eMMC/SDHI pins
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,bp.renesas.com];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-33199-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,renesas.com:email,mail.gmail.com:mid,glider.be:email]
X-Rspamd-Queue-Id: 721945E25E8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 14 May 2026 at 23:02, Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
> The HW user manual for the Renesas RZ/T2H and the RZ/N2H states
> that for SDR104, SDR50, and HS200 to work properly the eMMC/SDHI
> interface pins have to be configured as specified below:
> * SDn_CLK pin - drive strength: Ultra High, slew rate: Fast
> * Other SDn_* pins: drive strength: High, slew rate: Fast,
>   Schmitt trigger: disabled (not applicable to SDn_RST pins).
>
> HS DDR and DDR50 are currently not supported, and for every
> other bus mode the eMMC/SDHI interface pins should be configured
> as specified below:
> * SDn_CLK pin - drive strength: High, slew rate: Fast
> * Other SDn_* pins: drive strength: Middle, slew rate: Fast,
>   Schmitt trigger: disabled (not applicable to SDn_RST pins).
>
> Adjust the pin definitions accordingly.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> ---
> v1->v2:
> * Take into account the settings for lower speed modes

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

