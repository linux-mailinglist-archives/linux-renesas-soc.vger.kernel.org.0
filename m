Return-Path: <linux-renesas-soc+bounces-32998-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QG5fKVtfEGobWwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32998-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 15:51:23 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2245B5885
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 15:51:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0EEFC31797A6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 13:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4DA53AD518;
	Fri, 22 May 2026 13:22:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194A43A7828
	for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 13:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456152; cv=none; b=LHrRAFuQKBEoa+YrI4UpLpEMh3+qntnqQ5/pNVjAW4CR7brIjBdfQOB7yiaAlyZA17SkUH/9Cf1qsKB/6+v/ojJ3Ttkq3a9VqP1oCoB2MmumSv3/a2kS/J+CmSYEkIcJaZ5qbV3L9LHfC4oFPKj5K5Hzx5q1rjKjGw0taUSwY4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456152; c=relaxed/simple;
	bh=0PK4bMqXimU9iNRWNX/eX952I3s/oyh75Caj0sz7gdk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BbB13ezAXF9gjSZheYuVsJ0CphjOQftG/++1RX1R1um1cLnAAx8VkadkDwP4Pm5l5UFgF7jx/8MeEvdC0yMexvQ1Ng5TSMjCUSvme2DXntZRTQAgS6Z6ewrnKHXYrikbbZz1M2DyqLUPO6tci+oDlGpwG27WFJPeMgUxBYZc3rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-bd4f8260e4eso1375861966b.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 06:22:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456149; x=1780060949;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b8+hN45m6EcBjSVmc7/E001s4aXOZE0CXpfrpaEBAfw=;
        b=UPzngcx6izCN5aYwEyjcyzddNz5XKQ+a7LF932yNETIvRb4m/z/yFFyXPRjqawDbZw
         bdv+VVc5mtjNYj5hWB1dyBP38VoG4LTwQiJOGQR7VEytUKtSms90HvX5XPe5qFx8qGL3
         xxZuozkf+wi4uaDwQ39lv9P7DfdMZHdsMaVtEf2LHmje4hH2px41DTTcd5Esd9eUm5kM
         k1/XaSOW1gZaVZD4KqyJCmTNf1giJL7LGapcAp+b/FBNaaLIx5UwIwApol0qpRLuGkpK
         Wvbj3oTVVnv8W9oT/NiWfbmrBIjE2pRWwc27pZxJycgcxdVhjxS7HaI3hp133jdSPR8R
         gG5g==
X-Forwarded-Encrypted: i=1; AFNElJ+++Fgddb4dtYtjNT9wlN6zyaFKl81ue8DRSUgOhLXJBJvPg8dQNywQpY9R8h5U16KHAmNNAsSmTHEdRtWayzLpzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0vaRiqhfcQsoU+up+oUlxAc/a9bfl11AwsVQ3X2eEt+B0fxFO
	9jgML7naLxeuGYff84yS4jNYKPWdSIkBuWAJXAiwJembu2OQGInQSf3P5W2w1iJq6q8=
X-Gm-Gg: Acq92OHz+CmHpSugGJFej60jcMzyX6UPQLqB4snQCiEh2FXucnmXLNCAppFPIXakWVS
	1Yo8ZQjIzQHMmJdbx26N8tO8h+ZUfCH+9w4l45O324TxZtaI20nhn+9Xo7S5A/8R/c/z0jgE2pU
	42oj1fmCv9sOcMAlJksK4DrS2b7K9Ufrq9c/X4KIDLwl5hVhKKJXsvYssOTItSqyK1Xgm+7nJhF
	XiKI2bWFZdU12WX3AKSwlpsCxhw8PlD16k0qG3SZcNtGEOKVkZL+r/6RvyWneNLhvLz4H45kpJU
	QrfvxMpeErCN4IDmtemdBlqsXDSf2wf49M2BXfUrYRcqQlXWxsnHHtL8JqHEzt7dNSjvkgF0Wsq
	vG0vJULRjhXnmM2cpkIu6luZ/r3uV0flH63OLPwPpf5RcsLIK2BpFO7YeADn89xUDAxZwNovbgw
	0RfeD2BjX+2S9MsNDTTSgHVf4HfEOjtVr0khLFHhMT5cqyO3oWK+bRxDBr7kE8
X-Received: by 2002:a17:907:e98c:b0:bdb:3dbd:4953 with SMTP id a640c23a62f3a-bdd22a3db89mr251958366b.10.1779456149397;
        Fri, 22 May 2026 06:22:29 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc3051337sm56397366b.19.2026.05.22.06.22.29
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:22:29 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-67be41d5eeeso11741481a12.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 06:22:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+IpExdxR/uHdVPldH1BYoN1gIxn0YVXYFVTvmrrrNSpe9fUVnHrDCLq3P3/bDoxc3auxqHgb7GJpy9xhLEOKeOOg==@vger.kernel.org
X-Received: by 2002:a05:6402:11d3:b0:679:223c:d191 with SMTP id
 4fb4d7f45d1cf-6889cc37577mr2016938a12.13.1779456148995; Fri, 22 May 2026
 06:22:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org> <20260505034325.167797-7-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260505034325.167797-7-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:22:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUxyCZTP7xL_LM-Cv9-Sck1xzqZOHZ=N5kDX9hPudG3+A@mail.gmail.com>
X-Gm-Features: AVHnY4K2SM3Go6ojXmLuCDRf56eRUek3q7fWhfqLX5InhJaDiWPYyWgu3SlfzNg
Message-ID: <CAMuHMdUxyCZTP7xL_LM-Cv9-Sck1xzqZOHZ=N5kDX9hPudG3+A@mail.gmail.com>
Subject: Re: [PATCH 06/11] arm64: dts: renesas: v3hsk: Specify ethernet PHY
 reset timings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-32998-lists,linux-renesas-soc=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 3D2245B5885
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

