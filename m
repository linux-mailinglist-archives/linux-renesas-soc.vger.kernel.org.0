Return-Path: <linux-renesas-soc+bounces-32241-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sFXIBEeJ/GleRAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32241-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 14:44:55 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B054E85DC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 14:44:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 77A1030117B8
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2026 12:44:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BC9E3F0ABA;
	Thu,  7 May 2026 12:44:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9F03F1674
	for <linux-renesas-soc@vger.kernel.org>; Thu,  7 May 2026 12:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778157884; cv=none; b=HGxE2FsNq8/j8SPy+pXvOhUeVcBcO0FdwcAw+6bK84gOCUqxjpJydL8E1v7yAh9L5k8hPonoLJY7cIxQ38wcBOANuYgzvV5HnesaLi7XEof+vnBk6RJvxPDdHsDcdi06+FaLAm2GNJtEVC0USbWqDkRnZJOHUcl3RYgtb9dTNNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778157884; c=relaxed/simple;
	bh=NfMR3rhEtCN3uJYiSKMLF3eAYQkn2tLJ812E2/Ox7D0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QA3ENfXEeKXeyGiuGUZaDJ4weSzYOjMHft5ipDEqkySwAvpPV5WemjjoqXdN40YQZoV8BPFt/VSSzV9wuan4KhNmKU835PKzl9FssIMJMHCVGmf8H/W8QFoelC3dyJz1wfsTRYQB/xAwVG1YoiJkRYuQSEncagVNFq7M7ODfwKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6763cc8775cso3539222a12.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 May 2026 05:44:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778157878; x=1778762678;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5zcz5NYdu2U5q9v60tqEZEyD0RcfzK4GFJfE7CCh7d8=;
        b=JUu0mPEft1c/5Kp1kkYdvwqF9RJgLU24CXY1n+ZMuVpqjT1ncF1F+gWpk9fLcUoTjN
         esF8i/IzzIGAaMpcfekxQwcl/RVv3Foo/bsloBqR7GU/eH/guollK6QYN7m9i0096KhR
         QDNx/q1G1usLk/c5M6FY7Yj03H54mfJPcMwxwrTCY6m53kQXV+xWCcReZnAr+eu6ZD6K
         fobRvc3mLpOUGQdGgdu12T36kABnxZ19EqX7OL5rdoP/kNJc9PyKMK2HVSy2zXUOviPY
         xHrcG7AMgNdH0UKXCDRzP8FAUaz2HW+rNhKd2Fkdel6qIkr0sIxmXXp4BY3RHFnXbd7A
         wkVA==
X-Forwarded-Encrypted: i=1; AFNElJ+UgRqq3HqR1gWFEa7kRkiSnCMG33KIvavKQnSUGA3RQ8KbJjFKY3tuMp7vHcLmf9++9TKfoIaSdMqr2IqFdlKhHw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4XLb/M62jVNwIqAP/3Q4syDwhIHsVeJ3TsWk9aptHIihlsBbz
	M+G0f8baTOcIEeGD8OBq36kSltIB8A/5Ai+bZCyUspumI2k2zaUUcu9sdE1QLkmx6vA=
X-Gm-Gg: AeBDiessNFHu0w5vtxyp1OVvi7aWS/7L7WPx1GIm39m10QnfatpkLkmcAmnLc7ToGh7
	jXVhWpTgt0+IC6LCk/kMkJ9RGpKYULK4dN6bMx369B0vJ2yI8N/4Gg3fGO8aq7SEK9CzNiQnHMY
	YtJNFtXiYQTrUtPnHk3o90DKl8vJIrT2YNbkkEugqmzHZ3AoaLHX2rK2n1281oRVn4wmX66HH2w
	8ZB+q0o1v5Htv4p6AQ2wQP4J9Jb2SZ7GP9qrsgcI9+ICCBBLazStk6GorSLTr7Rh9QRiFIHTL2e
	/OzsVmBfSnwChI0NaA4CY0YSOx6wPLFS1o+ZTfozabjPhe2xoUsKccKwRDDTwwGo+Uo8nII39t2
	+2G5DmefGOVFS3t7pPdyNp7xn24cgzBFF1j425HIanTUMU638XzkHlfS8Z5BqLq1DO9bZujlhGN
	ClHINZNy4p0s5BxL5uiVYz4zIxLRV0MtUh9EjByH1Jk2Eg07PsmGPUJQ04KvraZVEtrR9KydA=
X-Received: by 2002:a17:907:5ca:b0:bc1:8598:f329 with SMTP id a640c23a62f3a-bc85cdacc19mr145881066b.21.1778157878072;
        Thu, 07 May 2026 05:44:38 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc83364e33bsm79760866b.31.2026.05.07.05.44.35
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 05:44:36 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-67b6a6bd7b8so1662672a12.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 May 2026 05:44:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8djQb6RvxomQUeTe/38kU3A+LoHssTzwM9BobZYcBVNTZU2XZuhca5hNoiu/ffTbngCY6ue2KMLQqpIeuMW4Mukw==@vger.kernel.org
X-Received: by 2002:a05:6402:304c:b0:67c:8616:1c50 with SMTP id
 4fb4d7f45d1cf-67e0c16e596mr1058130a12.0.1778157875510; Thu, 07 May 2026
 05:44:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505071544.8965-1-biju.das.jz@bp.renesas.com> <20260505071544.8965-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260505071544.8965-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 May 2026 14:44:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVr5f7pJ2Gt=8MYLjBQOZY-NFMk8B=80rTBN8Kyt3hKKg@mail.gmail.com>
X-Gm-Features: AVHnY4J-2OuzoqD4_3FpLKNrIUM3DpkBMp4f8oVrrrOTAv9q1kuKmlmlcyCaNms
Message-ID: <CAMuHMdVr5f7pJ2Gt=8MYLjBQOZY-NFMk8B=80rTBN8Kyt3hKKg@mail.gmail.com>
Subject: Re: [PATCH 2/3] clk: renesas: r9a08g046: Add SSIF-2 clock and reset entries
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Brian Masney <bmasney@redhat.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 77B054E85DC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-32241-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.988];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Tue, 5 May 2026 at 09:15, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add SSIF-2 clock and reset entries in CPG driver.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

