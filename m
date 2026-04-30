Return-Path: <linux-renesas-soc+bounces-31790-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNM5HVUw82m0yAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31790-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 12:35:01 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 143C04A0E4E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 12:35:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 69E07300380E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 10:35:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED3DD38F227;
	Thu, 30 Apr 2026 10:34:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C8E36403C
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Apr 2026 10:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777545297; cv=none; b=iz+b1SO2ihIA1qMfMlykMqdKip6WBf6/MBIiq2GQ+VtI88GVQTzdnwuLFJA7YMVdffw36hNmRxmb8T3abXdl70nIYQbA7TaCnIgkrhgsMpYWgmMmfNvzaDYO4DWfKPZtKxq1yC2m39hFtfNhMrgBJfFdlK/lvJQVvY5FUhLnQY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777545297; c=relaxed/simple;
	bh=/ACkrqPLwkb6Dq1TnX55QJ5vxrxsdjMvN8alGvzN+7k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KE59y4p07HRoU/ANUVsOX945zI5ToXUnzqqRpinPNPIdZYd3SU6xdP5XikGqAc0fLxUeETuH2z8JfzGEIJftEIvji2ZqoJLiSL1TfEKcIoHhcDJU4DLv1EDynutx4nhtaVanV90GTXnSeP76WN4Jeb/4o7NLk3dr6MJYFHfht+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-95cd9bc6398so87000241.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Apr 2026 03:34:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777545295; x=1778150095;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8V+koq3Lkj3wDoBaklA0Xj48HW7uARBNgY6EDlMDXlI=;
        b=QruRFGC5vXjJHsXVaOPqCE1S8vZN/Sb2pixWfv67y0gAvAEB1pGWYJY1xaLc55EbRX
         ItVZKDaVhdSblmq976g6lXqAyJmOxqiD4qniKA8jSFTt72nRMWVGejDuTC/tfuU/36Ee
         5l2YXcURjnSnEksmlDdAcagCfVK2ItVytM9gqbGEsAg3QxQPaA8bdomfj8vD0koih59t
         LvfF03USmCkhz4ASy6gqXaCRqqiD4r8wiMf0PiKf191X8MMycmKyI4T+lVAnoYHYVRs4
         aQQ6XW67UszXi3Rn+eB9t3wNvX9Iomy/HTIs72Lzbhm0epODHfEtIqRk57r8jL2KYMrj
         gNpg==
X-Forwarded-Encrypted: i=1; AFNElJ9agt7pD6IvMCsus9x8NGKlkg5V+74uLw1ABO+7Mw2WNStIc7SJatg9CiUvG/aW5xYRfnXIw9q9gdXXas1tDg/eKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlcuNJeM8rdCQ9qqZwY06Ye5pGtESY9V5Hd2whttsoowDEwWks
	6CpW3Q223jtxhKimAD9ndu7ZPZ4fGaARCHMJYmiObkyITqpLxUibxwbfB0tWBbPsKPg=
X-Gm-Gg: AeBDies6vkkFMla5RBSETTFnMtAJbT7cxmKN38EFil1NzqjBGf45ZYUetKdav75Th+K
	cnhOn+iH2fSf/88ts144E0goLTJgBsgZQjhadUjOlf/lDAIl25dNbFxd6eFuMcEJNznqWYovaf5
	9aKO3mMbS3rBcpv1X1CiFi4Fxw4GWgmgJpnI6udNRitp2WO+RbxPmnp3biBlOYBrQi0u/IyWMX8
	chlsDjz7QsYFjPmWr4ZDYD8AzquYJQCQnJ+IVrKyOrIHAEoKkF5R9xyfJDSscwyofxvgD9R6Qdq
	cY1SRy7sdn1DQ+vflqLpfWLEaV1RNF1RkKbqawCHyl70ZERKE7eGhDoNRaYdeWBsAvpJGlD0Azz
	mGb4m0C95Oq+jzr1hJuImc8SszqhwJwQnQjpOnpi5N33goJFq9nVBqCPKwENE4k5OX54l6O3liA
	eFLiz7pFwTpG9RgdkGWd2PfdA8ILjA4EHV6UhyO5+JvjPPBQPjuWCcpNmGQN2+PxegUBhAoYk=
X-Received: by 2002:a05:6102:e09:b0:611:3bcb:aef6 with SMTP id ada2fe7eead31-62acedca4f2mr922276137.0.1777545295219;
        Thu, 30 Apr 2026 03:34:55 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-629843365e9sm2620388137.7.2026.04.30.03.34.54
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 03:34:54 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-95cd8b71105so120428241.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Apr 2026 03:34:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8+KRQYTuTO/mbtKQi9o/xAqmerc+pF/jl8Owp2iTyJrB3WnK2zuUaXmDkxMxKn13Tuk8nP53MffVVS0mjHJo4Jig==@vger.kernel.org
X-Received: by 2002:a05:6102:8007:b0:605:42a8:940f with SMTP id
 ada2fe7eead31-62ad52baa51mr975391137.31.1777545294613; Thu, 30 Apr 2026
 03:34:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1775205358.git.geert+renesas@glider.be> <fe257b3b7b7b5c17fd0e5727bb9746c731bd7e3c.1775205358.git.geert+renesas@glider.be>
 <20260430-heretic-mandrill-of-symmetry-1c9a5e@sudeepholla>
In-Reply-To: <20260430-heretic-mandrill-of-symmetry-1c9a5e@sudeepholla>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Apr 2026 12:34:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWaF8buTuuMOPZLyEVF0vqPPdQxYP7LYJSj+vhdPJFc0w@mail.gmail.com>
X-Gm-Features: AVHnY4L33oPAm_CAAO0Uaw-sYvBE0zPN2_ObN8TXsWUvlHnMnI4J9wpUyxDMPnk
Message-ID: <CAMuHMdWaF8buTuuMOPZLyEVF0vqPPdQxYP7LYJSj+vhdPJFc0w@mail.gmail.com>
Subject: Re: [PATCH 1/3] firmware: arm_scmi: quirk: Improve quirk range parsing
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, Marek Vasut <marek.vasut@mailbox.org>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 143C04A0E4E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31790-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.977];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

Hi Sudeep,

On Thu, 30 Apr 2026 at 12:17, Sudeep Holla <sudeep.holla@kernel.org> wrote:
> On Fri, Apr 03, 2026 at 10:41:29AM +0200, Geert Uytterhoeven wrote:
> > When a range contains only an end ("-X"), the number string is parsed
> > twice, as both "sep == first" and "sep != last" are true.  Fix this by
> > dropping the superfluous number parsing for "sep == first".
> >
> > This does have a harmless functional impact for the unbounded range:
> > "-" is now accepted, while it was rejected before.
>
> Supporting "-" is good but I think the ret is uninitialised in that case
> as sep, first and last are all equal. If you agree, I can patch up by
> initialising ret to 0. Let me know if I am missing any other case where
> it is not good to have ret initialised to 0.

My bad, ret should indeed be preinitialized to zero.
Thanks for fixing!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

