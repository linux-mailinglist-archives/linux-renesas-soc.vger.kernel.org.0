Return-Path: <linux-renesas-soc+bounces-32997-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOP6H09fEGobWwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32997-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 15:51:11 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE475B586F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 15:51:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BB2EF30B2FA3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 13:24:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61ADC3B0ACD;
	Fri, 22 May 2026 13:22:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915D73BB69A
	for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 13:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456133; cv=none; b=I7CNjxFCGc2G3W2M6hQapSDIuUujRMh99vsAGw3SICKvx/wWKSKykCCzj704R7RyNKXsR1mqKsrjYVtGUYaXXjptVXEdy6q+CtY0S1ereVjBdnTRyZU/Kem++sQGJtatZqEGmd0nbwlH8ALsrHHlto/IjEq3tjr5jyiPzYvyPj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456133; c=relaxed/simple;
	bh=0PK4bMqXimU9iNRWNX/eX952I3s/oyh75Caj0sz7gdk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sdNU6Lv1uxT+rh+n3Hj0DMAXKKLOgdd6JHWw3IY6IDGW1gYQrF+yTY3CF8ApCGWPphvLPdez7I4tiZEKh3r+LoLLjafFJhYJvJ/ZdrpBgvywPA4kuONysr18N5QzmJADiHlR0XZntAveJyqCflitVr+5etjuCRH5WXjjbM3n0qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-bd2e8931915so1586052766b.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 06:22:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456130; x=1780060930;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b8+hN45m6EcBjSVmc7/E001s4aXOZE0CXpfrpaEBAfw=;
        b=KOahULzLTdcnoQV7czoYw+/mdxtmwshRFNL5xwIR/dihIhPPsQNclvrt/X2EW7LU2c
         gLYkhMPFlhl3W64hRPX2YOyiahRdrKQCukMphWD2o7p7mIrbtJ/7yrHc0UBOqU1bWuuO
         45WQLTCI/e0D2+FNM9jv/1/2XUVqYYtCiSRt5dYTUXSw9Y0mDugvOvzTgH3VppjD2vR8
         /usJseaCeAOXJz8DLnKeDhezYGngPcc3cKWEBUeQo4Ncjzqj4PBgfPjDo6D6kiyR4QAc
         OrefaBLjrZWvloLVc0h7kdRDyIxrIPWLa3paRq/qj+gpKBhqTn2oYW4BbzlJ0fIl8i9D
         Gvkw==
X-Forwarded-Encrypted: i=1; AFNElJ9LjHYYbvRiDzKtaRPyDP//0CMtyy/q6q2UsCi1gTa8jRSJI35wZ3tkMj1qCUHlVIc1+FFLwsZwSr3XAVRaxz7Stg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv0nWEqMICMN8fH1Yk54Cvg6nYEdkjhh5I2NkUEbJtQnEw5RQE
	NTSS46mjebCNq2GjSEJ8SnHxB8GcaUm39CU9ShfBnkUM6el3sXQfdKinr1sIazVZDoc=
X-Gm-Gg: Acq92OH40GIZfAtMkagcC/FTUC4XKlutvtjLX3lW0DnQvPPSMDViIoxJjBfALq5PJ6T
	+B6j48soho4yKKLNTI0aYb9VKVdTJmv5nigMJ4xnUsd/TCrXyKtJHOtd3WclLOeMFmN3YQ0a2Sx
	BK+0/ZDtru49Pkk3C1Vt6I9oHdCL2S2QK4kgNmpvj2l6Cg6wqG8+Q0sLAC0wD9Myk2d+usZX+Nn
	sUX8+E3dGkGGIwfuaDfhMdgYauJpnOXamtmqy7mIJULB8tdwN2dQ2kg0VuE7tPROhYzdugB0Ibz
	jMTajfr3Yipa+U33fh4XhqO0CMB3aHkwsn/F70HLXOmdXb6+o8P54DA7xRUVE7pcEOgwyN0zG7d
	IDywsrpfA/XQ675BcSnXkKC5GnHjxlFfUlM6QeXZtuFwAb6bD6VEnzQapW8upAP11JJ1e1lw/l9
	dlxqKA5UJm1euj24BQOZ+5HeYW+9j3Ngxxzaosco3O7x+oPR4hAfGc43NsgWtU
X-Received: by 2002:a17:907:970e:b0:bd8:f7f0:d740 with SMTP id a640c23a62f3a-bdbfcbcc4efmr440626366b.0.1779456129353;
        Fri, 22 May 2026 06:22:09 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688b9f50364sm696539a12.8.2026.05.22.06.22.06
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:22:08 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6870ad8072eso2772285a12.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 May 2026 06:22:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9dNVggOMKgNJOQDcicAk4/fr8YXRggwQzn4CS7+TPe9IxqIiByy4Oek86wUt8h+cJ5EZ1fUdSywpr54PktsUYNcw==@vger.kernel.org
X-Received: by 2002:a05:6402:510e:b0:682:c363:d96f with SMTP id
 4fb4d7f45d1cf-6889c44e129mr1665620a12.10.1779456126723; Fri, 22 May 2026
 06:22:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org> <20260505034325.167797-6-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260505034325.167797-6-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:21:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUQMHxkEU4DTN76CgBX1Y2Q-fpGqa5M2s8rTuw_QNx1+Q@mail.gmail.com>
X-Gm-Features: AVHnY4JaUyiF83u7ZZ_15Eo8SUYauLgYscK3wdborUbq63bx7aDzqid-QKvlQG4
Message-ID: <CAMuHMdUQMHxkEU4DTN76CgBX1Y2Q-fpGqa5M2s8rTuw_QNx1+Q@mail.gmail.com>
Subject: Re: [PATCH 05/11] arm64: dts: renesas: condor-common: Specify
 ethernet PHY reset timings
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
	TAGGED_FROM(0.00)[bounces-32997-lists,linux-renesas-soc=lfdr.de];
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
X-Rspamd-Queue-Id: ECE475B586F
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

