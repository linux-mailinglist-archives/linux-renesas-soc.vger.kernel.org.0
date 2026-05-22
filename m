Return-Path: <linux-renesas-soc+bounces-33003-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id dlJ4BtRfEGpAWwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33003-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 15:53:24 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B520E5B5916
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 15:53:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0665030E0E3D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 13:26:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE48C3B27E1;
	Fri, 22 May 2026 13:24:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A76A3A3836
	for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 13:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456298; cv=none; b=qedVZ06shugTuGSANmRrjf/5sBn+aD2SQ4C5nks/9Kvg5P1d/OCvt5HR7MVgIbTQ7eDjTPSzHUiWrH5maUbKSs82vY4KBCNM7fPULf4EehjReqqjZgM/7ynA36sT/LNiRkLFACQrpBaaJSw5A+MV++hApz2c4yMuNiLCIoDsEcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456298; c=relaxed/simple;
	bh=0XefSVQAASZ7I3v90P4q6gXEnxt34c2YTAPuNKCjEcs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sp5Umqx2TURXIBJstP9NNfX7nC593FpTLg/cPkP+r+3Yzs0unKmfJ5ME9b+k4m1g2T/fLr3Ls5C31CmCqDUvsxYsx/QDN+6TNotrozvT4W/BRuAPYcEWKCPiuCnDwcYQGerUkH6GMPl3pQqIv4EVkXrQuhuNz9qsmOrOBAOhnFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-67cd93d8affso9242752a12.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 06:24:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456296; x=1780061096;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JZI1PMoMgSNQ27UlN6QAasFy8RXu1wi4ErH78n3sc3I=;
        b=aLVZQXUwaqbNBNoeV0qhKy9es/9U/QOFKz7oWVLnZDlCZFRi3WLHnkzF0I+Ej3S9BY
         Xt+RsOAcrml5VFhduPhqpdHJhq3xfKgjfAESooewqfoiJ6b2u/z4yWteca8Wm/aaDoXd
         HHQrZpukLSMBuC4xSn1zu1KhCBks+KXV3rQg4vThWvx63gGpHGll54hVSi116RH4tVpO
         fkhiJ11s7KtHNvxs0pQewzxk5QTXfZYcAylqbAkZBsD9o3GFpm2g/kejoz7eSpob3/cu
         einrBk2nNUh6PdP3tPpe3HmS3LxBbAWHYjkBepAZGmSVNNDhGPwsfPsrWvlPOsTDipjg
         SKMQ==
X-Forwarded-Encrypted: i=1; AFNElJ8mA6pxtYiXz7p9+tUCHinLj6ObsVEaSTAT7eByzL0GrZXEzFpsl5vwZxlhroxMjOxxDlESx39sge3Cq5EPI4jFzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkA1H6W+jDoLsU4VN+aJgUiI1fRY6r4CjTvoEZr9Mze3/H01Ih
	yxRm5TpIbuAfDcd6lr4FdJ1ZX2RwoXY4KeoQmskMtCC+WB4Q6Le8OMYAAm1Gp8+jyMk=
X-Gm-Gg: Acq92OEL2HXv1nYmgUKdKs6K9joHykeuaHrg51eNUhnpdDV0MlvjMkdSMgN4rEhrNc3
	20MaFv2DBacbW0/Ln2AkkDoMk3AvRD927oKDNg05GGNRiz1UB43X2tK5YRnlCeeMmjDTrKB3NgJ
	wP8tJBINKhGHhdmDMPVaHqXpsNFM902hLWVykDsRjc7QUvSyo95hmLt5cnBv/PH2cZDxxhkGjjw
	utYyHzoP/d73Oc+GJPIf5Q0UgTHFFJuDHQnLuFyRqr0beDUshVJdDWkyax6bcZnc7e+3G0Whow6
	3ysG/QJTUd3VNRwYiao42TDkrge9bLT8MFtAlrnM0ASj+rWm1K5clAuvNNV0SJgcZ+E9BJw2b+z
	Xg/Zz8w/TcrTiuYYBcY8w9hZxdamYrcOg1MayHdgR/J51F7EUVuPdaDAbM88nsuROub6wuJULgh
	GlTNj+VfTxZ1mGDnh55BO2qWHc0XMf5iFMDs0sNUhjvs2JOGEWJrTIMRU4Ih3x
X-Received: by 2002:a17:906:f049:b0:bdc:8c6b:4842 with SMTP id a640c23a62f3a-bdd25cecf04mr205782766b.30.1779456295559;
        Fri, 22 May 2026 06:24:55 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688b9f6084fsm696358a12.11.2026.05.22.06.24.54
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:24:55 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-67e9e343b22so10489814a12.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 06:24:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/MD7GAh0+e8iSrhxJOhJyzzl6MA5a4MFCUzx6Dql21DwM9QrBdoL5uW5MQtQmoypbyk9grQFzVuVcgyN4KAvnrSg==@vger.kernel.org
X-Received: by 2002:a05:6402:4348:b0:681:2472:414b with SMTP id
 4fb4d7f45d1cf-6889c41ecf2mr1807151a12.3.1779456294545; Fri, 22 May 2026
 06:24:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org> <20260505034325.167797-12-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260505034325.167797-12-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:24:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV3xOe5GWDuqJ5qVKP17+46FwrwLEf5KkmxatY-mdip2w@mail.gmail.com>
X-Gm-Features: AVHnY4K0hyBTxidEUz0Cs6vOI6UOPodIYHl-4j9DmEyg4MCcdO1vyiwsRekMv5E
Message-ID: <CAMuHMdV3xOe5GWDuqJ5qVKP17+46FwrwLEf5KkmxatY-mdip2w@mail.gmail.com>
Subject: Re: [PATCH 11/11] arm64: dts: renesas: gray-hawk: Specify ethernet
 PHY reset timings
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
	TAGGED_FROM(0.00)[bounces-33003-lists,linux-renesas-soc=lfdr.de];
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
X-Rspamd-Queue-Id: B520E5B5916
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 5 May 2026 at 05:44, Marek Vasut
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

No regression on my Gray Hawk Single, so
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

