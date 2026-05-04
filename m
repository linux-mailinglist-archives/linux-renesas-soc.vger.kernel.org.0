Return-Path: <linux-renesas-soc+bounces-31931-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MR5CH9g+GnKtgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31931-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 04 May 2026 11:01:51 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 964B64BAB48
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 04 May 2026 11:01:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 15B77304B272
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 May 2026 08:57:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52509335067;
	Mon,  4 May 2026 08:57:04 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE691318B9D
	for <linux-renesas-soc@vger.kernel.org>; Mon,  4 May 2026 08:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777885024; cv=none; b=QPLPgjctz5cfxeZ0UZ27nn43zpDDi9egKf3mW52WvdHJmIcyDp3YPST6jcjKfBydIIRdV74F+IRWIgCvrwkSounE5KwrLJ9caLl+8uilsiLmsQgdQU4ge6sm6R9J4LD4VpI64koktnkIf6vIPGUWWnKhLwXPZoMNYz3+KF5i8jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777885024; c=relaxed/simple;
	bh=4b1Z9TVnKdKjkQ91UetoQAPM+PvtTG+uUazxkJyn0fU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qjXgPhKAjfcnDfGuU8+fHNfvExt0eUA/47Fe4nOgf7d6OEOlifOIKDCh7UmRgOa551LhTdWuNfgSRfNxKVTfY365PSL4mSexUC855eNp3FncXW6wFAqOctqxq6EmJYyD8CmKTSExKtPYI7PfbXz+GShyoEqcmC7tT2OdGXzQ/A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-944168e8c5fso2335815241.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 May 2026 01:57:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777885022; x=1778489822;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f5mGt0mKWKt7BharKNX9fTxCtQWRZYlGFfS86SF9TeM=;
        b=fVROH19PSdKzOC2c+udWcon1MOM7otExfahCOrwAWTqtNhxByU24Draxq3oUdvc0Wq
         KUEI7mkxQ7b2KlvcVyjJFq/SAaSJCRXW3XGYDOWF9SNBapYzhBRMB8D7GJdFso5MAH+S
         jtcpXdmbihZ6jocKmT3lGAr3klCmAJy0a6NtGmpP6KHYEvczEHD6AaSeF26az6h+tTBL
         CkHRDnvJk4cMiCTf0+MxzILFHEPtxvApcj+JbQtMRLXCGnQcVbXuFHQf//pykJZHgDfl
         YZqqrgL7PykRycsgC+WBrBUHiuM4msScGYl77AxXTnFNX+qLqLDfxR2X5WlQJ6QyMhI8
         G06w==
X-Forwarded-Encrypted: i=1; AFNElJ8ICo9vWiXxA6yTxbySsVQH5+vKv7ikUcQnWv49jpjSKr1eyc1bOpaVREzYVolR3EqirHp4ffpVbm/ZbF0FbXlkbA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPcHi+q8UYJJcV1qli/c9dtTS+goUUksAU+nbbKhJuGHEwVIBG
	7YcphQzINWppeLAkNi/sXLIMG2nhXUfpsOd6JkEUL+ghJeZlSYRP9jUSu6zOnQXe
X-Gm-Gg: AeBDievVkZMtOFN+YjvkGprWZz5YXzv+KoUuyyqxDCSg04zqRz/Pr56XUOle3DQaJeg
	60WIdOZ8PIAaLJFZHjKjAXaG15h7UpqmmkZJl+YPVzwhdizKM6NFEz6oWA/I0lrs7uE61YKoRZZ
	e1YGUupOHamPTs2c3UrbxwELNNUoAHQ8tv84DgNg09YAVWc1yaZUoQlwD3QNc5U4Zeyn4FAcC9x
	VDIy9PlsXSrXZ0ELBS7PGO37plVpThaQQCvDkY9huJ3M4y2eb4l6ZIVAu8sdy1C2JRdw1Si2Ylq
	+qJX+mWrIc/a+NRhyAdWarl5A8IblIlIPOhl3+M9HaMM9/KXFx5U64tyFEu4KlejwfBx/ZXJc/V
	4wQFcl8g43O3PBFrvEmO8ap13DH/qfcMZ1qcMFHnpO+/t8nEMNAJ3r8izDXfsxVXPESbekIkglD
	RN4g1PUsGmNZb0fqj7Cy8uwh34Wqvxlxo8uCwxy+KaWUPHK/Ry8HiJcACqADGnaDfguoBpv0I=
X-Received: by 2002:a05:6102:50a5:b0:62f:3abe:907f with SMTP id ada2fe7eead31-62f3abe982fmr942847137.4.1777885021821;
        Mon, 04 May 2026 01:57:01 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-62bfb14f1b5sm5096562137.3.2026.05.04.01.57.01
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 01:57:01 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-62e67d2837cso916988137.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 May 2026 01:57:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+ANSekj3bWfKJ9YbBlG6bY0/6nhKp3rEh8gPKUtAcewba6ZNpLownxQ+vAN4VqELPdL+bgJb1Ddv1cW5bqDCxJVw==@vger.kernel.org
X-Received: by 2002:a05:6102:50a5:b0:62f:3abe:907f with SMTP id
 ada2fe7eead31-62f3abe982fmr942838137.4.1777885021372; Mon, 04 May 2026
 01:57:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260502-raa215300-clkout-v1-0-fd1c2a240963@solid-run.com> <20260502-raa215300-clkout-v1-1-fd1c2a240963@solid-run.com>
In-Reply-To: <20260502-raa215300-clkout-v1-1-fd1c2a240963@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 4 May 2026 10:56:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV_mDhAVTH4bUzbHQAAhp-TdApp223PB-3Rrer+gs_3+A@mail.gmail.com>
X-Gm-Features: AVHnY4IB14dciSQLYR6ve-hV1cawj2RAYgs2Laamwu_g76ZIh5HxQK0TWj__-U4
Message-ID: <CAMuHMdV_mDhAVTH4bUzbHQAAhp-TdApp223PB-3Rrer+gs_3+A@mail.gmail.com>
Subject: Re: [PATCH RFC 1/2] regulator: dt-bindings: raa215300: add clock output
To: Josua Mayer <josua@solid-run.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Jon Nettleton <jon@solid-run.com>, 
	Mikhail Anikin <mikhail.anikin@solid-run.com>, Yazan Shhady <yazan.shhady@solid-run.com>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 964B64BAB48
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,glider.be,bp.renesas.com,solid-run.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-31931-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.984];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,linux-m68k.org:email,solid-run.com:email]

Hi Josua,

On Sat, 2 May 2026 at 18:07, Josua Mayer <josua@solid-run.com> wrote:
> Renesas RAA215300 can generate a 32kHz clock on MPIO2 pin.
>
> MPIO2 is a multi-function pin, with clkout being one of the functions
> and exclusively available on this pin.
>
> It supports prepare, unprepare and set rate (32k divide by powers of 2).
>
> Add clock-cells and clock-output-names properties so that other dt nodes
> can consume this clock.
>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/regulator/renesas,raa215300.yaml
> +++ b/Documentation/devicetree/bindings/regulator/renesas,raa215300.yaml
> @@ -40,6 +40,12 @@ properties:
>    interrupts:
>      maxItems: 1
>
> +  "#clock-cells":
> +    const: 0
> +
> +  clock-output-names:
> +    maxItems: 1

Please no more new clock-output-names.

> +
>    clocks:
>      description: |
>        The clocks are optional. The RTC is disabled, if no clocks are
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

