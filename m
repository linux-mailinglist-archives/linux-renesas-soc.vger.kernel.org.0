Return-Path: <linux-renesas-soc+bounces-32999-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +K2fDxlcEGqDWgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32999-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 15:37:29 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0075D5B548E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 15:37:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5C87B302D2F4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 13:24:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BE323B2FF5;
	Fri, 22 May 2026 13:23:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C078C3A6F18
	for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 13:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456182; cv=none; b=l2LVyY/z8diFHeiyhThyq7ZSPUh4DyhVINnCsUy/dsf/NhRR7bmFB6IxF+trhHEq/agodkcieJve+UneNUz5AC56tsNFG8DCxZZrtePTY/Iu3hJA2rSJPLPWBDAe+6kTRTki07ANyxHSaJntuiIkv/8O0ia17Dvsbj1n0dbpIHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456182; c=relaxed/simple;
	bh=mVHTrnWtVvV1ZVlQ0926x6oW50LBgMWny3UmFgKFRVM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LUGAkUb83/7uBiFrK7QHzmt3U7HmtWP8qeC4c+kVr7xlP85R99XwD1wF2C/eP16M0dyXVunUwQJ+IB1VEIIgQp9sZJEZ+Nb0/h367b+oMaHnqkg5juMjkmkPJV/J7QCscVSAMUSAfv+wkhuKydSmZ8VqD/QXcktYPqXfSctfv70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6870f904c6bso5821013a12.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 06:23:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456179; x=1780060979;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gBu5hzdEZCJNEEaSkylnsZS37JzN/qLiW1wsYZsF+yY=;
        b=VT7D4ljbJX00XCOvZWjlhw5h86JTpU2BcOs21Akx4A89NWDle0MCSlo1OqkXz50xvg
         GyM2UJFnmrElLP9tqaJ6477cEsoj9eUPkshuI6vPqpXwGw2O4OIkN4k6WZfMNDV4ozUB
         ZSgHlxVRWpcCNVjxMLBzCjctfgLg6l9rjq8XoJHf0VtIbMdRDrmrW1JR5KqAxOqRFMUw
         25S8dffJfKLWVFs1NE5D8oZ8u+zLQAv8fPmeu0sVSkwDWf7aXSoREXNoHs82mqsiknNu
         tcMpSkSMHMsaEw4RqDIulNKGDDGRAefPw6prZFs+FQQC4Tm16Hdw827fGx1Lx8Sqo094
         OgjQ==
X-Forwarded-Encrypted: i=1; AFNElJ9DEHr0ZN6KDwOffJEqIdeononJW9fXRMsJw4MNRzeBsvUhNPrK2vNEhNxsrqUMgZ/dPtfqk0AfIDAmFkQif0fqKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXg/WYym55EZoVcIHKWVA8Ido81+25Ajp4BwgCA8SGhDzHWJTN
	lya27CQxrsNrE1fpLmhR4qtGgbMuOK/x24dh6b2RK4LAjqxEuP4n3gEjVHXjHUL4tfQ=
X-Gm-Gg: Acq92OFtjePCaPHN9ynhJw1UWKMRnMsmecvdKSso0RtXoTsra7CMrGBUxgo106WfyKk
	NKjvoTJ4hnCIQ0+DjJNzJQR2OrX89EGeFFWwKwaa/7obLmcyIIeeNGcYEGFgmF4GwEmYxmdb6XK
	zcmOLh/TNicadbkCJnERGs7+kOA5kBtDtgMgNa2vl27pnd0uRtOIvroQS7jZPwZaC9kJv1VN9Qc
	jNds63+EH3mMIHnDt7v/dUPVnyW7mgNbZB0YxKqhKkkrJ4gVuA58/U/oziTA2tK4AvvGp84IMJY
	MPXZZo83xyfxb4/SpD/FespX+Ce0GP/XBhUMs7EojAYx5m5JLXy46ygNzJIn/HZ6vsOhdw1O51X
	EIyetevTdvIuCsJbidiHKVZYZjTBbTW7ZeidAtcjIgRRZ9rnhorsZkUs57nicStS9eOYP0Edgjy
	xJVV7SJg6+G5O8RYrc3nVbzA2SSaqFg6CYdtjxbB8itetMadSV9qLQ4WfELxkZ
X-Received: by 2002:a05:6402:3594:b0:671:dffb:f450 with SMTP id 4fb4d7f45d1cf-6889c44a99cmr1915525a12.11.1779456178999;
        Fri, 22 May 2026 06:22:58 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688b9b6d287sm684036a12.6.2026.05.22.06.22.57
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:22:57 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6886be3d39bso2334204a12.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 06:22:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+uf1qyxlZwWd4V+dNbTaXsehu/cYhUVicXVNyIwwETCGWow4jT6byqAgfG/SMeCe2mzE0Y1WqF7QvmmPqfjczkow==@vger.kernel.org
X-Received: by 2002:a05:6402:34cf:b0:672:f3e:1475 with SMTP id
 4fb4d7f45d1cf-6889cc3247amr2056924a12.12.1779456177135; Fri, 22 May 2026
 06:22:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org> <20260505034325.167797-8-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260505034325.167797-8-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:22:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUtQokLyFM3JOx2G1L4R9xd=nGki97-YOaai5K=FJjxiA@mail.gmail.com>
X-Gm-Features: AVHnY4KnysQXcgL1Uqam7oLPpsSLc3PwQrnRQv3msLbCEYBNfu2R-YDzbK6u2wo
Message-ID: <CAMuHMdUtQokLyFM3JOx2G1L4R9xd=nGki97-YOaai5K=FJjxiA@mail.gmail.com>
Subject: Re: [PATCH 07/11] arm64: dts: renesas: ebisu: Specify ethernet PHY
 reset timings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-32999-lists,linux-renesas-soc=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 0075D5B548E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 5 May 2026 at 05:43, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The KSZ9031RNX reference manual [1] DS00002096H page 60 FIGURE 7-7:
> POWER-UP/POWER-DOWN/RESET TIMING Note 2 states, that after the
> de-assertion of reset, wait a minimum of 100 us before starting
> programming on the MIIM (MDC/MDIO) interface. Set DT property
> reset-deassert-us to three times that, 300 us, to provide ample
> time between reset deassertion and MDIO access.
>
> The KSZ9031RNX reference manual [1] DS00002096H page 60 TABLE 7-7:
> POWER-UP/POWER-DOWN/RESET TIMING PARAMETERS row tSR Stable supply
> voltages to de-assertion of reset is at minimum 10 ms. Set DT
> property reset-assert-us to 10ms because the KSZ9031RNX RM does
> not explicitly spell out how long the reset has to be asserted,
> but this at least covers the worst case scenario.
>
> [1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/KSZ9031MNX-Data-Sheet-DS00002096.pdf
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

No regression on Ebisu-4D, so
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Modulo the document references:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

