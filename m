Return-Path: <linux-renesas-soc+bounces-29328-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YONpB0rbs2mzbgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29328-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 10:39:22 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9F6280A1F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 10:39:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 36CDE3006927
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 09:39:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE64D36AB5C;
	Fri, 13 Mar 2026 09:39:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837DA328B5E
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Mar 2026 09:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773394754; cv=none; b=RHoA6yPunL1dwwCCPSWYpbgAB14aS5QCT4/NH4jMn8jvKioOyeotz+X8C4hDJk0GVqu7I0ubZJWhUYXZ4UK4mLA4VHzT0wNDE9yMUADma+2k3Ds0W2EBlvo0rgG9sWObvSKp9w3esS2ZsE4un1zE9UawVCX4Sgzy9LaMyn7l304=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773394754; c=relaxed/simple;
	bh=PL67avBPtYMTmKLtVbuj476ob0Oj2q3BQ12b2+YW3gA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P495nb/itrnMgUNuP2rTEc1OPdMO1BtjKRqQqkmWOE16pTiggvu9x8dYxAH5vOXZ03rx5bIFBsBIvSODN/l8D4NO7W9T9ubpJscWSjDA879rrUtzmfAIOo+6iNBUL1XwMwqr8W2Dkl0Qx1qiwLStiYmt8WCdRl6cIjlsvp0YKGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-56a9076813bso804948e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Mar 2026 02:39:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773394752; x=1773999552;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/kFDLymno3ShHwPEKQQsYPw63HdXuC5g9oISBtZGhCk=;
        b=sNMCTSWtqPM6kkL03DnpCDCiAHtrA68nme2xwuR9PulnHwJ7D2ycoiknxGy0rQrSZB
         87nmqmf2A95eVJfjklyJLWHJqdduCfrrFIrQPrzUEuEIpEG3itCAnTbGEtdlum/7J1/Q
         Zh2rJKk1BOR1bUei1GDOPkLh/O+6f1n0qCgnWSp5zY66khotXDBj0qS7U7wpRWL/TZkb
         /QUDjuP2qbWK3XYqxnYVeDMbi8IELGqiLWR816bn458Cdi73eY2RkVj4VF4JjwuxHqYo
         sCqM8iiWebrVBirZjvLQJhvHbKQM1V3j7wtezy8TH36pwN1n5OpH//Bb1jMA1YX52ove
         446A==
X-Forwarded-Encrypted: i=1; AJvYcCUO+k5knQq2gWwIjMLm/DERxagqF96OC0ONk9fU9X8yCfUd+FFp6hqm4PkdVJVtuKT0mYOSZTVNGsJJVfcYgBzUSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3+QxrpUy0tTT/BLihcmQRnmAzzpGncVFZZBGXOfBOK07qasPC
	W15QeDVimF4IqiuMVITxiiSfspqvbcm2Q9Z7r14469MK1dBmIut6NRHuwgUYuO9FEiY=
X-Gm-Gg: ATEYQzynvbMRn5gONFdkSIkUsl4GlPzJb1dJsUQ5vvjRdfym6V7OMGr2sRdfsH9GSHu
	eDvPvcACF3noNDTYCohDe8OfOhZda3f5WviwqvOXQl3Qp5FsF9NGq7Um+5skaYAiplqvtsMoJnB
	RT0JWoWl5LJQyNRTvs+E3yYtd1g9tdzc2mVoqQZ7WJvJxDRZcUTGTDdqiecwW6QvywSWRFD2G0W
	gkp6u7uZmwGU2ImKhxxRB5vgRYELMtfUwPOc31hmbzQtgbZhK3kQk3lMIWTsdcZtIn+rKdu2kg/
	nKCr5DaLS0K216rQNYotrpp98/TsxxLyeTwTaFRZOQ3Yd/sR/0KkFzloDZxON9GlyeJb7eAG7Qm
	MWkT8JYScYFu0Z6kQMLHIpPwnEockrpTOLk0Qvc4HNv4zkPvQEvnS6gXeJkVggrA/KrdBdHxzMB
	/tSjbvWr0eSQQZrjtlgAyo76HQGcVEsvGBkMfPceKAC7cF83D0qRAT/UH7N/v1L42/CkfNxEc=
X-Received: by 2002:a05:6122:46a5:b0:566:357b:ef25 with SMTP id 71dfb90a1353d-56b6295b4f7mr828035e0c.15.1773394752514;
        Fri, 13 Mar 2026 02:39:12 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56b464a4235sm3648446e0c.16.2026.03.13.02.39.11
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 02:39:12 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-94dda16ff9fso506457241.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Mar 2026 02:39:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWQbX/0EBmhyMZ/IMcppJQjHGimJ8zXfU7K4HEfw6J2d/Pmq4MWTDKNp9IHJR8MzKJn1SH9C/IY1FlV0VQcQR99ow==@vger.kernel.org
X-Received: by 2002:a05:6102:26d1:b0:5ff:cee8:6620 with SMTP id
 ada2fe7eead31-6020e20d4afmr1001751137.11.1773394751766; Fri, 13 Mar 2026
 02:39:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260212073819.41304-1-phucduc.bui@gmail.com> <20260224074532.60046-1-phucduc.bui@gmail.com>
In-Reply-To: <20260224074532.60046-1-phucduc.bui@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Mar 2026 10:39:00 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXhDfFUnfOATQEWKY-kYxyR3QgmLoD8QFXGbsuLL8SzsA@mail.gmail.com>
X-Gm-Features: AaiRm52TLe172c21oV-Mw-rROyewWRa5GPG-BaaZAy05NtJZt9zNHx8--4wUlis
Message-ID: <CAMuHMdXhDfFUnfOATQEWKY-kYxyR3QgmLoD8QFXGbsuLL8SzsA@mail.gmail.com>
Subject: Re: [PATCH v2] arm: dts: renesas: r8a7740-armadillo800eva: Enable SDHI1
To: phucduc.bui@gmail.com
Cc: magnus.damm@gmail.com, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	krzk+dt@kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-29328-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid,linux-m68k.org:email]
X-Rspamd-Queue-Id: 1F9F6280A1F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 24 Feb 2026 at 08:45, <phucduc.bui@gmail.com> wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
>
> The Armadillo-800EVA board provides an SD card slot and an AWL13 SDIO
> interface connected to the SDHI1 controller. Routing between these two
> interfaces is controlled by a mechanical DIP switch and a set of
> multiplexers.
>
> This patch adds:
>
>   - A fixed 3.3V regulator for SDHI1 power, controlled by PORT16 (G2).
>   - SDHI1 pinmux groups for data, control, and card detection.
>   - A gpio-hog for PORT6 (J5) to control the SDHI1/AWLAN multiplexer.
>
> PORT176 (N21) is already configured as output-high in this DTS (via
> lcd0-mux-hog), routing the SDSLOT2_ENABLE signal to PORT6. Since the
> hardware includes an external 10k pull-up resistor (R94) on this line,
> PORT6 is configured as an input to allow the physical DIP switch to
> determine the routing without SoC interference.
>
> Both configurations have been verified:
>
>   - SD card (CON8): detected as mmcblk1, high-speed SDHC.
>   - SDIO (CON14): detected as mmc1, high-speed SDIO.
>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1.

> Note: While a specific driver for the AWL13 SDIO module may not be
> present in the current mainline kernel, the SDHI1 host successfully
> detects it as a high-speed SDIO device, confirming the hardware
> description is correct.

With SW1.5 OFF, the AWL13 SDIO module is detected as a high-speed SDIO device.
With SW1.5 ON, SD slot 2 works with SD cards (incl. card detect).

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

