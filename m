Return-Path: <linux-renesas-soc+bounces-33588-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EuSaB851IWpHGwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33588-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Jun 2026 14:55:42 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 92469640189
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Jun 2026 14:55:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33588-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33588-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0C6C73116356
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Jun 2026 12:49:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D57AE47AF75;
	Thu,  4 Jun 2026 12:49:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7E74657D8
	for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Jun 2026 12:49:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780577370; cv=none; b=jmN8WYmtKHU8ch7TJ5RAzW6iFOvMSANfWsoqQCTOrYVFLP6geZ8yogE1nDd7r234BHFuvXOpVSacNfrpXGwVDAi0peG4J/bkd/4n+gTKdhDpF/qABSWl923QRFp8pvUVmvroXKqaY5qYbjEzChxh2Kl4HXvHHOQykuZWzWJaZKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780577370; c=relaxed/simple;
	bh=/us1vr8a5z11BxNxG8w0EOK4mYuoD8wxJHeVXKELP2Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tWbzpoJMlrSYnCjqQyX4TArfXWnVaVLZ6Tfd+Sol/Uwjqf6mDGr41Z6OB/BbjvLDigUZnS3beliCzPj1+0HTmolb+lZODVsZoKFQ1zmA7OqJ7tzeiYuCDbDH3THDXsbJln1/mFuEzuCoQHYWh+5cKr7zSleE87tB8K7ad5rKwWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-59f8a140a51so412011e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Jun 2026 05:49:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780577368; x=1781182168;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jXcg6gYzrpbGrQNaU5i/n/QDTFmGYgHfcoYdrRVlWKk=;
        b=MiZhmE1bRtv/E1ysNtjQqm0oFm7Hl25BrgNhpZ3+z7OPurBY4jP2MO/xoOCVkBTtOq
         qOrScB8u53sMBkd3PnQu7agzWCdY76dk9al+riwfCsmYqEdxCHcE+DLzTGpr+KkMPhT6
         InBhDRVhw4I8mAkC9zAGzt0ywABDE+MLj2EuQF/fBGhtFWPASMaAtd/wAZHJgS/gZaQ4
         NkdjIUEyAGw0gbuFwE+aVKN7Yhi0xwD8TcoD3uNiRCqGfYJ1zNKjeq6IscfbmosMvx3P
         ISzNNM/sb2dlv7WBuDwJAZiBZ57FLGt7BGR+cJoQBV4M3414mLDxzk4cyLXmJ2OD65/K
         ++rQ==
X-Forwarded-Encrypted: i=1; AFNElJ8v4rvwthFiPMLxFJqw0Ukr7UcmM/yz+Qgb6OzH0AqzPgZgTsesKI4ob2OSjSzkc9p4B8fkDeNX1q+EtIRZipoD3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwByRFWYZVZimmqxsufb2rhYhhYINFTn5h0SauDFOeexin67Shw
	27ct1u1o0jkW6f/TCaeiN3hIdbd+rz5bKL607jNRVYxQHq5XZIkxizWmSHuEl6/7fFM=
X-Gm-Gg: Acq92OGBRGfA//M2Hiqu7ZAY9G2Yz78dsNcweIo3t/KUvuwtMlJATKgNCN1ZUdswp3Q
	Xx/RoA19fxXs+N1cKW35on4Y2B7PjIDqwZHIPHR3gqKrORB8UnDDwMUHQRh97nPVmWJVgIiwNIt
	ogfBOOJT6Zl65n8d5r74KrOY69ZpmU7NbQw+cM6QXZjK4uZtBbJQb7rOGeYhDji0MTtXdaXzoQq
	G0c6RAYW1qPCMLSFNvt9lSvbEJyput43ELFcHSBKgtaakQwPRQ6KjC28DM3RAFh3D+9WyJl0wiN
	3141z2GDMonpb8uoinRq6AkiBF1/YsR/0+3j23+rgIpXdvsg8q7yRGq9HOrhm3O0XpskYRmzajZ
	0DbQIzEsYVHSFjtaf/sWq5HXI/L/GR1gEQZv6kQY6zLRuz3AM1rfVY/wjFDUAtLb3hfjvQBgF6p
	oSzQAXLA9zluVREJ9SuAKlVGeC+oiQ1Be6o+P81En5Z+Os2fooxua3+tPcGEUmYUOuGueza7c=
X-Received: by 2002:a05:6122:3a08:b0:56a:ef51:4cae with SMTP id 71dfb90a1353d-5a6e4e2e6d5mr4771180e0c.4.1780577368486;
        Thu, 04 Jun 2026 05:49:28 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5a6d6413983sm4881071e0c.1.2026.06.04.05.49.26
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 05:49:27 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-96392241154so515870241.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Jun 2026 05:49:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8qFGpIa81mtaVkLzOGUwyrwalARV6faX/0DeQb8WEy1woeyLTPn9LELmsVoxegHHdf9SbwNkaKLhFFXrpSExlXpQ==@vger.kernel.org
X-Received: by 2002:a05:6102:c06:b0:650:967f:fb32 with SMTP id
 ada2fe7eead31-6ec2978d496mr5106431137.3.1780577366377; Thu, 04 Jun 2026
 05:49:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260525110603.4018170-1-john.madieu.xa@bp.renesas.com> <20260525110603.4018170-9-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260525110603.4018170-9-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 4 Jun 2026 14:49:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW0-pf_jcKTfLCDrwj_ezqrLyO169Pp_cQFzipHnG0oqg@mail.gmail.com>
X-Gm-Features: AVVi8CcDFx5qXSuegazwE2easrqw_MlaWBK-wBRkmOsQBF_Kpu53lNXiO8RHuTA
Message-ID: <CAMuHMdW0-pf_jcKTfLCDrwj_ezqrLyO169Pp_cQFzipHnG0oqg@mail.gmail.com>
Subject: Re: [PATCH v4 8/8] arm64: dts: renesas: r9a09g047e57-smarc: add
 DA7212 audio codec support
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	bmasney@redhat.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, john.madieu@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33588-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:john.madieu.xa@bp.renesas.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:bmasney@redhat.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:john.madieu@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:johnmadieu@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,gmail.com,redhat.com,bp.renesas.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,vger.kernel.org:from_smtp,linux-m68k.org:from_mime,linux-m68k.org:email,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,glider.be:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 92469640189

On Mon, 25 May 2026 at 13:07, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> RZ/G3E SMARC board has a DA7212 audio codec connected via I2C1 for
> sound input/output using SSI3/SSI4 where:
>
>  - The codec receives its master clock from the Versa3 clock
>    generator present on the SoM
>  - SSI4 shares clock pins with SSI3 to provide a separate data
>    line for full-duplex audio capture.
>
> Enable audio support on RZ/G3E SMARC2 EVK boards with a DA7212 audio codec.
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

