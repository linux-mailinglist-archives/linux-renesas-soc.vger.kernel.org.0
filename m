Return-Path: <linux-renesas-soc+bounces-33010-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCfnIWFdEGqDWgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33010-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 15:42:57 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF6B5B55F6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 15:42:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 87CAE303B24F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 13:33:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D32B3CA4BF;
	Fri, 22 May 2026 13:33:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463453C2784
	for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 13:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456834; cv=none; b=HaR7hjHyUNOQ4vPWmHeSwFjjop348p/8JytJHhbrBlNMhWjIvj+mQoLzDyhEWbBuEfPXNRxxj2JcN08yQ8ObMMI9qPZAWi0Sqn+nS6TGVQnN4B2rrvM8RYqmxWvfMJhVHoIowMWkw3fdrnVIiSQJMLwJuylGEY471sp3zKQd7OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456834; c=relaxed/simple;
	bh=oCVQeqNkgLC+A8DsyABQmEoKPm1VZ97E3MIdW+uHGTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DMk6rcdRtCrBSC6wXH4CRzNH0hEMYHggTrJDmHV+u0C2NQxS2kcCNNkjwDF0W3PcXGbf7addprrTWbLZy2XzR4YJZ36WP90hXpg2t9EINL6nCCl+jxu/INm65yueJkCQiPc5oCKf83PKCir/KNC72AYqGzTZLqwYRMFwiEuL5JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-961780b0b98so372299241.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 06:33:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456832; x=1780061632;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zq0bJbefph0AAGvXGgXMgxADCBjnqDWg/GTQ4ba21xY=;
        b=TCvYfDW+n4gHpVR2HxC6GIha90gLjZ+jJxLFKvzpNTw9koPGsTJQtPVXrQVJeGyatO
         8yqqvaZD/pDCjpFWdl7fQ4qsKIP7hm3z2Y++jjraz78+W09x2/oiE9CojFToQZoCPut5
         HTljMPJfdmee3W74JYtgE5SAMhpdeT12adcokqyPC7TlRotZj9CIiUWeVuy3L+PBNp+V
         HKC4lPD5g4mw3b84Xo29D3WC6yqbQkKNqbZbCUqfMhXe1CXhev47fWA5ah6qnZvofjfb
         dvEGsLWup8f6HPvJWrlDJb/rCMPwGZpD6Gul3igrh+/d1nVzO0Mw3N+kIvVltZTzXUS9
         sKqA==
X-Forwarded-Encrypted: i=1; AFNElJ+PIKX1jt2IgoUKSbZUBb+k97+ZAj/H7yTkEIkFs+jm7ZCJxbi8ex9DaicmdqmIzcDPFXH7gvdz958zCWpV7/XkLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yye7KPXcC7vbIJGFNC554/SgK7EOKtHL+UVXAM0l2if9W9KTuvg
	MW/3g+wZ9nywYpniLoHu58ynTtQEhTipq11GNOYOKlOywcQ+KFGDsFNkvHwzsSw9ipU=
X-Gm-Gg: Acq92OFtrs1nzo6HmZCVcQJZkJf5EXvcZJlmNKvjqdE1//acWjewypQ6TVjOXWjUR+e
	Ug0Z7cQU3cWBnJyTzBkzLqBjtLEUEixhLeSpZfgFtSGZ3UmYEujMvVaZAfT9NXbzQAGls55VVp1
	ugxWJp/cv/GMCnZGMnq6kAc1Be9QJOe0nIqjPV4cStTl5VGLcI8JSu2vLwpcFE6Aj9WSz/3X9k4
	t6TQW+oM+kIxYWkyDuqzIb3WJsKCfPt2rv4RRQC8Fvth10ysI16sBzBcoq16N/0DUvL8/Ba+Sc1
	iuzd0kIj0MYjSa8/pw5RXczdMFCeFqqYRxG3897m+1yCYUgqIPO7LPYwbD8AofKLzjDTbUiA8Wt
	PfplXf50I07eY3rq2mCo6wNPIXFAPNbmSsRwH0HYbDs1RJDjGQXErF8kUDnB5dUTJWUNqkpMRx2
	PC7g3EYI4TkolXp/vudIcwZt0WQ9VYASu5icRQVDbwpVWSkgIxKZEOZUAREEJhj7v2S8iSKFB9V
	zM=
X-Received: by 2002:a05:6102:334f:b0:631:4c79:b1d2 with SMTP id ada2fe7eead31-67c8d07192cmr1780224137.25.1779456832217;
        Fri, 22 May 2026 06:33:52 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-67fda9014bfsm1254952137.5.2026.05.22.06.33.51
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:33:51 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-57516e08474so5669688e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 06:33:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8TycbpXXI9pAD5pvX+pVFZDORdJyeZfheodbvbu1tal2cxohUtjsuRG3wBH79HUpmlnkkcQWA2QMZ1eT4B/YyjkQ==@vger.kernel.org
X-Received: by 2002:a05:6122:3d0e:b0:575:22f2:a1f with SMTP id
 71dfb90a1353d-5865f726da6mr2054383e0c.4.1779456831104; Fri, 22 May 2026
 06:33:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504225704.115125-1-marek.vasut+renesas@mailbox.org> <20260504225704.115125-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504225704.115125-4-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:33:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVeGsp+g2mGu7EQo6cN1v6-ectETVU+PtWUpznHboS-TQ@mail.gmail.com>
X-Gm-Features: AVHnY4KJmR-uF4CxL9myINVO4InRW9Xy-V6WIFG-Jxn6EItYI51QzaUkbyalZ7o
Message-ID: <CAMuHMdVeGsp+g2mGu7EQo6cN1v6-ectETVU+PtWUpznHboS-TQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] arm64: dts: renesas: salvator-common: Rename
 clk-multiplier to clock-controller
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-33010-lists,linux-renesas-soc=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 3CF6B5B55F6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 5 May 2026 at 00:57, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Use standard clock-controller node name for the CS2000-CP.
> No functional change.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

