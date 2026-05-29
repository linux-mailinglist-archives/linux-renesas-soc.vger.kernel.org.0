Return-Path: <linux-renesas-soc+bounces-33337-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AM+LLCVqGWrGwQgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33337-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 12:27:49 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 144E9600CD0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 12:27:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 81E6F310277A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 10:25:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E575351C0D;
	Fri, 29 May 2026 10:25:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3C33C455B
	for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 10:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780050316; cv=none; b=TF451Pq20VIBm8efh0oqaaX0MI/dOO1WXbTqA1qMnml6aCLwFQvkctCR9KPzR2ScvUKWa2ReG/2cZgJ2E3QJYsikPLVz/nwrdvuiTZ4NRUoZwu8emX1wp9O2LtpxCJwLTDkxVbRMMfxXtvHjdUi4d35iDucQY1N0MMuPygAmWJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780050316; c=relaxed/simple;
	bh=8gSmBNSDT+HnK2uGYP23vyXqndtNWP44MPPrOSdU4wI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P6h5NwqVwjWLEd1UK+zMOWOWfqNwT+j6J774mYw0aP5pFXWonryvXvuPYoa1DoUDVwuhopvJLmDDN/uTgLSMgZ5XUbCYqqFLgBkrIUtMNwK95yC3Pfd//2U6DfagDar9r1Wi0WNr/YwZ51hN3WMJKgoWJ/Ktqcp4SABKPk5Kydg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-9639fa0636bso482215241.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 03:25:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780050314; x=1780655114;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J0EZxtk5WIR/qcU6NNuzZqxIRnzjtF+VNY4Zkt79Yu4=;
        b=mSUXWe1LYd/JFZKK8kG7J8rEE691jx/hy4KsaOZ9AjmQ7jKTh25Rx9D6jolYpr91RI
         bhdexpKkoIBDAHjCgKwzc0tQtTYWmGk4LOATa9QqyDNZSUg0KwdO9OFIJ9gGCvtDrDIH
         jmpF6l5vsWL+QaDW/hgpRoJtXv5LQE9fMDSkcje5kRSeu3NAO/LYwC4/6Djq+njy8Hrg
         q1EwA3CFUv5jcUh0oZgkwqT1ljQC++YTbgkAwSwIbsYbS322PsVq1sC3H2twNPv/MpwT
         8AhbJN0028cwaLinn90dBgJDTVo4X3fckL6fTH5bs2GlhTfNnLrzS80K/psJUJNUSpVN
         M/mQ==
X-Forwarded-Encrypted: i=1; AFNElJ9mdsfDeK4SzhgkfKTr8MaSxWXqcxHaEXOfzBZMhIKaQJGgQ9hIYH5Nd2BPsHXXqhRw5HqvzKH6DZUULFnWCMIEYw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEcN904alDgkWLHJNqekTgkJCaqMBGs0S4KVQQXYOjpBpd9XnP
	/BzNW6VZi/+8g2KrzWVICXnyj/4kag3xZwsybG0z58ifcJ5JA8JWUjcqdV5fntbzmFo=
X-Gm-Gg: Acq92OF42+dPR8MkG+iiZy6SDh8fuHXOTJ+uP/eF5T7j33lQj18qlJ5M7x0b+PqgvOm
	JNDeBHe94UKNpzs2/Pw7x1ScgFGFpnyLsYEaw2b7P1L7pUzFJrKufKTiEw3nXpnis/5VNAfLtIE
	3A90RbaLquNp1aJcC30EuNogJbomxdZ8VdOttqPywOQKkQaopIGcq/FMUvrWLZllxjFRBlWAzEF
	ZLdCyxMKZ9OA30CWsbrnqJltfc7LaLHf2e9lVIqu5o9J+sCdjAJj1JREIOJt572bo5IrIMpWgdA
	+8CUEKVKGvfPL+ufoGzSQ6abhCF250Cr1ms8Ov2LeyHYekkkjruM/f0yhVVShS7kW6NwsDeytCp
	giue5np5oVISgsc6391zMBT6v0+g7GYP4gMs/BUKSvof5ryDxiBAgUfRyp39l4n4m5XyQYxLwrZ
	kFFAibDSGcFJSIfNMtUOHMoF4rGsDHEtZ4e7+Cq1ibOOfmnAVDmD38X/khpBkL/76YRJeuz94=
X-Received: by 2002:a67:f4d0:0:b0:631:31cc:e3ef with SMTP id ada2fe7eead31-6bedd57c3damr526151137.17.1780050314315;
        Fri, 29 May 2026 03:25:14 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-963aba241ecsm578627241.2.2026.05.29.03.25.10
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 03:25:11 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-6c3a36fa9edso43389137.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 03:25:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9Cz9ixqfqWUpo8GEn/tbdZ4kPPy4pMTE6l/XccEhxs3wMUN7AJptQzGiMZdKsS5RXDl6zWhAbizBdoHg4k3M0r7g==@vger.kernel.org
X-Received: by 2002:a67:ef05:0:b0:631:4ad7:b367 with SMTP id
 ada2fe7eead31-6bedf90a3e4mr558585137.20.1780050310734; Fri, 29 May 2026
 03:25:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260519111958.233194-1-biju.das.jz@bp.renesas.com> <20260519111958.233194-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260519111958.233194-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 29 May 2026 12:24:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVdk8Wi2oJMycw1fOrRTbqYffOWfAu+EqyyKKjFK9sghA@mail.gmail.com>
X-Gm-Features: AVHnY4KWXtuGqVum5tZmrAlM9wycIRJrdgJpoHPQPKh-iVVLq2Z9RIduSEcQABU
Message-ID: <CAMuHMdVdk8Wi2oJMycw1fOrRTbqYffOWfAu+EqyyKKjFK9sghA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r9a08g046l48-smarc: Enable RSPI2
To: Biju <biju.das.au@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[glider.be,gmail.com,kernel.org,bp.renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-33337-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.982];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,renesas.com:email,mail.gmail.com:mid,glider.be:email]
X-Rspamd-Queue-Id: 144E9600CD0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 19 May 2026 at 13:20, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Enable RSPI2 on the RZ/G3L SMARC EVK board by adding pin control
> configuration and activating the rspi2 node.
>
> The RSPI2 pins are shared with the DPI display interface and the
> two cannot be used simultaneously and it is controlled by a switch
> SW_DPI_EN.
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

