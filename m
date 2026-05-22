Return-Path: <linux-renesas-soc+bounces-32995-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMKIGQxbEGqDWgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32995-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 15:33:00 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 085025B5346
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 15:32:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 62275307DD74
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 13:23:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D980F3A8730;
	Fri, 22 May 2026 13:21:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581393A1D07
	for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 13:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456081; cv=none; b=hPWOXSgHVbBYesG+h60Hsd8vbU9C36g6a4Gf3UaGKCdn10iBq52vHWbfmuFaLKUwKn/lty5DGhApJf80qvwz6OKbzD5ZXmqxfr+J04vrcgVUsx8trZBsdi/vcse8sQMr9o5SGkdUtHyTMX9FZ5UbhprtW0ZpFcBSNHs9i5DTVlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456081; c=relaxed/simple;
	bh=0PK4bMqXimU9iNRWNX/eX952I3s/oyh75Caj0sz7gdk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dzwFcswufe9Mzsd5pwkLGWSlpg3hB3DtTGudVBEuwAX/ZE4MSTkpZ8MZtqKW9RYbOy7/YOUUkPW4OtcK+zE2xMgG1KXIhh0WyZIpGR18EoMp533zx2WwQfc3x5uy6bO57WWQT/kR3TZaxe83aVGPBrnRbSSwldUaRY1Picl46X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-67c2d57a5ceso11586662a12.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 06:21:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456079; x=1780060879;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b8+hN45m6EcBjSVmc7/E001s4aXOZE0CXpfrpaEBAfw=;
        b=cSxsUYTIo5hPjEXm8bEil3qSk7dj8BsFr/tqxKYg75LmsFYt56DUklszURHO2fk56H
         svfzTAVPE/N4DCn+AT8sNeMDAYdaKS+283SPz4CTKBQGsZxKvIdyFFQa7hMWxXSYokUu
         KuGBRBrObMQ82Sn7a9fRXOvNdgsCuGwRzuJtPhAgDRi+dOqZVdQkcWtKfTs9sgeHFIBn
         oPtDkfFBRZhRhXpyqvULg67nu4vb0kfd5TKJtERf5DooqFtD4ywCu4eba0CrQc8NjAVI
         etQUPxDiRbp7CxxNPrjC2sKZ5sQxwyLl8y5GOZVYJA3Zg13pz8NygrueBXR1kpaAwTdu
         6pbg==
X-Forwarded-Encrypted: i=1; AFNElJ/lGX7ZDCDPzTkPUHWKQeov17mf1/WoQyERLXaUMEBhVFUeVCsZc0GVOjzPZlVS26C7X5bUQFQMjg+nv3s2B1nIMg==@vger.kernel.org
X-Gm-Message-State: AOJu0YybR4P/IzUPVfDcPisijZJg5odnmqoYJq0HfbriybNhRO+33aBi
	6lgI91ZhvLUgYyY6L5TH0IT015PLbmnsGNfcPyNYX4zvMav1jUMt6ydnToHb4rJcRb0=
X-Gm-Gg: Acq92OGpvaggfVPyYTZEolf7RcPm+hogJ4GdIMGR22BPzjDBHrMQyAvDvzPcWZFcmZp
	Mn31ejyy4x9xo4G8Yw6MQgFfG7nk2M2021Tr8guwBHfYxx7kaMUSQ/yB0qZlqRzhgbXIG36JJb/
	wq/EJAFJS0bBo0XF3gVOSqVCKhVs/8Eaaut93Sh8hOmT3ZL1dNcWVZjW0Qxlkt1qFuP1j0OHKty
	odebGs/Q7YMxVEVLgO9NfxxtfN3l9WWwiX2bHHtJ2MssJjIRegC0K8jRwjyhz7leHZlt5obpHJu
	NtbpRs+t62vPolf4jOW9qd3M7YX4YEmdXnvkJjsZpl6gkgO9bRSSnvTIrgMcfOIJwdrWJ0AuXX0
	ac4BvXIsCGqsJxdkyNMIlNqS2Q4U99BxGhtFVEOvvGurvrwWdOT+oVvnkdnawbqbG1gjbUkoUc1
	HzksQtsksXpehbh5LWqpnc1h0Us6ZCfr3rVCL7XfojLH5vM9hOudlFYnLGcmSy
X-Received: by 2002:a17:906:8455:b0:bd3:5c80:46bc with SMTP id a640c23a62f3a-bdd262d11c0mr150558066b.36.1779456078493;
        Fri, 22 May 2026 06:21:18 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc264e419sm54170766b.12.2026.05.22.06.21.16
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:21:17 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-67b6da5a618so11786758a12.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 06:21:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8WpKw2U7Ak0UlzRUmrvByXXxY7qZ3YyvJgcR5GsQ5zQv4g/4wqOBU/PRKY6GV7VRq5jL2c325eROGYvTxd4aGVHg==@vger.kernel.org
X-Received: by 2002:a05:6402:11d3:b0:66e:56a2:b67b with SMTP id
 4fb4d7f45d1cf-6889cc44111mr1956174a12.20.1779456076494; Fri, 22 May 2026
 06:21:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org> <20260505034325.167797-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260505034325.167797-4-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:21:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVu22aJCHqrnAv=jk4=71Uz4YsJoAYWMOogANSKvSv=eA@mail.gmail.com>
X-Gm-Features: AVHnY4Lff0GBvrpmknTfKgnni8ny_chPw6wlBCXf2gW_qkc9A8w4cPoubzyZE64
Message-ID: <CAMuHMdVu22aJCHqrnAv=jk4=71Uz4YsJoAYWMOogANSKvSv=eA@mail.gmail.com>
Subject: Re: [PATCH 03/11] arm64: dts: renesas: eagle: Specify ethernet PHY
 reset timings
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
	TAGGED_FROM(0.00)[bounces-32995-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 085025B5346
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

