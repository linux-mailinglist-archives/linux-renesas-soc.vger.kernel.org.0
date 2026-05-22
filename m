Return-Path: <linux-renesas-soc+bounces-33000-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDPXNhpcEGqDWgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33000-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 15:37:30 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C71A65B5495
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 15:37:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 571F0302A644
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 13:25:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6D4C3A63F7;
	Fri, 22 May 2026 13:23:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BFB3A543E
	for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 13:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456205; cv=none; b=hG1Vh5mitqoPk5pmCnzhkuglVBfjxO7QHAkDYd23oOydrzDOhj2k4Mjdok5X37aVMQ3Jz6WbGwqP/g2RtN1pkwoG8sPAQH6AfgUQBEMQsgqjjos61UxliX8ItXpm+daJ+68jfKEmjnNzO3ptknbsWzepze9QvTbaCgM7ZBGowr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456205; c=relaxed/simple;
	bh=0PK4bMqXimU9iNRWNX/eX952I3s/oyh75Caj0sz7gdk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lCNY261kwYI/9LlzwzZWCp0yn5yrcBABtxRw1gl0liOIwLrA2ziOupT/V8fc99lzUIAMbSGyLNQTOqB+iWmt7tdcW4gdkubA3cff6HEmrSpCKXoWHniYC+TrhZIVjSVg/Re/wSzTjWJDz4XV8DsvnaayWSI08pHZuzjanYD3Uzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-bcd3c190f71so1209183366b.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 06:23:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456202; x=1780061002;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b8+hN45m6EcBjSVmc7/E001s4aXOZE0CXpfrpaEBAfw=;
        b=DDo6x3hia7bMDK+8jrk2kqSP+jYnmVw6+wVH81ICjnwkC0vG/tG3BUKuO8VD2qcTDP
         bRnKBMOHX8riVILzwyYvHdCnLgqGE1w+zOys0ipuej3jz74kY5pMxVR3z8rgKjRz4JXp
         BBk5D5qFqsDfwrUDBhg92iHybWmy8zjX26sD+VL2QbbGhP2vywuLgcW5T00TLoNZIuWb
         r0y9fB9o4lRbfw1zlH8wA9JJ9GjPIWOJIl6VPVavm4RpNf7A+hFI7BSKwOJa6HC5elTy
         zgA+Ro321iiO0VIcuTsHWF6W3mjT/iV6Lk/5wxahRtGqrhWBSgQ4E5tt5+QYdgx+zc90
         F/kA==
X-Forwarded-Encrypted: i=1; AFNElJ/DU9nN5ldGWZg3rJvdE6x5Ldgr5Mgn4Br6KuCqtswHJWA+U9AE23IPeWY0Xy0yAXZDhOs9blZFfUHI1aTE1ArXAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbq09IWMkUUVc2BFLSwVNfS+GQhgPFXbvORGsLe6mJRddqQweK
	ZD+QGh1CKzEGGkc4ZldnwlhKACFLWuthJvbu91cj0zETqE9BigB8K3l4WVSsp9Xrxww=
X-Gm-Gg: Acq92OGAIyHmAlAUVtt1uJgkzkyJMCmPE4962xdm28aaH93WF0EothQtJXj6JlHG/bn
	xtS96UGaPSqVxtvUmcCOzd/yE+BzgXFnDL8piUECIUr2R4/L5x5pObDBK4PUhTfS6ybBSxECAuO
	ogrQLPG4el6IcNqZclGzd4kfTEmlh1oK+7pMCkWKhUOSRUQByJzV4wG9R4nG2Mta1ID1lYvYZP5
	E0ld8xJJrMd3x82uCPoY/jfhaa8A+mS6mm3yPqSzqHtBg//E0IMg/FHuMkjjKW7Ocapx1rULFdu
	9FvvuARpgoM2XBuaCcBJ9xQScnb9Gnz8TmRCH9R8KKO39s6zRss/7GOy8JSZtUWBhn0/t2b+KSI
	T5wasoEtesUajl7k3arfK3JpQrJySr+lBP7hWeMFwF/MTmkN72pzhrRGqtKf1ZRWLeKn2biwWBD
	0npFOPDVypO+f9myO4D+W3Fk3qdaRa90h3jIWWBVmZQ/6osaw20jE1V2rKBLCh
X-Received: by 2002:a17:907:c298:b0:bd5:17f9:e987 with SMTP id a640c23a62f3a-bdd278d0214mr244082066b.46.1779456202347;
        Fri, 22 May 2026 06:23:22 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc264d98asm55038166b.9.2026.05.22.06.23.21
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:23:22 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-687e7edaafeso227329a12.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 06:23:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/hBxXCS8hMiUUkhxy2GJH7n1CK/PErtDfFGT62yYteyJeItiVKUqpYKabqupYN/hqur1+h1cf9KTpWaIEDgE0M1g==@vger.kernel.org
X-Received: by 2002:a05:6402:380d:b0:687:afc:23be with SMTP id
 4fb4d7f45d1cf-6889c43e8d1mr1763806a12.6.1779456201755; Fri, 22 May 2026
 06:23:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org> <20260505034325.167797-9-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260505034325.167797-9-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:23:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW8vraGEzDa867W585P438Q-Ad6pV9jTCNG+t08kzqXqQ@mail.gmail.com>
X-Gm-Features: AVHnY4Ihk2THxP9D36ru28lIf4LHCgnk9MqLoJMcextr1G3iaJ6rvpPRhCHiZPg
Message-ID: <CAMuHMdW8vraGEzDa867W585P438Q-Ad6pV9jTCNG+t08kzqXqQ@mail.gmail.com>
Subject: Re: [PATCH 08/11] arm64: dts: renesas: draak: Specify ethernet PHY
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
	TAGGED_FROM(0.00)[bounces-33000-lists,linux-renesas-soc=lfdr.de];
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
X-Rspamd-Queue-Id: C71A65B5495
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

